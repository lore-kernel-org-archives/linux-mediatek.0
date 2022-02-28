Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49148C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZTVVldsdyfXhlGNTfKCxrYfjiyKyASXXwgD1jlX5FI=; b=qCS3+zI5fWEnq0
	Q0c1nFnpIwJ0gs10T/WiH5m2KaI0JdYUqi4r7g2uDFWPxuUyg6QaCaOZ9I6Hr6yClFIx7C4HR/Jr6
	XLvW9rsDfTSiOWKegAfCzQh4CTn+5SRKRA0oeb1XEN17XQO0uVv11YNDwwItxbp4f5gkhtJy5GsDd
	ycCzchfTn/tvQxpLCJezzP2N0rmJTllbwYa0Mm7JW1mpQscEP11ofnJFe01T4Y9XUjsR3Q+ATaAQt
	5mul1AmcrusYlxCm2Z+oyL/lNAa1SVQ23ZGJA5uVzUgQANC/cqXh16IhfApYaJcT4xbxEsDAoHGhI
	Sl4lxTTwPMwmaSdxf13g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfDe-00CEdW-1z; Mon, 28 Feb 2022 12:33:38 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOelN-00C3qS-MQ
 for linux-mediatek@lists.infradead.org; Mon, 28 Feb 2022 12:04:29 +0000
Received: by mail-lf1-x136.google.com with SMTP id d23so20888043lfv.13
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Feb 2022 04:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8WnObInMC2ofWUsTKYtPij+k1Wh0DXe/u1zG3p1IPf4=;
 b=JqfBkaGJmDTS5BLvufjhP/LEar/dzjQ6i7GPUZzQbUUApCYFA5AQYeQ/dfEM6n3HG6
 CaZx9w0fjnDcQCHoNddRQS/A54mr7vTrErGBM5tIFsv7T/+VRPuNDLeW23vIDovdwSP7
 1YlExP3x/CuK+MMWXD+8VX40ycwwMQg9kW/7AfxgyIM/5HUHjOIhV6o04w+Sz1TY6zGJ
 yK5nlmPf9dv+VtE25IFeAdYzaQl0yQmQdb0DFN6YWjq3GJl8OCOtYnx1B1DzLqs0Htc5
 BO28nMs1x1Ceqic4zFgJpRukkI19rYnBqN13EUOvPUo4O19aDegrb8WhpA5zTdnQRqGM
 OE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8WnObInMC2ofWUsTKYtPij+k1Wh0DXe/u1zG3p1IPf4=;
 b=HOCu6o7mpz3feJEK5+Xnc3Kli/Xvb/5xNTJV56Pc/HnJwp8xT2AahEYKnwDEQQgfZk
 ARNrBUYVvWjGYIwxBHSHrR7y06pVUrkZe3d49zTlR6Ot/XNW16Tbmd6nDPp6oOKwoOPF
 pz27VMfCb3WGUZbOuee//ENIbZlrV8g2clfiQuEnCPFSasFmzymGkZLfAw06NSYeDtqU
 Z++m5qFNU0//zB6R68ckeaBDpXbxe0/DD8jtoODIVY7J4PZAF21fgDnUUttOCAPSih+8
 psfg3D2Hgih6/2gMBwI6Q+QLy/IwSkQlsPR4iXUrYrd1tzh1+J56HcYzJZFoCtqUoJO7
 hM9g==
X-Gm-Message-State: AOAM530s0VGgcKApuNFUnFRcxC0EXd/+4RtSzs7QUtVEseZFysZ5VgfZ
 SUCkxZL1dLxuOWAfJ3szoF0qrFymYF+7mdxqFDA8gw==
X-Google-Smtp-Source: ABdhPJxpZi2fIFjY4KRz6vVxIdDcBSJGElXWDH3T1Fddx90I97shcxEvbgmXGqeayZecnO4XROSRNKyZGUYTNmYasOI=
X-Received: by 2002:ac2:5de4:0:b0:443:5b80:d4c4 with SMTP id
 z4-20020ac25de4000000b004435b80d4c4mr12437782lfq.373.1646049863342; Mon, 28
 Feb 2022 04:04:23 -0800 (PST)
MIME-Version: 1.0
References: <1644395927-4138-1-git-send-email-wangqing@vivo.com>
 <CAPDyKFqg5N1tCqQ2u2jt5qU0qLuDJRSJRtq_aMVDc7XNDbRvkw@mail.gmail.com>
 <bcd6688f-6f42-ca8f-ab9c-978eeff4f4e3@wanadoo.fr>
In-Reply-To: <bcd6688f-6f42-ca8f-ab9c-978eeff4f4e3@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Feb 2022 13:03:47 +0100
Message-ID: <CAPDyKFo-4hkTo8F9q4+BmxUH_Y4nk_K0N20q53xrdJLAFRutcQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: mtk-sd: use div64_u64() instead of do_div()
To: Qing Wang <wangqing@vivo.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_040425_800626_4E6F0F22 
X-CRM114-Status: GOOD (  19.59  )
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

T24gVGh1LCAxNyBGZWIgMjAyMiBhdCAyMTowMCwgQ2hyaXN0b3BoZSBKQUlMTEVUCjxjaHJpc3Rv
cGhlLmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6Cj4KPiBMZSAxNy8wMi8yMDIyIMOgIDE2OjM5
LCBVbGYgSGFuc3NvbiBhIMOpY3JpdCA6Cj4gPiBPbiBXZWQsIDkgRmViIDIwMjIgYXQgMDk6Mzks
IFFpbmcgV2FuZyA8d2FuZ3FpbmdAdml2by5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gRnJvbTogV2Fu
ZyBRaW5nIDx3YW5ncWluZ0B2aXZvLmNvbT4KPiA+Pgo+ID4+IGRvX2RpdigpIGRvZXMgYSA2NC1i
eS0zMiBkaXZpc2lvbi4KPiA+PiBXaGVuIHRoZSBkaXZpc29yIGlzIHU2NCwgZG9fZGl2KCkgdHJ1
bmNhdGVzIGl0IHRvIDMyIGJpdHMsIHRoaXMgbWVhbnMgaXQKPiA+PiBjYW4gdGVzdCBub24temVy
byBhbmQgYmUgdHJ1bmNhdGVkIHRvIHplcm8gZm9yIGRpdmlzaW9uLgo+ID4+Cj4gPj4gZml4IGRv
X2Rpdi5jb2NjaSB3YXJuaW5nOgo+ID4+IGRvX2RpdigpIGRvZXMgYSA2NC1ieS0zMiBkaXZpc2lv
biwgcGxlYXNlIGNvbnNpZGVyIHVzaW5nIGRpdjY0X3U2NCBpbnN0ZWFkLgo+ID4+Cj4gPj4gU2ln
bmVkLW9mZi1ieTogV2FuZyBRaW5nIDx3YW5ncWluZ0B2aXZvLmNvbT4KPiA+Cj4gPiBBcHBsaWVk
IGZvciBuZXh0LCB0aGFua3MhCj4KPgo+IFRoaXMgaXMgd3JvbmcuCj4KPiBTZWUgWzFdLgoKVGhh
bmtzIGZvciByZXBvcnRpbmcgdGhpcywgSSBhbSBkcm9wcGluZyB0aGUgcGF0Y2ggZnJvbSBteSBu
ZXh0IGJyYW5jaCEKClNlZSBtb3JlIGNvbW1lbnRzIGJlbG93LgoKPgo+Cj4gV2FuZyBRaW5nLCB5
b3Ugc2hvdWxkIHJlYWxseSB3YXJuIGFsbCB0aGUgcGVvcGxlIHlvdSBoYXZlIHNlbnQgc3VjaCBw
YXRjaGVzLgo+Cj4gQ0oKPgo+IFsxXToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1r
ZXJuZWwvMTliOTY5NzItY2VlNy05MzdmLTIxY2UtYzc4OTgyZWQyMDQ4QGxpbmFyby5vcmcvCj4K
Pgo+ID4KPiA+IEtpbmQgcmVnYXJkcwo+ID4gVWZmZQo+ID4KPiA+Cj4gPj4gLS0tCj4gPj4gICBk
cml2ZXJzL21tYy9ob3N0L210ay1zZC5jIHwgMiArLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tbWMvaG9zdC9tdGstc2QuYyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMKPiA+PiBpbmRl
eCA2NTAzN2UxLi43NzdjOWE4Cj4gPj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tdGstc2QuYwo+
ID4+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbXRrLXNkLmMKPiA+PiBAQCAtNzY2LDcgKzc2Niw3
IEBAIHN0YXRpYyB1NjQgbXNkY190aW1lb3V0X2NhbChzdHJ1Y3QgbXNkY19ob3N0ICpob3N0LCB1
NjQgbnMsIHU2NCBjbGtzKQo+ID4+ICAgICAgICAgICAgICAgICAgY2xrX25zICA9IDEwMDAwMDAw
MDBVTEw7Cj4gPj4gICAgICAgICAgICAgICAgICBkb19kaXYoY2xrX25zLCBtbWMtPmFjdHVhbF9j
bG9jayk7Cj4gPj4gICAgICAgICAgICAgICAgICB0aW1lb3V0ID0gbnMgKyBjbGtfbnMgLSAxOwo+
ID4+IC0gICAgICAgICAgICAgICBkb19kaXYodGltZW91dCwgY2xrX25zKTsKPiA+PiArICAgICAg
ICAgICAgICAgZGl2NjRfdTY0KHRpbWVvdXQsIGNsa19ucyk7CgpJIGd1ZXNzIGEgcHJvcGVyIHBh
dGNoIHdvdWxkIGJlIHRvIGNvbnZlcnQgY2xrX25zIGludG8gYW4gdTMyIGluc3RlYWQhPwoKPiA+
PiAgICAgICAgICAgICAgICAgIHRpbWVvdXQgKz0gY2xrczsKPiA+PiAgICAgICAgICAgICAgICAg
IC8qIGluIDEwNDg1NzYgc2NsayBjeWNsZSB1bml0ICovCj4gPj4gICAgICAgICAgICAgICAgICB0
aW1lb3V0ID0gRElWX1JPVU5EX1VQKHRpbWVvdXQsIEJJVCgyMCkpOwo+ID4+IC0tCgpLaW5kIHJl
Z2FyZHMKVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
