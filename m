Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBC9C74A4B
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 20:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEa+VzyXGmMo8k+OhfFO6nrKKSd1RKBu+PutBDnuaPU=; b=seQZo5FsUsCvD1ZAdPSlqtpG4p
	OzXUfh/jk5LJKkxyOm27A49DQG3hYQItQ8M5TqJyMcckL5rI/W/fQml2Zvh0w+IEytDGf+ksfhQeu
	b859tKgs6HYeOPU08cZYg4Gmo7SRGnuf7ab/iITzZBvkNU5qQ3CJfdFamf0i7NZWa4pY5ww6Jog2M
	lwPkiM8lwVjPvZ1dLF3OtmBzLGLjrlWAwAznpWAAiOtUYXtJytWrEtEnPw4Qvfq8CBW8/G42E8VAx
	yia6UEg8uzURIIj02H1VgrJbVVz8p3NnXc3luRTDX3k8x9PiT27X398hsbxRdD18V5rjh/K6O7Z8F
	Yodex0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbS1B-003Qrc-5q; Sun, 12 Mar 2023 20:10:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbS17-003Qqu-Nd; Sun, 12 Mar 2023 20:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EEa+VzyXGmMo8k+OhfFO6nrKKSd1RKBu+PutBDnuaPU=; b=j1nEDkOjxpnnRy0axAW7EmHNun
	n/36i/yQUnBRvy76G6quvVhPn5cPmeG/cbz8OPkzyOIEqlaJ3MYL4REE5sCCWL7NTFBwAVDLrRvUP
	FKH6+T+ohBePyo/iNMIMD9WIFjj75Mrbqpuga9DiME6TLk/uqYJBShxNmqlCsVFMPI1RRA/jW6PuM
	YUCXE+bmzbqsc/gsu3PgZMtILlofxWv+dngPHLlRhGORoQC/p3sws097Kvik2mfU8wk+kU7b+d80O
	/7W5eYyUmcAF2QPu4inYwlpcMcSYSN6qGD92AYRcyev6BuY6lfKNFtBNru70O4HJ2lvLsoh7JncEM
	YVN8npjw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49170)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pbS14-0001rj-JQ; Sun, 12 Mar 2023 20:10:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pbS13-00070e-4S; Sun, 12 Mar 2023 20:10:01 +0000
Date: Sun, 12 Mar 2023 20:10:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Daniel Golle <daniel@makrotopia.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	Alexander Couzens <lynxis@fe80.eu>
Subject: Re: Re: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc:
 fix 1000Base-X and 2500Base-X modes
Message-ID: <ZA4xmRTTm0vjHmMN@shell.armlinux.org.uk>
References: <ZAijM91F18lWC80+@shell.armlinux.org.uk>
 <ZAik+I1Ei+grJdUQ@makrotopia.org>
 <ZAioqp21521NsttV@shell.armlinux.org.uk>
 <trinity-79e9f0b8-a267-4bf9-a3d4-1ec691eb5238-1678536337569@3c-app-gmx-bs24>
 <ZAzd1A0SAKZK0hF5@shell.armlinux.org.uk>
 <4B891976-C29E-4D98-B604-3AC4507D3661@public-files.de>
 <ZAzk71mTxgV/pRxC@shell.armlinux.org.uk>
 <trinity-8577978d-1c11-4f6d-ae11-aef37e8b78b0-1678624836722@3c-app-gmx-bap51>
 <trinity-27a405f3-fece-4500-82ef-4082af428a7a-1678631183133@3c-app-gmx-bap51>
 <trinity-eb5bbb4a-b96f-4436-ae9f-8ee5f4b8fe9b-1678639848562@3c-app-gmx-bap51>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-eb5bbb4a-b96f-4436-ae9f-8ee5f4b8fe9b-1678639848562@3c-app-gmx-bap51>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_131005_793672_41F9DAF3 
X-CRM114-Status: GOOD (  15.64  )
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

On Sun, Mar 12, 2023 at 05:50:48PM +0100, Frank Wunderlich wrote:
> Just to make it clear...the issue with the copper-sfps is no regression of this series it exists before.
> i only had none of them to test for until this weekend....my 1g fibre-sfp were working fine with the inband-flag.
> 
> this patch tries to fix it in mtk driver, this was rejected (as far as i understand it should be handled in phylink core instead of pcs driver).
> and no more in the v13, so we try to fix it another way.
> 
> whatever i do in phylink_parse_mode the link is always inband...i tried to add a new state to have the configuration not FIXED or PHY or INBAND
> 
> drivers/net/phy/phylink.c
> @@ -151,6 +151,7 @@ static const char *phylink_an_mode_str(unsigned int mode)
>                 [MLO_AN_PHY] = "phy",
>                 [MLO_AN_FIXED] = "fixed",
>                 [MLO_AN_INBAND] = "inband",
> +               [MLO_AN_INBAND_DISABLED] = "inband disabled",
>         };
> 
> include/linux/phylink.h
> @@ -20,6 +20,7 @@ enum {
>         MLO_AN_PHY = 0, /* Conventional PHY */
>         MLO_AN_FIXED,   /* Fixed-link mode */
>         MLO_AN_INBAND,  /* In-band protocol */
> +       MLO_AN_INBAND_DISABLED
> 
> is my start the right way?

Oh ffs.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

