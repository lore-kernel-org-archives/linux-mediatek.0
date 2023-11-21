Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47316C61D92
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WD+y8UpKx573VJEZ8+G7XE2AV/E+oVuJPz4arOuLc2w=; b=EMdzRRA0OrGzm9AeSEgM26Gjdv
	dq3BfIC0eAJzZeADRpg8Xm+L2NZk+/A7iFtQ+NTA+bBdR2vS6nG2X4W3c1ZJ9tWoX8vdw2oBjQLSs
	eNX3ZHJASeQXLqZ6x7vb8QK2sBJd6diyKWE9V+9Ee5ZusF6XO9Xp+KPUp9Sp+/iAhnOqAWwgJlteM
	d/Rd7lWZSxrG+lrZ6ixMNCPKX8wlkqgbDS2VnC7sEjMJ2rMrpTurGrDl4yXbDmk2fvJw7MNbSpLqH
	q8e4quYuXW2ZWtaUOiCCP31Fcfv+GTKn6ndMWJ1HBfgjSZDvLYG3mHHO3ilWrbv+PM/FoIbwMcZT/
	HuLUTKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rl9-00H1FB-2g;
	Tue, 21 Nov 2023 14:29:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rl6-00H1EA-10;
	Tue, 21 Nov 2023 14:29:49 +0000
Received: from notapiano.myfiosgateway.com (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A4BE76607314;
	Tue, 21 Nov 2023 14:29:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700576986;
	bh=5REf8+1qSAKeSFYSM/vLqpdzS7hrFNmkWP0nRiEB5h8=;
	h=From:To:Cc:Subject:Date:From;
	b=jvN8W1ew3AdczFCVEQhQUsivssXtNz+fUumVKei73te07h7RAbtR3bCUWH2aGI09x
	 YVb/yGlRLVFmkr+4Run+wZg+eY94dz3sMOan0Sl+kZhu8n0qkI3LJvNzRvsDvO7tAR
	 6aoPYDtsNQmyQW2UzFLPvv4D79sXAkhS7ZN6zNv3DcxY9l339xpKIBj13WaflXEMyH
	 op0yemRLAV6wMggWkDoror+JQnuolnuinVRElXXSzgVb/GSdeFxFYiTNADeQAyOhTa
	 PcIgguoRtgUzbFYikOiWTSoKWp9Aub9C0uBi0pMfla2rLLOxfMgMuR7Bf1PlwpoPmE
	 u38NSnrci9mrQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Guillaume Ranquet <granquet@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency
Date: Tue, 21 Nov 2023 09:29:27 -0500
Message-ID: <20231121142938.460846-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_062948_545773_7451801E 
X-CRM114-Status: GOOD (  10.49  )
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

The mtk_dp driver registers a phy device which is handled by the
phy_mtk_dp driver and assumes that the phy probe will complete
synchronously, proceeding to make use of functionality exposed by that
driver right away. This assumption however is false when the phy driver
is built as a module, causing the mtk_dp driver to fail probe in this
case.

Add the phy_mtk_dp module as a pre-dependency to the mtk_dp module to
ensure the phy module has been loaded before the dp, so that the phy
probe happens synchrounously and the mtk_dp driver can probe
successfully even with the phy driver built as a module.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v2:
- Added missing Suggested-by tag

 drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index e4c16ba9902d..2136a596efa1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2818,3 +2818,4 @@ MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
 MODULE_AUTHOR("Bo-Chen Chen <rex-bc.chen@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek DisplayPort Driver");
 MODULE_LICENSE("GPL");
+MODULE_SOFTDEP("pre: phy_mtk_dp");
-- 
2.42.1


