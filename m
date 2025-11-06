Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9854CCFA19
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 23:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FAJMsAfnDQTxhU296hQyXnd4WVpQmvZ3EitymZm2I2M=; b=s1FmlW6JQSrdNFBznK2W2M1Mu+
	im46H2EHpi8V7Uv/+iddYsi0GVelDAi5TaV1bhWhG8keqwaRS/c/TSOppyLgF9Eg7vI0b97NEtLgQ
	qh41n9f1Y7ljKidZwwumsIWG0MDpXnx99pV5jzq502dRYhgF/CKZVH5GORzhKWOLc+emJS21kaWyF
	l6VfLceGMRStrp1fBM4raXzPfYPfPtRo4FSM6kejKLz+Q1Ys77F4dAf9QM5Dv6QbMuJud9xuxbaF5
	5JrRRUHhds9oOT5/bNi41rVCw5zdCUukpeDZx+ImGX9bPDEGG3YpKCBAj2vbd4J++U7LC1ZV6iTpz
	4MxOMb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NG-0000000GMns-180T;
	Thu, 06 Nov 2025 23:26:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH9NC-0000000GMmD-2aJr
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 23:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762471593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FAJMsAfnDQTxhU296hQyXnd4WVpQmvZ3EitymZm2I2M=;
	b=T+zN1AoMeZpdvOv91H8N/gUuoFQ2JTvQJN5f217gJBtcLHCIXQDXD22JacUxePD3y54DaR
	DXUqonWLc3AS49pWrYzofRYkjMT1ovvsbYiMN5r0SptMty3//olWsjoNTKSP+cMyLI8eth
	Hf382tB98B9zV+3sMMgQiWnvMIaJVQ0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-M5qyeN0LOx6Cvw0ZedR1ug-1; Thu, 06 Nov 2025 18:26:32 -0500
X-MC-Unique: M5qyeN0LOx6Cvw0ZedR1ug-1
X-Mimecast-MFC-AGG-ID: M5qyeN0LOx6Cvw0ZedR1ug_1762471591
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88051c72070so4346196d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 15:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762471591; x=1763076391;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAJMsAfnDQTxhU296hQyXnd4WVpQmvZ3EitymZm2I2M=;
        b=RtdtW2HJn0hh94uE8/LAt0sVqX0ARYAsz5z2X4+SyGIcGdO2+G7aG2g+CQwn53I0Gr
         dayc1tm/Ef+Y5l9nFTtbHRhzTrhSKL/ERpZ0noZIPvqey8v+arTnaqOJVRnmFOAUF4FF
         pmz9NkxLKYDyh9nVdWgDR5NRxcwK1OYhKsUP/XT3uPGrHpO7C/KGFxowrkOCpQHtHq5n
         EnCTBDfVT3ZqHvg+SFw/pkVfr2XfIVJhTRc2Aj62Ni0R7ZEk6MUg2aDBdMxFQ2i3AmQk
         gAIgGIySl8KR8kAUnifcTFgzDk9NPcLyDPCgFyCSmZLN6vy8BI/3rirdo7A5UWV7KdMx
         PbFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnXnqqsUFl6ymbBGcwMHqz4DEBW2N5xUxmqZqNkAr/qwjDjLeXrSa3iYU/s2YyPtYgdk6fnfb+CErEVew2hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqZmEdjnNoZx0+6mFh7XmvGZVLgMtZMGqFXAKHtLnj0yDPVvwy
	f0X0xrxVOEYTqduHPltFOUolH2HVpIwlCCQYivvcqrcqABeEhlFLwam+UkN5Fs390XgFgpRZWzF
	SSyx9n3AlOVK4pI3mB1hVmne35vk/hL2TkbTO+Elqu6xxOkxRu6wAnwb/cJTiq8tW75n3WcrS0A
	==
X-Gm-Gg: ASbGncuyFlEfa0P046kj5BzjGyBffbm3hyLllilCtK7i60r804pIGJ1QMsFwRUCKN/V
	qnt89fODrG8bZMUBsiRc/Ubgj0fWiYKXdE1iD/JXeev9CANbaDNhqZDTCe0WYPuhIl8SbixjVBE
	K93yF8ch+MNY89/KkBLvdWG1h+D1frk48qITt1RplPS9Hlwk/Uh6N/uHX2w6+sdlgID9ox7u8XV
	I1AMVGn1S+G/rSRM+13LWKpWDBR+wyybiAyHQGwvnLnBb2LsueMLmIF6QqBeoRkMGwy40+/fkoO
	54xDRsVgT9HqTd76UDE99tmEhYUG2cKANOWDonlETcEpIiMe/GFh6wUtTPIvLhg4PgXkB8m0Uxw
	l3vU9AfNXE9NSVubxLYqqJlAXYddOIwntXoorizl8XA==
X-Received: by 2002:a05:6214:b6c:b0:880:5d38:5411 with SMTP id 6a1803df08f44-881834dfe09mr19201086d6.57.1762471591433;
        Thu, 06 Nov 2025 15:26:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH+ZOm7tarylyJioRDN+UtrP4l5Py54SY0NPKQjKouDoS43pKzvH1MTEWiaIrH2Yah85AxhDw==
X-Received: by 2002:a05:6214:b6c:b0:880:5d38:5411 with SMTP id 6a1803df08f44-881834dfe09mr19200796d6.57.1762471591096;
        Thu, 06 Nov 2025 15:26:31 -0800 (PST)
Received: from [10.197.115.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88082a3aa91sm27389196d6.56.2025.11.06.15.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:26:30 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH RESEND v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Date: Thu, 06 Nov 2025 18:25:46 -0500
Message-Id: <20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHsuDWkC/x3MsQrCMBCA4VcJN3uQCxjU2a4OdRSHND3toaTl0
 gal9N0NLj98y79CZhXOcDIrKBfJMqYK2hmIQ0hPRumrwVm3J7Iep+GL8f1CHZeZUUNNcaicOfU
 YDj52jiwdfQd1MSk/5PPf36A40zbX5nKG+7b9AEy+0JR5AAAA
X-Change-ID: 20251106-phy-clk-route-rate-v2-resend-a86cb210196b
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6371; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=jDqYCzSqbnGJibZ0TWHt2xeNKFTolxoBt5YB5hnyZ0M=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ59Rb4nLOympMWNK85V7P7kd+6ig8Z8iyrkpyO9LTVv
 L2wiNO+o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgImYr2P4nzJZcP7j4OSiJU++
 3zk4k8+2/Frr8mwdjUeuGTeL89leCzH8U557+Ny5Q6xsLO8TtE7MrRS0OtKyeXV28qwN2VKNB9I
 aWAE=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lLoE_ED1Qt36PE-EJJ8Ea9nyEjhTzDfcJoaO4yIA0Xw_1762471591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_152634_761604_1E0FA140 
X-CRM114-Status: GOOD (  16.83  )
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

This is a resend of my previous v2 series since I haven't receieved any
feedback.

https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/

I'm hoping to get this merged for v6.19 so that I can remove the
round_rate() clk op from the clk core for v6.20. The clk maintainer
(Stephen) mentioned this work in his last pull to Linus:

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the phy subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Changes since v2 RESEND:
- Collected up 3 Reviewed-by tags

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
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++-----
 drivers/phy/ti/phy-j721e-wiz.c                    | 11 ++++++---
 9 files changed, 68 insertions(+), 54 deletions(-)
---
base-commit: df5d79720b152e7ff058f11ed7e88d5b5c8d2a0c
change-id: 20251106-phy-clk-route-rate-v2-resend-a86cb210196b

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


