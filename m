Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7323CC77B6F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 12:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=49xLVHrspKSm1a8wJCoZVRSlPwE9xT9Y1ZadXVyJNEg=; b=qeeivR6zDIsYgt
	BCRz4geDv2fewuADq18U/Lngh7q0lEe3PGpoTiumlFZW2rTou/U2as2KoLQCr+lDLaR8qsb5ekaVP
	2rVdgXO8mw8SULOXG+yUxH1VghygbKbzT76We9agCI1PokBvhDeCl+eC+2y7HBEFJ+toUcJgDVDo1
	ThjvoF1uuAzzuK+7E7zWk7eecqYNTOnI8Tjqxt1s8gHY7b2txxMoD6TNJaFERGNscyyuxPzAPce61
	vaf94BYbMtXZJ56BLv/tTv7hUT59CHZgMWOQqzE238YGzfyjUP8WezNqLP02ls3emrTTxuNHdP1fn
	IUgZ1wI5L524886EXFTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwQY-006AfW-1u;
	Thu, 13 Apr 2023 12:51:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwQS-006Aaz-0F
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 12:51:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id n9-20020a05600c4f8900b003f05f617f3cso14684833wmq.2
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681390299; x=1683982299;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49xLVHrspKSm1a8wJCoZVRSlPwE9xT9Y1ZadXVyJNEg=;
        b=2z5oZXaHlOTvgVBwEE09zefyoiTfL7dXyOrL3UaR6bRqtM5aMl+yBKFpfvriLk4nUf
         5V6y0EqAS8uB36aEwDwy0wizxzcdwIy2qwot0XH3fQw69N2dRIUWCBTpdpwH3KkUU1Vo
         6vqCB4w8u5E5kw7CoPLa2T8Xz95KU2Wka5ZPo/9P5Alf5l0NnfUFzFlfR+0YEEl42OGr
         g+9BlpzFBlMZyqRfTFcq8zfehSi6cX+OyXkc8381As6ZYEZHW+LNpQdf/taYlSrbmpCB
         pS8N7wUt6wISOFT9j2rO2RNZ1pbvFHe7A3n9ltE/qMPAfjYg7tyugtkji9qV3kCrjXa0
         SbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681390299; x=1683982299;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49xLVHrspKSm1a8wJCoZVRSlPwE9xT9Y1ZadXVyJNEg=;
        b=kkX+Yx+5RxekvgOy5d8OK53Bv4N6j3TDJaDIqubnpXoDe+BRVvn2FrSYc13eKHDj09
         e4DfRBzfGVABRnWkCvZBoyY4j7qU+Wn6lQDwSOq34vnbSdDVZFljehsn28d63AJbiVPy
         fV5aXmcsuqaZG7scbxZkEUtPBIBuzYwHsG+Y9XOSoLte0CEgCbXGYQbFWeSBbbd/5dLL
         QRZgMRjlv6JXAdxvQd8xjYEr3GRH6moUB8duXyyEu13Kj7Gzg5amE4DCAiU5WN5WQbOy
         F8LSZuaPUbdrSuhgPB2hZFIGU0Da4HJGev3cBSMiLAcmmfkOy1uHQkg0xWF/BDhjqVyv
         2Cqg==
X-Gm-Message-State: AAQBX9dE5+h4pQriSD3mJ3ln+N2pUb3IE/RXzQJujZFLX/3wUl2x71uQ
	iWu08F5+8ySTGr6H1s2g4Kzd5w==
X-Google-Smtp-Source: AKy350YNCcu7sfyoJFtK9vQbTWVf2clHHcvIihFMcemmZYifJ9kTOlj3H2x67y3zZ17zDEUT00tu9A==
X-Received: by 2002:a05:600c:2304:b0:3f0:7f07:e617 with SMTP id 4-20020a05600c230400b003f07f07e617mr1799961wmo.8.1681390299485;
        Thu, 13 Apr 2023 05:51:39 -0700 (PDT)
Received: from [127.0.0.1] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d66d1000000b002f67e4d1c63sm156356wrw.12.2023.04.13.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 05:51:39 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH 0/2] Fix mtk-hdmi-mt8195 unitialized variable usage and
 clock rate calculation
Date: Thu, 13 Apr 2023 14:46:24 +0200
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v1-0-b8482458df0d@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKD5N2QC/x2MQQqDMBBFryKz7oAxDdSuu6iLnkCKTMzYzMIoi
 RRFvHtjl4/3/9shcRROcC92iPyVJFPIoC4F9J7Ch1FcZqjKSpdXpXGQlRMOU8RxuanaoHej4Ow
 3rFkZpa2xRA7y31JitJFC789CnnSB16V7Pl7N6efI/1iW7fs4fk/ly4mLAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_055144_399837_45DFE016 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
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

I've received a report from kernel test report [1] that a variable was used
unitialized in the mtk8195 hdmi phy code.

I've upon fixing that issue found out that the clock rate calculation
was erroneous since the calculus was moved to div_u64.

I'm providing those two fixes on top of 45810d486bb44 from the linux-phy
repository [2].

[1] https://lore.kernel.org/oe-kbuild-all/202304130304.gMtrUdbd-lkp@intel.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
Guillaume Ranquet (2):
      phy: mediatek: hdmi: mt8195: fix uninitialized variable usage in pll_calc
      phy: mediatek: hdmi: mt8195: fix wrong pll calculus

 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
---
base-commit: 45810d486bb44bd60213d5f09a713df81b987972
change-id: 20230413-fixes-for-mt8195-hdmi-phy-9e1513b5baad

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>


