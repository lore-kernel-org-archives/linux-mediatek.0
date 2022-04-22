Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC2DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9RWKToQuviHEa298S05qzv03/o8/xetmjaVZxTLY3o=; b=i1PXnQXH6bymzr
	ronRonNwdnLw0YWy8OSaRd8fFqCLnOeU3wir40uCTzZhy5/aeVN5RZhqnf1LalVsnMNmpdCuuwMtT
	6DBUYj4sD8xcRUEAWxLYgup/UJTPV/WNTUjvEj41nR5cDLVvkPP2tSQzmRDEX3/D1Vtp1R/fAdVet
	r5VS+Ds5Jv1G+Gn3l7675sp0Ypb755pb1aVckKOgPnvDBkfXcDNGgH1WRi98hzG8UL9utg0akxiWs
	LKeOy3DDmfcLM4V35JF8wx80vpXVaC/KbiuE1JC6rlPQKWG5PPp/ST6aICOR1LQI5Xk5NSd1+klcn
	Lub0A2FgwfYm99akCkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoL0-00H7jE-52; Fri, 22 Apr 2022 08:08:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoFc-00H5D7-Fe; Fri, 22 Apr 2022 08:02:50 +0000
X-UUID: 2fa901a5e31d4d51a208f6d87eb126e6-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4fd8c86d-5c10-432d-a5cb-566df0972775, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:8ea997f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 2fa901a5e31d4d51a208f6d87eb126e6-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1816388734; Fri, 22 Apr 2022 01:02:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 00:52:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 15:52:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 15:52:46 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V4 11/14] cpufreq: mediatek: Add support for MT8186
Date: Fri, 22 Apr 2022 15:52:36 +0800
Message-ID: <20220422075239.16437-12-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_010248_654391_FCACE20C 
X-CRM114-Status: GOOD (  11.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

The platform data of MT8186 is different from previous MediaTek SoCs,
so we add a new compatible and platform data for it.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 4c1329fe92c9..9fc793453231 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -708,6 +708,15 @@ static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
 	.ccifreq_supported = true,
 };
 
+static const struct mtk_cpufreq_platform_data mt8186_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 250000,
+	.proc_max_volt = 1118750,
+	.sram_min_volt = 850000,
+	.sram_max_volt = 1118750,
+	.ccifreq_supported = true,
+};
+
 /* List of machines supported by this driver */
 static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
@@ -719,6 +728,7 @@ static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8176", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8183", .data = &mt8183_platform_data },
+	{ .compatible = "mediatek,mt8186", .data = &mt8186_platform_data },
 	{ .compatible = "mediatek,mt8365", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8516", .data = &mt2701_platform_data },
 	{ }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
