Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E30C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 09:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADAE22515
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 09:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CADAE22515
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE8rQN2EP9/F7E4mCgeWEilQzdaTtacFfRxQQYmyIGs=; b=S/ynQgq9hcSFl+8o+sZVxHWBVk
	VAVbuewipyyAIyy+3a0ctvxBhbP6RaFPHU5tp3NQFNR/HbyTVY2sSd5Ie0oICJTKuznJTNjpKRxL5
	h76OubWcpwm0XOtCMRHhs2hh0y7wolWR9wTU0ci+v9PdfTSvqCzTVXRXZbJwEISaT24P+IcqrEO2v
	kkH8ArlLgwuHxEmFkAFkcW0hprtNVQhOtpBdg6bMHjYAjfSqatydhv6zYUD8Y8D3uaF2dCpj0Zxkr
	mnkuwPUdax076+d/cKEQPo0UiAwZzhn1Xn4LrGty6bwyubX0a5pTEkrSp3VATUZjvcWXoB2w4hiw2
	8YTtTwgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kytGx-000628-7v; Mon, 11 Jan 2021 09:13:59 +0000
Received: from mail-eopbgr40080.outbound.protection.outlook.com ([40.107.4.80]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kytGq-0005zN-G6; Mon, 11 Jan 2021 09:13:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1qdw7WMr2rzgg8fXtebKDoqZM2wZ4U5G6BAcRV/KYAW4b4CGoUwbKQ/RA+O6PVfUq6qelpLH38ANnzmKYl2kxWUEIw9ckBnl8IXSBbqeWlfjt7XWih2PXqYueCZUiDPQcNXk9zwUhDVl4iVm8iG17DazFus0rLqvIGc+p8X8MqeTz+Vz1S8uDS8qSJTFfwTOV+j7aULe0gzKJ1zTTeTaeYhwt7uw6I7OAcnDm87DTOfxvJb/WflREPUeeludEGFoQlxA1CPFQNfEwrnKpWIdasxD3jwxVVRd7HNK1oJh8z5Tp6dx87ty3uyfXg8nZYZr+8jNLDW/r/kK2Uagc7sRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umvKFmCbrOfmpNYhvGNYmkiO6v9HBAesfLFnNE/URNw=;
 b=d4oyfTHJ5tRPN9meqnI0ITAC2KcLg8t3NPRpWfAOFixh66tuixEjZQcDRmWrURxL9Ro+I9yi81AMTFPtV38VEaJxE9wOh/hD35irYpMyPucrZSb71Myki0xqtxU0BrGnfNK3S2xpGOZer84FO2y6auwHFbh3eNDJ0GmZIGrDIrVomQL+eptfLNNQambPYsBaZWgtDGi7MNe1kGTkud0M8uZXHZ+fWQyOchxNhy+zpo6/qFikLfi1LBpKhY2LlS9vM4NCtg7au2uEPJ0LHpE4neVE16zZQhaljA1ZfMrHjIdZ76RdDLwE6pb6LF/UhnJ+LwuO4RMmd5YNld5O/y08IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umvKFmCbrOfmpNYhvGNYmkiO6v9HBAesfLFnNE/URNw=;
 b=RHoYvadwdJ7eraJvWZfhoIiAS5rlu70RF5ZAXOxkidIkfuBE50vZ7YWx+S2KZIEFs6UnapAy50MGekPzbZgZvoJLMh7BFq5VLaDAYkIW2TyLsA9ejYkcHXMsOvfwTjGO6gsIWgEsmGEVFrlm99IEoeegCIDiDEYSFFTY7o0RvbU=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2474.eurprd03.prod.outlook.com (2603:10a6:3:6a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Mon, 11 Jan 2021 09:13:47 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::6558:57bb:5293:f3d3%3]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 09:13:47 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "gene.chen.richtek@gmail.com" <gene.chen.richtek@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>
Subject: Re: [PATCH resend] dt-bindings: mfd: mediatek: Add bindings for
 MT6360 PMIC
Thread-Topic: [PATCH resend] dt-bindings: mfd: mediatek: Add bindings for
 MT6360 PMIC
Thread-Index: AQHW5/mnXQCtdpz8fUCDkYCyd6JXlqoiJC0A
Date: Mon, 11 Jan 2021 09:13:47 +0000
Message-ID: <04b06a6a4020212c4ae65bea9685afccc90c6dee.camel@fi.rohmeurope.com>
References: <1608779989-9641-1-git-send-email-gene.chen.richtek@gmail.com>
In-Reply-To: <1608779989-9641-1-git-send-email-gene.chen.richtek@gmail.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a82d813-c060-4b58-d1f8-08d8b61133fd
x-ms-traffictypediagnostic: HE1PR0301MB2474:
x-microsoft-antispam-prvs: <HE1PR0301MB24741507AF2E9F2FCF639D08ADAB0@HE1PR0301MB2474.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JSSe42dumPQYuR1vtfAnG8Y+o4wtbvztg6CCcGJGCoAhRO6T0yl6OeGi4BZmlb2DciIpMNAIBD3hVpqtqI4Et5LjnTFXWjBTCWmRnoKZ31zb81MvXblLEihH6ck29FegS7Xod/HMomwAnMV5TrGdVdfGdw6r2GAHOxnTGEBVkeQaPQ+qCcGNuxMHMGfSH1SHZk+F74Ka5ryiBeQlYmvmb2TQr0L2SUwfSMoLo9c3FGbyd2CxI4LsSEGeLhQJB++dC5B5X83KR8SIt4uLxJboSKRsb0b22vinfXTrilWRskKBLUnpABaZSZtZsqtHytHNyIOJNIrlaC4dQsVyPqV1XSJmfsSNWikOfzcrlw+bT3xlG3mNes5TokHTkVB/mfWX8MbCQKao+IQ2kzfGTeOQsaOAgsRpuBtmcf7yJvi1h9PGlSzxzcFYlR/TSme980vwBXEjxKuc3qfUtK3E0GT+xQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39840400004)(396003)(366004)(64756008)(4326008)(2616005)(8676002)(8936002)(478600001)(3450700001)(7416002)(5660300002)(76116006)(66946007)(110136005)(66476007)(316002)(54906003)(66556008)(66446008)(6506007)(26005)(966005)(186003)(2906002)(86362001)(4001150100001)(71200400001)(6486002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Skx6Nk1sc1RNb3FXTjdDZkpzTjdHZ2ZrSkxZS1pKczVGck9lLzRMc3lzN1Vp?=
 =?utf-8?B?bW9QM09ZS3M2b3VwUDNhTE82MUVsUExkdXNUZWFkeDZnY0MrWU1CWUc4RXp5?=
 =?utf-8?B?VTk3dldOTTgwNkp4Z2txNm1iQytZd0hObk9tZ0ExaFhTT0RGd3l5RVRiR2tO?=
 =?utf-8?B?K1hjUTZVemFhOUYvRWZwQmphZWtkVW5QU01pRStQYW9uUjZWZFd2SkxHUnEy?=
 =?utf-8?B?MVJrU09UNEJ0dkp1Z2Ztci9SUjRDVm53UWpzQUo2bVRxRVBJSEd4TGtuQ0c0?=
 =?utf-8?B?ZG81cUhaRGdNZU44NTNRQWpUcUpIUXFqNk9abFlSay95eDlnMy81ZUF0VDdH?=
 =?utf-8?B?RVlxRkNLeGdiVzlCWEtnb2dUKzNuckYwd055QjRGRis4MnRCS1EwREhESFQv?=
 =?utf-8?B?STFvZ1JIT3pVdHFwV1JyczZzRXFWMEJhaVpOZUZPVUtJZUhZWGJJUitJUVFV?=
 =?utf-8?B?R3VLUTBiQk9WdmJtQkZGcUFNMGxOOWFqakM3bGxoaHlGcXJOWEI5dU9WVFps?=
 =?utf-8?B?Uk5EeExWNENzOFJpQ1k0QlhVaDIzQ1BobzNuemRwakcxcVBMNWwzaTRuKzRI?=
 =?utf-8?B?cUpoSFRlRUM3eDdCRXhvbVVsTUFXRXJ5dlJTY095cklSTk1pMVJJazZNOHlU?=
 =?utf-8?B?amlxRDAxUlZHREVLaG9iOXBKWnlkM0FrVnJ5Y2FHSlJvU0dOZEtGTXl5NFBV?=
 =?utf-8?B?SEF2a2xzOFJYMGxuMnIxd3NpU290L3JUVW9PYmNBUlZOMGpySVNKMkRHajVj?=
 =?utf-8?B?NkhqZEg1clRxMmQ1NC9DVVRHMFJDNy9KOCtuaEpqSkRiU1crWXFlUDdBSDZl?=
 =?utf-8?B?YnBoQkI0T2FKOFRQZ2IxSG5YWGpYTmNYMTBOL0Q0QnArY2JSdTJxMDRqemww?=
 =?utf-8?B?QTI0L2lTNEppd2ZWYnQ5TU5KWGNtcW9ia0JUT0hXbGprWHpLU1BwY2RsdVls?=
 =?utf-8?B?aGRvUUV1SEtaaFVKK1k2K0V2cUN4NEtZb2tGQUJCVmJackxWQUNTRWhNZzVX?=
 =?utf-8?B?T3F4NlZSU0pGcENNTEJ4RFk5TFdJTUNwUTc0WHNGNVY3SGJ4TFdxbUlKR2RP?=
 =?utf-8?B?UmxGb0NZdTQxZVJnRk1zY3dtN2dFNnpXR3VUOTc4QlhrSkR2RlZYREFZeHZ1?=
 =?utf-8?B?Y0o1SkRTQ3ZQNlkzdmhBZENtRFlNQWp4dmtmWEZZSFRQNWExMVRpbWNLUys2?=
 =?utf-8?B?NzMvY05xRG9NZHdNMFJnYWdmVW1rYmMzWGIxR3VuM2VDc1BnVEdwRWZZNkFO?=
 =?utf-8?B?ZmtwbXRGdnR0NzJ1MWN1YkdEVEs3V0ZCVnpiRjBkeEVydEdJbkRONGV0TlVF?=
 =?utf-8?Q?2a8vF8KBoRIdbwFS72LxxQhF5wf7XyS4rm?=
x-ms-exchange-transport-forked: True
Content-ID: <01FB73626D9D234D89D6316244374781@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a82d813-c060-4b58-d1f8-08d8b61133fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 09:13:47.4877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bF/9NhRdE7RBLAGvwDHHVh+v/+OJ9WsMdEtpADKRRtZZ4MVohA80gzNVRrlrXxjnzir79xiq+wNMLAuQdtZETC2LIToIb7jTGB39oIvnAj9s69GawH821xzY2ZrwTNn6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2474
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_041352_732094_8C8210C2 
X-CRM114-Status: GOOD (  17.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc: "gene_chen@richtek.com" <gene_chen@richtek.com>,
 "Wilma.Wu@mediatek.com" <Wilma.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cy_huang@richtek.com" <cy_huang@richtek.com>,
 "benjamin.chao@mediatek.com" <benjamin.chao@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shufan_lee@richtek.com" <shufan_lee@richtek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Peeps,

On Thu, 2020-12-24 at 11:19 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings for MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6360.yaml | 69
> +++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6360.yaml
> b/Documentation/devicetree/bindings/mfd/mt6360.yaml
> new file mode 100644
> index 0000000..2781c31
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/mt6360.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/mt6360.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6360 PMIC from MediaTek Integrated
> +
> +maintainers:
> +  - Gene Chen <gene_chen@richtek.com>
> +
> +description: |
> +  MT6360 is a PMIC device with the following sub modules.
> +  It is interfaced to host controller using I2C interface.
> +
> +  This document describes the binding for PMIC device and its sub
> module.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6360
> +
> +  reg:
> +    description:
> +      I2C device address.
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-names:
> +      enum:
> +        - IRQB
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 1
> +    description:
> +      The first cell is the IRQ number.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mt6360@34 {
> +            compatible = "mediatek,mt6360";
> +            reg = <0x34>;
> +            wakeup-source;
> +            interrupts-extended = <&gpio26 0 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-names = "IRQB";
> +            interrupt-controller;
> +            #interrupt-cells = <1>;

Out of the curiosity - is this the complete node? I would assume some
sub-devices like regulators here?

> +        };
> +    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
