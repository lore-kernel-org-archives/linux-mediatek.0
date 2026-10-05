Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF35CA5FF0
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=; b=ULj1LrYirG+6OLz+QI5H2XXoDz
	HNud4CXFD5hj+hprmNJCH58yPWeFZkeQYTm+ZiyOvPPy0jT1XDT7bMcsOYMUM+RRgL/b+PGtV4B+x
	1VhwlYAC7lcijUkofWTMvHEH3Tw8gsxEMRhPR86mTn+dWiLhD2iwQRB093F8TiSB7a92LcHHIy0Fo
	g3CjO+TG19hqmcFvd6IOe+t0XdjpDeQ5xIxuhP3sKVzQ0aZNXNIQXbZrJAB8A8J6Ah5QXwvStbhGM
	vA3wJq8bkJYRdotwlI7jveHdJ9RizGoRpcVkl727BMyb96jtMAKvTTVHR2Pb94ugmQ66WjYP+/LGZ
	aq0FiFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUd-0000000GI0X-2hQc;
	Mon, 05 Oct 2026 11:04:31 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgUZ-0000000GHuX-2UUU
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 11:04:25 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3a813079a55so180056a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Oct 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198262; x=1791803062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=CSRTXMV0bAVrk1QR6fAj1l+Mr3gXzsIaZVfl+E4ImWD+AgYjXXSLI6P14cwi0GUdrg
         GahxR5h78b5OVB/U2tktPih8IZ1ZeK1PSRYuk5XOjrLjIwZXck+aQhe5z6q35Ow4ss1w
         IleIVj+s9oyKBxnx3ehYB8RME324L3VFBdYTjeXzQkvkrvWsTv56NNdvze5mx828VEJh
         Z/oTxCB6FkdyZy+slKLHOXBPoZpAI2XWP4qLnMEwQaz2KMHiOStnRuduGiQibKc+8axe
         L9XGIBgW0BAsKvwHn2XdFb0fMISIxx8kUDei4Cy7dNHAlve2/z8N8NeiZ1o6VsNA0o/q
         mM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198262; x=1791803062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=PWkru+dn1PFt+irDaCm2YcVJA6yRiShDjfPngfqNbXpxUQP4sqnCkGzL3JVoj5tQXl
         opmbbaa/s+eesPcQajxsAify7+1BauG4hOmXWJgfcjkj/8sB9bJaYxpF4x/gty8PBcRj
         1G4S9weA03SCpH5cVnMAm72hRqtvft2ME4YcmpkVlZukLlTQhk8BE+bsNToC9VX9/V/L
         Vu9f/itk1YS86qQ5tRqR31W0VfNUalc/2B19FnF8aNcMUhMebk37eq88l9ce5y7ZLTBP
         x8nR4zuYUnrdWhRcEc4NqeOmVT+LGMLI3eBWUeJhSj/0E5bSWrzLpZSkMVfQZVH5SIjL
         Iszw==
X-Forwarded-Encrypted: i=1; AKwUvBzcoW6N/pf4MEXPfiwZwPos6CFy4heyaMICwBlmgYSN2T3fDqeWhCnrVPXWB7Lmtrq8i+V7iW9/uCuAD8I0+Q==@lists.infradead.org
X-Gm-Message-State: AFuF++mck/tB27AX3zcOBHalxI3VRms9hQ9+1EDMrLI5Ln13V28i42xB
	LbRhMJyHcWcW6BJgA2EaseOUxfl+iG1JVxBNOZNu78Knmh4zhj1ECWEO
X-Gm-Gg: AYBFou3jKLFxTDuCE2/gujPTU03zANaFASEeI+9K+B0X+TA92I7DaGLDLgny2Es1Fi7
	qr0Q59e4gnczWY3ICzu8CKcuupU/OBHeb2wPjI6l/one8XqqKK/Fh1RCxAFpOJhVdAc3rS2maZP
	i+x6I71z4QPsATDpxcDqSv+fV0IvYzB5a6m9p75VxYfde9Qs3MpWemVwx36Zbo75tgmpnrw/hpV
	yAASpXElj0SaR/0TAbjp03vaOx+dwfoTMgRj9b+wvqxDPUfAHk8bxTxcE1oLkrqriljfs52cHno
	Ud1AxcX88f1ey3h+j81Hxn4U51kjjnMJSkRbjR3I+6k4IGPJ43Y718WgSfzrzheV30QC+icYx6Y
	H0SqlLlvCpoVCwP/iT0nbjY6VQWJOUB1246MWIZBG+qfzvKzxMeUHWYgz54kFj9vA6ycEP6Q9Gw
	qtPEqvT0SrdMktyDQq+RGB7Y0/zTGtzmevsTeaMUbsV7dTJpQnaNRv51agcbY3yaxw/QumgSdSb
	3/YEKwfDURreh/8pKSVEjvAwn9xgiPqys1AJftYLchY3kKk+470v7fPPvNe/I0C4oycZsH1/d/R
	NjYpYizkBeF2XQ==
X-Received: by 2002:a05:6300:68cb:20b0:3df:f477:1e19 with SMTP id adf61e73a8af0-3dff47726f0mr5590214637.48.1791198262474;
        Mon, 05 Oct 2026 04:04:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:22 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Mon,  5 Oct 2026 18:02:57 +0700
Message-ID: <20261005110257.50145-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040423_670987_5A6C1949 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate the error returned by mt8195_afe_set_clk_parent() instead of
ignoring it.

This allows clock parent configuration failures to be properly handled
by the caller.

Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0


