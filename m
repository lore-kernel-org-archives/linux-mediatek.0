Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA032CA9EC9
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 11:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=; b=Sn1gjoYkNsrSzgopiTYCHYkXwM
	Stjooyn+avglXHCA5XGDvI2ljNAcXktc+Ij4DFyM/IUwjUXqDxRZFwq3K6PIG1jmC3OheuYWCipIo
	56gJ1GgYyJ1AeRPQ35C7A4HYpkfELK1PfASlUUOFQM2IxWMGGBjgou1/jhpI5FW4d9W9SWvfsb2Fi
	tNxcEx/fValFsc2S+JmhShfdzUYQV/f8bA4eGQycNYE1BInG0P1GkzLlS33yxDcRKaJgQ9HePM6Fd
	GlK3/fyjUjoBB+yCrE2ejMCxcR3gNcqTK5SBbz+sjEZWQaqMasN2LP5Rkfl5XhxO2KXMTttCci4ON
	hKiNE9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVhD-00000007ybQ-1K6u;
	Sat, 10 Oct 2026 11:56:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgQ-00000007xvv-1txx
	for linux-mediatek@bombadil.infradead.org;
	Sat, 10 Oct 2026 11:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=; b=a/2OhwGlJQUYYG7B/W3xp07tNM
	jSg5WXyYW/ofqrIxb5ElGvetbLba3v4s+a7n7l7sql6wg4CmDv7qtf7E4deLNr8mr1qwp291D0n5T
	ZRU0a1lrxPGF2X5yaaPqSD0opHXKcMJgz73gnNQxQuxl2cD2atHGPPQij52edEsFgWiSnXhQQN+2n
	j1a/HuiI6Sz7kTQAYThP1yl13ThUh6yysG53nq5rQnNZo9AQ4pZpuShv5mi9f8mnyhZ04kXY24Vms
	yTGivOd/RhV4H5dO2yj61ts5F+qqntBs4CtasjYW2pDE8LbdoYPW3IXksA5tFI1qPac4BVDLRflOd
	r1xhApWw==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFVgM-0000000C4pF-39nS
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 11:56:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48b02a2359aso488695f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633365; x=1792238165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=;
        b=XiWK5TcS/mZcI/gcJsHdFt3bVN6aLr1BBZ68cpATlZhwj5BI/yEgRfT4A1hHcwY3sz
         U/WL1ROwXrTAmgUyDPTpU2c/i+Z/ojTN2qxlML8YuyXHtgr1/8W2nevF7CA/43/RydCa
         ARySBmcKCR1haASdlHIurgp70DA4cKCX/N25GPSjvcZVFwZCX9fzbKWkL4vtnv2XFF1X
         rSpnVf2dK8CKCeg4iRBXnJXXWML2pQppU3yKaCGiWzfsoxXpzW6ZGPoOCdsqv8JxyjD9
         RFGnVCD2a4QRt1taI+W2fCks2rvMwvYyk+8iopCA3VrlaY/uzwRjLmO+q/E6EEEZwN/D
         Q3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633365; x=1792238165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=;
        b=UhXgmzZ6qEEA3B0h2JJsk0aWqXfR569aPAvjwWiHfNDId5KJaG0oYeiu8sbnLB0N0+
         tL499eKq//AJtTXp234hhQf3G+LbpjbqclMzNvxHZb+5Tbn6w27vM37JBmqM6faX6+yO
         mxxOTRR6EwlahXh8AACJJktlc0IiutE1sRq1ShqOVaZhVbRBJk7qf2sc5Hs9Nm3M9oFU
         72awUs9Fj9QZbx3N/of0YH+Aaqt6TkXTSTNj8Qx9tUBbI+bfvc+SQw9ll4C1xi9uZR5B
         wuxXmyq/0+NiYUsxSdg+hTAoAxuDdCLcggNKbpPgEvdwnV5oKXge3euQWBRKrZMaIZe8
         0ptA==
X-Gm-Message-State: AFq9FYL7OrnqjT7AVnK7lH9YpXik98+8WPa06b+vDTvgnPRhQUc3oKSt
	l49ivVITpBuqPKYWr4IFCT+f+XDKbNJYdHIuWkKP+edoY60qbvwwZQgkdJFmDIO5
X-Gm-Gg: AYBFou1ly8EQ4dnmWuGIpHfqL0lru99J8vhNuCDD8TpbG+docy2Xcyh60sE8X+E1qdi
	rWi1RCowOdpN9Pp00qrZt+pJeGriclwEOKvvB/BN79WlRSUvYaJwfr+kp3H0pau3Be4OB3oHZd4
	c7PMJeDeDYvaKhnJlTVMfqzeESiO/ZeY7FSe2W4KUSDNpmk6mJjEXDZzbt2JVkZqxvmskludWe9
	ZejoYGM4AxdvDrGiABP5xAC/jreMkAd/UuAtCkzFwkoDdOMJX4EwWWovobcEty0j95EfXsrabTg
	0xGrpVQBsPV2h/aVcfqW8vgbHM8K5qPPDgAqJr5arCVYqTpv3JlddxBy2yAdB3wlAfQvQoR1QW9
	QMMRk2vUFFKdUG3OQK5aSAz1Yho4SFaWjfVCIlFo0MhFqnE4twHYhcdkjp3r2VqP5cRB5miA1mf
	N8SDTj+7z4VeG/VSz/IocY1kkigA0Q3xd0KHWZepK3AJuNCV0F9X154ujvMDZh+5LBbg==
X-Received: by 2002:adf:e00b:0:10b0:48a:fff3:f9c1 with SMTP id ffacd0b85a97d-48db9482030mr6898560f8f.20.1791633364955;
        Sat, 10 Oct 2026 04:56:04 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:04 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] clk: mediatek: mt8167: Correct HDMI-related clock definitions
Date: Sat, 10 Oct 2026 13:54:04 +0200
Message-ID: <20261010115539.9237-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_125606_854679_A4061BD8 
X-CRM114-Status: GOOD (  18.16  )
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

On the mt8167 SoC, the tvdpll_ck clock is used to clock the DPI1 pixel
signal that is hardwired to the HDMI interface.
The clocks used by those two blocks must match and they have to be changed
according to the mode clock appropriate for the display resolution. Fix a
couple of issues with the current HDMI clock definitions:

- The hdmi_ref divider references the same register and offset of its
  parent tvdpll. Make sure to flag it as a read only divider as its rate
  must be set by the DPI driver only.
- Both hdmi_ref and tvdpll_ck derive their clock from the same tvdpll
  parent clock, but its rate must be set by the DPI driver only. Unset the
  CLK_SET_RATE_PARENT flag that is implicitly set by the FACTOR() macro.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8167.c            | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index 3e8611991de7..a7d38c194759 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -87,7 +87,7 @@ static const struct mtk_pll_data plls[] = {
 
 static const struct mtk_clk_divider adj_divs[] = {
 	DIV_ADJ_FLAG(CLK_APMIXED_HDMI_REF, "hdmi_ref", "tvdpll",
-		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
+		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY),
 };
 
 static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..a14f0736cdcf 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -75,7 +75,11 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_CLK26M, "clk26m_ck", "clk26m", 1, 1),
 	FACTOR(CLK_TOP_CLK26M_D2, "clk26m_d2", "clk26m", 1, 2),
 	FACTOR(CLK_TOP_MIPI_26M, "mipi_26m", "clk26m", 1, 1),
-	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1),
+	/*
+	 * The tvdpll_ck clock should not propagate rate changes to its parent
+	 * clock so the dpi driver can have full control over PLL and divider.
+	 */
+	FACTOR_FLAGS(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1, 0),
 	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll_ck", 1, 2),
 	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll_ck", 1, 4),
 	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll_ck", 1, 8),
-- 
2.43.0


