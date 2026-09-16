Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48E4C88E77
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 05:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=; b=a2J/6fn5J2ljXXltv2BbSIk+a6
	dyvyhTamaUDSvlojweqD+UJQDHtCgtgKqtmH9PijoTleYpd2GVL0wpOXtULDjwdgG3ZP0t8mCOJkg
	wdNTxMSjR2L39GMAbFlAN+lxKBT074FwL34mdDx0P8tuSBmw9tA0bnGWqliwwbR3M0zP1TTEH4QK2
	+6b379McDLN9skO56gAoESoCQpuc3RE86+P+lKCxTFNy5hCCEX8joukbaCqnpzwO9g2oebBq9SlXV
	TKLj4s0vSrnjWmxzmo1GAWrUQQvlkJZb7toJaC4BRp5RQuN5cch14fLtDMRtSVEFfDTee3Tk846vY
	7fVrc2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hmS-00000008Lw3-1hq6;
	Wed, 16 Sep 2026 05:02:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hm4-00000008Lg6-41Tp
	for linux-mediatek@bombadil.infradead.org;
	Wed, 16 Sep 2026 05:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=; b=evSBYPQslnfKlnn9i/D8TMfUJA
	973/F3Vvbx9PhYdJsHQmIItcK2Fe0/zkVZalYJkzwHliG4y7Ne1STWd/Nb2G010ndeWV9D+8KLKi4
	sdWr6YnUU+crFd4YXmPpFqvO8t3Hmlk5GbcutwpVzWLe4aw9czFwDtdcR+/G+WDia29x+/5OOXq03
	tBcRGFnA8tqq0tRqQ63tiDUL7nOt8We8KOFA+W3tLVz5Pqi4Naatl5yQeB6U+/XushQ2Q+FAxfW6b
	WA5eoq4zFYKTwWVUx+wRmX43xS7ykbwZTp3AscL4cm2iKGqUe6N4C9IpJm9ulODFLnt8Ro9uYyPXQ
	jyqUTccw==;
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6hm0-00000007UMV-0u1c
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 05:01:35 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-8631d0023daso304479b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Sep 2026 22:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534890; x=1790139690; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=;
        b=R0YcLpTjXvXrfofytorsHVcqQGKE113aKeOgjDslAlE61QiRHh3D5KPQU8QibC0oiE
         L4UkuZ9i1861x85S6qpKoYR3Yo+lDqHNnHg8ObeVbF040sBUpebz8nlmkAKm9leJryAT
         Viu+EukEX//mP4uPHSRlRH2kycF2CoAlu2xrdDivd9t1evN4Jhr8F6s4agqaB5/LcxsY
         Z+whIiol47pj36YqvfVHOvax40gNpLKR/dTrvI02BDjtncnr8sKNzrlRbXEACDdIeMGu
         L6wm0e8sAZqOQsUHJOpKpRnCKshbdIPkfJ57g/UY3vefkiIgAyx29U1RtqP2bakJ0wfg
         5Hqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534890; x=1790139690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=;
        b=ZAvpsvLLjjZMY0iGGzsNvuSMMa4jqw9qiMMEqB7JA51RMnjlbeFuWDLeH8Jl7t00Qv
         tN5gv06PBkxuFcWjRk/bNGGUYbnymxKyJIWxH2Mslr/AIE8VprUPgYnEwmzptwyURLgD
         LNY3j+l3NVPVhLnKlSAKmQ/kFLn5dCUZUDJSmKgin472mg+uD7TVKEyLrUflFTjSsJn8
         AssWKN/UkZk+lAGZhodPVoYPwfNUkhakvZ/DkCAh98+QVFIqu4PQpk66t84HKrZzsL3z
         YtOIUJzHFo646KNkaqZ3w8JFFnHN7eZ6dgz5we3nRiknAdy+hk/+CGif5GGoy0+um9Jj
         JBJg==
X-Forwarded-Encrypted: i=1; AKwUvBzYTt/7f/8XqHMasrpH/ekXSSU9O24kbrZBSpsJTwi94CXKYWDrk9yQspoxfBzkwFMduqhHOvqOzL1iU/qYTw==@lists.infradead.org
X-Gm-Message-State: AFuF++kAvpX8pIwkwPgnwzK+AEO0AKoKYkyRPrb+oHi8lzagt7wuo4Qm
	yhkAGs/yMEgvBJiXBoutzl7w+nviuZmYu8kWisFesMWXHfgKLZUs3cgA
X-Gm-Gg: AYBFou1nsZiF67flqkkvznc3icwDOA7CN63w8TDme4Zel6atDkZ/+INfQTJOnLkqAa8
	YFEdOFF+HFaL8kfFyrd6kDOTqYYAIjvCR1/Zte6E7jYoKCvLbG4gWZbPwVEEtiuA4GRsLBwj3sf
	CFTOn23+E7ydb6aoheyPX46KVYCJLkzY/BJuNaNIe4MwD/PQIs48tGAonOr0Bh5V1iwP/3NBnBM
	nxom54FcTaNE+rXm3DnLXgW2zoisvUt5Wkr7lfZd0eolJvIu6WopmbZs/Ib7cat/SctHjF2N4js
	jg6yKbXyAMghQ5nb1k5RXrkKTua+NaWbKTwgjvjoANbSaM7+QxM15cA8qqGFt9bRBCjclbossYX
	2gmBJ75ZrldO5vEq3JhqyZoBKCuzC3k3NX8z3XgLSNT+oZ3dwfbOlos5xK4g5+U/h3GrcTZqrUZ
	syBOQgycyRVxR6Gf77W4sg0gzlG0WeE0iycshTOn4lrq9M52Sixw59mkk4XQOYER6UQsV3TjJE1
	gXFxf1mC2ze0iOZajyrlaEj2VDUqsq1RC9oJ7b5Hi3naUP7X7qgzT0Dme90O+fjOc8ot+yaUXs2
	HhBT4R2hGL1bflc=
X-Received: by 2002:a05:6a20:7288:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3dd5f3f9548mr2947733637.2.1789534890268;
        Tue, 15 Sep 2026 22:01:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 10/12] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Wed, 16 Sep 2026 12:00:17 +0700
Message-ID: <20260916050020.14575-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_060134_162937_4374737F 
X-CRM114-Status: GOOD (  10.25  )
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

A zero frequency causes a modulo-by-zero error when validating the
I2S clock frequency. Reject it before performing the validation.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for zero frequency since freq is unsigned. 
Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 8cd5ddf62d46..c9e80ef42f60 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1287,6 +1287,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (!freq)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0


