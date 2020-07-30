Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47675C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 16:39:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14527206F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 16:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ze46WdUf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14527206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D9QNWyRFp0hpDBelVJbYw9tAxKtD1kojZWGrTqmSGbk=; b=ze46WdUf2bSo5xYeL1gHBo8Ni
	4jcl6eHbsV/Dw7RNCtbYljrBbJ+9ceZAtafKjG7QlksrNck7v5bpNkbtwCI6oFxdkQm6hPdrZOmFP
	zUTPxG25dV1svbhTKhhhd8quF4HXQHyLpn0KLkQ3EwuTSqJQ9h6cgAfwL/3+kc4K73KCAFs+Gvi00
	fm4dTeMdCKZaTU35Itqr8AN67g2vQFZUAFRktyQ5G9512t5jWTC8YsZfqGv56qbsXYdeCMjRXkejt
	0xwV16MfI5gm052/06W4lksRNQAi0uGLP00y2LSGn7/zgle416h0cG5hwwCyLEZdY28fydo+/q+bc
	YN3EoIPYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Baq-0004cf-Pf; Thu, 30 Jul 2020 16:39:44 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Bam-0004af-PU; Thu, 30 Jul 2020 16:39:41 +0000
IronPort-SDR: qor8ZZ4efIhskdM1SEwBaxRZ2WffcyrVweqgFWmNkFMi7BUmdrVSE2hunoMqE77UzmNsXjE3Lt
 fK+BB8e8HZIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="152858230"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="152858230"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:39:36 -0700
IronPort-SDR: PsEBQvVtGv0M4qfCmFcKV+OzUhOlQ/04jIXu2ut0cH6bu36+jdy53PJSyoG+VdG4PjRCrddlZO
 mCCXa1d+kA2Q==
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="274255880"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:39:32 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 30F4820399; Thu, 30 Jul 2020 19:39:30 +0300 (EEST)
Date: Thu, 30 Jul 2020 19:39:30 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Message-ID: <20200730163930.GI13316@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200701091618.GN16711@paasikivi.fi.intel.com>
 <bf610d1b13c74656b2ffeeb9cc2a96ac@MTKMBS31N1.mediatek.inc>
 <20200701134416.GQ16711@paasikivi.fi.intel.com>
 <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
 <20200702053449.GR16711@paasikivi.fi.intel.com>
 <1593687965.17166.73.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593687965.17166.73.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_123940_978747_40EF8AD6 
X-CRM114-Status: GOOD (  34.64  )
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

RG9uZ2NodW4sCgpPbiBUaHUsIEp1bCAwMiwgMjAyMCBhdCAwNzowNjowNVBNICswODAwLCBEb25n
Y2h1biBaaHUgd3JvdGU6Cj4gSGkgU2FrYXJpLAo+IAo+IFNvcnJ5IEkganVzdCBzZW50IGVtYWls
IHVzaW5nIG91dGxvb2sgd2hlcmUgZGVmYXVsdCBmb3JtYXQgaXMgSFRNTCwgbm93Cj4gSSB1c2Ug
ZXZvbHV0aW9uLCBvbmUgTGludXggbWFpbCBjbGllbnQgdGhhdCBJIHVzZWQgdG8gc2VuZCB1cHN0
cmVhbQo+IHBhdGNoIHByZXZpb3VzbHkuCj4gCj4gT24gVGh1LCAyMDIwLTA3LTAyIGF0IDA4OjM0
ICswMzAwLCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4gPiBEb25nY2h1biwKPiA+IAo+ID4gUGxlYXNl
IGRvbid0IHNlbmQgSFRNTCBlLW1haWwgdG8gTGludXgga2VybmVsIHJlbGF0ZWQgbWFpbGluZyBs
aXN0cy4KPiA+IAo+ID4gT24gVGh1LCBKdWwgMDIsIDIwMjAgYXQgMDM6NDg6NTZBTSArMDAwMCwg
RG9uZ2NodW4gWmh1ICjmnLHkuJzmmKUpIHdyb3RlOgo+ID4gPiAgSGkgU2FrYXJpLAo+ID4gPiAK
PiA+ID4gIFNvcnJ5IHRvIGJvdGhlciB5b3UgYWdhaW4sIGJ1dCBJIGFtIHNvIGNvbmZ1c2VkIGFi
b3V0IHRoZSBxdWVzdGlvbnMgeW91IHJhaXNlZC4KPiA+ID4gIEkganVzdCBzeW5jZWQgbWFpbmxp
bmU6IDUuOC1yYzMgdGFyYmFsbCBmcm9tIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvLCBvbiB3aGlj
aCBJIHJhbiB0aGUgZ2l0IGFtIDxwYXRjaD4gY29tbWFuZC4KPiA+ID4gIFRoZSBwYXRjaC1hcHBs
eWluZyBwcm9jZXNzIHNob3dzIG5vIGVycm9yLgo+ID4gPiAgLS0tLS0tLS0tLS0tLS0tLS04PC0t
LS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gIFttdGsxNTAxM0BtdGtzbHQzMDcgbGludXhdJGdpdCBh
cHBseSAtLWNoZWNrIG1lZGlhLWkyYy1BZGQtc3VwcG9ydC1mb3ItRFc5NzY4LVZDTS5wYXRjaAo+
ID4gPiAgW210azE1MDEzQG10a3NsdDMwNyBsaW51eF0kZ2l0IGFtIG1lZGlhLWkyYy1BZGQtc3Vw
cG9ydC1mb3ItRFc5NzY4LVZDTS5wYXRjaAo+ID4gPiAgQXBwbHlpbmc6IG1lZGlhOiBkdC1iaW5k
aW5nczogbWVkaWE6IGkyYzogRG9jdW1lbnQgRFc5NzY4IGJpbmRpbmdzCj4gPiA+ICBBcHBseWlu
ZzogbWVkaWE6IGkyYzogZHc5NzY4OiBBZGQgRFc5NzY4IFZDTSBkcml2ZXIKPiA+ID4gIC0tLS0t
LS0tLS0tLS0tLS0tODwtLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+IAo+ID4gPiAgT24gdGhlIG90
aGVyIGhhbmQsIEkgYWxzbyBjb21wYXJlZCBkb25nd29vbixkdzk3NjgueWFtbCBmaWxlIHdpdGgg
b3RoZXIgbWVkaWEgZGV2aWNlIGR0LWJpbmRpbmdzKGxpa2UgaW14MjE5LnlhbWwgYW5kIG92ODg1
Ni55YW1sKS4KPiA+ID4gIEl0IHNlZW1zIHRoZXJlIGFyZSBubyBhcHBhcmVudCBkaWZmZXJlbmNl
cyBiZXR3ZWVuIHRoZW0uCj4gPiA+ICBFc3BlY2lhbGx5LCB0aGUgc2VudGVuY2UgJyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSknIHNoYWxsIGJlIGNv
bW1vbi4KPiA+ID4gIEkgZHVubm8gd2h5IGhlcmUgZG9uZ3dvb24sZHc5NzY4LnlhbWwgcmVwb3J0
cyB0cmFpbGluZyB3aGl0ZXNwYWNlIHdhcm5pbmdzIHdoaWxlIG92ODg1Ni55YW1sIGlzIHNpbGVu
dC4KPiA+ID4gCj4gPiA+ICBGb3IgdGhlIHBhdGNoIGZhaWxlZCBvbiBNQUlOVEFJTkVSUywgSSBh
bSBzdGlsbCBjdXJpb3VzIHdoYXQncyB3cm9uZy4KPiA+ID4gIEluIGZhY3QsIEkgbG9jYWxseSBo
YXZlIHJ1biBwYXJzZS1tYWludGFpbmVycy5wbCBzY3JpcHQgdG8gY2hlY2sgTUFJTlRBSU5FUlMg
ZmlsZSBiZWZvcmUgc3VibWl0dGluZyBwYXRjaC4KPiA+ID4gIFRoZSByZXN1bHQgYWxzbyByZXBv
cnRzIG5vIGVycm9ycy4KPiA+ID4gIC0tLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiA+ICBbbXRrMTUwMTNAbXRrc2x0MzA3IGxpbnV4XSRwZXJsIHNjcmlwdHMvcGFyc2Ut
bWFpbnRhaW5lcnMucGwKPiA+ID4gIFttdGsxNTAxM0BtdGtzbHQzMDcgbGludXhdJGxzCj4gPiA+
ICAtLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiAKPiA+ID4gIEFz
IHRvIEJhc2U2NCBlbmNvZGluZywgSSBjaGVja2VkIGVhY2ggcGF0Y2ggZmlsZSBhZ2Fpbi4gVGhl
eSBhcmUgYWxsIGVuY29kZWQgaW4gVVRGLTguCj4gPiA+ICBBcyBodHRwczovL3d3dy5iYXNlNjRl
bmNvZGUub3JnLyBzYXlzLCBmb3IgYW4gZXhhbXBsZSwgJzc3JyBpbiBBU0NJSSBmb3JtYXQgd291
bGQgYmUgY2hhbmdlZCB0byAnVCcgaW4gQmFzZWQ2NC1lbmNvZGVkIGZvcm1hdC4KPiA+ID4gIFRo
aXMgbWVhbnMgdGhlcmUgc2hhbGwgYmUgbWVzc3kgY29kZSBpZiB3ZSBhZHBvdGluZyBCYXNlZDY0
LWVuY29kZWQgZm9ybWF0Lgo+ID4gPiAgQnV0IEkgY2Fubm90IHNlZSBnYXJibGVkIG1lc3NhZ2Vz
IGluIHRoZSBjdXJyZW50IHBhdGNoZXMuCj4gPiA+IAo+ID4gPiAgVGhlIERXOTc2OCBzZXJpYWxz
LXBhdGNoIGlzIGF0dGFjaGVkLgo+ID4gPiAgQFRvbWFzeiBAQW5keSBAUm9iIGNvdWxkIGFueW9u
ZSBoZWxwIHRyeSB0byBzZWUgd2hldGhlciB0aGUgcGF0Y2ggY2FuIGJlIGNoZXJyeS1waWNrZWQg
b24gTGludXggbWFzdGVyIGJyYW5jaCBvciBub3Q/Cj4gPiA+ICBQYXRjaHdvcmsgbGluazoKPiA+
ID4gIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvY292ZXIvMTE2MzMyOTEvCj4gPiAKPiA+
IEJvdGggb2YgdGhlIHBhdGNoZXMgYXBwZWFyIHRvIGNvbnRhaW4gb25seSBBU0NJSSBjaGFyYWN0
ZXJzLgo+ID4gCj4gPiBJIGRpZCBzb21lIHJlc2VhcmNoIG9uIHRoaXMuIEl0IHNlZW1zIHRoYXQg
dGhlIGJhc2U2NCBlbmNvZGVkIG1lc3NhZ2UgYm9keQo+ID4gZG9lcyBoYXZlIGNhcnJpYWdlIHJl
dHVybnMsIGluIGJvdGggY2FzZXMuIEdpdCBhbSBkb2VzIG5vdCBhdHRlbXB0IHRvCj4gPiByZW1v
dmUgdGhlbSBpbiB0aGF0IGNhc2UsIGJ1dCBQYXRjaHdvcmsgZG9lcy4gSGVuY2UgdGhlIGZpbGVz
IGFyZSBmaW5lIGlmCj4gPiB5b3UgZG93bmxvYWQgdGhlbSBmcm9tIFBhdGNod29yayAtLS0gd2hl
cmUgdGhlIG1ib3ggZmlsZXMgaGF2ZSBuZWl0aGVyCj4gPiBjYXJyaWFnZSByZXR1cm5zIG5vciBi
YXNlNjQgZW5jb2RpbmcuCj4gPiAKPiA+IFdoYXQgZG9lcyB0aGUgZmlsZSBjb21tYW5kIHNheSBh
Ym91dCB0aGUgcGF0Y2ggZmlsZXMgcHJvZHVjZWQgYnkgZ2l0Cj4gPiBmb3JtYXQtcGF0Y2g/IE15
IGd1ZXNzIGlzIHRoYXQgc29tZXRoaW5nIGluIGJldHdlZW4geW91ciBsb2NhbCBjb21wdXRlciBh
bmQKPiA+IExNTUwgKGFuZCBvdGhlciBtYWlsIHNlcnZlcnMpIGJhc2U2NCBlbmNvZGVzIHRoZSBt
ZXNzYWdlIGJvZHkuIEJ1dCB3aGVyZQo+ID4gYXJlIHRoZSBjYXJyaWFnZSByZXR1cm5zIGFkZGVk
PyBOZXZlcnRoZWxlc3MgdGhleSBzZWVtIHRvIGJlIGFkZGVkIGJlZm9yZQo+ID4gdGhlIGJhc2U2
NCBjb252ZXJzaW9uLgo+ID4gCj4gCj4gSG0uLi4gSSB1c2VkIHRoZSBmaWxlIGNvbW1hbmQgdG8g
Y2hlY2sgdGhlIGRpZmYgcGF0Y2ggZ2VuZXJhdGVkIGZyb20gZ2l0Cj4gZm9ybWF0LXBhdGNoIGFu
ZCB0aGF0IGRvd25sb2FkZWQgZnJvbSBQYXRjaHdvcmssIHRoZXkgYXJlIGJvdGggQVNDSUkKPiB0
ZXh0LgoKVGhhdCdzIGJlY2F1c2UgUGF0Y2h3b3JrIGFwcGVhcnMgdG8gYmUgcmVtb3ZpbmcgdGhl
IGNhcnJpYWdlIHJldHVybnMuIGdpdApkb2VzIG5vdCBpZiB0aGUgY29udGVudCBpcyBiYXNlNjQg
ZW5jb2RlZC4KCllvdXIgZS1tYWlsIHNldHVwIHNpbXBseSBhcHBlYXJzIHRvIGJlIGJyb2tlbi4g
SSdkIHN1Z2dlc3QgdHJ5aW5nIHRvIHNlbmQKdGhlIHBhdGNoZXMgZW5jb2RlZCBpbiBiYXNlNjQg
YXMgYSB3b3JrYXJvdW5kLiBnaXQgc2VuZC1lbWFpbCB1c2VzCnNlbmRlbWFpbC50cmFuc2ZlckVu
Y29kaW5nIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGZvciB0aGlzLgoKLS0gClNha2FyaSBBaWx1cwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
