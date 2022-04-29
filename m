Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A38C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 20:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bREh1I9qC6peziHuu5f95BPiTTirtwIeAgxCbOo+erI=; b=TdSrls2zlM5VOe
	4OzIcHItUcnOe0bC/hGOdI/OR+4mK466J6xhurOP6VVmM8ltFneSXn8TZfyslpWcdeqMXsqHGJVXT
	wxsmc6yNc10mdX1MOIWZHd5/vAi2xAnRX03BxL2mKDXIV/piuLlV33aYmacCjERxCFG9XfvJUzibj
	40PVQ3kYgGbxTFJz9NZCPNW+gsUUe0UTz6VHnQfGR0NjbhWGWjwp/79sWPuD8XXJVUQsgb4vJlN4b
	+fP0Pl94IvIc61rR/qrhZOzt4FYg7mFeyziaOCpBsHjwGnkRVTeUb4SKCjz2dS29vMlBzYJmTY5VS
	iNbf4FQr05tceKwBCodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXHS-00CVkK-06; Fri, 29 Apr 2022 20:31:58 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXHP-00CVim-0X
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 20:31:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id y3so17446115ejo.12
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Apr 2022 13:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cOTYvKnpssw+HjajD028HmP+wTShZ9IeCONkU/DnTDM=;
 b=IS1Bwm1KfpiUP9DD8wNp7WoHCXusyqm+r96FFYBPQnjwMo4DHP7CiRZTs7jb3p5XCW
 spWHOr7uLBLxmBGed7edoEFKUzDZw4lfa+zF/UssDIXgb5glOSFPpl0eRZgdk2tpJTjw
 2dnQFVEV5XluFKgdMiXjg/WVa6dhmTbKzRETUVxk3qsNELPl4TPDZHepIIdG5lBbYYAq
 OmUAb2CPekhK3R8YB9uIBwwCN8KjMK4pXvataQGiWRx8r3y6C58oJUvIBE9rgzMBG1/t
 SfXe0quGxmGX8L9S4V6NIcVtP6hhLWksn8EjxYNmEkgQaYonwOn9HZ8uU+fi/RWarzkB
 DZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cOTYvKnpssw+HjajD028HmP+wTShZ9IeCONkU/DnTDM=;
 b=TUiXhgdaK6Zu2sYySUAx6yE/84pMv7QNz2be3AIPI7BAaw5XnTrzbwk3TauRIadp7O
 EdWIqkRoJgui5G5d2uLkAnyTCPH2JCODs8pPNA7WqLgy63mR2k0bpfLOGo9sa1zlkjui
 V7pXOxlXKfoRCXlIXOSgQdVjjCiNANqnka9Tjw7zYmFHXPimCbvAMnT+Bug+mDclF3IG
 Ey+yetFgdwSfPRaKsUQCF0Mp7PSaJ9KfQcfwy2cbzcefV5WpfrUfNJfkNQv7Bi/QPYhg
 rjzbgfiZFHSJ7u4kVhVg8aKwKy8UYUkFRIFZr8heLxcGj/mOHnzv/YMDdLx0K6kKVouv
 L2Vg==
X-Gm-Message-State: AOAM530c008Y8EKz1DiAekWzeMp0crYhk3NIbXZWdajSu/rVqkDOpKUQ
 7ZvYDVBE0gXJKpkFGxVZ8WX2yw==
X-Google-Smtp-Source: ABdhPJwiJe/sfIfNDfS8+1kj10ZZagdOYEQqXZdXUtpduVnOH4GD+F84f5RxC6lUMiPC7SCi359tyw==
X-Received: by 2002:a17:907:7f26:b0:6f4:69c:196f with SMTP id
 qf38-20020a1709077f2600b006f4069c196fmr956890ejc.613.1651264313578; 
 Fri, 29 Apr 2022 13:31:53 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 i8-20020aa7c708000000b0042617ba63absm3299258edq.53.2022.04.29.13.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 13:31:53 -0700 (PDT)
Message-ID: <4adf790c-5773-a78e-3c8e-2a510e3dbd1e@linaro.org>
Date: Fri, 29 Apr 2022 22:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8192: Add mediatek, pull-down-adv
 property
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220429200637.2204937-1-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220429200637.2204937-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_133155_098418_AFF3BAEA 
X-CRM114-Status: GOOD (  15.96  )
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

T24gMjkvMDQvMjAyMiAyMjowNiwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gd3JvdGU6Cj4gQWRk
IHRoZSBtZWRpYXRlayxwdWxsLWRvd24tYWR2IHByb3BlcnR5IHRvIHRoZSBwaW5jdHJsLW10ODE5
MiBkdC1iaW5kaW5nCj4gdG8gYWxsb3cgY29uZmlndXJpbmcgcHVsbC1kb3duIHJlc2lzdG9ycyBv
biB0aGUgcGlucyBvZiBNVDgxOTIuIEl0IGlzCj4gdGhlIHNhbWUgYXMgaW4gbXQ4MTgzLXBpbmN0
cmwuCj4gCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFk
b0Bjb2xsYWJvcmEuY29tPgo+IAo+IC0tLQo+IAo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9w
aW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwgICB8IDExICsrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5jdHJsLW10ODE5Mi55YW1sCj4g
aW5kZXggYzkwYTEzMmZiYzc5Li5lNDYyZjQ5ZWFlNmYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcGluY3RybC1tdDgxOTIueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3BpbmN0cmwtbXQ4
MTkyLnlhbWwKPiBAQCAtMTE3LDYgKzExNywxNyBAQCBwYXR0ZXJuUHJvcGVydGllczoKPiAgICAg
ICAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4g
ICAgICAgICAgICAgIGVudW06IFswLCAxLCAyLCAzXQo+ICAKPiArICAgICAgICAgIG1lZGlhdGVr
LHB1bGwtZG93bi1hZHY6Cj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gKyAgICAgICAg
ICAgICAgUHVsbCBkb3duIHNldHRpbmdzIGZvciAyIHB1bGwgcmVzaXN0b3JzLCBSMCBhbmQgUjEu
IFVzZXIgY2FuCj4gKyAgICAgICAgICAgICAgY29uZmlndXJlIHRob3NlIHNwZWNpYWwgcGlucy4g
VmFsaWQgYXJndW1lbnRzIGFyZSBkZXNjcmliZWQgYXMgYmVsb3c6CgpUcmFpbGluZyAnOicgc2hv
dWxkIGJlIGVzY2FwZWQsIHNvICc6OicKCgo+ICsgICAgICAgICAgICAgIDA6IChSMSwgUjApID0g
KDAsIDApIHdoaWNoIG1lYW5zIFIxIGRpc2FibGVkIGFuZCBSMCBkaXNhYmxlZC4KPiArICAgICAg
ICAgICAgICAxOiAoUjEsIFIwKSA9ICgwLCAxKSB3aGljaCBtZWFucyBSMSBkaXNhYmxlZCBhbmQg
UjAgZW5hYmxlZC4KPiArICAgICAgICAgICAgICAyOiAoUjEsIFIwKSA9ICgxLCAwKSB3aGljaCBt
ZWFucyBSMSBlbmFibGVkIGFuZCBSMCBkaXNhYmxlZC4KPiArICAgICAgICAgICAgICAzOiAoUjEs
IFIwKSA9ICgxLCAxKSB3aGljaCBtZWFucyBSMSBlbmFibGVkIGFuZCBSMCBlbmFibGVkLgo+ICsg
ICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIK
PiArICAgICAgICAgICAgZW51bTogWzAsIDEsIDIsIDNdCgpJdCdzIG9rYXksIGJ1dCBmb3IgYWxs
IHRoZXNlIGFuZCBvdGhlciB2YWx1ZXMgKHlvdSBoYXZlIGZldyBzdWNoIGluIHRoZQpiaW5kaW5n
KSwgeW91IHNob3VsZCBtYXliZSBhZGQgaGVhZGVyIGFuZCBkZWZpbmVzLiBJdCdzIG11Y2ggbW9y
ZQpyZWFkYWJsZSBmb3IgaHVtYW5zLi4uCgpJcyB0aGUgcHJvcGVydHkgdmFsaWQgd2l0aG91dCBi
aWFzLXB1bGwtZG93bj8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
