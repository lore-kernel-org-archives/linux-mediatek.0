Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A9CC55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R15TfQbT6I06GeZOzblPl7rBfwuRyPXGr5wu9wmhkM=; b=glixdnHrmLMzROMNOdgtLlkTIu
	nBHXyNVBJ1kbyQhg3PZljQbz0ZaX8SeNr+vU9HwYLhEF9G8/IKVihDn1ICLj0TqEIL9Wdihnz2ZYP
	HiMiRdh59MsV9ZCNg8y7OL2VbNhlTadJRBiqdp/16/vXLOmmjUbh0YhyJqoj2ELIVrYIS1Q0SZfoY
	FXN5BTdamVg/cDpzhfICW4unT8SEmEsEEOdRzVP/bQRksYZCWn30dxwnPAGD2gHn+qkNWEBFiUOEj
	IOGx+smXFUVLN/BGwnu5AlW0qYjVjbU3PVidvnlCyoztjLMASI9b7WYlttZ5dc5gHsdC3n+wUopSq
	aJ/3OZng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTy-0000000HJfZ-2I93;
	Mon, 03 Aug 2026 14:17:34 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtTw-0000000HJcv-165r
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3054266a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766651; x=1786371451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4R15TfQbT6I06GeZOzblPl7rBfwuRyPXGr5wu9wmhkM=;
        b=gzRZz3l/XuPhQNatbi4M3i3EiJV4iajBXTp7JqjOY6PLAS2YAECcOVDef6wt4kTkLC
         AkZJWyKa0wZ54bxg05Axt7PFCROOw0IkvYyLLFPBMoa8BSIBarSD6fCCMBtkRcqv2V4r
         8XpokDXrbEMaDEqmvfnCg3DnBXr3ivfweWf23w9E8qEIiwvY0vrB7sHfSfkbhs2hvPmw
         +WfRw3WEp5y5fI0fi3H8twdyhnSwImAki63YnTO0JcOorz+PWFTOIPJF0t+Vy8x67NAn
         E6GXmZdHMz9nOEFXRec28dZQ9RFw7Ji8YsluGnyr7CRp8z7FX6E5JVgJBbAQnjSIGLGp
         QATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766651; x=1786371451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4R15TfQbT6I06GeZOzblPl7rBfwuRyPXGr5wu9wmhkM=;
        b=e/UUgg5A1yB6LgHnmn1GLy9vWXCTInzSTtYOEodynlMi7bxSdi/s/tACBiNpu+9bgQ
         ubJH45Co0FQKST/SMnou3pBqpRNpABAdnEmdY6aXbIDW2QrelAdIs26SpmTzJf2RF10n
         8r5jncV3UBGli6QQ+A8p8RIvrp/XUbF+Uk5ob+g8/fCGWwWQx2JFLzi5fvpTPtTVljlk
         1mJzLsv3alR0SnqSRljAIGyLQKrnOLSpM7vCS0l42lS5uzXR/y/C/7ArC2Ow66S2HhVK
         BVvI2LkZLAPh3TMB3Kn/SLITmYnTxY8MMFdcASpv/jl8XGDzMtjFBDyD3tXfYbq2hTD/
         itJg==
X-Forwarded-Encrypted: i=1; AHgh+RqLBzBwvwXk6fZQcVyXr6ao4EPcyVhgoybZTrH5Ok7Ti7wK1OiP1Oh5g/lXjJPhVE/q0on73NxWjqY77klFkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8pD2tY3uVpyP++KumbLjaoc46yK8bKUR02F7R10TY7f/cUA8G
	yt4evG23tk/3FxFMVSGBpdXaWyRHrnGotfu7NAFx6qlb5OJeROQy2AxlWElzdBfL
X-Gm-Gg: AR+sD10kZTkAnfvBhgVKmdPL1onPnI83purlYVV+DsHiOzeN4phTpxrOL9sN17eVs65
	LlKVGXPfEhlKFUEt5X56gt6OnM62NQ8kfpLrIThLhCSfMd/10LniPO1iWVqnxvGngEjQiT85VKF
	yPi5aGDTy9Q/YCPujKo+GzL5GD84q08TgedZFxUNvpy0KfDpPhwNwgcMkyI1y2B5kgvkYQ6FMNu
	b+AGwqNjNu2YHC2nAif5gcn8gs6W6L7sieM+QUvCWwvc2/4zTpD4bLI8X38+r8ATIY9nq4g3pOu
	gICgqrA0iXNzwel3Xx4HItzo2tf+Dkyphq2op+IwwOFe/AT7Dr/FpEyREE8OnGfz/isCrzTVajs
	Xap8p/DyqccIbN0o3IpLR/2WbUAB5w3P5ADy2RXTyvjKTHs+YO9+0iTvJzSuaUE35OTehIjdSlT
	5nPdVv2DTUtJDgI12ilan//9Qop3t2qPUFU2BHyMwRYY/aV1InZsxcRLOzyck8PHSlTE3q2S+E2
	qI31XdQ34JT6YgPVnYj
X-Received: by 2002:a17:90b:48c7:b0:381:26f:8f05 with SMTP id 98e67ed59e1d1-38fbc3ff29dmr8848847a91.3.1785766651087;
        Mon, 03 Aug 2026 07:17:31 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:30 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 01/32] clk: mediatek: mt2712: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:28 +0900
Message-ID: <20260803141659.559129-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071732_307717_34D7EE8D 
X-CRM114-Status: GOOD (  10.64  )
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

clk_mt2712_apmixed_probe() in clk-mt2712-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt2712_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
index 54b18e9f83f8..087cf574bcdc 100644
--- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
@@ -129,6 +129,8 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
 		goto unregister_plls;
 	}
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.55.0


