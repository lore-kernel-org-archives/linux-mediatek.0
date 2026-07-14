Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A66C4450A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 11:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OpePOPLCA0PXvchecli98EIEzQF2dD3vOt0f1SSbJi8=; b=aFym0G/Px/LUJw+bhkmvvjhhJL
	cekEiI4XubiYBxU9HFwR7zIm7TLZm43h31N+QOoGVezXLZdyo8EOg+cX6nirWC6QAs1giaXA07A8t
	RO/PxgNBgA6iVAELd/Jmixxc9NgGxNoxHAaWvHemzL1VeeVz5dRMCMK1hgdCdWL97mUYNSjHW09Z8
	jhnPZGI1PNuSwtPgF1hsiMYjyOedMWJWAhhlBijMuDgMCc4fFKmFhXouvc1SqeCWYM2zGqzWcE5fw
	OAZgtXtGMewr69u97nyH/kZoP8XfSnf8pwFzZy+Obm6NOpRvqF925or5VzblWCfzd2/bI9SMicy2t
	X2aRKh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZv-0000000BjdZ-18H8;
	Tue, 14 Jul 2026 11:45:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbZC-0000000BiY5-1lg9;
	Tue, 14 Jul 2026 11:44:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784029488;
	bh=bouJrrAmvaCef0ljEylZ0CN770Hr5Qsn4ItcvLnxm7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b7LSY2zBf6X1nDN1trT0Gv33LqqikMQwxFuMJ2cj93xW2Z3OMCH04NFktC8xtWCvg
	 mmAs3kTdeFpuZBCw1nNeZ0HIv5HD43Ox34sxiMoZg09Bf1wSqREpZ8zfYrTjp31MZS
	 CM+46mZni895xj07+LZnUBZGU8vPkYQCd5B9yZaGJrcYXvFTQvl/Hjzv8RLLFhcFef
	 TnyA4YUwBpbF7mmrjbXWf2hQrAkF0GxDFbnF8S+mjmCouY1Anxt8g1zK7fkjTkINgb
	 TMfPgLj8UkuGC6o1x31Z1R+ESosFlfKHH/n7yBqfFvGvinSpGd3Hiwup6NGK1U8XOJ
	 M5dE1dBkRAsUQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E381B17E07A2;
	Tue, 14 Jul 2026 13:44:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH v2 15/46] drm/mediatek: ovl_adaptor: Add special MERGE component check
Date: Tue, 14 Jul 2026 13:43:43 +0200
Message-ID: <20260714114414.184512-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044450_653022_7A70EAC4 
X-CRM114-Status: GOOD (  11.92  )
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

On the legacy ovl_adaptor for MT8195 and MT8188, four MERGE IPs
from VPPSYS are used, and those shall be exclusive to the OVL
Adaptor driver.

For this reason, add a branch in mtk_ovl_adaptor_is_comp_present()
to check if the component that is being checked is MERGE and, if
so, iterate through the list of component matches to understand if
it is one of those that must be exclusive to OVL Adaptor.

This resolves a corner case happening when mediatek-drm retries to
probe after a probe deferral, where all MERGE components would get
added to both "normal" and OVL Adaptor pipelines.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index ed9a2e35ba8a..bbf1d8ccda05 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -519,6 +519,17 @@ bool mtk_ovl_adaptor_is_comp_present(struct device_node *node)
 	if (type >= OVL_ADAPTOR_TYPE_NUM)
 		return false;
 
+	/* Check if this is one of the MERGE components used in OVL Adaptor */
+	if (type == OVL_ADAPTOR_TYPE_MERGE) {
+		int id = of_alias_get_id(node, private_comp_stem[type]);
+
+		for (int i = OVL_ADAPTOR_MERGE0; i <= OVL_ADAPTOR_MERGE3; i++)
+			if (comp_matches[i].alias_id == id)
+				return true;
+
+		return false;
+	}
+
 	/*
 	 * In the context of mediatek-drm, ETHDR, MDP_RDMA and Padding are
 	 * used exclusively by OVL Adaptor: if this component is not one of
-- 
2.54.0


