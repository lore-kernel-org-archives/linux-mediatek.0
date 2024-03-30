Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A452C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujY+2Fajyw/i8qIuOZQSTD217NXANw6Wgvcz9uBaBAs=; b=Cdmi+k9KPGZWvERb9JasAhZMyy
	XOHTqlQN8IiNovdUjGpR6D15NDVrimJ9pRtwy9noVWavEvnlATYqgMMyZXSXFIc2M0CDk5IdAG1Ja
	ipaneSPiB+5cyuw54byLKtAV36Zbtj9V9vdgJYOeq6blstLRpz0Ei9A3nzeeAT0jkwq0vTm6OQODa
	HUXBduGnwey2hZXCzb5W5ubiqM3Uja/6vwO8JBEiKez24pIUFIquuK43zdOSrw160volWDae2n1MI
	vgtkYowdDcIstrwg345oP8OmRP9hKoOq6rvZwaBwFhKK59feOppsJKFTzN8dg0xGMBAHufxX3ANyS
	ZBnHGwfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqdax-00000003yeY-1vdo;
	Sat, 30 Mar 2024 18:38:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqdau-00000003yK3-05se;
	Sat, 30 Mar 2024 18:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ujY+2Fajyw/i8qIuOZQSTD217NXANw6Wgvcz9uBaBAs=; b=KnWNOYYg/5X275Y16WxV/bQOIg
	UXk+SD/WrPBzNWj/iByXWth5ghvY+B8EbPAx7oumvOuzuDpaV+TnegQ3sUAJkTnVzqCI00+nBmiL9
	k5NAQFWxw+MxIRYRGaRv2+BNRh7WZ3pm5cWyyZXr0cLjYJJv7QpSYV6IOzafGpHeS7F484kPlr2Bm
	UlmmnmXFQwafs/3sEFoKz5GHFlCSNEngJsaDgCBQW+2nbWnmsu1A6lDZFqylUkW+4Q23qYqbypS7W
	1AgjR8ZQtNqXOICdgR+FAnbvhxAz8g0U6SxsgApbMHAIsR0Aaps9SNK/NguUVF0h1O+zhD2czrXoU
	NaTZWMag==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59452)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rqdYl-000387-35;
	Sat, 30 Mar 2024 18:36:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rqdYi-0003rl-38; Sat, 30 Mar 2024 18:36:04 +0000
Date: Sat, 30 Mar 2024 18:36:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH] arm: kasan: clear stale stack poison
Message-ID: <Zghbkx67hKErqui2@shell.armlinux.org.uk>
References: <20231222022741.8223-1-boy.wu@mediatek.com>
 <6837adc26ed09b9acd6a2239a14014cd3f16c87c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6837adc26ed09b9acd6a2239a14014cd3f16c87c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_113820_172910_81F691FB 
X-CRM114-Status: UNSURE (   6.71  )
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

On Fri, Mar 29, 2024 at 03:17:39AM +0000, Boy Wu (吳勃誼) wrote:
> Hi Russell:
> 
> Kingly ping

I'm afraid I know nowt about KASAN. It was added to ARM32 by others.
I've no idea whether this is correct or not. Can we get someone who
knows KASAN to review this?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

