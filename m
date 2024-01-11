Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74008C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PNWYB7aAF9o4bwewQ2dMR2CQAVg+of8feqQXBmeptiQ=; b=ru3BDDpKlIeFcJwsLVtJCHYeOl
	4uR8iKB0NayNi9rCY7NbwsdzjuwZAHLIqP+w4m5t2XSeh+C+m7nkUuYH+gP979uUDyVF3DtNT2qtB
	gukDW/CKuxI1VPQLu+hA9rmJ3VtTxk2ASJ5KYdsgT/zDVq1OnEfdG7bNkaOdIIjKTeXKd9bQgoLK5
	mU3r1+JvaWXWelI9hahaEJ7h5r1Qi4wwxA1qFTeAv4T3eM05h9bxXDIRb2QBJJhdJuy0TER60Nv7p
	mGmjywXL6S6gx5tifNgGOL8SC0FbqrdHpjH51Kwhm6aW/P6gmNK7LP6bfnegjAiavjlyF6M+PnH70
	fKfk1I5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsft-00H5iP-2S;
	Thu, 11 Jan 2024 10:52:37 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsfq-00H5gb-1F;
	Thu, 11 Jan 2024 10:52:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704970351;
	bh=oM426rgWRaHFG49ZkqSvY5eJEqycjUK/T8+1O717p7Y=;
	h=From:To:Cc:Subject:Date:From;
	b=MV14cYbrQRMTh3s6VbeVCU2Tu0bczc/Orb4g9f0YzLnC1H49FMbFFcIeK8s1a5dhs
	 xQA2zLSDm/22ssekiagcTGE9NQwQaEfcmIuRSddLUeEgEo/S/eMwut/cvEeIXy4Zog
	 QyFDaIx+sa61NqqvMFWgLsLFpwUEEbUuA5yJgINTwMoXlUGXTFu/UjeHIWRlPaM6JI
	 3N35SU2g+ENrpn6Pj7VgFLyRW/UD+sqVwHCNqMeLq3gYqrzf8/pz8/dWCEsi1ypDml
	 0COYGnOI0KMrE0f53mTne4SBXBGqqXeE3tJJULVIFibQNanEJd6XE3hvzTJr/6GysV
	 0RlTpmPSpWniA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6FB1837811D1;
	Thu, 11 Jan 2024 10:52:30 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	kuninori.morimoto.gx@renesas.com,
	chunxu.li@mediatek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: sof-common: Add NULL check for normal_link string
Date: Thu, 11 Jan 2024 11:52:26 +0100
Message-ID: <20240111105226.117603-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_025234_579004_1A16C608 
X-CRM114-Status: GOOD (  11.60  )
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

It's not granted that all entries of struct sof_conn_stream declare
a `normal_link` (a non-SOF, direct link) string, and this is the case
for SoCs that support only SOF paths (hence do not support both direct
and SOF usecases).

For example, in the case of MT8188 there is no normal_link string in
any of the sof_conn_stream entries and there will be more drivers
doing that in the future.

To avoid possible NULL pointer KPs, add a NULL check for `normal_link`.

Fixes: 0caf1120c583 ("ASoC: mediatek: mt8195: extract SOF common code")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/common/mtk-dsp-sof-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index f3894010f656..7ec8965a70c0 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -24,7 +24,7 @@ int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		struct snd_soc_dai_link *sof_dai_link = NULL;
 		const struct sof_conn_stream *conn = &sof_priv->conn_streams[i];
 
-		if (strcmp(rtd->dai_link->name, conn->normal_link))
+		if (conn->normal_link && strcmp(rtd->dai_link->name, conn->normal_link))
 			continue;
 
 		for_each_card_rtds(card, runtime) {
-- 
2.43.0


