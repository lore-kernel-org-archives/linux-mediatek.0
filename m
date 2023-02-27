Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34775C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhnGImxv7cGC3B2casLCXu7ICg34WHUc91lJ659LFQM=; b=HbeMGwdcYHwzvogMNMycqF2PRn
	wb386gXWzVJYohw9Nt2ifQtXlePINFQZp1qCRlGIwnMgTRhix2kQli5R9jm0vnqZRPYPB6kl/pKN1
	riG1XIAO61etDkT+0W9+G2INiaIe0jyXQSE+KZojf1HuH2qMNfgExVcSh7f6L6qiXBGb4DTu+Z3Ms
	x2o/20EcBrFfiyEQd9UjDUOx7TH+SV7J7RQHZOF4AuuQ3eEaEt7s3kO/E+6H5RYO+reybdytL+7KD
	i4/SMD8ckOTvEpZeOem2UkSIJCFfigZi6ll4y4hcbzkg3FNmxxL4oxzXrPMrGRkuTPNNEmRCeVCH/
	TeL5KAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiAp-00Ahzt-Le; Mon, 27 Feb 2023 18:24:31 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiAY-00Ahsf-96; Mon, 27 Feb 2023 18:24:15 +0000
Received: by mail-ot1-f44.google.com with SMTP id o4-20020a9d6d04000000b00694127788f4so191203otp.6;
        Mon, 27 Feb 2023 10:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhnGImxv7cGC3B2casLCXu7ICg34WHUc91lJ659LFQM=;
        b=sw4StXVmRXeX8Nr9VNlu0h+TfDMY0VYjo4z8Zi/I8W/k3LYscny3w+ogpnTH7MUzIF
         oGi2ORXjA+0uvNMy9hNFvaRI3zrlA2c4DtUADMpbVheaBOpf9ampw1izVgoOrJeg80If
         FLKmmaMCAjhqRmEmiP2ANE4bwkhoWIAyYITHJFLh0jfNHPqn5VQ3o9n3u2PU74Vc9APJ
         7ujZboxEAW70Eu7oJGg+zFwi/1MVX8NW+IPS3W9E3uREmRdpgXK4qrw4QpL/wa+6VcWz
         AngxQ6gUB2MgR5FEz30t0KDS8Ns7eTBKqbAXo5PFXtJ5vO8H8effBitND7c2jozOkHUO
         tX1g==
X-Gm-Message-State: AO0yUKXXOv4EL6WUyczSLieHMzALrISbtFSC9XkmL8+DL6aEZrBWlYOI
	cpt6ewVilh8pPchIN28Oug==
X-Google-Smtp-Source: AK7set/GbJ8fGfciQoa6HmnxTEXgUSxJ3CGER8Umk+DoFZ/iiDwdsjaBin8Np3hXBmvf2jLJ6sh7qA==
X-Received: by 2002:a05:6830:4412:b0:68d:3fc8:7c07 with SMTP id q18-20020a056830441200b0068d3fc87c07mr5220636otv.2.1677522252115;
        Mon, 27 Feb 2023 10:24:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w11-20020a9d70cb000000b0068bb3a9e2b9sm2809887otj.77.2023.02.27.10.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:24:11 -0800 (PST)
Received: (nullmailer pid 602994 invoked by uid 1000);
	Mon, 27 Feb 2023 18:24:10 -0000
Date: Mon, 27 Feb 2023 12:24:10 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH 14/16] dt-bindings: pinctrl: mediatek: mt8192: rename
 to mediatek,mt8192-pinctrl
Message-ID: <167752224966.602691.10587841319375401284.robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-15-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222183932.33267-15-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_102414_342946_A2FFD669 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, 22 Feb 2023 21:39:30 +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Rename pinctrl-mt8192.yaml to mediatek,mt8192-pinctrl.yaml to be on par
> with the compatible string and other mediatek dt-binding schemas.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../{pinctrl-mt8192.yaml => mediatek,mt8192-pinctrl.yaml}       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/devicetree/bindings/pinctrl/{pinctrl-mt8192.yaml => mediatek,mt8192-pinctrl.yaml} (98%)
> 

Acked-by: Rob Herring <robh@kernel.org>


