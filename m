Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3378C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 13:05:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA76206FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 13:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OgvFgFAU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FA76206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CU1VGJxTWjm9IgPKvU4Tht2GUUgLfNJMkgRU8cgVlD0=; b=OgvFgFAUMgy0hZvp8+GrfO5h3
	QmcWXgTJ/B4bzQF2twpCp2Et7h+FashJcG7nwj3uLPqsZNxpEvm2cTp6QBp4Q1d5oNuzPwTtJRoOA
	27dAJVMQxWcsMfpOzVxqeR0H8XKiuty/dLZicRGm7g5+BZEkfVy8kdtOSv5Pd7BFToQ0Us29ENaZE
	krtjKqI8IwXbSOm4k+Sd4Sczl/NkMhjZKJrfimfcbaHTtsSTMvfaANX13FmYk0h/TeMmjUhWUEZdU
	p70QdIJgG5Nzri3At7ldeLqgQO1sgkoSv2eu5WUlmtpMLxB9gKNOV/oNJY1eXhraEI5ar/NHgzK8R
	rYIJN8vQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1UiW-0001Gl-OI; Fri, 31 Jul 2020 13:04:56 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1UiS-0001Fo-P6; Fri, 31 Jul 2020 13:04:54 +0000
IronPort-SDR: 7vOGHe7MOg/xmY9WKENRbcdDSf8KUx7RM/jwFoIWLX18UhYRUh9qrkkm85EoUeAUYBssbDqncG
 9wHjKkyg2R8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="152978763"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="152978763"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 06:04:47 -0700
IronPort-SDR: BV4PrmgP4QayPcm53AoSQENgtQldCvhr/WEKkSIc3D1bkW4PeF5XWS1oDAs0JpwfdLFHf+hxi7
 5jo7bnqRX4kA==
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="329238685"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 06:04:42 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 0D12E20722; Fri, 31 Jul 2020 16:04:41 +0300 (EEST)
Date: Fri, 31 Jul 2020 16:04:41 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [SPAM]Re: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Message-ID: <20200731130440.GP13316@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200701091618.GN16711@paasikivi.fi.intel.com>
 <bf610d1b13c74656b2ffeeb9cc2a96ac@MTKMBS31N1.mediatek.inc>
 <20200701134416.GQ16711@paasikivi.fi.intel.com>
 <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
 <20200702053449.GR16711@paasikivi.fi.intel.com>
 <1593687965.17166.73.camel@mhfsdcap03>
 <20200730163930.GI13316@paasikivi.fi.intel.com>
 <1596163482.17576.25.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596163482.17576.25.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_090453_082963_DA0607E0 
X-CRM114-Status: GOOD (  40.96  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 Sj Huang =?utf-8?B?KOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Louis Kuo =?utf-8?B?KOmDreW+t+Wvpyk=?= <louis.kuo@mediatek.com>,
 "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Erin Lo =?utf-8?B?KOe+hembhem9oSk=?= <erin.lo@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RG9uZ2NodW4sCgpPbiBGcmksIEp1bCAzMSwgMjAyMCBhdCAxMDo0NDo0MkFNICswODAwLCBEb25n
Y2h1biBaaHUgd3JvdGU6Cj4gSGkgU2FrYXJpLAo+IAo+IE9uIFRodSwgMjAyMC0wNy0zMCBhdCAx
OTozOSArMDMwMCwgU2FrYXJpIEFpbHVzIHdyb3RlOgo+ID4gRG9uZ2NodW4sCj4gPiAKPiA+IE9u
IFRodSwgSnVsIDAyLCAyMDIwIGF0IDA3OjA2OjA1UE0gKzA4MDAsIERvbmdjaHVuIFpodSB3cm90
ZToKPiA+ID4gSGkgU2FrYXJpLAo+ID4gPiAKPiA+ID4gU29ycnkgSSBqdXN0IHNlbnQgZW1haWwg
dXNpbmcgb3V0bG9vayB3aGVyZSBkZWZhdWx0IGZvcm1hdCBpcyBIVE1MLCBub3cKPiA+ID4gSSB1
c2UgZXZvbHV0aW9uLCBvbmUgTGludXggbWFpbCBjbGllbnQgdGhhdCBJIHVzZWQgdG8gc2VuZCB1
cHN0cmVhbQo+ID4gPiBwYXRjaCBwcmV2aW91c2x5Lgo+ID4gPiAKPiA+ID4gT24gVGh1LCAyMDIw
LTA3LTAyIGF0IDA4OjM0ICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gPiA+ID4gRG9uZ2No
dW4sCj4gPiA+ID4gCj4gPiA+ID4gUGxlYXNlIGRvbid0IHNlbmQgSFRNTCBlLW1haWwgdG8gTGlu
dXgga2VybmVsIHJlbGF0ZWQgbWFpbGluZyBsaXN0cy4KPiA+ID4gPiAKPiA+ID4gPiBPbiBUaHUs
IEp1bCAwMiwgMjAyMCBhdCAwMzo0ODo1NkFNICswMDAwLCBEb25nY2h1biBaaHUgKOacseS4nOaY
pSkgd3JvdGU6Cj4gPiA+ID4gPiAgSGkgU2FrYXJpLAo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgU29y
cnkgdG8gYm90aGVyIHlvdSBhZ2FpbiwgYnV0IEkgYW0gc28gY29uZnVzZWQgYWJvdXQgdGhlIHF1
ZXN0aW9ucyB5b3UgcmFpc2VkLgo+ID4gPiA+ID4gIEkganVzdCBzeW5jZWQgbWFpbmxpbmU6IDUu
OC1yYzMgdGFyYmFsbCBmcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvLCBvbiB3aGljaCBJIHJh
biB0aGUgZ2l0IGFtIDxwYXRjaD4gY29tbWFuZC4KPiA+ID4gPiA+ICBUaGUgcGF0Y2gtYXBwbHlp
bmcgcHJvY2VzcyBzaG93cyBubyBlcnJvci4KPiA+ID4gPiA+ICAtLS0tLS0tLS0tLS0tLS0tLTg8
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+ID4gIFttdGsxNTAxM0BtdGtzbHQzMDcgbGludXhd
JGdpdCBhcHBseSAtLWNoZWNrIG1lZGlhLWkyYy1BZGQtc3VwcG9ydC1mb3ItRFc5NzY4LVZDTS5w
YXRjaAo+ID4gPiA+ID4gIFttdGsxNTAxM0BtdGtzbHQzMDcgbGludXhdJGdpdCBhbSBtZWRpYS1p
MmMtQWRkLXN1cHBvcnQtZm9yLURXOTc2OC1WQ00ucGF0Y2gKPiA+ID4gPiA+ICBBcHBseWluZzog
bWVkaWE6IGR0LWJpbmRpbmdzOiBtZWRpYTogaTJjOiBEb2N1bWVudCBEVzk3NjggYmluZGluZ3MK
PiA+ID4gPiA+ICBBcHBseWluZzogbWVkaWE6IGkyYzogZHc5NzY4OiBBZGQgRFc5NzY4IFZDTSBk
cml2ZXIKPiA+ID4gPiA+ICAtLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gPiA+ID4gCj4gPiA+ID4gPiAgT24gdGhlIG90aGVyIGhhbmQsIEkgYWxzbyBjb21wYXJlZCBk
b25nd29vbixkdzk3NjgueWFtbCBmaWxlIHdpdGggb3RoZXIgbWVkaWEgZGV2aWNlIGR0LWJpbmRp
bmdzKGxpa2UgaW14MjE5LnlhbWwgYW5kIG92ODg1Ni55YW1sKS4KPiA+ID4gPiA+ICBJdCBzZWVt
cyB0aGVyZSBhcmUgbm8gYXBwYXJlbnQgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGVtLgo+ID4gPiA+
ID4gIEVzcGVjaWFsbHksIHRoZSBzZW50ZW5jZSAnIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKScgc2hhbGwgYmUgY29tbW9uLgo+ID4gPiA+ID4gIEkg
ZHVubm8gd2h5IGhlcmUgZG9uZ3dvb24sZHc5NzY4LnlhbWwgcmVwb3J0cyB0cmFpbGluZyB3aGl0
ZXNwYWNlIHdhcm5pbmdzIHdoaWxlIG92ODg1Ni55YW1sIGlzIHNpbGVudC4KPiA+ID4gPiA+IAo+
ID4gPiA+ID4gIEZvciB0aGUgcGF0Y2ggZmFpbGVkIG9uIE1BSU5UQUlORVJTLCBJIGFtIHN0aWxs
IGN1cmlvdXMgd2hhdCdzIHdyb25nLgo+ID4gPiA+ID4gIEluIGZhY3QsIEkgbG9jYWxseSBoYXZl
IHJ1biBwYXJzZS1tYWludGFpbmVycy5wbCBzY3JpcHQgdG8gY2hlY2sgTUFJTlRBSU5FUlMgZmls
ZSBiZWZvcmUgc3VibWl0dGluZyBwYXRjaC4KPiA+ID4gPiA+ICBUaGUgcmVzdWx0IGFsc28gcmVw
b3J0cyBubyBlcnJvcnMuCj4gPiA+ID4gPiAgLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0t
LS0tLS0tLS0KPiA+ID4gPiA+ICBbbXRrMTUwMTNAbXRrc2x0MzA3IGxpbnV4XSRwZXJsIHNjcmlw
dHMvcGFyc2UtbWFpbnRhaW5lcnMucGwKPiA+ID4gPiA+ICBbbXRrMTUwMTNAbXRrc2x0MzA3IGxp
bnV4XSRscwo+ID4gPiA+ID4gIC0tLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICBBcyB0byBCYXNlNjQgZW5jb2RpbmcsIEkgY2hlY2tlZCBl
YWNoIHBhdGNoIGZpbGUgYWdhaW4uIFRoZXkgYXJlIGFsbCBlbmNvZGVkIGluIFVURi04Lgo+ID4g
PiA+ID4gIEFzIGh0dHBzOi8vd3d3LmJhc2U2NGVuY29kZS5vcmcvIHNheXMsIGZvciBhbiBleGFt
cGxlLCAnNzcnIGluIEFTQ0lJIGZvcm1hdCB3b3VsZCBiZSBjaGFuZ2VkIHRvICdUJyBpbiBCYXNl
ZDY0LWVuY29kZWQgZm9ybWF0Lgo+ID4gPiA+ID4gIFRoaXMgbWVhbnMgdGhlcmUgc2hhbGwgYmUg
bWVzc3kgY29kZSBpZiB3ZSBhZHBvdGluZyBCYXNlZDY0LWVuY29kZWQgZm9ybWF0Lgo+ID4gPiA+
ID4gIEJ1dCBJIGNhbm5vdCBzZWUgZ2FyYmxlZCBtZXNzYWdlcyBpbiB0aGUgY3VycmVudCBwYXRj
aGVzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiAgVGhlIERXOTc2OCBzZXJpYWxzLXBhdGNoIGlzIGF0
dGFjaGVkLgo+ID4gPiA+ID4gIEBUb21hc3ogQEFuZHkgQFJvYiBjb3VsZCBhbnlvbmUgaGVscCB0
cnkgdG8gc2VlIHdoZXRoZXIgdGhlIHBhdGNoIGNhbiBiZSBjaGVycnktcGlja2VkIG9uIExpbnV4
IG1hc3RlciBicmFuY2ggb3Igbm90Pwo+ID4gPiA+ID4gIFBhdGNod29yayBsaW5rOgo+ID4gPiA+
ID4gIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTE2MzMyOTEvCj4gPiA+ID4g
Cj4gPiA+ID4gQm90aCBvZiB0aGUgcGF0Y2hlcyBhcHBlYXIgdG8gY29udGFpbiBvbmx5IEFTQ0lJ
IGNoYXJhY3RlcnMuCj4gPiA+ID4gCj4gPiA+ID4gSSBkaWQgc29tZSByZXNlYXJjaCBvbiB0aGlz
LiBJdCBzZWVtcyB0aGF0IHRoZSBiYXNlNjQgZW5jb2RlZCBtZXNzYWdlIGJvZHkKPiA+ID4gPiBk
b2VzIGhhdmUgY2FycmlhZ2UgcmV0dXJucywgaW4gYm90aCBjYXNlcy4gR2l0IGFtIGRvZXMgbm90
IGF0dGVtcHQgdG8KPiA+ID4gPiByZW1vdmUgdGhlbSBpbiB0aGF0IGNhc2UsIGJ1dCBQYXRjaHdv
cmsgZG9lcy4gSGVuY2UgdGhlIGZpbGVzIGFyZSBmaW5lIGlmCj4gPiA+ID4geW91IGRvd25sb2Fk
IHRoZW0gZnJvbSBQYXRjaHdvcmsgLS0tIHdoZXJlIHRoZSBtYm94IGZpbGVzIGhhdmUgbmVpdGhl
cgo+ID4gPiA+IGNhcnJpYWdlIHJldHVybnMgbm9yIGJhc2U2NCBlbmNvZGluZy4KPiA+ID4gPiAK
PiA+ID4gPiBXaGF0IGRvZXMgdGhlIGZpbGUgY29tbWFuZCBzYXkgYWJvdXQgdGhlIHBhdGNoIGZp
bGVzIHByb2R1Y2VkIGJ5IGdpdAo+ID4gPiA+IGZvcm1hdC1wYXRjaD8gTXkgZ3Vlc3MgaXMgdGhh
dCBzb21ldGhpbmcgaW4gYmV0d2VlbiB5b3VyIGxvY2FsIGNvbXB1dGVyIGFuZAo+ID4gPiA+IExN
TUwgKGFuZCBvdGhlciBtYWlsIHNlcnZlcnMpIGJhc2U2NCBlbmNvZGVzIHRoZSBtZXNzYWdlIGJv
ZHkuIEJ1dCB3aGVyZQo+ID4gPiA+IGFyZSB0aGUgY2FycmlhZ2UgcmV0dXJucyBhZGRlZD8gTmV2
ZXJ0aGVsZXNzIHRoZXkgc2VlbSB0byBiZSBhZGRlZCBiZWZvcmUKPiA+ID4gPiB0aGUgYmFzZTY0
IGNvbnZlcnNpb24uCj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBIbS4uLiBJIHVzZWQgdGhlIGZpbGUg
Y29tbWFuZCB0byBjaGVjayB0aGUgZGlmZiBwYXRjaCBnZW5lcmF0ZWQgZnJvbSBnaXQKPiA+ID4g
Zm9ybWF0LXBhdGNoIGFuZCB0aGF0IGRvd25sb2FkZWQgZnJvbSBQYXRjaHdvcmssIHRoZXkgYXJl
IGJvdGggQVNDSUkKPiA+ID4gdGV4dC4KPiA+IAo+ID4gVGhhdCdzIGJlY2F1c2UgUGF0Y2h3b3Jr
IGFwcGVhcnMgdG8gYmUgcmVtb3ZpbmcgdGhlIGNhcnJpYWdlIHJldHVybnMuIGdpdAo+ID4gZG9l
cyBub3QgaWYgdGhlIGNvbnRlbnQgaXMgYmFzZTY0IGVuY29kZWQuCj4gPiAKPiA+IFlvdXIgZS1t
YWlsIHNldHVwIHNpbXBseSBhcHBlYXJzIHRvIGJlIGJyb2tlbi4gSSdkIHN1Z2dlc3QgdHJ5aW5n
IHRvIHNlbmQKPiA+IHRoZSBwYXRjaGVzIGVuY29kZWQgaW4gYmFzZTY0IGFzIGEgd29ya2Fyb3Vu
ZC4gZ2l0IHNlbmQtZW1haWwgdXNlcwo+ID4gc2VuZGVtYWlsLnRyYW5zZmVyRW5jb2RpbmcgY29u
ZmlndXJhdGlvbiBvcHRpb24gZm9yIHRoaXMuCj4gPiAKPiAKPiBJIGNoZWNrZWQgbXkgbG9jYWwg
Z2l0IGNvbmZpZ3VyYXRpb24gYnkgdXNpbmcgImdpdCBjb25maWcgLS1saXN0IiwgaXQKPiBzZWVt
cyB0aGUgInNlbmRlbWFpbC50cmFuc2ZlckVuY29kaW5nIiBjb25maWd1cmF0aW9uIHZhcmlhYmxl
IGlzIG5vdAo+IHNldCwgYWxzbyAiZ2l0IHNlbmQtZW1haWwgLS10cmFuc2Zlci1lbmNvZGluZyIg
aXMgbm90IHNldCB3aGVuCj4gc3VibWl0dGluZyBwYXRjaC4KPiAKPiBGcm9tIG15IHVuZGVyc3Rh
bmRpbmcsIGlmIGJvdGggdGhlIG9wdGlvbiAiLS10cmFuc2Zlci1lbmNvZGluZz14eHgiIGFuZAo+
IHRoZSBjb25maWd1cmF0aW9uIHZhbHVlICJzZW5kZW1haWwudHJhbnNmZXJFbmNvZGluZyIgYXJl
IHVuc3BlY2lmaWVkLAo+IHRoZSB0cmFuc2ZlciBlbmNvZGluZyB0byBiZSB1c2VkIHRvIHNlbmQg
dGhlIG1lc3NhZ2Ugb3ZlciBTTVRQIG1heSBiZQo+ICJhdXRvIi4KPiAKPiBEaWQgeW91IG1lYW4g
ZG9pbmcgYW4gZXhwZXJpbWVudCBieSBlbmFibGluZyAiYmFzZTY0IiBjb25maWcgZm9yCj4gdHJh
bnNmZXIgZW5jb2RpbmcgYXMgYmVsb3c/Cj4gImdpdCBjb25maWcgLS1nbG9iYWwgc2VuZGVtYWls
LnRyYW5zZmVyRW5jb2RpbmcgYmFzZTY0IiBvcgo+ICJnaXQgc2VuZC1lbWFpbCAtLXRyYW5zZmVy
LWVuY29kaW5nPWJhc2U2NCIKClBsZWFzZSB0cnkgdGhhdC4KCkFsdGVybmF0aXZlbHkgeW91IGNv
dWxkIHRyeSBoYXZpbmcgeW91ciBtYWlsIHNlcnZlcnMgZml4ZWQuCgotLSAKS2luZCByZWdhcmRz
LAoKU2FrYXJpIEFpbHVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
