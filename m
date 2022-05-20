Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F67C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6UCmKe2/5EgCQjcm3+aG4Qjvk0MOymsdPiYRWzduGqg=; b=ij+gLd7+fXY5Fe
	VpdPclnMde1PrCDRdg+jZjxX7gc664Cr4MrWtDBB4T477Ra3torhM8dwl/2msAvw2TFXLVf730jzJ
	jnv6PagJzozPwdV4HkvCA89qcEs9bblcmiWhC6ncqbs6SXGLUuSChZ1NBXhfP1gJ50pNH6RSivV9k
	PgXfjM0OCoPjCts6hExqcx8wRtAeTgwd9vLcsqN5iI3QE0auruy+gmTOdcRntIaea18d2XMzI7pjM
	C+QlHhk/vvPxfPMG/oMikpYEb04P0FwiA1L9+1XrngsrOdcDo4ezBCWYw9z59HtFOX2y3N5WzBDwo
	7pLIQYNAlztB1KgsgwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0Nm-00Bwv6-KN; Fri, 20 May 2022 11:01:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzIy-00Bi6D-6s
 for linux-mediatek@bombadil.infradead.org; Fri, 20 May 2022 09:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ISg/8xMPMfr1lZg9uez8+LcDvNEZDPUAQ4cjw7mzFfk=; b=cZZJWSt29aTO/QbnIprLQKHF8r
 /Ar3pmXPTUGCnVpHgHVoEuLXbnREP3R9fFqglSy8Rk6o/zNHLjgskHHLAWoXuIBsDYx4qA+exDp/I
 7plx3CXG5Ox5EwRUy1CEUOD8p6kRd1bBjnnos6a3oHhUc8afPOmwvd+Fgb7SxiRxLx7MPNqEA9f3c
 ejbseLDAXUMMrudopultxMO6jhpbPvXgGmRce9RmlX0aiwYXCmTK2TVpB7UHf8GHjgIrp71fmr+Hi
 3JF3HWRll98rMXFkLxDvMfH69sg63Qf+aGlCThBC5xAhZGgDd/doLhaK4w/wU2xAozpe2fM4OUjda
 Vj+2dEZw==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzAy-002IL2-Fg
 for linux-mediatek@lists.infradead.org; Fri, 20 May 2022 09:44:11 +0000
Received: by mail-pl1-x629.google.com with SMTP id c2so6943767plh.2
 for <linux-mediatek@lists.infradead.org>; Fri, 20 May 2022 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ISg/8xMPMfr1lZg9uez8+LcDvNEZDPUAQ4cjw7mzFfk=;
 b=GwV6FZzfJb4ectmQh1Tv2YE7JL/cAmzGrnb7G6ggB2qJ06d7/Cx4fOAm6tnhSfzCc5
 fLGymIpxWMM5AWSPgfMGH3YVPyPRoJAYsFvW94d0nDzmbO/Mmdtals0dE5ABxSVAFvXP
 f8CIF/z2jE/MOX+9Wf7LLVB3ztYV56Z8aDP6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ISg/8xMPMfr1lZg9uez8+LcDvNEZDPUAQ4cjw7mzFfk=;
 b=ysv2I7Mwm8/P3aaxKOqmw2a2uOLWmzEuQNVnmv05upmnrNYigLslCQVPvmCsWI9+TO
 Knhb0HGZpyAZ0gs5bz5rABRWPA7P2nTxx00OLkB06uXpDdaUZgj6O8ZwsadAJcZ8LklW
 Ypwahj7kXyBY8g1Q1XlyEStIANNalvYTqcjjrtPIL+IPuyV6ulxIJCvjT7b7BQN5Ibbk
 k9/Q+/Q/hRC85B9AnG6WAuDMwaWyRwNhxYsYHI2zLp7CQ/AKedvPbUxxh/QUJC1VmKzi
 iRn6iMD3duK9+mZUVKmz7oHRJTPDQzjZ1JgKL5sOqXoaFbAZjwD10i8ov/0RTSKX1qiO
 aJ4g==
X-Gm-Message-State: AOAM533jk49SdrQOZhxeue1xwp0i2uRtG3M4qYfif2HxBVP3aCfgfw3m
 d04BJSQLwWsAwuRkfvSoHQDOxg==
X-Google-Smtp-Source: ABdhPJy43LUtdN+xEWvgtRwLWdIsN389lpZaprg3R4KGqXqmkxm/vSRHdq0C/UG39gRhRdKmr/CD6w==
X-Received: by 2002:a17:90b:3649:b0:1db:a201:5373 with SMTP id
 nh9-20020a17090b364900b001dba2015373mr10116081pjb.175.1653039832597; 
 Fri, 20 May 2022 02:43:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:ec49:9912:894:222d])
 by smtp.gmail.com with ESMTPSA id
 23-20020aa79217000000b0050dc76281bfsm1290597pfo.153.2022.05.20.02.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 02:43:52 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] clk: mediatek: mt8183: Fix GPU/MFG clock rate changing
Date: Fri, 20 May 2022 17:43:19 +0800
Message-Id: <20220520094323.754971-1-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_104405_550100_506D7BB8 
X-CRM114-Status: GOOD (  13.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi everyone,

This series fixes the clock rate changing for the GPU. This work came
about as part of adding DVFS support for the Mali GPU on MT8183, to
support efforts in testing the SVS patches [1] on MT8183.

This series fixes a couple things:

1. Fix the clock reference for the GPU. The device tree incorrectly
   references the top level PLL, when in fact it is fed from the clock
   gate in the MFGCFG block. Fixed in patch 1.

2. Clock rate requests on the MFG clock gate aren't propagated up the
   tree. Fixed in patch 2 by adding CLK_SET_RATE_PARENT.

3. MFG clock needs to be temporarily muxed away from MFG PLL during PLL
   reconfiguration, to avoid glitches. This is done using a notifier.
   The framework is added in patch 3, and added to the driver in patch 4.

This is based on my "clk: mediatek: Move to struct clk_hw provider APIs"
series version 3 [2], which was just merged.

Please have a look.

The GPU DVFS stuff will be sent separately, as that part is a bit more
contentious, and the changes span more subsystems.


Regards
ChenYu

[1] https://lore.kernel.org/linux-mediatek/20220516004311.18358-1-roger.lu@mediatek.com/
[2] https://lore.kernel.org/linux-mediatek/20220519071610.423372-1-wenst@chromium.org/

Chen-Yu Tsai (4):
  arm64: dts: mt8183: Fix Mali GPU clock
  clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
  clk: mediatek: mux: add clk notifier functions
  clk: mediatek: mt8183: Add clk mux notifier for MFG mux

 arch/arm64/boot/dts/mediatek/mt8183.dtsi |  2 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c |  6 ++--
 drivers/clk/mediatek/clk-mt8183.c        | 21 ++++++++++++
 drivers/clk/mediatek/clk-mux.c           | 42 ++++++++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h           | 15 +++++++++
 5 files changed, 82 insertions(+), 4 deletions(-)

-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
