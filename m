Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE11CC25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6aQzvymgnykTJYyUNqos0M7PldrCbODsxg27QrFdA8=; b=iVUDganpYA1JwMJQVpCCmAclem
	L8EVEvILsVCdnWLLyBKLrCqcjXWHbtnUsc0lSl27J7X3dJZSbvS0hOGMsDBkJKe3TvIH6U2DCjCWQ
	ugaivuTUlN2MTh9xESZGfXTl9eTK9zTYrdxmcCOGrB/u1cZFoMkjw+wyiMk3P5wmoIffnOBZAllTq
	IOWItPZshbccHx28JigbHR73Jjh4V2+k+faI+2NSjZxAjIV+etClqbI1eG+QByLRT+37RkZRZiSOD
	Cn+0RXy7gJwgu6VB/CljmxqjSiOwiWLBvPo3L3XiVOV1Ei/mvlLIPKtxSyck46oMF9FGTiWRr/UrT
	HGjAok5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8fu-00FEvk-2D;
	Thu, 26 Oct 2023 22:17:58 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8fp-00FEuG-1Y;
	Thu, 26 Oct 2023 22:17:56 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40850b244beso10986115e9.2;
        Thu, 26 Oct 2023 15:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698358671; x=1698963471; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6aQzvymgnykTJYyUNqos0M7PldrCbODsxg27QrFdA8=;
        b=NS912GYX0h5I4oP0ID3qpAIm4h1yfZFSLaEnT7wkQWTUViDnFfgu6B66HWI4rnOIoX
         EDhVHT08nX/SG58HAM67+wVsVoQ6xHL4atIkGTiIVRBGuHxdT6EtMvgi51izt7l0tarV
         P8pl4GLWMigiFh5igS0K2sEX0bIEo5W8eahO3JEpxJ/90rxrmnC10kQOEPPog6vNoMvQ
         7GoTDmMJlsLj/GYEwC3dBXknoOwY9UAhJSEowhDaDdbVlAe/1jQ4qVab5ame5coq1rA0
         6Vn4uFirSB6FRurgRY367hzBhwAEcDKOPmE0zqMlaf/4xaaeFPdnqfl0VjQTCqw0qqp5
         Bigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698358671; x=1698963471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6aQzvymgnykTJYyUNqos0M7PldrCbODsxg27QrFdA8=;
        b=GRJYt39jAbTMDYztkSALl8J5E/7a94lZUm4eKczo+voZegUsg59mEQunI86kYSB6iw
         5QExC/YYT1/DsOAs0hw6oYaYCvYzW395RRh9FZRSliKp0x1ZZT0FbfHdxkQADzX86X0K
         9Tow7HIIXuRh8XGCReMc5boW6ul69PdtXapegCHQhZ0pfvxHAPfi1ypjCKSgQOcr2oZW
         tGPqqvu0XImkOvalh/J9o1TR2aN42ZsBEbMa0wBv1rXHJQQ6vhN/t0ZAx25qGcx7Qvxb
         P/fz3pkOzTrntDndtrlRsusEInysc16Bih8iJZJjfCZgtmapKCKU8bxPSQxQqaX+H9ps
         IV+Q==
X-Gm-Message-State: AOJu0YyJrPnVusvUOl8mxbpuumbgVI1IraBZ2HVPDOSJtOYHslJlLd++
	YCzHT3xW1lJfTXJkmOhmR2k=
X-Google-Smtp-Source: AGHT+IEXk7wu+BWH5PuNjLGzYfglJqQqyr64jFKw9mM2T6j/NSdcIcGUsTFFoYUci+YzMymGrg+hrA==
X-Received: by 2002:a05:600c:1d18:b0:408:4475:8cc1 with SMTP id l24-20020a05600c1d1800b0040844758cc1mr930072wms.35.1698358671120;
        Thu, 26 Oct 2023 15:17:51 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id v3-20020a05600c428300b0040596352951sm3541734wmc.5.2023.10.26.15.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 15:17:50 -0700 (PDT)
Date: Fri, 27 Oct 2023 01:17:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Justin Stitt <justinstitt@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>,
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Dimitris Michailidis <dmichail@fungible.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Louis Peens <louis.peens@corigine.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Ronak Doshi <doshir@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>, intel-wired-lan@lists.osuosl.org,
	oss-drivers@corigine.com, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH next v2 3/3] treewide: Convert some ethtool_sprintf() to
 ethtool_puts()
Message-ID: <20231026221745.uiqvn6avvcruyafx@skbuf>
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-3-0d67cbdd0538@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026-ethtool_puts_impl-v2-3-0d67cbdd0538@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_151753_539224_843D77F1 
X-CRM114-Status: GOOD (  17.91  )
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

On Thu, Oct 26, 2023 at 09:56:09PM +0000, Justin Stitt wrote:
> This patch converts some basic cases of ethtool_sprintf() to
> ethtool_puts().
> 
> The conversions are used in cases where ethtool_sprintf() was being used
> with just two arguments:
> |       ethtool_sprintf(&data, buffer[i].name);
> or when it's used with format string: "%s"
> |       ethtool_sprintf(&data, "%s", buffer[i].name);
> which both now become:
> |       ethtool_puts(&data, buffer[i].name);
> 
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  drivers/net/dsa/lantiq_gswip.c                     |  2 +-
>  drivers/net/dsa/mt7530.c                           |  2 +-
>  drivers/net/dsa/qca/qca8k-common.c                 |  2 +-
>  drivers/net/dsa/realtek/rtl8365mb.c                |  2 +-
>  drivers/net/dsa/realtek/rtl8366-core.c             |  2 +-
>  drivers/net/dsa/vitesse-vsc73xx-core.c             |  8 +--
>  drivers/net/ethernet/amazon/ena/ena_ethtool.c      |  4 +-
>  drivers/net/ethernet/brocade/bna/bnad_ethtool.c    |  2 +-
>  drivers/net/ethernet/freescale/fec_main.c          |  4 +-
>  .../net/ethernet/fungible/funeth/funeth_ethtool.c  |  8 +--
>  drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c |  2 +-
>  .../net/ethernet/hisilicon/hns/hns_dsaf_xgmac.c    |  2 +-
>  drivers/net/ethernet/hisilicon/hns/hns_ethtool.c   | 65 +++++++++++-----------
>  drivers/net/ethernet/intel/i40e/i40e_ethtool.c     |  6 +-
>  drivers/net/ethernet/intel/iavf/iavf_ethtool.c     |  3 +-
>  drivers/net/ethernet/intel/ice/ice_ethtool.c       |  9 +--
>  drivers/net/ethernet/intel/idpf/idpf_ethtool.c     |  2 +-
>  drivers/net/ethernet/intel/igb/igb_ethtool.c       |  6 +-
>  drivers/net/ethernet/intel/igc/igc_ethtool.c       |  6 +-
>  drivers/net/ethernet/intel/ixgbe/ixgbe_ethtool.c   |  5 +-
>  .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |  2 +-
>  .../net/ethernet/netronome/nfp/nfp_net_ethtool.c   | 44 +++++++--------
>  drivers/net/ethernet/pensando/ionic/ionic_stats.c  |  4 +-
>  drivers/net/ethernet/wangxun/libwx/wx_ethtool.c    |  2 +-
>  drivers/net/hyperv/netvsc_drv.c                    |  4 +-
>  drivers/net/phy/nxp-tja11xx.c                      |  2 +-
>  drivers/net/phy/smsc.c                             |  2 +-
>  drivers/net/vmxnet3/vmxnet3_ethtool.c              | 10 ++--
>  28 files changed, 100 insertions(+), 112 deletions(-)

What's the "next" branch that you expect this to be applied through, and
why is the patch "treewide"? It only affects networking drivers (I see
nothing outside of drivers/net/) - so it's "net: Convert ..." and it
should go through the "net-next.git" tree. The patch should be formatted
as "PATCH net-next" not "PATCH next", to make this absolutely clear.

