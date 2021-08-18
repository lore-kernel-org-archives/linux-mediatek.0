Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B15C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 02:44:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9C7261051
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 02:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9C7261051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwjbBQtlCIyWsZvFctE2soL2g7dsp2eU0ttj93UPwKA=; b=oRV6S0yl5cZD9P
	aDKfMcYGqTERGkKgJiuqWWI1OkhiSUWDiv4IjAx+h1SmEGbpz8kij3jELtysgflLSr8qfODLJ3miF
	AEMTPb18e9HoUsW9+e6XHQQpLFMqEfvFujDqgYFmNrtFHwMKj97MNy1Snn9U+nYCcK7C9aOStFmmD
	huMTLlBN5jZf5/fhDaI+qhp6xGCrlY3GlUpdK21Lm9NV0Ls11nC64DdALnOMJUQ0DsEAd16iiHXnU
	BkCYdaPt/Df4RaMjIQtDfqFg5C7AAwym5k2nOXVCNyUhbvqb8GpNJHWzw9EQINUsjZvxm8HFBzF9I
	L6lfNK0qS8ymFkyH6YGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGBYj-00401d-V0; Wed, 18 Aug 2021 02:44:06 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGBYN-003zoa-Js
 for linux-mediatek@lists.infradead.org; Wed, 18 Aug 2021 02:43:47 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso7972414pjb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Aug 2021 19:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IdX62Qy1ac9xod4fIunCnDc2laglCBN/1fg/fcapW7I=;
 b=G6tJIDNDlZydQbdTY2UVKCARnR0cLR1jeU/0tSmRwID/hjR9YhYy5LOmm5/F9bq1uW
 qfPDBB3+IufGPZoTw7UhHEeYTi7OMB7dSK9c5x7RHgdS71Ij/33jgOe1S/lda7Z6O8pQ
 L7LYM4eS0atmpRtU/sYu/tWSgx3FYDiNIA6X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IdX62Qy1ac9xod4fIunCnDc2laglCBN/1fg/fcapW7I=;
 b=nt84CFArrBlpuS4d18YIvM2YzkO3nNkhyCaGjnovLVMCkHagpPP6yLBc9mOygDoPzQ
 VFq3+rkQC1rfmHyv7jXKmlDYBDhcJ/dzu8t3v3lL5hwRybpCXXoqp8+taoi7rrajGLmw
 2Wuc6zfFSPIbDMZbeRNpuSyBmOFP4DFxUHGqvjC/R0rbOCDd7Ddp2CUUvweOWlXa6VYP
 ojHGUSSkj8aGha0yscTEEEROlz73LBR037PZQfTVdrFbbvmF7rOhEv7123Us+glcHZfZ
 MzKmqADPHKXyWXHb4I7+643SZF3pvy877+UtqOkOnMpgHCQWm5EJXMS5kuJojJPqqO6/
 ef3A==
X-Gm-Message-State: AOAM532RnZ3xOjgpGbrhmEGqqreAT4EXsNX0mi4a0D6MzYfsvcWy/4MS
 jorRV+t3HZIdXX2h/QK68FJ+sb1KH4DpxSfZvwq8Rw==
X-Google-Smtp-Source: ABdhPJwgboGY7D2y/Zi68e8tvtNReZvQqvGbrT7qKSNk+cE6BASGnMkYk2/EYNENuEnG5CXBjupeV5V6s5a3ZKXxDgU=
X-Received: by 2002:a17:90b:4905:: with SMTP id
 kr5mr6634228pjb.112.1629254616776; 
 Tue, 17 Aug 2021 19:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
 <YRDxTodNNqtnpPpn@kroah.com>
 <CAATdQgDSCzZtiDSQk94CYHfSb9Mq28OH7-RdaTZNv3oPrW3nkQ@mail.gmail.com>
 <7b48f4c132a8b4b3819282e961fbe8b3ed753069.camel@mediatek.com>
 <CAATdQgD1paUUmWhiLVq-+zq0V6=RTJw89ggk=R6cBUZO+5dB-Q@mail.gmail.com>
 <efcd999aaf83cf73ed2f4f4b9efa1bb93efd2523.camel@mediatek.com>
In-Reply-To: <efcd999aaf83cf73ed2f4f4b9efa1bb93efd2523.camel@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 18 Aug 2021 10:43:25 +0800
Message-ID: <CAATdQgC_aukAA3-=cuiOAQGzu_Ztvo4BsMbRv2hCGZpUeOAJVg@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: xhci-mtk: handle bandwidth table rollover
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_194343_682518_D33DB93B 
X-CRM114-Status: GOOD (  44.14  )
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

SGkgQ2h1bmZlbmcsCgpPbiBUaHUsIEF1ZyAxMiwgMjAyMSBhdCA3OjQ5IFBNIENodW5mZW5nIFl1
biAo5LqR5pil5bOwKQo8Q2h1bmZlbmcuWXVuQG1lZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBPbiBU
aHUsIDIwMjEtMDgtMTIgYXQgMTc6MzEgKzA4MDAsIElram9vbiBKYW5nIHdyb3RlOgo+ID4gSEks
Cj4gPgo+ID4gT24gV2VkLCBBdWcgMTEsIDIwMjEgYXQgNTowMiBQTSBDaHVuZmVuZyBZdW4gKOS6
keaYpeWzsCkKPiA+IDxDaHVuZmVuZy5ZdW5AbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gTW9uLCAyMDIxLTA4LTA5IGF0IDE3OjQyICswODAwLCBJa2pvb24gSmFuZyB3cm90ZToK
PiA+ID4gPiBPbiBNb24sIEF1ZyA5LCAyMDIxIGF0IDU6MTEgUE0gR3JlZyBLcm9haC1IYXJ0bWFu
Cj4gPiA+ID4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4g
PiA+ID4gPiBPbiBNb24sIEF1ZyAwOSwgMjAyMSBhdCAwNDo1OToyOVBNICswODAwLCBJa2pvb24g
SmFuZyB3cm90ZToKPiA+ID4gPiA+ID4geGhjaS1tdGsgaGFzIDY0IHNsb3RzIGZvciBwZXJpb2Rp
YyBiYW5kd2lkdGggY2FsY3VsYXRpb25zIGFuZAo+ID4gPiA+ID4gPiBlYWNoCj4gPiA+ID4gPiA+
IHNsb3QgcmVwcmVzZW50cyBieXRlIGJ1ZGdldHMgb24gYSBtaWNyb2ZyYW1lLiBXaGVuIGFuCj4g
PiA+ID4gPiA+IGVuZHBvaW50J3MKPiA+ID4gPiA+ID4gYWxsb2NhdGlvbiBzaXRzIG9uIHRoZSBi
b3VuZGFyeSBvZiB0aGUgdGFibGUsIGJ5dGUgYnVkZ2V0cycKPiA+ID4gPiA+ID4gc2xvdAo+ID4g
PiA+ID4gPiBzaG91bGQgYmUgcm9sbGVkIG92ZXIgYnV0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0
aW9uIGRvZXNuJ3QuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggYXBwbGllcyBh
IDYgYml0cyBtYXNrIHRvIHRoZSBtaWNyb2ZyYW1lIGluZGV4IHRvCj4gPiA+ID4gPiA+IGhhbmRs
ZQo+ID4gPiA+ID4gPiBpdHMgcm9sbG92ZXIgNjQgc2xvdHMgYW5kIHByZXZlbnQgb3V0LW9mLWJv
dW5kcyBhcnJheSBhY2Nlc3MuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IElram9vbiBKYW5nIDxpa2puQGNocm9taXVtLm9yZz4KPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktbXRrLXNjaC5jIHwgNzkgKysr
KysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ID4gPiA+IC0tLS0KPiA+ID4gPiA+ID4gLS0tLS0tLS0K
PiA+ID4gPiA+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1tdGsuaCAgICAgfCAgMSArCj4gPiA+
ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygt
KQo+ID4gPiA+ID4KPiA+ID4gPiA+IFdoeSBpcyB0aGlzICJSRkMiPyAgV2hhdCBuZWVkcyB0byBi
ZSBhZGRyZXNzZWQgaW4gdGhpcyBjaGFuZ2UKPiA+ID4gPiA+IGJlZm9yZSBpdAo+ID4gPiA+ID4g
Y2FuIGJlIGFjY2VwdGVkPwo+ID4gPiA+Cj4gPiA+ID4gc29ycnksIEkgaGFkIHRvIG1lbnRpb24g
d2h5IHRoaXMgaXMgUkZDOgo+ID4gPiA+Cj4gPiA+ID4gSSBzaW1wbHkgZG9uJ3Qga25vdyBhYm91
dCB0aGUgZGV0YWlscyBvZiB0aGUgeGhjaS1tdGsgaW50ZXJuYWxzLgo+ID4gPiA+IEl0IHdhcyBv
a2F5IGZyb20gbXkgdGVzdHMgd2l0aCBtdDgxNzMgYW5kIEkgdGhpbmsgdGhpcyB3aWxsIGJlCj4g
PiA+ID4gaGFybWxlc3MKPiA+ID4gPiBhcyB0aGlzIGlzICJiZXR0ZXIgdGhhbiBiZWZvcmUiLgo+
ID4gPiA+Cj4gPiA+ID4gQnV0IHdoZW4gSSByZW1vdmVkIGdldF9lc2l0X2JvdW5kYXJ5KCksIEkg
cmVhbGx5IGhhdmUgbm8gaWRlYSB3aHkKPiA+ID4gPiBpdCB3YXMgdGhlcmUuIEknbSB3b25kZXJp
bmcgaWYgdGhlcmUgd2FzIGFub3RoZXIgcmVhc29uIG9mIHRoYXQKPiA+ID4gPiBmdW5jdGlvbgo+
ID4gPiA+IG90aGVyIHRoYW4ganVzdCBwcmV2ZW50aW5nIG91dC1vZi1ib3VuZHMuIE1heWJlIGNo
dW5mZW5nIGNhbgo+ID4gPiA+IGFuc3dlcgo+ID4gPiA+IHRoaXM/Cj4gPiA+Cj4gPiA+IFdlIHVz
ZSBAZXNpdCB0byBwcmV2ZW50IG91dC1vZi1ib3VuZHMgYXJyYXkgYWNjZXNzLiBpdCdzIG5vdCBh
Cj4gPiA+IHJpbmcsCj4gPiA+IGNhbid0IGluc2VydCBvdXQtb2YtYm91bmRzIHZhbHVlIGludG8g
aGVhZCBzbG90Lgo+ID4KPiA+IFRoYW5rcywgc28gdGhhdCBmdW5jdGlvbiB3YXMgb25seSBmb3Ig
b3V0LW9mLWJvdW5kcyBhcnJheSBhY2Nlc3MuCj4gPiB0aGVuIEkgdGhpbmsgd2UganVzdCBjYW4g
cmVtb3ZlIHRoYXQgZnVuY3Rpb24gYW5kIHVzZSBpdCBhcyBhIHJpbmcuCj4gPiBDYW4geW91IHRl
bGwgbWUgX3doeV8gaXQgY2FuJ3QgYmUgdXNlZCBhcyBhIHJpbmc/Cj4gVHJlYXQgaXQgYXMgYSBw
ZXJpb2QsIHJvbGwgb3ZlciBzbG90IGVxdWFscyB0byBwdXQgaXQgaW50byB0aGUgbmV4dAo+IHBl
cmlvZC4KPgo+ID4KPiA+IEkgdGhpbmsgYSB0cmFuc2FjdGlvbiAoZS5nLiBlc2l0X2JvdW5kYXJ5
ID0gNykgY2FuIHN0YXJ0IGl0cyBmaXJzdAo+ID4gU1NQTElUCj4gPiBmcm9tIFlfNyAob2Zmc2V0
ID0gNykuIEJ1dCB3aWxsIHRoYXQgYWxsb2NhdGlvbiBiZSBtYXRjaGVkIHdpdGggdGhpcz8KPiA+
Cj4gPiAtICAgICAgICAgICAgICAgaWYgKChvZmZzZXQgKyBzY2hfZXAtPm51bV9idWRnZXRfbWlj
cm9mcmFtZXMpID4KPiA+IGVzaXRfYm91bmRhcnkpCj4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICBicmVhazsKPiA+Cj4gPiBJIG1lYW4gSSdtIG5vdCBzdXJlIHdoeSB0aGlzIGlzIG5lZWRlZC4K
PiBQcmV2ZW50IG91dC1vZi1ib3VuZHMuCgpJZiBpdCB3YXMgZm9yIHByZXZlbnRpbmcgZHJpdmVy
cyBmcm9tIG91dC1vZi1ib3VuZCBhcnJheSBhY2Nlc3MsCkkgY291bGRuJ3QgZmluZCBhbnkgcmVh
c29ucyB3aHkgd2UgY2Fubm90IHJlbW92ZSB0aGUgYWJvdmUgbGluZXMuClNvIGNhbiBJIGtub3cg
aWYgaXQgd2FzIGp1c3QgZm9yIHByZXZlbnRpbmcgeGhjaS1tdGsgZHJpdmVycyBmcm9tCm91dC1v
Zi1ib3VuZHMgYXJyYXkgYWNjZXNzPwoKSWYgeGhjaS1tdGsgSEMgaXRzZWxmIGNhbiBjb250aW51
ZSB0aGUgdHJhbnNhY3Rpb24gZnJvbSBZXzcgdG8gKFkrMSlfbjsKaW5jbHVkaW5nIHRoZSBjYXNl
IG9mIFk9PTYzLCBJIHRoaW5rIGl0J3MganVzdCBva2F5IHRvIHJvbGxvdmVyIHRvIChZKzEpLgoK
SWYgaXQncyBwcm9oaWJpdGVkIGJ5IHhoY2ktbXRrIGh3LCBvciBpZiB5b3UgdGhpbmsgdGhpcyBw
YXRjaCBpcyBub3QKYWxsb3dlZCBieSBhbnkgb3RoZXIgcmVhc29ucywgY2FuIHlvdSBwbGVhc2Ug
IHRlbGwgbWUgd2hhdApraW5kcyBvZiBwcm9ibGVtcyBjYW4gaGFwcGVuIHdpdGggdGhpcyBwYXRj
aD8KCk90aGVyd2lzZSwgcGxlYXNlIGNvbnNpZGVyIG1pbmltaXppbmcgdGhlIGJ3IGNvbnN0cmFp
bnRzIGZyb20KeGhjaS1tdGstc2NoIG9uIHlvdXIgc2lkZS4gTm90ZSB0aGF0IHdlJ3JlIHN0aWxs
IGhhdmluZyBvdGhlciB1c2IKYXVkaW8gaGVhZHNldHMgd2hpY2ggY2Fubm90IGJlIGNvbmZpZ3Vy
ZWQgd2l0aCB4aGNpLW10awpldmVuIHdpdGggdGhpcyBwYXRjaC4KClRoYW5rcy4KCj4KPiA+Cj4g
PiBVbnRpbCBub3csIEkgY291bGRuJ3QgZmluZCBhIHdheSB0byBhY2NlcHQgdGhlIFVTQiBhdWRp
byBoZWFkc2V0Cj4gPiB3aXRoIGEgY29uZmlndXJhdGlvbiBvZiB7IElOVC1JTiA2NCArIElTT0Mt
T1VUIDM4NCArIElTT0MtSU4gMTkyIH0KPiA+IHdpdGhvdXQgdGhpcyBwYXRjaC4KPiB3aGF0IGlz
IHRoZSBpbnRlcnZhbCB2YWx1ZSBvZiBlYWNoIGVuZHBvaW50Pwo+Cj4gPgo+ID4gPgo+ID4gPiA+
Cj4gPiA+ID4gVGhhbmtzIQo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gdGhhbmtzLAo+ID4g
PiA+ID4KPiA+ID4gPiA+IGdyZWcgay1oCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
