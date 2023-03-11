Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC103C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 20:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLT0g8df7rYJKk6srMN+2cPVnZ9SiqxI4tMkh+EKbMo=; b=22wjcMnqH+LF/QPvxzG8475QLi
	HPxKxB/2yfqPsQZ7dOwB0LabTZF6j8GTMB5SN0Ili/yzUVl2X9emfJul7uf03pE70c6/hDQQgDaOU
	fsInY2Wz+d+uGICMI+JrOvWFnoXFsc6SRtmnBwR6h7crdn/vb0GXGtj2ic4wjA5GYY4BjVKEbsy6S
	7ax784THENNm33ALGJigRYFHnlsxXC/yBhLUybZ/+c460PdfoSRXlkyLY8y7zvvvnW970hdaNHx08
	iCl/ydFKulLHowp2GpzM3bMLfD0gbNE9UPilDP8A/Q85jGKrlARBn3zghbYOvNSzyF46FBm1fwLlJ
	QBK2R0PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb5rj-001CGL-Ls; Sat, 11 Mar 2023 20:30:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb5rg-001CFA-At; Sat, 11 Mar 2023 20:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eLT0g8df7rYJKk6srMN+2cPVnZ9SiqxI4tMkh+EKbMo=; b=iUx42NHgule7LbFVNnod+IFhFa
	3qN42IDNyqQRllsJFaRM4ky8bNMMVQqgnBPhJz6kIPfU+k3CQpqlWCKfeU5CDinu7NmKvwe+IH/X5
	fZyWoRJ5wESuKjnkTxUvA0HzCh8hJNpPlwkdvcC4iRs2WfJRT/SYogB6eu98W5QuvWd75OLW0aaEo
	70OHY+Clm5QYxRgY5wq6g/u+zPa9pUgcfGjpBH8bECtgJ4wBsj1JP4hriCyHVu2yLJ5YHC1pV9ngW
	s+N0VDbxjq5HkyNVawyVcI7JqQ+WeOPtPr89/vxr5Y6hl9C5RJc8jIoGUjJbBRI5jau41He6NvnQO
	8IvfgMZA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60470)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pb5rY-0000Pm-BR; Sat, 11 Mar 2023 20:30:44 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pb5rT-00060X-PH; Sat, 11 Mar 2023 20:30:39 +0000
Date: Sat, 11 Mar 2023 20:30:39 +0000
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
Subject: Re: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Message-ID: <ZAzk71mTxgV/pRxC@shell.armlinux.org.uk>
References: <ZAiJqvzcUob2Aafq@shell.armlinux.org.uk>
 <20230308134642.cdxqw4lxtlgfsl4g@skbuf>
 <ZAiXvNT8EzHTmFPh@shell.armlinux.org.uk>
 <ZAiciK5fElvLXYQ9@makrotopia.org>
 <ZAijM91F18lWC80+@shell.armlinux.org.uk>
 <ZAik+I1Ei+grJdUQ@makrotopia.org>
 <ZAioqp21521NsttV@shell.armlinux.org.uk>
 <trinity-79e9f0b8-a267-4bf9-a3d4-1ec691eb5238-1678536337569@3c-app-gmx-bs24>
 <ZAzd1A0SAKZK0hF5@shell.armlinux.org.uk>
 <4B891976-C29E-4D98-B604-3AC4507D3661@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4B891976-C29E-4D98-B604-3AC4507D3661@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_123052_397166_BABBCED1 
X-CRM114-Status: GOOD (  12.64  )
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

On Sat, Mar 11, 2023 at 09:21:47PM +0100, Frank Wunderlich wrote:
> Am 11. März 2023 21:00:20 MEZ schrieb "Russell King (Oracle)" <linux@armlinux.org.uk>:
> >On Sat, Mar 11, 2023 at 01:05:37PM +0100, Frank Wunderlich wrote:
> 
> >> i got the 2.5G copper sfps, and tried them...they work well with the v12 (including this patch), but not in v13... 
> 
> >> how can we add a quirk to support this?
> >
> >Why does it need a quirk?
> 
> To disable the inband-mode for this 2.5g copper
> sfp. But have not found a way to set a flag which i
> can grab in phylink.

We could make sfp_parse_support() set Autoneg, Pause, and Asym_Pause
in "modes" at the top of that function, and then use the SFP modes
quirk to clear the Autoneg bit for this SFP. Would that work for you?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

