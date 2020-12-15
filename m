Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D314CC2BB48
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 13:19:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E35C22510
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 13:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E35C22510
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J1kvI2B9ALzVhjTBaJ3CkF0+Swjt9MjRa59OPak055M=; b=Pvn4gFe7flgev0Uk+/L1n/Gev
	jvwpC+XJDGWSQvCK1OIgtnGsKSKKfSuxaMWX9Jg3B3assSdnmzUNe2h/OF24VoJEqvXdxXs3HOUnj
	B78Q+MvwrdlAEFRWNaoAarzmKfAuO7R5PQZtjZ6O++YL/A4lhWC7pT7BWj+C93DItbAZ+TWKPj2P7
	4iuNU5A0twygOvNzMW3YiYc1GHvU0ChQ71qm/rA/il2vworsiNZ9tFw2Qvw7Dyb1cW6P4ofbuFHYy
	/0RLr2tCozfiSpsuAK5UFr96utYbAmtSwxxHgfl3I2Bzzma1KnpkhSvMDin78amD34UYas71BAZle
	y0AsJmKDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpAEP-0001Jj-1w; Tue, 15 Dec 2020 13:19:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpAEK-0001IN-H7; Tue, 15 Dec 2020 13:19:05 +0000
X-UUID: d49fb2e8dc32462491d618a3881bf0d1-20201215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+3hXioTM0uwiQhD/4pc79cMmH/fAPoqBWzJ/jvJrpG4=; 
 b=b/uYNCkBA0kgQQLKXXeliv4BFG3vPDwfkPZZqBAtBN2Ak6WRm12uYZO4DlMONI8gwaYXnDbHdbBhgojrIxG9NYrhe61SmeXU4LxqD0gMqakrbF08ML+w9ADIcSKPZfumyADDlC6EWHG8xogZu6s27bcSA07q8udct0tWeC8WNCw=;
X-UUID: d49fb2e8dc32462491d618a3881bf0d1-20201215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 191634744; Tue, 15 Dec 2020 05:18:56 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 05:08:53 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Dec 2020 21:08:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Dec 2020 21:08:50 +0800
Message-ID: <1608037730.25719.60.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From: Qii Wang <qii.wang@mediatek.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Date: Tue, 15 Dec 2020 21:08:50 +0800
In-Reply-To: <765c182a-5c68-b408-85ca-f757e891090e@ti.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
 <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
 <1607326431.25719.33.camel@mhfsdcap03>
 <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
 <1607565387.25719.43.camel@mhfsdcap03>
 <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
 <1607935685.25719.49.camel@mhfsdcap03>
 <765c182a-5c68-b408-85ca-f757e891090e@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A3E97A6870CF2A48AC09662A75487A481CCFA902FDD3018193C88B8139F718192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_081904_771395_F15C8357 
X-CRM114-Status: GOOD (  26.36  )
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
Cc: srv_heupstream@mediatek.com, Wolfram Sang <wsa@the-dreams.de>,
 leilk.liu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMDIwLTEyLTE0IGF0IDIyOjA4ICswMjAwLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90
ZToNCj4gDQo+IE9uIDE0LzEyLzIwMjAgMTA6NDgsIFFpaSBXYW5nIHdyb3RlOg0KPiA+IE9uIFRo
dSwgMjAyMC0xMi0xMCBhdCAxNTowMyArMDIwMCwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6DQo+
ID4+DQo+ID4+IE9uIDEwLzEyLzIwMjAgMDM6NTYsIFFpaSBXYW5nIHdyb3RlOg0KPiA+Pj4gT24g
TW9uLCAyMDIwLTEyLTA3IGF0IDE4OjM1ICswMjAwLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToN
Cj4gPj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiBPbiBUaHUsIDIwMjAtMTItMDMgYXQgMTA6MDEgKzAy
MDAsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOg0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IE9uIDAzLzEy
LzIwMjAgMDM6MjUsIFFpaSBXYW5nIHdyb3RlOg0KPiA+Pj4+Pj4+IE9uIFdlZCwgMjAyMC0xMi0w
MiBhdCAxNjozNSArMDEwMCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiA+Pj4+Pj4+PiBIaSwNCj4g
Pj4+Pj4+Pj4NCj4gPj4+Pj4+Pj4+IFNvbWUgaTJjIGRldmljZSBkcml2ZXIgaW5kaXJlY3RseSB1
c2VzIEkyQyBkcml2ZXIgd2hlbiBpdCBpcyBub3cNCj4gPj4+Pj4+Pj4+IGJlaW5nIHN1c3BlbmRl
ZC4gVGhlIGkyYyBkZXZpY2VzIGRyaXZlciBpcyBzdXNwZW5kZWQgZHVyaW5nIHRoZQ0KPiA+Pj4+
Pj4+Pj4gTk9JUlEgcGhhc2UgYW5kIHRoaXMgY2Fubm90IGJlIGNoYW5nZWQgZHVlIHRvIG90aGVy
IGRlcGVuZGVuY2llcy4NCj4gPj4+Pj4+Pj4+IFRoZXJlZm9yZSwgd2UgYWxzbyBuZWVkIHRvIG1v
dmUgdGhlIHN1c3BlbmQgaGFuZGxpbmcgZm9yIHRoZSBJMkMNCj4gPj4+Pj4+Pj4+IGNvbnRyb2xs
ZXIgZHJpdmVyIHRvIHRoZSBOT0lSUSBwaGFzZSBhcyB3ZWxsLg0KPiA+Pj4+Pj4+Pj4NCj4gPj4+
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFFpaSBXYW5nIDxxaWkud2FuZ0BtZWRpYXRlay5jb20+DQo+
ID4+Pj4+Pj4+DQo+ID4+Pj4+Pj4+IElzIHRoaXMgYSBidWdmaXggYW5kIHNob3VsZCBnbyBpbnRv
IDUuMTA/IE9yIGNhbiBpdCB3YWl0IGZvciA1LjExPw0KPiA+Pj4+Pj4+Pg0KPiA+Pj4+Pj4+DQo+
ID4+Pj4+Pj4gWWVzLCBDYW4geW91IGhlbHAgdG8gYXBwbHkgaXQgaW50byA1LjEwPyBUaGFua3MN
Cj4gPj4+Pj4+DQo+ID4+Pj4+PiBUbyBiZSBob25lc3QgaWYgeW91IHN0aWxsIGRvIGhhdmUgYW55
IGkyYyBkZXZpY2Ugd2hpY2ggYWNjZXNzaW5nIGkyYyBidXNzIGFmdGVyIF9ub2lycQ0KPiA+Pj4+
Pj4gc3RhZ2UgYW5kIHlvdXIgZHJpdmVyIGRvZXMgbm90IGltcGxlbWVudCAubWFzdGVyX3hmZXJf
YXRvbWljKCkgLSB5b3UgZGVmaW5pdGVseSBoYXZlIGEgYmlnZ2VyIHByb2JsZW0uDQo+ID4+Pj4+
PiBTbyBhZGRpbmcgSVJRRl9OT19TVVNQRU5EIHNvdW5kIGxpa2UgYSBoYWNrIGFuZCBwcm9iYWJs
eSB3b3JrcyBqdXN0IGJ5IGx1Y2suDQo+ID4+Pj4+Pg0KPiA+Pj4+Pg0KPiA+Pj4+PiBBdCBwcmVz
ZW50LCBpdCBpcyBvbmx5IGEgcHJvYmxlbSBjYXVzZWQgYnkgbWlzc2luZyBpbnRlcnJ1cHRzLA0K
PiA+Pj4+PiBhbmQgLm1hc3Rlcl94ZmVyX2F0b21pYygpIGp1c3QgYSBpbXBsZW1lbnQgaW4gcG9s
bGluZyBtb2RlLiBXaHkgbm90IHNldA0KPiA+Pj4+PiB0aGUgaW50ZXJydXB0IHRvIGEgc3RhdGUg
dGhhdCBjYW4gYWx3YXlzIGJlIHRyaWdnZXJlZD8NCj4gPj4+Pj4NCj4gPj4+Pj4NCj4gPj4+Pg0K
PiA+Pj4+IEJlY2F1c2UgeW91IG11c3Qgbm90IHVzZSBhbnkgSVJRIGRyaXZlbiBvcGVyYXRpb25z
IGFmdGVyIF9ub2lycSBzdXNwZW5kIHN0YXRlIGFzIGl0IG1pZ2h0IChhbmQgbW9zdCBwcm9iYWJs
eSB3aWxsKQ0KPiA+Pj4+IGNhdXNlIHVucHJlZGljdGFibGUgYmVoYXZpb3IgbGF0ZXIgIGluIHN1
c3BlbmRfZW50ZXIoKToNCj4gPj4+Pg0KPiA+Pj4+IAlhcmNoX3N1c3BlbmRfZGlzYWJsZV9pcnFz
KCk7DQo+ID4+Pj4gCUJVR19PTighaXJxc19kaXNhYmxlZCgpKTsNCj4gPj4+PiBeYWZ0ZXIgdGhp
cyBwb2ludCBhbnkgSVJRIGRyaXZlbiBJMkMgdHJhbnNmZXIgd2lsbCBjYXVzZSBJUlEgdG8gYmUg
cmUtZW5hYmxlZA0KPiA+Pj4+DQo+ID4+Pj4gaWYgeW91IG5lZWQgIHR1cm4gb2ZmIGRldmljZSBm
cm9tIHBsYXRmb3JtIGNhbGxiYWNrcyAtICAubWFzdGVyX3hmZXJfYXRvbWljKCkgaGFzIHRvIGJl
IGltcGxlbWVudGVkIGFuZCB1c2VkLg0KPiA+Pj4+ICAgICANCj4gPj4+IE1heWJlIG15IGNvbW1l
bnQgaXMgYSBiaXQgZGlzdHVyYmluZy5PdXIgcHVycG9zZSBpcyBub3QgdG8gY2FsbCBpMmMgYW5k
DQo+ID4+PiB1c2UgaW50ZXJydXB0cyBhZnRlciBfbm9pcnEgcGF1c2VzLlNvIFdlIHVzZQ0KPiA+
Pj4gaTJjX21hcmtfYWRhcHRlcl9zdXNwZW5kZWQmaTJjX21hcmtfYWRhcHRlcl9yZXN1bWVkIHRv
IGJsb2NrIHRoZXNlIGkyYw0KPiA+Pj4gdHJhbnNmZXJz77yMIFRoZXJlIHdpbGwgbm90IGhhdmUg
YW55IElSUSBkcml2ZW4gSTJDIHRyYW5zZmVyIGFmdGVyIHRoaXMNCj4gPj4+IHBvaW50Og0KPiA+
Pj4gICAgICAgICAgIGFyY2hfc3VzcGVuZF9kaXNhYmxlX2lycXMoKTsNCj4gPj4+ICAgICAgICAg
ICBCVUdfT04oIWlycXNfZGlzYWJsZWQoKSk7DQo+ID4+PiBCdXQgc29tZSBkZXZpY2UgZHJpdmVy
IHdpbGwgZG8gaTJjIHRyYW5zZmVyIGFmdGVyDQo+ID4+PiBkcG1fbm9pcnFfcmVzdW1lX2Rldmlj
ZXMgaW4gZHBtX3Jlc3VtZV9ub2lycShQTVNHX1JFU1VNRSkgd2hlbiBvdXINCj4gPj4+IGRyaXZl
ciBpcnEgaGFzbid0IHJlc3VtZS4NCj4gPj4+IAl2b2lkIGRwbV9yZXN1bWVfbm9pcnEocG1fbWVz
c2FnZV90IHN0YXRlKQ0KPiA+Pj4gCXsNCj4gPj4+ICAgICAgICAgICAJZHBtX25vaXJxX3Jlc3Vt
ZV9kZXZpY2VzKHN0YXRlKTsNCj4gPj4NCj4gPj4gSnVzdCB0byBjbGFyaWZ5LiBZb3UgaGF2ZSBy
ZXN1bWUgc2VxdWVuY2UgaW4gZHBtX25vaXJxX3Jlc3VtZV9kZXZpY2VzDQo+ID4+ICAgIGRwbV9u
b2lycV9yZXN1bWVfZGV2aWNlcyAtPiByZXN1bWUgSTJDIC0+IHJlc3VtZSBzb21lIGRldmljZSAt
PiBkbyBpMmMgdHJhbnNmZXIgYWZ0ZXI/DQo+ID4+DQo+ID4gDQo+ID4gWWVzLg0KPiANCj4gaHVo
LiBGaXJzdCBjb25zaWRlciBJUlFGX0VBUkxZX1JFU1VNRSAtIGl0J3MgYmV0dGVyLCBidXQgc3Rp
bGwgd2lsbCBiZSBhIGhhY2sNCj4gDQpUaGVyZSBzaG91bGQgYmUgdGhlIHNhbWUgcHJvYmxlbSBk
dXJpbmcgdGhlIHN1c3BlbmQgcHJvY2VzcywgU28NCklSUUZfRUFSTFlfUkVTVU1FIHNob3VsZCBu
b3QgYmUgYWJsZSB0byBzb2x2ZSB0aGUgcHJvYmxlbS4NCg0KPiA+IA0KPiA+PiBJcyAic29tZSBk
ZXZpY2UiIGluIEtlcm5lbCBtYWlubGluZT8NCj4gPj4NCj4gPiANCj4gPiBUaGUgcHJvYmxlbWF0
aWMgZGV2aWNlIGRyaXZlciBpcyBkcml2ZXJzL3JlZ3VsYXRvci9kYTkyMTEtcmVndWxhdG9yLmMg
aW4NCj4gPiBLZXJuZWwgbWFpbmxpbmUuDQo+IA0KPiByZWd1bGF0b3IgaXMgcGFzc2l2ZSBkZXZp
Y2UsIHNvbWVib2R5IHNob3VsZCBjYWxsIGl0ICE/DQo+IA0KPiBBbmQgZGE5MjExLXJlZ3VsYXRv
ciBJUlEgaGFuZGxlciBzaG91bGQgcmVtYWluIGRpc2FibGVkIHRpbGwgcmVzdW1lX2RldmljZV9p
cnFzKCkgY2FsbC4NCj4gDQoNCk5vdCBvbmx5IHdpbGwgaTJjIHRyYW5zZmVyIGJlIGNhbGxlZCBp
biBkYTkyMTEtcmVndWxhdG9yIElSUSBoYW5kbGVyLA0KYnV0IGFsc28gb3RoZXIgZHJpdmVycyB3
aWxsIGNhbGwgZGE5MjExX2J1Y2tfb3BzIHdoaWNoIGNvbnRhaW5pbmcgaTJjDQp0cmFuc2ZlcnMu
DQoNCj4gbm90ZS4gcmVndWxhdG9yX2NsYXNzIGltcGxlbWVudHMgb25seQ0KPiANCj4gc3RhdGlj
IGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIF9fbWF5YmVfdW51c2VkIHJlZ3VsYXRvcl9wbV9vcHMg
PSB7DQo+IAkuc3VzcGVuZAk9IHJlZ3VsYXRvcl9zdXNwZW5kLA0KPiAJLnJlc3VtZQkJPSByZWd1
bGF0b3JfcmVzdW1lLA0KPiB9Ow0KPiANCj4gDQo+ID4gDQo+ID4+PiAgICAgICAgICAgCXJlc3Vt
ZV9kZXZpY2VfaXJxcygpOw0KPiA+Pj4gICAgICAgICAgIAlkZXZpY2Vfd2FrZXVwX2Rpc2FybV93
YWtlX2lycXMoKTsNCj4gPj4+ICAgICAgICAgICAJY3B1aWRsZV9yZXN1bWUoKTsNCj4gPj4+IAl9
DQo+ID4+PiAubWFzdGVyX3hmZXJfYXRvbWljKCkgc2VlbXMgdG8gYmUgaW52YWxpZCBmb3IgdGhp
cyBxdWVzdGlvbiBhdCB0aGlzDQo+ID4+PiB0aW1lPw0KPiA+Pj4NCj4gPj4NCj4gPiANCj4gDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
