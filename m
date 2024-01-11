Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53042C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gj747UejXEsKCNfBnSiWE2Z/QSUkFJ5UibHghFxO4iE=; b=XKoXlSQBIC35St
	F3D+k77KD88YmZnFxaBF5heyF9MAbFYdCeRDyryuUGoCXS0EfkdtIc70guvfV3WviyyqAgDMrmL/o
	1w9ASiTeY0XEsy8cPIBX2vMVpTz7G5h3tieXorI4L2GFDv0RM3G95QDdDuINqbB4u+wb02vca5csl
	AP52W9fldqGiSgDi22IW+HJaKwu5Nx9tKqAmMXBRQwHhQAOuzYG+bHBxstXXNilmTblv30QUUc/eg
	eJq3653Rh6dwHTsQsfJNltiXxsx9W50tQ0aUfkaQPAhchHD9CYeOPfrpe+hKhCJ8ndZXNznwF9pMY
	hnQetXRbU1SvmYu9IVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsPT-00H1Lv-0L;
	Thu, 11 Jan 2024 10:35:39 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsPP-00H1Jb-2I;
	Thu, 11 Jan 2024 10:35:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1704969310; x=1705574110; i=frank-w@public-files.de;
	bh=gj747UejXEsKCNfBnSiWE2Z/QSUkFJ5UibHghFxO4iE=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=Li3rwdYO2pCvYoOc3MgilYPlzjOgGRw1SLQ1Bs5kD5lB6CVY8vXZVXOI1VQtolft
	 J255mxVlPh4vON7a2kJ8Yax33TJGGCPRiwap05CuK/dqOQIjHKP0yRUWH6d+qk6FF
	 vU6gXqQf5SDo8fDXOWGVcG0/YnSq/YyDRvDMlE7MW54Bbkj1aAkE7uKRYQ+/drawf
	 A2zCVkiqAb1ZdS/l/ejQEUyAalY5PYphW25UWZqB8gnDSGWp+C1a98HpNnzIVKE44
	 gPC7hh7SxMQsw1+jbRmVLPMnAfGQx4VLl2hjeumxOxyPMKLOmuKba2DrJrwTbz9b9
	 +PjFx5hg2+cJKkUtjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.145.175]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1qxqUd4Av8-00zGJf; Thu, 11
 Jan 2024 11:35:10 +0100
Date: Thu, 11 Jan 2024 11:35:02 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Vladimir Oltean <olteanv@gmail.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>, Simon Horman <horms@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net-next_07/1?= =?US-ASCII?Q?5=5D_net=3A_dsa=3A_mt7530=3A_do_n?= =?US-ASCII?Q?ot_run_mt7530=5Fsetup=5Fport5=28=29_if_port_5_is_disabled?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240111103146.t5fzr2wlw2tyrkkb@skbuf>
References: <20231207184015.u7uoyfhdxiyuw6hh@skbuf> <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain> <20231208184652.k2max4kf7r3fgksg@skbuf> <c3a0fc6a-825c-4de3-b5cf-b454a6d4d3cf@arinc9.com> <48b664fb-edf9-4170-abde-2eb99e04f0e5@suswa.mountain> <2ad136ed-be3a-407f-bf3c-5faf664b927c@arinc9.com> <20240109145740.3vbtkuowiwedz5hx@skbuf> <0a086b5f-b319-4f08-9513-a38c214e1da7@arinc9.com> <20240110182358.ci7pg7ipcbsjxqjf@skbuf> <009fec43-0669-419e-a3a9-ce54c676a324@arinc9.com> <20240111103146.t5fzr2wlw2tyrkkb@skbuf>
Message-ID: <316D9D48-5765-4A94-9937-81AF95AEB16E@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:POuABXpDzjGaTaQzOShQ67leLrEB5m9D1ckR+umNPv2yLSb1vB3
 8ZhsLXvywDqOvjjX5Nio56FT9mrtER5pfWdA5seDJFnwcpGNzIxZM5K6JfYwHkHwN4kqlmG
 qwrwIK/xv3cwMqAsmACEktlWssQG/943ya3iaKbhiCBWKAJPb/h1kZAyGn+nBoRBueTTyqW
 OtvIVuw8P6b1BtRfEXf2g==
UI-OutboundReport: notjunk:1;M01:P0:N7GEtj/ZZtY=;I8B4FXA8RsDsV1nrAfqOpSMQ8+R
 Z5/5wSg6zU2kAhsPtFIPQPStzBMY1tl4qUXBedRPh3RVFRH7frYafUoMEmPKWLrZh2CIFM21T
 twI2W0Iie1cj8PC7XPP8KtrCbAXJtkz/cfCmyBo6lm3yEI6WjBq/LiBlmOif7S3BbOKuAk/pY
 u+WBF3VR55x2AhfU/75BUujCLBYWWhPpEih9OoNsoMRw8Y2YJEpFdEG8UPjcFzPVOK9NeaZ3W
 RXGUr3bFGgnFc/K5OYV2gD+hXcaRGskn3qTzFGraVjJyVKs+sD1QYIPJTLiAX5x+9xGjCj8zH
 ACPGj4KO/UlIqMOgJdw2ophkUKkDEMiSRP/2iLqfSpWay6lxwE9TZnQdNhmw0k/LCXwKVC56p
 uP/k+gwoTPtMnjTZkVT3BD7nyZCyD08VwEzip+ikc6meo8fDhLhg0Kb0XEUCdD/9UcOg5EzlZ
 uJ4Da1S1TUCKr5smYzFAvCChLB9GOE2xPUPT+V7f3XIMmXd3Ee8b8GQIf14zEgNFrnt4HWkZ4
 8nzg3NY9Y5qf3gb0T2uqD3F7GX4yVQrAvgIYWArv1ZPx2zhv/wcFRKaaLVh8U3grjcfsPD137
 OfjN4ZyBSbZEGiqJCaP6fAZYplcptGaUV06FTHR96Es0xFSnuiymwkzSBXUI0+wHubftLdak0
 2HXwYOZMQ51zyDKOnwZlQuP2GWYcGN0X7dFXozxviQfUvGbsdxoLIV4dgwS/jyvLp48lSD7/B
 EXeRWLi95nAGn8hA1lKl74htnkCiqrYrzcueEeZzt4MES4L5J1Qiok5urQWhFFwyvB9aGLMFH
 eVdVOwhIZ77cK8b+lyP84mYR57xQa4M+Ze6GcGuA8lN2C5aj4w+WvADIiMcscS/WpLxe7prY0
 dl8isd9WcSX0QRAkILJCf3kBrxYBVmeD5LWyk+kT9W4S8BCNb6NqfwjHrqOb6unJFnv8Jmj/U
 ocAHew==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_023536_136011_0EF18CCC 
X-CRM114-Status: UNSURE (   9.46  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 11=2E Januar 2024 11:31:46 MEZ schrieb Vladimir Oltean <olteanv@gmail=2E=
com>:
>On Thu, Jan 11, 2024 at 01:22:12PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote=
:
>> > BTW, besides OpenWrt, what other software is deployed on these SoCs
>> > typically?
>>=20
>> Other than OpenWrt which is widely used for these SoCs for its ease of
>> flashing and upgrading, compatibility with legacy U-boot versions that
>> usually come with any vendor making a product out of these SoCs, I can =
only
>> talk about what I deploy to run Linux=2E I use mainline U-Boot along wi=
th the
>> device trees from the Linux repository to boot mainline Linux kernels w=
ith
>> Buildroot as the filesystem=2E
>>=20
>> Ar=C4=B1n=C3=A7
>
>I meant what other software (operating system) _instead_ of OpenWRT=2E
>I'm trying to figure out what other users of PHY muxing there might be=2E

Hi

I (and possibly others) use debian/ubuntu and there are also archlinux ima=
ges for the bpi router boards=2E


regards Frank

