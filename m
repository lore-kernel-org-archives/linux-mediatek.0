Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C66FC61DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w6f5zaTCHzRQgmPEKk5TD/UO+zjNwknfFQgnjXHiDpE=; b=sFO5lJR/uySxiYpwTTm+1zxedn
	G2QNsi//3l7VOaLvXNyZwQmTa6yRkKNJJzbV8yNZ4+eMBIEmh/kx4Osg9lFVSv3xqcUKlL+YKr5fa
	gu8/tnKCAlDhcBoni7XnLFakPVGmNpksxGg/3ZKh9FpuwlVG948jSB3KL5dqLnmKbd8U+PbV9Nbu2
	sbKVlhtsMumoc2PlZwxpFVxv9zIeXiR4SpW0dTQy7eBZs1tLmZLOvjm5oXgXN7tIkM2/1tF6Nb/da
	iPnBR5xnGq1rySEPFLqA6cYyJ8a0D3qDFQGKW2anCk8w47T8VNKEnXNBiD3Pe0ygvdhBR1fxaLU2M
	0TKOmOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xjN-00000008wZL-0KdD;
	Mon, 31 Aug 2026 08:51:05 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xjJ-00000008wY2-1i2C
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 08:51:03 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5b523efb0bfso2875445e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788166259; x=1788771059; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w6f5zaTCHzRQgmPEKk5TD/UO+zjNwknfFQgnjXHiDpE=;
        b=A7do94S0e5uydGofuoVkXBoRRTPwsnV+Kw69GWsYneTFBv2v7tYOoi2EEk0qVsT5Yx
         OXkGa7UgaC1DwtiWRzYTkK3Ir1vTcQH+gKYviQ/YVLFnKPZqTjwIa6+tJpCd9XZazCQk
         H1lr4nJUHdHJraroABVqIlJI6B8nPdy1fC9PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788166259; x=1788771059;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=w6f5zaTCHzRQgmPEKk5TD/UO+zjNwknfFQgnjXHiDpE=;
        b=b0Qq1XifrRWC33YYrK5oqPQumDBlT6O4XHikLeTQhdq3GSpeLL6X/u5bnTkX/piSTa
         8KeKtjwl9VhSS2WtQEy/8UE5T4zM/FxKJBxxZ2EY7xM9lbl/jGiZT1heQjxSxxXXxceQ
         eU3+8Cc8ZWejdnJr4SyFk3JJEVos3q+lAk0RiY92IbYucngT2Y0d3fmYCQ00nBtbRJ6v
         kTPB6lML92UIefY8LuTMGg2xwwT7Oy3CzSrSdXnU1h/DoFG0EecLN8/NnSkxgeGTmIaG
         IGVmwEaTOgw7lKLBHmz6WclttBNiXxxbqxMiJS2ybrKEvWpomhziuDNsYhHn3Rx9cNuW
         lT1g==
X-Forwarded-Encrypted: i=1; AKwUvBxdI9/AWdz1u39NaE2ZoIfT3L2stwg1OILlp/NtvZdE45tMkVNv2k7BpgqYgyG5MqQoxxKpCRsV2VPEKYgScQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lnf8BMy75VWg/4E/IXF32QkUvcip8c5AhMxvG9wmA/36BTVOB9
	fhaWXCfR9CTHJYyjAgki03XfLe2PGsDc0VVPIRhUWx/jq1N7G3ZuNXhps1wsv8PBwA==
X-Gm-Gg: AYBFou07NSwJYcwn3JE6RxFS6dtleQIYPeCr9k3XsSQ74bCVfhkpz4wvVvhpZXil8Q5
	8RHeeeM4UKR4wQ4FqS95JhLtNotnTK3DFiAVE5dnQczjPKjXiPcgkg2Me2t9IfA1hXVhXXQpwcl
	qjlxqebuG4oGjz6PQI25qLfeNx7ZZfqzejU+p+uka7Hm8nhgjIt3fw2WZsw8MOT83OF7jNEPaIj
	TtCSyeAHxMhhgWrmPcIEKJ259Ljq3/JP3DM6u7fgGQ61m9T2dzWY/4oNTUG2LrVyncuvnu/wE+a
	oe2+OwSMXxw6RlQDFFUzoPROMayIaORvBRBBVQTUNLtwUgt0/uHLtUV8oYFb1MXI5fdG3Qti+0B
	O4pZOi4k5JsPBU2DAHATUbsRDJ67ibeKOQiqAExcCjMNJWJhouADbyyBdtpi0l6x9X5XEJUsokN
	umzajAwXRFC1tXUg0MLVFewmxD2eEnWwdV4Zic3AFgUPatGUlmoEXxJoZYTOKVOm/Kzgn+e5J6Z
	NGSBRlPB96h9bkG078+rz59VYZPE74zdIe/tiA=
X-Received: by 2002:a05:6512:31d0:b0:5b5:e092:c3ee with SMTP id 2adb3069b0e04-5b5fa595f40mr922875e87.1.1788166258698;
        Mon, 31 Aug 2026 01:50:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a1cb7dsm1992003e87.78.2026.08.31.01.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 01:50:58 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 08:50:56 +0000
Subject: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org>
X-B4-Tracking: v=1; b=H4sIAG9AlWoC/x3MQQqAIBBA0avErBPUsKSrRETZWEOpoRFBdPek5
 Vv8/0DCSJigLR6IeFGi4DNEWYBZR78gozkbJJc115VgJjgX/GD2bXCnFk3FuEKprJFqUgJyd0S
 0dP/Prn/fD+cuZUBjAAAA
X-Change-ID: 20260831-common_clk_mt8173-05e25fc25b51
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_015101_509997_6BD57EB9 
X-CRM114-Status: GOOD (  11.17  )
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

PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
adding a depend on OF, the following warning is triggered:

WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
  Depends on [n]: PM_GENERIC_DOMAINS [=y] && OF [=n]
  Selected by [y]:
  - COMMON_CLK_MT8173_MFGTOP [=y] && COMMON_CLK [=y] && (ARCH_MEDIATEK || COMPILE_TEST [=y]) && COMMON_CLK_MT8173 [=y] && PM [=y]

This patch explicitly adds a dependency on OF to solve this issue.

Cc: stable@vger.kernel.org
Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b059d44577f1..ba1ca9c90dbf 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -541,6 +541,7 @@ config COMMON_CLK_MT8173_MFGTOP
 	tristate "Clock and power driver for MediaTek MT8173 mfgtop"
 	depends on COMMON_CLK_MT8173
 	depends on PM
+	depends on OF
 	default COMMON_CLK_MT8173
 	select PM_GENERIC_DOMAINS
 	select PM_GENERIC_DOMAINS_OF

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-common_clk_mt8173-05e25fc25b51

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


