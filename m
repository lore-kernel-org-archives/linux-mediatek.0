Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E629FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Dec 2021 06:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nMnX5gsGemwIAZLzFUjykjfnj7WjkZer6zdUusRTR4=; b=qW7ffqn7Q+tsEw
	VV2xgWVAes9VbRILZ8efn9a2FAqBEx2xVo7NEWFPxqM9E8BOG/UMpbXtaqvUSoEi+uYLECzuMjQzb
	oaetPrD9NpOpxq6AQVLsIfz7lDdA4wPrY9AqeEmMx/D6jSB0PYZ4LKE1mEZwK7pCw8tdjQVTt7/jO
	751pqk23eXU71WoLBzH6PM2Q1BMn/U7eYmc3uxMUPfxIR2mArdkZvsSN8T2gaAlqWEzFYdtPO6Dde
	mJz2u01LQJuOLpFFEu6IUX81YgTyIOY6p7B5OeATKGG1VhsUB7+blJKRLssVGxzxdDJkyFULZU0cZ
	UVtVbCZMCPCfZ7BrttjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzYK8-005b8g-K3; Tue, 21 Dec 2021 06:08:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzYJv-005b6l-OJ; Tue, 21 Dec 2021 06:08:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id EB48ECE12BA;
 Tue, 21 Dec 2021 06:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262F4C36AE2;
 Tue, 21 Dec 2021 06:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640066891;
 bh=1+pdq3KVkpWxLeSEJSOc8Gje3z/xJVmfhMBaGDIU3ck=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h6U7snWKmDHMF4rceeQUqMSMQjsYHVk/L9TbHz1pZVcNRcsSc2nCOkethuRL45XSn
 zfHEEsFTPzMgQq0qbEJViDMQpIt21KA93KHWGaiFtVhhgj98gcAGhDtyNEipGOf/2Y
 Pd6ba8e8dJQrxQGbf7DcBfLyzWbQ1jO2Ys05ca+LXfyoFy7AZXrrbbM1K9mCtwd99+
 C0cg7mdahuwYnWz5/2kcYQM9dx3BCCRffn6lm1BmxeHji+ZYwe6PuMDUtIpFDtSVR8
 JgEFlU62JgBonJ5mZyvcDLKqtvx520N9LS3uXcwXpEKpwKFLWpoJj7HLyWg4/cjG/s
 IHVaFvq2NfwWA==
Received: by mail-yb1-f173.google.com with SMTP id x32so35576429ybi.12;
 Mon, 20 Dec 2021 22:08:11 -0800 (PST)
X-Gm-Message-State: AOAM53058nim/iZdloehL9cK6QbrLTJxIXVsyoFKZJpRN0gf67Bq06Gq
 646U3MEReBrtiPwvwbUpMl7FdiNBwmNkislzbWI=
X-Google-Smtp-Source: ABdhPJwVF0i69IklA109HppW9xClsaOPWV/8F4VKxROC6V7DTCTfoxyZ/y8mV+y+bKIbK6FlJpACeoT+PxqKslHGcOQ=
X-Received: by 2002:a25:b187:: with SMTP id h7mr2487968ybj.445.1640066890269; 
 Mon, 20 Dec 2021 22:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20211217121148.6753-1-sam.shih@mediatek.com>
 <bf78ebdf10bcff21dfe844e619ead13162534d97.camel@mediatek.com>
 <CA+SzRW5PeNurT5rNoGpcLcPE9nu4XFnrPOxq7a1dcV905FC++Q@mail.gmail.com>
In-Reply-To: <CA+SzRW5PeNurT5rNoGpcLcPE9nu4XFnrPOxq7a1dcV905FC++Q@mail.gmail.com>
From: Ryder Lee <ryder.lee@kernel.org>
Date: Mon, 20 Dec 2021 22:07:59 -0800
X-Gmail-Original-Message-ID: <CA+SzRW6=C3X-i3kOqzhRZ-At49103L-dDi5dm70jbWEuVKjufA@mail.gmail.com>
Message-ID: <CA+SzRW6=C3X-i3kOqzhRZ-At49103L-dDi5dm70jbWEuVKjufA@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Mediatek MT7986 basic clock support
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, 
 YH Chen <yh.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_220820_162162_5718860B 
X-CRM114-Status: GOOD (  20.33  )
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

T24gTW9uLCBEZWMgMjAsIDIwMjEgYXQgMTA6MDEgUE0gUnlkZXIgTGVlIDxyeWRlci5sZWVAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIDIwMjEtMTItMTcgYXQgMjA6MTEgKzA4MDAsIFNh
bSBTaGloIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIGJhc2ljIGNsb2NrIHN1cHBv
cnQgZm9yIG1lZGlhdGVrIG10Nzk4NiBTb0MuCj4gPiBJdCBpcyBiYXNlZCBvbiBwYXRjaCBzZXJp
ZXMgIkFkZCBiYXNpYyBTb0Mgc3VwcG9ydCBmb3IgbWVkaWF0ZWsKPiA+IG10Nzk4NiIKPiA+Cj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjExMDE4MTE0MDA5LjEzMzUwLTEtc2FtLnNo
aWhAbWVkaWF0ZWsuY29tLwo+ID4gYW5kICJjbGs6IG1lZGlhdGVrOiBBZGQgQVBJIGZvciBjbG9j
ayByZXNvdXJjZSByZWN5Y2xlIgo+ID4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1h
cm0ta2VybmVsLzIwMjEwOTE0MDIxNjMzLjI2Mzc3LTUtY2h1bi1qaWUuY2hlbkBtZWRpYXRlay5j
b20vCj4gPiAtLS0KPiA+IHY3OiBleGNsdWRlIERUUyBjaGFuZ2VzIGluIHRoZSBwYXRjaCBzZXJp
ZXMKPiA+IHY1OiB1c2VkIGJ1aWx0aW5fcGxhdGZvcm1fZHJpdmVyIGluc3RlYWQgb2YgQ0xLX09G
X0RFQ0xBUkUKPiA+ICAgICBmb2xsb3cgcmVjZW50IGNsay1tdDgxOTUgY2xvY2sgcGF0Y2ggc2Vy
aWVzOgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMjAy
MTA5MTQwMjE2MzMuMjYzNzctMS1jaHVuLWppZS5jaGVuQG1lZGlhdGVrLmNvbS8KPiA+Cj4gPiB2
NDoKPiA+IEFjY29yZGluZyB0byB0aGUgbWFpbnRhaW5lcsKhwqZzIHN1Z2dlc3Rpb24sIHRoaXMg
cGF0Y2ggc3BsaXRzIHRoZQo+ID4gcHJldmlvdXMKPiA+IHRocmVhZCBpbnRvIGluZGVwZW5kZW50
IHBhdGNoIHNlcmllcy4KPiA+IFRoaXMgcGF0Y2ggaW5jbHVkZSBjbG9jayBkcml2ZXIgYW5kIGRl
dmljZSB0cmVlIHVwZGF0ZQo+ID4KPiA+IE9yaWdpbmFsIHRocmVhZDoKPiA+Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjEwOTE0MDg1MTM3LjMxNzYxLTEtc2FtLnNoaWhAbWVkaWF0
ZWsuY29tLwo+ID4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIw
MjEwOTE0MDg1MTM3LjMxNzYxLTItc2FtLnNoaWhAbWVkaWF0ZWsuY29tLwo+ID4gLS0tCj4gPgo+
ID4gU2FtIFNoaWggKDMpOgo+ID4gICBkdC1iaW5kaW5nczogY2xvY2s6IG1lZGlhdGVrOiBkb2N1
bWVudCBjbGsgYmluZGluZ3MgZm9yIG1lZGlhdGVrCj4gPiAgICAgbXQ3OTg2IFNvQwo+ID4gICBj
bGs6IG1lZGlhdGVrOiBhZGQgbXQ3OTg2IGNsb2NrIElEcwo+ID4gICBjbGs6IG1lZGlhdGVrOiBh
ZGQgbXQ3OTg2IGNsb2NrIHN1cHBvcnQKPiA+Cj4gPiAgLi4uL2FybS9tZWRpYXRlay9tZWRpYXRl
ayxhcG1peGVkc3lzLnR4dCAgICAgIHwgICAxICsKPiA+ICAuLi4vYmluZGluZ3MvYXJtL21lZGlh
dGVrL21lZGlhdGVrLGV0aHN5cy50eHQgfCAgIDEgKwo+ID4gIC4uLi9hcm0vbWVkaWF0ZWsvbWVk
aWF0ZWssaW5mcmFjZmcudHh0ICAgICAgICB8ICAgMSArCj4gPiAgLi4uL2FybS9tZWRpYXRlay9t
ZWRpYXRlayxzZ21paXN5cy50eHQgICAgICAgIHwgICAyICsKPiA+ICAuLi4vYXJtL21lZGlhdGVr
L21lZGlhdGVrLHRvcGNrZ2VuLnR4dCAgICAgICAgfCAgIDEgKwo+ID4gIGRyaXZlcnMvY2xrL21l
ZGlhdGVrL0tjb25maWcgICAgICAgICAgICAgICAgICB8ICAxNyArCj4gPiAgZHJpdmVycy9jbGsv
bWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgICA0ICsKPiA+ICBkcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ3OTg2LWFwbWl4ZWQuYyAgICAgfCAxMDAgKysrKysKPiA+ICBkcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWV0aC5jICAgICAgICAgfCAxMzIgKysrKysrKwo+
ID4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtaW5mcmFjZmcuYyAgICB8IDIyNCAr
KysrKysrKysrKysKPiA+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LXRvcGNrZ2Vu
LmMgICAgfCAzNDIKPiA+ICsrKysrKysrKysrKysrKysrKwo+ID4gIGluY2x1ZGUvZHQtYmluZGlu
Z3MvY2xvY2svbXQ3OTg2LWNsay5oICAgICAgICB8IDE2OSArKysrKysrKysKPiA+ICAxMiBmaWxl
cyBjaGFuZ2VkLCA5OTQgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWFwbWl4ZWQuYwo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LWV0aC5jCj4gPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDc5ODYtaW5mcmFjZmcuYwo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ3OTg2LXRvcGNr
Z2VuLmMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9t
dDc5ODYtY2xrLmgKPiA+Cgp1Z2guIFNob3VsZCBiZSBwbGFpbiB0ZXh0IG1vZGUgZm9yIHRoZSBw
cmV2aW91cyBtYWlsLgoKRm9yIHRoZSBzZXJpZXMgLQpSZXZpZXdlZC1ieTogUnlkZXIgTGVlIDxy
eWRlci5sZWVAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
