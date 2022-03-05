Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA9AC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 16:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBkhQGotOI31LNPq0MhZYmJYlWr54HNI4rVQLmWPB1k=; b=bwJp3QxQWwsC8Y
	u0ZRhhNUGH/LaktHtL2yM/nD1gvt4UBbQPi+jhYk8vxX2tJxDZaIA+tLqovMV2jNJFN8Vduo7vkAC
	9uAjZOUnSWMlieRqjRa+57N2XLQp86iuLTE/NILgVl0q2Ph72XTXXwxEAEj6YKKeDsZf8Il5VoUAV
	WBG4YkbrJ/IcX32O0mpmwns5lzoN90CgWMJ7DZnZ+q76Yn1KjWlOWRX+P358pELrtuGhv6eIm4cLP
	ww/uP+XjBbbYZ/bt8Pw8PN2j/d2D9dHedemQps6KYvjxa2xZVDoYO2jgo5o3VVsJyHBBaeyEmNhPJ
	UXTD5DVAShDlu9j96fag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQXPj-00DXoi-Cz; Sat, 05 Mar 2022 16:37:51 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQXPX-00DXnA-2I; Sat, 05 Mar 2022 16:37:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646498231;
 bh=VnCsf8rX/V0AJTu2dP6Rom6VbKU/2JnZ+S8MUYoWHYY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=kXegOSmtqLwv2kq3PfC1by245As2CGgaudUj8VoEWHUtaY8+VuqVuWQ/4eMyC9nYm
 KW0ofntFpdoXbgPM1geyxCrD8PWzmq4nJy/WtD6OrlTLdemI+woKzYlt/jeO+aLdeB
 2FG0NE/raJYsCtRZIWFuF7G9E40kzlQdpzSvNaTI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.157.101] ([217.61.157.101]) by web-mail.gmx.net
 (3c-app-gmx-bap20.server.lan [172.19.172.90]) (via HTTP); Sat, 5 Mar 2022
 17:37:11 +0100
MIME-Version: 1.0
Message-ID: <trinity-d2367cae-d6e1-4bc6-85e6-bd92b8f8d412-1646498231035@3c-app-gmx-bap20>
From: Frank Wunderlich <frank-w@public-files.de>
To: Kurt Fitzner <kurt@va1der.ca>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Aw: Re: [PATCH] arm: dts: mt7623: increase passive cooling trip
Date: Sat, 5 Mar 2022 17:37:11 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <9dd737bd-d626-7a49-a48b-ff6771b262a7@va1der.ca>
References: <20210725163451.217610-1-linux@fw-web.de>
 <9dd737bd-d626-7a49-a48b-ff6771b262a7@va1der.ca>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:iJqliyziR1trhv9maJpnmbegtW9MBF5+KKbJ64SdkGr4BY6LjOecnJX1vvQ0KnwlBDKcX
 0CFMemlyd7RpSeHOr6TKT4qvZ0mKjQ71O3H4ny1lR3wojXFm1IPZz1igauxmTvg9UkAetxL+L/Os
 pzIoAsV9/pSX/PfIN6UTPOJ6P4/frbwSQVjVgZYFMIZ3bxhmhfvr0+MEUkTJ9CAOar7oIo+yCO6m
 Yb2g2Kx1IeC8IxztQKpo8t5zNX/uteIOmPKNQA4PmpSU//6AkHjQ2RmwBWp9NcImnA07Z/fW2OOF
 kY=
X-UI-Out-Filterresults: notjunk:1;V03:K0:aMHFxa7uxvU=:6OVjtHUnbnUH/nVlAZcgQN
 DRxCV2Mlo/9+Bv1dFMoQ7aIm8l5BXg1OXBF+0tPHUnbzCKZTRf4zNBKLW63t2X6CugmnvthQH
 wKJLXEbDMModcfPfzR9RdCaMZgnO5vVvq4M42r+8JzcW3C0d5bg8MwPmfx/EoAfdBLrQ/Tdhw
 kKVCvJt6EsZNoocG86o2NAs9JEkUnG1Y66j6cRhDROQeHIfRpxMwsMCfTpBM0okRq/jWyeVCd
 490cas9JJfqiM4Ti9xbNR1lrW4p8i+qXxgUIrHD7BtJWcIWroipcSI89Tdg2rglikNHjYFHsc
 Um6DMnNw/nvQ1FzdJ4bPDcU68ekx81NIzfIOnuNVOi6NoHZoCc7tNbXdlWm/B7NgKZpw8eLqz
 wh47jiLao2BmgMj6APl3fundTmR6HE7bzn38JPZ2Bx/nv4vIG2+oZbj3STszKfHSIwyXkp5N7
 msZbm0BUe1poNY35D09v0VQdY3U60UfcigmlbJk9nM5zR+TcB3ivKD+C7oEJT57HUJQwoASr/
 nNN+TWoRK8hP2fctUY9uf/HSkdiun16DNTcu3Yh8N34RHX7/A5GUCXgJRzRaOPKrNGrODfYpv
 F4KMJs1PR38/FuNv2djMgXL7e7O8VaU+dKJ6tztIH3z96KpHldWn0kO5FBhsC64QvhGJLHClc
 EYy6taxGFa/5wo2j/E8rlbIRVYeZlbIPMaX1wN61duFlm/2CPMc+GlE8gqioUnhPVzRVoOatH
 vLkb1tJfCG8JBOBjscnX0CMqekvVprZBaRZUf9XbhwwcRswAbnXtRfysXzFvDf6pLTHJlO9bg
 fdgvTge
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_083739_433187_0248E4C1 
X-CRM114-Status: GOOD (  17.98  )
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

SGkgS3VydCwKCj4gR2VzZW5kZXQ6IFNhbXN0YWcsIDA1LiBNw6RyeiAyMDIyIHVtIDE2OjU0IFVo
cgo+IFZvbjogIkt1cnQgRml0em5lciIgPGt1cnRAdmExZGVyLmNhPgoKPiBUaGlzIGlzc3VlIGFu
ZCBwYXRjaCBqdXN0IGNhbWUgdG8gbXkgYXR0ZW50aW9uLCBteSBhcG9sb2dpZXMgZm9yIGxhdGUg
Cj4gY29tbWVudHMuCj4gCj4gVGhlIHNvbHV0aW9uIHByb3ZpZGVkIGluIHRoaXMgcGF0Y2ggaXMs
IEkgYmVsaWV2ZSwgbm90IG9wdGltYWwuCgpkb2VzIHlvdXIgUGF0Y2ggZml4ZXMgdGhlIGlzc3Vl
PyBpZiB5ZXMgeW91IGNhbiBzZW5kIGEgUGF0Y2ggYmFzZWQgb24gY3VycmVudCBtYWlubGluZSBk
dHMuCgppdCBsb29rcyBhIGJpdCB3ZWlyZWQgdG8gbWUgaGF2aW5nIGFjdGl2ZSBiZWZvcmUgcGFz
c2l2ZS4uLmJ1dCBpJ20gbm8gZXhwZXJ0IGluIHRoZSBjb29saW5nIHRyaXBzLiAKaSBqdXN0IGlu
Y3JlYXNlZCB0aGUgdGVtcHMgOikKCnBsZWFzZSBzZWUgbm90ZXMgYmVsb3cKCj4gT24gMjAyMS0w
Ny0yNSAxOjM0IHAubS4sIEZyYW5rIFd1bmRlcmxpY2ggd3JvdGU6Cj4gPiBGcm9tOiBGcmFuayBX
dW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1maWxlcy5kZT4KPiA+IAo+ID4gTVQ3NjIzL0JQSS1S
MiBoYXMgaWRsZSB0ZW1wZXJhdHVyZSBhZnRlciBib290dXAgZnJvbSA0OCBkZWdyZWVzIGNlbHNp
dXMKPiA+IGluY3JlYXNlIHRoZSBwYXNzaXZlIHRyaXAgdGVtcCB0aHJlc2hvbGQgdG8gbm90IHRy
b3R0bGUgQ1BVIGZyZXF1ZW5jeSBhdAo+ID4gdGhpcyB0ZW1wZXJhdHVyZQo+IAo+IFRoZSBkdHMg
ZmlsZSBmb3IgdGhlIG10NzYyMyBoYXMgZm91ciB0cmlwIHBvaW50czoKPiAtIFRyaXAgcG9pbnQg
MCwgVHlwZT1QYXNzaXZlIEAgNDfCsEMgKG9yaWdpbmFsbHksIG5vdyA1N8KwQykKPiAtIFRyaXAg
cG9pbnQgMSwgVHlwZT1BY3RpdmUgQCA2N8KwQwo+IC0gVHJpcCBwb2ludCAyLCBUeXBlPUhvdCBA
IDg3wrBDCj4gLSBUcmlwIHBvaW50IDMsIFR5cGU9Q3JpdGljYWwgQCAxMDfCsEMKPiAKPiBJdCBt
YWtlcyBsaXR0bGUgc2Vuc2UgdG8gaGF2ZSBwYXNzaXZlIENQVSB0aHJvdHRsaW5nIGVtcGxveWVk
ICpiZWZvcmUqIAo+IGVuZ2FnaW5nIGEgZmFuLiAgR2VuZXJhbGx5IHVzZXJzIHdhbnQgYSBmYW4g
KGlmIHByZXNlbnQpIHRvIGJlIGVuZ2FnZWQgCj4gYmVmb3JlIGludGVudGlvbmFsIHBlcmZvcm1h
bmNlIGRlZ3JhZGF0aW9uIGlzIGVtcGxveWVkLgo+IAo+ID4gICAJCQkJCWNwdV9wYXNzaXZlOiBj
cHUtcGFzc2l2ZSB7Cj4gPiAtCQkJCQkJdGVtcGVyYXR1cmUgPSA8NDcwMDA+Owo+ID4gKwkJCQkJ
CXRlbXBlcmF0dXJlID0gPDU3MDAwPjsKPiAKPiBUaGUgb2xkIHRlbXBlcmF0dXJlIG9mIDQ3wrBD
IGFwcGVhcnMsIGluIHByYWN0aWNlLCB0byBiZSBhIGdvb2QgCj4gdGVtcGVyYXR1cmUgZm9yIGFu
IGFjdGl2ZSBjb29saW5nIHRyaXAgcG9pbnQuICBJdCBpcyBqdXN0IGFib3ZlIHRoZSAKPiB0ZW1w
ZXJhdHVyZSB0aGF0IGEgZ2VuZXJhbGx5IGlkbGUgbXQ3NjIzIHNpdHMgYXQgaW4gZW5jbG9zdXJl
cyB3aGVyZSAKPiB0aGlzIFNvQyBpcyBlbXBsb3llZCwgYnV0IGFsc28gYSB0ZW1wZXJhdHVyZSB0
aGF0IGEgQ1BVIHVuZGVyIGxvYWQgd2lsbCAKPiBxdWlja2x5IHJlYWNoLgo+IAo+IFRoZXJlZm9y
ZSBJIHByb3Bvc2UgdGhlIHR5cGVzIG9mIHRyaXAgcG9pbnRzIDAgYW5kIDEgYmUgcmV2ZXJzZWQg
YW5kIHRoZSAKPiB0ZW1wZXJhdHVyZXMgbGVmdCBhcyB0aGV5IHdlcmUuCj4gCj4gCj4gLS0tIGEv
YXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kJMjAyMi0wMi0yNyAxODozNjozMyAtMDQwMAo+
ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyMy5kdHNpCTIwMjItMDMtMDUgMTE6Mzc6NTIg
LTA0MDAKPiBAQCAtMTU4LDE5ICsxNTgsMTkgQEAKPiAKPiAgIAkJCQl0aGVybWFsLXNlbnNvcnMg
PSA8JnRoZXJtYWwgMD47Cj4gCj4gICAJCQkJdHJpcHMgewo+ICAgCQkJCQljcHVfcGFzc2l2ZTog
Y3B1LXBhc3NpdmUgewo+IC0JCQkJCQl0ZW1wZXJhdHVyZSA9IDw1NzAwMD47Cj4gKwkJCQkJCXRl
bXBlcmF0dXJlID0gPDQ3MDAwPjsKPiAgIAkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47Cj4gLQkJ
CQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4gKwkJCQkJCXR5cGUgPSAiYWN0aXZlIjsKPiAgIAkJCQkJ
fTsKCmlmIHR5cGUgaXMgZGlmZmVyZW50LCBpbWhvIHRoZSBuYW1lK2xhYmVsIHNob3VsZCBiZSBj
aGFuZ2VkIHRvbwoKPiAgIAkJCQkJY3B1X2FjdGl2ZTogY3B1LWFjdGl2ZSB7Cj4gICAJCQkJCQl0
ZW1wZXJhdHVyZSA9IDw2NzAwMD47Cj4gICAJCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+Owo+IC0J
CQkJCQl0eXBlID0gImFjdGl2ZSI7Cj4gKwkJCQkJCXR5cGUgPSAicGFzc2l2ZSI7Cj4gICAJCQkJ
CX07CgpkaXRvCgo+ICAgCQkJCQljcHVfaG90OiBjcHUtaG90IHsKPiAgIAkJCQkJCXRlbXBlcmF0
dXJlID0gPDg3MDAwPjsKPiAgIAkJCQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47CgpyZWdhcmRzIEZy
YW5rCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
