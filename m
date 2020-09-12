Return-Path: <SRS0=bsXk=CV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FFFC433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2020 06:00:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0EE207EA
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2020 06:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yrN6Yrzf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tB7yoDOW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0EE207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xMKWT7kd39oip52AhoKAQ2mqaox7FL7oZ7n0dN+NKlE=; b=yrN6YrzfOraqpNf6amPwohirzZ
	YB7ybbtM30cLHQh1ZdHhCytFVtWdY73SkWtARXTSChV86YHBFf1pRFVB4a56ThlueNE02b3ZeVc+X
	Oo4edzvzvhbFiWEQ0DdwAwdETHsHbo6nSjpVYi+yS3YcbVLfWBZZZDkgd2R6R7TKz1gLGTiBm/iGX
	8rQBXLZJTW+ZM8j4TEtkUowizm2Xpdl5ZEq+Vq8acVov4RO7QOSd6ApmvrjVZpmnMrHvt9OhCyqxj
	c6NtHPle1aD7VIsLPOK136iEWv6pu0oMD2TuQk+I9+2O1htuKWlwkUn61aZeXSZP2zjO6AgeXMxIp
	rR6kGstA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGyZv-0005fH-NG; Sat, 12 Sep 2020 06:00:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGyZp-0005dn-Iu; Sat, 12 Sep 2020 06:00:00 +0000
X-UUID: 134fe8a33f274c1fa8f491f85d2bddcd-20200911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=i9ffQliwWH6EmfVZu18WwAkTORgoZOjNhfKuRo1pCM0=; 
 b=tB7yoDOWxPj3fjDSStcDiZ7Aj+hoy0lXlsZZHpMEuMeL/4tE2j14anyrae/f5qK9ITMl+mAi6F6hRg9obxIp9327UjXHuL8yytQ3euK0mGv7DWafqY3dXnX/K+eLc087j9YqBQDweuvWrFsdDo/3SbMtMxleZS2CUnf6RnBx40c=;
X-UUID: 134fe8a33f274c1fa8f491f85d2bddcd-20200911
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 993851183; Fri, 11 Sep 2020 21:59:44 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Sep 2020 22:59:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Sep 2020 13:59:26 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Sep 2020 13:59:25 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH] i2c: mediatek: Fix generic definitions for bus frequencies
Date: Sat, 12 Sep 2020 13:57:26 +0800
Message-ID: <1599890246-21191-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_015957_751970_D5A5633F 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qii Wang <qii.wang@mediatek.com>

The master code needs to being sent when the speed is more than
I2C_MAX_FAST_MODE_PLUS_FREQ instead of
I2C_MAX_HIGH_SPEED_MODE_FREQ. Fix it.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index efc1404..0cbdfbe 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -681,8 +681,8 @@ static int mtk_i2c_calculate_speed(struct mtk_i2c *i2c, unsigned int clk_src,
 	unsigned int cnt_mul;
 	int ret = -EINVAL;
 
-	if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
-		target_speed = I2C_MAX_FAST_MODE_PLUS_FREQ;
+	if (target_speed > I2C_MAX_HIGH_SPEED_MODE_FREQ)
+		target_speed = I2C_MAX_HIGH_SPEED_MODE_FREQ;
 
 	max_step_cnt = mtk_i2c_max_step_cnt(target_speed);
 	base_step_cnt = max_step_cnt;
@@ -759,7 +759,7 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
 		clk_src = parent_clk / clk_div;
 
-		if (target_speed > I2C_MAX_FAST_MODE_FREQ) {
+		if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 			/* Set master code speed register */
 			ret = mtk_i2c_calculate_speed(i2c, clk_src,
 						      I2C_MAX_FAST_MODE_FREQ,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
