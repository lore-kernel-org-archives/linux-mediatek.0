Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE94BC2BB40
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 20:09:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8027C207A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 20:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8027C207A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tdfd+8LIYsxR6vGTkryPMyoC2hdNLGpF4zO8KFFXxPk=; b=INxRQ26chtyLyyEq4ugbAhBaU
	wXZuzwaownzOkvr22VTQMynfOHzuTd6d+7IoOyvWtIISi2BNfsR8ZTnca6zWiEOdQMVf57lD8IbNf
	900HtAg+AfK5Y9x6Ba9JVbFQ8oFj1491p6iM9i155+Xy18oWba6Xm4cZx4gGKQuC33Dxey3z/og/J
	OxOe4uBoxXWuNc6iS2/ElEYDCC1/KS3TIUifyWq8jlFv4QBA/a86PEiyTIgjDo3CNSoYkp+79VKfr
	AFk+IaeDI924E9lxUlz8/ykHGIP8BBfpspXC57Efn7zb+tCX6VYSE48VSHt6+Bcu2eY70rVVDhYQj
	jLJ90GiUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kou9G-0000yF-5u; Mon, 14 Dec 2020 20:08:46 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kou97-0000s3-GW; Mon, 14 Dec 2020 20:08:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BEK8L4L073067;
 Mon, 14 Dec 2020 14:08:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607976501;
 bh=bYx/KPXoQnydtHvU0A93Ft8RQtsoKRmWYVYqEzohC3E=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ca6cYdkcTVbnkADiNBN0eInegJ8WDq4+PFGkFWDOfk4/LXyfDKsgmkIHAkRgfcDpP
 0CJgnGqdd7ya9oPUwsDPmaq5ZAkF7MsJGCw8s4RmyZq3mfbtPoNr2EMQBOh+D2Rbuq
 ClrMKStJktpBh5LWXg0cUwUzr56JkyJM4WLnHvfU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BEK8LOM088012
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Dec 2020 14:08:21 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Dec 2020 14:08:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Dec 2020 14:08:21 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BEK8Hgr080343;
 Mon, 14 Dec 2020 14:08:18 -0600
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
To: Qii Wang <qii.wang@mediatek.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
 <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
 <1607326431.25719.33.camel@mhfsdcap03>
 <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
 <1607565387.25719.43.camel@mhfsdcap03>
 <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
 <1607935685.25719.49.camel@mhfsdcap03>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <765c182a-5c68-b408-85ca-f757e891090e@ti.com>
Date: Mon, 14 Dec 2020 22:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607935685.25719.49.camel@mhfsdcap03>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_150838_502522_DA438B80 
X-CRM114-Status: GOOD (  20.05  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxNC8xMi8yMDIwIDEwOjQ4LCBRaWkgV2FuZyB3cm90ZToKPiBPbiBUaHUsIDIwMjAtMTIt
MTAgYXQgMTU6MDMgKzAyMDAsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOgo+Pgo+PiBPbiAxMC8x
Mi8yMDIwIDAzOjU2LCBRaWkgV2FuZyB3cm90ZToKPj4+IE9uIE1vbiwgMjAyMC0xMi0wNyBhdCAx
ODozNSArMDIwMCwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6Cj4+Pj4KPj4+Pj4KPj4+Pj4gT24g
VGh1LCAyMDIwLTEyLTAzIGF0IDEwOjAxICswMjAwLCBHcnlnb3JpaSBTdHJhc2hrbyB3cm90ZToK
Pj4+Pj4+Cj4+Pj4+PiBPbiAwMy8xMi8yMDIwIDAzOjI1LCBRaWkgV2FuZyB3cm90ZToKPj4+Pj4+
PiBPbiBXZWQsIDIwMjAtMTItMDIgYXQgMTY6MzUgKzAxMDAsIFdvbGZyYW0gU2FuZyB3cm90ZToK
Pj4+Pj4+Pj4gSGksCj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTb21lIGkyYyBkZXZpY2UgZHJpdmVyIGlu
ZGlyZWN0bHkgdXNlcyBJMkMgZHJpdmVyIHdoZW4gaXQgaXMgbm93Cj4+Pj4+Pj4+PiBiZWluZyBz
dXNwZW5kZWQuIFRoZSBpMmMgZGV2aWNlcyBkcml2ZXIgaXMgc3VzcGVuZGVkIGR1cmluZyB0aGUK
Pj4+Pj4+Pj4+IE5PSVJRIHBoYXNlIGFuZCB0aGlzIGNhbm5vdCBiZSBjaGFuZ2VkIGR1ZSB0byBv
dGhlciBkZXBlbmRlbmNpZXMuCj4+Pj4+Pj4+PiBUaGVyZWZvcmUsIHdlIGFsc28gbmVlZCB0byBt
b3ZlIHRoZSBzdXNwZW5kIGhhbmRsaW5nIGZvciB0aGUgSTJDCj4+Pj4+Pj4+PiBjb250cm9sbGVy
IGRyaXZlciB0byB0aGUgTk9JUlEgcGhhc2UgYXMgd2VsbC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBRaWkgV2FuZyA8cWlpLndhbmdAbWVkaWF0ZWsuY29tPgo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBJcyB0aGlzIGEgYnVnZml4IGFuZCBzaG91bGQgZ28gaW50byA1LjEwPyBPciBjYW4g
aXQgd2FpdCBmb3IgNS4xMT8KPj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IFllcywgQ2FuIHlvdSBo
ZWxwIHRvIGFwcGx5IGl0IGludG8gNS4xMD8gVGhhbmtzCj4+Pj4+Pgo+Pj4+Pj4gVG8gYmUgaG9u
ZXN0IGlmIHlvdSBzdGlsbCBkbyBoYXZlIGFueSBpMmMgZGV2aWNlIHdoaWNoIGFjY2Vzc2luZyBp
MmMgYnVzcyBhZnRlciBfbm9pcnEKPj4+Pj4+IHN0YWdlIGFuZCB5b3VyIGRyaXZlciBkb2VzIG5v
dCBpbXBsZW1lbnQgLm1hc3Rlcl94ZmVyX2F0b21pYygpIC0geW91IGRlZmluaXRlbHkgaGF2ZSBh
IGJpZ2dlciBwcm9ibGVtLgo+Pj4+Pj4gU28gYWRkaW5nIElSUUZfTk9fU1VTUEVORCBzb3VuZCBs
aWtlIGEgaGFjayBhbmQgcHJvYmFibHkgd29ya3MganVzdCBieSBsdWNrLgo+Pj4+Pj4KPj4+Pj4K
Pj4+Pj4gQXQgcHJlc2VudCwgaXQgaXMgb25seSBhIHByb2JsZW0gY2F1c2VkIGJ5IG1pc3Npbmcg
aW50ZXJydXB0cywKPj4+Pj4gYW5kIC5tYXN0ZXJfeGZlcl9hdG9taWMoKSBqdXN0IGEgaW1wbGVt
ZW50IGluIHBvbGxpbmcgbW9kZS4gV2h5IG5vdCBzZXQKPj4+Pj4gdGhlIGludGVycnVwdCB0byBh
IHN0YXRlIHRoYXQgY2FuIGFsd2F5cyBiZSB0cmlnZ2VyZWQ/Cj4+Pj4+Cj4+Pj4+Cj4+Pj4KPj4+
PiBCZWNhdXNlIHlvdSBtdXN0IG5vdCB1c2UgYW55IElSUSBkcml2ZW4gb3BlcmF0aW9ucyBhZnRl
ciBfbm9pcnEgc3VzcGVuZCBzdGF0ZSBhcyBpdCBtaWdodCAoYW5kIG1vc3QgcHJvYmFibHkgd2ls
bCkKPj4+PiBjYXVzZSB1bnByZWRpY3RhYmxlIGJlaGF2aW9yIGxhdGVyICBpbiBzdXNwZW5kX2Vu
dGVyKCk6Cj4+Pj4KPj4+PiAJYXJjaF9zdXNwZW5kX2Rpc2FibGVfaXJxcygpOwo+Pj4+IAlCVUdf
T04oIWlycXNfZGlzYWJsZWQoKSk7Cj4+Pj4gXmFmdGVyIHRoaXMgcG9pbnQgYW55IElSUSBkcml2
ZW4gSTJDIHRyYW5zZmVyIHdpbGwgY2F1c2UgSVJRIHRvIGJlIHJlLWVuYWJsZWQKPj4+Pgo+Pj4+
IGlmIHlvdSBuZWVkICB0dXJuIG9mZiBkZXZpY2UgZnJvbSBwbGF0Zm9ybSBjYWxsYmFja3MgLSAg
Lm1hc3Rlcl94ZmVyX2F0b21pYygpIGhhcyB0byBiZSBpbXBsZW1lbnRlZCBhbmQgdXNlZC4KPj4+
PiAgICAgCj4+PiBNYXliZSBteSBjb21tZW50IGlzIGEgYml0IGRpc3R1cmJpbmcuT3VyIHB1cnBv
c2UgaXMgbm90IHRvIGNhbGwgaTJjIGFuZAo+Pj4gdXNlIGludGVycnVwdHMgYWZ0ZXIgX25vaXJx
IHBhdXNlcy5TbyBXZSB1c2UKPj4+IGkyY19tYXJrX2FkYXB0ZXJfc3VzcGVuZGVkJmkyY19tYXJr
X2FkYXB0ZXJfcmVzdW1lZCB0byBibG9jayB0aGVzZSBpMmMKPj4+IHRyYW5zZmVyc++8jCBUaGVy
ZSB3aWxsIG5vdCBoYXZlIGFueSBJUlEgZHJpdmVuIEkyQyB0cmFuc2ZlciBhZnRlciB0aGlzCj4+
PiBwb2ludDoKPj4+ICAgICAgICAgICBhcmNoX3N1c3BlbmRfZGlzYWJsZV9pcnFzKCk7Cj4+PiAg
ICAgICAgICAgQlVHX09OKCFpcnFzX2Rpc2FibGVkKCkpOwo+Pj4gQnV0IHNvbWUgZGV2aWNlIGRy
aXZlciB3aWxsIGRvIGkyYyB0cmFuc2ZlciBhZnRlcgo+Pj4gZHBtX25vaXJxX3Jlc3VtZV9kZXZp
Y2VzIGluIGRwbV9yZXN1bWVfbm9pcnEoUE1TR19SRVNVTUUpIHdoZW4gb3VyCj4+PiBkcml2ZXIg
aXJxIGhhc24ndCByZXN1bWUuCj4+PiAJdm9pZCBkcG1fcmVzdW1lX25vaXJxKHBtX21lc3NhZ2Vf
dCBzdGF0ZSkKPj4+IAl7Cj4+PiAgICAgICAgICAgCWRwbV9ub2lycV9yZXN1bWVfZGV2aWNlcyhz
dGF0ZSk7Cj4+Cj4+IEp1c3QgdG8gY2xhcmlmeS4gWW91IGhhdmUgcmVzdW1lIHNlcXVlbmNlIGlu
IGRwbV9ub2lycV9yZXN1bWVfZGV2aWNlcwo+PiAgICBkcG1fbm9pcnFfcmVzdW1lX2RldmljZXMg
LT4gcmVzdW1lIEkyQyAtPiByZXN1bWUgc29tZSBkZXZpY2UgLT4gZG8gaTJjIHRyYW5zZmVyIGFm
dGVyPwo+Pgo+IAo+IFllcy4KCmh1aC4gRmlyc3QgY29uc2lkZXIgSVJRRl9FQVJMWV9SRVNVTUUg
LSBpdCdzIGJldHRlciwgYnV0IHN0aWxsIHdpbGwgYmUgYSBoYWNrCgo+IAo+PiBJcyAic29tZSBk
ZXZpY2UiIGluIEtlcm5lbCBtYWlubGluZT8KPj4KPiAKPiBUaGUgcHJvYmxlbWF0aWMgZGV2aWNl
IGRyaXZlciBpcyBkcml2ZXJzL3JlZ3VsYXRvci9kYTkyMTEtcmVndWxhdG9yLmMgaW4KPiBLZXJu
ZWwgbWFpbmxpbmUuCgpyZWd1bGF0b3IgaXMgcGFzc2l2ZSBkZXZpY2UsIHNvbWVib2R5IHNob3Vs
ZCBjYWxsIGl0ICE/CgpBbmQgZGE5MjExLXJlZ3VsYXRvciBJUlEgaGFuZGxlciBzaG91bGQgcmVt
YWluIGRpc2FibGVkIHRpbGwgcmVzdW1lX2RldmljZV9pcnFzKCkgY2FsbC4KCm5vdGUuIHJlZ3Vs
YXRvcl9jbGFzcyBpbXBsZW1lbnRzIG9ubHkKCnN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29w
cyBfX21heWJlX3VudXNlZCByZWd1bGF0b3JfcG1fb3BzID0gewoJLnN1c3BlbmQJPSByZWd1bGF0
b3Jfc3VzcGVuZCwKCS5yZXN1bWUJCT0gcmVndWxhdG9yX3Jlc3VtZSwKfTsKCgo+IAo+Pj4gICAg
ICAgICAgIAlyZXN1bWVfZGV2aWNlX2lycXMoKTsKPj4+ICAgICAgICAgICAJZGV2aWNlX3dha2V1
cF9kaXNhcm1fd2FrZV9pcnFzKCk7Cj4+PiAgICAgICAgICAgCWNwdWlkbGVfcmVzdW1lKCk7Cj4+
PiAJfQo+Pj4gLm1hc3Rlcl94ZmVyX2F0b21pYygpIHNlZW1zIHRvIGJlIGludmFsaWQgZm9yIHRo
aXMgcXVlc3Rpb24gYXQgdGhpcwo+Pj4gdGltZT8KPj4+Cj4+Cj4gCgotLSAKQmVzdCByZWdhcmRz
LApncnlnb3JpaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
