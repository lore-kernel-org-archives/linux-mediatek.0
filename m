Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DBDD4335E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 23:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=; b=p9vTThsH0ufDBk11lPnvcycibw
	X0WmWk+/PfExEqhbp8HcByRA2ZcAaCN5QraDwLSZov3/ffIlUoo1/SaY40JZhBc1mVW5iBCcNEdOA
	dIVbXuQcBl+KUt+uT5Y73qvispAbxjcItTzPfIKn8060becFgtct0xc/6LewTA2Ujs21YEWkOCArV
	2qIwbp4XYqXSzemVVwZ0hdAE44heJ/nR7hNic6p9Gzz7uqvKB5mNJU0KPVaYTa8iVTxnwpBFszRwJ
	UaMXjqOtqNPGUoaBEWjvs4IF2VBwWXdHjGRxYH9IOgpPi7exha72hEvl0Nau1Jj/8f2x1jreNGmJT
	qK0L9NTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTptw-0000000HOK3-3xAS;
	Thu, 11 Dec 2025 23:16:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTptu-0000000HOIi-0j7f
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 23:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765495005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
	b=iOPTr7aAzjXA5ovzETnQZVWPZtx90pu55Em4PbzUdqoJ4El064dVOFGfytEz9C10pcECc7
	ZMRCWKB75Dxge9n17sX8GQfnvPG9aCNUrsUgM6KKGBQ1Zmix9oISbC5Drqz1sKecqbz0PR
	g6dTtn6XJaj393/dpq2qLoSJI0LPFPs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-blaufCBHO1ObsZG-GGKsyw-1; Thu, 11 Dec 2025 18:16:43 -0500
X-MC-Unique: blaufCBHO1ObsZG-GGKsyw-1
X-Mimecast-MFC-AGG-ID: blaufCBHO1ObsZG-GGKsyw_1765495003
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2ea3d12fcso143296885a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Dec 2025 15:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765495003; x=1766099803;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NbD172mHC2Ryq1GOWpDAGfx/N1dB3vFXjgBCreduXmM=;
        b=uQZ8hLs9YVMJt9UrC3SzXtMeivNVc4hxhhimOQizZOhhX7Pr647GgzXMwSrvFLaKZy
         Nj0FLtn0fTCrIadDVnsZqKP1EEX1zz+ms4GQi3REWeqvLhGGh1fnZVDs/DCFgoOXuGdr
         /gDbgPU2F3pxvKLf/E/0ZyurmeGYv4qH4CORbPiLS9dYFYYpdIsFrM/4/mqjIkzgF/rk
         T/BzAuFbHXePSuLSwRSafS1BCTBVbMXrCJdT8k5FF4mwbIhD7LgWchlYo1bwKRVakTqx
         /c+rsUxya9Qy/tbPpKmwxh+1nQYLvvaJuCRFRStId0sro/Hr6GK7QGTYO2PbYyc4+6lY
         iD8g==
X-Forwarded-Encrypted: i=1; AJvYcCWWNhhkuJ9UbKTBrzgHd29dwaSo6uqBwSbP7YSTZ4liX7586/bmv6UAzsYwd/oVQRoas1bFAfsPPzCR4eVapw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj8eukNwQ0867ebkeP/bquqKfaAvbngIhU4Kw/qWmPGug6+DeT
	So+Dr48rUC6MtaT/rku8PFS3KnYbaR0T+YalJezTPLDoSnw/thGwwkAElOd5HvREdJjHr+Rc1lt
	FZBNhFp/ZfLPxxFBEA4hHrRvbLwwfpZUT+EQCI9zr/2AWr8GbHszA3ooTouuYk0K63nbeCyhTKw
	==
X-Gm-Gg: AY/fxX4U0u3pk9YuVBHHZdnkDPiRI2Q9/neqhriA42IXZWybv4VNMjXPBi8+NK2XRnr
	ltjT/Bx2UghWBuvP22DFr0eJ64ntE1VMM7KN8s3mPPMgugLWPtBTNS/OS1HFbjgNb0Z9U20BgyO
	i8LLWvdiG+RN+SByYkr8xmL2QtLIWrIZ4fQPy3hrg+p707wihCc7SXp+0U7zVva7OqjnDKRcxfX
	fOHpvGAmnhxRaGB+rMKN4/Dm742+KhANMkYQxvhS7Z/91sTchiuVsH+rlSOPNuNsuppUYlkDl1D
	kDQiVifm/DtTCwF2xijJseOcr/C19MiBumQSCU9j6xnII2fmf1uHhWXrurwo8tlPfvmiW+f0HVY
	Uek57eDL1mtMxbFylp6EDGe5s12xbhzBrgZGx5fkScwi9nqpncgB9Qw==
X-Received: by 2002:a05:620a:45a6:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8bb3a3935d8mr36458885a.74.1765495002884;
        Thu, 11 Dec 2025 15:16:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTgdmowmpGEJXfkwF3JzqsLep6RU6ll2UwJli3c/rdVkRG78nuaQFcWNbYooZO1mfConbh8A==
X-Received: by 2002:a05:620a:45a6:b0:89e:f83c:ee0c with SMTP id af79cd13be357-8bb3a3935d8mr36454285a.74.1765495002438;
        Thu, 11 Dec 2025 15:16:42 -0800 (PST)
Received: from [192.168.101.129] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8bab5d4edbasm317873585a.51.2025.12.11.15.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 15:16:41 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 0/9] phy: convert from clk round_rate() to
 determine_rate()
Date: Fri, 12 Dec 2025 08:16:18 +0900
Message-Id: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZhSEcSV9zAsSpnaRm3JFBsJ4
 e5W3Lp8L/nvLxCJHUU4FwswJRdd8BkOuwK0Vf5G6IbMIIU8iqYUONoZ9eOOHF5+QFYTYaVUQ6a
 shaEW8nBkMu69Ra9dZuviFHjePpL82l/u9D+XJApsy1pWjej71sgL02DVtNfhCd26rh9mQSQJt
 QAAAA==
X-Change-ID: 20250710-phy-clk-round-rate-4aa7ef160fe9
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6172; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=ZY0h85yve8h09n3VMoGeby1rYSEr9a4xEaJTa8s51lM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDKtAy5+Y5i0/XBSw5mcryf95CfUSLo+Naq9ozK7s1HrW
 7Omgj9XRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOJd2VkmPPLinP7Iq1VoTP3
 9Fmcfl0v/MP2VI3J6eO5oTW5Ty8+qGdkWPvn/zz548dCZAM+uE9uzc3rkPFRMjjw9Gj7psmZsmf
 W8gAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GTqE7d3dZ-N_7I9omZIe_BbcknuUGzL0D7XkMuMBpT4_1765495003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_151646_279275_2CF3E925 
X-CRM114-Status: GOOD (  15.40  )
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the phy subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v2:
- Patch 8 (phy-rockchip-samsung-hdptx): fixed merge conflict so this now
  applies against next-20251211. Cristian / Heiko: I kept your
  Reviewed-by since structurally the code is still the same as before.
- Link to v2: https://lore.kernel.org/r/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com

Changes since v1:
- Patch 8 (phy-rockchip-samsung-hdptx): fix returning error code
  (Cristian)

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (9):
      phy: freescale: phy-fsl-samsung-hdmi: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt2701: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-hdmi-mt8195: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from round_rate() to determine_rate()
      phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-inno-hdmi: convert from round_rate() to determine_rate()
      phy: rockchip: phy-rockchip-samsung-hdptx: convert from round_rate() to determine_rate()
      phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()

 drivers/phy/freescale/phy-fsl-samsung-hdmi.c      | 13 ++++++----
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c        |  8 +++---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c        | 16 ++++++------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c        | 10 ++++----
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 10 +++++---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    | 10 +++++---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c     | 30 ++++++++++++-----------
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 15 +++++++-----
 drivers/phy/ti/phy-j721e-wiz.c                    | 11 ++++++---
 9 files changed, 69 insertions(+), 54 deletions(-)
---
base-commit: 5ce74bc1b7cb2732b22f9c93082545bc655d6547
change-id: 20250710-phy-clk-round-rate-4aa7ef160fe9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


