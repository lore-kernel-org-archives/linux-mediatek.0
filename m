Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8E2CC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=; b=sxtvdtvCYMehwEdQ2TzLeCfkRW
	arSJJBMnGV8J7K/Mnt/uzTaRImFUtVOD57AyWhyQEvPeqB+vDfu7hZBxVBytEojYz/ATKKwB55Miy
	OEnzJEbvjSb/gMzKh5IgDsw/DtW/UyqnyJY47KwP3tYkavsrEMoeNdOvTWBfmNLP7cSe51uUYMeAk
	0u3G/VHJx1geoJJHZQr1Nx+sDaLzQ75YZyzVHoBxHgVunAgK81SLdzdu8kfJqgmfwG4lDIl5Vp0pD
	p3RPSwwvX6PIcmSRSx04jEZ8NuIUutneXZF2HhswfddA3rTlhZ/t1eiyxrVyPy4mQuSxHujPfV2av
	vaYYFPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxBY-0000000FKqu-2gQf;
	Wed, 14 Oct 2026 11:30:16 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxB5-0000000FKTq-2fvF
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 11:29:55 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so3024405a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977387; x=1792582187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=;
        b=rjxfNVbkl92iGYs1S6niCnB4x0pt61x6OmqQadEg5P0aGkfblgyx78wUpnf0+23rjr
         q490AH6BKRQVNtH4G7QryyRXbh1KTaucizfKBthqR++g+IEVWPudIFvRnE/dE2ylXhGi
         iwbgXi4OqeVoy68H1zghBL5OZ6JIB4XYgUv7uZ57mwSYJGPH/uWKi3ro7s+M+EFJ+cte
         MCC2Ccv4hW1KnQmdQR/S5wEZTo909Pm+5j2tZvUbL5dP1vokGs8i7kkWf9dhNVb5ISMQ
         Zm+95FhTQ74rL/+lEs7X66b7ZTcLKmRtGdHK642dEhsbmmd9PQvmrNRx4itBhPwMmWfe
         qzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977387; x=1792582187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=;
        b=FajgAx5pkxgnFrjxiBdXayZg7NKo76km62STxCzAvOzum+pkp/js6Zl2KIs2UnkZGK
         AhdHUDmwQm6zw1b4j+eSBaLQIb3cntL2FI2fe422B7+gQzWgy7QLiVfLfYGWdunvVclp
         LbhNlVbAEon1ci3wGNIIZAebT45l7G6oFOjsymkQulfXg7KAZ6ITNOOk4GBhyWpdf9S9
         VGkStEhqwGRKMEvnMDypqLjQfxCq8gUJbEXK1Ns0U411oJQkWsehsy+/Y5jRdmA3hz78
         VryuMQ+rpXOMRx5AMr5Xgbmobl1s3HD88dBTghK2fzyzO8RMxKfD9DREMDynP8NxO6IL
         l1hg==
X-Forwarded-Encrypted: i=1; AKwUvBzxU6fs2V7yBoEhLXIbH8Y8vcpKZUPL5uLdCxA1LsuK0SnGM9btJzbAsEnxa+WtTlDnuaCDOhqWvsydZJKDfg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKJAVa308NvuaeC/KCSxbPdaSIIhu11wv57hrgN3WmPuJt04C+L
	TwJtOrlPFegJBolWLsOqpNebB1zc+Pa/U1gwiQfJAAI9yL3drxFKc/rn
X-Gm-Gg: AYBFou02s8V8isO5FdnH4J4QeyOz26zK70tF24tpKGwgLKsePI2Rc2fvUD5URdElrCu
	Vjg3meXRNHHoHcN/i4QrA6LKgeqy3lLOXYVM/94BPxTaDaFvKnRpMwNjuj42ponC/CbOgynIe9l
	WI9B8hZ7zrEkJovnAV38MdUQUrqtaU8SVStwkQWCwcxLyYQSHeZ+D+wYvB9uSxgRViRgbkInOYY
	WYpj4yYm5y8OhzPwkZB9lXT6K+47y7/j/vp6lAsU0lNqK/PFoKlFgluM0i5xSckhL2OtxYVGnDk
	jVCHeLN35Z6GOV83Ih3NEQ0fZw/H/N1c/Rln1jQmGet2aTGI7iUnl9j36TkB3ap0X07osE3nfCq
	sJ8EXlSFy1fx9ai2RIzABd5GlVJcoBGQVFLmdSOJcVDAaA7GSnffKARU8wQqtFJLyQkzX4Ass7B
	+g+tvpfcX76Ayxru7E7cPRTE/tTltRz7yvfB9jjTv2ztYWLrvr7zRI+vw1O6RKI5sm0+8ujgshX
	3dVpP5eLa/i7TcRy2LmJ/V4VID1mNf39Pr4WIFUcnuSV+jUPi4wrIC8W1uwxyi/h9dIk85EeJje
	wIv6fPRx31uVLA==
X-Received: by 2002:a17:90a:d44d:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3ab3a8d0e98mr12992962a91.42.1791977386685;
        Wed, 14 Oct 2026 04:29:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 16/16] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Wed, 14 Oct 2026 18:27:51 +0700
Message-ID: <20261014112752.683032-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_042952_232559_36C7DEF6 
X-CRM114-Status: GOOD (  11.84  )
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

mtk_audio_hires_event() ignores the return value of
mt8195_afe_set_clk_parent(), so a failure to set the clock parent
goes unnoticed.

Return the error so that the DAPM core reports it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 -  Update the commit message for the DAPM error handling.

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


