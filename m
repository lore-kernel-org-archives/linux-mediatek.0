Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148C3CA0EC0
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Aug 2025 22:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zejlDygpGrwzEF/Tl2mTtzsn7pmvzE6JdbSkjCZTc90=; b=k67u+eZG9vYRxhvpaDnkg2GJTW
	DNrhY1Eo/Lmvfi/gLcY+nqMjADtklWCLULgcRx+n53HR3BMzBfot2gQfgFT7dtbouYFVL9ZuPYxUz
	DqLyWwsujOm5ikcO4PAA5Qgh0/rFjUT+X0DN1gLnAfPcVb8l8ZlYukmBfC59sI27fSwEeFtK78ZCF
	nrPs0q6KI/Pep+i5UVVopxV12kd+/iMrQBV7C06nyw62lzyA+i0s4Ka8twZpoUUL8xFnDPN0tHtsg
	6L4l5xCmIH1gIV9uOesCrY1KEHnYtPOxSH9hlFPTr8jJpDqLgM7CdiH3HWsbShn8FXNGtf7/K1qXq
	sGlbI6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEqE-000000068Um-2bur;
	Sun, 10 Aug 2025 22:48:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulEnd-000000067xi-1Jt3
	for linux-mediatek@lists.infradead.org;
	Sun, 10 Aug 2025 22:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754865956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zejlDygpGrwzEF/Tl2mTtzsn7pmvzE6JdbSkjCZTc90=;
	b=A4r5NCpNjnWcOhf+Q3yw7XW4o6xxHxJ26XMfmXWAD8OarF44I9xCAine4xkuef8WMI2G5z
	5NW08BvTXrrqce15x35qdXFEoPoShgdQqXu2UgfqxhWG6mYOZMgIqAkNmXN1W94hWzJxy7
	/25ciug/9duuP88IGTSGhGKnmAzaEWQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-qUqYmNQgMDiIIaRkU8iucg-1; Sun, 10 Aug 2025 18:45:55 -0400
X-MC-Unique: qUqYmNQgMDiIIaRkU8iucg-1
X-Mimecast-MFC-AGG-ID: qUqYmNQgMDiIIaRkU8iucg_1754865954
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af1a20cbcfso101225121cf.3
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Aug 2025 15:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865954; x=1755470754;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zejlDygpGrwzEF/Tl2mTtzsn7pmvzE6JdbSkjCZTc90=;
        b=FQf+fZCR39ei124WByfKb1rMtLVvRMtT6Ep6BdinzzJInzVCubKgTw4YCJrYHAEogW
         CzrrYfHx4oFUXN0hTtemsz9UqRJi/rzaUqCklggiGpf/uYSRrE73NxJIWnDKanZV3gOJ
         goA0kvQ3RdE5+CCiGm3B0qOO63iOWG1vLTvZ+IHBfcIwuokEte8dsSnmVAZfTF2JTB1V
         6bgQeR556ixI8GBdXWC+G8c4uxp9a3SCaB6zYHuABJax9mgIpJG+dTzv/4tUGr5WWExK
         Vt2X6xkEhT/ZvI5cF4GRIpNuMT0pP0OrGkPqRKdgD0xDfmsubW8rAJSn1c5VmN7PVL+e
         ILNA==
X-Forwarded-Encrypted: i=1; AJvYcCVS+vl/trZ+itswNOcH3G9Pdn25jeofYZXKnHwKa5RVeksRyaajY8W/Arz5qkEZ1nqcM80mM/yPYUyGecozIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUc7+Va4hjLJG7jigy9YA5Q+7xe2ZWmEwq02fg0YaC6NoZKX7k
	JX1GnUyHf28+B0KBSYSx/mezAQvMOp2+1h+C/aTJ7+wpOOn3ArYbHFFt0+Q7Hzv47dB1CuxAC8K
	rpm1SZFCgo7rqtKG49Zrkba3GMYNDrj04QjE784gF4t2sjO+ePa5/kVd0ri0KcKqEGRNzt1fNmw
	==
X-Gm-Gg: ASbGncvcj1QY79R4l/GJzqofRZ5087sUF/pZQRuJeQHDcWnbzvekn0QCzFkhLdSFier
	wjCstYEkEBRzxiHEu5QV8jaVLUkr3XS+Y8A1w8Jem814ADaGNgeGfFy4P8pBIHQxbedDribffyS
	zYzQetmJWEMghlPUXLXTaZLLx2WbrrvQyJtna7hKOfupDcfjPl2fuJHN+Ci0DcYMbqxnP4UHDLM
	Rcg0ox8v74syF1OVtqQ6VIZYM2WN3EnDqavIPr9/THN4M9SRRSVit70XI0p8m+t4O5uTROOIUro
	bJRbFxNFSv8OqXDlF38h7XY86h6dy6Mi32+ZPpN6s0nIqEj+OdpzVmugu2RyTBMbS5TKbxp1tWO
	VZa9r5A==
X-Received: by 2002:ac8:5992:0:b0:4b0:743a:b4f0 with SMTP id d75a77b69052e-4b0aedf6b1amr162625031cf.41.1754865954312;
        Sun, 10 Aug 2025 15:45:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMMVuRi+pB2hB00rh/4lBT2A6xNejEN6UKRgkLWeOvqElbSCAZq0WUzWxXHj0FePs3qQpk7g==
X-Received: by 2002:ac8:5992:0:b0:4b0:743a:b4f0 with SMTP id d75a77b69052e-4b0aedf6b1amr162624811cf.41.1754865953842;
        Sun, 10 Aug 2025 15:45:53 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b0ad996459sm42685171cf.46.2025.08.10.15.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:45:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Date: Sun, 10 Aug 2025 18:45:28 -0400
Message-Id: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAghmWgC/x3MQQ5AMBBA0avIrE1SDRquIhYNU52QkilCxN01l
 m/x/wORhClCmz0gdHLkNSToPIPB2zAR8pgMWulKmULh5m8clhllPcKIYnfC0lpDrqiVowZSuAk
 5vv5p17/vByfwFxlkAAAA
X-Change-ID: 20250710-phy-clk-round-rate-4aa7ef160fe9
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754865940; l=5842;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=aLGfKmyNU+bomSynOaLohW6Y59bxgPyE9ULfin1cZyo=;
 b=O9IhL3QDOUiwO05Lg7AXKinAxwzs6mf8jMpnbEWniYrx2Csle3lF/NzYZAfa6oTvLYjtyMKTB
 35n8Z5Wp2HwCqzPx1ryQAePsX3611g3M7mBqcbq1xRSaFHhbzl6z6wG
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Se69gTYtPmbUNQoVrKgwNl2J61Ad_BF0fO94oJ4Li4_1754865954
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_154557_441526_1CC8B06C 
X-CRM114-Status: GOOD (  14.34  )
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
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250710-phy-clk-round-rate-4aa7ef160fe9

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


