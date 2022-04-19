Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F95C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogMiAPk3bwOluaX0R2arBYHLhryg9i1qoodpZPizfHA=; b=HCHVQsoflCHEU3
	LDY+DqzQDlUFXmRwps9/LkU3QWrEqSbwU4QgdWVYIlkWBCjCEKu1h6Hov1RVFX4tyZrOMHuJzJy5m
	VKZ4opZG0F61eFJ66/OPnKV1SEPe7xjUgJ9eeuzCPB0iZcYMAYCBpcwaUdGRcNAbacowzmXFExShX
	kB4jyRnbMPzwTF00yLAsoiulMW0V+ARPuAcQ5Ym9+bHBbbYxalI9e91viw0YKOsrDe47WILxzmuWH
	S8hbtFUqSesmnGDzj6Iu3PA97eF/ghcpVAR6z54dPppJ7XcAYrYdcFgiJYIZafXw+vDOlMfvxTQBv
	/iaNfSDXy6t6Q+5sW2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsFR-005Vof-V3; Tue, 19 Apr 2022 18:06:45 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsFP-005Vmn-S8; Tue, 19 Apr 2022 18:06:45 +0000
Received: by mail-oi1-f173.google.com with SMTP id a10so1529600oif.9;
 Tue, 19 Apr 2022 11:06:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NogA4FJZbtSCeI8+16U8rTBVRGQdHqkH+cpZLhz0hdw=;
 b=bCixoxrshl7qJwH5LYtiU0J5CgW7yZ4XyPAa1hr3ozoPC9ctfK0pbT7SiOWYuUjOMb
 /y6PAIrMVOVzr9eCE2LZ60c5/usRywluOpBw9XPPuTdCGtI63AjpZpvG/3FNaY95bIpM
 v1vZl10BIbbw8kxgu2mXzqNR2X0/jvvugOFThC9/3Wj6/GWXTzXcdDpKGWZML7t48BSj
 teH1aU1viUjLoLf+Qi+h6fIXqZQq8846wbk6cXuMrZ05UoN4d9w9mh8F7EpFHtVja6rx
 74QlkI8Yx+vm8uqngvOpIP6uCUQ8HcRonmClGfBxgkGuJtoFA5D8QCJLlzDD0BPJmqNs
 +6aw==
X-Gm-Message-State: AOAM531tjWaxabDiB6EQcsrWTuAzUv7Ui6T3UJ20D1OVYXTI4Dx0tglS
 md7/x6HgWzsmuSnrMgUFvg==
X-Google-Smtp-Source: ABdhPJznkadX4VcGahV0tlYTHvdwn0UVoyP9HpXdmVeY58eg7G177LR5W+fg7x9LlsEeDaf/B9ZX9A==
X-Received: by 2002:a05:6808:150c:b0:322:88d3:74aa with SMTP id
 u12-20020a056808150c00b0032288d374aamr5211548oiw.245.1650391600207; 
 Tue, 19 Apr 2022 11:06:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k14-20020a0568080e8e00b003224d35c729sm4531755oil.3.2022.04.19.11.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:06:39 -0700 (PDT)
Received: (nullmailer pid 3071252 invoked by uid 1000);
 Tue, 19 Apr 2022 18:06:38 -0000
Date: Tue, 19 Apr 2022 13:06:38 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Joe Perches <joe@perches.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 erkin.bozoglu@xeront.com, Rob Herring <robh+dt@kernel.org>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH v2 14/14] dt-bindings: pinctrl: add binding for Ralink
 RT3883 pinctrl
Message-ID: <Yl76LnVX8sNd1Bxj@robh.at.kernel.org>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
 <20220414173916.5552-15-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414173916.5552-15-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_110643_947134_19404AB7 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxNCBBcHIgMjAyMiAyMDozOToxNiArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToK
PiBBZGQgYmluZGluZyBmb3IgdGhlIFJhbGluayBSVDM4ODMgcGluIGNvbnRyb2xsZXIgZm9yIFJU
Mzg4MyBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBh
cmluYzkuY29tPgo+IC0tLQo+ICAuLi4vcGluY3RybC9yYWxpbmsscnQzODgzLXBpbmN0cmwueWFt
bCAgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmsscnQzODgzLXBpbmN0cmwueWFtbAo+IAoKUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
