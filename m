Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4C9CA9EBD
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 19:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybYSdKsTtQmBTL9u8kO8sl68Iedi9IlFuOT60yw2EWU=; b=YckFbdv5ciWSZuK9fBCQ1Ru2Jp
	J/w4aod5D5HaU0zE+jSP11cLK2DHDyouJpFIC1exKEIB3p58RNwvWsmjEXBvG2FcCqtUiAPI8gPe2
	KRJJyf1fwT6ArUqYJHumLrFhFyO7chV0Nst/hExd4QQueG4ql6qJrgBtQf8f5qSIP3822vQwVovih
	4OzLC61pRRlUXEeM0omR8pK6VY2gF7s0YdPt5asxOpYGQp7JSxkl/k0hUvI8kElj1br3ZZAjwz6Ne
	gbhfk6s83J4pSq3yLsFlNhBXeq1YYawaG3yfcTAZuf06LMmYfaCMepsTy2VxKZWjiIn4l9askyRaA
	TkzDlqbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzfh-00000009NAT-1Msw;
	Sun, 11 Oct 2026 19:57:25 +0000
Received: from mail-qk2-x04.google.com ([2607:f8b0:4864:34::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzfc-00000009N9T-22lq
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 19:57:21 +0000
Received: by mail-qk2-x04.google.com with SMTP id af79cd13be357-93cbbaba944so83072085a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 12:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748639; x=1792353439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybYSdKsTtQmBTL9u8kO8sl68Iedi9IlFuOT60yw2EWU=;
        b=rCpwegb+Uw6DkVPOIBNGrvhj8cGpmUVo1wtcJk4m0VF+TvRNz9cGI9Setq1kroOpJX
         ViNC2fy6FBHhARPb3xx6XLzkqjQ3lzdWJLm4Gf8dhpTlakbUDkwYaDErxcez9XXtWzkC
         MzqPSdWnJpjqMKp8DCF8nAkjb7apNuAHw7auj50KFhHSODFngftMOiH8R2ZNHrr879rB
         G7mVdHe5lMNR6FAy4IEeJ/9nZMlt2TwLi51cb+yrtn+XAzzl2cNpKla97lV9YflQpG/T
         KfqkrexpNfp+b/sxFLucec843BhKvO/e6BUNBmpty0RivMZzqp77GwH+9fQEolKzPNoM
         f1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748639; x=1792353439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybYSdKsTtQmBTL9u8kO8sl68Iedi9IlFuOT60yw2EWU=;
        b=vVBgMLjAqAu4HVM1jT/SJcV3tFeCMXymvpwaZy5vo5qcxC0j5UpcKf6ORs35ZMeUjt
         mBxPqqEy1azKASTcKfNfXfpH94xJwjNhc2SJWXHQoR3/FH0KjkEMxrSxMrYARTeDrAYg
         N62xrTTumGfbLMZhd5IFzPja3QgZWczx/okAkEaFl6gZhhgInLq4reqGj5dvrDslsJVB
         X7RedTQ06PBdAZklXb9Z+EBtNFPzjET1pYtYVZ8tYnuMufzOKRQDWSX9k7oNHVaJ6WF0
         479p9h3705hbT+wzYpv0jrZPZ4y3aQn5h6ZkNa4qnUfM/iNqFoXZ2io1EdtUowh10PFR
         KliQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx70V4NXWBGWSkBA38p6dHTQ3XuXrTUkH4PqT/75fyP08vYR4RIEHIVDFBo8y4zknGuk4E44rm17IBNOdKxQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIq34d6z1u+keWqvVZ1VBuwu+Vhn8vehpoM2h5APE3X5Fie2IME
	R6q7Nm+ZJdIOEXBW0FNP8yrs0cpGrG8sijxSD/jpV+ZZINU65gBTy0gc
X-Gm-Gg: AYBFou1cbMGoZBY7nt0x9QWY/5WSksK3m49zvIw5YTIrv6IP72VSVFJNks3BnxWIecQ
	IOrhDTJvKAs26QwYl+fIAV3PvWxFlnla27utxapy6Xew/Z480n3/PnxX/H3cCgBoQnwqt7bUoMU
	XFbktv3XfYe90pTQQpgn5yIjIbxvawYXUZ6M4seGVD51/jDHO9/Uy3ZT5dXxSeAk5eA9mj1WwvG
	XatTfGcdkffpwCyUWgKiTX2js/5RctySW5XxTEmHtSN78Q/hM+3jdr44uh4R6hazny0lAN7pLrz
	7NJ0i8yYeo3q01+E88dyWTc9ZIbLdqTJ5ji7bR7GuxJuBjwePTvB5hLdx/8cfpkFO8vOJanp4bj
	x/+JPbZMjqep6RV04MhG5VLZMNHbciMX8Nvw2mHILIWt4zRGslen2VOhx4UkzmHbVAT5/kBEllC
	mMhnwFgbvg7eXySw0zK1eWij6EOzhccWS7x68S8ZxUqR+JkSZEIFaff+6eHd4P2sK11lo=
X-Received: by 2002:a05:620a:2912:b0:93e:a818:c8b1 with SMTP id af79cd13be357-93ebd0d01edmr1283130285a.9.1791748639122;
        Sun, 11 Oct 2026 12:57:19 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e832edsm77803306d6.4.2026.10.11.12.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:57:18 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mediatek: mt8189: Don't let the GPU reference mux retune MAINPLL
Date: Sun, 11 Oct 2026 15:56:12 -0400
Message-ID: <20261011195612.1663714-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-19-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-19-5df247f56938@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_125720_539890_3CABEEC8 
X-CRM114-Status: GOOD (  13.41  )
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

mfg_sel_mfgpll selects the GPU clock from mfg_ref_sel or mfgpll and has
CLK_SET_RATE_PARENT, so a GPU rate request (Panfrost devfreq) goes
through __clk_mux_determine_rate(), which evaluates both parents.
mfg_ref_sel is a MUX_GATE_CLR_SET_UPD() and so also has
CLK_SET_RATE_PARENT, as does its mainpll_d6 parent: through it, any GPU
OPP can be met exactly by retuning MAINPLL to six times the requested
rate. mfg_ref_sel is parent 0, so it wins over mfgpll whenever both match.

On an MT8189 Chromebook, MAINPLL therefore followed the GPU: 2340 MHz
for the 390 MHz OPP instead of the 2184 MHz the firmware sets, and 3360
or 3570 MHz while the GPU ran at 560 or 595 MHz. Everything else derived
from MAINPLL moved with it: the peripheral and memory buses, and the
display PWM, whose backlight frequency jumped from 2 to about 3 kHz for
tens of milliseconds under GPU load. That showed as a visible brightness
flicker.

mfg_ref_sel is only the reference/bypass parent that the mux notifier
switches to while MFGPLL relocks. Don't let it propagate rate changes,
as MT8195 does for its top_mfg_core_tmp. The GPU then gets its rates
from MFGPLL, and MAINPLL stays at its firmware rate.

Assisted-by: LLM
Signed-off-by: zoan37 <agentzoan@gmail.com>
---
Found on top of v6 ("[PATCH v6 19/27] clk: mediatek: Add MT8189 topckgen
clock support"); it applies to that patch and can be squashed into it.

Testing: Lenovo IdeaPad Slim 3 Chromebook (MT8189, "quigon"),
next-20261008 plus this series and local board support, Panfrost on the
Mali-G57 with devfreq. Before: MAINPLL 2340 MHz at idle and 3360/3570 MHz
under GPU load, read from clk_summary; the display PWM's actual period
(debugfs/pwm) went from 500 us to 348/328 us with it. After: every GPU
OPP from 390 to 1100 MHz forced through devfreq min/max_freq, and
scrolling a busy page: the GPU always on mfgpll, MAINPLL fixed at
2184 MHz, the PWM steady, no flicker. No device tree change needed (the
mux selects mfgpll by itself). Built with W=1.

 drivers/clk/mediatek/clk-mt8189-topckgen.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/mediatek/clk-mt8189-topckgen.c
index 6ed7661119b8..ff9fd5115c5b 100644
--- a/drivers/clk/mediatek/clk-mt8189-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
@@ -818,9 +818,13 @@ static const struct mtk_mux top_muxes[] = {
 			     dxcc_parents, 0x100, 0x104, 0x108,
 			     24, 2, 31, 0x0c, 1),
 	/* CLK_CFG_16 */
-	MUX_GATE_CLR_SET_UPD(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
-			     mfg_ref_parents, 0x110, 0x114, 0x118,
-			     0, 2, 7, 0x0c, 2),
+	/*
+	 * Reference/bypass parent of mfg_sel_mfgpll: don't propagate rate
+	 * requests, or GPU DVFS retunes MAINPLL through mainpll_d6.
+	 */
+	MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_MFG_REF_SEL, "mfg_ref_sel",
+				   mfg_ref_parents, 0x110, 0x114, 0x118,
+				   0, 2, 7, 0x0c, 2, 0),
 	MUX_GATE_CLR_SET_UPD(CLK_TOP_MDP0_SEL, "mdp0_sel",
 			     mmsys_parents, 0x110, 0x114, 0x118,
 			     8, 4, 15, 0x0c, 3),
-- 
2.43.0


