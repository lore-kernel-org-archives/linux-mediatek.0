Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF27C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 17:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m0L+JEIvOnElP75gZnJtS9baOALmYOuw3TIIyFbUl1Q=; b=jjLUM71QE9jJRV
	z3RIvktNiWuae00s/bT0yzvSNLEx42V8wmOo50rlREv8/JV5K7VJvIhd0KHvbrdXwpjOjsM+O4OfU
	mSSesfDd97YT2NEEuvkhqNW7QsfO0Cp9PGo36bKXF6DWrpMHfSCaVKHB1nfVIwW1Wi93E2QJzgcxP
	kLCKLGHzNlUtZ2v3dcBWEfHqrXe95xQdzn16p/XWRQV7lQ+1I0WEwLUbfn1t/0GQkfTv1f8rnjMC0
	1Szeq3HVMTi9LBWJYJZPX5sbg7dOfbpsypW6SNtblnhuaQuNhmFVKIjIcPYbfjAyVXlSkI3N6ucsi
	5H9b/nYu1YzQ1WAI83PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbmmz-0023wk-RX; Tue, 05 Apr 2022 17:16:21 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbmmk-0023uE-Uo; Tue, 05 Apr 2022 17:16:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649178945; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VY+0yKVKo/OVl+of7lhiC+NmERw/mO0QIL7d/4Zt2BK2DvDHJe7p+FYSZU3ej7pPRyCuFkYQodsZwHnCI9+bDNxwX6ymxq8d2/QH2AiqgeWo721jljL1AS/mnCSF93Ovl7njzvvGJE/8nPx2+CC5dv5YPbayD+LBEOc4kDhEH7U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649178945;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=IGWowlI8r+WgRZZc7My5D0pUljhMLj42f7CltFmHSBg=; 
 b=IdFBMiNpx3O18xSKZrid62+fV4c3LjwQ0U5dbZNvNfinfrS7/JVi5247bRbVOWBFRMEJiwUeCx6wk3pzHbgYwYkhdYAco8Bl+gggK3j9lZ90igApJOd55kFN68d/l64iucbBTvPDLVxNw/1oB/WW11qtZRNczpsySkwuvQczSNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649178945; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IGWowlI8r+WgRZZc7My5D0pUljhMLj42f7CltFmHSBg=;
 b=MMUud1Fbn3lFWPmI1IjLMb9yr4uoLp/IjkTbnW4xngwQb5ukVWKyYDRd7ForX3lU
 eqqJTnUHQSunNNAPWg/AhRaRNXIuO13j9Kn+KjJHPo0ShvP3vajIfrUphFmiIEMh6Hz
 hGrk6GwnArH72BXcmPELd+uzA/l0c3659orphwOI=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649178943002319.0872332652002;
 Tue, 5 Apr 2022 10:15:43 -0700 (PDT)
Message-ID: <991f49fd-354b-6d07-6925-f79ca7f09838@arinc9.com>
Date: Tue, 5 Apr 2022 20:15:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: add label support for GMACs
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Ren=c3=a9_van_Dorst?=
 <opensource@vdorst.com>
References: <20220404114000.3549-1-arinc.unal@arinc9.com>
 <Ykri9tOtUDmXzHkG@lunn.ch>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Ykri9tOtUDmXzHkG@lunn.ch>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_101607_097257_8418A6F7 
X-CRM114-Status: GOOD (  17.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDQvMDQvMjAyMiAxNToyMiwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gT24gTW9uLCBBcHIgMDQs
IDIwMjIgYXQgMDI6NDA6MDBQTSArMDMwMCwgQXLEsW7DpyDDnE5BTCB3cm90ZToKPj4gRnJvbTog
UmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+Cj4+Cj4+IEFkZCBsYWJlbCBz
dXBwb3J0IGZvciBHTUFDcy4gVGhlIG5ldHdvcmsgaW50ZXJmYWNlIG9mIHRoZSBHTUFDIHdpbGwg
aGF2ZQo+PiB0aGUgc3RyaW5nIG9mIHRoZSBsYWJlbCBwcm9wZXJ0eSBkZWZpbmVkIG9uIHRoZSBk
ZXZpY2V0cmVlIGFzIGl0cyBuYW1lLgo+IAo+IFNvcnJ5LCBidXQgbm8uIFRoaXMgaGFzIGJlZW4g
ZGlzY3Vzc2VkIGEgZmV3IHRpbWVzLCB5b3UgbmVlZCBzb21ldGhpbmcKPiBpbiB1c2VyIHNwYWNl
LCB1ZGV2IG9yIHN5c3RlbWQgZXRjIHRvIHNldCBpbnRlcmZhY2UgbmFtZXMuCj4gCj4gUGxlYXNl
IGxvb2sgYmFjayBpbiB0aGUgYXJjaGl2ZSBhdCBwcmV2aW91cyBkaXNjdXNzaW9ucy4KClRoYW5r
cyBmb3IgdGhlIGhlYWRzIHVwIEFuZHJldywgSSBmb3VuZCB5b3VyIHF1b3RlIGZyb20gCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC9ZZGh3ZmElMkZFQ3FURTNyTHhAbHVubi5jaC86Cgo+IEkg
YWdyZWUgd2l0aCBSdXNzZWxsIGhlcmUuIEkgZG91YnQgdGhpcyBpcyBnb2luZyB0byBiZSBhY2Nl
cHRlZC4KPiAKPiBEU0EgaXMgc3BlY2lhbCBiZWNhdXNlIERTQSBpcyB2ZXJ5IG9sZCwgbXVjaCBv
bGRlciB0aGFuIERULCBhbmQgbWF5YmUKPiBvbGRlciB0aGFuIHVkZXYuIFRoZSBvbGQgRFNBIHBs
YXRmb3JtIGRyaXZlcnMgaGFkIGEgbWVjaGFuaXNtIHRvCj4gc3VwcGx5IHRoZSBpbnRlcmZhY2Ug
bmFtZSB0byB0aGUgRFNBIGNvcmUuIFdoZW4gd2UgYWRkZWQgYSBEVCBiaW5kaW5nCj4gdG8gRFNB
IHdlIGtlcHQgdGhhdCBtZWNoYW5pc20sIHNpbmNlIHRoYXQgbWVjaGFuaXNtIGhhZCBiZWVuIHVz
ZWQgZm9yCj4gYSBsb25nIHRpbWUuCj4gCj4gRXZlbiBpZiB5b3UgY291bGQgc2hvdyB0aGVyZSB3
YXMgYSBnZW5lcmljIG9sZCBtZWNoYW5pc20sIGZyb20gYmVmb3JlCj4gdGhlIGRheXMgb2YgRFQs
IHRoYXQgYWxsb3dlZCBpbnRlcmZhY2UgbmFtZXMgdG8gYmUgc2V0IGZyb20gcGxhdGZvcm0KPiBk
cml2ZXJzLCBpIGRvdWJ0IGl0IHdvdWxkIGJlIGFjY2VwdGVkIGJlY2F1c2UgdGhlcmUgaXMgbm8g
Y29udGludWl0eSwKPiB3aGljaCBEU0EgaGFzLgoKT24gTVQ3NjIxIFNvQywgd2UgY2FuIG11eCBh
IHN3aXRjaCBwaHkgb2YgTVQ3NTMwIChtdXN0IGJlIHBoeTAgb3IgNCkgdG8gCnRoZSBTb0MncyBn
bWFjMS4gU28gYSBVVFAgcG9ydCBjb25uZWN0ZWQgdG8gdGhhdCBwaHkgYmVjb21lcyBkaXJlY3Rs
eSAKY29ubmVjdGVkIHRvIHRoZSBTb0MncyBnbWFjMS4gQmVjYXVzZSBvZiB0aGF0LCBJIHdhbnRl
ZCB0byBiZSBhYmxlIHRvIApnaXZlIHRoZSBnbWFjJ3MgbmV0ZGV2IGludGVyZmFjZSBhIG5hbWUg
ZnJvbSBEVCBsaWtlIERTQS4gSG93ZXZlciwgdGhlIApxdW90ZSBhYm92ZSBtYWtlcyBzZW5zZSB3
aHkgbm90IHRvIGRvIHNvLgoKVGhhbmtzLgpBcsSxbsOnCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
