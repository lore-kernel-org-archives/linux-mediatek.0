Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48DAC71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 20:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5z5xiDh1kWROvWBKcWlbFVnu7MThq/BajnFC0Dj2Nk=; b=ctgqxVqb9TCR7I
	vuFD8Cgh84axzYpYmp9FrQPZF+NyHCBlyatp0qhtPi68kHCTN8IEm7/ORTQPnyrx0sEPuiAtB8b4E
	FIUW5COoRtlSsnCFKRIbvXMVCCEIHhBWDok1fLQR41pvZWkydO4losUUG4lbhDdXy9WjbAUW6HNtX
	uYleOvHuYwIrKXJQNvCsFtOEl0iuAnzm0G7Ey6dekaXzeyoD07mdhs8r2GlawrKYqLcwGYc5fS3v+
	0nvodqjuQNyrM6cNQu7gHEjgj561iXS6e+qB8TtlFeSM+ObYcM1dNk/bppQhvEAQTJLZnFg2zTT3n
	c+pBHH7m/23ugDMT7Mew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfnFM-001Fqf-2O;
	Mon, 11 Sep 2023 20:11:00 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfnFJ-001FpD-0b;
	Mon, 11 Sep 2023 20:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1694463047; x=1695067847; i=frank-w@public-files.de;
 bh=HHmkmeHxY0x6YELBcMZPjeob1XxmshaXuwNwkwj92vI=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:Referenc
 es;
 b=Iap7nAKROgCwPmgSJaT8FhHs91+z7oHAU69G6ls+/qVzqNoGrfyDZHaBLgx/H0FGpaKzJpR
 LYFmccw0XPcDmlv15+9lVD5UaJxwg/yANyTP4UKS42eepBTNUqqvd2JWz7BEToMGHGDe13rAb
 if4GTYf7GIrqXmfTvw9GSB21OHBjOjrcJZAHWdFK9sq7F4UrTeDynd7ctyNTxMyQTjd6ZUO2X
 AYLgHe3grA1iXG1ve5r1xNUuVJRK6B2l+LCLSIFfa/Fn4g7BbAhXQX1jASr579QhyXL0SuTxH
 O5Rq7DC9fU1oVHEF9udVIk3na59vHtsKw7k8n1kupn7etcgk+ipA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.151.158]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRfl-1q4Ghb3kSX-00bwPd; Mon, 11
 Sep 2023 22:10:47 +0200
Date: Mon, 11 Sep 2023 22:10:46 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1=5D_arm64=3A_dts=3A_mt7986=3A_add_?= =?US-ASCII?Q?overlay_for_SATA_power_socket_on_BPI-R3?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAL_Jsq+f9bq5Mab9m1pzDeiw304TMeNDmJk+ofG6M8J9QD3cvQ@mail.gmail.com>
References: <20230901072730.13571-1-linux@fw-web.de> <CAL_Jsq+f9bq5Mab9m1pzDeiw304TMeNDmJk+ofG6M8J9QD3cvQ@mail.gmail.com>
Message-ID: <76060BF0-B432-4BB8-A5C8-39EFF3D628EA@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9L+xgTcJUdckurYVAOzn9vZIma2+w/AOEA09dsu3M0K0DzZShi7
 VMW6t5/tANLoeS4Hinp4N/v7pvljhATwL/lTUV/rWrxw3eO9SLDmTwd/tyPbl4mZdG0reVe
 FUUu7oR3lsutQgDwNwXNRkZOredEJ6fbpp0/IhKyC9+oGTFjX9rG/lwaJXUfDMbl/4z3J1g
 q5ARG/5K+J9M6iOYXFHxg==
UI-OutboundReport: notjunk:1;M01:P0:Ss/nr+jQw9E=;KQ95qghdY1pu9I5xgPu52kh2iwU
 5qVj231gP+5kSSXN4Z0SJ5EsFE2m0mpGMqEqdyxUsSFy8MIn3oCTG3z0OYRKlp7YK38y64GW2
 DHLibRH5iTfl5rjCWTuw76PdbctbUkQmJ6E/76dzmMSoKSGrsjgDE1wz6BGYOVN9wK0TbGn5H
 T05pICixPkzfU6ETBzAtcB3106/duTjXsDRdgG8cC1QTEUIKpHeBf5lYIN5Ts0dVH7hKu2OkT
 ZCgaEejYh/XXOxckIX3S6AJH6cTWPEz2H7JwNb+swKSl66QrXb6Kg99U+IsrM+D91aqnF5dQD
 N/6XMSdHuMzTjQ8BvEiqD+JxzETcvIrFKSCu6pEceRSeUaAtCRqLAjP26IL/Ap61MdmGSNynv
 LfJlVGWdD6Y+4ba65zu2qecPGJ5Ij+51rXT9eICi5upd3z3mcn+Ur2mVDYGbSAfO9NT2/+KxQ
 LMCVEGfG/fjVpE/zqVoxg1i1MZDwTSX8icHod80r5GyF265w81nz6pul4J+944YAPXtBfe7hS
 4X2hvFB7UZG8wvwPV3rBU6jYwRHb6I0faSayNUvkMn4ln0P+KVQ7spZ17tvlJB+ZkDYPmXjfX
 3nhH3+tkTnrWXQyihRESXgacVpkcfMfnSmLSudCDq8R9Lgk8eJ+m+gwvXDgVOjHERq17jF8oU
 CJX1CJD+hcmw4JD2lBHOwujuJrqpapRh3T9eHRwRaVY259Jj/wcDi0fcpYrPMdHjoE1ep/0KB
 Fjt5eI1tFaUoLFLeXyXL1cl34mAVpuNFhFqJtBcO0ngQ2311tgZX7UNm+ejJNep+3t53KucCb
 FKtRgI09Dphvz/QhN6R7fySZcgavIFgYPcJssLFRsqSGNgEnMUwkLnY3LpkAW8iy4qgOiG9YY
 N/SdjSjuMXbH76KKn5ty2cWu+zabHnhKu0Amqca77mvKJ36pwNGldiZznteKhiXTsX2lxtbBr
 lD0MtA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_131057_611313_234EAABF 
X-CRM114-Status: GOOD (  11.59  )
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

Am 11=2E September 2023 21:51:42 MESZ schrieb Rob Herring <robh+dt@kernel=
=2Eorg>:
>On Fri, Sep 1, 2023 at 2:27=E2=80=AFAM Frank Wunderlich <linux@fw-web=2Ed=
e> wrote:
>>
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>
>> Bananapi R3 has a Power socket entended for using external SATA drives=
=2E
>> This Socket is off by default but can be switched with gpio 8=2E
>>
>> Add an overlay to activate it=2E
>>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>  arch/arm64/boot/dts/mediatek/Makefile         |  1 +
>>  =2E=2E=2E/mt7986a-bananapi-bpi-r3-sata=2Edtso         | 39 +++++++++++=
++++++++
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r=
3-sata=2Edtso
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dt=
s/mediatek/Makefile
>> index c99c3372a4b5=2E=2E822d3e36d3df 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi=
-r3-emmc=2Edtbo
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand=2Edtbo
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor=2Edtbo
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sd=2Edtbo
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-sata=2Edtbo
>
>The requirement for overlays is they have a target base dt in tree and
>that you apply the overlay to it=2E All these existing overlays have the
>same problem which I pointed out when you submitted them=2E Please fix
>the existing ones before adding more=2E
>
>
>Rob

Hi Rob,

i do not understand the problem as there is a target base dt=2E=2E=2Emt798=
6a-bananapi-bpi-r3=2Edtb=2E

Do you mean that overlays should be merged with basedt at compiletime?

We pack the base-dt and all overlays into one fit image and let uboot dyna=
mically select the combination to apply=2E E=2Eg=2E check if emmc is availa=
ble, if yes apply emmc overlay else the sd one,same for nand/nor=2E

Else i do not know *how* to fix as i don't see it as broken=2E

regards Frank

