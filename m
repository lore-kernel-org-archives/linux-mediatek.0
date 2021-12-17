Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiRfcQIwd5oEGGbH1iXPgXMODOAmYl8uRz52AnvMwZg=; b=06c1xvXMf22GgW
	X9cOaZ6CDBRvltXq2XT/0ZyXXk/inowhm5xJIQFI5WI1FFVMHo6t7+M4lD8uZyANcpuBUXRSbzCOc
	py+LzxZioL/93QpECMAdzz2JE+7dszeD9lL1ilhO/PfUlNU6YPC1c6N/zDAFkFcgizhSqT1f0jWPN
	s4S30rVX3iLPDj65gpPCSk3+5lIykvK+wCPtnRso7Jct0S9pOZzd6D42wb+I4BHMWvimyUDkUNM0Q
	U8RrHoseiSyZeBh1/MRJcZvO8LZUhXk9arZ5rg0LttVPwJlhhvtkZeWsr4fhGsO7QDpfdDoPbMQGT
	hIqOZuG1qxvk3Tn4catg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1my9jQ-009FNb-IM; Fri, 17 Dec 2021 09:40:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1my9ix-009F5M-Au; Fri, 17 Dec 2021 09:40:24 +0000
X-UUID: fd699d95ee1e45208ab5bb49582b4174-20211217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LFuvPDvVS7YXcoMdMdzOjSmOP3E+q15kLCf4Y2V8vIc=; 
 b=lJ/qNDefG158NJQf/f+jeyZEKB5aSq8cpoZp2DZReS47XgS+St4mbcqMEH19a312jzSPdILwyyyKhpnoj3m6Zbq394Y6ldalfCYE0E4IMaP7bbixgsYGF++2jn67dYJdT+TVUheFT8w6HfwxjXH4nSNc02RqeqfG6G1N1FVgJj4=;
X-UUID: fd699d95ee1e45208ab5bb49582b4174-20211217
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1512744946; Fri, 17 Dec 2021 02:40:17 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 01:40:16 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 17:40:14 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Dec 2021 17:40:13 +0800
Message-ID: <609eb0eea02b2304f427d4f2e9c26de9f2149f06.camel@mediatek.com>
Subject: Re: [PATCH] usb: xhci: skip re-check pending port event if hibernated
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>, Jun Li
 <lijun.kernel@gmail.com>
CC: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux USB List <linux-usb@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 lkml <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 Yun-Chien Yu <yun-chien.yu@mediatek.com>
Date: Fri, 17 Dec 2021 17:40:15 +0800
In-Reply-To: <e7a6e45e-68ce-54a5-9632-80244dd1e4c7@linux.intel.com>
References: <20211209072218.21651-1-chunfeng.yun@mediatek.com>
 <c448da77-f2f3-8b79-fc4b-b9dcff727c6e@linux.intel.com>
 <CAKgpwJXxtLwOjxjg3vFHiqS92j6rx_b1+C-bRwDnp+PBvXCMTg@mail.gmail.com>
 <e7a6e45e-68ce-54a5-9632-80244dd1e4c7@linux.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_014023_423731_B6EAEB77 
X-CRM114-Status: GOOD (  28.96  )
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

T24gVHVlLCAyMDIxLTEyLTE0IGF0IDEyOjA1ICswMjAwLCBNYXRoaWFzIE55bWFuIHdyb3RlOg0K
PiBPbiAxNC4xMi4yMDIxIDEwLjAwLCBKdW4gTGkgd3JvdGU6DQo+ID4gTWF0aGlhcyBOeW1hbiA8
bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+IOS6jjIwMjHlubQxMuaciDEx5pel5ZGo5YWt
DQo+ID4gMDE6NTblhpnpgZPvvJoNCj4gPiA+IA0KPiA+ID4gT24gOS4xMi4yMDIxIDkuMjIsIENo
dW5mZW5nIFl1biB3cm90ZToNCj4gPiA+ID4gV2hlbiB4SENJIGNvbnRyb2xsZXIgaGliZXJuYXRl
ZCwgdGhlIHJvb3QgaHViIGxvc3QgcG93ZXIsIGlmDQo+ID4gPiA+IGNvbnRyb2xsZXINCj4gPiA+
ID4gc3VwcG9ydCBQb3J0IFBvd2VyIENvbnRyb2wgKFBQQyksIFBQIGlzIG5vdCBzZXQgYXQNCj4g
PiA+ID4geGhjaV9yZXN1bWUoKSBhbmQNCj4gPiA+ID4gc2V0IGJ5IGh1Yl9yZXNldF9yZXN1bWUo
KSBsYXRlciwgc28gbm8gbmVlZCBjaGVjayBwZW5kaW5nIHBvcnQNCj4gPiA+ID4gZXZlbnQuDQo+
ID4gPiA+IElmIFBQQyBpcyBub3Qgc3VwcG9ydGVkLCBkZXZpY2UgaXMgZGlzY29ubmVjZWQsIHNl
ZW1zIGRvIG5vdA0KPiA+ID4gPiBzZW5kIG91dA0KPiA+ID4gPiBVMyBMRlBTIHdha2Ugc2lnbmFs
LCBubyBuZWVkIHJlLWNoZWNrIGFnYWluIGFuZCBkcm9wIDEyMG1zDQo+ID4gPiA+IGRlbGF5IHRv
DQo+ID4gPiA+IHNhdmUgcmVzdW1lIHRpbWUuDQo+ID4gPiA+IA0KPiA+ID4gPiBSZXBvcnRlZC1i
eTogWXVuLUNoaWVuIFl1IDx5dW4tY2hpZW4ueXVAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gDQo+ID4gPiBUaGFua3MsIGFkZGluZw0KPiA+IA0KPiA+IEhpIE1hdGhp
YXMsIENodW5mZW5nDQo+ID4gDQo+ID4gSSBoYXZlIGEgcXVlc3Rpb24gb24gdGhpcywgaWYgdGhl
cmUgaXMgbm8gYW55IHVzYiBkZXZpY2VzIGNvbm5lY3RlZA0KPiA+IGJlZm9yZSBzdXNwZW5kLCBk
byB3ZSBuZWVkIHRoaXMgMTIwbXMgZGVsYXkgdG8gY2hlY2sgYWdhaW4/DQo+ID4gU28gZG8gd2Ug
bmVlZCBvbmUgbW9yZSBjb25kaXRpb24gdG8gbGltaXQgdGhpcyBsaWtlPw0KPiA+IGlmICghcGVu
ZGluZ19wb3J0ZXZlbnQgJiYgIWhpYmVybmF0ZWQgJiYgeGhjaV9oYXNfY2hpbGRfZGV2aWNlKCkp
DQo+IA0KPiBUaGUgMTIwbXMgZGVsYXkgd2FzIGFkZGVkIHRvIG1ha2Ugc3VyZSB3ZSBjYXRjaCB0
aGUgc2Vjb25kIHdha2UNCj4gc2lnbmFsDQo+IGZyb20gYSBkZXZpY2UgaW4gY2FzZSBob3N0IG1p
c3NlZCB0aGUgZmlyc3QgVTMgZXhpdCBMRlBTIHdha2V1cA0KPiBzaWduYWwuDQo+IA0KPiBFdmVu
IGlmIG5vIGRldmljZXMgYXJlIGNvbm5lY3RlZCB0aGlzIG1pZ2h0IGJlIGhlbHBmdWwgaWYgYSBk
ZXZpY2UgaXMNCj4gY29ubmVjdGVkIHdoaWxlIGhvc3QgaXMgc3VzcGVuZGVkLg0KPiBJIGhhdmVu
J3QgY2hlY2tlZCBhbnkgdGltaW5nIGZvciB0aGUgbGluayB0cmFpbmluZyBkdXJpbmcNCj4gZW51
bWVyYXRpb24sDQo+IGJ1dCBpdCBhbHNvIHVzZXMgTEZQUyBzaWduYWxsaW5nLCBhbmQgY29ubmVj
dGVkIGRldmljZSBpc24ndCB2aXNpYmxlDQo+IHRvDQo+IGRyaXZlciB1bnRpbCBsaW5rIGlzIHN1
Y2Nlc3NmdWxseSB0cmFpbmVkLg0KRm9yIHhoY2ktbXRrLCByb290aHViIGNhbid0IGRldGVjdCBk
ZXZpY2UgdW50aWwgcm9vdCBodWIgc2V0IFBvcnRQb3dlciwNCnNlZW1zIGFsc28gdGhlIHNhbWUg
Zm9yIG90aGVyIHhoY2kgY29udHJvbGxlcnMgdGhhdCBzdXBwb3J0IFBvcnQgUG93ZXINCkNvbnRy
b2wuDQo+IA0KPiBTbyB0aGUgb3JpZ2luYWwgMTIwbXMgZGVsYXkgcGF0Y2ggbWlnaHQgYXMgYSBw
b3NpdGl2ZSBzaWRlIGVmZmVjdA0KPiBlbnN1cmUNCj4gZHJpdmVyIGRvZXNuJ3Qgc3VzcGVuZCBo
b3N0IG1pZCBkZXZpY2UgZW51bWVyYXRpb24uDQp0aGlzIGlzIGluIHJlc3VtZT8NCg0KPiANCj4g
Q291bGQgYmUgbG9va2VkIGludG8gbW9yZSwgYnV0IEkgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIHRo
aXMgcGF0Y2ggYnkNCj4gQ2h1bmZlbmcNCj4gDQo+IFRoYW5rcw0KPiBNYXRoaWFzDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
