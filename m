Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E732CF8840
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:References:In-Reply-To:Date:Content-Type:Subject:To
	:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TkYsW/Vm8xxAVCrZhjcQIu6dOwL/HAjdGjziPOqf0DA=; b=IZkvXA+/3zIZIe
	DFtmrV33SuWNCbb0gWcXmguXllcVQ6H96WlxbSvuPeyvCL9YmWizgeKqnWDhNZ90vZrtstfgz9f/u
	mevwUOFPYnzyVq9mFUc5kVNiRts6SHKBQi0kFWdl+Vy/eCvB7foAFj4Tl6uPPun6EYE9KFf/3IwDM
	hq4mPFgdoVJYBD7GrMdm88sX+8/Iw3SUl4GilIJPM6yKCiJo+aqIKYk9wl1OmbmeUr5Y7UrZ+zqM3
	adTVltsO7qgdTFUvyTnBmJrDeUJfwLD08ugD2qbYW2gjSQBOhuTcf9bViEfeF4fJ9LnyEBUO6dMwg
	dntN+DgWM3OSE7f6shtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swj9b-0000000Ck0k-2PdJ;
	Fri, 04 Oct 2024 14:19:35 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swj8I-0000000CjhB-3S6t;
	Fri, 04 Oct 2024 14:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728051458; x=1728656258; i=frank-w@public-files.de;
	bh=TkYsW/Vm8xxAVCrZhjcQIu6dOwL/HAjdGjziPOqf0DA=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SHRL8bP+CSYL+qXQl5RKqbXgpkc+MR4XN5uF5TxQjqOJf0gFfwtZesmijCgwEzbm
	 9RUMlBfgbXcWQWCo8GT4PBdX6AQMrBwp/KSml7C4NJPS6GJTStgt7MPbWE0ASlWnl
	 3X3VQGt4bfWWLpHkq4E5K8BSiZTrOxwLzaKwjqyxrn19QenhNf4ZdLR2VfiDHObDC
	 GYbWefnNf/4Q7apkBurMc8MrSGBeX1nd0bkDOxuPLhUJffqUr8doenq2XBWJj6RS1
	 +8GhN+LXbfLZFH60sRJWknbnODScgpX1GxGT+sS4zMvkZCy64COvK5/X79BsQCxFH
	 qXAeJTcRZNvPTh2dcg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.79.231] ([80.245.79.231]) by web-mail.gmx.net
 (3c-app-gmx-bs32.server.lan [172.19.170.84]) (via HTTP); Fri, 4 Oct 2024
 16:17:37 +0200
MIME-Version: 1.0
Message-ID: <trinity-af6fdd0b-b72c-42a9-bbae-af45c02f539f-1728051457848@3c-app-gmx-bs32>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: Aw: Re: [RFC PATCH net-next v3 3/8] net: pcs: pcs-mtk-lynxi: add
 platform driver for MT7988
Content-Type: text/plain; charset=UTF-8
Date: Fri, 4 Oct 2024 16:17:37 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <89bd21ac-78f3-4ee4-9899-83f03169e647@public-files.de>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <8aa905080bdb6760875d62cb3b2b41258837f80e.1702352117.git.daniel@makrotopia.org>
 <ZXnV/Pk1PYxAm/jS@shell.armlinux.org.uk> <ZcLc7vJ4fPmRyuxn@makrotopia.org>
 <ZiaPHWXU-82QMrMt@makrotopia.org>
 <89bd21ac-78f3-4ee4-9899-83f03169e647@public-files.de>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:dtjCudBfl9YgX9IU9mYJiT94Gfkj4tMs7cFebMu2lBINbusIv1hOas2D1QhQj6+VWZO+p
 LRV25WFPtu8JBq52guy0Mv/fq832vz01SDUU8jubxjQf/n+hCzSU72xt/CkmdXshPsjS/N2MXOil
 y3yrHHLji9TS9jxfyg3oCWpxGETNIcxU5plcodrUh0FnJwNzKOaTEIZmhhbn+8RXhXM0RBgtgedm
 qSJzolRgiVyxbRigloyzcdyFI3sahfpeWK4p5TVF0cNHTy08EuIg6IPQqAplAu41fo8qh5YXHjhO
 zY=
UI-OutboundReport: notjunk:1;M01:P0:ahWDPqixoMA=;yEk5BcqxUFPu081hXb/O0VDUvvF
 deMAza6Myrl0Qm9PlHgbupNdfQdsHlIxGsrGSkWS+L9CxBmUbbQ34VTrXI/y3PHtM9MOQb8LT
 sWD2UqfzUI1W+PojnoKw509DfbqlnnYlj2FKZFzXbScIOEzDsEZb1l19y6QNNHO8guqZvqG/H
 ZKdh5rdhJi0D8ENP9UxHP5AieiA6RhcPu+vxpMnwkNwb4oPaZTHDzV1jRB8bx5exBfp2v/7En
 9SvfZDnx2ge7UdgkMR0YlGYTN8wUOneYVSCNSskM9y88S+27bxgH3FIlFmt4a/+0q9Q71tQjG
 Uy9L5ymvmnvkfHHG/AzPxuE+52opWyZCGXKuehdeOA1+3KUuLlL9NaItjVqfs57QXNjbtIUyJ
 SSatsuMySuc1Eufc6dLrU/LsiCEDTiOZpyZaIXqBB0VDa2StrHtFjXiwwbZYfOrG+BokcY//p
 07q1NVCzjg/RGqy5m/Zevw2QUbalNzZoJph3Lyo1OIFfcNS75Uyyolbqy8j1Z5b602Cr7CyVY
 3lmhTO+l0ZKZu7alO+Enm0gWtzwDPFyuAmGHnrkX/K94VKdsYnQxJOrjG/WSespCNlFHam+Jk
 cwWl4lOfAVaFCeUCF/Qph7sNOd5bv69usaR3i2XZO6vMa75dwqLuVWMIdHbZ8OK5skzAzVhKc
 t6ljkCaqKF3ZGQcK2Kg3fPZqdtlgfa72YoJDdJdBMg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_071815_270488_AFBEC0AF 
X-CRM114-Status: GOOD (  66.42  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Qingfang Deng <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org, Felix Fietkau <nbd@nbd.name>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi netdev,

we are still stale in adding pcs driver here=2E=2E=2Ecan you please show u=
s the way to go??

daniel posted another attempt but this seems also stale=2E
https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/ba4e359584a6b3bc4=
b3470822c42186d5b0856f9=2E1721910728=2Egit=2Edaniel@makrotopia=2Eorg/

@Angelo/Matthias, can you help solving this?

left full quote below=2E=2E=2E=2E

regards Frank

> Gesendet: Mittwoch, 10=2E Juli 2024 um 13:17 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files=2Ede>
> An: "Russell King (Oracle)" <linux@armlinux=2Eorg=2Euk>
> Cc: "David S=2E Miller" <davem@davemloft=2Enet>, "Eric Dumazet" <edumaze=
t@google=2Ecom>, "Jakub Kicinski" <kuba@kernel=2Eorg>, "Paolo Abeni" <paben=
i@redhat=2Ecom>, "Rob Herring" <robh+dt@kernel=2Eorg>, "Krzysztof Kozlowski=
" <krzysztof=2Ekozlowski+dt@linaro=2Eorg>, "Conor Dooley" <conor+dt@kernel=
=2Eorg>, "Chunfeng Yun" <chunfeng=2Eyun@mediatek=2Ecom>, "Vinod Koul" <vkou=
l@kernel=2Eorg>, "Kishon Vijay Abraham I" <kishon@kernel=2Eorg>, "Felix Fie=
tkau" <nbd@nbd=2Ename>, "John Crispin" <john@phrozen=2Eorg>, "Sean Wang" <s=
ean=2Ewang@mediatek=2Ecom>, "Mark Lee" <Mark-MC=2ELee@mediatek=2Ecom>, "Lor=
enzo Bianconi" <lorenzo@kernel=2Eorg>, "Matthias Brugger" <matthias=2Ebgg@g=
mail=2Ecom>, "AngeloGioacchino Del Regno" <angelogioacchino=2Edelregno@coll=
abora=2Ecom>, "Andrew Lunn" <andrew@lunn=2Ech>, "Heiner Kallweit" <hkallwei=
t1@gmail=2Ecom>, "Alexander Couzens" <lynxis@fe80=2Eeu>, "Qingfang Deng" <d=
qfext@gmail=2Ecom>, "SkyLake Huang" <SkyLake=2EHuang@mediatek=2Ecom>, "Phil=
ipp Zabel" <p=2Ezabel@pengutronix=2Ede>, netdev@vger=2Ekernel=2Eorg, device=
tree@vger=2Ekernel=2Eorg, linux-kernel@vger=2Ekernel=2Eorg, linux-arm-kerne=
l@lists=2Einfradead=2Eorg, linux-mediatek@lists=2Einfradead=2Eorg, linux-ph=
y@lists=2Einfradead=2Eorg, "Daniel Golle" <daniel@makrotopia=2Eorg>
> Betreff: Re: [RFC PATCH net-next v3 3/8] net: pcs: pcs-mtk-lynxi: add pl=
atform driver for MT7988
>
> Hi Russel / netdev
>=20
> how can we proceed here? development for mt7988/Bpi-R4 is stalled here=
=20
> because it is unclear what's the right way to go=2E=2E=2E
>=20
> We want to avoid much work adding a complete new framework for a "small"=
=20
> change (imho this affects all SFP-like sub-devices and their linking to=
=20
> phylink/pcs driver)=2E=2E=2Eif this really the way to go then some bound=
ary=20
> conditions will be helpful=2E
>=20
> regards Frank
>=20
> Am 22=2E04=2E24 um 18:24 schrieb Daniel Golle:
> > Hi Russell,
> > Hi netdev crew,
> >
> > I haven't received any reply for this email and am still waiting for
> > clarification regarding how inter-driver dependencies should be modell=
ed
> > in that case of mtk_eth_soc=2E My search for good examples for that in=
 the
> > kernel code was quite frustrating and all I've found are supposedly bu=
gs
> > of that exact cathegory=2E
> >
> > Please see my questions mentioned in the previous email I've sent and
> > also a summary of suggested solutions inline below:
> >
> > On Wed, Feb 07, 2024 at 01:29:18AM +0000, Daniel Golle wrote:
> >> Hi Russell,
> >>
> >> sorry for the extended time it took me to get back to this patch and
> >> the comments you made for it=2E Understanding the complete scope of t=
he
> >> problem took a while (plus there were holidays and other fun things),
> >> and also brought up further questions which I hope you can help me
> >> find good answers for, see below:
> >>
> >> On Wed, Dec 13, 2023 at 04:04:12PM +0000, Russell King (Oracle) wrote=
:
> >>> On Tue, Dec 12, 2023 at 03:47:18AM +0000, Daniel Golle wrote:
> >>>> Introduce a proper platform MFD driver for the LynxI (H)SGMII PCS w=
hich
> >>>> is going to initially be used for the MT7988 SoC=2E
> >>>>
> >>>> Signed-off-by: Daniel Golle <daniel@makrotopia=2Eorg>
> >>> I made some specific suggestions about what I wanted to see for
> >>> "getting" PCS in the previous review, and I'm disappointed that this
> >>> patch set is still inventing its own solution=2E
> >>>
> >>>> +struct phylink_pcs *mtk_pcs_lynxi_get(struct device *dev, struct d=
evice_node *np)
> >>>> +{
> >>>> +	struct platform_device *pdev;
> >>>> +	struct mtk_pcs_lynxi *mpcs;
> >>>> +
> >>>> +	if (!np)
> >>>> +		return NULL;
> >>>> +
> >>>> +	if (!of_device_is_available(np))
> >>>> +		return ERR_PTR(-ENODEV);
> >>>> +
> >>>> +	if (!of_match_node(mtk_pcs_lynxi_of_match, np))
> >>>> +		return ERR_PTR(-EINVAL);
> >>>> +
> >>>> +	pdev =3D of_find_device_by_node(np);
> >>>> +	if (!pdev || !platform_get_drvdata(pdev)) {
> >>> This is racy - as I thought I described before, userspace can unbind
> >>> the device in one thread, while another thread is calling this
> >>> function=2E With just the right timing, this check succeeds, but=2E=
=2E=2E
> >>>
> >>>> +		if (pdev)
> >>>> +			put_device(&pdev->dev);
> >>>> +		return ERR_PTR(-EPROBE_DEFER);
> >>>> +	}
> >>>> +
> >>>> +	mpcs =3D platform_get_drvdata(pdev);
> >>> mpcs ends up being read as NULL here=2E Even if you did manage to ge=
t a
> >>> valid pointer, "mpcs" being devm-alloced could be freed from under
> >>> you at this point=2E=2E=2E
> >>>
> >>>> +	device_link_add(dev, mpcs->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
> >>> resulting in this accessing memory which has been freed=2E
> >>>
> >>> The solution would be either to suppress the bind/unbind attributes
> >>> (provided the underlying struct device can't go away, which probably
> >>> also means ensuring the same of the MDIO bus=2E Aternatively, adding
> >>> a lock around the remove path and around the checking of
> >>> platform_get_drvdata() down to adding the device link would probably
> >>> solve it=2E
> >>>
> >>> However, I come back to my general point - this kind of stuff is
> >>> hairy=2E Do we want N different implementations of it in various dri=
vers
> >>> with subtle bugs, or do we want _one_ implemenatation=2E
> >>>
> >>> If we go with the one implemenation approach, then we need to think
> >>> about whether we should be using device links or not=2E The problem
> >>> could be for network interfaces where one struct device is
> >>> associated with multiple network interfaces=2E Using device links ha=
s
> >>> the unfortunate side effect that if the PCS for one of those network
> >>> interfaces is removed, _all_ network interfaces disappear=2E
> >> I agree, esp=2E on this MT7988 removal of a PCS which may then not
> >> even be in use also impairs connectivity on the built-in gigE DSA
> >> switch=2E It would be nice to try to avoid this=2E
> >>
> >>> My original suggestion was to hook into phylink to cause that to
> >>> take the link down when an in-use PCS gets removed=2E
> >> I took a deep dive into how this could be done correctly and how
> >> similar things are done for other drivers=2E Apart from the PCS there
> >> often also is a muxing-PHY involved, eg=2E MediaTek's XFI T-PHY in th=
is
> >> case (previously often called "pextp" for no apparent reason) or
> >> Marvell's comphy (mvebu-comphy)=2E
> >>
> >> So let's try something simple on an already well-supported platform,
> >> I thought and grabbed Marvell Armada CN9131-DB running vanilla Linux,
> >> and it didn't even take some something racy, but plain:
> >>
> >> ip link set eth6 up
> >> cd /sys/bus/platform/drivers/mvebu-comphy
> >> echo f2120000=2Ephy > unbind
> >> echo f4120000=2Ephy > unbind
> >> echo f6120000=2Ephy > unbind
> >> ip link set eth6 down
> >>
> >>
> >> That was enough=2E The result is a kernel crash, and the same should
> >> apply on popular platforms like the SolidRun MACCHIATOBin and other
> >> similar boards=2E
> >>
> >> So this gets me to think that there is a wider problem around
> >> non-phylink-managed resources which may disappear while in use by
> >> network drivers, and I guess that the same applies in many other
> >> places=2E I don't have a SATA drive connected to that Marvell board, =
but
> >> I can imagine what happens when suddenly removing the comphy instance
> >> in charge of the SATA link and then a subsequent SATA hotplug event
> >> happens or stuff like that=2E=2E=2E
> >>
> >> Anyway, back to network subsystem and phylink:
> >>
> >> Do you agree that we need a way to register (and unregister) PCS
> >> providers with phylink, so we don't need *_get_by_of_node implementat=
ions
> >> in each driver? If so, can you sketch out what the basic requirements
> >> for an acceptable solution would be?
> >>
> >> Also, do you agree that lack of handling of disappearing resources,
> >> such as PHYs (*not* network PHYs, but PHYs as in drivers/phy/*) or
> >> syscons, is already a problem right now which should be addressed?
> >>
> >> If you imagine phylink to take care of the life-cycle of all link-
> >> resources, what is vision about those things other than classic MDIO-
> >> connected PHYs?
> >>
> >> And well, of course, the easy fix for the example above would be:
> >> diff --git a/drivers/phy/marvell/phy-mvebu-cp110-comphy=2Ec b/drivers=
/phy/marvell/phy-mvebu-cp110-comphy=2Ec
> >> index b0dd133665986=2E=2E9517c96319595 100644
> >> --- a/drivers/phy/marvell/phy-mvebu-cp110-comphy=2Ec
> >> +++ b/drivers/phy/marvell/phy-mvebu-cp110-comphy=2Ec
> >> @@ -1099,6 +1099,7 @@ static const struct of_device_id mvebu_comphy_o=
f_match_table[] =3D {
> >>   MODULE_DEVICE_TABLE(of, mvebu_comphy_of_match_table);
> >>  =20
> >>   static struct platform_driver mvebu_comphy_driver =3D {
> >> +	=2Esuppress_bind_attrs =3D true,
> >>   	=2Eprobe	=3D mvebu_comphy_probe,
> >>   	=2Edriver	=3D {
> >>   		=2Ename =3D "mvebu-comphy",
> >>
> >> But that should then apply to every single driver in drivers/phy/=2E=
=2E=2E
> >>
> > My remaining questions are:
> >   - Is it ok to just use =2Esuppress_bind_attrs =3D true for PCS and P=
HY
> >     drivers to avoid having to care out hot-removal?
> >     Those components are anyway built-into the SoC so removing them
> >     is physically not possible=2E
> >
> >   - In case of driver removal (rmmod -f) imho using a device-link woul=
d
> >     be sufficient to prevent the worst=2E However, we would have to li=
ve
> >     with the all-or-nothing nature of that approach, ie=2E once e=2Eg=
=2E the
> >     USXGMII driver is being removed, *all* Ethernet interfaces would
> >     disappear with it (even those not actually using USXGMII)=2E
> >
> > If the solutions mentioned above do not sound agreeable, please sugges=
t
> > how a good solution would look like, ideally also share an example of
> > any driver in the kernel where this is done in the way you would like
> > to have things done=2E
> >
> >>>> +
> >>>> +	return &mpcs->pcs;
> >>>> +}
> >>>> +EXPORT_SYMBOL(mtk_pcs_lynxi_get);
> >>>> +
> >>>> +void mtk_pcs_lynxi_put(struct phylink_pcs *pcs)
> >>>> +{
> >>>> +	struct mtk_pcs_lynxi *cur, *mpcs =3D NULL;
> >>>> +
> >>>> +	if (!pcs)
> >>>> +		return;
> >>>> +
> >>>> +	mutex_lock(&instance_mutex);
> >>>> +	list_for_each_entry(cur, &mtk_pcs_lynxi_instances, node)
> >>>> +		if (pcs =3D=3D &cur->pcs) {
> >>>> +			mpcs =3D cur;
> >>>> +			break;
> >>>> +		}
> >>>> +	mutex_unlock(&instance_mutex);
> >>> I don't see what this loop gains us, other than checking that the "p=
cs"
> >>> is still on the list and hasn't already been removed=2E If that is a=
ll
> >>> that this is about, then I would suggest:
> >>>
> >>> 	bool found =3D false;
> >>>
> >>> 	if (!pcs)
> >>> 		return;
> >>>
> >>> 	mpcs =3D pcs_to_mtk_pcs_lynxi(pcs);
> >>> 	mutex_lock(&instance_mutex);
> >>> 	list_for_each_entry(cur, &mtk_pcs_lynxi_instances, node)
> >>> 		if (cur =3D=3D mpcs) {
> >>> 			found =3D true;
> >>> 			break;
> >>> 		}
> >>> 	mutex_unlock(&instance_mutex);
> >>>
> >>> 	if (WARN_ON(!found))
> >>> 		return;
> >>>
> >>> which makes it more obvious why this exists=2E
> >> The idea was not only to make sure it hasn't been removed, but also
> >> to be sure that what ever the private data pointer points to has
> >> actually been created by that very driver=2E
> >>
> >> But yes, doing it in the way you suggest will work in the same way,
> >> just when having my idea in mind it looks more fishy to use
> >> pcs_to_mtk_pcs_lynxi() before we are 100% sure that what we dealing
> >> with has previously been created by this driver=2E
> >>
> >>
> >> Cheers
> >>
> >>
> >> Daniel
> >>
>

