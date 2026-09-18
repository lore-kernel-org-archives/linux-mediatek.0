Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBD3C982DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 13:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=; b=yOSy4HfVrl6hNTBlfJt10BhjsB
	JZNz8GFU742x9n6fZKU16hIl4oFYrNsg0LF9w+y5r/+OXHZ04uxmubq3qtqMhbxmP9oj22H/M41it
	axY6qeAztMFWL8ivF9YwZJbAR+PjWw/xScFs7CknXhmVI5jxX7bF4+AmfB8wcPlNebqYDBNDck6zW
	mLRlXHNEHf7LXyFnIQ02aWG7Kr7O4OrYaQWtFL5cU9Dz1FWGYW7oUChR1SHiGIKyEzo0jMVJ2kPiE
	/dn6u5fl9R1REezhLDAtPjcLBIHmzaxZLZqhnw/TccLLFUAPgTdclUATsUOIQUUiZP9/9tB/MYyJJ
	ypcMocxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Yoa-0000000EaJA-3rjo;
	Fri, 18 Sep 2026 13:39:44 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YoY-0000000EaII-1QY1
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 13:39:43 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so734301a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2026 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738781; x=1790343581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=;
        b=Iqd3V920jLsuEnMksCQoNZqxEdKw92as8yQVHTk2dbUrF3fpBCK+nDtEswbiWw1ITB
         nRiMSQFB/yu65jISw4CcYaPTxzQ+yV/BSeyh4TQeDEs/7pEBc7ycagU2PLnugfRfujZy
         4Hu2NcK2DZGzUY75XsdMhf6fJzeZzXFtpGeq77OUwjDr8MDyACl89VNjmkFcCPiIisSe
         VMA7+jcHvZnDdDvHFy2zvG8H8O8Kg2YWOHO8JC1wQ4XnXQsiJkdGb+FW6hbgQ9doF7Ly
         pImLPVBDrT07cfnMr6DG2HqD1ZC88dt9yqMXXb4LAjQ3PUEd9vuhHa4JrJNP9ByTHu1R
         dCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738781; x=1790343581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxsRadM9sjHy6Zgyy9bUhpwEa5BB107/pv0esjxDrJQ=;
        b=Eq8tUCr9kJrvhTbREugfHgIxQvB2Gg837xa2g3uLDIY0Fnt0XNCuQA0NrPlBIuwzsj
         wnymvF0Zhmqyp7wvYf0XzyJ6WKp9IYUsqibTZ/AJPH8BA0vcslTkbwx1JYor8K2cSp48
         b5mwA0bI4/u4hszmc8Cno/2FkZdA0MGhmC8Jh5H5hg4gGzoN1Gg3Sw5wXAB4wLOOTn9N
         dd+HkLtFuJtrA48x9yDjbxHT4nnXAmuRRVdQNL+xilAmGuZ6Q/ZROcgLzkxu20gaDBZD
         TpBBUJs1PBaI9x+VGhDjyry3/8/54eb+/AwfARhflzK9hwbvQBWiG4GCSI+WFgKBT55u
         fPVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhEizhY12NF4vL9jTZ+dWPe2ZOukGhQAMAZXs5OJO3Y5VPtivTYcfxLaV8X/5ynWuptI34ZQJyqOg0AX/hBA==@lists.infradead.org
X-Gm-Message-State: AFuF++llpO6O+m01ZT34sznDMCWrKMvgAWDEm5aA34ybNM2rh6o8H2Io
	FXdjzWvzNl5MOODoV/NIvdELUBZNrTvfnJK9Lj54Z9n3JyjCWd0eD+qsNs57kg==
X-Gm-Gg: AYBFou1e6MEB8o+3qbyRS6mV3eeEfihKlPbCOD0qzF2YDltvBx9XZ4x1WWmcpksTXPG
	ztSzC3FLh/RfGebOaIuW/qmiLUH2y8t2+ZBTpS/uhg3st0ny1pOIqfhwf5fHNuOqDvlLFlthSZc
	H+E+Ci9za7myPXZX/qNjZKmeVH6FqoLZ2v6KpM6pWOd9biB6ospjGY8389rHmm7koV0haGrHZlP
	7aEWdqlt1F55YwBo4zS32+vrDwdHWmhgr7gn6JMboquI2icbCc0DCZSw0Ahqjjr0O4guwoSJg+d
	1yEjMF9ZMSeCO5wy9XEtbGXJqU8FaJaDUaneIPu3g7oEd+qBcJGHE/5pxRL/HBotXMKAG8eSXC9
	UoW6GT4eLHls9Aijm4lgLDlszzbfMBJ3SeKEb/iNnBe3pWfEldqSbmdhDdMuCZjZW+hGWdPFv7Z
	lN+YqKqAZd4VB8PkRHQ7VfIlYRcOv6HDGQfwkJX6YU61X5UsUEVY+tsGVt2G6ETN/bNu28fxmWl
	0ij9xWHiOd28Bqp+8xU6EZ/8lhCjOYkk3mO3q30hVeu03jBh9v4K3fm9djooehJKLZWIVmtM6pv
	ytAThTEvuMxY1A==
X-Received: by 2002:a17:90b:2dc3:b0:39d:e9b6:cec9 with SMTP id 98e67ed59e1d1-39e54d36756mr10232434a91.7.1789738781094;
        Fri, 18 Sep 2026 06:39:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:40 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/15] ASoC: mediatek: mt8192: Improve error handling
Date: Fri, 18 Sep 2026 20:38:56 +0700
Message-ID: <20260918133912.133799-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_063942_411313_9D147D43 
X-CRM114-Status: UNSURE (   7.99  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all, 

This series addresses part of the error handling in the MT8192 driver.

It propagates errors from clock operations, GPIO requests, and DAPM event
handlers, and uses dev_err_probe() for cleaner probe logic.

Compile-tested only.

Best regards, 
Phuc

bui duc phuc (15):
  ASoC: mediatek: mt8192: fix APLL mux error handling
  ASoC: mediatek: mt8192: fix AFE clock error handling
  ASoC: mediatek: mt8192: fix error handling in APLL enable functions
  ASoC: mediatek: mt8192: fix MCK clock error handling
  ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
  ASoC: mediatek: mt8192: Use dev_err_probe() in mt8192_init_clock()
  ASoC: mediatek: mt8192: Propagate errors in mt8192_afe_gpio_request()
  ASoC: mediatek: mt8192: Use dev_err_probe() for devm_pinctrl_get()
  ASoC: mediatek: mt8192: check return values in mt8192_afe_gpio_init()
  ASoC: mediatek: mt8192: Handle regcache_sync() failure in runtime
    resume
  ASoC: mediatek: mt8192: Remove redundant error message
  ASoC: mediatek: mt8192: Propagate mt8192_afe_gpio_request() errors in
    ADDA DAI
  ASoC: mediatek: mt8192: Propagate errors in TDM DAI DAPM event
    handlers
  ASoC: mediatek: mt8192: Propagate errors in I2S DAI DAPM event
    handlers
  ASoC: mediatek: mt8192-mt6359: Fix error handling in MTKAIF
    calibration

 sound/soc/mediatek/mt8192/mt8192-afe-clk.c    | 163 +++++++++++-------
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c   |  94 +++++-----
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  12 +-
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c   |  44 +++--
 sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    |  20 ++-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    |  18 +-
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      |  37 ++--
 7 files changed, 240 insertions(+), 148 deletions(-)

-- 
2.43.0


