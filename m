Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B84C982E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfP1uEXGcD/7otSfEPp8la4bNX0YkoLMLW/Ix00hlGk=; b=EJiOqN1pjPAFTxXFpCZJBTWdiU
	/dPqiRjnIq3SifTPfzmhheqqkUeEWx7o5rkzihibVrfZnI8Cap5zP3RSxMFDD6T8LMccrdNng7/d8
	A7HIMbuoM8nQ9s/m0YEdfMH0VYJFYpD4aSU9UeuiluDcAJdIKhVdrIh/dAELT/8IPKFbCVjsdpp+h
	rTX6HKuTut0ypUZwvJWlIOGMhoHjvrxr7bDa5HtB6OOw3SkM7v+Z4kMvIVrrGZMEzlgUAsn/vRk2d
	vXUqdrLYOe/PUEC9DPe1v74fPL2kNIgruhQasmzhLc7e3Gb5bRql7A4oE57toSkPY6Z8Dcwt5kqIG
	n9ZEy9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDT-00000001gaV-0MHt;
	Mon, 21 Sep 2026 10:25:43 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDI-00000001gUT-1Inl
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:33 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469e211a0so3048809b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986331; x=1790591131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfP1uEXGcD/7otSfEPp8la4bNX0YkoLMLW/Ix00hlGk=;
        b=qb1sZj3Bea15a5BB91Ve4/JUW6frP+3O1XPoE5rSVpx0il52CNhXkQwFV32NVbaUAT
         5zPwIRz2mX1oWrrsslp9PSaMKwEJJolJBHq/EnbC88ZTXFgASgBiJf62FkqiYFGdRJBW
         fsDqWq0cNlDIbtaYdNKvwX1Y1nUCU0h/x/OQX/TmnOaf/uoDjFz63cV4ejU16gqdwbMh
         YyNqCdhyG+KJNHS5InzQLWm79MEiBMSl/L8YVSByhDIcIOdtRspV9+kVWcANqrdMgjJp
         12WFEmAEjpTZcHrRT2S2Friwx9kp3nfRBZZOCZ5q/N5oVeg9NB6WwxTviLR/lZ0mv4GT
         tW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986331; x=1790591131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfP1uEXGcD/7otSfEPp8la4bNX0YkoLMLW/Ix00hlGk=;
        b=bGvdsDc4Z2Yx6UaCGWKv0AGRi7uvYDpaRh1fDMVxvMCh1BqdbD+PREHD3fAPlSouj2
         72wrxwL27Aqswes6lAhUi25ZK4ep6WS4QCpSA4fpSM+kj+5tiwqT9iVfrjCt5ABxxGMR
         o6LHoES6ZvNhtQlZcItFPvh2L467qFRjpFrLG2psdwiEACnN8zg1KkCkHa/gy2BXdhx/
         LArOqDjp6KxcrnV8QKYWdkp4/qt8HdJpkVyQ9/7h0ccZH4v81xKwExA3LCKWoQlQO2CJ
         lmu5VzM6m9Dvo3lfLpFIlm39ziPvLuZDn+qlIzsatD3njz8CSdzxEFK0EzS8UYrvF85O
         h/+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPypKO478Q9fAJkFkgMLYaIbJtZL8QR8qz0DaFSUN0G4R89vwSWzO41j1hK3KolCEn8E4QwVuAx8vK3+CrsQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mvlFuh+ZwAdBax0LtnLmtZS0wjhLBS5/suPGNDOtia+GsGRRU6
	F1FCy1e9p30OU6IZ4WMHEgBjSUurTDETWeIyymIk00O7NrmgYP6B5zzJ
X-Gm-Gg: AYBFou0QA+hNYY6PNB80plOV3/zxlhoS4eOstWs+ioQHTQY/ihLua4kUt9tA26nVhjn
	cDJQEHBRh/BdVYvpEVroPmRa2njlemhks+pYciSDh1qRP+MNKunxBRAKFMH7ft4V01BK2eMZ33f
	tuwguo3LxLb2Mdft29qEFX9HvSo2z5dkSGd/RdPLj2Qjzmm49wplsjfS8nL6jGLgT8Laf+18wm/
	Z1zmJ2g4EODq9ROwhWtbPshhaWAPt4YfXtyMLsoUVU4islxBt2t+XNRDbKmV3cFnPTYlbwSEfzE
	tTW2FSCiFMBfMgvXc+57+ePaBSBTOOL9zcTvamcfcnie1Kbw3I6o6d9Cr5JQmFk26oJEO4ZzfpE
	pf1yxQpF54vKVrYh5HFrAAyl/cto75wXKZXoppuoDJ3va4sQ6358CM6BhePN+/IM914o9CKtlL0
	aAZHuWwe2VRxZmKfK/Ok8WiHextykgoA4sXlXp1l92hCpZNpENJObcQi7Q2vOSnyFr9ZiJt98+T
	X9hr520HY+QijaaAKE3oHntRgJkUqrZncfYkxc=
X-Received: by 2002:a05:6a00:1943:b0:878:3811:239 with SMTP id d2e1a72fcca58-87838207541mr6896051b3a.53.1789986331385;
        Mon, 21 Sep 2026 03:25:31 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:31 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/6] clk: mediatek: Fix MT6779 clock onecell IDs
Date: Mon, 21 Sep 2026 19:25:17 +0900
Message-ID: <20260921102522.1640072-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032532_360646_4EF310A7 
X-CRM114-Status: UNSURE (   9.87  )
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

Add the missing dummy slot for clock ID 0 in the MT6779
audio, camera, image, IPE, MFG, multimedia, VDEC and VENC
clock providers.

Also register the missing SSPM infracfg clock and reserve
the binding-defined MDP WDMA0 slot in the multimedia provider.

This fixes the onecell clock data allocation so all registered
clock IDs are within bounds.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6779-aud.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-cam.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-img.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-ipe.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-mfg.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-mm.c   | 2 ++
 drivers/clk/mediatek/clk-mt6779-vdec.c | 1 +
 drivers/clk/mediatek/clk-mt6779-venc.c | 1 +
 drivers/clk/mediatek/clk-mt6779.c      | 1 +
 9 files changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
index 30c290fd6b84..6be054816a4b 100644
--- a/drivers/clk/mediatek/clk-mt6779-aud.c
+++ b/drivers/clk/mediatek/clk-mt6779-aud.c
@@ -33,6 +33,7 @@ static const struct mtk_gate_regs audio1_cg_regs = {
 		&mtk_clk_gate_ops_no_setclr)
 
 static const struct mtk_gate audio_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "aud_dummy"),
 	/* AUDIO0 */
 	GATE_AUDIO0(CLK_AUD_AFE, "aud_afe", "audio_sel", 2),
 	GATE_AUDIO0(CLK_AUD_22M, "aud_22m", "aud_eng1_sel", 8),
diff --git a/drivers/clk/mediatek/clk-mt6779-cam.c b/drivers/clk/mediatek/clk-mt6779-cam.c
index f397b55606de..35c313b48b16 100644
--- a/drivers/clk/mediatek/clk-mt6779-cam.c
+++ b/drivers/clk/mediatek/clk-mt6779-cam.c
@@ -23,6 +23,7 @@ static const struct mtk_gate_regs cam_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate cam_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "cam_dummy"),
 	GATE_CAM(CLK_CAM_LARB10, "camsys_larb10", "cam_sel", 0),
 	GATE_CAM(CLK_CAM_DFP_VAD, "camsys_dfp_vad", "cam_sel", 1),
 	GATE_CAM(CLK_CAM_LARB11, "camsys_larb11", "cam_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6779-img.c b/drivers/clk/mediatek/clk-mt6779-img.c
index 474a59a4ca9e..b5efc2cfe189 100644
--- a/drivers/clk/mediatek/clk-mt6779-img.c
+++ b/drivers/clk/mediatek/clk-mt6779-img.c
@@ -23,6 +23,7 @@ static const struct mtk_gate_regs img_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate img_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "img_dummy"),
 	GATE_IMG(CLK_IMG_LARB5, "imgsys_larb5", "img_sel", 0),
 	GATE_IMG(CLK_IMG_LARB6, "imgsys_larb6", "img_sel", 1),
 	GATE_IMG(CLK_IMG_DIP, "imgsys_dip", "img_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6779-ipe.c b/drivers/clk/mediatek/clk-mt6779-ipe.c
index c2314654f43a..284d5adb8a6e 100644
--- a/drivers/clk/mediatek/clk-mt6779-ipe.c
+++ b/drivers/clk/mediatek/clk-mt6779-ipe.c
@@ -23,6 +23,7 @@ static const struct mtk_gate_regs ipe_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate ipe_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "ipe_dummy"),
 	GATE_IPE(CLK_IPE_LARB7, "ipe_larb7", "ipe_sel", 0),
 	GATE_IPE(CLK_IPE_LARB8, "ipe_larb8", "ipe_sel", 1),
 	GATE_IPE(CLK_IPE_SMI_SUBCOM, "ipe_smi_subcom", "ipe_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6779-mfg.c b/drivers/clk/mediatek/clk-mt6779-mfg.c
index 21793cb6e6e3..dd7d98d7de7d 100644
--- a/drivers/clk/mediatek/clk-mt6779-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6779-mfg.c
@@ -24,6 +24,7 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate mfg_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "mfg_dummy"),
 	GATE_MFG(CLK_MFGCFG_BG3D, "mfg_bg3d", "mfg_sel", 0),
 };
 
diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
index 30bbab308388..3b3053385021 100644
--- a/drivers/clk/mediatek/clk-mt6779-mm.c
+++ b/drivers/clk/mediatek/clk-mt6779-mm.c
@@ -32,6 +32,7 @@ static const struct mtk_gate_regs mm1_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate mm_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "mm_dummy"),
 	/* MM0 */
 	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
 	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
@@ -76,6 +77,7 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_MM1(CLK_MM_26M, "mm_26m", "f_f26m_ck", 7),
 	GATE_MM1(CLK_MM_MM_R2Y, "mm_mmsys_r2y", "mm_sel", 8),
 	GATE_MM1(CLK_MM_DISP_RSZ, "mm_disp_rsz", "mm_sel", 9),
+	GATE_DUMMY(CLK_MM_MDP_WDMA0, "mm_mdp_wdma0_dummy"),
 	GATE_MM1(CLK_MM_MDP_AAL, "mm_mdp_aal", "mm_sel", 10),
 	GATE_MM1(CLK_MM_MDP_HDR, "mm_mdp_hdr", "mm_sel", 11),
 	GATE_MM1(CLK_MM_DBI_MM_CK, "mm_dbi_mmck", "mm_sel", 12),
diff --git a/drivers/clk/mediatek/clk-mt6779-vdec.c b/drivers/clk/mediatek/clk-mt6779-vdec.c
index 458d012f023c..1e4922f8a037 100644
--- a/drivers/clk/mediatek/clk-mt6779-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6779-vdec.c
@@ -33,6 +33,7 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 		&mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate vdec_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "vdec_dummy"),
 	/* VDEC0 */
 	GATE_VDEC0_I(CLK_VDEC_VDEC, "vdec_cken", "vdec_sel", 0),
 	/* VDEC1 */
diff --git a/drivers/clk/mediatek/clk-mt6779-venc.c b/drivers/clk/mediatek/clk-mt6779-venc.c
index 70cebc274031..0d3ffdf50beb 100644
--- a/drivers/clk/mediatek/clk-mt6779-venc.c
+++ b/drivers/clk/mediatek/clk-mt6779-venc.c
@@ -24,6 +24,7 @@ static const struct mtk_gate_regs venc_cg_regs = {
 		&mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate venc_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "venc_dummy"),
 	GATE_VENC_I(CLK_VENC_GCON_LARB, "venc_larb", "venc_sel", 0),
 	GATE_VENC_I(CLK_VENC_GCON_VENC, "venc_venc", "venc_sel", 4),
 	GATE_VENC_I(CLK_VENC_GCON_JPGENC, "venc_jpgenc", "venc_sel", 8),
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 4b9dcb910b03..70d8a970b5bd 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1014,6 +1014,7 @@ static const struct mtk_gate infra_clks[] = {
 		    "fufs_sel", 13),
 	GATE_INFRA2(CLK_INFRA_MD32_BCLK, "infra_md32_bclk",
 		    "axi_sel", 14),
+	GATE_DUMMY(CLK_INFRA_SSPM, "infra_sspm_dummy"),
 	GATE_INFRA2(CLK_INFRA_UNIPRO_MBIST, "infra_unipro_mbist",
 		    "axi_sel", 16),
 	GATE_INFRA2(CLK_INFRA_SSPM_BUS_HCLK, "infra_sspm_bus_hclk",
-- 
2.55.0


