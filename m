Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2297FC55184
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDSgzdM6Me9LLVj79/WXjjcDnuicd8z67Cux6+E8JMA=; b=vfgNPSSeTFlcASJzzReFjmXIn5
	YiBW0/Zq485ecX1pmD2kVilKCyJk3LH+2bMo4y5Ec4iHA2rx7bH/9wuKyJ9DNY2AcIwJRdVZ+OcyD
	hj4blzV776JFrZwbKfbZnD8sfaBqIgE0dRoPEWLoPsuJ3NpntCkSu/jvXD9PHwGtToxEyca/izIg5
	JqWkdcsGe9GQRngZBd3vDzv6t0bB4e+MzKVPHZP9iFwD+KIDXPO/sHtH4sBdX4U7j3UyvEcs65NZC
	bMddELQiLmkBOO3pNV/a3Rq87l4a1RjItscaUgZROzTpbA3EQVJ5RRb2B0AgqkQdnG0ECEUtoL0mw
	iE6DTbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUi-0000000HKZh-0yUn;
	Mon, 03 Aug 2026 14:18:20 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUf-0000000HKV9-3lbU
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:18:19 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso2831952a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766697; x=1786371497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDSgzdM6Me9LLVj79/WXjjcDnuicd8z67Cux6+E8JMA=;
        b=XGLQiJpZuRoQGCMz2YOXABK7dMDaxxd/RT8sNCJpIWRwMEkbrHWBpMjU0IPU84ogDm
         lWP//jf7ttmb27ychbQgcG2G4eG5BxDF0q2FgNdapeKXVBa7NJmOdGOyhXsgEtjHPm+O
         l+eRUYrUyUzJ/UqqUiv01nSaTuvKow+Vc+eVIlju0455uaDlFgZpqhOyvUtY2yt3iFAM
         JOPXPui0ikT+p0SPYfrtk+ukG1XbskEWtgHwd3D6qQxFKSwlZGTRR4V6qDiFb3Ry0Hl3
         NcD4HMHp32aWwZgNh2MHzVA6M+K/o+/g3e8abem/n1CnxSOZswKAQQzmzFJn0TBxbNMG
         WKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766697; x=1786371497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDSgzdM6Me9LLVj79/WXjjcDnuicd8z67Cux6+E8JMA=;
        b=LOrKsQpgarEVpLloByvbzN2MnEconUdWZYz9JKqR8y3Ebdb6KqR7hHJWGgkzbGyEUy
         r3bppjM5g4vSC6ruIrA05fnDWfLLXO9VUBA8qeXo60Vy3hqlIS2v4u+Gqc3LYANSUxWS
         sqBExezNhn5+MvKaK381a/UE90r2wZVFBAA8pMxj0foAJC/msBTTIye+1vvXkCWhgm7E
         128IW8y2cZDALFIUEUXDAPs/6CUsKdZHuYUikWj+DS9ik+pjE1Qq3u1qa7NOKCxSuYYH
         SZDA9Ns5vpLclhGtykB2mEsNvQkYcT6jJElcAxpotU5hR5hGhTlQAdd2FhyzmVzTsPSF
         apJA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9ZINvQoS/ymoS/YO1EzwNZe6H9FFVIUleUFh/XEcKLpuXrRxDBe5ZuTooBIKwj6B3AEhU90fxtUrV+CC8CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzUV3yfxAZHoeGLndNe1g3F9x0G1lDSwIX0QOTxJ+MTMluOXou
	3MbMLPZmAYERERF9+qG08KO+7F/9oRHg+3trbrJIghf+wQHC4D+DqFsA
X-Gm-Gg: AR+sD10Sze2QRKzjJ50eR0dFgqBMLgShldlwMu39+m0apJ4/8WvH61m7BFno747NJk0
	nXrPy10fr+0O2TrSEELCmxpAbwHJohxXSYLPP+QWiT7Z1Qrmbo/y60hKxPWGO5FAqgKzhHIjWuo
	fjyhMWvtk52QAlVogCJSOjvUwAzktdP0kw3inc/Lq7UOyhHjVninNW77Jrc6YuCetYevP+NUBso
	BYdZNGLdH9LH/p/aTBc1souiK7ZaQ+9hMKefMNUHZA+q/t2msAfUhi4VUdZO7GWMPYmuIMWiVXm
	hSircufGVuXRfAqAtT6OlkCqIDxFjlWARzoiCAFlrl0D+vOlHzlbU7pgtv5e10K2X5xiBDMCx0S
	5Pbyei+bA+SnAanSQ3tz4sYiH2839clr3S1FGjfqLeibABo7blewUOS2PGGg1c3LR+7lATHf2N9
	ODNgGtYHJ6CR9G8X+tCTE5pAeaf5hWKdlD+Luf/PjVcaanYiPXZ5WQiqmvF781k0JWFxGKSGVud
	zNbf4ZKCzjpcXA84hwM
X-Received: by 2002:a17:90a:d004:b0:380:873:49cb with SMTP id 98e67ed59e1d1-38fbc4d615emr9615843a91.21.1785766696772;
        Mon, 03 Aug 2026 07:18:16 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:18:16 -0700 (PDT)
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
Subject: [PATCH 11/32] clk: mediatek: Add auto-population of sub-devices support in simple probe
Date: Mon,  3 Aug 2026 23:16:38 +0900
Message-ID: <20260803141659.559129-12-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071817_970768_F38BE2BF 
X-CRM114-Status: GOOD (  13.19  )
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
devm_of_platform_populate() when the new 'populate_children' flag is
set, reducing boilerplate.

Note that explicit of_platform_depopulate() calls in remove functions
are unnecessary because devm_of_platform_populate() is managed by
devres and cleans up automatically.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mtk.c | 7 +++++++
 drivers/clk/mediatek/clk-mtk.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index c3369a04cdec..71d70b5a9990 100644
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
@@ -609,6 +610,12 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 	if (mcd->need_runtime_pm)
 		pm_runtime_put(&pdev->dev);
 
+	if (mcd->populate_children) {
+		r = devm_of_platform_populate(&pdev->dev);
+		if (r)
+			goto unregister_clks;
+	}
+
 	return r;
 
 unregister_clks:
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
2.55.0


