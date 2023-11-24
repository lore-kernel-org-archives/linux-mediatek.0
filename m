Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFA9C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 19:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ts1KPkibNqcx5zZJ6a5hBrmL+wYch4crvU+NzY+EWt0=; b=OO9r4mBDmLuU7sMKDHPP+8bZ8N
	86iuolscL3KRu9oHs524waktQly1B4IMENEvGcxzU0AYtxIrHKEZzT0vBHL7qHMvBmtI6Aljsk9A1
	M0uiClqBei/Dt0YyIz5RPg9ybT9QpQ5qapXvRUwwtI+KRacedaKEU01cnnJXfUbvADa1sOlzem6lI
	YDY1IrEIHQLfBMWzZFNmt2Xi6NiAcQQ27IsYOUuh4R/y5d7SgYMpNFN8QuV+2xoJZmiint5mrG8zs
	ysEIWFKP+kAjDM2M8VBUThr0XwbrMejPUQ8WiI2Nta45dFY+8QouEmkZuvslazaI3ghVMudH4Q2Jm
	2xvK61UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bPy-007v4X-0X;
	Fri, 24 Nov 2023 19:00:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6bPu-007v37-1I;
	Fri, 24 Nov 2023 19:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D67D961F8B;
	Fri, 24 Nov 2023 19:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180DCC433C7;
	Fri, 24 Nov 2023 19:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700852441;
	bh=IYiTgBZCIQ4urWrEoiZflc24qhP94zYvIAaY9oZy5A8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7aqIAZTslou2TcgbuGAT8/w/E7AF7BE13c9D1qM0hh0+HPPxtpMt5kUup0zdbYqH
	 4wt3QSRcTXmEgNXiMBQ+sUH/ZMG3705pTGbo+g1vC1f3TLcGN1QXHbqo8BzB5ZJ94W
	 Qr7AZqcy8ikFLt39HnC8OPbBr5/CZBxo0Bj1C3iQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Guillaume Ranquet <granquet@baylibre.com>,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jani Nikula <jani.nikula@intel.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 6.1 324/372] drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection
Date: Fri, 24 Nov 2023 17:51:51 +0000
Message-ID: <20231124172021.182820979@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124172010.413667921@linuxfoundation.org>
References: <20231124172010.413667921@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_110042_478619_E1992FCE 
X-CRM114-Status: GOOD (  12.73  )
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

6.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jani Nikula <jani.nikula@intel.com>

commit dab12fa8d2bd3868cf2de485ed15a3feef28a13d upstream.

The sads returned by drm_edid_to_sad() needs to be freed.

Fixes: e71a8ebbe086 ("drm/mediatek: dp: Audio support for MT8195")
Cc: Guillaume Ranquet <granquet@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: <stable@vger.kernel.org> # v6.1+
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Link: https://patchwork.kernel.org/project/dri-devel/patch/20230914155317.2511876-1-jani.nikula@intel.com/
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mediatek/mtk_dp.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1983,7 +1983,6 @@ static struct edid *mtk_dp_get_edid(stru
 	bool enabled = mtk_dp->enabled;
 	struct edid *new_edid = NULL;
 	struct mtk_dp_audio_cfg *audio_caps = &mtk_dp->info.audio_cur_cfg;
-	struct cea_sad *sads;
 
 	if (!enabled) {
 		drm_bridge_chain_pre_enable(bridge);
@@ -2010,7 +2009,11 @@ static struct edid *mtk_dp_get_edid(stru
 	}
 
 	if (new_edid) {
+		struct cea_sad *sads;
+
 		audio_caps->sad_count = drm_edid_to_sad(new_edid, &sads);
+		kfree(sads);
+
 		audio_caps->detect_monitor = drm_detect_monitor_audio(new_edid);
 	}
 



