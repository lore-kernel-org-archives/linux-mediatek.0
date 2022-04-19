Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2dbQdoNWP+tNar9cZmw9VqqaTlh9jieWYi9GgIxMRw=; b=eICp7ZA7jOtEm/
	1KsdC6A0xofqaRgyVezrufnlHHXfE3bD/QIasShdF6Sbq5v1+br6JLBMvP2Yl4wVtTa1r+kLrVk2U
	mHegciqF+uhYgBieJQ+XERuzn2i+GehwU0TfooSN2Dk/NJH2ERzecUB3HcQ//vHH5oQcqS1IiYf85
	NON37SiwsamT0HiHN8XLzl8DQoKFN3UN2R1SDgoCi6hYmw3u9WjAFLYpFwAFnU8rk7FMhNV2pswzV
	0xzAB5bYTdoSaOwVDscpDwgv7gd3vD3q9na0zwf8oQLFb/PMqkMwLKDgo1ORVA0cNV2sY8MT6n8dK
	W8j9njzDEvT8xHKuf9aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsD1-005V03-5l; Tue, 19 Apr 2022 18:04:15 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsCp-005Uum-AL; Tue, 19 Apr 2022 18:04:04 +0000
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-e5e8523fcbso6811008fac.10; 
 Tue, 19 Apr 2022 11:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NOXUqKUrGDpPDUtG5OL18QzDLbgUxzLKVA6XuNw2RqI=;
 b=uhk99p5pR/XjMqkGTXTX5sUQ7eHXIJzcpAJwt51pxw4RDmLMB7bTi1lvy92AJs+wgV
 3k2MC7g1p3cvN1G61lPp7Z0NC9qHzNUCBoJN4Gzsmax5fCP+61jvI6vMt4B9lDkuzmEI
 8UHQdeMo0k807aGEInNH+qxjcGYhtBOLnAzR+qEQqH/LJXVO31gfnvX1F1lLgyvDqnni
 QC0REBCyBhmmmuojhAHF+gywQc3CpT6C/vhitKdlbXqCDstu9k39wZ8W9SQ01dRiDpTX
 QnN1+7LPt3sPHI+PAhm3BzxE0FAh0P54ixRwDTIfxBw9mF2H6rIqWVLF2L8pXiRx0u1b
 bcGg==
X-Gm-Message-State: AOAM533/WrE/1283jZ8Q6Zb+52GGLJ/Wvx6JG6pOne7p1sqebnMsP6SQ
 z4q/alUyB+oCfxlm4ExSHg==
X-Google-Smtp-Source: ABdhPJzLmxpu1Q/hE9musjIy34xDdXvVmAtbeQJiNSpfNMl8WSm6Djc8nnG+Q8CdI3cBT7tnqRBq/Q==
X-Received: by 2002:a05:6870:315:b0:e6:15d1:11a8 with SMTP id
 m21-20020a056870031500b000e615d111a8mr2715103oaf.289.1650391441300; 
 Tue, 19 Apr 2022 11:04:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o185-20020acabec2000000b002ecf1218c53sm5366818oif.15.2022.04.19.11.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:04:00 -0700 (PDT)
Received: (nullmailer pid 3066699 invoked by uid 1000);
 Tue, 19 Apr 2022 18:04:00 -0000
Date: Tue, 19 Apr 2022 13:03:59 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: linux-arm-kernel@lists.infradead.org, Joe Perches <joe@perches.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, erkin.bozoglu@xeront.com,
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 12/14] dt-bindings: pinctrl: add binding for Ralink
 MT7621 pinctrl
Message-ID: <Yl75jw4OiTOK39Zo@robh.at.kernel.org>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
 <20220414173916.5552-13-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414173916.5552-13-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_110403_399953_08FE7206 
X-CRM114-Status: GOOD (  10.07  )
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

T24gVGh1LCAxNCBBcHIgMjAyMiAyMDozOToxNCArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToK
PiBBZGQgYmluZGluZyBmb3IgdGhlIFJhbGluayBNVDc2MjEgcGluIGNvbnRyb2xsZXIgZm9yIE1U
NzYyMSBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBh
cmluYzkuY29tPgo+IC0tLQo+ICAuLi4vcGluY3RybC9yYWxpbmssbXQ3NjIxLXBpbmN0cmwueWFt
bCAgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA3MSBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmssbXQ3NjIxLXBpbmN0cmwueWFtbAo+IAoKUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
