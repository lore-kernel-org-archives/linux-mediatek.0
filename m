Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C74C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUiaTakWzSARNYGmEZ0qdt962MhzmL7lsl0CxWWLQws=; b=SrRjzy8CRbeuIY
	JKlh+G5fZQJuxRkJvKBjJHlZbnHVJrwyKY12H28aFOfIcmlmNNpEdmajgjq597EZ4rVC3/IDtaqdK
	/lx4d9AqvIm3D8vD9XJ9i7pgAqb0xc3wNjztqHs5JmtEe68ZWEfCL58rhNeFzQFPxCjECC3JrCZdY
	hj89vAiFjCeCMnCyXcsNNHZhdFjNp6OHG4hHtdcClJnG0cvbpI67WohquuuUVO/GCS6j4XaYYyRmg
	otzPfSJa2Mg8pWglpRkz1rGIuszBXBPC5Wa2/nUQkqV10VgXli+MEOTjYRvKYiqqB6s+A3dJCHwBD
	t5lETsr4EG4K2AQG4MTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsCj-005Utm-Em; Tue, 19 Apr 2022 18:03:57 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsCW-005Uog-Cb; Tue, 19 Apr 2022 18:03:46 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 i3-20020a056830010300b00605468119c3so5975013otp.11; 
 Tue, 19 Apr 2022 11:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+fNw0PdoYt1qVDrXfAqD4nqRFo5VR7IdVY54D5NHpZo=;
 b=Ee2s3yCywMi12NiIrP9NPAoJ36aqNgkHBij3GPqN9mAWcqjAUaT9WIEgc/CYQ6sNl/
 yT5wSX2IjQLAnx8GZmxZFuuE74ek2Lme60jqGJy9Tiug6nFaATJQXVnrPx+x0ljGOp73
 FJL5K8DcDuBz97ovx7gx1kYgBBfZwj8O+w4Y6iJVjI9Ov9ceYj6d66TQDPw7D7ySSkUC
 HXY/Za5QWXls3oPUCIZGYO8jtGGR0KdLw9SEXt37hxB7RRN58FN4CWVVw7LsrSDqp57a
 j9ZplOBTjEOLLw3emoTwozk4+O8zJyx4kwfTbEfTOTLJ3Hwfo07nnosCXB9cH/XTTsHh
 0NjA==
X-Gm-Message-State: AOAM5313JmjSYyiSgR9D7MBaiIqymlEnIElorGccU1KR1L70uNJ2moUn
 paA3cubiRQdBiLitKfYB2w==
X-Google-Smtp-Source: ABdhPJwr48CoteiF8SovNQNRmbbE5UQFE9gdzDGqJdoxS7RFOi8geAlZwzQ6frsbqBiaM84T7OxxqA==
X-Received: by 2002:a9d:5604:0:b0:5ac:ef3d:38f5 with SMTP id
 e4-20020a9d5604000000b005acef3d38f5mr6304412oti.271.1650391416048; 
 Tue, 19 Apr 2022 11:03:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u19-20020a056830249300b00605544f973bsm1125510ots.45.2022.04.19.11.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:03:35 -0700 (PDT)
Received: (nullmailer pid 3065892 invoked by uid 1000);
 Tue, 19 Apr 2022 18:03:34 -0000
Date: Tue, 19 Apr 2022 13:03:34 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com,
 linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: Re: [PATCH v2 11/14] dt-bindings: pinctrl: add binding for Ralink
 MT7620 pinctrl
Message-ID: <Yl75dvpponIvTeVW@robh.at.kernel.org>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
 <20220414173916.5552-12-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414173916.5552-12-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_110344_455516_1A0AEB37 
X-CRM114-Status: GOOD (  10.69  )
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

T24gVGh1LCAxNCBBcHIgMjAyMiAyMDozOToxMyArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToK
PiBBZGQgYmluZGluZyBmb3IgdGhlIFJhbGluayBNVDc2MjAgcGluIGNvbnRyb2xsZXIgZm9yIE1U
NzYyMCwgTVQ3NjI4IGFuZAo+IE1UNzY4OCBTb0NzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFyxLFu
w6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KPiAtLS0KPiAgLi4uL3BpbmN0cmwvcmFs
aW5rLG10NzYyMC1waW5jdHJsLnlhbWwgICAgICAgIHwgOTEgKysrKysrKysrKysrKysrKysrKwo+
ICAxIGZpbGUgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLG10NzYyMC1w
aW5jdHJsLnlhbWwKPiAKClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3Jn
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
