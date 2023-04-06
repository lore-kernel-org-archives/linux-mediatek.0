Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6D9C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1Bdx/wsQfRAwIInAabAl9Jx8i29x6dlAdIxMNIdY9w=; b=FsUMnsDcl0To9OURzFxiSPMv3d
	ky8raRlN0HJQXFa7eXCfyhhb/w2rzPDRLidJ5phL76R3SZUIttCTqwWyXL1lQU6XVbhbfrrIoEO8y
	wYMb619azX1nY4L+zh+rRXi+8Blwt9/R5dWjX3kj2WPOrKQWecayJPoaargVazLM0FFdA6VK614BW
	lYof6Rv7pgfKOoKlU1/CjrmxObiFCiCIjnHoygtK+l1tNAxWqPNWaxqB65sw1lHJzb4cZMuCyZmVZ
	4WADmFL+VhMY9M5R+NQoxLktqG1X9vxFoL75ZDsoynVoPSOf9y5mb+jHcTn2ugbLjz1HisJB64oXZ
	SoIwbIJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkLKl-006ntj-2l;
	Thu, 06 Apr 2023 08:51:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkLKi-006nt7-2S
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 08:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680771060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W1Bdx/wsQfRAwIInAabAl9Jx8i29x6dlAdIxMNIdY9w=;
	b=D+bJgOZCRTg/iJX67fgU+KIIdNrNmFGhgdV9v/Z19n9jvvrZw0Pb0YhbIEn+VggqMc8NGg
	VjcVpa+fn+AxNzWaxMmfop12qLNCbV3cqF4z39cUxyCWcdFIFFHvCeu/9vwVllNFmPHhed
	O3r/H8wk8IiOOhPS44ubUNskewfrl0c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-Oxqf6UReP56DhYyNG5kVnQ-1; Thu, 06 Apr 2023 04:50:59 -0400
X-MC-Unique: Oxqf6UReP56DhYyNG5kVnQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-3e1522cf031so13664751cf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 01:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680771059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W1Bdx/wsQfRAwIInAabAl9Jx8i29x6dlAdIxMNIdY9w=;
        b=BUqVQacz6Pv38pD3ul8VyXUJL1+fNVQiQASIhbmt66txtr7QLU1n44s+rLy8tDKrwo
         QuDBj58DIL1NZugzeHziCEYGt3h6uPDPXt+XyJmMwwLPLCxTMASW7i7zsRtAz84PX372
         Q52t4Aw4t8H2qkR6oKQSalQCZ3sybH4LApqnULo1qrAVVuT9p8ovBCKT9cJ0w97yk036
         aFVvfQRZoAPuoSHD9hHuyq1JbldTx7EnCo1aCqtorNE/Fe4ji/KA1jERccjGrW1YtCH/
         Pgp9ILqmt/RAO6v9M446x5gWDt+ZVAaLE97gLYXQ6HRNZS8GKe6d2DpSqY3xDrWtZi4o
         1mAw==
X-Gm-Message-State: AAQBX9crdSIKH+opIywijmY0GgZ9rqYfHu7SXS3C/Qt9LoFtLlNLl9e8
	sDuwgVjxca2/B77A4nxJPFTPtUyCzu04sfsYAqIcsku7zp74MQn+EKNSunoX/GxFU6sTl+OCxrQ
	sn7qwXuLIDvBjpc2lpt6H98Yup4caz8z1
X-Received: by 2002:a05:622a:1a24:b0:3e6:707e:d3c2 with SMTP id f36-20020a05622a1a2400b003e6707ed3c2mr10814504qtb.0.1680771059055;
        Thu, 06 Apr 2023 01:50:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350bo5VqIhFeRZZcRwVCtgs8cYkmbupz1mYsttbY1gkrcv9BmYYkg1QFtxoLmxwuXn4DxKkvkSg==
X-Received: by 2002:a05:622a:1a24:b0:3e6:707e:d3c2 with SMTP id f36-20020a05622a1a2400b003e6707ed3c2mr10814489qtb.0.1680771058733;
        Thu, 06 Apr 2023 01:50:58 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-227-151.dyn.eolo.it. [146.241.227.151])
        by smtp.gmail.com with ESMTPSA id p15-20020a37420f000000b00749fc742ab4sm327473qka.7.2023.04.06.01.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:50:58 -0700 (PDT)
Message-ID: <17cb566ef79342f77b50ad999e9fa910be4cb27f.camel@redhat.com>
Subject: Re: [PATCH v2 net-next 06/10] dt-bindings: soc: mediatek: move ilm
 in a dedicated dts node
From: Paolo Abeni <pabeni@redhat.com>
To: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, nbd@nbd.name, 
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, 
 lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
 devicetree@vger.kernel.org,  Lorenzo Bianconi <lorenzo@kernel.org>,
 netdev@vger.kernel.org
Date: Thu, 06 Apr 2023 10:50:54 +0200
In-Reply-To: <18109725ba14d2fe5c00e627b064b38b5c8f2223.1680268101.git.lorenzo@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
	 <18109725ba14d2fe5c00e627b064b38b5c8f2223.1680268101.git.lorenzo@kernel.org>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_015104_895901_F3EC0303 
X-CRM114-Status: GOOD (  16.94  )
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

On Fri, 2023-03-31 at 15:12 +0200, Lorenzo Bianconi wrote:
> Since the ilm memory region is not part of the MT7986 RAM SoC, move ilm
> in a deidicated syscon node.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 14 +++---
>  .../soc/mediatek/mediatek,mt7986-wo-ilm.yaml  | 45 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediat=
ek,mt7986-wo-ilm.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt76=
22-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt762=
2-wed.yaml
> index 7f6638d43854..e63fb22447c6 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.=
yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.=
yaml
> @@ -32,14 +32,12 @@ properties:
>    memory-region:
>      items:
>        - description: firmware EMI region
> -      - description: firmware ILM region
>        - description: firmware DLM region
>        - description: firmware CPU DATA region
> =20
>    memory-region-names:
>      items:
>        - const: wo-emi
> -      - const: wo-ilm
>        - const: wo-dlm
>        - const: wo-data
> =20
> @@ -51,6 +49,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: mediatek wed-wo cpuboot controller interface.
> =20
> +  mediatek,wo-ilm:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: mediatek wed-wo ilm interface.
> +
>  allOf:
>    - if:
>        properties:
> @@ -63,6 +65,7 @@ allOf:
>          memory-region: false
>          mediatek,wo-ccif: false
>          mediatek,wo-cpuboot: false
> +        mediatek,wo-ilm: false
> =20
>  required:
>    - compatible
> @@ -97,11 +100,10 @@ examples:
>          reg =3D <0 0x15010000 0 0x1000>;
>          interrupts =3D <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> =20
> -        memory-region =3D <&wo_emi>, <&wo_ilm>, <&wo_dlm>,
> -                        <&wo_data>;
> -        memory-region-names =3D "wo-emi", "wo-ilm", "wo-dlm",
> -                              "wo-data";
> +        memory-region =3D <&wo_emi>, <&wo_dlm>, <&wo_data>;
> +        memory-region-names =3D "wo-emi", "wo-dlm", "wo-data";
>          mediatek,wo-ccif =3D <&wo_ccif0>;
>          mediatek,wo-cpuboot =3D <&wo_cpuboot>;
> +        mediatek,wo-ilm =3D <&wo_ilm>;
>        };
>      };
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt79=
86-wo-ilm.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt=
7986-wo-ilm.yaml
> new file mode 100644
> index 000000000000..2a3775cd941e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-i=
lm.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mt7986-wo-ilm.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Wireless Ethernet Dispatch (WED) WO ILM firmware interfa=
ce for MT7986
> +
> +maintainers:
> +  - Lorenzo Bianconi <lorenzo@kernel.org>
> +  - Felix Fietkau <nbd@nbd.name>
> +
> +description:
> +  The MediaTek wo-ilm (Information Lifecycle Management) provides a conf=
iguration
> +  interface for WiFi critical data used by WED WO firmware. WED WO contr=
oller is
> +  used to perform offload rx packet processing (e.g. 802.11 aggregation =
packet
> +  reordering or rx header translation) on MT7986 soc.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt7986-wo-ilm
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      syscon@151e0000 {
> +        compatible =3D "mediatek,mt7986-wo-ilm", "syscon";
> +        reg =3D <0 0x151e0000 0 0x8000>;
> +      };
> +    };

Hi Rob,

it's not clear to me if this version and Lorenzo's replies on the
previous one address your doubts here. Do you have any further
comments?

Thanks,

Paolo


