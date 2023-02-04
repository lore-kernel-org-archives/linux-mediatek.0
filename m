Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3CBC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Feb 2023 11:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zqkm7aqyRCSQ+b3/N48+MN/w1oUlkwo8qxuzVoWUtTc=; b=ElI0jbOrQLW+yMKsjQ5zve+Kgm
	QXwPp2jR8p9ggDnkiD/gNykorMYYVNWx2XeAPxVxj61WJYlK+RCBeMB8UddhjmHgOLtxAakNAXvmQ
	mzYykZr5rip1QGP+wucMrwuutJIa6kpe1Aj+h+0qbak+rw6dUsJo4qNz73C0B2+mW/Ck0fn7OIv5u
	fMlbQ+Ln+4f5OmeOwJjnfs87wH4GrFLRjfNbitMbfDGyg4oUKaadPsXl1zIwppdZJOXEzqI0G4j7R
	aM/ybq7CVv2GsgrUvl7X3sUV79fk68J6AGtlZsIpUtvhFI8ILeI9suVYcp+lQ6Zx+oaNOhqRJhF7b
	kzdbBbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOGRq-004waE-HA; Sat, 04 Feb 2023 11:11:10 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOGRi-004wZ7-RU; Sat, 04 Feb 2023 11:11:08 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 314B8FHF850235
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 4 Feb 2023 11:08:16 GMT
Received: from miraculix.mork.no ([IPv6:2a01:799:c9a:3202:549f:9f7a:c9d8:875b])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 314B87aW2058955
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 4 Feb 2023 12:08:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1675508890; bh=Zqkm7aqyRCSQ+b3/N48+MN/w1oUlkwo8qxuzVoWUtTc=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=aRwiujNJky7pS3rdcMSKtorVQnmE+A6HTkwloMysn9lY6nBqmh5kbPXvYrKkFu85I
	 IVIKFgi5Pw2syLj82IVoml1cH4B9SCwxKUUZdYCuUcpoJ6tY5m4ynGb/0H9bsA+0E9
	 Ctu8Suw96sjUS/neba+GLYHZFXQZQQY0RSzocDMw=
Received: (nullmailer pid 392333 invoked by uid 1000);
	Sat, 04 Feb 2023 11:08:07 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>,
        Felix Fietkau <nbd@nbd.name>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vladimir Oltean <olteanv@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Jianhui Zhao <zhaojh329@gmail.com>
Subject: Re: [PATCH 0/9] net: ethernet: mtk_eth_soc: various enhancements
Organization: m
References: <cover.1675407169.git.daniel@makrotopia.org>
Date: Sat, 04 Feb 2023 12:08:07 +0100
In-Reply-To: <cover.1675407169.git.daniel@makrotopia.org> (Daniel Golle's
	message of "Fri, 3 Feb 2023 06:58:48 +0000")
Message-ID: <87h6w1r8mg.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_031103_530878_D81EF68E 
X-CRM114-Status: GOOD (  13.83  )
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

Daniel Golle <daniel@makrotopia.org> writes:

> This series brings a variety of fixes and enhancements for mtk_eth_soc,
> adds support for the MT7981 SoC and facilitates sharing the SGMII PCS
> code between mtk_eth_soc and mt7530.

Thanks! I've now successfully tested this on an MT7986 board with 2.5G
phys (GPY211C) connected to one of the mtk_eth_soc macs and on port 5 of
the the MT7531.  The series fixes a number of issues for me, including a
mysterious packet drop at 1G only which I believe is related to the
undocumented MAC_MCR_BIT_12 in patch 5.

With Vladimir's (WiP?) "PCS and PHY in-band sync" patch set and your
related implementations in mxl-gpy, mt7530 and mtk_eth_soc to top of
this series, both 2.5G ports are now usable at any speed.

Note that the mt7530.c part of the series depends on=20
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?=
id=3D697c3892d825fb78f42ec8e53bed065dd728db3e
which is not yet in net-next. It appears to be destined for v6.2 so this
is not a problem.  Just mentioning it in case someone else is struggling
with the testing of this series.

Feel free to add

Tested-by: Bj=C3=B8rn Mork <bjorn@mork.no>

to the complete series.


Bj=C3=B8rn

