Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B66606A33E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JSxsny4k;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DkX6gtMg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=; b=JSxsny4kh+fVfJdGbpIlQ3SwgB
	HkhUjTkHxjHKKxUw1XfYpm2dbKlfZkZs9W3YFxXbO2md9AOskGBrOKeYKsJGcwKnlxcESW6mwRamo
	oqDxqwiBzdT1f1++PwMDyumr3mVRQp5xrz8Rcau3rAh5lsbZfY3NZJ05Jzrt3Yd+bUpcLEOc99Af0
	LzfkoH+eJSjbiRKRm/DDjdXTog2cCsV5NVutS4a8uHbYlA96e3h0GdaPQ0p73SCLMgwdgKnp4T/Tu
	V8lH9UurXpC7nHCaU/QKkL8uMntcDc4CT1LAR3qy2LM29MaQI+t8xlR7zniHPjnRMKuJu2kzhmEhf
	V40owg6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7j-00000008Ved-284c;
	Thu, 05 Nov 2026 10:55:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7f-00000008Vba-0W7m
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 10:55:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso8072435e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 02:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876109; x=1794480909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=;
        b=DkX6gtMgpNIp/xB3jP0BL+xquD1tWJ6bZuaXQLzzeLZCuYn/s037JmxoHM1tZLgelG
         7bZ72jdOmSVYV/R7t0CvOEjmgXg9dmT+wFki99FMjpiNztYW6ReloLEPrDEI4oaJwqr/
         7pxx/WHcikyVt5JWu1eUhnLFgUxva4Xo7HAWJAEfH/R94wAsYo0Oofx2Uig5fUZ/x6xA
         IzeTpEyaEU5f0LMCkLDfv2ASlrM8Dx4v+M/P9/wbhwckcuy3+OwDeAOahefT51ZGYncZ
         hK40CEkTxSytluBB55yMk5EgmPl8kqYd7bzlVXz1P0oS+cB6cSMDdz3cPCUMW7X7ihZV
         KiqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876109; x=1794480909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S3kBGMpJUDqyGZZ/3EY9QtmjH3XQ/06sMAWybkANdok=;
        b=VyO2sA2pn0lvVSNg3OUH0Dvb7LJPM7cElW2/94dpe+sWt7SpqYaprbSB1Q5cNfFtva
         rheVlJgGUFaF7TeogocGaVbqJzuDHqd1SBgcR8bP6k8JZyNs/oDZUzeWs8QXZVN+wthd
         Cft6uzcMBKTJAc+r2vYmhZrIjf1M6Kh0hw8hcE+X6Wk2HuyW1OOFmryPB/jrZjdC1Q/z
         Tx60GJM3OCy9PHuBy4qHbWFInY6rsEzEVvy1wSi/rRJNJ0Vgg+zlERS6WYJBVsEeAsji
         VWqkIuU9wh5oR29Av2sUhQd8W1DQJf2+j4sGKv16x3cgzwuHRNuyODzly2JfUrljby18
         j9TA==
X-Forwarded-Encrypted: i=1; AKwUvBzA5zJQE+E0c7+BkznZKKAO+M++DGi9ZlmwDZE1pmgzuLgCAQdncFmWc3sSfGOmtnTR0iF2SVYBxEcRO0qhVw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Rp4s+Q+7JP2VGJlxajFuKFE777gcvS8qkhXzpq469BNl1dgUA
	15Lk1TTGrLYUJBQ9ZV5KnWoZpH/hHTsslOs+JvryvTHZM00JcTHo9OPz
X-Gm-Gg: AYBFou3OELO5QaJn6NAodtWSG5K+ie9gmv8BlyDfR3xotym3geR3kMet8vHKfjXAooG
	nB+Gvfr2fvwt5aw7E/drvYHj7qqnArj5h18IT+8FepMY8nY9xbEhyS7yzKIndLn5yzfhG+bkUxP
	a4435M+uwoaNpCjP/RlOI+0eEwzC/nWS0C/TFLDybiKqd+vnCbAO4GqusHkjmmAuWJ3CiEGqBqJ
	TN97/rNpSNeBeNcxsE78uhXJaqdhDLk8pAH6PJuhItjSqee/cnkmo+eHwui8vdAkvsS0JgRI++8
	AzHNmss/SomP2h+nz9JWs/YyiOwYBET9t6HIzzwV6D9KXKknGo2Hhs7EQF+8SivsKtxVM9eb4Fk
	pOpRrkHTbGR2yzyMcXrebCaGeAjKeOyXzS6jDkyb+DOyEetpvWrHAzpDGo4YpFe1pKc2+fa8OQN
	+meu2LMXM8D+XZdHiDxbj+rh4sCVm6ceNZf4DuP8mg4et/qkroA7F3Je9gNvHFdn1glnm1VK75X
	arl7k5LkaE9iKz1KRvNsCamXthzO8H7iq7yqh3JmiIy/5nk5wPFFVNY6kbFjDgIw3Rkor6Fngdx
	Aih2ciFxkLbS8XKgIF7p/9m7W6v0DNFI/w1bL1C1dD25FQVXsLtO8PcFh1qB39kSXNZ0aByhPef
	Bk3N6DUQIA8FGcLoYj2dcK5VU
X-Received: by 2002:a05:600c:5397:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ac16acfceamr398713475e9.9.1793876108729;
        Thu, 05 Nov 2026 02:55:08 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm59576355e9.13.2026.11.05.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:55:08 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 0/6] net: phy: mediatek: calibration for AN7581/3
Date: Thu,  5 Nov 2026 11:54:56 +0100
Message-ID: <20261105105504.1024-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_025511_179103_9D80BC5C 
X-CRM114-Status: GOOD (  16.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This small series adds calibration support for Airoha AN7581 and
AN7583 integrated PHYs.

The calibration logic is quite big so I decided to split
the driver from the mediatek one to keep things organized.

Minor change were needed and just additional symbol to use what
is common between mediatek and airoha PHYs.

I followed the naming pattern of mtk by calling the new source
airoha-ge-soc and related config.

The calibration use lots of static table and software calibration
at runtime instead of using efuse to calibrate.

There is one pecularity where some register and calibration needs
to be done on port0 first and then with the related port.

This is O.K. as port0 presence is mandatory for the functionality
of the integrated switch and it's assumed to be always present
on the MDIO bus.

MAINTAINERS is updated to reflect the changed code.

(this was tested from a long time and also verified by Airoha for
correct order of calibration)

Changes v5:
- Add review tag
- Add additional helper for phy package
- Use __phy_package helper instead of phydev_p0
- Better use lock and unlock for phy package
- Configure base address for the phy package

Changes v4:
- Fix typo in Kconfig
- Prevent out-of-bounds for zcal_ctrl
- Protect concurrent rext_sw_calib_done
- Validate port 0 presence for calibration
- Correctly set shared local variable
- Use phy_package_init_once for shared tables
- Better handle early exit restore
- Better handle phy_select_page

Changes v3:
- Address comments from sashiko bot
- Apply review and suggested changes from Airoha
- Rebase on top of net-next

Changes v2:
- Split header register patch from cal_cycle part
- Fix missing EXPORT_SYMBOL_GPL

Christian Marangi (6):
  net: phy: mediatek: export __mtk_tr_write
  net: phy: mediatek: move MTK GE SoC registers define to dedicated
    header
  net: phy: add additional helper for PHY package
  net: phy: mediatek: split Airoha code to dedicated source
  net: phy: mediatek: add calibration logic for AN7581
  net: phy: mediatek: add calibration logic for AN7583

 MAINTAINERS                              |    9 +
 drivers/net/phy/mediatek/Kconfig         |   18 +-
 drivers/net/phy/mediatek/Makefile        |    1 +
 drivers/net/phy/mediatek/airoha-ge-soc.c | 1917 ++++++++++++++++++++++
 drivers/net/phy/mediatek/mtk-ge-soc.c    |  521 +-----
 drivers/net/phy/mediatek/mtk-ge-soc.h    |  374 +++++
 drivers/net/phy/mediatek/mtk-phy-lib.c   |   77 +-
 drivers/net/phy/mediatek/mtk.h           |   15 +
 drivers/net/phy/phy_package.c            |   57 +
 drivers/net/phy/phylib.h                 |   73 +
 10 files changed, 2537 insertions(+), 525 deletions(-)
 create mode 100644 drivers/net/phy/mediatek/airoha-ge-soc.c
 create mode 100644 drivers/net/phy/mediatek/mtk-ge-soc.h

-- 
2.55.0


