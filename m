Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EB8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fH1OGurwCsgzFq6wSGEHaZqTT/x6wbH+HhqOjlGdxsk=; b=aQeE+SrgBs3jS/
	KJLno5fQUdHf8VlRmcxUebjhajFMZyNEb99C9+gMTkXWUSXEaC2tVpqj0VwzuS8HomnJ76iUEAUJ8
	zLNesDkbTwTJBrZIgIB6NVEjteS+qTj7K9w5puJPLTsivoM+B/1Yi7cJhlyyiJ7XE2/r9YkmPyrCB
	paDCH3DdvQDeIEMADgp6PV05Oqmjy7d00LweJibPYdHDy6K68i2lI7Tqge3fOZySfH7Vj4Mu2RkgI
	9VyGmRdYGMXwbdpB69+gsOX1ftoTJBIBsW62aAmsiiJaFdX4BWsElcIDvEaVZij+YSaXcA9tyOnkK
	P9/yaTKXD0adPjBJYYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZNj-009opt-QM; Mon, 31 Jan 2022 16:18:19 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZNN-009odr-BF
 for linux-mediatek@lists.infradead.org; Mon, 31 Jan 2022 16:17:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id n32so13240214pfv.11
 for <linux-mediatek@lists.infradead.org>; Mon, 31 Jan 2022 08:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6dW6Paekh2M3q0AKO8Nn9qo5GhbHWr+f3LHux6ppjjc=;
 b=VkKWKKTJ3llEDCuYXX58J/Van2BWr42/g0fFruRyO6A6IJ1Ey0+QdtOAFBk2DvKf+d
 QwGPZP5vklGLbvsxff02lAyYYXg57KkLhSFp1qgxA1R/i0KaH0l55sDniuT/VAHN0h/7
 g01P6xBckDtgxsHOe4IjZ1acKEaK3DZS19iiUm66fcSPbB3ymZcpbPCDXGq/bWne2+Ut
 hDDhXr2qbivYhNkT+P5QqfJq1uGrrcaioLZS2ThSGuZdGdEb/ZeTv1Bl2c0Mgj1v953/
 vL3vt+sypWD/I9GTFPiNqfXdL3qr0LmG2OW6CK02kLsaIQYrI2Iiwecnv+MiyqIDsAus
 V8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6dW6Paekh2M3q0AKO8Nn9qo5GhbHWr+f3LHux6ppjjc=;
 b=hlNANiz29oD8gGrF3ov+N5HcBmyxIPK/yrfdFFKtzE7YL3tsQoVAuGLLI3cxTa3U5L
 cdx2pKEnN+eId3+emEzlsf3LLGPvUAvWKX49A/eOjIMAT9yyQcRBoEM5eKe8VubXC0oD
 IqpM7J61BF3kN+AOLP5NAr+dXJpi3pjflu1fXoXzUT3Y5W8xyzHLBGJ3Hjb7CRH9hlG2
 eN0oJNwvedLnSXa/oOpP3IbvIpI6Y9EOcvt3PYSk8T11KhD7CUUflrzeoCFtcrgoETp3
 74mH0RG1n3OzmERO1YGccMRovgWlWhKiKjEzAycOABRe2uLp2l2QIjj5g6LzHm83YkmE
 4z3A==
X-Gm-Message-State: AOAM532fj/P04sM0+QvZBj9TKNMD1tQuZzpE5vP+k+S5wsL2aVWkkmgs
 7kKbd/FAhp/akk6aXSTW1rI8gXCMmW9HgZsG4urlxw==
X-Google-Smtp-Source: ABdhPJyYEfOTlfcPo2Rc+tEKMntaZtsEDls8xaX5GIagij1mfThuKofuLRYN4ivvCrNxgQwweXv2dwSWORZti1M2rEg=
X-Received: by 2002:a63:4a49:: with SMTP id j9mr17019055pgl.178.1643645870158; 
 Mon, 31 Jan 2022 08:17:50 -0800 (PST)
MIME-Version: 1.0
References: <20220120224204.773117-1-nfraprado@collabora.com>
 <29069a98-a839-4fb6-5b83-7877402aaf30@collabora.com>
In-Reply-To: <29069a98-a839-4fb6-5b83-7877402aaf30@collabora.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 31 Jan 2022 17:17:39 +0100
Message-ID: <CAG3jFytzxD9aAFGNhZ5djgqjgU7QmKOei077TYn7t3QpQdMb-g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's
 DSI endpoint
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Xin Ji <xji@analogixsemi.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_081757_403428_2E81D144 
X-CRM114-Status: GOOD (  20.80  )
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

SGV5LAoKT24gRnJpLCAyMSBKYW4gMjAyMiBhdCAxMjo0NiwgQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8KPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4gd3JvdGU6Cj4K
PiBJbCAyMC8wMS8yMiAyMzo0MiwgTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gaGEgc2NyaXR0bzoK
PiA+IG10ODE4My1rdWt1aS1qYWN1enppIGhhcyBhbiBhbng3NjI1IGJyaWRnZSBjb25uZWN0ZWQg
dG8gdGhlIG91dHB1dCBvZgo+ID4gaXRzIERTSSBob3N0LiBIb3dldmVyLCBhZnRlciBmZDAzMTBi
NmZlN2QgKCJkcm0vYnJpZGdlOiBhbng3NjI1OiBhZGQKPiA+IE1JUEkgRFBJIGlucHV0IGZlYXR1
cmUiKSwgYSBidXMtdHlwZSBwcm9wZXJ0eSBzdGFydGVkIGJlaW5nIHJlcXVpcmVkIGluCj4gPiB0
aGUgZW5kcG9pbnQgbm9kZSBieSB0aGUgZHJpdmVyIHRvIGluZGljYXRlIHdoZXRoZXIgaXQgaXMg
RFNJIG9yIERQSS4KPiA+Cj4gPiBBZGQgdGhlIG1pc3NpbmcgYnVzLXR5cGUgcHJvcGVydHkgYW5k
IHNldCBpdCB0byA1Cj4gPiAoVjRMMl9GV05PREVfQlVTX1RZUEVfUEFSQUxMRUwpIHNvIHRoYXQg
dGhlIGRyaXZlciBoYXMgaXRzIGlucHV0Cj4gPiBjb25maWd1cmVkIHRvIERTSSBhbmQgdGhlIGRp
c3BsYXkgcGlwZWxpbmUgY2FuIHByb2JlIGNvcnJlY3RseS4KPiA+Cj4gPiBXaGlsZSBhdCBpdCwg
YWxzbyBzZXQgdGhlIGRhdGEtbGFuZXMgcHJvcGVydHkgdGhhdCB3YXMgYWxzbyBpbnRyb2R1Y2Vk
Cj4gPiBpbiB0aGF0IHNhbWUgY29tbWl0LCBzbyB0aGF0IHdlIGRvbid0IHJlbHkgb24gdGhlIGRl
ZmF1bHQgdmFsdWUuCj4gPgo+ID4gRml4ZXM6IGZkMDMxMGI2ZmU3ZCAoImRybS9icmlkZ2U6IGFu
eDc2MjU6IGFkZCBNSVBJIERQSSBpbnB1dCBmZWF0dXJlIikKPiA+IFNpZ25lZC1vZmYtYnk6IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KPgo+IFJldmll
d2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPgo+Cj4gPiAtLS0KPiA+ICAgYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxODMta3VrdWktamFjdXp6aS5kdHNpIHwgMiArKwo+ID4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRzaQo+ID4gaW5kZXggOGY3YmYz
M2Y2MDdkLi5lOGYxMzNkYzk2YjkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210ODE4My1rdWt1aS1qYWN1enppLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRzaQo+ID4gQEAgLTE3MSw2
ICsxNzEsOCBAQCBwb3J0QDAgewo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICBhbng3NjI1
X2luOiBlbmRwb2ludCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUt
ZW5kcG9pbnQgPSA8JmRzaV9vdXQ+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
YnVzLXR5cGUgPSA8NT47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLWxh
bmVzID0gPDAgMSAyIDM+Owo+ID4gICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiAgICAgICAg
ICAgICAgIH07Cj4gPgo+ID4KClRoaXMgcGF0Y2ggZG9lcyBub3QgcGFzcyBjaGVja3BhdGNoIC0t
c3RyaWN0LCBwbGVhc2UgYWRkIHRoZSB3b3JkCmNvbW1pdCBiZWZvcmUgdGhlIGhhc2ggaW4gdGhl
IGNvbW1pdCBtZXNzYWdlIHRvIGZpeCB0aGlzLgoKClJvYi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
