Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D22C9830D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 04:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=; b=tMbHsrsvbsSEtcPTfSn5DgcnIw
	PwB/f9SVSBi2N5AUjT8GHm6jzPynlgTEyp/zMcuJDFrebk4UZAQ7Uk1CrrFOmBh6fg+/Aos+EBON/
	E+TjCY/HhC3UuY9g8ycrgeTFnJR2rIFLbgx+r0EYY5f8xujqDA/aQDorNuntiaxjbnGmFh/DIp8ob
	KO2HiDXtaZTNwkZGRT+h/BlrmBXJV6jmVbuDZa9/wwslES8O0PxxSBy9cAmXgSnQce/o/cHMf6wHK
	hsTqSEzEBnrere7E7AYajjz8gfmygA/ley6cMj1w24OFeAkVUBqg4zKVQ5QzaRcQR29VAptTnxYn3
	OnaJGaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtj-0000000Ce1b-2ee2;
	Fri, 25 Sep 2026 04:50:59 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9xtQ-0000000Cdjj-0AB0
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 04:50:41 +0000
Received: by mail-pj2-x0c.google.com with SMTP id 98e67ed59e1d1-3a0c52f9a45so13736a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2026 21:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311839; x=1790916639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=qdrHQGi2F5W1RvDbIqLpDmKOkrel3H1CUQbxWgUdWQce5rWo1YoF/ZPfQbjeIDwJNK
         FMMJ1SD9upmYtX5+ymBOhPLfxj4veE4l/J4N17pOZe/vfo1E4ujsYXqC2T1vcH7yqMDd
         MBlaoniwhKtrHTnPycvlRgCFgiT9NKI2vIfHFRa2T0FDziXJLKt0cdMoi1P5EUVYPmU2
         oLfwfSfERoWpcUiS21n8zUrgZZjgy8KNjVUViKX3xsI2dD0TZ/MBaI27Q6guexaS/Y7N
         HUwGswshje/Q45wgCaDi/VaolnSP65N8bOKHgDUXh9oO6BtWFaQn9MM/kHFjPDiQd6+t
         4y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311839; x=1790916639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOBRYOJd1nqgIrlYjIP4hj2rZhjfdBykcJZsmW1nWNE=;
        b=bfN5y8xGqapEPT8x8Q+mLQmufHDG9EF/8lU5JNHlrHCzakEebd2ykRK5c+vY74h98a
         f4UFmeB8/S+mcgozSruwM8JDgmLBfIvDXcNUITM3I29cYRl++YZ8se4o8nJPURkNxQ+R
         PzByhMXaLDmH4tR6seMQXRnAKEUPJVWkpBPQ5hLUfrxRGgRXD36qMZcOiapQmoYZ2djc
         FfcE9TEo2n/8imvAt4tv87IohDRQZgYD+BjvdlouoEhBux8TpZ7hIeuRir7aMfpxZXHH
         OcICUHcyX2ULvekEr9cLy2EJK+wGanzo6Kx7NJxCw+JKMGD8ZSB4gxrh+37ChWavWGGo
         xtHA==
X-Forwarded-Encrypted: i=1; AKwUvBwgZWmlfsdltWhORsAOtZw/zHariN8Fg/7xLnrNSOvm+07QQ8+qdAJF8tKfzWeW5KJmxTpFGtpT+yWMSWVd5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++n8wSHZAXp/FfsdioWA2S6R2cM2vJfwR37zJ2q86vvaR4q0jWJh
	FGnJMCCqKEn1WyI+GPB2fHbgI8909xv5dolQPZ7iXjNRzFnRwKo45GYf
X-Gm-Gg: AYBFou36caAM6JMg8+aKlYvvp5dMZxQTW2B4gvxnAWq8iPKYmaap3PMIbGT1t2fuP4N
	d7WLPvvOBiuVSDVvgDj8OJca9lKmwXfCEH96OLtqcPnjlYHZynQrvl+MvS8ff1lM4Iw92YAs0Cz
	oFkfp+ZcEAh2PeDwZvc2Zi3S+EiI8GsHLW11FvdzxYif+vHVjiCE43Qk+g1qpE733mQ9BnUCOau
	YwD4ft/zl3/O7UhMJ1RsPZVJXbB2UnqPe1BPFn9B7G/FQw9hHY6XcCjYvv17TtY/VclyK49p0vn
	UvmRwa3RoshcnD4B8o0qrAqfG41/g1O5SQE0mUtBb8VVxnik/9mgieD9+nVBXUxAGW87ty3XcPY
	1C6kTLoDoW/7K5ZsAB1Hov3AXBBIYOtC+2uKsJkEAfW6wUeUJXcmy4htW0KdnIQIP2dyiRYOEu8
	Z7aJ5OCPax3XhXCpbpfZcVT/E0RBZz/Lw0YF9a+/a0ZB/IO14icxxd1I/OvduAPF0jpCmVdkshB
	fYZgBEsO0ZVUnej7BFbbDboYPuZhO4OgWbSwpNC6MCbq2Fj8zTZMaWfZNuwBOSjq3YD964TbNZx
	XgSlOktsU+USXje3qiifnzvh
X-Received: by 2002:a17:90b:4fc2:b0:3a0:c276:1ec2 with SMTP id 98e67ed59e1d1-3a0c27621c1mr188132a91.19.1790311839074;
        Thu, 24 Sep 2026 21:50:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:38 -0700 (PDT)
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
Subject: [PATCH 10/14] ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
Date: Fri, 25 Sep 2026 11:49:04 +0700
Message-ID: <20260925044908.450775-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_215040_088712_B0A627EC 
X-CRM114-Status: GOOD (  10.59  )
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

Propagate errors from mt8195_afe_enable_clk() when enabling the
ETDM MCLK instead of always returning success.

This allows callers to properly handle failures when enabling the
MCLK.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 1a20adb2cbf5..fba51c552eec 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1549,9 +1549,7 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
 	if (clkdiv_id < 0)
 		return -EINVAL;
 
-	mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
-
-	return 0;
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
 }
 
 static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
-- 
2.43.0


