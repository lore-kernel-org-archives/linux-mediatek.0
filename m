Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61966C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 13:04:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1313423D39
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 13:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1313423D39
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fzYccIWp5+Cc2rGC15cZfaW66xc2uqFoopHOM/oGMTQ=; b=1scehfZNkqu7up+8Ng3OdMjGi
	LdYQ35f/u4TTI/2sQRvyyrvmgagcs+S8kW2+eRktSx7EPcL6gJzX6EU/bvxgSto+Q4MoohocBOI0C
	acGvcDuzYgJWQhx3Xdf3xyZZpt5rQtNGXV3Ts+W2fbb8WjbbW2hZczypQMyZIH53by0HDHYwth5Yw
	xP+fSgU2py/aNsIOD8DYB3JkbwK5wq/i/mC7MF0gA4JG7uYXh898PX6ePPaH+7AtOBn5kE4DaAQts
	OgOE1iAisPgx2ULGH4yiGO0Agyb3kDGFTP4OYZTB6BuoAzFuTElwdR109aQznSxnuYecLWGbkrqUN
	bb1zJkCDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knLc2-00056i-D5; Thu, 10 Dec 2020 13:04:02 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knLbx-00055k-JF; Thu, 10 Dec 2020 13:03:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAD3uin051755;
 Thu, 10 Dec 2020 07:03:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607605436;
 bh=f6EbvCETCqSbP/orqL1NF04MBD/Ro0HKcfNe82m54FY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QbYV18BV+ETMCAtJEOvPsyGwtNILsBN0ohNrp9nvzItvWXUpn8qsdQuMqtn6WkRQ9
 ojIJE6BqaJ+I2TPH4CVjsVFTiptSk4qutH2wLmpr4WqYttJA5gctrYzgbznrN9lUhW
 JlWUE9uaLYxpPXBDpiXaJF1lCZ6UFWIQux38b0Tg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAD3ufN087548
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 07:03:56 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 07:03:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 07:03:56 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAD3qMV006134;
 Thu, 10 Dec 2020 07:03:53 -0600
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
To: Qii Wang <qii.wang@mediatek.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
 <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
 <1607326431.25719.33.camel@mhfsdcap03>
 <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
 <1607565387.25719.43.camel@mhfsdcap03>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
Date: Thu, 10 Dec 2020 15:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607565387.25719.43.camel@mhfsdcap03>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_080357_745484_988631E4 
X-CRM114-Status: GOOD (  20.89  )
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

CgpPbiAxMC8xMi8yMDIwIDAzOjU2LCBRaWkgV2FuZyB3cm90ZToKPiBPbiBNb24sIDIwMjAtMTIt
MDcgYXQgMTg6MzUgKzAyMDAsIEdyeWdvcmlpIFN0cmFzaGtvIHdyb3RlOgo+Pgo+Pj4KPj4+IE9u
IFRodSwgMjAyMC0xMi0wMyBhdCAxMDowMSArMDIwMCwgR3J5Z29yaWkgU3RyYXNoa28gd3JvdGU6
Cj4+Pj4KPj4+PiBPbiAwMy8xMi8yMDIwIDAzOjI1LCBRaWkgV2FuZyB3cm90ZToKPj4+Pj4gT24g
V2VkLCAyMDIwLTEyLTAyIGF0IDE2OjM1ICswMTAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6Cj4+Pj4+
PiBIaSwKPj4+Pj4+Cj4+Pj4+Pj4gU29tZSBpMmMgZGV2aWNlIGRyaXZlciBpbmRpcmVjdGx5IHVz
ZXMgSTJDIGRyaXZlciB3aGVuIGl0IGlzIG5vdwo+Pj4+Pj4+IGJlaW5nIHN1c3BlbmRlZC4gVGhl
IGkyYyBkZXZpY2VzIGRyaXZlciBpcyBzdXNwZW5kZWQgZHVyaW5nIHRoZQo+Pj4+Pj4+IE5PSVJR
IHBoYXNlIGFuZCB0aGlzIGNhbm5vdCBiZSBjaGFuZ2VkIGR1ZSB0byBvdGhlciBkZXBlbmRlbmNp
ZXMuCj4+Pj4+Pj4gVGhlcmVmb3JlLCB3ZSBhbHNvIG5lZWQgdG8gbW92ZSB0aGUgc3VzcGVuZCBo
YW5kbGluZyBmb3IgdGhlIEkyQwo+Pj4+Pj4+IGNvbnRyb2xsZXIgZHJpdmVyIHRvIHRoZSBOT0lS
USBwaGFzZSBhcyB3ZWxsLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUWlpIFdhbmcg
PHFpaS53YW5nQG1lZGlhdGVrLmNvbT4KPj4+Pj4+Cj4+Pj4+PiBJcyB0aGlzIGEgYnVnZml4IGFu
ZCBzaG91bGQgZ28gaW50byA1LjEwPyBPciBjYW4gaXQgd2FpdCBmb3IgNS4xMT8KPj4+Pj4+Cj4+
Pj4+Cj4+Pj4+IFllcywgQ2FuIHlvdSBoZWxwIHRvIGFwcGx5IGl0IGludG8gNS4xMD8gVGhhbmtz
Cj4+Pj4KPj4+PiBUbyBiZSBob25lc3QgaWYgeW91IHN0aWxsIGRvIGhhdmUgYW55IGkyYyBkZXZp
Y2Ugd2hpY2ggYWNjZXNzaW5nIGkyYyBidXNzIGFmdGVyIF9ub2lycQo+Pj4+IHN0YWdlIGFuZCB5
b3VyIGRyaXZlciBkb2VzIG5vdCBpbXBsZW1lbnQgLm1hc3Rlcl94ZmVyX2F0b21pYygpIC0geW91
IGRlZmluaXRlbHkgaGF2ZSBhIGJpZ2dlciBwcm9ibGVtLgo+Pj4+IFNvIGFkZGluZyBJUlFGX05P
X1NVU1BFTkQgc291bmQgbGlrZSBhIGhhY2sgYW5kIHByb2JhYmx5IHdvcmtzIGp1c3QgYnkgbHVj
ay4KPj4+Pgo+Pj4KPj4+IEF0IHByZXNlbnQsIGl0IGlzIG9ubHkgYSBwcm9ibGVtIGNhdXNlZCBi
eSBtaXNzaW5nIGludGVycnVwdHMsCj4+PiBhbmQgLm1hc3Rlcl94ZmVyX2F0b21pYygpIGp1c3Qg
YSBpbXBsZW1lbnQgaW4gcG9sbGluZyBtb2RlLiBXaHkgbm90IHNldAo+Pj4gdGhlIGludGVycnVw
dCB0byBhIHN0YXRlIHRoYXQgY2FuIGFsd2F5cyBiZSB0cmlnZ2VyZWQ/Cj4+Pgo+Pj4KPj4KPj4g
QmVjYXVzZSB5b3UgbXVzdCBub3QgdXNlIGFueSBJUlEgZHJpdmVuIG9wZXJhdGlvbnMgYWZ0ZXIg
X25vaXJxIHN1c3BlbmQgc3RhdGUgYXMgaXQgbWlnaHQgKGFuZCBtb3N0IHByb2JhYmx5IHdpbGwp
Cj4+IGNhdXNlIHVucHJlZGljdGFibGUgYmVoYXZpb3IgbGF0ZXIgIGluIHN1c3BlbmRfZW50ZXIo
KToKPj4KPj4gCWFyY2hfc3VzcGVuZF9kaXNhYmxlX2lycXMoKTsKPj4gCUJVR19PTighaXJxc19k
aXNhYmxlZCgpKTsKPj4gXmFmdGVyIHRoaXMgcG9pbnQgYW55IElSUSBkcml2ZW4gSTJDIHRyYW5z
ZmVyIHdpbGwgY2F1c2UgSVJRIHRvIGJlIHJlLWVuYWJsZWQKPj4KPj4gaWYgeW91IG5lZWQgIHR1
cm4gb2ZmIGRldmljZSBmcm9tIHBsYXRmb3JtIGNhbGxiYWNrcyAtICAubWFzdGVyX3hmZXJfYXRv
bWljKCkgaGFzIHRvIGJlIGltcGxlbWVudGVkIGFuZCB1c2VkLgo+PiAgICAKPiBNYXliZSBteSBj
b21tZW50IGlzIGEgYml0IGRpc3R1cmJpbmcuT3VyIHB1cnBvc2UgaXMgbm90IHRvIGNhbGwgaTJj
IGFuZAo+IHVzZSBpbnRlcnJ1cHRzIGFmdGVyIF9ub2lycSBwYXVzZXMuU28gV2UgdXNlCj4gaTJj
X21hcmtfYWRhcHRlcl9zdXNwZW5kZWQmaTJjX21hcmtfYWRhcHRlcl9yZXN1bWVkIHRvIGJsb2Nr
IHRoZXNlIGkyYwo+IHRyYW5zZmVyc++8jCBUaGVyZSB3aWxsIG5vdCBoYXZlIGFueSBJUlEgZHJp
dmVuIEkyQyB0cmFuc2ZlciBhZnRlciB0aGlzCj4gcG9pbnQ6Cj4gICAgICAgICAgYXJjaF9zdXNw
ZW5kX2Rpc2FibGVfaXJxcygpOwo+ICAgICAgICAgIEJVR19PTighaXJxc19kaXNhYmxlZCgpKTsK
PiBCdXQgc29tZSBkZXZpY2UgZHJpdmVyIHdpbGwgZG8gaTJjIHRyYW5zZmVyIGFmdGVyCj4gZHBt
X25vaXJxX3Jlc3VtZV9kZXZpY2VzIGluIGRwbV9yZXN1bWVfbm9pcnEoUE1TR19SRVNVTUUpIHdo
ZW4gb3VyCj4gZHJpdmVyIGlycSBoYXNuJ3QgcmVzdW1lLgo+IAl2b2lkIGRwbV9yZXN1bWVfbm9p
cnEocG1fbWVzc2FnZV90IHN0YXRlKQo+IAl7Cj4gICAgICAgICAgCWRwbV9ub2lycV9yZXN1bWVf
ZGV2aWNlcyhzdGF0ZSk7CgpKdXN0IHRvIGNsYXJpZnkuIFlvdSBoYXZlIHJlc3VtZSBzZXF1ZW5j
ZSBpbiBkcG1fbm9pcnFfcmVzdW1lX2RldmljZXMKICBkcG1fbm9pcnFfcmVzdW1lX2RldmljZXMg
LT4gcmVzdW1lIEkyQyAtPiByZXN1bWUgc29tZSBkZXZpY2UgLT4gZG8gaTJjIHRyYW5zZmVyIGFm
dGVyPwoKSXMgInNvbWUgZGV2aWNlIiBpbiBLZXJuZWwgbWFpbmxpbmU/Cgo+ICAgICAgICAgIAly
ZXN1bWVfZGV2aWNlX2lycXMoKTsKPiAgICAgICAgICAJZGV2aWNlX3dha2V1cF9kaXNhcm1fd2Fr
ZV9pcnFzKCk7Cj4gICAgICAgICAgCWNwdWlkbGVfcmVzdW1lKCk7Cj4gCX0KPiAubWFzdGVyX3hm
ZXJfYXRvbWljKCkgc2VlbXMgdG8gYmUgaW52YWxpZCBmb3IgdGhpcyBxdWVzdGlvbiBhdCB0aGlz
Cj4gdGltZT8KPiAKCi0tIApCZXN0IHJlZ2FyZHMsCmdyeWdvcmlpCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
