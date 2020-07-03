Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A0CC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 04:53:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC636208FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 04:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pad6+98P";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CL+hVcQ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC636208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oHT26UjqIEfDuATTEFcfzisVmTkpOaWOq93mIVSTttQ=; b=pad6+98PCXs9DJDY4zFUpEfo9
	2kdMIzGJTEor7k2uN7Bwg+Cy50petOZiGFz65IPhepm/gZBHXq1t1yhAbhUtLwcrYvUNQzdK+o3QN
	jS9x6Q9QfryTakddcQL/vBVgwUdFu+r7JnYFnDPwDN1jbHouS1B2apNftqEdJ9GcKQS5fufzNr3Vm
	aZbbDTB6XeSMfVTrw75WXUyUmZzVGOy5UQrorwv6WJaa9F0C2fRdxIGPeayLaFS3rf4mIOsW7buXl
	d9MwvhWJ6P6Jms4UQVSjXJgJgrql287iIEDK/YfYqTxnw9t1VzPUjlGPDTLPuE3Qn9rpLypcGGkix
	rdX2Kytow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrDhN-00052b-Fk; Fri, 03 Jul 2020 04:53:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrDh5-0004sR-0B; Fri, 03 Jul 2020 04:53:00 +0000
X-UUID: 20cf2cc676cb461595e886926803e055-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8qMmwM2uoxTxvPWDvQpY/SHOtQPS3rAHZGZciSo8HQ4=; 
 b=CL+hVcQ6FWtGawwo7GzH/XBsh4DqzR/8CG0msMyMgqzgfsaigX/DmMlA7WC9drZgCd8uvW/bokjV6pMjjg+Qe4TjxEBrjxmGcBOXl4JddDzNDkSMcBrE1bdayCJ77cnUlMF4nx3FDCMHEzu7fDRblmiZlX1exhb/xBsHe4nUlbo=;
X-UUID: 20cf2cc676cb461595e886926803e055-20200702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 948000555; Thu, 02 Jul 2020 20:52:51 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 21:42:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 12:42:44 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 12:42:40 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v6 04/10] iommu/mediatek: Setting MISC_CTRL register
Date: Fri, 3 Jul 2020 12:41:21 +0800
Message-ID: <20200703044127.27438-5-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200703044127.27438-1-chao.hao@mediatek.com>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 62FC61D80859CCE8BC6DF8E8BC20DEFB1CFD8B2EDE2E84826E68BEC490F758B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_005259_348435_D2A33315 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 TH Yang <th.yang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add F_MMU_IN_ORDER_WR_EN_MASK and F_MMU_STANDARD_AXI_MODE_EN_MASK
definitions in MISC_CTRL register.
F_MMU_STANDARD_AXI_MODE_EN_MASK:
If we set F_MMU_STANDARD_AXI_MODE_EN_MASK (bit[3][19] = 0, not follow
standard AXI protocol), the iommu will priorize sending of urgent read
command over a normal read command. This improves the performance.
F_MMU_IN_ORDER_WR_EN_MASK:
If we set F_MMU_IN_ORDER_WR_EN_MASK (bit[1][17] = 0, out-of-order write),
the iommu will re-order write commands and send the write commands with
higher priority. Otherwise the sending of write commands will be done in
order. The feature is controlled by OUT_ORDER_WR_EN platform data flag.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Suggested-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 40ca564d97af..219d7aa6f059 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -42,6 +42,9 @@
 #define F_INVLD_EN1				BIT(1)
 
 #define REG_MMU_MISC_CTRL			0x048
+#define F_MMU_IN_ORDER_WR_EN_MASK		(BIT(1) | BIT(17))
+#define F_MMU_STANDARD_AXI_MODE_MASK		(BIT(3) | BIT(19))
+
 #define REG_MMU_DCM_DIS				0x050
 
 #define REG_MMU_CTRL_REG			0x110
@@ -105,6 +108,7 @@
 #define HAS_BCLK			BIT(1)
 #define HAS_VLD_PA_RNG			BIT(2)
 #define RESET_AXI			BIT(3)
+#define OUT_ORDER_WR_EN			BIT(4)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x) \
 		((((pdata)->flags) & (_x)) == (_x))
@@ -585,8 +589,14 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, RESET_AXI)) {
 		/* The register is called STANDARD_AXI_MODE in this case */
-		writel_relaxed(0, data->base + REG_MMU_MISC_CTRL);
+		regval = 0;
+	} else {
+		regval = readl_relaxed(data->base + REG_MMU_MISC_CTRL);
+		regval &= ~F_MMU_STANDARD_AXI_MODE_MASK;
+		if (MTK_IOMMU_HAS_FLAG(data->plat_data, OUT_ORDER_WR_EN))
+			regval &= ~F_MMU_IN_ORDER_WR_EN_MASK;
 	}
+	writel_relaxed(regval, data->base + REG_MMU_MISC_CTRL);
 
 	if (devm_request_irq(data->dev, data->irq, mtk_iommu_isr, 0,
 			     dev_name(data->dev), (void *)data)) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
