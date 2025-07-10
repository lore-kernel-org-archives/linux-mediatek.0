Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11697C83F21
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9y0trkj4fUoS0RrnudnNCXl9kNIfdjh6JnTKD549Do8=; b=LpFs0zCw2HNtxDBVXvW3HUneui
	Ec35KIa8RCjTsLPXb36JW6evuN1q6o63ozNdw8dTRz5Xo/MDdVE9JRqj07swaFYvDc1AImu2+lYt8
	nq04G0Qj5l/p4UniuP/Nc75J6Ma6cy1Xi/rB9G4fcs3R/dGgk0695EVjuD6PulIpG560e+czF1QcT
	nrsjpvMZpOyIxynSVywLrRu9jgxPKtX23BlGGT0QzYqgb9+cZrC6zTLkCkiAngVjhe/chMx6VZpuR
	XhIw77uLXJBnunY7//9bNWpAgrcv8Y1J4gen0ClovGTE9IJrgoTgtpS5ruEuoo8yLwdZD9eavfugT
	DDESr+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZvvj-0000000CgxR-1Nok;
	Thu, 10 Jul 2025 18:23:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtoi-0000000CMD1-291E
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9y0trkj4fUoS0RrnudnNCXl9kNIfdjh6JnTKD549Do8=;
	b=TD4LnzOvelWon1d+YWSdln59JXJs5/B5LonRyf9tdEo8UzCM40m4QaSpO+QzaJ5hOeSqSY
	0CD9Y/h9tQFSOU9jb5Ha5Z/+dTFzWSjgie1E6lauIaFmrf1TBUbfoDnnqrZ4Ibq3RiMHjC
	tyHgLx3Try+hUkMhQO0lIao5hhT/nhM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-YnBZOuXqNTiskGWy0qNI0A-1; Thu, 10 Jul 2025 12:08:09 -0400
X-MC-Unique: YnBZOuXqNTiskGWy0qNI0A-1
X-Mimecast-MFC-AGG-ID: YnBZOuXqNTiskGWy0qNI0A_1752163689
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd5e0bc378so22529156d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163689; x=1752768489;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y0trkj4fUoS0RrnudnNCXl9kNIfdjh6JnTKD549Do8=;
        b=O/hPigOVzsTSumFS/Lwhi5v4W+vLwa0ZirvjipVw8zVI+j8MTDFrTk3qT1WqguPt1V
         ddlKIMp4p39b4iJgHcWVMykbcdA6/yolHYIVQIhdJPrkCSCoC77QFiOr8syT6H1FLwcl
         67Q+9iw76JakfXOYoFbLPWZo8OQH4d6e0TwfcLdByBvdBnUF5a31WZAz7EYi22Yq1hLc
         5DunH3SlSsY81Zo7HBU0kWAIHoV5+AWOOT58/FhsQfjjr3KJPZE/3JdH1BZ3RXRF/pvT
         0379AT2Isahj7sD1iTYsvSyV2eirSGgWWcL0jZl8dFY1tv2+fOfQSJwNAl0i2IBgCvy3
         zXfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhwaL6HFUWcfMIdLMRUgr67soX2wTlF68ohFzCTEU2rJDTgYW3USEZh2Emz6HXBm8hnyPru8eiws919dkCuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbEHe0ckvZHGj5aYxN84+g6A/UtVkX+MlXn5/WJUXir9/CDpmf
	52r/twLg8vPwJyC6Tb82ahe04XYt/caCp8vU6AV2mmaEv9j4APZuXTzCGwrGxvPHmf7AjLprQgQ
	qNlLfEdmUDXKdC3lhIs+aO6Dd4GitsxE9rM/VgaVt77z7HBmJFyN94Qhn/VyY/gAnoRZ7QZM9Pg
	==
X-Gm-Gg: ASbGncupWzd5IIWf2VOLb+U1x7YIoasHA4IjyChcFzox1M/+uIh+8gCMvTqEKACq4ay
	NA9u94yZwJDtYvJHn3imYe+FPMQxFXPy4Zu9n5Psg35FxeTp/TVXwC5Mu3jUDaQJXYFFGORGxDs
	7JF/+gs5VcH6TMer5yEiexnsBZX8VTUoQnPWAfrEnbIrHZ+08gCfBbm+AFiSTK4qaSB75+ks7qz
	tQtB191qPam4tFnd/Q+dl5NrVRUB8xzWf5CCht97Idt8akqeGK2UmJRJB2V/tQZSGAykTFQlHT1
	n0hzAZjWJ4SAGE5CVuwsPPR89jL0NqQrL9AIC8l+CfGcZuFt0OE3q03Hxhgt
X-Received: by 2002:a05:6214:2b0b:b0:704:a23f:9d36 with SMTP id 6a1803df08f44-704a23fc534mr3788346d6.25.1752163688522;
        Thu, 10 Jul 2025 09:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4gXy2Dkx4egeBxiGddHTDVbGuVB+8YXO54lWBniB7kXUceb7curtnNMZMf9c09zPdEAmsFw==
X-Received: by 2002:a05:6214:2b0b:b0:704:a23f:9d36 with SMTP id 6a1803df08f44-704a23fc534mr3787296d6.25.1752163687765;
        Thu, 10 Jul 2025 09:08:07 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/9] phy: convert from clk round_rate() to determine_rate()
Date: Thu, 10 Jul 2025 12:07:10 -0400
Message-Id: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC/lb2gC/x3MQQ5AMBBA0avIrE3SChquIhYNU52QkilCxN01l
 m/x/wORhClCmz0gdHLkNSToPIPB2zAR8pgMhSoqZbTCzd84LDPKeoQRxe6EpbWGnK6VowZSuAk
 5vv5p17/vByQloVBkAAAA
X-Change-ID: 20250710-phy-clk-round-rate-4aa7ef160fe9
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=5746;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=oHw4EaNbWszhl2nWjfiTC4gPuNzXI86YghpIW4T3XYU=;
 b=+YTf6TGhVZLwRnFkAqozoviaA3InI8pyoCfUeHJRT13VIoshFQfOj4nk5h5s6PLxBjQMoxHBQ
 8+w6S9SAMg+C2VTLAoUj9UtD3pjNbsegU6UjRkwkyeFq4rIhJkVs1CU
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VvbKQnYHbvJeQnm6mSk-XbE8SFVq-vFpTMWLaLgCNgw_1752163689
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090812_615836_4044316D 
X-CRM114-Status: GOOD (  14.87  )
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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 21 ++++++++++------
 drivers/phy/ti/phy-j721e-wiz.c                    | 11 ++++++---
 9 files changed, 73 insertions(+), 56 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-phy-clk-round-rate-4aa7ef160fe9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


