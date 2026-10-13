Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C4FCC6B16
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSK+e0uR+hrpe/b9QMXoajdIs6DQrymWCkZkpBSheng=; b=qnz4jgBTeSGC62PEOIdrgsLqYt
	HYSJpL3XyMuLPwMUlHYrZVuhyjIzMw8kpwVGDFrrBg27DFW68921C1p6uLSwiQi6gIkuMOGHThMqI
	TEane1TZx1MXJjrby8aWPEM8ZT/wrikhT8AcajYtCtSLUCvvG834GxO2lQpk65oAelPl7K/y6EhFa
	xO612N8sdT5Yumq93Z7lTcnNUEGjpMoT/xdr7br9BqIHm3EDWUtErHKgaWOBoeJyQo2EASbQqrjYU
	UK786Tm9G1vp/xphWGuU0i9LnER4kNvKYKXWmtBEbBjLzEhf7nKnJ73y1RvR0IW5dRyVqEimTf15S
	ag+KoemA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeHC-0000000DGSQ-2Acu;
	Tue, 13 Oct 2026 15:18:50 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGz-0000000DGEn-2K2A
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:39 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so3129019a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904716; x=1792509516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSK+e0uR+hrpe/b9QMXoajdIs6DQrymWCkZkpBSheng=;
        b=F7WMJl3CksCan+iKDU7Rv4ofcFietQfZYqpWHEGcdU1dqXK1V2TWgTQluhO5tNjI5D
         F5DGpRXkj37HjRQcNBpnPTqrR+5BeWIIOaROjrkkdKFubILxk6bKXZxpGflJGMBav2fJ
         8SxjBIq/f5iCfrL/qjktsVGmJYbtT9NbskbrVPFoDR4i5U3TlimnmF/IxjSou2dIeoFX
         d+KO3NthGaDvkhYrGaX/oLKbtOdTdk531QoEe1PvjAI+tMkfrlvkfiJZEH8DTaEPOJDB
         /dfETI0S8LaVaqJkL7Q5Y6ASDW/AEeZNi20meJFakQkgfA5f1ro7Yv5oCnlDKv2LCTU/
         qsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904716; x=1792509516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSK+e0uR+hrpe/b9QMXoajdIs6DQrymWCkZkpBSheng=;
        b=HR3SlNk6gb07ucx5d6QS8Bpzy18XfU2Jm4OQc672rNkcOL+sGUQl9ZRUw6yh920n+d
         j0uDGln3o4pkOBCbzI+GZCLTYdm2Xvxcs364Gk80tAvtPsvXlRKlcXS6waH8D8agdM3Q
         4CVgHpDvMCwTdz0YzdcjUGMNqZR2o+wEoOpBBzbiuKDoAWHLPpiIDaYWhsgGvUGgoirb
         IZ/wmsaq6QuWFP6dy6+/VTV6Wjetf11mT0SRHkNIfslZYuA+anzHiuZOcG5pLRsyAFrd
         eRs7QgHuGK1JtoFrZ8Z7iKzLQF8y1ww0xOuf47fDDNAtSZeZLRpZ4liOpwl0FYBfLDVn
         DlzQ==
X-Forwarded-Encrypted: i=1; AKwUvByVJQAZzf/1SiXzxvOqaKyBdu+rjpS0nJiffdTX5bVYCQSj93SmXd2a5PurSGfBQa+Nih7upjbu/18E7KCnJg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL6+YVDjlMJZMHLlqTKNlkSbBFSiQcNtKFWH6SDpU/9LQ3dPAQ8
	37hU7yN3F1VXTn/Lsdo2sAZKEXLVSZNw6lYBukhw6J9cpZN1iE28K6Ve
X-Gm-Gg: AYBFou1orsvKz/SXu/0CYPunU6phopJnfc6qmkue2sNo5SqIFU+75/QFyeIz8fJLBFs
	+THxTLZpkTKU1oExfXjnd0RS3HQ7XYGaEGPLCjt3xIBUIJokWrCCkTdxsEFaJcR3fRAui6hykUg
	N1o5DVXZKJPo8I76GWYu6IRigR59CkTHwu4/2FqLnKeQSdhkMaLhfLMtRN8TcOy1FrN1ncBfrbh
	JwrYAHDyJIucLLrU8zKobfW4zBnQwGn8seK02FqbHXDYo9KhWQk92bsFb1JrKB+9vsVP1T2HMIJ
	8AgAXaWOMEHzrjVApsVN4gb80wjUQ6eE9YPJZICHtunK6PJPcY8lwWwRPBOey5dsKvc5MOEc/gr
	FSFWPW5RBLpWfdb3VvJNjnoJ92zouNeFSxdq3G2jvfcfYcd2YMMOAh2HEfHS4b1rhI2BqN20Rjp
	JZ2DPJSOIb6Y4QWSst8WfvTanFlNhsvPZhjHhKzLZ56JuipCxa7JR06XaSmTopWjW1+9XMlG2+t
	/YvFeFpdBRPaPsKExVHU0KDsyNAMw5n5O9NIwc=
X-Received: by 2002:a17:90b:4fd2:b0:3a0:b800:50a4 with SMTP id 98e67ed59e1d1-3ab36956d82mr9294604a91.3.1791904716462;
        Tue, 13 Oct 2026 08:18:36 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:35 -0700 (PDT)
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
	stable@vger.kernel.org
Subject: [PATCH v2 07/35] clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
Date: Wed, 14 Oct 2026 00:17:06 +0900
Message-ID: <20261013151734.3177690-8-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081837_611939_1A7E18BD 
X-CRM114-Status: GOOD (  13.34  )
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

Add MODULE_DEVICE_TABLE() to the MT6735 clock drivers (imgsys, mfgcfg)
to export the Device Tree matching tables. This is required so that the
clock drivers can be automatically loaded when built as modules.

Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock and reset controllers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v2:
- Removed wrong mentions of vdecsys, vencsys from the commit message.
---
 drivers/clk/mediatek/clk-mt6735-imgsys.c | 1 +
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/mediatek/clk-mt6735-imgsys.c
index c564f8f72432..813241d526cf 100644
--- a/drivers/clk/mediatek/clk-mt6735-imgsys.c
+++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_mt6735_imgsys[] = {
 	{ .compatible = "mediatek,mt6735-imgsys", .data = &imgsys_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_imgsys);
 
 static struct platform_driver clk_mt6735_imgsys = {
 	.probe = mtk_clk_simple_probe,
diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
index 1f5aedddf209..8a18ee244a4d 100644
--- a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_mt6735_mfgcfg[] = {
 	{ .compatible = "mediatek,mt6735-mfgcfg", .data = &mfgcfg_clks },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg);
 
 static struct platform_driver clk_mt6735_mfgcfg = {
 	.probe = mtk_clk_simple_probe,
-- 
2.56.0


