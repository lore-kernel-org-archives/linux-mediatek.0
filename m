Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCE0CFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 13:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9AUrARcn8p6Bu/y9sftMEvfU8DX72hnzGfPHJbkJ2Hs=; b=vgiu06WrEQFGVpk7jY4Tg5+gZq
	NphMnzf3+lWdgV7dHdK7tz2Azb1hcDUnkWPYwH0Ou33tDCDxNGfZ0MzmKdejxwifg4VZBNIjPNRhc
	fHXsFl7SLj5RnCExmEkuirIe4zl627NPwHanai0mlRdNU6IzyZK3lMKKk2fjc2Y3p01iN9mKPFrnq
	wphzDHu9rPCYpl6b9GNrsArEWg5ERpDqA8rUce4tbjdbY6zkZBoeT5IaM8h4eYT+NA6EAr4aicR1t
	MGGuHo8tQ/AA3vfC3T8SzchLo0NuoqzNvnPq9uCVtfWrA0sPuTri3Zl6R7SH7AwtHkdAKYsPvdTdC
	ZJZo/WMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnfq-00000002UJ2-2YcF;
	Mon, 07 Oct 2024 13:21:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxnCD-00000002PZJ-2ldr;
	Mon, 07 Oct 2024 12:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9AUrARcn8p6Bu/y9sftMEvfU8DX72hnzGfPHJbkJ2Hs=; b=zAwhPfL1bdg6M2CC7uA2PI9pjW
	2utS/URZj81kVRJl01CClUKFBSySBcVYE+IVP77u5/e4zLHUPV2s0ndSUzeZzoEaAAQEzQAP9qk1E
	L5Ugt92TlofY3Rn5rchVv9a5NRihLUhFbn1rKc5l0gdkNUOsaSP6frSZIazyeV2dXs0Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sxnC8-009GFh-Bk; Mon, 07 Oct 2024 14:50:36 +0200
Date: Mon, 7 Oct 2024 14:50:36 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
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
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next 3/9] net: phy: mediatek: Move LED helper
 functions into mtk phy lib
Message-ID: <de510d94-2f30-4418-a21a-76e8139e583f@lunn.ch>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
 <20241004102413.5838-4-SkyLake.Huang@mediatek.com>
 <afd441fc-7712-4905-83e2-e35e613df64a@lunn.ch>
 <3f1c73ec57aefa2803df0c32c78dcdc41fed4126.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f1c73ec57aefa2803df0c32c78dcdc41fed4126.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_055041_908552_777C7C88 
X-CRM114-Status: UNSURE (   8.34  )
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

> Although this is just "moving code", we need this priv to do some
> modification for mt798x_phy_hw_led_blink_set() so that we can move it
> to mtk-phy-lib properly.

The helper is passed phydev, so it is not clear to me why the helper
cannot do:

struct mtk_socphy_priv *priv = phydev->priv;

same as the old code. Maybe you want a patch first which renames
mtk_socphy_priv to mtk_phy_priv, just to keep with the naming?

Or do you see the need for different PHYs to need different priv
structures?

	Andrew

