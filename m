Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAA1C05027
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Feb 2023 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1B3OCASARdxy9Ic0aBlnSCkN8EqD8j/5yYK8OY8gnLU=; b=LT8CL8dKiz7CfXlHL4ucvpypLP
	R9smyiNIJ62+quob0DyiVIqEgakYb9dZ4DhSJurpEjEnJ/pvV5xELM14NXCPh6NJlFc9QhONC5Pic
	6PMTY6WV3jmsHLW4+XXWKHZn53ija8hSzyBAA/M/x9PZr4sBL2780/s4w6G13hffG32Y0j+Ah+yPE
	1zsJZYwQ0ULNa/AJIAGR6c456wHnEVSX2Rf8UDZpXmvSKRAwHfRRqVDw48dhaUh9kBZv0hYkh0UoH
	44Bouvuzbx85kYAR8rrd7hhzjLPMHEsd7aXEk50F4rXJLRezHXCcw5d+Mxco9CQ6eEyReKBOsh48D
	EdxMlPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTk7K-001bd3-RL; Sun, 19 Feb 2023 13:52:38 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTk7H-001bbu-Gp
	for linux-mediatek@lists.infradead.org; Sun, 19 Feb 2023 13:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1676814735; i=frank-w@public-files.de;
	bh=gmvlcFd/smi3ohVhvpOwg6d8LqAat/B8RQwKwD+wxnk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hrTYUT5Eu2eVGwfeMs3ZDh4usgGG557Qun1nIumUaxmzkt8djDKUoYgaJstqk3haR
	 yC4gTC+IX2WfsSPI2T5ECDdH7z4wpguBiWqNRO+L8o8fWlKWBFuVLC9oyUJhmpIZ23
	 Nb20cp25LwPBgVdx0Ez1DqqS7i+bjPqCGVVY+5znr/gcuQMRXLmpwb24pxsprdu49K
	 6U4YSwuu61z6kuX+VSMqj6GSpx71FEq6Pe/1E85OHIxwxBMQRw7gJcJxsd5i21FGug
	 pwbEwFloOc4KVrJBbNZY0T6kGID1UhlVXKve4ddsqBR90eAWxZSCQoQeBcu8c2W+gR
	 oGVKZTalLf3bw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.154.15] ([217.61.154.15]) by web-mail.gmx.net
 (3c-app-gmx-bs35.server.lan [172.19.170.87]) (via HTTP); Sun, 19 Feb 2023
 14:52:14 +0100
MIME-Version: 1.0
Message-ID: <trinity-899c01a6-0fc5-4900-aea8-2b43802c8329-1676814734826@3c-app-gmx-bs35>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Aw: Re:  Re: Re: [PATCH v3 0/5] arm: dts: mt7623: relocate gmacs,
 mt7530 switch, and add port@5
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Feb 2023 14:52:14 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <fb96d8eb-2eb7-db19-1135-1a833294dd67@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
 <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
 <trinity-dab715b9-3953-40da-bc25-c4c2a5e9b7c3-1676715866453@3c-app-gmx-bap53>
 <27a26da8-8297-5327-7493-54d8359b6970@arinc9.com>
 <trinity-dd260791-3637-4193-8f93-a9fcdb013dcb-1676722705920@3c-app-gmx-bap53>
 <2dc2fc39-b0d5-c872-36bf-fde851debe4b@arinc9.com>
 <A329B2DF-04B7-40FA-BBCE-1F1012A6DBBD@public-files.de>
 <fb96d8eb-2eb7-db19-1135-1a833294dd67@arinc9.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:H8JYLvvEoF162SefwPsSsiN8Aap9QmINpwaEqytkapWmuK4d0GPFziw2QktTM0gGK0HN7
 i1QLFWMQxHj4lg5tjMB3ECYjti/ltonQmox4TQHYxaJPaO+MbUaAifCi6uk7fG10KZb/2gYtnILo
 nAJJEB6+Li9mekl7Y9UaHnBnS59maFhBNCNL3baeaSouPmP2ADrX0Q4a0DufpqbVucvWPdzDizN5
 AcPcKnqWqTEUcPUdIGGPlJTC8Tcn+wtwebQbh00sO9zeDSDfauKkxaweaJEg8ND8GwKGA+Yq3Tzl
 Kk=
UI-OutboundReport: notjunk:1;M01:P0:hi5o1IiP/qA=;6XlLuYPPfufbmPU18XKOO8DkJWF
 lR+B/5CNDwV4bjvwrkxEHaO+Hio6hM9UGqE/i9E6/G705WFtguKNdegLkH9TbCfvFG2vIpInm
 pfEtEUewrPWhJZIVtlN6HFx5SwCg6baXhrJOUuysy83l1hJBtxwKqkCaThqMN3KK95VyfbpLU
 O2TBBEmqyB2BaeeB0i3qt+8HMTGIHNyRMEqTlwx1gZNI+/SXgT/CzvmlAxCqHtbrpWps1blLV
 eqtqB1oG/qNVrT1bvy9iXpZ59I36T/mEBljAFD3hrxfyw87xk2VyGv3/b2xEVaz4EFrj8xJsZ
 Mmko3qGfxBR+IY9J2knN1VHYVWeSgvz8LOr6FwEWMvt5IuniiAWG3HBguVkCxc4U+U/L9PgQN
 pOahQAj33W4flgCHi4ygbcWKvg565VNazKX30vR2Uc6q9cxHEdJV2TgBmKudaZcJDCZH6tsmR
 0899hx0uniLEYRsfUGt2v9R4/ouqgQeFE+wLo6XjebMo+WNKpb5z4vVBPeWlx0Ij+SHHDTD7k
 ncZ4MRVxrXf6xWOwIfBRCTG2Iv6Qg72DJw0FbFTFs7AqbJ25NHfWVKZ2Nx0E2DBA6GQAglLzk
 LaDDPx39nzK6sxhuyYgF63Ga6ojSSaKr7j81YhwHM5Pc5C3t+oWZM8+sPQLlRnDuyghawGlN+
 yOls0iMeFIe711GM3w1pNpWs1WWF6OMjGHh1nAKjyvqqqe5b01A2Yp6mzRhIkGNBoCmDGFB3b
 Kt0sC63x2POGFPkWgkG1lzKTHOzMv+dZ/PxOV+YDZsib5cMmrxYmlVGKJrWmxzpLZptdW0YZs
 nDCsLjVjYA0A1l7LaHJIqo5GEkPqw/KyCPZJK3b4HnwmQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_055235_961446_61CCAA30 
X-CRM114-Status: GOOD (  10.53  )
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

> Gesendet: Samstag, 18=2E Februar 2023 um 20:34 Uhr
> Von: "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arinc=2Eunal@arinc9=2Ecom>
> An: frank-w@public-files=2Ede
> On 18=2E02=2E2023 22:11, Frank Wunderlich wrote:
> > Am 18=2E Februar 2023 18:02:11 MEZ schrieb "Ar=C4=B1n=C3=A7 =C3=9CNAL"=
 <arinc=2Eunal@arinc9=2Ecom>:
> >> On 18=2E02=2E2023 15:18, Frank Wunderlich wrote:
> Can you also remove this from mt7530=2Ec and do the test again? See if t=
he=20
> performance changes at all=2E
>=20
>          /* Set core clock into 500Mhz */
>          core_write(priv, CORE_GSWPLL_GRP2,
>                     RG_GSWPLL_POSDIV_500M(1) |
>                     RG_GSWPLL_FBKDIV_500M(25));
>=20

with these disabled i have a bit better performance (625 Mbits/sec instead=
 of 600) and no retransmitts on first iperf3-run=2E

not yet tried any rgmii-delay option (have no idea which is the right one =
on which position), but yes, mostly it does not improve performance=2E=2E=
=2Eit simply does work or does not work=2E

regards Frank

