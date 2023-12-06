Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5C9C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 23:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2PrTW3nyo92scL20Ekap9nlWMoYhz1YGjtYVc4UbsDk=; b=gjfxkr8lXrN0uBTrft243ztTyq
	H3f0ClXP4C2CUJEdaXDvnLtHekQI4YxbV85fH5mhRM3eQjiNLyNuYNOELBvj0mDyu3SzRYLY/m4F9
	BSuL2Cp3InofmSZDn24Yyy1YfVicFkMCAD1FY1QpKqwxpM6Xe06UNxZnYvBTdPkW8KiSeHS0Gf/8b
	sGFeAF0YShE3bfLUbViepaG0f08wrnwQSWhgqakyVGU2u0jHmjXOrBbfSYFBYQQjySjCNdepwZXHc
	TYguuNlaeMTviJCIfD14f1R4ewTN4C/JKFoaaUs4eneBfNC1Cl5YtnU3wkjILJTWnl/IoQcoRw86v
	VYjSnCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rB17t-00BSnF-20;
	Wed, 06 Dec 2023 23:16:21 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rB17o-00BSkN-39
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 23:16:20 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-daf702bde7eso389431276.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Dec 2023 15:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701904574; x=1702509374; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2PrTW3nyo92scL20Ekap9nlWMoYhz1YGjtYVc4UbsDk=;
        b=qbhAHi+m26UMdkPAneypbcBmEJWyoe+DANjOK2pcTi5NSiazAJLKVXAW3fp2r0p8wG
         1+KqIPvFZUex4LZNgzK9blOFBkLjAHfRk5tWFyfy5auihHFfNuoXq2gpsqQlZif9Tcq3
         KUeY+0gh/nHVr2LnYthDDIBKEJHl0yS/uPNX8z2TtxxPV+M5mG/Lzic3817izhr/zPTR
         oFRTvqTd0SNyftlq34rkHwSyfyaP1VSKIiZXoXN0NVdvxrOGyOrUFepDVlCMshCLCIzh
         //skQmmM6oQgCxyuJ8riuFbnBNaEFeQCKRQ8v2/l0wSpmLoX5dWlD2CIQ1iXeGLCBJnC
         G8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701904574; x=1702509374;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PrTW3nyo92scL20Ekap9nlWMoYhz1YGjtYVc4UbsDk=;
        b=gKjMGSfAPF4gIJ3ssFZzN0epmr9p9ga7dO5TFRwoEvP6WOx3znQQPyC1Wv+Yv7qaM5
         4/g1NSWQT+Tm7nJYqSRUFyyKWtLVMqzKJluX57WR5lQTHmKgJDFziFsE34xGOe9VVFnC
         4yOQd0RFVjLy838UxiuNSXGAJbJjApGwYdOpuRUAJprCHWGeIerWTswxUNVi1AVbLKpC
         8OF11U80skN2MllwarQT9jeKUdPLiVhvfECu+xeBYerfCqfpXp3lhRjObldXnlJ7OUz4
         7CMIg50q9b0z/Jx6+vNA96/LM9WrMyGrStVLtbC4oblQqdYD6QVBzZq6lOFkoP5+T1pQ
         Peqw==
X-Gm-Message-State: AOJu0YxAQ8zPuxNDoWD0nuVqUmNxxBfxOnb6WxY+mCxo5SCeKtS76iLe
	jADZFwrEwBzG+DvG7K1UDg/xso/T1OjuuCBkug==
X-Google-Smtp-Source: AGHT+IF8Oo3DT9loeb9aEty1FTzi+++EbnOCGNjlZWHZ7P/6knrHCLDtwnFQ4WffwShG/pP4xjX6s5KGOGOlpxebFA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:8707:0:b0:dbc:1c42:f29a with SMTP
 id a7-20020a258707000000b00dbc1c42f29amr22315ybl.9.1701904574326; Wed, 06 Dec
 2023 15:16:14 -0800 (PST)
Date: Wed, 06 Dec 2023 23:16:09 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALkAcWUC/33NwYrDIBgE4FcpntdF/Y3WPe17LKUY/ZMIaQzRD
 S0h717JpVka9jgM881CEk4BE/k6LWTCOaQQhxKqjxNxnR1apMGXTAQTwJmoKOYux9hfx9+cruE
 29tRyqU3T1E4jI2U3TtiE+2b+kAEzHfCeyaU0XUg5To/tbOZb/487c8qoshVYAx5qLb7bGNseP
 128bdws9oQ6IkQhmFfa1d6zCs5vBOwJfURAIUAqZZ3SBph8I+SLKMYRIQvBJXI0Qp+lUX+IdV2 fMJRVs4YBAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701904573; l=4962;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=hX2m37gMZ5rAPKE+4kIVNycVYHBLG9ddRIJkMzUA6RI=; b=RvWHJ4xB9uVWwwcYYhFFHSc6UhVUTEXYdWVlyy9npIwevwaSWmJxWI3522jpPRhH+RhKEPd8/
 mDoZWqOJHC1DGpRyOIT3ZrhP/AxPdcb5WKstGVNQh+tjqNS2vR9a4uF
X-Mailer: b4 0.12.3
Message-ID: <20231206-ethtool_puts_impl-v5-0-5a2528e17bf8@google.com>
Subject: [PATCH net-next v5 0/3] ethtool: Add ethtool_puts()
From: justinstitt@google.com
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shay Agroskin <shayagr@amazon.com>, 
	Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, 
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>, 
	Sudarsana Kalluru <skalluru@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Dimitris Michailidis <dmichail@fungible.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Louis Peens <louis.peens@corigine.com>, 
	Shannon Nelson <shannon.nelson@amd.com>, Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ronak Doshi <doshir@vmware.com>, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	"=?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?=" <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"=?utf-8?q?Alvin_=C5=A0ipraga?=" <alsi@bang-olufsen.dk>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Lars Povlsen <lars.povlsen@microchip.com>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Kees Cook <keescook@chromium.org>, intel-wired-lan@lists.osuosl.org, 
	oss-drivers@corigine.com, linux-hyperv@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	bpf@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_151617_018691_ACECA15E 
X-CRM114-Status: GOOD (  12.46  )
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

Hi,

This series aims to implement ethtool_puts() and send out a wave 1 of
conversions from ethtool_sprintf(). There's also a checkpatch patch
included to check for the cases listed below.

This was sparked from recent discussion here [1]

The conversions are used in cases where ethtool_sprintf() was being used
with just two arguments:
|       ethtool_sprintf(&data, buffer[i].name);
or when it's used with format string: "%s"
|       ethtool_sprintf(&data, "%s", buffer[i].name);
which both now become:
|       ethtool_puts(&data, buffer[i].name);

The first case commonly triggers a -Wformat-security warning with Clang
due to potential problems with format flags present in the strings [3].

The second is just a bit weird with a plain-ol' "%s".

Changes found with Cocci [4] and grep [5].

[1]: https://lore.kernel.org/all/202310141935.B326C9E@keescook/
[2]: https://lore.kernel.org/all/?q=dfb%3Aethtool_sprintf+AND+f%3Ajustinstitt
[3]: https://lore.kernel.org/all/202310101528.9496539BE@keescook/
[4]: (script authored by Kees w/ modifications from Joe)
@replace_2_args@
expression BUF;
expression VAR;
@@

-       ethtool_sprintf(BUF, VAR)
+       ethtool_puts(BUF, VAR)

@replace_3_args@
expression BUF;
expression VAR;
@@

-       ethtool_sprintf(BUF, "%s", VAR)
+       ethtool_puts(BUF, VAR)

-       ethtool_sprintf(&BUF, "%s", VAR)
+       ethtool_puts(&BUF, VAR)

[5]: $ rg "ethtool_sprintf\(\s*[^,)]+\s*,\s*[^,)]+\s*\)"

Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Changes in v5:
- updated documentation to include info about the lack of a trailing newline
  (Thanks Russell)
- rebased onto mainline
- Link to v4: https://lore.kernel.org/r/20231102-ethtool_puts_impl-v4-0-14e1e9278496@google.com

Changes in v4:
- update documentation to match:
  https://lore.kernel.org/all/20231028192511.100001-1-andrew@lunn.ch/

- Link to v3: https://lore.kernel.org/r/20231027-ethtool_puts_impl-v3-0-3466ac679304@google.com

Changes in v3:
- fix force_speed_maps merge conflict + formatting (thanks Vladimir)
- rebase onto net-next (thanks Andrew, Vladimir)
- change subject (thanks Vladimir)
- fix checkpatch formatting + implementation (thanks Joe)
- Link to v2: https://lore.kernel.org/r/20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com

Changes in v2:
- wrap lines better in replacement (thanks Joe, Kees)
- add --fix to checkpatch (thanks Joe)
- clean up checkpatch formatting (thanks Joe, et al.)
- rebase against next
- Link to v1: https://lore.kernel.org/r/20231025-ethtool_puts_impl-v1-0-6a53a93d3b72@google.com

---
Justin Stitt (3):
      ethtool: Implement ethtool_puts()
      checkpatch: add ethtool_sprintf rules
      net: Convert some ethtool_sprintf() to ethtool_puts()

 drivers/net/dsa/lantiq_gswip.c                     |  2 +-
 drivers/net/dsa/mt7530.c                           |  2 +-
 drivers/net/dsa/qca/qca8k-common.c                 |  2 +-
 drivers/net/dsa/realtek/rtl8365mb.c                |  2 +-
 drivers/net/dsa/realtek/rtl8366-core.c             |  2 +-
 drivers/net/dsa/vitesse-vsc73xx-core.c             |  8 +--
 drivers/net/ethernet/amazon/ena/ena_ethtool.c      |  4 +-
 drivers/net/ethernet/brocade/bna/bnad_ethtool.c    |  2 +-
 drivers/net/ethernet/freescale/fec_main.c          |  4 +-
 .../net/ethernet/fungible/funeth/funeth_ethtool.c  |  8 +--
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c |  2 +-
 .../net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c    |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_ethtool.c   | 65 +++++++++++-----------
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c     |  6 +-
 drivers/net/ethernet/intel/iavf/iavf_ethtool.c     |  3 +-
 drivers/net/ethernet/intel/ice/ice_ethtool.c       |  9 +--
 drivers/net/ethernet/intel/idpf/idpf_ethtool.c     |  2 +-
 drivers/net/ethernet/intel/igb/igb_ethtool.c       |  6 +-
 drivers/net/ethernet/intel/igc/igc_ethtool.c       |  6 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c   |  5 +-
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |  2 +-
 .../net/ethernet/netronome/nfp/nfp_net_ethtool.c   | 44 +++++++--------
 drivers/net/ethernet/pensando/ionic/ionic_stats.c  |  4 +-
 drivers/net/ethernet/wangxun/libwx/wx_ethtool.c    |  2 +-
 drivers/net/hyperv/netvsc_drv.c                    |  4 +-
 drivers/net/phy/nxp-tja11xx.c                      |  2 +-
 drivers/net/phy/smsc.c                             |  2 +-
 drivers/net/vmxnet3/vmxnet3_ethtool.c              | 10 ++--
 include/linux/ethtool.h                            | 13 +++++
 net/ethtool/ioctl.c                                |  7 +++
 scripts/checkpatch.pl                              | 19 +++++++
 31 files changed, 139 insertions(+), 112 deletions(-)
---
base-commit: bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
change-id: 20231025-ethtool_puts_impl-a1479ffbc7e0

Best regards,
-- 
Justin Stitt <justinstitt@google.com>


