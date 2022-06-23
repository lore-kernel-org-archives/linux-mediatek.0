Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3839C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 10:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY+Pnvadw0/Gxu9Yiogd5miDKzvP5WPdhbnpel4dXTw=; b=s8h5ODZuWFpTvqyWzYqTDE4onL
	Ofyd0blzvtGhTpIzh/lla5B+/1Yy9oE20PSuxQKIRKddEYn+41qHaed7L8uXqmvVb9VEaEqE0Y1oL
	c/up7tjtldhzSxM6NcinhEnTo8MTCsY5F7c5cWCF7qAV9mRnGvccPoQQFCbS/5MRiG/FPgrlGQDAs
	pPcjL2ss8Gqk5l+XMbsSRUEZuJVhSUdkKPCKBArD0P6DEw7ZD4/YUSN1PS1lwy2BwEfIwtF0J4/nT
	Pvyz6MaTOnw9cWrt13lJSXh3Nqxjmopt8TXdUs10EiWvoM9TywkAUhazC1QuRyHUEX8vpQCBsbWl1
	uGLclkUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jnh-00ESIW-OQ; Thu, 23 Jun 2022 10:11:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Jmo-00ERsX-JI; Thu, 23 Jun 2022 10:10:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E611766017CE;
	Thu, 23 Jun 2022 11:10:04 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655979005;
	bh=MQ1fY3/YQ3FihXnEhKH3AztkzbIz3/gmcC+bWRFCvME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PBw4goKZ9D8tsWxsCWyAIkBmRrVwO0yz2+VyTndpY80/CNjsum6ZgnxhGGc6TVhwC
	 RA1hsnPYrqs+0NJZR1pAtsTPeMKH07O5HBe7WK6WZLcvNJIQwWsm1PZaX0A2u0m3yg
	 Tq5Lcck28IuNQluwf36YvUJq5KsFqS1IPnsxSC8zO2JdtRH0ljpZkCJAs1RrSSIrkS
	 YgZZkYhW/NluE9v9rqJtcBiIugfwthAMRKNif4nqyp7yXev/0CCMQyc2W+zPbmyRiU
	 NxLVWqw4EZpCjRcsi3WsakLcaI3KRrFOhE3yB3LKpmqX8waCwM0s5g1m8Sgt0KTqSu
	 +fpQj4iVxrlZQ==
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
Subject: [PATCH 3/5] soc: mediatek: mt8195-pm-domains: Allow probing vreg supply on MFG1
Date: Thu, 23 Jun 2022 12:09:49 +0200
Message-Id: <20220623100951.21153-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
References: <20220623100951.21153-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_031006_827968_F8049617 
X-CRM114-Status: GOOD (  11.63  )
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

As done in MT8192, also add the MTK_SCPD_DOMAIN_SUPPLY cap to the MFG1
power domain in MT8195 to allow voting for regulators on/off.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8195-pm-domains.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/soc/mediatek/mt8195-pm-domains.h
index 0529d130b675..d7387ea1b9c9 100644
--- a/drivers/soc/mediatek/mt8195-pm-domains.h
+++ b/drivers/soc/mediatek/mt8195-pm-domains.h
@@ -162,7 +162,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
 				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
 				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
 		},
-		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8195_POWER_DOMAIN_MFG2] = {
 		.name = "mfg2",
-- 
2.35.1


