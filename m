Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49058C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 07:05:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B3F2151B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 07:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iMfofIWD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UMXRRiIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17B3F2151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOZzPQYXk4lRdkmzfr3Ab36gqblpuXk4X9PbOrhaQ/8=; b=iMfofIWDHo/O1w
	kJbkGal3isDhw2IAoeU+bB7dvLfkGdmlAufd08YWcj9Tl0JnXaXvvAxeVdLu84sMQUW4WdCEtfXJf
	ef7sbYAqYaupDnulOn6dKifz151g1u0C/iuWasNvF4AW7JlXmRGIjZJElKYt7DGGoAkbqwzOEJPHv
	V78JR8Ujd9JO9gJ/io2OY09g0Yy1nspKo/tZYX+UcDgPpo7AjIVbfclKhKsZthcCKnCR5a8EpGoEk
	b5sFtAQT0GaPd9RtcrNFaUAWMYjLbIMQMyqA4xj+P0WeAoaSR4oAu7NT8FMXtIcXRYWOJMKufJbD9
	Icj5AFrpJH1p7rslclRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlS8a-0002qL-DU; Wed, 17 Jun 2020 07:05:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlS8Y-0002ox-MC; Wed, 17 Jun 2020 07:05:32 +0000
X-UUID: 25d9be4e02b04cccabebb63b59fc6a90-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OBPtD1tbN5OV8vnvCeCNDHHxC6o81b/X9CvevB+bOCk=; 
 b=UMXRRiIS1Zw0twgr0iU3FrzT+pTpbZotUbCNvZJPfuKttG4gMqwN0aXRcMJGmHexGYeb6ZConK+hxyEzB/bUT/ID3nHkF/ORANjl4ghrmU/YPJFNX+1PJkvOjd9kOTCMe8FBGpFNHEL8lZN3zpg8BuaBjqOltyuiM8Hvjx1td0M=;
X-UUID: 25d9be4e02b04cccabebb63b59fc6a90-20200616
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 957038197; Tue, 16 Jun 2020 23:05:15 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 00:05:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 15:05:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Jun 2020 15:05:23 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH v16 09/11] soc: mediatek: Add a comma at the end
Date: Wed, 17 Jun 2020 15:05:15 +0800
Message-ID: <1592377517-14817-10-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1592377517-14817-1-git-send-email-weiyi.lu@mediatek.com>
References: <1592377517-14817-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F9D2535231E86EDD4072917BE38EC826236484326466FD89AC619CA89CE359B92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_000530_734284_DD6F73D7 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Wendell Lin <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A minor coding style fix

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index abdbab4..5bfe58a 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -1426,7 +1426,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt2701),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1437,7 +1437,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt2712),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1448,7 +1448,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt6797),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS_MT6797,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797,
 	},
 };
 
@@ -1457,7 +1457,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt7622),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1466,7 +1466,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt7623a),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1477,7 +1477,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8173),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1488,7 +1488,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8183),
 	.regs = {
 		.pwr_sta_offs = 0x0180,
-		.pwr_sta2nd_offs = 0x0184
+		.pwr_sta2nd_offs = 0x0184,
 	}
 };
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
