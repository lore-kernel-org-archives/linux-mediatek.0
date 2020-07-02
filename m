Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF0AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:35:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF270207CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NvFC0cTw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF270207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dqJzAANuOxIo8yeApGzVSIMuks3jV4dOERv6YNhLgKg=; b=NvFC0cTwvuNaTC5D3wrDRzhAl
	MZEaD/Q7Jfff6W2Wugep8HgCTBumZEXO/V+RdBjNKOO007YArsVhuTNqSLXh9Dw2o8dnMx5m3Y0gI
	XpjxvBA5+MHnye0V8NTeaYnEbZE8D3NQalToLdcif0jj08kgw9q/mQ9RuNBEoSHawbrOj9RbT6VWs
	3Lbfvfy3X8tfUQil/mVSlztiLM+nk1uuTJU6ocY/ApHW3l18/mA3IB4qJ3Ljx1ECPdoAi54A1aJ4i
	0wOP+eqTP4EILQ7C1NItqWHTmCoXzjuw2ymgycC7gxanglFLbjQCCKKWPm8KbMSZaf+UTaiEDegLV
	DnWbkGQEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqrsF-00071N-Sc; Thu, 02 Jul 2020 05:35:03 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqrsC-00070D-Cb; Thu, 02 Jul 2020 05:35:01 +0000
IronPort-SDR: RPc3bbVgn8Kwdsp0Y1vMxUKCZdaLk7VpotCcSeSx558+tBx69A3IQXeEgvJhmde9tO2feCcvi3
 sFN5nhZuMp9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="145875976"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="145875976"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 22:34:55 -0700
IronPort-SDR: Ty6atuWHu18imj2PkfQsFLeXd9jxknx1a6WObfleArNTDpkNQbemEAjQmFoDj7zmJm8iwU+7mD
 oPEUA2MdJ1yQ==
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; d="scan'208";a="321980551"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 22:34:51 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 66818209B8; Thu,  2 Jul 2020 08:34:49 +0300 (EEST)
Date: Thu, 2 Jul 2020 08:34:49 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu =?utf-8?B?KOacseS4nOaYpSk=?= <Dongchun.Zhu@mediatek.com>
Subject: Re: [PATCH V9 0/2] media: i2c: Add support for DW9768 VCM
Message-ID: <20200702053449.GR16711@paasikivi.fi.intel.com>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200701091618.GN16711@paasikivi.fi.intel.com>
 <bf610d1b13c74656b2ffeeb9cc2a96ac@MTKMBS31N1.mediatek.inc>
 <20200701134416.GQ16711@paasikivi.fi.intel.com>
 <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e55e7b405a084a0298cd839c05b52c79@MTKMBS31N1.mediatek.inc>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_013500_574472_FF3D17DC 
X-CRM114-Status: GOOD (  22.96  )
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

RG9uZ2NodW4sCgpQbGVhc2UgZG9uJ3Qgc2VuZCBIVE1MIGUtbWFpbCB0byBMaW51eCBrZXJuZWwg
cmVsYXRlZCBtYWlsaW5nIGxpc3RzLgoKT24gVGh1LCBKdWwgMDIsIDIwMjAgYXQgMDM6NDg6NTZB
TSArMDAwMCwgRG9uZ2NodW4gWmh1ICjmnLHkuJzmmKUpIHdyb3RlOgo+ICBIaSBTYWthcmksCj4g
Cj4gIFNvcnJ5IHRvIGJvdGhlciB5b3UgYWdhaW4sIGJ1dCBJIGFtIHNvIGNvbmZ1c2VkIGFib3V0
IHRoZSBxdWVzdGlvbnMgeW91IHJhaXNlZC4KPiAgSSBqdXN0IHN5bmNlZCBtYWlubGluZTogNS44
LXJjMyB0YXJiYWxsIGZyb20gaHR0cHM6Ly93d3cua2VybmVsLm9yZy8sIG9uIHdoaWNoIEkgcmFu
IHRoZSBnaXQgYW0gPHBhdGNoPiBjb21tYW5kLgo+ICBUaGUgcGF0Y2gtYXBwbHlpbmcgcHJvY2Vz
cyBzaG93cyBubyBlcnJvci4KPiAgLS0tLS0tLS0tLS0tLS0tLS04PC0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgW210azE1MDEzQG10a3NsdDMwNyBsaW51eF0kZ2l0IGFwcGx5IC0tY2hlY2sgbWVkaWEt
aTJjLUFkZC1zdXBwb3J0LWZvci1EVzk3NjgtVkNNLnBhdGNoCj4gIFttdGsxNTAxM0BtdGtzbHQz
MDcgbGludXhdJGdpdCBhbSBtZWRpYS1pMmMtQWRkLXN1cHBvcnQtZm9yLURXOTc2OC1WQ00ucGF0
Y2gKPiAgQXBwbHlpbmc6IG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWE6IGkyYzogRG9jdW1lbnQg
RFc5NzY4IGJpbmRpbmdzCj4gIEFwcGx5aW5nOiBtZWRpYTogaTJjOiBkdzk3Njg6IEFkZCBEVzk3
NjggVkNNIGRyaXZlcgo+ICAtLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0tLS0tLS0tLS0tLQo+
IAo+ICBPbiB0aGUgb3RoZXIgaGFuZCwgSSBhbHNvIGNvbXBhcmVkIGRvbmd3b29uLGR3OTc2OC55
YW1sIGZpbGUgd2l0aCBvdGhlciBtZWRpYSBkZXZpY2UgZHQtYmluZGluZ3MobGlrZSBpbXgyMTku
eWFtbCBhbmQgb3Y4ODU2LnlhbWwpLgo+ICBJdCBzZWVtcyB0aGVyZSBhcmUgbm8gYXBwYXJlbnQg
ZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGVtLgo+ICBFc3BlY2lhbGx5LCB0aGUgc2VudGVuY2UgJyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wIE9SIEJTRC0yLUNsYXVzZSknIHNoYWxs
IGJlIGNvbW1vbi4KPiAgSSBkdW5ubyB3aHkgaGVyZSBkb25nd29vbixkdzk3NjgueWFtbCByZXBv
cnRzIHRyYWlsaW5nIHdoaXRlc3BhY2Ugd2FybmluZ3Mgd2hpbGUgb3Y4ODU2LnlhbWwgaXMgc2ls
ZW50Lgo+IAo+ICBGb3IgdGhlIHBhdGNoIGZhaWxlZCBvbiBNQUlOVEFJTkVSUywgSSBhbSBzdGls
bCBjdXJpb3VzIHdoYXQncyB3cm9uZy4KPiAgSW4gZmFjdCwgSSBsb2NhbGx5IGhhdmUgcnVuIHBh
cnNlLW1haW50YWluZXJzLnBsIHNjcmlwdCB0byBjaGVjayBNQUlOVEFJTkVSUyBmaWxlIGJlZm9y
ZSBzdWJtaXR0aW5nIHBhdGNoLgo+ICBUaGUgcmVzdWx0IGFsc28gcmVwb3J0cyBubyBlcnJvcnMu
Cj4gIC0tLS0tLS0tLS0tLS0tLS0tODwtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIFttdGsxNTAxM0Bt
dGtzbHQzMDcgbGludXhdJHBlcmwgc2NyaXB0cy9wYXJzZS1tYWludGFpbmVycy5wbAo+ICBbbXRr
MTUwMTNAbXRrc2x0MzA3IGxpbnV4XSRscwo+ICAtLS0tLS0tLS0tLS0tLS0tLTg8LS0tLS0tLS0t
LS0tLS0tLS0tLQo+IAo+ICBBcyB0byBCYXNlNjQgZW5jb2RpbmcsIEkgY2hlY2tlZCBlYWNoIHBh
dGNoIGZpbGUgYWdhaW4uIFRoZXkgYXJlIGFsbCBlbmNvZGVkIGluIFVURi04Lgo+ICBBcyBodHRw
czovL3d3dy5iYXNlNjRlbmNvZGUub3JnLyBzYXlzLCBmb3IgYW4gZXhhbXBsZSwgJzc3JyBpbiBB
U0NJSSBmb3JtYXQgd291bGQgYmUgY2hhbmdlZCB0byAnVCcgaW4gQmFzZWQ2NC1lbmNvZGVkIGZv
cm1hdC4KPiAgVGhpcyBtZWFucyB0aGVyZSBzaGFsbCBiZSBtZXNzeSBjb2RlIGlmIHdlIGFkcG90
aW5nIEJhc2VkNjQtZW5jb2RlZCBmb3JtYXQuCj4gIEJ1dCBJIGNhbm5vdCBzZWUgZ2FyYmxlZCBt
ZXNzYWdlcyBpbiB0aGUgY3VycmVudCBwYXRjaGVzLgo+IAo+ICBUaGUgRFc5NzY4IHNlcmlhbHMt
cGF0Y2ggaXMgYXR0YWNoZWQuCj4gIEBUb21hc3ogQEFuZHkgQFJvYiBjb3VsZCBhbnlvbmUgaGVs
cCB0cnkgdG8gc2VlIHdoZXRoZXIgdGhlIHBhdGNoIGNhbiBiZSBjaGVycnktcGlja2VkIG9uIExp
bnV4IG1hc3RlciBicmFuY2ggb3Igbm90Pwo+ICBQYXRjaHdvcmsgbGluazoKPiAgaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTYzMzI5MS8KCkJvdGggb2YgdGhlIHBhdGNoZXMg
YXBwZWFyIHRvIGNvbnRhaW4gb25seSBBU0NJSSBjaGFyYWN0ZXJzLgoKSSBkaWQgc29tZSByZXNl
YXJjaCBvbiB0aGlzLiBJdCBzZWVtcyB0aGF0IHRoZSBiYXNlNjQgZW5jb2RlZCBtZXNzYWdlIGJv
ZHkKZG9lcyBoYXZlIGNhcnJpYWdlIHJldHVybnMsIGluIGJvdGggY2FzZXMuIEdpdCBhbSBkb2Vz
IG5vdCBhdHRlbXB0IHRvCnJlbW92ZSB0aGVtIGluIHRoYXQgY2FzZSwgYnV0IFBhdGNod29yayBk
b2VzLiBIZW5jZSB0aGUgZmlsZXMgYXJlIGZpbmUgaWYKeW91IGRvd25sb2FkIHRoZW0gZnJvbSBQ
YXRjaHdvcmsgLS0tIHdoZXJlIHRoZSBtYm94IGZpbGVzIGhhdmUgbmVpdGhlcgpjYXJyaWFnZSBy
ZXR1cm5zIG5vciBiYXNlNjQgZW5jb2RpbmcuCgpXaGF0IGRvZXMgdGhlIGZpbGUgY29tbWFuZCBz
YXkgYWJvdXQgdGhlIHBhdGNoIGZpbGVzIHByb2R1Y2VkIGJ5IGdpdApmb3JtYXQtcGF0Y2g/IE15
IGd1ZXNzIGlzIHRoYXQgc29tZXRoaW5nIGluIGJldHdlZW4geW91ciBsb2NhbCBjb21wdXRlciBh
bmQKTE1NTCAoYW5kIG90aGVyIG1haWwgc2VydmVycykgYmFzZTY0IGVuY29kZXMgdGhlIG1lc3Nh
Z2UgYm9keS4gQnV0IHdoZXJlCmFyZSB0aGUgY2FycmlhZ2UgcmV0dXJucyBhZGRlZD8gTmV2ZXJ0
aGVsZXNzIHRoZXkgc2VlbSB0byBiZSBhZGRlZCBiZWZvcmUKdGhlIGJhc2U2NCBjb252ZXJzaW9u
LgoKSSB0aGluayB0aGlzIGlzIGFsc28gYSBnaXQgaXNzdWUsIGJ1dCBzb21ldGhpbmcgdGhhdCBp
cyB2ZXJ5IGhhcmQgdG8KZW5jb3VudGVyLgoKLi4uCgo+ICAqKioqKioqKioqKioqIE1FRElBVEVL
IENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioqKioqKioqKioqKioqKioqKioKPiAgVGhlIGluZm9y
bWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGUtbWFpbCBtZXNzYWdlIChpbmNsdWRpbmcgYW55Cj4g
IGF0dGFjaG1lbnRzKSBtYXkgYmUgY29uZmlkZW50aWFsLCBwcm9wcmlldGFyeSwgcHJpdmlsZWdl
ZCwgb3Igb3RoZXJ3aXNlCj4gIGV4ZW1wdCBmcm9tIGRpc2Nsb3N1cmUgdW5kZXIgYXBwbGljYWJs
ZSBsYXdzLiBJdCBpcyBpbnRlbmRlZCB0byBiZQo+ICBjb252ZXllZCBvbmx5IHRvIHRoZSBkZXNp
Z25hdGVkIHJlY2lwaWVudChzKS4gQW55IHVzZSwgZGlzc2VtaW5hdGlvbiwKPiAgZGlzdHJpYnV0
aW9uLCBwcmludGluZywgcmV0YWluaW5nIG9yIGNvcHlpbmcgb2YgdGhpcyBlLW1haWwgKGluY2x1
ZGluZyBpdHMKPiAgYXR0YWNobWVudHMpIGJ5IHVuaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHN0
cmljdGx5IHByb2hpYml0ZWQgYW5kIG1heQo+ICBiZSB1bmxhd2Z1bC4gSWYgeW91IGFyZSBub3Qg
YW4gaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgZS1tYWlsLCBvciBiZWxpZXZlCj4gIHRoYXQg
eW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhl
IHNlbmRlcgo+ICBpbW1lZGlhdGVseSAoYnkgcmVwbHlpbmcgdG8gdGhpcyBlLW1haWwpLCBkZWxl
dGUgYW55IGFuZCBhbGwgY29waWVzIG9mCj4gIHRoaXMgZS1tYWlsIChpbmNsdWRpbmcgYW55IGF0
dGFjaG1lbnRzKSBmcm9tIHlvdXIgc3lzdGVtLCBhbmQgZG8gbm90Cj4gIGRpc2Nsb3NlIHRoZSBj
b250ZW50IG9mIHRoaXMgZS1tYWlsIHRvIGFueSBvdGhlciBwZXJzb24uIFRoYW5rIHlvdSEKCkRp
ZCB5b3UgbWVhbiB0aGlzPwoKLS0gCktpbmQgcmVnYXJkcywKClNha2FyaSBBaWx1cwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
