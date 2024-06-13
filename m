Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA59C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 13:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1RuFp0vlLAyeY1qWapt9cro6Y3Ttv10wLLV6eWht0Y=; b=tIkdOdhx/297cFbHoB8PnoNhiM
	Yg3mKqpRydp3VpFCs2Mg8RQszLPo3pxhPIEdmDCHhcu4QrDD5x1T9ZOgKPhTyhA0ha6hoRczrX50Z
	5vqqvmOnxLMVb6fOi/Ujk6qS8iQDTD968Tv4rJC+HmaNSNC7rZ/2aAOTtPpJDXOeHeaRMyzT3rorK
	+pIX8KgLXVz0uWYy1r+sBn84JroP13yydrwVHe6r5ptpVmF5TpKB4fODRkxn2yLckfsM/AhruqcsQ
	PXcv+MnDuLdzdYhCIE/B3kJytb7TaDh6eea8CFCzki4ANw1DkfTZWZvwqypo2lJ2J9HQB3Z3rcCw1
	xyaiNxtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkal-0000000GkUz-3CTJ;
	Thu, 13 Jun 2024 13:34:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHkaj-0000000GkTA-19oL;
	Thu, 13 Jun 2024 13:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=S1RuFp0vlLAyeY1qWapt9cro6Y3Ttv10wLLV6eWht0Y=; b=WnZ97HATOH2e8wV28w4HHoeKFS
	2uQgBkOkxlWJMQuvHacBpyXvMzqzqfsI4mIBYmLsPROFEDXxgeBAVBwYVOe/o0eRYHIQ+xO16yvrU
	Fn28I5tmt9j346HZqiasu5F1ppBG7jZSpjTtlI61kQa5f736Ix241HkfmAaf2xRqn+ZY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sHkaM-00HZFj-2B; Thu, 13 Jun 2024 15:33:50 +0200
Date: Thu, 13 Jun 2024 15:33:50 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "daniel@makrotopia.org" <daniel@makrotopia.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next v6 5/5] net: phy: add driver for built-in 2.5G
 ethernet PHY on MT7988
Message-ID: <b68146c6-e59d-4be8-9b57-c2747c175126@lunn.ch>
References: <Zl3ELbG8c8y0/4DN@shell.armlinux.org.uk>
 <Zl3Fwoiv1bJlGaQZ@makrotopia.org>
 <Zl3IGN5ZHCQfQfmt@shell.armlinux.org.uk>
 <Zl3Yo3dwQlXEfP3i@makrotopia.org>
 <Zl3lkIDqnt4JD//u@shell.armlinux.org.uk>
 <Zl32waW34yTiuF9u@makrotopia.org>
 <Zl4LvKlhty/9o38y@shell.armlinux.org.uk>
 <864a09b213169bc20f33af2f35239c6154ca81e3.camel@mediatek.com>
 <Zl8bjNzdB7g1fRyn@makrotopia.org>
 <a6c79128dca5b99951e95527bd2b51a4ae7b42fd.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6c79128dca5b99951e95527bd2b51a4ae7b42fd.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_063413_337489_03924607 
X-CRM114-Status: UNSURE (   7.26  )
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

> Since I found out that there's phy-mode="gmii" in mt7981-rfb.dts on
> openWRT, I thought maybe we need gmii&internal for mt7981's built-in
> GbE and xgmii&internal for mt7988's built-in 2.5GbE.

Just because openwrt is using it, does not mean it is correct. We do
not break in tree DT files, but out of tree DT can be ignored.
Hopefully if mt7981-rfb.dts is ever submitted for mainline, the
problem will be fixed. And when OpenWRT updates to a newer kernel they
are likely to fix it.

    Andrew

