Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA6CC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:37:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C16F20870
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dUXjwFHG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y3A/DejB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C16F20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DvGGmuSsZ9ysHwub/FjMxBwpfKnNetopJbCh8G4pJ6Q=; b=dUXjwFHGJKuB1f+41+OBQVsy7
	oLYMmZDPTaNMxVmh3apFJRt7TZTVYciqbEf1fd0QjITOjVYNijyCdozoQbT7Oy3elbMtaJfL70sKS
	6Eq9zMTnV7eFvnqjEWBH3ooNpbiyJlTJRHwkoC1Hxs5wulmhDKxm5Gl4p5Bfq46ZF93kwhDOrAFMB
	LXvxBl/12B0LEE2rKj5CN0ql2P2vI4DTr27lHjX+SiXtrghwM5EyL2q8SXwBAvFDXdkhfpUq7jQ/M
	s/2P+StCuFoEqZidzzQKXcmBJgKbPRoo1PUJw+IXxM37LTnuY8y85gvqyKCDTg/wipKFfBEQoYZR0
	/qxwlVkTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jryHU-0005lg-CX; Sun, 05 Jul 2020 06:37:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jryHM-0005hm-Jj; Sun, 05 Jul 2020 06:37:33 +0000
X-UUID: ba461d69586a4aff91252057c018dec5-20200704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=J4IDLpeer4Fj06y4dRqObtm+xonToNceG9cdau6T5vY=; 
 b=Y3A/DejBw2uSzE9GllN1r64l+0l3dOXnqD8KluKSvld+xH2yyMZ3kwPdcCH9Ggk4jGiou1ZE4+xwEX8P3h4HxYAsFILW4ZmF3Rtp0rByEyWkh2G6gl2xWcyunIJr1asZ/hSInaMJ2Wd+2PGDNlQMUDHRXTPgha1J10SGTOo1HlM=;
X-UUID: ba461d69586a4aff91252057c018dec5-20200704
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1673067637; Sat, 04 Jul 2020 22:37:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Jul 2020 23:37:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 14:37:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 5 Jul 2020 14:37:17 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 3/4] mailbox: cmdq: support mt6779 gce platform definition
Date: Sun, 5 Jul 2020 14:37:15 +0800
Message-ID: <1593931037-24405-4-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593931037-24405-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1593931037-24405-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4C4972016B373AAADE769840E63A2ADC60DCA1685461B0E36D037F3E5D4640B42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_023732_839997_99FC9995 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add gce v4 hardware support with different thread number and shift.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 49d9264145aa..08bd4f1eb469 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -564,10 +564,12 @@ static int cmdq_probe(struct platform_device *pdev)
 
 static const struct gce_plat gce_plat_v2 = {.thread_nr = 16};
 static const struct gce_plat gce_plat_v3 = {.thread_nr = 24};
+static const struct gce_plat gce_plat_v4 = {.thread_nr = 24, .shift = 3};
 
 static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
+	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
 	{}
 };
 
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
