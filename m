Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43318C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 10:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMgCK3pwnxf5oYWJe93ENbvYx0hUewwpFIPzFHxOi/k=; b=sRRgjBe45RRNhYQ+JdcM9vKvFs
	7LXjifB7nWLJm/JlP9J4UDvNfmMp/8cPG2S5uSkv/vf3fHnxsHXpGvxG8scoxAeNKom+YbGcPdtwr
	z9dhPHfenM+UGEErwfBvLdN8ET4F0rcsp6CSKWhtP+7fN4RfA3JahnFonVWkzdYl69kRNrpOSrDO1
	DDa73eOcSQ4UM+xrm6AmtGKaXccGDbs3cW57cC3OxKDf0bosv70AbSj5V06aKXI9syCBAHGkGuahr
	DPuq4cnkJ2++EnHHnshz60vjRuUo5QIj1gAA6UKsqlQnxpNkVPQD4O5XTwkpg3jQ0AEiEZE4jmUQO
	Cx3P1rVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4JoF-00ESeD-Tj; Thu, 23 Jun 2022 10:11:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jmr-00ERsn-8F; Thu, 23 Jun 2022 10:10:10 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 892C666017D1;
	Thu, 23 Jun 2022 11:10:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655979006;
	bh=ArWDB16Gc91tVSWokUuwuvangO7rCvezoVWw+007RDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i+VlilDqcFJfuiZNeFUzVfy19TIIdmZyQrqcwbm0C5oiznKm+2WoqBKMTB78nm/Ya
	 S6Ggl+YSv1lT2DrAmfTXeX9lV8aXrkUI3/r0DXVe2pchDedAjnZNq5MPHEOBD5iP3+
	 ySUtIuYVk7vYTEZCmemo5FaDesfv/wBPqadqGY528bMIJksgidERS0HHajvx3R3dbW
	 sLOSLLM6ANkwGSKcrRRdNSSxuHzf9yFULxB4yQGdz8Q0jset7C0NPoYkmOArXG4jpF
	 isQPEpwGAFxUVHoMOduqZGkWlI/2eRmsV/iGQxDPRRce/Tj8vCx9k01VFlDQTww4il
	 ukVy4Rpw7YiYg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/5] soc: mediatek: mt8186-pm-domains: Allow probing vreg supply on MFG1
Date: Thu, 23 Jun 2022 12:09:50 +0200
Message-Id: <20220623100951.21153-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
References: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_031009_498660_8ECFB975 
X-CRM114-Status: GOOD (  11.09  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the MTK_SCPD_DOMAIN_SUPPLY cap to the MFG1 power domain in MT8186
to allow voting for sram regulators on/off.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8186-pm-domains.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8186-pm-domains.h b/drivers/soc/mediatek/mt8186-pm-domains.h
index bf2dd0cdc3a8..108af61854a3 100644
--- a/drivers/soc/mediatek/mt8186-pm-domains.h
+++ b/drivers/soc/mediatek/mt8186-pm-domains.h
@@ -51,7 +51,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
 				MT8186_TOP_AXI_PROT_EN_1_CLR,
 				MT8186_TOP_AXI_PROT_EN_1_STA),
 		},
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8186_POWER_DOMAIN_MFG2] = {
 		.name = "mfg2",
-- 
2.35.1


