Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D11C369D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIkTyqORcJY3IPcDiRocOLLu3gCwnnNW1WsiesNIDPg=; b=aNGU6Kxu9PI8rQjL0ku8CQpxZS
	+lnnOmp9qVuuGfmlENLme2pCnOA7DHk51PDnLD5C/O0DfLOyo6fkyDvGk5BTHl8OzYDtwi1fL/wwJ
	0jL6wRDrz36XOgiQJBCiLzv/JgcA5XFky3TLLzKSlCQRepXj3zEtDngVOBtU5fIh5D1phEksAMKDl
	f3UPHWGmY9tT3cWLd7JwuXOCYNpxgTAmVYNsFu6Ay9VSCgvcXRyZ1b1r8tMaO8C/2X7d8LLDdrbNc
	knD9kupRc06DG2a9UWRg40hQndcvjgcjzgvFz9IDN+/3H4RHhnfpI6bWNlJB3E1zFK8ww/PkjxSZa
	Cv2qdRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqR-0000000BlLh-2Azm;
	Wed, 23 Apr 2025 19:33:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7flM-0000000BkJY-0Mdi;
	Wed, 23 Apr 2025 19:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=iIkTyqORcJY3IPcDiRocOLLu3gCwnnNW1WsiesNIDPg=; b=fM
	rU/Tl15UqKFPmQvYVRkiUlBuz8FJzaAF5Ml8laVLD0BpUjfepn10SWcCyigLLBPCR9un8b78sb+04
	GRCi97jMwlCmeeCZFxT1pCLu/Hb/AENjjGj71emlfC71pSShL0JxMfNskCSHyFGYfd+KslTJX5pJu
	iLTCDVIYDc+jAys=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u7flD-00ANUI-L7; Wed, 23 Apr 2025 21:27:55 +0200
Date: Wed, 23 Apr 2025 21:27:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-mediatek@lists.infradead.org,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	openwrt-devel@lists.openwrt.org,
	Felix Baumann <felix.baumann@freifunk-aachen.de>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: Mediatek: EEE problems with the MT7530 PHYs on OpenWRT 24.10
Message-ID: <d3bea25e-a479-4800-8bd2-8a6dbc0f30a3@lunn.ch>
References: <c0411979-bf71-4695-ab7e-9213c339603e@o2.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0411979-bf71-4695-ab7e-9213c339603e@o2.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_122804_129465_35F3A1E2 
X-CRM114-Status: GOOD (  14.29  )
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

> 3. In Linux 6.6, the PHY driver tries to disable EEE in
>    mtk_gephy_config_init() in drivers/net/phy/mediatek-ge.c:
> 
>         /* Disable EEE */
>         phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> 
>    but this is later overridden by a subsequent execution of the
>    genphy_c45_write_eee_adv() function, which enables every EEE mode
>    supported.

Arınç ÜNAL <arinc.unal@arinc9.com> noticed the same:

commit af3b4b0e59decfc4db2eafbb4e0d0658529019f6
Author: Arınç ÜNAL <arinc.unal@arinc9.com>
Date:   Sun Apr 14 00:08:13 2024 +0300

    net: phy: mediatek-ge: do not disable EEE advertisement
    
    The mediatek-ge PHY driver already disables EEE advertisement on the switch
    PHYs but my testing [1] shows that it is somehow enabled afterwards.
    Disabling EEE advertisement before the PHY driver initialises keeps it off.
    Therefore, remove disabling EEE advertisement here as it's useless.
    
    Link: https://lore.kernel.org/netdev/d286ea27-e911-4dcb-9037-b75f22b437b8@arinc9.com/ [1]
    Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>

diff --git a/drivers/net/phy/mediatek-ge.c b/drivers/net/phy/mediatek-ge.c
index a493ae01b267..54ea64a37ab3 100644
--- a/drivers/net/phy/mediatek-ge.c
+++ b/drivers/net/phy/mediatek-ge.c
@@ -23,9 +23,6 @@ static int mtk_gephy_write_page(struct phy_device *phydev, int page)
 
 static void mtk_gephy_config_init(struct phy_device *phydev)
 {
-       /* Disable EEE */
-       phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
-
        /* Enable HW auto downshift */
        phy_modify_paged(phydev, MTK_PHY_PAGE_EXTENDED, 0x14, 0, BIT(4));


> 
> In 2021, Landen Chao wrote [2]:
> 
> > EEE of the 10-year-old MT7530 internal gephy has many IOT problems, so
> > it is recommended to disable its EEE.
> 
> I'd like to ask Mediatek to clarify whether it is possible to fine-tune
> the EEE of this PHY in some way, or rather that it should be hard-disabled
> by setting:
> 
>     phydev->eee_broken_modes = -1;

You are looking at old code, at least for mainline:

        /* According to KSZ9477 Errata DS80000754C (Module 4) all EEE modes
         * in this switch shall be regarded as broken.
         */
        if (phydev->dev_flags & MICREL_NO_EEE)
                phy_disable_eee(phydev);

Andrew

