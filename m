Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860D2C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Aug 2024 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZSK0gaAnl4gyzygkdHSHTkwq9hcA+qPNT/OCFaD2XEs=; b=weNwAMSR3Igdp63Dc6aqdUaXDI
	E5skyaYm5DgkD4/a4YiPFCnW9xbtKotsDq2OUbTFsRCCClPpS+IuoXtAhDOhLKC5d2mtbmm3CkHiE
	i8TKlw94CxErFDShC5wLH3Rwyq/MXFpAOgwRWII8j92iPAmeILwXnN0VypZa46S8QRzNd8cj2tDLL
	Jx9IehjQrS1RaPuerOdxpH19Lgg9+Cv5+sXp0tzf7B7gYCSgQER5NdAtZcAuUxwVpZNhr25mhiLx6
	XBNLJH+hkUzteoDBqRtqugx6zvMGi14v0zAbDSiMjyNGYINJNJS2hcrDtpBIismjWTZ2TuZINyemw
	osiorsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQHk-0000000BSKG-0Db8;
	Fri, 09 Aug 2024 14:08:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQHP-0000000BSFN-1kfq;
	Fri, 09 Aug 2024 14:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=ZSK0gaAnl4gyzygkdHSHTkwq9hcA+qPNT/OCFaD2XEs=; b=Dx
	TWhrd8Xv/qraGB327AeRXqRXNg1bXzVMJxQALXC5igncAL7qK5ti+I6g66UoRjhexA7IvlTAkJvtO
	pE+MdcXY6fNxsNG8xNDLf7vxr+TgDSUgjUmlCWvag+fk8mnnLLgUfTgnuJw33puLGqHytmLuyi06r
	JTgWl7oUXm3X+aY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1scQHM-004NqI-Gz; Fri, 09 Aug 2024 16:07:40 +0200
Date: Fri, 9 Aug 2024 16:07:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>
Subject: Re: [PATCH net-next v10 00/13] net: phy: mediatek: Introduce
 mtk-phy-lib and add 2.5Gphy support
Message-ID: <9d1e9cf8-8cd5-4ec6-ba1e-d55ed5e1afa5@lunn.ch>
References: <20240701105417.19941-1-SkyLake.Huang@mediatek.com>
 <0935426d09f3bf83b119e8f6bf498479a62845c0.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0935426d09f3bf83b119e8f6bf498479a62845c0.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_070743_483201_2F24A9A3 
X-CRM114-Status: UNSURE (   5.63  )
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

On Fri, Aug 09, 2024 at 10:58:02AM +0000, SkyLake Huang (黃啟澤) wrote:
> Gentle ping.

Hi Daniel

What is your take on this patchset? Are you happy to give Reviewed-by:
for them?

    Andrew

