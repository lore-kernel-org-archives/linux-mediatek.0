Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5290CC34031
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 05:55:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CAA32067D
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 05:55:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lswKFCI4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PK39BrML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CAA32067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aj0KDmsXFF0B2gzsp55AxZOdy827OyufqXLvOsSWXzM=; b=lswKFCI4sfLxYK
	f+XyFqe5jxcOu0PysCDHD2b8VIaiQHVRm/z1HaXrZJ5RhjZKFlQ2XP85R303e8WMMkYSDhAKtnE8p
	G2VfbMGN+l0LIrdjnrZFVeNfpiLNwPtJgR4SoFZvX8Lq4SBiA+jHkbSnbK9UfR78sRqZIF1LpYlIq
	UoT4vJNM8ILxG+k8SzvJsHu2ajnPqqr3QZBKDD56CQMpHOw95aJW8nAX8wHsMCL9gwXUoT+yl6yIN
	Cv21mpCTa9tMkSyCs39Of7vzGp8RJH3HYsNB6ZRs7sYLwbLigswAxRGdj+3QEOfU740JTpP0NbNtf
	ABJ/rTP8PlFgAIyyT9UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3vqa-0001Wt-NK; Tue, 18 Feb 2020 05:55:04 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3vqY-0000y9-2b
 for linux-mediatek@lists.infradead.org; Tue, 18 Feb 2020 05:55:03 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01I5qpDZ105153;
 Tue, 18 Feb 2020 05:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=IUr6jZsezb+fPkgPfiPdUUYiWsKMcfm6EbBIGof+6oA=;
 b=PK39BrMLc6gyWoGe93OJAJ5/c7rEItWyQbLmye6KgruMmJzCHHizXRiG+q9gIweRk1Yd
 IBDpuAyDcOP0sai4qz6CY4GEXf1Xyrf6376tM89FQBEWiOF0GemdAwR4DbXOBt6Sg9rM
 cH+GFfKdJS1CZxJ7ttZQqgrs0YrSOqVvpHTzqyetabGvYT0ZtP6mfLWNh0MRybpEni5J
 YWvd2b+G3HQ7tRI1bp7J9Hf7VQJkaVYVQOJtdpascU+phVDNZkH3CYaTNE0qI49WO53D
 C4a3/+P9VmD6OD+AuAefjk7oC8ejTUSEz6z7CNKLDBUtE3z45XKhYmoy7uzz8oYAocY+ LA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2y7aq5pegg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 05:54:58 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01I5qj0F168146;
 Tue, 18 Feb 2020 05:52:57 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2y82c0sry3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Feb 2020 05:52:57 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01I5qumb020042;
 Tue, 18 Feb 2020 05:52:56 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Feb 2020 21:52:55 -0800
Date: Tue, 18 Feb 2020 08:52:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sean Wang <sean.wang@kernel.org>, Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: Fix some off by one bugs
Message-ID: <20200218055247.74s2xa7veqx2do34@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9534
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=978
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002180047
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9534
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002180047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_215502_164962_B467DC75 
X-CRM114-Status: GOOD (  12.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These comparisons should be >= instead of > to prevent accessing one
element beyond the end of the hw->soc->pins[] array.

Fixes: 3de7deefce69 ("pinctrl: mediatek: Check gpio pin number and use binary search in mtk_hw_pin_field_lookup()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 83bf29c7ce7e..53f8a14fe542 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -544,7 +544,7 @@ static int mtk_hw_get_value_wrap(struct mtk_pinctrl *hw, unsigned int gpio, int
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -583,7 +583,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1;
 	const struct mtk_pin_desc *desc;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -766,7 +766,7 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -784,7 +784,7 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	const struct mtk_pin_desc *desc;
 	int value, err;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -801,7 +801,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 	const struct mtk_pin_desc *desc;
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return;
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio];
@@ -813,7 +813,7 @@ static int mtk_gpio_direction_input(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	return pinctrl_gpio_direction_input(chip->base + gpio);
@@ -824,7 +824,7 @@ static int mtk_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
 {
 	struct mtk_pinctrl *hw = gpiochip_get_data(chip);
 
-	if (gpio > hw->soc->npins)
+	if (gpio >= hw->soc->npins)
 		return -EINVAL;
 
 	mtk_gpio_set(chip, gpio, value);
-- 
2.11.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
