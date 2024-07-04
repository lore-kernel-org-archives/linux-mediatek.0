Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC16C31D97
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 11:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:To:From:Subject:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hR2QdAzqWEwq/x2HdwwPXPd5/C7xm4Qo2q+2kZy3sY8=; b=d+jmUgSlKaYfA/UDqNnZY0r+NC
	M6aR53On5lbB91QOGirhq4bHGl+xn9TKJbq7G0UMvNHXf0MQqPut8b2hrUT6M0FBXZEA8Topo6G3n
	yMon1BGzyLr0ci7s1nIRZle7q9RH1Wj8AOePWln3axAE1wxnPhFu2H7kzgVMlSXQMmTd300KxhUd4
	ZB7RiiF4miYSio6qr6kTt5vB+7bCV9DeRwhiISOel/8gBcHe1fClPywKL/ri6ElWD5C6I9rd/rX2a
	2pK/hSq4Qpl2C1vkjMHUDaktV8ExNoGahu4FbI+NywX3jwDyo2QzN6CHhzRwk86Yic0UgGqBQ9TxI
	s66nMLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKCx-0000000CwrB-338m;
	Thu, 04 Jul 2024 11:00:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPKCv-0000000CwqT-16zg
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 11:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720090855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hR2QdAzqWEwq/x2HdwwPXPd5/C7xm4Qo2q+2kZy3sY8=;
	b=Ikzirlj9hlmH+6xkIfe5kgpatLNQibz4Z7yRtpSpLyqJIGcWrHHm4c902+YOd0jQLvFMio
	T7JzJjYHwynmll+F+aZR1uP+8R7cVdlYfr4NNkx4qgaGVCa5kso5a0yd1us6SK4G6LZIh0
	ETv/e6QhBftimlqveZ7mCTw5YGb5uD4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-SwBUeZz1Oc-Ph5qgZ7kgeA-1; Thu, 04 Jul 2024 07:00:53 -0400
X-MC-Unique: SwBUeZz1Oc-Ph5qgZ7kgeA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-424a5825227so982965e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jul 2024 04:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720090853; x=1720695653;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ad4L9+kWBzMVQvXloFyEMUMmlmbIqyWyzPiUhliLNr0=;
        b=Z5cdpWWv3h6cVWw+AjtUfjtAdc5oIq3Z4Ls+V8zkyrvcTwys9MSxTDmhyyOL7RDGmC
         nujkJOYKkDRP38FU45NoXMaQYEj3IcF/EISw80j6I0+1l5Mv5Xsw8cxdxYX3jjow9U0/
         AxecReGfvmKKUVxVXUCO8mdLp5l4WiAtA435rnkmcUfzPSuZ/06HUjGFE+cU6HrFHB/4
         UwkPgXcz4YF7QxQOmT9AYrERp06PKwyXQt6kVlBFgZAbDPxeoPxmDzE+XeWZOMUUCvYy
         Ds5OrULxXby2u2KAGIgJr7ta7ofDr5CYf05pq0vY7sx+/YH2qZmuswTuC1LB4ENdHPws
         kImg==
X-Forwarded-Encrypted: i=1; AJvYcCVj5ie/cw5OjqKxiOjJGLqM1bvh0QpSTM5GWicv55AEfqDCjbAK+kWrH7r4KkgKW7F1zCpnvAKOIkesdaHXm1Uq8AWnGXoEkFCg3w+yJ8zIP570
X-Gm-Message-State: AOJu0YxG/K0PO/uicoSgyAj/06FRTG5uww1QpfItkYpqphR+LUDndP+M
	xqJc6lWpB2wpJa9y+OzqRxrBWSmwJzObmoHAwua+hck3CQdPHVwgtVbeahHgJsDMOeoG9a4RenB
	XlzjNDCp/Xw5AWQIeq8zIq8roOSZK1gDLteof72lKe4TaM2OcLKWQpj+usXRFkVh3Kd7dQA==
X-Received: by 2002:a05:600c:4f8a:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-4264a3f55acmr9638645e9.2.1720090852827;
        Thu, 04 Jul 2024 04:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcKPkVhdFNdlTGDGaCX5rh9Rf3I2O54hOzebvC/xmR0BRMKX9kR1T3GdyC6Zz6Q9cJgs+dWw==
X-Received: by 2002:a05:600c:4f8a:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-4264a3f55acmr9638415e9.2.1720090852435;
        Thu, 04 Jul 2024 04:00:52 -0700 (PDT)
Received: from gerbillo.redhat.com ([2a0d:3344:172b:1510:dd78:6ccd:a776:5943])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d60e6sm19747125e9.11.2024.07.04.04.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:00:51 -0700 (PDT)
Message-ID: <696203057c047a668b72e8af2cf8fcc696649c17.camel@redhat.com>
Subject: Re: [RESEND PATCH net] net: ethernet: mtk-star-emac: set
 mac_managed_pm when probing
From: Paolo Abeni <pabeni@redhat.com>
To: Jian Hui Lee <jianhui.lee@canonical.com>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Date: Thu, 04 Jul 2024 13:00:50 +0200
In-Reply-To: <20240703061840.3137496-1-jianhui.lee@canonical.com>
References: <20240703061840.3137496-1-jianhui.lee@canonical.com>
Autocrypt: addr=pabeni@redhat.com; prefer-encrypt=mutual; keydata=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
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_040057_400160_C973BF53 
X-CRM114-Status: GOOD (  13.91  )
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

On Wed, 2024-07-03 at 14:18 +0800, Jian Hui Lee wrote:
> The below commit introduced a warning message when phy state is not in
> the states: PHY_HALTED, PHY_READY, and PHY_UP.
> commit 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume(=
) state")
>=20
> mtk-star-emac doesn't need mdiobus suspend/resume. To fix the warning
> message during resume, indicate the phy resume/suspend is managed by the
> mac when probing.
>=20
> Fixes: 744d23c71af3 ("net: phy: Warn about incorrect mdio_bus_phy_resume(=
) state")
> Signed-off-by: Jian Hui Lee <jianhui.lee@canonical.com>
> ---
> resending to add the mailing list recipient
>=20
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/=
ethernet/mediatek/mtk_star_emac.c
> index 31aebeb2e285..79f8a8b72c27 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -1525,6 +1525,7 @@ static int mtk_star_probe(struct platform_device *p=
dev)
>  =09struct device_node *of_node;
>  =09struct mtk_star_priv *priv;
>  =09struct net_device *ndev;
> +=09struct phy_device *phydev;

Please respect the reverse x-mas tree order above.

Thanks,

Paolo


