Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772CEC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 14:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D2C206DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 14:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p5zjbqii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D2C206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NaCI61jyUW1uemad0ov4DDwenrpt7FkLV1gF8sPFI6A=; b=p5zjbqiiIL9FO6
	nxDNEWwlQvEYlKwH2AOQkltO7zcQEaMpeafMy/3VhzILWoXHx1q4FcrWVgeQvo0JQImsh8XbdqyEt
	sE9iKu8VBvQKUcvSPeK1wDku6WyQfaQEiBA94eWrMgdylkB5jfX7vhF7ejfej9uxBAzRwkluQSdP1
	6FzfIDpr4faGUSVRGBdnfNcw5x7U4ocPWfGVUv5ld/4DLoG7PLq0yHFdTwwn5gMRl52kX6jvS6JtN
	vKf4/Z8woogvec3h29g1AgzdpH1U2lZOzry75TWxhiY0xVDP/BNKihp9hz/+9Aip6nQAXRDoz74T2
	2rzUP0GobG0SjoKeKjIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWL6T-0003YF-Sd; Wed, 06 May 2020 14:32:53 +0000
Received: from cmccmta1.chinamobile.com ([221.176.66.79])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWL64-00010b-FD
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 14:32:51 +0000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee15eb2c9d0770-27990;
 Wed, 06 May 2020 22:29:36 +0800 (CST)
X-RM-TRANSID: 2ee15eb2c9d0770-27990
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.0.146.193])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65eb2c9cc322-73c3f;
 Wed, 06 May 2020 22:29:36 +0800 (CST)
X-RM-TRANSID: 2ee65eb2c9cc322-73c3f
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 matthias.bgg@gmail.com
Subject: [PATCH] ASoC: mediatek: Fix error handling
Date: Wed,  6 May 2020 22:30:09 +0800
Message-Id: <20200506143009.13368-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_073248_767083_B106096F 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
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
Cc: alsa-devel@alsa-project.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If the function platform_get_irq() failed, the negative value
returned will not be detected here. So fix error handling in
mt6797_afe_pcm_dev_probe(). And when get irq failed, the function
platform_get_irq() logs an error message, so remove redundant
message here.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index 378bfc16e..a621dcf91 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -807,10 +807,9 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (!irq_id) {
-		dev_err(dev, "%pOFn no irq found\n", dev->of_node);
-		return -ENXIO;
-	}
+	if (irq_id < 0)
+		return irq_id;
+
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret) {
-- 
2.20.1.windows.1




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
