Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106E7CC6B19
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onVmbrIGz8Z0hScXq6eH5zvGAlPqsRkr0+Mi5GF04W4=; b=ndSw/AnpWdKIMOgOAuSieUZgRr
	uJXxPdS3DN/C6+TQJc6Gq4SBf7Dqc5wgRgU1tMeXZPrG1m1hjYHRydy1l7WVSMRDlO1M39eEKS7AT
	K1K9o7pUPlB9w/oiLpoy9BmvblTx1/rUz/OSeJaV9MzBRaCB7OIkL36Y69yJbzXiOeM5NLFC7ylpw
	PRY0EXexhd5ntCv/tWNYmb56aOrB+4sLoplofwI+2ODImfmyjStB0BVdb8IGQZ9Sol2ym24f2RbxV
	Yn0H4FTIzkJOZVA+UkcWps4NuWYpi3VQTk3C2FFdnjT4K8/Sy10s9f2seYugNH80wTErb6RHdyPBm
	fIAJKjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGt-0000000DG6L-3uM1;
	Tue, 13 Oct 2026 15:18:31 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGh-0000000DFxx-3GCT
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:23 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1087168a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904699; x=1792509499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=onVmbrIGz8Z0hScXq6eH5zvGAlPqsRkr0+Mi5GF04W4=;
        b=fZqk8GaQVFidHZxJ9tUM6jAUMHEV51Gsz6FwohOhBL6YQeOjDVIbyLQBd+5zCqVbGw
         /LHkp8hmP7vlKVAJksTAx/QaXGKdEZT4AgXuptaIJ+3f5fxVR0IZc6eeSH3WxZtQCzZz
         fIGJNPzqBOFbUMtuMy10MGeMQvMcLJp6qW0jxLWXy6Ap8/zWR5SROzizY8GEO5WbTJr/
         SXiLRxztSNrCG+TawJqRhBsCBMkXvb0VIf3cytmDdZ9m4Azo3l+Fhlnjn3GSA51x8r76
         alJoacofDGFDy4CDm3nu0hACZePAq/1tbs+QYJIGBpYBfKitm36vk6Czjxw8er855ZzF
         N+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904699; x=1792509499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=onVmbrIGz8Z0hScXq6eH5zvGAlPqsRkr0+Mi5GF04W4=;
        b=bLixwCdzYyrr14t5xTjjBoIQ8ZnQr7h+B5nE6nNN2EcK/q2cI71F3fR5a5FKleh3SV
         CfjegY0RzmSyVluqjIvtuNjXSmSNXJJHpHVOf+v/gxRVFJYf5VH96qI/8CTdF1Q0kgxr
         SMYI2GC5Pj2YpS9RB3hlyZ9WT9aaXbwzl0+7QbIDb37kAPdMKeLFIyD/h7vrRmQk6Alf
         Nzh5LIUh4PRGK+qpP6vDs0nQHb7bwqctdOyOvBFbo0onwD7NiPyLfNFKSAnML9wl2jHb
         21D+bOBph1eQuAcMul4nKi3HHAXm7Gkz3PmjxtvO7SMQmuYWsuRFZAnMgIyHvR4xn8aZ
         2tJA==
X-Forwarded-Encrypted: i=1; AKwUvBw9TMgxAI65xc8ES8X8GI2qEL72XJefK2MX82JLxCoH2+azTXiTSJpN6bhbPlUUV5u74WCsRDGfSIOR8WraPg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ7A+4u20honRWVqkDcUNTMduLq/3htDbsnJC7zdtJFxZDJRdcs
	mTOdKAoeTWEYM02elynxlInd2T2K8VQr7GBEFCLAxP2FOekHi5a+rYbn
X-Gm-Gg: AYBFou2Z03OSjKwMiuT+byAg1l8qFwpa6UZEuMvXpPX9AOZaNkRJ9P5q8DX0Y2ixiqr
	QXZv4R+aStwbI9lXjFgH0eZ1h/UEPf+qV154OcRXp1NNgFEj8AIXZygHdKnKLOzCrj6qXDnpqCQ
	jB6ekNE5AGjkUDDDuNr1u3W4z0+F+UY+T/OaZuGS/imDJZc0aOzn0+aE9QLtudKjJN9gCRLhu5K
	ccSRqXf1O4T+kEfo73jU1satCzBj5n51B6K9mjCgWEy3H+NAjJiU3XqyJrx6kmAwKledOmYpWYq
	JCmFSXlyhSQCC1gSopqeYNtLH2nZ0xotV+FQ/VIcUkA+Z1WZCk7EhR4ch5NZaeHLGwmYKASktky
	IiMVKfkD2Rf1QxZYIwoHebo7eC2/XHcnGHiMLPLu0UGgHRIYCotIgiHx1MYhSc5Gu4UlvLlwKzm
	+aq8T2/GASdTWERfDNvw4HbVoUeGgO7/95xnKoSVNiX+dLRsOGqg/qaLq3jQMatEFF9aHBGjuFC
	NZjOhyGSkbk2nSSl8sBLEVF1mZy
X-Received: by 2002:a05:6a20:9c98:b0:3e1:c04b:59cc with SMTP id adf61e73a8af0-3e1c04b92fdmr2161022637.70.1791904698979;
        Tue, 13 Oct 2026 08:18:18 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:18 -0700 (PDT)
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
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 04/35] clk: mediatek: mt8135: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:03 +0900
Message-ID: <20261013151734.3177690-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081819_822566_985588D0 
X-CRM114-Status: GOOD (  12.01  )
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

clk_mt8135_apmixed_probe() in clk-mt8135-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8135_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
index 19e4ee489ec3..e3b7dc13b458 100644
--- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
@@ -66,6 +66,8 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_plls;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_plls:
-- 
2.56.0


