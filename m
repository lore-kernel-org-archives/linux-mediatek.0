Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989CCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 22:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SmBV4deeDPKyjBTI6VOwAs2OLiYnSvqR0vCsZdiw60Y=; b=HBJgyKsGZGg7mP
	TtAsnflNEqo+5y9NkNlJpNmlopHevjvx/u0Ub9E3C9oO09WybRuYIthtj2DjSPCGlawLN8eaIu3Ot
	YCid+vh9YAZ2+Ug57Ew8S7IdEFbybx71l5aG8ncB5ZvNu7bqQZdz5xPSFQKi+Ktfypp7cao7JcZ1I
	8JvxY6UQpUIsjXMjTmyOGDANl+NfcR2n9gR8D8fIglWWAfV3VtnoR8ReqB0tNzB/bUyRfKsRnJqxZ
	MZTH9axyXEonT/ZUhtf+c/ackdZAxGud0P9yDmZXc3IXqgAvCv4n3xPVi1VMsXVL+XgeVWCsi+OxI
	Il5bvCRY1PLwEDisSufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrpMR-002vtQ-6h; Mon, 29 Nov 2021 22:42:59 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrpM8-002vlh-Cq; Mon, 29 Nov 2021 22:42:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 133so15944016wme.0;
 Mon, 29 Nov 2021 14:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSJ69WXnC1WdVb/bXAkyJh3OPxw+iRBQYM0yKG9SCbc=;
 b=jxpzTHscIrNgspMXiFoVTJk0lBc6o0Zapq0FvaHXff2MvLPuzzp1f6YZtng2TbXySG
 TMwos1nkY+pX15tSV53a9Pg2NvdenlwbkSwMxXEArijQ0btkPpfCO28bpl/5dTLWVFPN
 t0ZeA8HG5XF8EAjNl63KhFZrJTyN7yRVOyIxZRAPjcc9YsH0BmVg8KzoFoi+OdIBCBet
 YBDEDDmgQ3LU+g7KvdjYoQ3dd+YxSgomukiWJIVBhj7t5x5jxN0EM3mKpRLwwaQN5MkT
 8jR/tWxjV8l+mrIJXbUb46ZZz5OI0Kj8FYNLvtc+HPI609Z5R82DOKyXYe3reEWRr7Ro
 zWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dSJ69WXnC1WdVb/bXAkyJh3OPxw+iRBQYM0yKG9SCbc=;
 b=PPF+AX48SgTvTDJLrpYQS0+5Bp8yYiHLfRmvg8+6H41tSYZyzmyOPVXmqyyIrOxJku
 othd1NW3TkaVd20dYfBYN0F3U9DtX71WaniYzE8WNQuhG+Z7SrunT4P2PgazgkS5JB8Y
 5efgtj5e5M8n83E2J5UbPnjZH/1iu64l4nlOArxdMU2SugITRgKTId0fuVlXgJJFT4Re
 /pmt/LM6jOkFBNuhzAaKuFDhANNF8tr5tACiCYglXF1l6xUnFwTFZBrb11Lx5opNztlq
 pqSKCgYc3vcGbJRoHwZZXJtFNqoYIDbLvqpTciYRaS5SDKNOrtrxIfuhRcDSYc2Ju4uT
 vVUw==
X-Gm-Message-State: AOAM532RCyC43xiwHHlNwKz1dDqoZwc0jjNhUoj5cDglHwzEJgaJfVv5
 1rb9OgoAybP2iA==
X-Google-Smtp-Source: ABdhPJzCmAftKlAJF7pKfmu2M4+OGjYiKrbAcjK/ELLGn47QwqrbukpbA9WU3WWxGyWtm9i+SJrvKQ==
X-Received: by 2002:a05:600c:4982:: with SMTP id h2mr887917wmp.4.1638225758085; 
 Mon, 29 Nov 2021 14:42:38 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id a1sm19126546wri.89.2021.11.29.14.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:42:37 -0800 (PST)
From: Colin Ian King <colin.i.king@googlemail.com>
X-Google-Original-From: Colin Ian King <colin.i.king@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8195: make several arrays static const
Date: Mon, 29 Nov 2021 22:42:36 +0000
Message-Id: <20211129224236.506883-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_144240_457193_B97C0E02 
X-CRM114-Status: GOOD (  12.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Don't populate various arrays on the stack but instead make them
static const. Also makes the object code smaller by a few hundred
bytes.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 8420b2c71332..c2543f4cffb7 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -326,7 +326,7 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int i;
-	unsigned int clk_array[] = {
+	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
 		MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL, /* bus clock for DRAM access */
@@ -347,7 +347,7 @@ int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int i;
-	unsigned int clk_array[] = {
+	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A1SYS_HP,
 		MT8195_CLK_AUD_AFE,
@@ -380,11 +380,11 @@ static int mt8195_afe_enable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int i;
-	unsigned int clk_array[] = {
+	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A1SYS,
 		MT8195_CLK_AUD_A2SYS,
 	};
-	unsigned int cg_array[] = {
+	static const unsigned int cg_array[] = {
 		MT8195_TOP_CG_A1SYS_TIMING,
 		MT8195_TOP_CG_A2SYS_TIMING,
 		MT8195_TOP_CG_26M_TIMING,
@@ -403,11 +403,11 @@ static int mt8195_afe_disable_timing_sys(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int i;
-	unsigned int clk_array[] = {
+	static const unsigned int clk_array[] = {
 		MT8195_CLK_AUD_A2SYS,
 		MT8195_CLK_AUD_A1SYS,
 	};
-	unsigned int cg_array[] = {
+	static const unsigned int cg_array[] = {
 		MT8195_TOP_CG_26M_TIMING,
 		MT8195_TOP_CG_A2SYS_TIMING,
 		MT8195_TOP_CG_A1SYS_TIMING,
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
