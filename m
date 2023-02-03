Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901BFC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBtFXiOaxjapiMDewgSuvRBSynlE/nLpzbKpUvxzZ4U=; b=YOCJn0d6N+wUvRfdHFKKlCLssR
	FPPL+DpBhvas4q7c259gJgJUHIcyHuBRjqiom54sz2rvHQIZUhxsH9WtHuK+OfVkDt4LyLb5KWqQb
	05Np9wiUti1N80P+rehU7GKRZ3kVJo0WULUuOmbbRofbByFfvUikj+clB80EAL7C7a0/rouctvqcf
	qz9OGbP5htXQ3nd6cNwvWcXt2bptI5tNyRiKM2bI3R6YuD2WFfWE8uXhXl0wC1eTWGp9kgqaMfK4K
	fDhI3yM4cCm7ifq8rTjFG15YyI37yYGVaOsh/G12Xnt8J9tJH4UN1qZXlvVV3juoOg22QVEX1I3fY
	TJOrQ5XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNsKx-001BFC-4Y; Fri, 03 Feb 2023 09:26:27 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNsKt-001BDH-VX; Fri, 03 Feb 2023 09:26:26 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 3139PiLf773660
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 3 Feb 2023 09:25:45 GMT
Received: from miraculix.mork.no ([IPv6:2a01:799:c9a:3202:549f:9f7a:c9d8:875b])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 3139PcbS1534444
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 3 Feb 2023 10:25:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1675416339; bh=VBtFXiOaxjapiMDewgSuvRBSynlE/nLpzbKpUvxzZ4U=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=T+WP/6kLczsZbbKv+POC7djUJLTqQWawcXIjaJh0dxew66z6DdtXzOluohHttOPfm
	 cCcq4mR9tptxsD34OuqlIDjWHIdBy1a4MMAuBsIsL0x0laZebqITfRFj/voICcHRUH
	 SIk67RuPLR+/9DRaqtUqQgkkx9xfdS6ESIzGlyJQ=
Received: (nullmailer pid 337756 invoked by uid 1000);
	Fri, 03 Feb 2023 09:25:38 -0000
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
Subject: Re: [PATCH 8/9] net: ethernet: mtk_eth_soc: switch to external PCS
 driver
Organization: m
References: <cover.1675407169.git.daniel@makrotopia.org>
	<3bac780184867e111c3a1567d8b55658abd931da.1675407169.git.daniel@makrotopia.org>
Date: Fri, 03 Feb 2023 10:25:38 +0100
In-Reply-To: <3bac780184867e111c3a1567d8b55658abd931da.1675407169.git.daniel@makrotopia.org>
	(Daniel Golle's message of "Fri, 3 Feb 2023 07:06:10 +0000")
Message-ID: <87357nt819.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_012624_511401_6883C549 
X-CRM114-Status: UNSURE (   8.57  )
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

Daniel Golle <daniel@makrotopia.org> writes:

> -		ss->pcs[i].ana_rgc3 =3D ana_rgc3;
> -		ss->pcs[i].regmap =3D syscon_node_to_regmap(np);
> -
> -		ss->pcs[i].flags =3D 0;
> +		flags =3D 0;
>  		if (of_property_read_bool(np, "pn_swap"))
> -			ss->pcs[i].flags |=3D MTK_SGMII_FLAG_PN_SWAP;
> +			flags |=3D MTK_SGMII_FLAG_PN_SWAP;
>=20=20

patch 1 added "mediatek,pn_swap" so this doesn't apply.  We've all done
last minute cleanups - never a good idea :-)


Bj=C3=B8rn

