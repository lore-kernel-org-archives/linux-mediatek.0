Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68406C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 16:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References
	:Message-Id:Date:Subject:Mime-Version:From:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hv3wattWbtjbSTdeYjK2ZDT7gtCeh5K4SfrhrDsjmCA=; b=iOdzyji0aRGXyA1zQy8LKnUMG5
	CEe3sJH97CtN4UAKvYMnXvk+YIAV3FJ9k2kB42OqD8prLz/28t8oxKxkb8990hWuXMBHeuFmHCmRD
	ByFTumLDA/LvcwEe5609Yj5Rg+ZZjVUQaefRATfc9EGz/x1F5U1I6rD3IWmbn81Tfn5YVw84+5zXA
	3H5m/bFCEiqpJ67VfnuZtZYgC8OmixoMzJJrhw3HtFhJgvHiK42a84H5Kc7qYP2DfRIsLHyQo6pfp
	t6ftnK59w2DQPVDDvfJwAtCW1jZ9IYOYvvO+kjzREw7UieN3U0IYcCLg+IQ7a2WurqksgemVq7JvR
	dokHsqNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4H8-005LGv-R5; Fri, 18 Nov 2022 16:31:34 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4Gs-005L5K-Cu; Fri, 18 Nov 2022 16:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:
	Mime-Version:From:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hv3wattWbtjbSTdeYjK2ZDT7gtCeh5K4SfrhrDsjmCA=; b=Vw52GubctujRSSahq1c7EVle+S
	dmmzjJubKd0E5hkAWgBNj0UX5Zo2BSGlCJ+0ysPloa8J0W12twiXJ2M54qkOA4/u4VZspHLsd48nB
	o6rYFcmAf3trVw3Pagq238S/DfxNL8ehh8iaGbL6t6n7PpEpgBFuUG9uUFe6qaJxq3kk=;
Received: from [2a01:598:b1b7:5a55:79cf:cd83:9b5c:5b05] (helo=smtpclient.apple)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1ow4GX-0032wy-4s; Fri, 18 Nov 2022 17:30:57 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Felix Fietkau <nbd@nbd.name>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH net-next 4/6] net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues
Date: Fri, 18 Nov 2022 17:30:46 +0100
Message-Id: <8EC28201-A848-4078-812A-AFE08ED12F7B@nbd.name>
References: <20221118151331.4694574f@javelin>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221118151331.4694574f@javelin>
To: Alexander 'lynxis' Couzens <lynxis@fe80.eu>
X-Mailer: iPhone Mail (20B101)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_083118_590414_B9B7098D 
X-CRM114-Status: GOOD (  10.38  )
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


> On 18. Nov 2022, at 16:13, Alexander 'lynxis' Couzens <lynxis@fe80.eu> wro=
te:
>=20
> =EF=BB=BFHi Felix,
>=20
>> On Wed, 16 Nov 2022 09:07:32 +0100
>> Felix Fietkau <nbd@nbd.name> wrote:
>>=20
>> @@ -614,6 +618,75 @@ static void mtk_mac_link_down(struct phylink_config *=
config, unsigned int mode,
>>    mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));
>> }
>>=20
>> +static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
>> +                int speed)
>> +{
>> +    const struct mtk_soc_data *soc =3D eth->soc;
>> +    u32 ofs, val;
>> +
>> +    if (!MTK_HAS_CAPS(soc->caps, MTK_QDMA))
>> +        return;
>> +
>> +    val =3D MTK_QTX_SCH_MIN_RATE_EN |
>> +          /* minimum: 10 Mbps */
>> +          FIELD_PREP(MTK_QTX_SCH_MIN_RATE_MAN, 1) |
>> +          FIELD_PREP(MTK_QTX_SCH_MIN_RATE_EXP, 4) |
>> +          MTK_QTX_SCH_LEAKY_BUCKET_SIZE;
>> +    if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
>> +        val |=3D MTK_QTX_SCH_LEAKY_BUCKET_EN;
>> +
>> +    if (IS_ENABLED(CONFIG_SOC_MT7621)) {
>> +        switch (speed) {
>> +        case SPEED_10:
>> +            val |=3D MTK_QTX_SCH_MAX_RATE_EN |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 2) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
>> +            break;
>> +        case SPEED_100:
>> +            val |=3D MTK_QTX_SCH_MAX_RATE_EN |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 103) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 3);
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
>> +            break;
>> +        case SPEED_1000:
>> +            val |=3D MTK_QTX_SCH_MAX_RATE_EN |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 105) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 4) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 10);
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +    } else {
>> +        switch (speed) {
>> +        case SPEED_10:
>> +            val |=3D MTK_QTX_SCH_MAX_RATE_EN |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 4) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
>> +            break;
>> +        case SPEED_100:
>> +            val |=3D MTK_QTX_SCH_MAX_RATE_EN |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
>> +            break;
>> +        case SPEED_1000:
>> +            val |=3D MTK_QTX_SCH_MAX_RATE_EN |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 10) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
>> +                   FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 10);
>> +            break;
>> +        default:
>> +            break;
>> +        }
>> +    }
>> +
>> +    ofs =3D MTK_QTX_OFFSET * idx;
>> +    mtk_w32(eth, val, soc->reg_map->qdma.qtx_sch + ofs);
>> +}
>> +
>> static void mtk_mac_link_up(struct phylink_config *config,
>>                struct phy_device *phy,
>>                unsigned int mode, phy_interface_t interface,
>> @@ -639,6 +712,8 @@ static void mtk_mac_link_up(struct phylink_config *co=
nfig,
>=20
>=20
> What's happening to 2.5Gbit ports (e.g. on mt7622)? Should be SPEED_2500 a=
lso in the switch/case?
> E.g. a direct connected 2.5Gbit phy to GMAC0.
> Or a mt7622 GMAC0 to mt7531 port 6 and a 2.5Gbit phy to port 5.

On 2.5 Gbit/s, the code disables rate limiting, since it=E2=80=99s not neede=
d. That=E2=80=99s why it=E2=80=99s not handled here

- Felix=

