Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FCFCC6B16
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=; b=MxbHFm24EODc81wQCsujdyHpJV
	0batZzmmDnW+PZqm52W68IvKcW1OkaTs67u6FboSdqEycalkyEd31nqnaAaXmuquiaDI3YA6P7HrS
	70NlqV0+ejFkkgfnNZzkCOwXttjCTF/6Pv72be/ZewWEUBcoW0yD3NSTtmB2PjLoGnZiBtX18QUF3
	XBAQVN3Rw8RjKv+WIMg14CkivR+YAtXkcXpvm/JiqTtOYrZRIXSWclZK+5f6lSamnf7ZnMVL7ZdLW
	5CAMlQVuGsCSD80bD23xfVVB6HYA8TiuI7uuBboRVYbqR6+2vsjW3MRwKNrSfnCRXToeFnVAOvkj1
	90vNyCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHy-0000000DHAQ-2bi5;
	Tue, 13 Oct 2026 15:19:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHl-0000000DH1h-1M0T
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 15:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=; b=LjzodsXRAAjaRO+etrMUH4N/kE
	mjA0sIowu7pJo22wSIWkZevVBgQntrxnno1vEpJZy2avLYFShUH9xiBFwRvrS3P4q99IYaFXuBCNK
	vcf29OwdtsSAHZwkB2DhblxEeb4fx0TDs8ZH6D8xJl4y95X4i5aQpDvcsOnrW2lxSeEMbBvh3pohX
	IBEGMLcl+zzNdi3YscXKMxVDUB7J/KAUTWtBzF3UKUBNemauP5Gqe+mNEhhr3LiCOAJv4Mtyy3lnr
	8K1xZokoXKKUZDg2OvKAGuUNy84Z5QFBDDJ63jA0srVN6GwpBgty4UDrJu58ytsuO3y1aMFtDbsHA
	iNNxu1Pg==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGeHg-0000000FhRW-3sMH
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:19:24 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cd60d155070so766541a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904758; x=1792509558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=;
        b=CvH85/9thbgFOXCRkMu8c7YjkIcBTGFBqZK8tMDoSw6eqLD6q3rld2vNfsaipbLhFG
         98ObxGhOaA6w9ruyWCvEaYlv/8DPX4Il+ixvdmYgAf228QDucHLMxTJrkgfJQNHLY5O7
         51AGxNjawCRC9plOF59J66owAIUw25vwWH+5tlNnQFH0FFut7I6H8pxzaNiD66FvWqxb
         vylyJTkm9rlJTf0j86i1ANNWmqquVcZehVVZHYj85PGQivI2+FEsARg0TENZcCup3hmF
         BMwRJ9CWrEwpxk3/peGwILPabIzBbRR9d6tzA0y0EAH4X3p2Iapi5+UOyFpRGF7dNayz
         AaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904758; x=1792509558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0H70aAMMimCbLXT1pVFm2uX6egTnEDs8iDKGzFjDDBI=;
        b=uSxxFkv1YFdiO6/GLoLYRRR+Cr0pJdS9YZomxb1s5FTB+4iSKVkkzq12QLyRWVsL3m
         MnJcWXi9SxYfSq4wtGO07fzKLtoy8V8m+NXCUlCCkX7IlG+skpLoXaTx2t4psk7vJlr+
         KdAaUt1jK+1KqbtRhQInrDEh++1wNl7u9hUDVGd0Y5r4jbE7JIOorDpl+MQERuOBNsaM
         xuRV5eIAl9oPyLwCN1LM2v2Cxv6xEMKX7WlqSYa+mvQRyUfUADECFj+XYl5Sgyc9+Of3
         8YFZclsSLIL4i1bwIymXeOAxJ4Je8X/vyerHGoVEjEUOPoztwEu3b4T8Ugosy8tWoNV8
         +dUA==
X-Forwarded-Encrypted: i=1; AKwUvBy9W/XkrO5v9wQlinfml6CIpDwEJiuWN8Ro25HWVejB8zINmDxUdL3RU3ulmCX4WPmkBoxRwblfWmnwWp+izw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJbkVA3QauM6Bc1x5Y34tdHUZOCpK7kmcpN2VLAYNnN9t7hiRTm
	5mb7aTwbKCgtOFlTIsMcOlndoifIPbw4quY/ObfRZHVTKrOTPOXZnXNM
X-Gm-Gg: AYBFou1VI2T7FkxRzgWfxrN6vxtza+5X9f+CBDlb2aqE6jjOGYyGbX2/FoQYgLCufDJ
	IIarLX41uFj9dJ78NuyNez5oeq7SFBtcApaFmniZPd7pOHl2PGZrgLk+fI5LNlTh5I1ZHIaM3YR
	s5j1XMHurAx9pmUPgOCA1FxrvBL9tqxq09pwgM2t6WHvPOnrJevThB6zXWpTZjyXvl7N0cJXYIa
	Hh+Bq+iJDmAak25KK6MrbYvR6tpdcxsYRFj47zAd8OdSHTUoZBXgLXVrtohWY270B6jlpFTEfqK
	+JBm8O8ja0uffNm2wuXDvVEd7+PKeJO5RJZZJ/H8+ZEg2yMmTYx9V0SOY/FaYiCYm72wW7d25iW
	YuUZbzYXINnxMV+VqRR2SnAGfhaTRE4Zf4qQW1bJGRHagqYbyW7k0PZps/VN9owj39pD5iiEjdb
	iaF53e/mR56A7huH4VrNnLrAIzvycAygOZF0O0S9KyVdUoFyc6Mk3nxLy6/cHjpqKMsaXdhnGS7
	eEpzSKL/KtBzCcHGhY4gmFfmHBoI7wsdCQk0MM=
X-Received: by 2002:a05:6a21:8216:b0:3de:b120:bb88 with SMTP id adf61e73a8af0-3e16bb71260mr12893094637.2.1791904758027;
        Tue, 13 Oct 2026 08:19:18 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:19:15 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 14/35] clk: mediatek: Add child-device population to probe/remove helpers
Date: Wed, 14 Oct 2026 00:17:13 +0900
Message-ID: <20261013151734.3177690-15-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_161921_138791_4EAC68FE 
X-CRM114-Status: GOOD (  17.09  )
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

MediaTek audio clock drivers call devm_of_platform_populate() after
mtk_clk_simple_probe(). Extend __mtk_clk_simple_probe() to run
of_platform_populate() when the new 'populate_children' flag is set,
reducing boilerplate.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Use non "devm_" helper (based on Chen-Yu Tsai's review)
---
 drivers/clk/mediatek/clk-mtk.c | 18 +++++++++++++++++-
 drivers/clk/mediatek/clk-mtk.h |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index e06cd40d995a..1172e76516c0 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
@@ -603,7 +604,16 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 		r = mtk_register_reset_controller_with_dev(&pdev->dev,
 							   mcd->rst_desc);
 		if (r)
-			goto unregister_clks;
+			goto unregister_provider;
+	}
+
+	if (mcd->populate_children) {
+		r = of_platform_populate(pdev->dev.of_node, NULL, NULL,
+					 &pdev->dev);
+		if (r) {
+			of_platform_depopulate(&pdev->dev);
+			goto unregister_provider;
+		}
 	}
 
 	if (mcd->need_runtime_pm)
@@ -611,6 +621,9 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 
 	return 0;
 
+unregister_provider:
+	of_clk_del_provider(node);
+	platform_set_drvdata(pdev, NULL);
 unregister_clks:
 	if (mcd->clks)
 		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
@@ -658,6 +671,9 @@ static void __mtk_clk_simple_remove(struct platform_device *pdev,
 	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
 	const struct mtk_clk_desc *mcd = device_get_match_data(&pdev->dev);
 
+	if (mcd->populate_children)
+		of_platform_depopulate(&pdev->dev);
+
 	of_clk_del_provider(node);
 	if (mcd->clks)
 		mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index b6504b3e77ed..11939e3e0b38 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -265,6 +265,7 @@ struct mtk_clk_desc {
 	unsigned int mfg_clk_idx;
 
 	bool need_runtime_pm;
+	bool populate_children;
 };
 
 int mtk_clk_pdev_probe(struct platform_device *pdev);
-- 
2.56.0


