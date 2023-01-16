Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4E0C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 18:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YIreTAFzFbHVGEZj5QHfTlpaspfbnqFUVKN4fQm7d5o=; b=wtlVdSmwf7qaUe
	CyT7tMUkph+RIeJH1nQkrhAFvJnELSHVpWv1IqXxPHKf54kr0cL/L2a/aC2Hk2OEA5iEbxWcCDiRW
	9mJsoLqXi/43N2Yqilcxp8Cxw6AVOvM6igjGlMHhp9bdKbYOIgPt3skpMCimEiur8yeWOH38rzmio
	9HRAk7foca6WnNZxPrVvQEYr1YlNzzRPeynMwBTBPsvLwgAugb77ZRo09Duujw+3KZqQfqhpSqQCf
	4xe5c5M49J6NyAO/o7ESDNWuzlqApdh1irachucoqH0TIe6CTihyqwfoAKon7Kjv3aU5arvW3oNfw
	AJZj9HEJeh9RerGm+AEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHUGA-00BiSW-0d; Mon, 16 Jan 2023 18:31:06 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHUG0-00BiQB-3N; Mon, 16 Jan 2023 18:30:57 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 30GIUWgx2107688
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 18:30:34 GMT
Received: from miraculix.mork.no ([IPv6:2a01:799:c9a:3202:549f:9f7a:c9d8:875b])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 30GIURQS2116310
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 19:30:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1673893827; bh=YIreTAFzFbHVGEZj5QHfTlpaspfbnqFUVKN4fQm7d5o=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=DoK6r50BgPDxe/DnATBMHLjR6PsHXGsBHeDf0iTkHbxqh3ledlOf0c0hYMF6FuWPU
	 RkS6eRhgioGhTBvkQ65f+/+rIVU9TU14YTM3VgX+rijYX8a/jfhMl+IpYXkSmqdfrL
	 MErgDDJMzwcn5tF05aLblF+AjqFKcuMwK/psVxWI=
Received: (nullmailer pid 386862 invoked by uid 1000);
	Mon, 16 Jan 2023 18:30:27 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Organization: m
References: <Y8VVa0zHk0nCwS1w@shell.armlinux.org.uk>
	<87h6wq35dn.fsf@miraculix.mork.no>
	<Y8VmSrjHTlllaDy2@shell.armlinux.org.uk>
	<87bkmy33ph.fsf@miraculix.mork.no>
	<Y8Vt9vfEa4w8HXHQ@shell.armlinux.org.uk>
	<875yd630cu.fsf@miraculix.mork.no> <871qnu2ztz.fsf@miraculix.mork.no>
	<Y8WNxAQ6C6NyUUn1@shell.armlinux.org.uk>
	<87pmbe1hu0.fsf@miraculix.mork.no> <87lem21hkq.fsf@miraculix.mork.no>
	<Y8WT6GwMqwi8rBe7@shell.armlinux.org.uk>
Date: Mon, 16 Jan 2023 19:30:27 +0100
In-Reply-To: <Y8WT6GwMqwi8rBe7@shell.armlinux.org.uk> (Russell King's message
	of "Mon, 16 Jan 2023 18:14:00 +0000")
Message-ID: <87a62i1ge4.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_103056_472736_C78B7E51 
X-CRM114-Status: GOOD (  16.40  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"Russell King (Oracle)" <linux@armlinux.org.uk> writes:

> That all looks fine. However, I'm running out of ideas.

Thanks a lot for the effort in any case.  It's comforting that even the
top experts can't figure out this one :-)


> What we seem to have is:
>
> PHY:
> VSPEC1_SGMII_CTRL =3D 0x34da
> VSPEC1_SGMII_STAT =3D 0x000e
>
> The PHY is programmed to exchange SGMII with the host PCS, and it
> says that it hasn't completed that exchange (bit 5 of STAT).
>
> The Mediatek PCS says:
> BMCR =3D 0x1140		AN enabled
> BMSR =3D 0x0008		AN capable
> ADVERTISE =3D 0x0001	SGMII response (bit 14 is clear, hardware is
> 			supposed to manage that bit)
> LPA =3D 0x0000		SGMII received control word (nothing)
> SGMII_MODE =3D 0x011b	SGMII mode, duplex AN, 1000M, Full duplex,
> 			Remote fault disable
>
> which all looks like it should work - but it isn't.
>
> One last thing I can think of trying at the moment would be writing
> the VSPEC1_SGMII_CTRL with 0x36da, setting bit 9 which allegedly
> restarts the SGMII exchange. There's some comments in the PHY driver
> that this may be needed - maybe it's necessary once the MAC's PCS
> has been switched to SGMII mode.


Tried that now.  Didn't change anything.  And still no packets.

root@OpenWrt:/# mdio mdio-bus 6:30 raw 8
0x34da
root@OpenWrt:/# mdio mdio-bus 6:30 raw 9
0x000e
root@OpenWrt:/# mdio mdio-bus 6:30 raw 8 0x36da
root@OpenWrt:/# mdio mdio-bus 6:30 raw 8
0x34da
root@OpenWrt:/# mdio mdio-bus 6:30 raw 9
0x000e


Bj=C3=B8rn

