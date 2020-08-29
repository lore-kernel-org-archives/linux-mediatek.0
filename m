Return-Path: <SRS0=O+qu=CH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473C0C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 02:49:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12ED220838
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 02:49:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D3zoIBAP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vXfgIfPW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12ED220838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=flY8PxMGYOJmSHNecu/DNXWrLMCInI4SWEtYOnbhLsc=; b=D3zoIBAPh5+usmuFWbfYAc+nV
	2n1RAch2ACCB7dGWgSOFkQrsH110Xqo2JtE6Swnk/R8z198Dwif+PPfTodFfQo76nQTYCmCsrib3A
	xyVIL8Of+83dnE1lxGGnBYJWX05FNDaAH3SVn8TXeGvvGtF1W5S1Sn+6s3HsVEpqlNvIkXMdj2uGS
	pTLuO+V9x0+ctBC1cgOyDZmKH41dM1vpywPiRF5A2A1RLB8F2ISD7Pm18YEV8CEyR7FVdTXNuEmm/
	OYN1QOWRLeyS9RElOIBsxva7wXAQZkccGkLDvnpAw0emGw4HyWpM/wL84DGXIsUyj7IvHRFxK7dBn
	4OKj79dGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBqvt-0006h3-8t; Sat, 29 Aug 2020 02:49:33 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBqvo-0006g0-TY; Sat, 29 Aug 2020 02:49:29 +0000
Received: by mail-lj1-x241.google.com with SMTP id 185so913878ljj.7;
 Fri, 28 Aug 2020 19:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KoMQwFEPaswLm8CKgcgeVCNRZ6lXaOkK1BuoeMaYQB4=;
 b=vXfgIfPWzphWqHXx0xceNnHoQKfPjTCQY+vyfWFi0Javi2ObQEtAX5h3Ft9vfKVJJU
 voaoJpvNMzAAD54kZa0nwlC6OJ/oXaRtwwgyqQ/mvlR41yUdD7khlmDK2i5IobJEtFS3
 buHJvKWIFhbfyqsLfJiKrUHFw5JjIyrfhJim1DO8RrrkizqgSqkr4rKPj/YT+oQesW93
 gD0J09tUCxlUw2TLyyx683iBgqIdJP16UF2JAGdE0R/9ytSwigSBryjL7xfxUlkngRn5
 FHazbv0cHDIfEC8bYhghji2GqeTQLVyi3UjtC9wb/2HqjZGVEGQr5t+hKIMiqDgXMAcL
 W3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KoMQwFEPaswLm8CKgcgeVCNRZ6lXaOkK1BuoeMaYQB4=;
 b=pmAtwGwDGKUyrYXOODygXnCRqRb0ApTM/z2eRG4mCMMefJslWsNvLNVWmO1DC8NVzm
 4MtS0Qc21bWAORJbW9F6W98ayO1jDjUEp5l7761fyM7ijg16JYXiDr2xQQYImsnK2oTd
 FnmD9Oi8ct1CAXTLFmoBu1xg14weKJC/mwgorTFrB7h0KTp2nNKGHSydBeNQiYh5UXCg
 BPkmaAdg457IMmvqg7R1K15cZYzVC+gzvSMVGhl9zWn11PuspffjIVYpPZT4gMyD06Gv
 UcouWLykpK8Qv+1mgb5pgCuTc9cl9+vvFOOtxTbQi8x62V7wj4fihUfGq36p4MInBJp9
 xVSA==
X-Gm-Message-State: AOAM530BWyJq9c7AIIBxnnXjIcXu91Tc6yekjdYrc8ddqgwy3pxEnbL3
 ZRq1JypHYhk22AZp6orSADN0qwtENvm1Cf3SQbUKUFQVehc=
X-Google-Smtp-Source: ABdhPJy1/ipn3kbvfszOmswDzwCLNGRXtroxaeXb4NPsRrn9sEN3gbYygMXJIxlSJgPh2sXI7MR+fNEpGiNUxdvzSxs=
X-Received: by 2002:a2e:2c0e:: with SMTP id s14mr735843ljs.28.1598669362724;
 Fri, 28 Aug 2020 19:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <1598610636-4939-1-git-send-email-u0084500@gmail.com>
 <1598610636-4939-2-git-send-email-u0084500@gmail.com>
 <20200828220520.GA3482472@bogus>
 <CADiBU3-pd7nvtf2_1ssYVLQc4HOHX6PUyyx6GiJ_gH-4DaGmog@mail.gmail.com>
In-Reply-To: <CADiBU3-pd7nvtf2_1ssYVLQc4HOHX6PUyyx6GiJ_gH-4DaGmog@mail.gmail.com>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Sat, 29 Aug 2020 10:49:10 +0800
Message-ID: <CADiBU39P7jeSOV2_GcXh6A=b8SCViURCsS8SZFmy+oY2hS74tg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb typec: mt6360: Add MT6360 Type-C DT binding
 documentation
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_224929_058979_9194DAA9 
X-CRM114-Status: GOOD (  24.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2hpWXVhbiBIdWFuZyA8dTAwODQ1MDBAZ21haWwuY29tPiDmlrwgMjAyMOW5tDjmnIgyOeaXpSDp
gLHlha0g5LiK5Y2IODozMuWvq+mBk++8mgo+Cj4gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4g5pa8IDIwMjDlubQ45pyIMjnml6Ug6YCx5YWtIOS4iuWNiDY6MDXlr6vpgZPvvJoKPiA+Cj4g
PiBPbiBGcmksIEF1ZyAyOCwgMjAyMCBhdCAwNjozMDozNlBNICswODAwLCBjeV9odWFuZyB3cm90
ZToKPiA+ID4gRnJvbTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPiA+
Cj4gPiA+IEFkZCBhIGRldmljZXRyZWUgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUgTVQ2
MzYwIFR5cGUtQyBkcml2ZXIuCj4gPiA+Cj4gPiA+IHVzYiB0eXBlYzogbXQ2MzYwOiBSZW5hbWUg
RFQgYmluZGluZyBkb3VtZW50IGZyb20gbXQ2MzYwIHRvIG10NjM2eAo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICAuLi4vYmluZGluZ3MvdXNiL21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwgICAgICAg
ICB8IDczICsrKysrKysrKysrKysrKysrKysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3MyBp
bnNlcnRpb25zKCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3VzYi9tZWRpYXRlayxtdDYzNjAtdGNwYy55YW1sCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlh
dGVrLG10NjM2MC10Y3BjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
dXNiL21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+ID4gaW5kZXggMDAwMDAwMDAuLjllOGFiMGQKPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL21lZGlhdGVrLG10NjM2
MC10Y3BjLnlhbWwKPiA+ID4gQEAgLTAsMCArMSw3MyBAQAo+ID4gPiArIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ICslWUFNTCAx
LjIKPiA+ID4gKy0tLQo+ID4gPiArJGlkOiAiaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
dXNiL21lZGlhdGVrLG10NjM2MC10Y3BjLnlhbWwjIgo+ID4gPiArJHNjaGVtYTogImh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIyIKPiA+ID4gKwo+ID4gPiArdGl0
bGU6IE1lZGlhdGVrIE1UNjM2MCBUeXBlLUMgUG9ydCBTd2l0Y2ggYW5kIFBvd2VyIERlbGl2ZXJ5
IGNvbnRyb2xsZXIgRFQgYmluZGluZ3MKPiA+ID4gKwo+ID4gPiArbWFpbnRhaW5lcnM6Cj4gPiA+
ICsgIC0gQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPiA+ICsKPiA+ID4g
K2Rlc2NyaXB0aW9uOiB8Cj4gPiA+ICsgIE1lZGlhdGVrIE1UNjM2MCBpcyBhIG11bHRpLWZ1bmN0
aW9uYWwgZGV2aWNlLiBJdCBpbnRlZ3JhdGVzIGNoYXJnZXIsIEFEQywgZmxhc2gsIFJHQiBpbmRp
Y2F0b3JzLAo+ID4gPiArICByZWd1bGF0b3JzIChCVUNLcy9MRE9zKSwgYW5kIFR5cGVDIFBvcnQg
U3dpdGNoIHdpdGggUG93ZXIgRGVsaXZlcnkgY29udHJvbGxlci4KPiA+ID4gKyAgVGhpcyBkb2N1
bWVudCBvbmx5IGRlc2NyaWJlcyBNVDYzNjAgVHlwZS1DIFBvcnQgU3dpdGNoIGFuZCBQb3dlciBE
ZWxpdmVyeSBjb250cm9sbGVyLgo+ID4gPiArCj4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiArICBj
b21wYXRpYmxlOgo+ID4gPiArICAgIGVudW06Cj4gPiA+ICsgICAgICAtIG1lZGlhdGVrLG10NjM2
MC10Y3BjCj4gPiA+ICsKPiA+ID4gKyAgaW50ZXJydXB0cy1leHRlbmRlZDoKPiA+Cj4gPiBVc2Ug
J2ludGVycnVwdHMnLiBUaGUgdG9vbGluZyB3aWxsIGF1dG9tYXRpY2FsbHkgc3VwcG9ydAo+ID4g
J2ludGVycnVwdHMtZXh0ZW5kZWQnLgo+IE9rYXkuCj4gPgo+ID4gPiArICAgIG1heEl0ZW1zOiAx
Cj4gPiA+ICsKPiA+ID4gKyAgaW50ZXJydXB0LW5hbWVzOgo+ID4gPiArICAgIGl0ZW1zOgo+ID4g
PiArICAgICAgLSBjb25zdDogUERfSVJRQgo+ID4gPiArCj4gPiA+ICtwYXR0ZXJuUHJvcGVydGll
czoKPiA+ID4gKyAgImNvbm5lY3RvciI6Cj4gPiA+ICsgICAgdHlwZTogb2JqZWN0Cj4gPiA+ICsg
ICAgJHJlZjogLi4vY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbCMKPiA+ID4gKyAgICBkZXNj
cmlwdGlvbjoKPiA+ID4gKyAgICAgIFByb3BlcnRpZXMgZm9yIHVzYiBjIGNvbm5lY3Rvci4KPiA+
ID4gKwo+ID4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiA+ICsKPiA+ID4gK3Jl
cXVpcmVkOgo+ID4gPiArICAtIGNvbXBhdGlibGUKPiA+ID4gKyAgLSBpbnRlcnJ1cHRzLWV4dGVu
ZGVkCj4gPiA+ICsgIC0gaW50ZXJydXB0LW5hbWVzCj4gPiA+ICsKPiA+ID4gK2V4YW1wbGVzOgo+
ID4gPiArICAtIHwKPiA+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvaXJxLmg+Cj4gPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3VzYi9wZC5o
Pgo+ID4gPiArICAgIGkyYzAgewo+ID4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsK
PiA+ID4gKyAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAg
bXQ2MzYwQDM0IHsKPiA+ID4gKyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2
MzYwIjsKPiA+ID4gKyAgICAgICAgICAgIHJlZyA9IDwweDM0PjsKPiA+ID4gKwo+ID4gPiArICAg
ICAgICAgICAgdGNwYyB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRp
YXRlayxtdDYzNjAtdGNwYyI7Cj4gPiA+ICsgICAgICAgICAgICAgICAgaW50ZXJydXB0cy1leHRl
bmRlZCA9IDwmZ3BpbzI2IDMgSVJRX1RZUEVfTEVWRUxfTE9XPjsKPiA+ID4gKyAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtbmFtZXMgPSAiUERfSVJRQiI7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAg
ICAgICAgICBjb25uZWN0b3Igewo+ID4KPiA+IFdoZXJlJ3MgdGhlIGRhdGEgY29ubmVjdGlvbnM/
IFRoZSBhc3N1bXB0aW9uIG9mIHRoZSBiaW5kaW5nIGlzIHRoZSBVU0IKPiA+ICgyIGFuZCAzKSBj
b25uZWN0aW9ucyBjb21lIGZyb20gdGhlIHBhcmVudCBpZiB0aGVyZSdzIG5vIGdyYXBoIHRvIHRo
ZQo+ID4gVVNCIGNvbnRyb2xsZXIocykuCj4gTVQ2MzYwIGlzIG9ubHkgYSBzdWJwbWljLiBUeXBl
QyBwYXJ0IG9ubHkgaGFuZGxlIHRoZSBDQyBsb2dpYyB0byBzdXBwb3J0IFVTQlBELgo+IEZvciB0
aGUgdXNiIGNvbm5lY3Rpb24gbGlrZSBhcyB1c2Jocy91c2JzcywgIGl0IG5lZWQgdG8gYmUgaGFu
ZGxlZAo+IGJ5L2Nvbm5lY3QgdG8gYXBwbGljYXRpb24gcHJvY2Vzc29yIHNpZGUuCj4gTElrZSBh
cyBjb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sIGRlY3JpYmVkLCBpdCAgc3BlY2lmeSB0aGUg
cG9ydAo+IHByb3BlcnR5IHRvIGJpbmQgVVNCIEhTL1NTLgo+CkRvIGkgbmVlZCB0byBhZGQgdGhl
IHBvcnRzIGludG8gdGhlIGNvbm5lY3RvciBub2RlIGZvciBleGFtcGxlPwpMaWtlIGFzIGhzL3Nz
L2F1eCwgdG8gbWFrZSB0aGUgdXNlciBrbm93IHRvIHVzZSA2MzYwJ3MgdGNwYz8KCkkgY2hlY2sg
dGhlICBzdHlsZSBpbiBjb25uZWN0b3IvdXNiLWNvbm5lY3QueWFtbApEbyBJIGFsc28gbmVlZCB0
byByZXBsYWNlIHR3byBzcGFjZSBpbnN0ZWFkIG9mIG9uZSB0YWIgaW4gdGhlIGJpbmRpbmcgZXhh
bXBsZT8KCj4gPgo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ1
c2ItYy1jb25uZWN0b3IiOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAi
VVNCLUMiOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgZGF0YS1yb2xlID0gImR1YWwi
Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItcm9sZSA9ICJkdWFsIjsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIHRyeS1wb3dlci1yb2xlID0gInNpbmsiOwo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgc291cmNlLXBkb3MgPSA8UERPX0ZJWEVEKDUwMDAs
IDEwMDAsIFBET19GSVhFRF9EVUFMX1JPTEUgfCBQRE9fRklYRURfREFUQV9TV0FQKT47Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICBzaW5rLXBkb3MgPSA8UERPX0ZJWEVEKDUwMDAsIDIw
MDAsIFBET19GSVhFRF9EVUFMX1JPTEUgfCBQRE9fRklYRURfREFUQV9TV0FQKT47Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICBvcC1zaW5rLW1pY3Jvd2F0dCA9IDwxMDAwMDAwMD47Cj4g
PiA+ICsgICAgICAgICAgICAgICAgfTsKPiA+ID4gKyAgICAgICAgICAgIH07Cj4gPiA+ICsgICAg
ICAgIH07Cj4gPiA+ICsgICAgfTsKPiA+ID4gKy4uLgo+ID4gPiAtLQo+ID4gPiAyLjcuNAo+ID4g
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
