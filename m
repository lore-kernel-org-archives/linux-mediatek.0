Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6C1C55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWp6MzQC1qDygJL4OCtM1qnllOHL0djYegVbWv/i/KI=; b=az2/kKVkLo4kAx7nM7iEdRpRad
	0s0elTCMdN3kuVM70ITZ1dGYIk2tAdilsSLIixi3+NRjQA3hKex47vBHfMZFY+4VkWiKRfxDGqeko
	vROSjg9StqIAKRglXglV4SPR/V4DBJyD9noHreGuuJx06rNXrkibfqwl0nXXHVBNJkGfuQfT+Eeqo
	dnYvmxoXXcMvh2oifAfzhVigR2v2X31Cwaxu+JBgfOZ9w1/HDQit5thIXIJcHJyb+h81nubMcpZ+7
	U3pN9xg8uz6gZRwTBlintwrYl9GVsY3fW+kIfQDFN7LIS/nJxnfetmlKFfMhkyWeg2f080K3gorqv
	snWCy5Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUH-0000000HJyn-1NHb;
	Mon, 03 Aug 2026 14:17:53 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUE-0000000HJuN-1v4E
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:51 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3406562a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766669; x=1786371469; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWp6MzQC1qDygJL4OCtM1qnllOHL0djYegVbWv/i/KI=;
        b=jV+gnxiXGQyJ5X0WFyt53VfwxGsQ9H9B2nXALUWgTLI7OLKC8Pi7WzTf2vEb/jG51H
         1bb6ehis1e323Y7X3FKxkw8na2ezXl21/3tMh7DmWy855im0aYBAMmNUtEtW4Pdw0GYb
         2M3kH//HAOgFiWN2N0VIzhIASDfSUKeLFK+IHt0qUPI6q3VmUp+tERlH0eHo85gh9vm9
         5Xcje+VkR3DvKxTDhFpzpT8KCaRRLMoiEBPi2wrxPJ3h+irp2+PfbQ9WprdCc+v9wuz3
         8uW48RGxyg9/2TdH9j0FwQh/8PCOtumGByD51iDqUCBPs4QmW3Ub+NbAgEC+deMz4M3v
         L1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766669; x=1786371469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWp6MzQC1qDygJL4OCtM1qnllOHL0djYegVbWv/i/KI=;
        b=Gp2ck3Xm9fB3aukNGPSaqZgp1+YQR4jMuJnaL+1lILA148Gy2qopH4dacl+Br6U/Sl
         xE2SkTKFUzF5Ye9EwY742DDVHFUOJAcFF3G8tGGOna/5USDEIkRPshw7gpbriW0i0BUr
         /hFQA5fPfLDvNn/GmzCx5xulUBjjENv9pvEkij+w7CJ0AUJ3PHnr2gjWQ/5jAw8SOPHP
         uygLxOtG4MKLKTYsBVHYzAG8I61MsdJtu5qB1UrmDS1OyrzqAW7mkzoWhXiPZa1FXDAu
         8wPjCn2NANA7m84f2MMoTBWh2TX3217aWw93E9gTrt8j8cqi0asNo4FBgBSjRNmTxEBk
         tVgw==
X-Forwarded-Encrypted: i=1; AHgh+RpxLIfX50L0ykxQHs/JBIFDKKJMPIucnG5ZTObHvSIr36nenEeA4DoZNhTiajQ0rR8T46B5f+CD0mkSXJot7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4GXwzTTFgYldv1hvzoSmZ2jnEh3/bPlW2/izxRPde+H9jUdYc
	702OeeLzPP3X/+HW/pkiivHY1tNgiPPciHC0KzKZSMRlpGiqHbf+zIUr
X-Gm-Gg: AR+sD12Pj5yEZ3GDRgPUSBXvHNvI2Dv4ilFoG+o1zCXSS4gvUvTSkDxRV3f/djs1+Ua
	3NBDA4V5J75dzI73WxdYEsyBlTFkM8ZiMkX0p2rfgA5CwoXjc/ZLvaJq0TQQw8EuHuS8Det+uUQ
	DXa2M8SQVqV8jUaj0xzMLa/SIdRrTeXboph/5FXUPDofFk2WKuoFjXHbCIuzR3Rzog4vBBdICqj
	ZdXCwLECUD8xCqIkHZmEi2JM5d5v3Y1e6O7vl/FRWoDAsHLkAgKH7vrGLsBwRaJWlY5LU2NUkay
	ZHM67vlw5YPHzTZFdGx+TX4MqTl/ck12kacxhHeepw4m25SEyeHv2mZONHfhIs1z1Hg20wBxOXp
	yp/K3UPiMAwEYOlkdTrFMjBt7difoJa24bNk33+04n7RILwRWRgRy6nBGx8VyY05D2HhiIHxAfD
	aqaq0zOm3II1hnRNapiGob69xvbTQK/coCqmbXACJWwGg6/ttlO+hUIlEEZqHdV95EyNqNQPr8t
	wkB0Ieh4KXmKdiil4qK
X-Received: by 2002:a17:90b:528c:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38fbc4d5e09mr9059524a91.26.1785766669331;
        Mon, 03 Aug 2026 07:17:49 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:49 -0700 (PDT)
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
Subject: [PATCH 05/32] clk: mediatek: mt8173: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:32 +0900
Message-ID: <20260803141659.559129-6-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071750_496408_47A34009 
X-CRM114-Status: GOOD (  11.03  )
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

clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
index d7d416172ab3..65dc4489a09c 100644
--- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
@@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_ref2usb;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
index fa2d1d557e04..9b8c35897789 100644
--- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
@@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_clk_hw;
 
+	platform_set_drvdata(pdev, infra_clk_data);
+
 	return 0;
 
 unregister_clk_hw:
-- 
2.55.0


