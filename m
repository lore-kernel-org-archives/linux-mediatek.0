Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B7DC982EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JR7S6X6iySsYfrgafldkm6sJ9nXMwqRmDnXnIDDxCr8=; b=QdgShnAnpB7X25WajXgTQl8ihV
	hMf/vZ8JpH+Hwqbqf9eYjQ5OQUKI/hNc11CXWtpBMTv7jGgh5hEzwBT0jODXQeLetmRN+Q/vlDk5N
	WMkZ6DBlJ0QH75LWoDrKqTZM+eKLgTg99JuWLXNmgaYcL8LQUM50+Zv3vcbx8y6tpnAdSP+CaEqVx
	qWjp1CPG87M4Nc1xdgFdE2WdAlhC6z52sJFptrpw6e8V6QeCPKbNyGvfofo/RNISBJocQfdpnnygG
	EI7wGrFt9aVYZm2MC8czezptMfSM2S6bsPT85LEO//nBUR9Dng+rTq8RfRdc22DSxuKJ3yPf8SvjQ
	fdCJv/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDU-00000001gdB-1tFD;
	Mon, 21 Sep 2026 10:25:44 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDR-00000001gYs-1ZcA
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:42 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469e2254dso352530b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 03:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986341; x=1790591141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JR7S6X6iySsYfrgafldkm6sJ9nXMwqRmDnXnIDDxCr8=;
        b=slH8XW3+uQnpfH/+k4fLEF6vXwuZj6yQTLDqNuc3y37Mlf2Vh5zhHMP5oenWrKGkNx
         DmT2n1SbWD+tjmS53zbXC0z/QHM1CUSsliQb/DhopjNxy86Ed0i0lGx1GLnF+aoPkZh6
         nsjL8NYCEmUJP2+Vuy5WyWQ0dbFmP/1INgxPRlcZ1MGIpaukNTK59eW+KBbYF5X2fDPt
         JhI0TZqC8AcPOHumwjalzSTghh5/bC98ATL0yvsT31ZPvZ0vscYQ34CNg/k6FaloQZun
         KJVXgx/PnzvCcpglcEn4Q7CyTOmW/1BXQbhp3RkJ8YKbYIKEtWdahFyiFPdUJJFj4fO2
         iAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986341; x=1790591141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JR7S6X6iySsYfrgafldkm6sJ9nXMwqRmDnXnIDDxCr8=;
        b=oF1bKZ00rx/FrkEhEVFMbrh1RGtdD8FiMj1AMBwm9V9WVwNi5Q6/0z5q0G44XoNpcC
         P7oAJ8MYIPRKIac72uBx6tXPERscqkF3Lrr5Px+4rayqY5ObUYGWAbYxhF67ODN5HRQE
         uxcE64/QUVAJScQU5WDDkC5KGUtCmv0lhDYGOHCsNEwVDOYdqeWRqTYRYnMOXQvuWZTt
         MuA70lRvSEbZwES1R47jtP/0g66iHekwt5OJpCmlBxDI6awVehTNH6hE25qS3IiXFsTU
         2ShjCIVUqiDhVLaxDOiSIXqZDzUxtUtJvT2dYfOsIKHNJTyADr9AEjGAFqJDwcawvSMa
         Q+zg==
X-Forwarded-Encrypted: i=1; AKwUvBwkvN3dnhN+S3iPloo72Wm2Ipeu7+LytQvv12f5TDmdyQBFsDW1E8V1X7lMiBnFCcnEHaJe7BMJjr9cfa1jYQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m92sufHCYqW3NX/45u48b7FrG3f3uv6f2PHT++DYYaxnfpfZin
	egvX72N71styoC0+3lmaboGIymxZzNz6q7Ywin47zf1o+tSl5fXxlrwJ
X-Gm-Gg: AYBFou0o6mvy45Kf+R50yhH6b9PNPA61LZtJwMUsux+DE6sYWEHJun1vFDRsVkwjS7U
	HBFi7D3YoMiENsdBZlVWizzAasXF3/oEWJadEoFgLlV0atOBOw4/2UawxyNcCWx64MmFtpwHgd3
	2e9febEQ+djsG4WVY/l9R06RwGixiJ5BDkSRRAuqTA8o3KtREWL5lXxNIOqTM5VffTanjdafcjW
	VjJr7IrNPVGMJq38eQnFdB41uxXMqtpS0ip24YjKdXvLbnHzfldbxesGq/wkLIqKGRIGGFICmeH
	o7q1ULp439gJF7ZlUzTGmiyWjHPndnEc7N/StGz8aiyop0tOdFP5Cfda2dmpaSbTTHk/WdLYCMP
	H2HsNCoYBgQ1f9VXmZLBkxc9Gy7H9jBAQ2Nbp+Ut4WEZFRIv7pjhVK9w5ASd5iQszOgkUH+kyVZ
	fc+PpbYK837IpqgNB+gLNxxSu5O+Kt6ujejp7GdjL8KhFGu3/jyfnVmp0nqgpMdukgmuhn9m/0u
	bu85Hcjpl/ijTG6kGy7IiXys7hN
X-Received: by 2002:a05:6a00:2986:b0:84b:e69f:1b3f with SMTP id d2e1a72fcca58-874d3584850mr9977483b3a.8.1789986340714;
        Mon, 21 Sep 2026 03:25:40 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:40 -0700 (PDT)
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
Subject: [PATCH 4/6] clk: mediatek: Reserve missing MT8173 topckgen IDs
Date: Mon, 21 Sep 2026 19:25:20 +0900
Message-ID: <20260921102522.1640072-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032541_439843_4AA78345 
X-CRM114-Status: UNSURE (   9.63  )
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

Reserve the unused clock ID 2 and the binding-defined
CLK_TOP_HDMITX_DIG_CTS slot in the MT8173 topckgen provider.

Neither clock is implemented by topckgen: ID 2 corresponds to
the removed DPI clock, while the HDMI digital clock is provided
by the HDMI PHY.

Keep both onecell slots populated with dummy clocks so the
descriptor-based allocation covers the complete registered ID
range.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-topckgen.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-topckgen.c b/drivers/clk/mediatek/clk-mt8173-topckgen.c
index 42c37541cebb..9c50f66766b4 100644
--- a/drivers/clk/mediatek/clk-mt8173-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8173-topckgen.c
@@ -624,6 +624,11 @@ static const struct mtk_composite top_muxes[] = {
 	MUX(CLK_TOP_I2S3_B_SEL, "i2s3_b_ck_sel", i2s3_b_ck_parents, 0x120, 8, 1),
 };
 
+static const struct mtk_gate top_dummy_clks[] = {
+	GATE_DUMMY(2, "topck_reserved_2"),
+	GATE_DUMMY(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts_dummy"),
+};
+
 static const struct mtk_clk_desc topck_desc = {
 	.fixed_clks = fixed_clks,
 	.num_fixed_clks = ARRAY_SIZE(fixed_clks),
@@ -631,6 +636,8 @@ static const struct mtk_clk_desc topck_desc = {
 	.num_factor_clks = ARRAY_SIZE(top_divs),
 	.composite_clks = top_muxes,
 	.num_composite_clks = ARRAY_SIZE(top_muxes),
+	.clks = top_dummy_clks,
+	.num_clks = ARRAY_SIZE(top_dummy_clks),
 	.clk_lock = &mt8173_top_clk_lock,
 };
 
-- 
2.55.0


