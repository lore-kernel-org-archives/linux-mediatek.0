Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85362EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jul 2023 09:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pi0neW334vEUn9BnnI+UYaAU5ZZLFAfHbjZLAic+fdQ=; b=sRG7vIaBFJjmjH7juNEWxx/UWq
	LqA1GAUzBi/qGZMyOT61BMMhOmLpwOE4eJdvcSCvDCsZEikVgbzBHAzDvoPo/g4pmO+0dgsM/4xYp
	3xnrsMnw+kAaRpVNPW68a7auCju5Jppf/d7kVkoMzsJucx/76RCVTKNK2O/TfQj9r6bOcFRWHPoNj
	tvV732+kWQYRJY4Vi3kf3+EWv1AcC6/TT2ugMZDviBNqluWu569aIrBU1cCvFQfYrTy7056bem89I
	i+TVcQnpgOVv0Ak8KKmM51nHPbvAIaNmBHOwL6glF0KqT4gzYN89DBDRvcnwj9u4BfPttSCoCfDOx
	qy/mLqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkh-00AvbB-20;
	Mon, 10 Jul 2023 09:00:15 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qImkf-00AvaD-05
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jul 2023 09:00:14 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6f0508f54so63493431fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979611; x=1691571611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi0neW334vEUn9BnnI+UYaAU5ZZLFAfHbjZLAic+fdQ=;
        b=EqBWfD3g9G1f2j+bgRXH5wRADIaccx1W0vEhGOo3hNKnmlyLuJx4VJJ7mTzA/k0i2d
         F+7KfZoiLqYu9xNbaAdf4xyciku5hdX7Fm7MXl/i+Ycd9Zn7qWq+IsBhcwjC+zwJBXpq
         ghM9Bf2gyNLr2cbrh48lSiYil8EFiWr+pFopsMPdriUzrqEuCE4KE1eRE/E7SKosr4MF
         Dd9xTvJ6brdf1TpX+x3ThA/7st5nwDz71MIAWAZTG6Cds93Vh46UdxVVSJCZ9MMbIGaG
         SflTHiNb4yIx1+hAc//E50HZyvTzAQHZFZrKtppJ+7GmP6up/KqbHNltSfszxujOo+BU
         qsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979611; x=1691571611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi0neW334vEUn9BnnI+UYaAU5ZZLFAfHbjZLAic+fdQ=;
        b=dhQ+qeYl6lhNSIi8Chq3/zAcUe04Gn2cQyfhXXZeoP+1ZzPX+dxIkTG92M2uhESoaU
         bWc3bXFFjcA+YIAE9OhGGTpSyWIhoYOqTJ2sPF2oWpWmGYOjlV34oHvaEdP0+yRK3hD/
         j803H8E1g2acZw0362hjss1IiMOAWPI+3/zj5yp6go8OqT5opSl2Had8jOtfJOe5W55f
         yA+nJgjjpU7tNDBh+O4PH7APff0sRpOe54tPbeCHte/cqR3jRO24UXUhxPlce4g9+klR
         YdTnzrTsxGQvOMNx1hMHyCgvIVUSbIlBsOgjuYdFjBha9c+UEEtF25SijvPLKFkBMLFr
         3Oqw==
X-Gm-Message-State: ABy/qLa2WaQDHraDV83QRThRBhYWvOo4fwyZ8zk9Z/LPgsHyHe7unqDN
	weiRPoF/2+GyGdbrHYSWKU67dw==
X-Google-Smtp-Source: APBJJlEjnwa6aLt1S4/l0UmZLQcAqJFRGPgprZQ9W+4d6fTrF3qCcNsLykNlD/mAdr8AMz3+iYLvsA==
X-Received: by 2002:a2e:b0c6:0:b0:2b6:a7dd:e22 with SMTP id g6-20020a2eb0c6000000b002b6a7dd0e22mr9274754ljl.48.1688979610963;
        Mon, 10 Jul 2023 02:00:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:00:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH net-next v3 00/12] net: stmmac: replace boolean fields in plat_stmmacenet_data with flags
Date: Mon, 10 Jul 2023 10:59:49 +0200
Message-Id: <20230710090001.303225-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_020013_068679_8990606B 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As suggested by Jose Abreu: let's drop all 12 boolean fields in
plat_stmmacenet_data and replace them with a common bitfield.

v2 -> v3:
- fix build on intel platforms even more
- collect review tags from Andrew

v1 -> v2:
- fix build on intel platforms

Bartosz Golaszewski (12):
  net: stmmac: replace the has_integrated_pcs field with a flag
  net: stmmac: replace the sph_disable field with a flag
  net: stmmac: replace the use_phy_wol field with a flag
  net: stmmac: replace the has_sun8i field with a flag
  net: stmmac: replace the tso_en field with a flag
  net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
  net: stmmac: replace the vlan_fail_q_en field with a flag
  net: stmmac: replace the multi_msi_en field with a flag
  net: stmmac: replace the ext_snapshot_en field with a flag
  net: stmmac: replace the int_snapshot_en field with a flag
  net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
  net: stmmac: replace the en_tx_lpi_clockgating field with a flag

 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 23 +++++------
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  5 ++-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  8 ++--
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  4 +-
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  2 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 10 +++--
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  5 ++-
 include/linux/stmmac.h                        | 26 ++++++------
 12 files changed, 76 insertions(+), 57 deletions(-)

-- 
2.39.2


