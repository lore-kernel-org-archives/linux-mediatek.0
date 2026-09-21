Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC4BC982DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7tYSkJ6lOcONG+Kk7MS1jRgYa+E91ac/ILJT9gEeSM=; b=a3Nj0cDrTBlk+RG+L70lA/FL2x
	HwB0kLmvmCic6sKPZ7YG+uuG3horCUO/rMDKylgg9higonTCln14byg9GPlKhTOr3SZjZoQeif+Ra
	E8bWruSBNy3uVRKX1ePjNSb2HssUjkAa6aJ11LiljoDMhMrBTwJxDaVB2KHhX5DacYnU1bOluINed
	sWP0I8jLGA3WlcXyksqS8+UsZJ7J1fyk9Fg0AZcnxcCeY8wJgtFh93up7jNFy4Ljb/j2xcWrb6ERL
	hcEBnrG6Xue6MYCY/TAEyIfPLGmRGw/w3646wHRNHEJ5piu8Sul9haZnxhYtoZ+UW6qysLcyoLUlv
	JYipBOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDu-00000001gwj-2qXX;
	Mon, 21 Sep 2026 10:26:10 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDX-00000001ggm-1DgZ
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:48 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so3036983b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986347; x=1790591147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7tYSkJ6lOcONG+Kk7MS1jRgYa+E91ac/ILJT9gEeSM=;
        b=JmkufzbEzEVFuUMtPVoD7SKUzJhKBN7f5Zf4tToIGG3G6xnWq0MTf93jj4p0hc0g5j
         yiFzYm5rrad08PmLvwoQV+HDcx8Tftr6+FKu6A7kbOK5IZETego/rBJPgu36pUXAngR5
         UI9jkMhEJeH4T2ubhdLrO1Vh5uyuNHqJt3OZfeR6C/5d9JtkhmhmVe66U9ObCIgwv9aQ
         1mks7URZFCgng+UgdmyN0eePmh+bmbudsmdk8JLDWTZw0DSbabYPpXwtXtlrqt+pCxK5
         l9jhKPr7H7M0xT1eRUVFngl3K5O2UIyFqaYT9bapEjF83gO5lQPhOjLBYw3WGkHVJ58h
         saaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986347; x=1790591147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h7tYSkJ6lOcONG+Kk7MS1jRgYa+E91ac/ILJT9gEeSM=;
        b=kmEkpyggahYn2NY7cVUDNzhwrrnZgAfgdAQJtrrVIvJsnmlzhA8gbpylu9m1RPMt6/
         iDVkPVk6L6WsV6XsdNxUwwbePbVuG0k1gBlXRyKmZwWv0lnsfcD95p9IBtnzUJhEMQVt
         eAzOkrTHLvKQrVx4wKMlSkegOQYINAdgCaRa2tFEytMgNY2rxGtn+k6PjDqGOFYf+e1/
         ySUpsIFkgSip7bUu+pn3cUUp4EXaiL3Qifg6VjNjseN9u+MEykd3V1F72R9oMf7ROQiC
         C877cPfT56/vulp/NBN08IsrdUY4UqtLk+uELwLC1HrFH3CN2cr1IFdZbkUPnl7HDy5B
         B4PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwD9oqqaTM6mNDbsdguVzlIW19pHsKYem0dl/13x+Z8RryewFKWX2bz9SVxg+IRlIYiAontRjGe07y0mVLa8w==@lists.infradead.org
X-Gm-Message-State: AFuF++lgazMqMu7bEdqw8K7X0iJW00ggUN/BKSvUuQVxZB147u5rYW+g
	je6cVR3HSarOwrgTSG0NrA8jAv0fznEYqAXEVUf6h2vpYPpeFURUp2J5
X-Gm-Gg: AYBFou23OQny4MnNJXb/j8znlcL/7Q/mhV4uLOSCASnIA5whQQ3uLL57ACTAaV1XCar
	apa4/49ghchlzuwhQ2nxvCAlemP4678et+VVLifd+2WmseF1PRFI93TgLhaWhfSdgugq+fUqzZk
	lD2hufY0TU+H4dp73OPJF0MWqycW357pi473s0Lx52vh1mwFtMEVF4GnKGHhZbuI+NZ8hM/6JCa
	OIChMqigYsFuSFGBrmfCrqn3ONnpqtBDzvhfc/RuAlhW8cjk1x4NSV9f5deKBPrNttjKHqeo3Np
	Y21UvOoAsOdzJtp1GmYJAkd/h6FvsJG2SnoV+ZGcxyeemLj2yt43XaV4lumEg9j1NL0mPkQVMmQ
	zRUim7vI5EQjBswlOCyXsX/e5QE/57HT/dJvuahmd6ZNgUObCAfa/s1PME97kjdoAUhoRqeEf6V
	1cSv9HmdnnvN/GoCmHCTvE2MdFOZP4zqi94LxGWkkcUBJ4PtpBkNPkvmWbouw1aeurIhSYo4Xwo
	nhRQgpfJf6ZiooIp/7xQOR3qh8IpHxmfAx3iRA=
X-Received: by 2002:a05:6a00:159b:b0:878:34e7:9a40 with SMTP id d2e1a72fcca58-87834e7a3c9mr6176607b3a.57.1789986346569;
        Mon, 21 Sep 2026 03:25:46 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:46 -0700 (PDT)
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
Subject: [PATCH 6/6] clk: mediatek: Reserve missing MT8516 top clock IDs
Date: Mon, 21 Sep 2026 19:25:22 +0900
Message-ID: <20260921102522.1640072-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032547_332637_E919409B 
X-CRM114-Status: UNSURE (   9.99  )
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

Reserve the binding-defined CLK_TOP_EMI_DDRPHY_SEL and
CLK_TOP_DDRPHYCFG_SEL slots in the MT8516 top clock provider
with dummy clocks.

These muxes are not implemented by the Linux MT8516 clock
driver, but their binding IDs must remain represented in the
onecell data to preserve a valid ID-to-slot mapping.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8516.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 342a59019fea..b64674559878 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -545,6 +545,8 @@ static const struct mtk_gate_regs top5_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &top5_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate top_clks[] = {
+	GATE_DUMMY(CLK_TOP_EMI_DDRPHY_SEL, "emi_ddrphy_sel_dummy"),
+	GATE_DUMMY(CLK_TOP_DDRPHYCFG_SEL, "ddrphycfg_sel_dummy"),
 	/* TOP1 */
 	GATE_TOP1(CLK_TOP_THEM, "them", "ahb_infra_sel", 1),
 	GATE_TOP1(CLK_TOP_APDMA, "apdma", "ahb_infra_sel", 2),
-- 
2.55.0


