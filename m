Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C316BC55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YIV+HU50AEtRbtVbE/kWRl5gYNOX4lr3tpB0iIeyarg=; b=YbvNoVMQm6DiAAoC20N7unhMh5
	aWzQJ+ixBBiHVkXvGN7NfNbSrzQJ8I7zM4xE9tu3njOpwjq3s04gMFd7iGkrxJhzI9tH2u+fG7Cv6
	d7MolcXxsPw/ctg4BFM44TPYB6T/VhgqIc21WOUfDGISoD9kWoRjMO0tJp9kCS9dlbZdBq370Umpv
	3Di4hxwgqlDCF9ok/IAXrkC41Gg7uStHKINn7ikA0tY4wYbp5oWSakEwUoL2rwqs3/1JyTMVNk6Vk
	ECJVzQzFLzsQbHma3uZ8syaTqe2UEat68nXOZTAhk4vvl1UpIG/hGQe/A9/hNnLJf8JufDW7v/xzo
	MC4mkYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU2-0000000HJiw-2yOL;
	Mon, 03 Aug 2026 14:17:38 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtU0-0000000HJgt-3Wh9
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso4336880a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766656; x=1786371456; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YIV+HU50AEtRbtVbE/kWRl5gYNOX4lr3tpB0iIeyarg=;
        b=jSgeKq7hnF+W/FROMFZTEac8jSOT4Z4P5/ceIZs6+DbBVNx9nQVJWiwZSkyI8PWLZ/
         RMFH028909zsEk6kZGT7snxnJBsPs0SBIh1dafnSz6L9eQHGWf2Kln77zhcYvzSX7fED
         0zC7YbI7i/Yp71NC4P8rSrqhMZLxpeGYyyMevQu9JTZjnJ7B48aKVBEkRHNnttnJ9phl
         XoEpGN5Eo2CUvhXHkApAVJKBR8H9ahI1OozqgrRTrK7HZ3a1E7Kn9qI4E5La8CKs0Gdo
         JXrVVgsagSs6o42A1Y2e96ov/lpH5ftXQmpMl0IyzjPWsCeN0pTtAGJlAZw10gNn6W2I
         pHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766656; x=1786371456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YIV+HU50AEtRbtVbE/kWRl5gYNOX4lr3tpB0iIeyarg=;
        b=qUuzXFhiqhaGMh8Y5OwStapmX+bzGw3FrLZw/tDO29s+fN86Oc/m0E4xJsDsemmrWI
         tiHAmdxOevPBuk3Y7x95joOydw4TJbZYwxzZW0DMdES+fj3prRYFpUceG8UXzdV5Ejwy
         7piZyGboTPqmvwRO8QdtSNtoRhQ0L7sjxcJUaDDLqf0EL9u8BACbiQt/de4C2Syouf5+
         RcvWz5o4LVbG9sb980pp4j11M/yNZXra9HgoFZ5o+02Dy9jsYojWvR8TXK1AOIgL0DQD
         9scyVjCfJaRqDT9MLcd3pBBAEqmtrzpAXTbDR81TczzLdCWZreDluD6zJrqUskjJBaVs
         wKVQ==
X-Forwarded-Encrypted: i=1; AHgh+RphwtklD7CrxTjveu1ZeBr3RnRCQ2RyZpAngBTnDBakuWxt4U6woE2RDRAkLx/mlFTZ0fCEY1IHNif+57kWrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV76ETEhquDdDxdu9RqaOFWuk9bYeQxD/IZkmHnTJ+soawHvgS
	H7UZ+8yNNF5OMqJPCT0qP6JvrJaLwn647GVssPeQ5EZFocryNggE4i8xXG9xqAtF
X-Gm-Gg: AR+sD10pzIwbp8//sV5NQzUe7u+7EUyi8593yAAFB0DUzczwtY/EgIqC0EYb/5JEFzN
	FURadv56mckQE8VTcv29VXBVGiZ7iNHIEqrQql/F1xuwLW/XTqzHlbFb/wg6HFLyMENibPDItYm
	ZB4GJL4/YH2BtEJqWvrrkk6IcYv654gnPgAURf4B4kNTtmbaoEV4bu2MDWcBLro7r2QgQzJllnF
	68qpLEQ9kvjYa5kXJ0vECyAk9FE2RjYKnIz5rxiJ5UQuWbyoGts1mnPZGlXmOn30iXaWBznc/hN
	PqkCgQ5GbqpJ8SUqG2PWhAZZKh/diQ5dn0Qnxazok2j/G7BbHXyrBVXnHYsXNPtb8jZKQbTGL/e
	fnoS11V5+/w0JI1dpCT02cX7tKPPkLQQM8d9vhNflcwBwf4yiivNKMtTmiZW4k0/wH4oJ/NrBLn
	YO9mc6uQttrn33y43ZlnvprSXvzqBLtcGtNnqFth5I9/c/0XQjH26zkLWMdRc7Y0N1qRdBSdyoK
	4cQY9iO7hXS9VUaxxgV
X-Received: by 2002:a17:90b:5690:b0:38d:a8be:a597 with SMTP id 98e67ed59e1d1-38fbc56732bmr9286831a91.37.1785766655662;
        Mon, 03 Aug 2026 07:17:35 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:35 -0700 (PDT)
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
Subject: [PATCH 02/32] clk: mediatek: mt6795: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:29 +0900
Message-ID: <20260803141659.559129-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071736_872261_E135C4BC 
X-CRM114-Status: GOOD (  11.01  )
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

clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg.c
do not call platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..239a3f5e1760 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,8 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..914bb069aa85 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,8 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..27d0ef7d7b2f 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,8 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_composites:
-- 
2.55.0


