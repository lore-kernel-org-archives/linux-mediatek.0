Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC028C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5vmBRlYUypZBc/kCxSkmD3kXgikGWgi0Uy7h7lTNFY=; b=nG6CoMvYnBkcZQ
	ET6ll9Y1ja7FYsvyfBAejgl1WflxY9yOxM+UafzXyD9DixD22BZk+/kaDIveS1t9nzRXRlfcYACd1
	zw1prrkqc3r5ujZwC0FtHQ4r6dKGNz34laMILXYVOxPGSM88Zcan8TLtp2LnKhncjC3uh8MMvYiVZ
	fh6YwvKXt2DwVog8s9CIq/PIjRfGcq6LzPDQUVg6p/JMe/pODRCwIWFk7RsFpJZRAxCRFUeakP0Fj
	PzDIzw9psJzMRInQTACQPkTtslBxKL3rOO8Ci05Dh8Zb25M5ZilFvFGstPrrZ1gkwFCWaQLC9U/NS
	+pDMAWBFZiuLv6ctgwMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWd8-00HCle-KK; Wed, 13 Apr 2022 06:37:30 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWc3-00HCDy-FG; Wed, 13 Apr 2022 06:36:25 +0000
Received: by mail-qk1-x735.google.com with SMTP id c199so704128qkg.4;
 Tue, 12 Apr 2022 23:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lVlNuAo9+0LRFp48WRzrOf1tdSb0zAURerrByRaHWQ4=;
 b=RWm0KbOUQ8Kubcw7iCvGa7dVVMQnn8DHJxM8rtgcot3Nef+WP3ZwU1lw2U7COdgDid
 G+kl/vGL1ZCSpKyycigFMRZiLQBc0A5xXI7QJFybMLtfXHBPL7H0CW09PSI5FKLGMIBj
 sZzgTw6eVx4AgBYyA9Aaxegl0QQcg4l4uGQ2GN2YynTKhKYa0c1L4vqw1U+a4OdameKX
 NJX5YHKKKyXTNGstljKTZGBDY+fIOnj87/jamYoW1CZVdUdweDfdHj32UyaJ5RDTyN9B
 xHvfj+MB7PLHPuWmGhjYLQe4K8FoqsYUPXpDxvA9K07Wf+zm330XLVA0z3hjrS50cIPa
 EGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lVlNuAo9+0LRFp48WRzrOf1tdSb0zAURerrByRaHWQ4=;
 b=1y3hM2t/kvGpbm7ppbp87uB1ZDR+3oHBypDnG8CKFBXFMmz4F9AMyvFztgU+RnBWCS
 w8DSjnlwTj6kviFwnPm4GAjBmnB43M252KBEIxLtT/871TRSVtZLYaa9q5bMIsi8tuD7
 8LmVFd4Qtwq8UltiMlCvgcJg6TRALf0vKK3F2VrL7UwDStvgA/a84Zn1Uj73Jm8MMJ1W
 7eqRes/F/rY8zbIBq33VNHzRYmjV2yfDNHc71Tlxe0nhCnRCm9IZoLKl3ZsQP9TVWde2
 YYEmaaf6/XKm5xUq+ezMiDD2zmQ+AAyE/MTv5HVCAJ+ZDRXmtiamn4lmaz1ygT5QXVc6
 /wQA==
X-Gm-Message-State: AOAM533JyH12pUTi/Lp7B7QUKvID6w8bMFqQ9HerEIAm7svYgxLdj4me
 03DEEy8DEXAL9GLgndRxEwpYWIla/y1WhnOIRy8=
X-Google-Smtp-Source: ABdhPJy3AaKsu44Yp4UCtsi1PArOwoGqRvhviTP5hjJuZ9/J2xvjSNLZDqzHNMxdw18SPpRJjGR6tsX20Muox56KDQo=
X-Received: by 2002:a05:620a:4308:b0:67b:487e:e02a with SMTP id
 u8-20020a05620a430800b0067b487ee02amr5722093qko.696.1649831780406; Tue, 12
 Apr 2022 23:36:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 13 Apr 2022 08:36:09 +0200
Message-ID: <CAMhs-H_oRzpeqJY8Oe+7Su5v-4B1WPwzOfhrvBC08FVi-O6fVA@mail.gmail.com>
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, erkin.bozoglu@xeront.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_233623_611574_8D49E979 
X-CRM114-Status: GOOD (  24.71  )
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

SGkgQXJpbsOnLAoKT24gV2VkLCBBcHIgMTMsIDIwMjIgYXQgODowOCBBTSBBcsSxbsOnIMOcTkFM
IDxhcmluYy51bmFsQGFyaW5jOS5jb20+IHdyb3RlOgo+Cj4gSGV5IGV2ZXJ5b25lLgo+Cj4gVGhp
cyBwYXRjaCBzZXJpZXMgYnJpbmdzIGNvbXBsZXRlIHJlZmFjdG9yaW5nIHRvIHRoZSBSYWxpbmsg
cGluY3RybCBkcml2ZXIKPiBhbmQgaXRzIHN1YmRyaXZlcnMuCj4KPiBUaGUgbXQ3NjIwIHBpbmN0
cmwgc3ViZHJpdmVyIHN1cHBvcnRzIE1UNzYyOCBhbmQgTVQ3Njg4IFNvQ3MgYWxvbmcgd2l0aAo+
IE1UNzYyMC4gVGhlc2UgdHdvIHNoYXJlIHRoZSBzYW1lIHBpbiBsYXlvdXQuIFRoZSBjb2RlIHVz
ZWQgZm9yIE1UNzYyOCBhbmQKPiBNVDc2ODggaXMgcmVuYW1lZCBmcm9tIE1UNzYyOC9tdDc2Mjhh
biB0byBNVDc2WDguCj4KPiBSYWxpbmsgcGluY3RybCBkcml2ZXIgaXMgY2FsbGVkIHJ0Mjg4MCB3
aGljaCBpcyB0aGUgbmFtZSBvZiB0aGUgUmFsaW5rCj4gUlQyODgwIFNvQy4gQSBzdWJkcml2ZXIg
Zm9yIHRoZSBSYWxpbmsgUlQyODgwIFNvQyBpcyBjYWxsZWQgcnQyODh4LiBSZW5hbWUKPiBydDI4
ODAgdG8gcmFsaW5rLgo+Cj4gUmVuYW1lIGNvZGUgZnJvbSBwaW5tdXggdG8gcGluY3RybCBmb3Ig
d2hlcmUgdGhlIG9wZXJhdGlvbiBpcyBub3QgYWJvdXQgdGhlCj4gbXV4aW5nIG9mIHBpbnMuCj4K
PiBSZW5hbWUgcnQyODh4IHBpbmN0cmwgc3ViZHJpdmVyIGZvciB0aGUgUlQyODgwIFNvQyB0byBy
dDI4ODAuCj4KPiBWYXJpYWJsZXMgZm9yIGZ1bmN0aW9ucyBpbmNsdWRlICJncnAiIG9uIHRoZSBS
YWxpbmsgTVQ3NjIwIGFuZCBNVDc2MjEKPiBzdWJkcml2ZXJzLiBSZW5hbWUgdGhlbSB0byAiZnVu
YyIgaW5zdGVhZCBhcyB0aGV5IGRlZmluZSB0aGUgZnVuY3Rpb25zIGZvcgo+IHRoZSBwaW4gZ3Jv
dXBzLiBUaGlzIGlzIGFscmVhZHkgdGhlIGNhc2UgZm9yIHRoZSBvdGhlciAzIHN1YmRyaXZlcnM7
Cj4gUlQyODgwLCBSVDMwNXgsIFJUMzg4My4KPgo+IEZpeCBLY29uZmlnIHRvIGNhbGwgdGhlIHN1
YmRyaXZlcnMsIHdlbGwsIHN1YmRyaXZlcnMuCj4KPiBBZGQgbmV3IGNvbXBhdGlibGUgc3RyaW5n
cyBmb3IgZWFjaCBzdWJkcml2ZXIgYW5kIHVwZGF0ZSBEVCBiaW5kaW5nCj4gYWNjb3JkaW5nbHku
Cj4KPiBBZGQgUmFsaW5rIHBpbmN0cmwgZHJpdmVyIHRvIE1BSU5UQUlORVJTIGFuZCBhZGQgbWUg
YW5kIFNlcmdpbyBhcyB0aGUKPiBtYWludGFpbmVycy4KPgo+IEZpbmFsbHksIGZpeCB0aGUgY3Vy
cmVudCBydDI4ODAgZG9jdW1lbnRhdGlvbiBhbmQgYWRkIGJpbmRpbmcgZm9yIGFsbCBvZgo+IHRo
ZSBzdWJkcml2ZXJzLgo+Cj4gSSBoYXZlIHRoZSBwYXRjaGVzIGhlcmUgc2hvdWxkIGFueW9uZSBw
cmVmZXIgdG8gcmVhZCB0aGVtIHRoZXJlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hcmluYzkvbGlu
dXgvY29tbWl0cy9yYWxpbmstcGluY3RybC1yZWZhY3Rvcgo+Cj4gUmFsaW5rIHBpbmN0cmwgZHJp
dmVyIGFuZCB0aGUgc3ViZHJpdmVycyB3ZXJlIGNvbXBpbGUgdGVzdGVkLgo+IE1UNzYyMSBwaW5j
dHJsIHN1YmRyaXZlciB3YXMgdGVzdGVkIG9uIGEgcHJpdmF0ZSBtdDc2MjEgYm9hcmQuCj4gWUFN
TCBiaW5kaW5ncyBjaGVja2VkIHdpdGg6Cj4gQVJDSD1taXBzIENST1NTX0NPTVBJTEU9bWlwcy1s
aW51eC1nbnUtIG1ha2UgZHRfYmluZGluZ19jaGVjayBEVF9TQ0hFTUFfRklMRVM9RG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvIC1qJChucHJvYykKPgo+IEFyxLFuw6cg
w5xOQUwgKDE0KToKPiAgIHBpbmN0cmw6IHJhbGluazogcmVuYW1lIE1UNzYyOChhbikgZnVuY3Rp
b25zIHRvIE1UNzZYOAo+ICAgcGluY3RybDogcmFsaW5rOiByZW5hbWUgcGluY3RybC1ydDI4ODAg
dG8gcGluY3RybC1yYWxpbmsKPiAgIHBpbmN0cmw6IHJhbGluazogcmVuYW1lIHBpbm11eCBmdW5j
dGlvbnMgdG8gcGluY3RybAo+ICAgcGluY3RybDogcmFsaW5rOiByZW5hbWUgcGluY3RybC1ydDI4
OHggdG8gcGluY3RybC1ydDI4ODAKPiAgIHBpbmN0cmw6IHJhbGluazogcmVuYW1lIHZhcmlhYmxl
IG5hbWVzIGZvciBmdW5jdGlvbnMgb24gTVQ3NjIwIGFuZCBNVDc2MjEKPiAgIHBpbmN0cmw6IHJh
bGluazogcmVuYW1lIGRyaXZlciBuYW1lcyB0byBzdWJkcml2ZXJzCj4gICBNQUlOVEFJTkVSUzog
YWRkIFJhbGluayBwaW5jdHJsIGRyaXZlcgoKRm9yIGFsbCB0aGVzZSByZW5hbWUgc3R1ZmYgYW5k
IE1BSU5UQUlORVJTIGNoYW5nZToKClJldmlld2VkLWJ5OiBTZXJnaW8gUGFyYWN1ZWxsb3MgPHNl
cmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+Cgo+ICAgcGluY3RybDogcmFsaW5rOiBhZGQgbmV3
IGNvbXBhdGlibGUgc3RyaW5ncyBmb3IgZWFjaCBwaW5jdHJsIHN1YmRyaXZlcgo+ICAgbWlwczog
ZHRzOiByYWxpbms6IG10NzYyMTogdXNlIHRoZSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgZm9yIE1U
NzYyMSBwaW5jdHJsCj4gICBkdC1iaW5kaW5nczogcGluY3RybDogcnQyODgwOiBmaXggYmluZGlu
ZyBuYW1lLCBwaW4gZ3JvdXBzIGFuZCBmdW5jdGlvbnMKPiAgIGR0LWJpbmRpbmdzOiBwaW5jdHJs
OiBhZGQgYmluZGluZyBmb3IgUmFsaW5rIE1UNzYyMCBwaW5jdHJsCj4gICBkdC1iaW5kaW5nczog
cGluY3RybDogYWRkIGJpbmRpbmcgZm9yIFJhbGluayBNVDc2MjEgcGluY3RybAo+ICAgZHQtYmlu
ZGluZ3M6IHBpbmN0cmw6IGFkZCBiaW5kaW5nIGZvciBSYWxpbmsgUlQzMDVYIHBpbmN0cmwKPiAg
IGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBhZGQgYmluZGluZyBmb3IgUmFsaW5rIFJUMzg4MyBwaW5j
dHJsCgpJIHRoaW5rIHlvdSBjYW5ub3QgY2hhbmdlIGNvbXBhdGlibGUgc3RyaW5ncyBiZWNhdXNl
IHlvdSBoYXZlIHRvIGJlCmNvbXBhdGlibGUgd2l0aCBwcmV2aW91cyBzdHVmZi4gVGhhdCBpcyB0
aGUgcmVhc29uIHdoeSB3aGVuIEkKcmVmYWN0b3JlZCBhbGwgb2YgdGhpcyBzdHVmZiBmcm9tICdh
cmNoL21pcHMvcmFsaW5rJyBpbnRvCidkcml2ZXJzL3BpbmN0cmwnIEkgbWFpbnRhaW5lZCB0aGUg
c2FtZSBmb3IgYWxsIG9mIHRoZW0gYW5kIG9ubHkKY3JlYXRlZCBvbmUgYmluZGluZyBmb3IgYWxs
LiBJIGtub3cgdGhhdCB0aGVzZSBTb0NzIGFyZSBtb3N0bHkgdXNlZCBpbgpvcGVuV1JUIGFuZCB0
aGUgd2F5IG9mIGRvaW5nIHRoaW5ncyB0aGVyZSBpcyB0aGF0IHdoZW4gYSBuZXcgdmVyc2lvbgpp
cyByZWxlYXNlZCBhIG5ldyBkdGIgaXMgYWxzbyBjb21waWxlZCBzbyBJIHVuZGVyc3RhbmQgdGhl
IG1vdGl2YXRpb24Kb2YgdGhlIGNoYW5nZSBpdHNlbGYuIEluIGFueSBjYXNlLCBSb2IgaGFzIHRo
ZSBsYXN0IHdvcmQgaGVyZSwgbm90IG1lCjopLgoKVGhhbmtzIGZvciBkb2luZyB0aGlzLgoKQmVz
dCByZWdhcmRzLAogICAgU2VyZ2lvIFBhcmFjdWVsbG9zCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
