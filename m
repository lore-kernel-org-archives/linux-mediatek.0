Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6347BC6FA99
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 11:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZaXAg8Hi+22u5PckssBr2DNSY4dcFwH+pwzQq5otbE=; b=UlhxgIxvgzWFamBICGG/4GnaiQ
	MZnbpBM+G8C8FtZzgINUWsUJzC4r3N1jUQNUySRH886xYYB7IPA0Y89QflVaZx4JSXkKKagfPt18T
	6wp8ZqXfmP4akcCWJkC9IJTZfht7r6p6HBXJ4fnRHquFEg8qQg4w5wd9+esv9I/uOJv2may3eTPUN
	PvPDo4Vt/YQRcZiW7MMN1Pm/iviV637s7W/lA7/aAg8dRyrUktox3GEhWxqw8V7WYuOCqBSVub1Jl
	QSvEmc478RK6tgwcVSpneOAIvyUcgXjT8mLGGXECYCnQ+B1Cn+w290vEKgpRH4H6ioP/NERZCPMoh
	qD/CZKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaeC-00EIkQ-Gr; Fri, 10 Mar 2023 11:10:52 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paadx-00EIes-BK; Fri, 10 Mar 2023 11:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678446616; i=frank-w@public-files.de;
	bh=EZaXAg8Hi+22u5PckssBr2DNSY4dcFwH+pwzQq5otbE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ScKdQX1qZJh4KopiTLhp46hhra4byA7Kj71PrsAJEvYVvHvZ7U/cdmNxxco/fCWi/
	 fntGeI4538kjoLCyPCWfJKIIxjsXznEA/OXhQSk5B4ksG4ieIklcNELEhNOBogH2uO
	 HREznRIGY5gIXAQiNewtpHYfm3BJhruNxi0SSNJWxW8q7XjpJ/AY8o0nN+qvkZ5JVE
	 5EktPQajMU6e2I4dsilVMe1cNJwp24R+SdBbaKUvjXElb0Phy718rdJTWtP+pPfHHu
	 sqAKfwZwE6Gd3qquwCI/oPLdAItgmNQGd+vXyzH3EVixEIGFUvtNFjLJNlvfcrfTSF
	 Tx7fYDb6GIe7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.176] ([157.180.224.176]) by web-mail.gmx.net
 (3c-app-gmx-bs21.server.lan [172.19.170.73]) (via HTTP); Fri, 10 Mar 2023
 12:10:16 +0100
MIME-Version: 1.0
Message-ID: <trinity-aab1c6ab-373d-4c3d-a646-fdcf6a327048-1678446616345@3c-app-gmx-bs21>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell
 King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang
 <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, Alexander Couzens <lynxis@fe80.eu>
Subject: Aw: [PATCH net-next v13 10/16] net: ethernet: mtk_eth_soc: switch
 to external PCS driver
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Mar 2023 12:10:16 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <b61d952d5e0719e0fc6cc3b1d3576ce9aa1444f5.1678357225.git.daniel@makrotopia.org>
References: <cover.1678357225.git.daniel@makrotopia.org>
 <b61d952d5e0719e0fc6cc3b1d3576ce9aa1444f5.1678357225.git.daniel@makrotopia.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:XkS1rj6utIKZO75KU6uhVOKHQxtSR3UHSlgHA3thjIaAdf5t8665UcFFxCb9LABtmc+bF
 IiYs+hwNAtwF8YUPK+q5Pz7tNHd1vCuPH1SF1fLuBN69ELIdwVcv3koNBwDDwlfsLCfMZIJlsqNV
 QOqL8vsRQVzLLLXZu/3iMVb71RyA3YnfbXvVizZJWx14ANM9IOCWssMqAL622LIXJKFq4wR+cU4e
 Tn5whN4nvJVyC/aK9jDsJDHNg6HSPme2gBlRdHN3NWnpDtjLs3kkK8YaLIKqLM4/W7V8l/oHW7JT
 g4=
UI-OutboundReport: notjunk:1;M01:P0:TWIsa/mN70E=;qPLa42hpJKl/UclSEwqE6Oqo++9
 rZrltKGWYSoaX+UonVZaAE85d5mloFch/+GM/y2ZtCU+cCuQfwHWnxbDlS4JmmCTPWaiunetn
 I1MaFCAP96mib4ol87YgnYEz3e5R+h0w5X/eSiABXWuiXvbwJZFNNovn8bW773ciKIz+J9hjN
 x7DBgBrygK3u38iSYnPYRfQEVEO9690FcadXzdM29TGuCLceky+HLQVak8Qx1JNeEYLQ6miBg
 K9FYA2+baFbE8Ti3o5kq85WqFnjR6Q8qb2O5Anxw2v8GX6/BEuHzuW9cUWh1VaL9AGF4M4uwO
 oy/XTbNUNBd5PXc+0FJWag1hSsCSMmkif2997EP8ea2Q3wV721pzPp5apV2JucNgV6zQ78kNJ
 LIcgE393ejaAdj5Ij4l6hLZi6SWsolnc5TxXIUHIkmVDgftaG5UdnwqoPuMrHJ1zHpxErfxIN
 faDMhhZZ+RXEiISmjGQLatYHlRQ06KXtI+AiY9oW72w2Sfl7bm/J7gOexzqIa42cwgjYA/RDk
 m3QvuYhhjx0QOJ4vLX9uqqWtSJFDkYRVGIBsfiPAL3tE+kGTr0PkXZLraOyfIBpyRZ8RmfnEY
 gGCrylnO8X0lzmhCTLpVie5jRkYAGyh4kNAPkHJbb/z2FIAI2vfv9aoW7mk9r6DsacnSOAebb
 K3CcI4y9yeojF0c+gmHMX1AN+CG7XZ+CnUPCJvKfkVUY39JpZuFltALrjJAny8zlgFh+WPXly
 MTuP9YZA79Iw5T+QWkTijebkD5y5pRf+4YjG0T76zONKkXw0hMZlsV9Ruh2m4kI3uA88wXcro
 EFjPh+YRDXqSJ+rZoF8rUv7g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_031037_704741_FCD59F91 
X-CRM114-Status: UNSURE (   7.21  )
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

Hi,

have tested Parts 1-11 this on bananapi-r3 (mt7986) with 1G Fiber SFP (no 2g5 available yet) on gmac1 and lan4 (mt7531 p5)

Tested-by: Frank Wunderlich <frank-w@public-files.de>

Thx Daniel for working on SFP support :)

regards Frank

