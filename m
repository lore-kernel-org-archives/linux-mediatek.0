Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACD2C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUOX09J4DccbvY2ogcFE1DHLldvuZowo2Q3Qo3qoX00=; b=2khPsfZ26ueiPY9UqirebOqhgi
	giXA8a0H+5z9DFlNlSZk88ZXVMGdigy90hXV3o+CaBX2LVEl7tG+KclX+sh1r/am7W1sEvn9tEvxI
	fyD+QFDcBRl+a3mKsxJnC2eiMkee9IvZFHZrF0Oa1MEz1ZqegrkMVUTiJIlKSsY33Cxm522x4+BFU
	1kAGvNTYsOqGWmnEz7xeRhKK2UWDa1RaP0h2V+jY38q5+d8OhLOo4A2c0jLO21BEaba1BtQCm339u
	tvRaGGNuHyyhmOXC3PQWDzGAGqta7W3eql0b6JZD1DSnzEmm3f3gilyK038Pm+53P0HN782ZQvL3u
	VvtTNTng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYkW-002hne-Bl; Fri, 24 Feb 2023 14:08:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYjl-002hOY-Bh; Fri, 24 Feb 2023 14:07:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88A2B618E8;
	Fri, 24 Feb 2023 14:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2061C4339C;
	Fri, 24 Feb 2023 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247665;
	bh=tJW69WWMKlprOa5Xp3MSQu9gJosO9MCtIHdxPOTSeTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=exI1HPiqonADtQ3JbWxYrA0MvmrGUJ5sDDyhhgai0FWcxboCZRDuUIN9TGWCn8104
	 qHhSyUlgIZ5Oj3w6WRbc0L7gbUXFwRUemlpsSKCMj+W/i0+/Xew9NlBvV2FhT32G7G
	 bVSBawb2n7XVXx01Pnun+OBBDIFvTcYq+Y4DyHwDDTh651L6T6s3FjaFUWvxHGAyZm
	 QZXSbIcms4hzEkVPkuYb3Fk7EJoeNHlql3GBQCK7CnwVOjMR6dL6s6ZOb3hsKvG426
	 dPuzGVEYhgx+fVPBl00LjM7RGxPcjNwRVNeRZUS5IrE8uckiZrDjYMpXfd0JxgUtI7
	 oBdQkL2SN6uiw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Feb 2023 14:03:58 +0000
Subject: [PATCH 4/4] ASoC: mt8192: Fix range for sidetone positive gain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-4-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tJW69WWMKlprOa5Xp3MSQu9gJosO9MCtIHdxPOTSeTM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBj+MSj76AsGbh8BaFvHgyLdCRoaexzbW9BgLDoOgOC
 J6TdUxqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY/jEowAKCRAk1otyXVSH0EaCB/
 9Hy8hUSJ7pct+oUw+uwv5aFtd39IiXzilcaerZgNl786hX0BWJ6gN4wMCsKSctPepdVVMzytQkF9cu
 gs5Rw3oo8vWL3QcSNuF/4kP/E1edK/fCedSR80cTmL9cxDyXXO+P8pbNcRMVeKsflgIUCNky5hlNzH
 vxcEJeKM3g9AP7axDa0k+dQGySwQZkE6SK6dFfoh0Bt2X9PgXB9HO6yul6rgkqC1sz8LmD/jAi1Rik
 ymG5hWRm1oOZ1/jcZT90v2D8WH7+5LeH+yhqlEjVKEOXE5Zs2M6bZs+6RuVOiX+q5gN9Mz+L+3+pCn
 1t2qHuh3soPr5qc6RDZ9JcSi6cwmvQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_060749_478787_A09BE59A 
X-CRM114-Status: GOOD (  13.29  )
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

The Sidetone_Positive_Gain_dB control reports a range of 0..100 as valid
but the put() function rejects anything larger than 24. Fix this.

There are numerous other problems with this control, the name is very non
idiomatic and it should be a TLV, but it's ABI so probably we should leave
those alone.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index a02a297c0450..4919535e2759 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -670,7 +670,7 @@ static int mt8192_adda6_only_set(struct snd_kcontrol *kcontrol,
 static const struct snd_kcontrol_new mtk_adda_controls[] = {
 	SOC_SINGLE("Sidetone_Gain", AFE_SIDETONE_GAIN,
 		   SIDE_TONE_GAIN_SFT, SIDE_TONE_GAIN_MASK, 0),
-	SOC_SINGLE_EXT("Sidetone_Positive_Gain_dB", SND_SOC_NOPM, 0, 100, 0,
+	SOC_SINGLE_EXT("Sidetone_Positive_Gain_dB", SND_SOC_NOPM, 0, 24, 0,
 		       stf_positive_gain_get, stf_positive_gain_set),
 	SOC_SINGLE("ADDA_DL_GAIN", AFE_ADDA_DL_SRC2_CON1,
 		   DL_2_GAIN_CTL_PRE_SFT, DL_2_GAIN_CTL_PRE_MASK, 0),

-- 
2.30.2


