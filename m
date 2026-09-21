Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0220EC982ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zghCP5qddDssD+/Zn2nncsxv0muFxosiwEXR8TK7rAA=; b=caHtGJhSS8iJ2A+j6byC7bGBxr
	CJj2+ngiL4LbQlMOyDnb/ebk4b7RuMsodbdx03T5NhWE3JbC4antOMJ2xah6cmCiweF8SikXWbBBt
	nRGH0p8tiYzhi5j+q9a549cQaJ2fRrb0dB6VyNnmTRztYzCeKSH/wfVkdciqnCTsabU0P2NM3NR20
	CmmhQ1Zg1jsIB0GYXUjMug3ePmy6tKRlt1YSzXBdghZI62e8ehI6q9+u4XWw2bI8jbKg4YIgYiLzJ
	fA4E34/yEtw9GA2KF+8jCE/Yh13ODlsz+B7s10pEz18CC0CWl6r0U+7hu/jhz85OWNq9pX1BGCK4W
	9JtUBosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDT-00000001gb3-1tYq;
	Mon, 21 Sep 2026 10:25:43 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDL-00000001gWG-1U7x
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:38 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8692a856865so2558235b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986334; x=1790591134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zghCP5qddDssD+/Zn2nncsxv0muFxosiwEXR8TK7rAA=;
        b=MXoVq3rCFSVn6c2+zuOQK+G1iUsofgyLm/DR2JAC3fb8ZTh0eivHBTS3Z5wHdKVfHW
         cvil6FOpmjK6+jAvNu0sbSwpUkYd2pukqXUMCmfn0gofgQ+cfX2E28ppBbxOQh/IGuyE
         8l5veNINRaEo3PPjZwIKYyG1Na4yqlG8ecKu9EfITDKCuMlhaVJypJiWUMu0Ftxstcpx
         p57gL/N+Fo/9t6ej6u99YxCWfpwNW+0kNnj81ZXreelx8nhJn84JDT+isw4WMMDUEexL
         aFEGYJn5b6sX150+WRsLoPioFVoG/KzR4ZYCw0Y6v8gQ13zcL4n81C7IaJgTHiZmd4Na
         GhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986334; x=1790591134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zghCP5qddDssD+/Zn2nncsxv0muFxosiwEXR8TK7rAA=;
        b=wKZWj3YLPNx9Rb7HnUYN81IdtjQah2UfNvsPAyAwS5lya/hOHe6FYhdWGtBLtXiVMg
         FwJOlquevw7TTn00eKnOaSxuXtBiSaQSTowJPGQHpG3Dh9+SvjdCMglFrGF+LBN6DbK6
         bEl5gG0T7WpJ+5Devxo0jeVpkb2ykHRteobiWlfzVo4e52+dDutZrb4hsgnujesKWhBx
         CUoi6tboqDyEwv5p8G6grrW7eKlI6PYMOXoxYsJEc7FVDXD6/4byIzzLoLfzxDV53KU4
         BnkMyvr/C7v4wknSFozjuPVGDLI71e21Fzu7unEZgrMtXNC6O9YCOLi9QzdN9Q8rm7A/
         AHfw==
X-Forwarded-Encrypted: i=1; AKwUvBwg/UmXRUBZ/nwfJZRKtWojTpLVDsTHxzahAOFhkDE1vn+l2D5cvzNFrhjts2fyjkm5i72NKAtnPw8fdMeAxA==@lists.infradead.org
X-Gm-Message-State: AFuF++nRjz5tE7s7DLg707G3BrCbiPDfM0g45czLDOei3nuS5SZ7NK2t
	EIKYEXOGNesUCe0qsp09x3iBdWZ9bvUYI8aLCYIVb8nBJ4Ei61FRU6FO
X-Gm-Gg: AYBFou27Kc/34kyrZ9vzJBH1a/S5jCWwePQVNXteOqCwgMdaoB4OibifBCQD3+IuBPM
	4HeJZEJXBFvCFLBc+ZEKu0XYB88yjSYQQB2NW9Hu9d8bqrJtlOG88oBfKRoVKnrIwhqfF5rP+Ws
	BimJMN0dCIK6Ts5yIaxtHnGwgj1hvoxfQengamm8V6T7Rnjdoi3ouI8U6Cay9bGQQ7rwBMKhHHO
	zK/uQIvow/kJ8TD5jx8Weai+pC2aUbvoLq0rZaoTjbs3H0P5lgYO+RNFmcoPv1/OjlSjt1NJluv
	TMQlKdsVU9ZoO/wf8qbBujK6nIuJnKca49vgR/JlbCX3kHnCm2GBy6i2C2zMOah5BYyect9eCCk
	adS56uEF2A3r95ay7bWBDGAMIKjC/ZWEzgUwJN7vkOYosi4hfRT88rPLNOiSot59BztQKF4CBmk
	tpGwVmo0IhsWYriC2jGdjV5gPKzlHVqVA/FuJxBN9BtOlJokEkeaXi7XFAcGRf88TcinXMbxSnR
	ZoilR2DHMFDTudZz9oM0Y63Q+xDWdlXE46dxOY=
X-Received: by 2002:a05:6a00:32cb:b0:874:705d:f655 with SMTP id d2e1a72fcca58-874deafb8cfmr14424938b3a.35.1789986334443;
        Mon, 21 Sep 2026 03:25:34 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:34 -0700 (PDT)
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
Subject: [PATCH 2/6] clk: mediatek: Fix MT6797 clock onecell IDs
Date: Mon, 21 Sep 2026 19:25:18 +0900
Message-ID: <20260921102522.1640072-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032537_004276_E5DE7DA9 
X-CRM114-Status: UNSURE (   8.98  )
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

Add the missing dummy clock at ID 0 to the MT6797 image,
multimedia, VDEC and VENC clock providers.

This keeps the descriptor-based onecell allocations consistent
with the binding clock IDs and prevents out-of-bounds accesses.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6797-img.c  | 1 +
 drivers/clk/mediatek/clk-mt6797-mm.c   | 1 +
 drivers/clk/mediatek/clk-mt6797-vdec.c | 1 +
 drivers/clk/mediatek/clk-mt6797-venc.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
index 338c69234f24..2a42ec0a4b14 100644
--- a/drivers/clk/mediatek/clk-mt6797-img.c
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -20,6 +20,7 @@ static const struct mtk_gate_regs img_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate img_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "img_dummy"),
 	GATE_IMG(CLK_IMG_FDVT, "img_fdvt", "mm_sel", 11),
 	GATE_IMG(CLK_IMG_DPE, "img_dpe", "mm_sel", 10),
 	GATE_IMG(CLK_IMG_DIP, "img_dip", "mm_sel", 6),
diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
index ddb40b8a1a7d..d2349c1d2a55 100644
--- a/drivers/clk/mediatek/clk-mt6797-mm.c
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -30,6 +30,7 @@ static const struct mtk_gate_regs mm1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate mm_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "mm_dummy"),
 	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
 	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
 	GATE_MM0(CLK_MM_SMI_LARB5, "mm_smi_larb5", "mm_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
index d832f48123f5..73339310fb51 100644
--- a/drivers/clk/mediatek/clk-mt6797-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -31,6 +31,7 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate vdec_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "vdec_dummy"),
 	GATE_VDEC0(CLK_VDEC_CKEN_ENG, "vdec_cken_eng", "vdec_sel", 8),
 	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "vdec_sel", 4),
 	GATE_VDEC0(CLK_VDEC_CKEN, "vdec_cken", "vdec_sel", 0),
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
index fd4446f4a9d7..f616d61a0de4 100644
--- a/drivers/clk/mediatek/clk-mt6797-venc.c
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -22,6 +22,7 @@ static const struct mtk_gate_regs venc_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate venc_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "venc_dummy"),
 	GATE_VENC(CLK_VENC_0, "venc_0", "mm_sel", 0),
 	GATE_VENC(CLK_VENC_1, "venc_1", "venc_sel", 4),
 	GATE_VENC(CLK_VENC_2, "venc_2", "venc_sel", 8),
-- 
2.55.0


