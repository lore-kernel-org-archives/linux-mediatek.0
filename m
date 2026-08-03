Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45403C5518F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4Z5pWHAYmt7m7KtNfIU1rNnfqDpY05zeAJJ5XpoEVA=; b=S8IXZcyIgsC6RfDZ+BrN9kiReZ
	4UMfte2qTfG99B5svq0MRc+F0v4lhKVHp+KbCCyQdtUoswRNoIvgpC1fMbF9ae2KnhJ9ZlX1wtRhj
	zpfBwUUceTYyWGpC5T7SbgdvbS4WkdZ7vd8adO8IDQk8kWIzuHjgT5jkAPVkJxU9J9UTXnR0EVR/X
	dGZVR0NfYXcH9QySqGLZAKKAfEhHV90QjtpASHoFI9TuzHolL0jADg8HdtWoy9ywlbvRC1I/8AHB5
	1z+7b05COx3D+53yb1Srr9VPvXbiW1aKp40QXoAZkh7/MJ1V/IRUFIy+AMgIedWzo0Su1Il0FrujK
	P49T2POg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVV-0000000HLjy-1hSJ;
	Mon, 03 Aug 2026 14:19:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtVT-0000000HLgf-446x
	for linux-mediatek@bombadil.infradead.org;
	Mon, 03 Aug 2026 14:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m4Z5pWHAYmt7m7KtNfIU1rNnfqDpY05zeAJJ5XpoEVA=; b=Zjm3CLLQ16LBYyT8/WYzWHf3bT
	15bOk5TVeg9wEGNrbN7Ah5peeW5+wvF5SqFA/oZtzSQNZz7OfqGBwbcHtO41iNAFHjDQ3VoZkoaUb
	Lih2/YuD/2lowazx8GxpEuTEDK2hlOT6az+hJNhfOv51Nz8VBg+VVBmopoObmELVzJbWHHGX074H9
	2jFspZQiQ737dIWeu9OTTu0xyLVVoo2bBD2Nb/zhjfJpG5QVZvOzCyhTKHx6XZMF0MBSlgENHZ1nV
	l1Lb/SOW4Q6Cxv+PreeRw59meGwuPM7wpi1/gKTaZ25cYFFY73/SVHFhdqVFv1sOK5woq744UEVwC
	sMZsu6Yw==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wqtVQ-000000092G7-3Och
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:19:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-3811f512167so3470267a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766743; x=1786371543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4Z5pWHAYmt7m7KtNfIU1rNnfqDpY05zeAJJ5XpoEVA=;
        b=Zou7pVJZ5mFS3aAbM/Y5NifC4B6hELFwGpXyP8i5mA68oukvxEvk+wovttIP80lcw9
         92ULtXE2SW/tWQ0gmreF/CGvkhkT0MEWZbyiLzSa0xjxLW82GkRJkPzWSX5ldCAu4wJP
         n5m06MnbnSQiYcZprtzb70XwR8lCWXD5DV19FpqM6kPBgCyrHtoGKtML7QXdNZY4p4I6
         1d1PHoa3NVnybDjTXIZsz9+6Cksg43LW1sSr3kP3O3N2CVYw9/Vtp7q4/9IlDZ7UnIVa
         9VB/ATbOfBp2JTPoBxCj1LdoUqbpX0tPyaIO/IWAAFiI0kpTVLJhGezCQn0LCVbEnXLW
         Wv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766743; x=1786371543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4Z5pWHAYmt7m7KtNfIU1rNnfqDpY05zeAJJ5XpoEVA=;
        b=Oi6tZpJnQC/t0V4c6HHcHvpjyfa7aLYU2kxMzYE4hlJH91mkFKQpqxBjc7HjVXhtRp
         cWBSXugGIeTtWmIhCe9o7olE6je4lkNWuSm6YwwJvxUO6f9SCVi5H1a7J0X3nvBq85Pp
         1pvAaDdsFQXUnhjBYGms0DaSevoZTPekB5qS500FK0GL2NlhQC7DhfttEaKJJx7I/vSj
         30T2fnEWIxEQPHmpIutsPgU1KgfZznAJe6tzz9qufgDBGc5RwMDw7O9Mmg+/fJZlOtO0
         2wcRXMRqlNYNmNy1nvi2X3iJ5ejBPRtzV4MIQzZe4x1ok6+tkWYNzL3Z6Ds0jYtAI+j/
         bo4g==
X-Forwarded-Encrypted: i=1; AHgh+Rrorhp01PM1VWc/D4eFbmYc5lmnGgIJz70wlXNXN7LUuCEHtu6fuqCCFj24dTOL3fDRHuOOqob5zGOyjYBn1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWUcc3VRnJXyaGG2Gx9EpFbn0P+ICDFdC/LUzV6/Ad7YAFZ6HN
	CDjG7hQ2NNHHIpO9a+uG0KL3zMiQi1X1KnvEUGYtdl39L5uTOXz6v9ko
X-Gm-Gg: AR+sD13xDda2UqDpsjotpymhgFLppnzwRkkUTB7GwEGjhpFHHAgMadC/QBsa/5tORxL
	0IMkKOJRa3GIZLhW5T3WDU0hCz8eOnSvOlJVCmO4PaCaboaLzg8iDLWu4K42IzUcC5o8KjbNFqc
	J4q9BMb7+OxM/3uKaYgwzdbQfM/E9hom8ohbcX1VqIC62MXhJshiIYPQ77Y3b7zrv7g2YEifVl5
	Q9OZZiqmEIyR0bU+QwXHPYZhnxZZ4oGPTe9pb1V6NZ5BkSafEwGV8gdVwg1zITqf6CYDNIiks9t
	TxCHx8L81zyPtIS6W9SHvvnte0/Jx7z3PtVBVoUbpuSYGkCbepgdMRXUlkA5NJLvMnppq+NRN65
	g8MzdHhA56+v3lcluuo2kov9/Ot+2lDsuQJueCR3EQwsY5gfuteVDsRQZkAqRuoP9AquAFl7Vcd
	QDzd79kOHpiUCARsImPVzRp0nzogrQF3YDxRuh3xJPQwuXYew688cbhueZhA+NJWSQaTEh9M1lc
	w63T8/+8xuCWxc5d/Lc
X-Received: by 2002:a17:90b:4b41:b0:38d:e658:595a with SMTP id 98e67ed59e1d1-38fbc409a24mr9805618a91.2.1785766742716;
        Mon, 03 Aug 2026 07:19:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:19:02 -0700 (PDT)
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
Subject: [PATCH 21/32] clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
Date: Mon,  3 Aug 2026 23:16:48 +0900
Message-ID: <20260803141659.559129-22-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_151904_959938_8FA8FEDD 
X-CRM114-Status: GOOD (  14.34  )
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

The MT7986 apmixed driver can use the MediaTek clock framework common
initialization sequence. Reduce boilerplate code by creating
struct mtk_clk_desc and using the mtk_clk_simple_probe/remove helpers.
Also, add a remove callback to properly support module unloading.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt7986-apmixed.c | 37 ++++++-----------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
index af3e002bbfb7..6df3e9555e4e 100644
--- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
+++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
@@ -57,45 +57,26 @@ static const struct mtk_pll_data plls[] = {
 	    0x0278, 4, 0, 0x027c, 0),
 };
 
+static const struct mtk_clk_desc apmixed_desc = {
+	.plls = plls,
+	.num_plls = ARRAY_SIZE(plls),
+};
+
 static const struct of_device_id of_match_clk_mt7986_apmixed[] = {
-	{ .compatible = "mediatek,mt7986-apmixedsys", },
+	{ .compatible = "mediatek,mt7986-apmixedsys", .data = &apmixed_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_clk_mt7986_apmixed);
 
-static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-
-	clk_data = mtk_alloc_clk_data(ARRAY_SIZE(plls));
-	if (!clk_data)
-		return -ENOMEM;
-
-	mtk_clk_register_plls(&pdev->dev, plls, ARRAY_SIZE(plls), clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r) {
-		pr_err("%s(): could not register clock provider: %d\n",
-		       __func__, r);
-		goto free_apmixed_data;
-	}
-	return r;
-
-free_apmixed_data:
-	mtk_free_clk_data(clk_data);
-	return r;
-}
-
 static struct platform_driver clk_mt7986_apmixed_drv = {
-	.probe = clk_mt7986_apmixed_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt7986-apmixed",
 		.of_match_table = of_match_clk_mt7986_apmixed,
 	},
 };
-builtin_platform_driver(clk_mt7986_apmixed_drv);
+module_platform_driver(clk_mt7986_apmixed_drv);
 
 MODULE_DESCRIPTION("MediaTek MT7986 apmixedsys clocks driver");
 MODULE_LICENSE("GPL");
-- 
2.55.0


