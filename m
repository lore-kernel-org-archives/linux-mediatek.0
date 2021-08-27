Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7B1C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 09:14:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23F7F60FE6
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 09:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23F7F60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dnlWZ3Xovt+UuJJSk+/AfMVSrkzQgLg2e9JNnFvaVi4=; b=q7PiVfxTt3JUVe
	8RskttqBBMuSzEPAeRSJL06wZAiaeEGPmXGxX3KYLmsE4W+W/Z2KrbjUKOWJGt+HpEwdFjjI8eIp4
	EyRJBaP7JTnGYfpClC5KsV4vwGy0EIBcLVy1KSnnNUAYfg6WShHHO44yQKFzO5zBaJUQyYhnT+R+g
	/kJiLeFPhiqjlX0lKChGj+If6KpPTPJ3aSdySEp/8UyXOD8Ygxrf3dcRvNraep9q42knCz/VC89O5
	NN1EzgE1WP+CqaupLrzTnSy4dVW0bMFFtNtpzlmBr96o7Yvm82iXxq2d3Q2HFct7pnLJs1zaAggqU
	/O5QmlUk9cOOSkhtbLNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJXwZ-00C16t-Pa; Fri, 27 Aug 2021 09:14:35 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJXwU-00C15Y-9S
 for linux-mediatek@lists.infradead.org; Fri, 27 Aug 2021 09:14:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id v123so5145557pfb.11
 for <linux-mediatek@lists.infradead.org>; Fri, 27 Aug 2021 02:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bul2XBNYr2W7qjEGBkEooccb8RDlBWjlNLT/gh1cvl0=;
 b=SEeQltv+gWkf4WKKwQtBVy+3a+FHo9EYzZ02BCgRVgIX5Ze2aIGZkyfFX3+Ohe+ocF
 w99OdsCZNeFD9ZJYjy7PIWvca6d92r4NTXWtHtsrK+hzsLzSqrODu9Ost5G7ejp5sh0d
 fTQRiyX2LVkUHtC7HFWv9Wo/mxC2twW2WMKbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bul2XBNYr2W7qjEGBkEooccb8RDlBWjlNLT/gh1cvl0=;
 b=uDQIn7BFdabpUDE5yqzRL/i5MSWHJg60lCKF/uIXv/rElIy+glb0LEGd214z4HV7Et
 AScwpzD9m8vklXGms6pjQT2YWWxnetBcEixxRxglU4StNbPiaD+5iqO4WZWyx4P8x1sK
 nMQM/o94TRu2X0F9Y7mW9BlL5v33jUXye7UXNPWEVD/h2An06oC0fSwGJ00VuB1nDHKN
 H25+wByv9C31KKGNt0rIkknT6HGXj1DslFgyMcLwwh64Trx1o9oiPFy2DBGzyDsZC2Ch
 XDjx+jA64GV3PWSrZJUnsyI2fn1eLjs82JUX8+grEf03aZinDs6CHxnDkLViv+bBotzt
 twug==
X-Gm-Message-State: AOAM533vfzm5IAR02WIzfsaj716GhcN8N9i3rtHaQGAuGDs228nVdKdY
 gS9pQdGaJEjqWn2YAsE/omjsH2HbzjRXnJuoNdw/ow==
X-Google-Smtp-Source: ABdhPJwmxL3HzsVntC18e8cdVE9YrLF+iRuENEYMaXfgIc8qYHjOL7VABV1L2+5PpXzA+c+19W4vykGQJyghGL/+P9w=
X-Received: by 2002:a63:5559:: with SMTP id f25mr7035771pgm.299.1630055668026; 
 Fri, 27 Aug 2021 02:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210826025144.51992-1-chunfeng.yun@mediatek.com>
 <20210826025144.51992-3-chunfeng.yun@mediatek.com>
 <CAATdQgBD+dTtBie-cNKRJbfxEpc3haqjfUu1k26mTk8pCSOEww@mail.gmail.com>
 <72ee7a203d8a49e6e43a954b45133470ee6d5c16.camel@mediatek.com>
In-Reply-To: <72ee7a203d8a49e6e43a954b45133470ee6d5c16.camel@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 27 Aug 2021 17:14:17 +0800
Message-ID: <CAATdQgA+4VC7J1LMZYOZMV-OTjMGjO=9bJZ7uaCu_MMF-20T1w@mail.gmail.com>
Subject: Re: [PATCH next v2 3/6] usb: xhci-mtk: update fs bus bandwidth by
 bw_budget_table
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?B?WWFxaWkgV3UgKOatpuS6muWlhyk=?= <Yaqii.Wu@mediatek.com>, 
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>, 
 =?UTF-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= <Eddie.Hung@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_021430_410779_BF5B8281 
X-CRM114-Status: GOOD (  33.45  )
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

T24gRnJpLCBBdWcgMjcsIDIwMjEgYXQgMjo0OSBQTSBDaHVuZmVuZyBZdW4gKOS6keaYpeWzsCkK
PENodW5mZW5nLll1bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMDIxLTA4LTI2
IGF0IDE5OjU0ICswODAwLCBJa2pvb24gSmFuZyB3cm90ZToKPiA+IEhpIENodW5mZW5nLAo+ID4K
PiA+IE9uIFRodSwgQXVnIDI2LCAyMDIxIGF0IDEwOjUyIEFNIENodW5mZW5nIFl1biA8Cj4gPiBj
aHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVXNlIEBid19idWRn
ZXRfdGFibGVbXSB0byB1cGRhdGUgZnMgYnVzIGJhbmR3aWR0aCBkdWUgdG8KPiA+ID4gbm90IGFs
bCBtaWNyb2ZyYW1lcyBjb25zdW1lIEBid19jb3N0X3Blcl9taWNyb2ZyYW1lLCBzZWUKPiA+ID4g
c2V0dXBfc2NoX2luZm8oKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVu
IDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gdjI6IG5ldyBwYXRj
aCwgbW92ZSBmcm9tIGFub3RoZXIgc2VyaWVzCj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy91c2Iv
aG9zdC94aGNpLW10ay1zY2guYyB8IDE3ICsrKysrKystLS0tLS0tLS0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGstc2NoLmMKPiA+ID4gYi9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktbXRrLXNjaC5jCj4gPiA+IGluZGV4IGNmZmNhZjRkZmE5Zi4uODNhYmQy
ODI2OWNhIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLXNjaC5j
Cj4gPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGstc2NoLmMKPiA+ID4gQEAgLTQ1
OCw4ICs0NTgsOCBAQCBzdGF0aWMgaW50IGNoZWNrX2ZzX2J1c19idyhzdHJ1Y3QKPiA+ID4gbXUz
aF9zY2hfZXBfaW5mbyAqc2NoX2VwLCBpbnQgb2Zmc2V0KQo+ID4gPiAgICAgICAgICAgICAgICAg
ICogQ29tcGFyZWQgd2l0aCBocyBidXMsIG5vIG1hdHRlciB3aGF0IGVwIHR5cGUsCj4gPiA+ICAg
ICAgICAgICAgICAgICAgKiB0aGUgaHViIHdpbGwgYWx3YXlzIGRlbGF5IG9uZSB1ZnJhbWUgdG8g
c2VuZAo+ID4gPiBkYXRhCj4gPiA+ICAgICAgICAgICAgICAgICAgKi8KPiA+ID4gLSAgICAgICAg
ICAgICAgIGZvciAoaiA9IDA7IGogPCBzY2hfZXAtPmNzX2NvdW50OyBqKyspIHsKPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgICAgdG1wID0gdHQtPmZzX2J1c19id1tiYXNlICsgal0gKyBzY2hf
ZXAtCj4gPiA+ID5id19jb3N0X3Blcl9taWNyb2ZyYW1lOwo+ID4gPiArICAgICAgICAgICAgICAg
Zm9yIChqID0gMDsgaiA8IHNjaF9lcC0+bnVtX2J1ZGdldF9taWNyb2ZyYW1lczsKPiA+ID4gaisr
KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHRtcCA9IHR0LT5mc19idXNfYndbYmFz
ZSArIGpdICsgc2NoX2VwLQo+ID4gPiA+YndfYnVkZ2V0X3RhYmxlW2pdOwo+ID4KPiA+IEknbSB3
b3JyeWluZyBhYm91dCB0aGlzIGNhc2Ugd2l0aCB0d28gZW5kcG9pbnRzLAo+ID4gKiBFUDFPVVQ6
IGlzb2Nocm9ub3VzLCBtYXhwYWNrZXQ9MTkyOiBid19idWRnZXRfdGFibGVbXSA9IHsgMTg4LCAx
ODgsCj4gPiAwLCAuLi4gfQo+ID4gKiBFUDJJTjogaW50ZXJydXB0LCBtYXhwYWNrZXQ9NjQ6IGJ3
X2J1ZGdldF90YWJsZVtdID0geyAwLCAwLCA2NCwgNjQsCj4gPiAuLi4gfQo+ID4gKElzIHRoaXMg
Y29ycmVjdCBid19idWRnZXRfdGFibGUgY29udGVudHMgZm9yIHRob3NlIGVwcz8pCj4gWWVzLCBl
cDFvdXQgaXNvYyB1c2UgdHdvIHVmcmFtZSwgZXAyaW4gaW50ciB1c2UgYSBleHRyYSBjczsKPiA+
Cj4gPiBJJ20gbm90IHN1cmUgaWYgaXQncyBva2F5IGZvciB0aG9zZSB0d28gZW5kcG9pbnRzIHRv
IGJlIGFsbG9jYXRlZAo+ID4gb24gdGhlIHNhbWUgdS1mcmFtZSBzbG90Lgo+ID4gQ2FuIHlvdSBw
bGVhc2UgY2hlY2sgaWYgdGhpcyBpcyBva2F5IGZvciB4aGNpLW10az8KPiBBbHJlYWR5IHRlc3Qg
aXQgdGhpcyBhZnRlcm5vb24sIGNhbiB0cmFuc2ZlciBkYXRhIHJpZ2h0bHkgb24gb3VyIGR2dAo+
IGVudi4KPgo+ID4gKEkgZmVlbCBsaWtlIEkgYWxyZWFkeSBhc2tlZCB0aGUgc2FtZSBxdWVzdGlv
bnMgbWFueSB0aW1lcy4pCj4gWWVzLCBhcyBzYWlkIGJlZm9yZSwgcHJlZmVyIHRvIHVzZSBid19i
dWRnZXRfdGFibGVbXSwgaWYgdGhlcmUgaXMKPiBpc3N1ZSwgd2UgY2FuIGZpeCBpdCBieSBidWls
ZGluZyB0aGlzIHRhYmxlLgoKU28gZG8geW91IG1lYW4gc3VjaCBhbiBhbGxvY2F0aW9uIHNob3Vs
ZG4ndCBiZSBhIHByb2JsZW0gYnkgSVAgZGVzaWduPwoKVGhpcyBwYXRjaCBzdGFydHMgdG8gYWxs
b3cgc3VjaCBhbiBhbGxvY2F0aW9uIChhZ2FpbikuCkJ1dCBpIHJlbWVtYmVyIG15IGVhcmxpZXIg
dGVzdHMgc2hvd2VkIHRoYXQgd2hlbiB0aG9zZSB0d28gZXBzCmluIHRoZSBhYm92ZSBleGFtcGxl
IGFyZSBhbGxvY2F0ZWQgb24gdGhlIHNhbWUgdS1mcmFtZSBzbG90LAp4aGNpLW10ayBwdXRzICJT
U1BMSVQgZm9yIEVQMiIgYmV0d2VlbgoiU1NQTElULXN0YXJ0IGFuZCBTU1BMSVQtZW5kIGZvciBF
UDFPVVQgdHJhbnNhY3Rpb24iLAp3aGljaCBpcyBhIHNwZWMgdmlvbGF0aW9uLiBIdWIgd2lsbCBn
ZW5lcmF0ZSBiaXQgc3R1ZmZpbmcgZXJyb3JzIG9uIHRoZQpmdWxsLXNwZWVkIGJ1cy4KCgo+Cj4g
VGhhbmtzCj4gPgo+ID4KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHRtcCA+IEZT
X1BBWUxPQURfTUFYKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAtRVNDSF9CV19PVkVSRkxPVzsKPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gQEAgLTUz
NCwyMSArNTM0LDE4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9zY2hfdHQoc3RydWN0Cj4gPiA+IG11
M2hfc2NoX2VwX2luZm8gKnNjaF9lcCwgYm9vbCB1c2VkKQo+ID4gPiAgewo+ID4gPiAgICAgICAg
IHN0cnVjdCBtdTNoX3NjaF90dCAqdHQgPSBzY2hfZXAtPnNjaF90dDsKPiA+ID4gICAgICAgICB1
MzIgYmFzZSwgbnVtX2VzaXQ7Cj4gPiA+IC0gICAgICAgaW50IGJ3X3VwZGF0ZWQ7Cj4gPiA+ICAg
ICAgICAgaW50IGksIGo7Cj4gPiA+Cj4gPiA+ICAgICAgICAgbnVtX2VzaXQgPSBYSENJX01US19N
QVhfRVNJVCAvIHNjaF9lcC0+ZXNpdDsKPiA+ID4KPiA+ID4gLSAgICAgICBpZiAodXNlZCkKPiA+
ID4gLSAgICAgICAgICAgICAgIGJ3X3VwZGF0ZWQgPSBzY2hfZXAtPmJ3X2Nvc3RfcGVyX21pY3Jv
ZnJhbWU7Cj4gPiA+IC0gICAgICAgZWxzZQo+ID4gPiAtICAgICAgICAgICAgICAgYndfdXBkYXRl
ZCA9IC1zY2hfZXAtPmJ3X2Nvc3RfcGVyX21pY3JvZnJhbWU7Cj4gPiA+IC0KPiA+ID4gICAgICAg
ICBmb3IgKGkgPSAwOyBpIDwgbnVtX2VzaXQ7IGkrKykgewo+ID4gPiAgICAgICAgICAgICAgICAg
YmFzZSA9IHNjaF9lcC0+b2Zmc2V0ICsgaSAqIHNjaF9lcC0+ZXNpdDsKPiA+ID4KPiA+ID4gLSAg
ICAgICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBzY2hfZXAtPmNzX2NvdW50OyBqKyspCj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgIHR0LT5mc19idXNfYndbYmFzZSArIGpdICs9IGJ3X3Vw
ZGF0ZWQ7Cj4gPiA+ICsgICAgICAgICAgICAgICBmb3IgKGogPSAwOyBqIDwgc2NoX2VwLT5udW1f
YnVkZ2V0X21pY3JvZnJhbWVzOwo+ID4gPiBqKyspCj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGlmICh1c2VkKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHR0LT5m
c19idXNfYndbYmFzZSArIGpdICs9IHNjaF9lcC0KPiA+ID4gPmJ3X2J1ZGdldF90YWJsZVtqXTsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZWxzZQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHR0LT5mc19idXNfYndbYmFzZSArIGpdIC09IHNjaF9lcC0KPiA+ID4g
PmJ3X2J1ZGdldF90YWJsZVtqXTsKPiA+ID4gICAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgICAg
aWYgKHVzZWQpCj4gPiA+IC0tCj4gPiA+IDIuMTguMAo+ID4gPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
