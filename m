Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A61C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7V+lnYk+y6io7KEEyr5I4ls24/hRoLQFBzsk6u8EPDU=; b=bQ8ocUfk44W3JlIE4m+tLUT919
	wbl1XdhKiXSofNecG6HpyP2suN+KWVHzR4+ByFke+JzM5BS6K8YyaPssQ5p4FnTBaa/61VPKyXErx
	U6gcoeD2EbZRlyACP9RPe+xnhW4RExH5zF7fYShNElsh89YDWwgT4PnHKQ9zfDCO3XZWoLvpgic/q
	rWuCVTMqcSUddXpRGUU7dVcBZFQb4T0gLxtukwO47WQ+ny+gRWkpWBO60tLcChQteUs0Ic9mgYPpq
	CHH4COZbKaxrp2XEj4/lbeiYoZDPbaVq/UGmJlddJhh6MI2EKQeszCpuY5yHW2/wES+S4C4SmLhfz
	fmnl6OQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQWkn-00DUo1-GS; Sat, 05 Mar 2022 15:55:33 +0000
Received: from mail.va1der.ca ([107.6.27.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQWka-00DUn6-0e; Sat, 05 Mar 2022 15:55:21 +0000
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=va1der.ca;
 i=@va1der.ca; q=dns/txt; s=ed25519; t=1646495700; h=message-id : date
 : mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : from;
 bh=iB36mKWPFNKpuPteQpvXkT3BcjvBBjX1dXMUnSEFcLU=;
 b=mfoIrC2Oxu4KO/Fx3Eo+Z38JX2qTyqtsZFrL94tshjUm/gDLIqQ/PsVISlu8todD2P++c
 qlFqXk3JeqFkhspDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=va1der.ca;
 i=@va1der.ca; q=dns/txt; s=rsa2k; t=1646495700; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding : from;
 bh=iB36mKWPFNKpuPteQpvXkT3BcjvBBjX1dXMUnSEFcLU=;
 b=QEgxiB0gweN45RtVUn/bPmC+bueX4TiwsFY2kb6cDAI9Uw8NgmgJEEb0I7uECiwuDzO1a
 llEkungbhaC73EyaxCwc2ilLRFdJ0tPo8HTk45E+ZqKhY011JCcw2YtAaiA4r9udR1ifxOn
 D1ema0umlHikTWMGrJsipOOvS+1JgsCQ8mx2TYA9xHiMJD/AxVRPQKdXzFTkbllQc7KsrPO
 S7rfWHJ1r7tuZuLTBTp/zIffShY7MKsx/gkp2nYlaOb8c095BuFQ/fcDynv2tYRHs+JEGiZ
 d5/1Rnyg694D9GBzPmwreQvV0HPeuJu0oFTFZ4FBTLI/9W7EqitPfxRyodaw==
Received: from [192.168.2.28] (unknown [170.199.128.50])
 by mail.va1der.ca (Postfix) with ESMTPSA id 663B381740;
 Sat,  5 Mar 2022 11:55:00 -0400 (AST)
Message-ID: <9dd737bd-d626-7a49-a48b-ff6771b262a7@va1der.ca>
Date: Sat, 5 Mar 2022 11:54:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] arm: dts: mt7623: increase passive cooling trip
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20210725163451.217610-1-linux@fw-web.de>
From: Kurt Fitzner <kurt@va1der.ca>
In-Reply-To: <20210725163451.217610-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_075520_254985_B5E64FBD 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhpcyBpc3N1ZSBhbmQgcGF0Y2gganVzdCBjYW1lIHRvIG15IGF0dGVudGlvbiwgbXkgYXBvbG9n
aWVzIGZvciBsYXRlIApjb21tZW50cy4KClRoZSBzb2x1dGlvbiBwcm92aWRlZCBpbiB0aGlzIHBh
dGNoIGlzLCBJIGJlbGlldmUsIG5vdCBvcHRpbWFsLgoKT24gMjAyMS0wNy0yNSAxOjM0IHAubS4s
IEZyYW5rIFd1bmRlcmxpY2ggd3JvdGU6Cj4gRnJvbTogRnJhbmsgV3VuZGVybGljaCA8ZnJhbmst
d0BwdWJsaWMtZmlsZXMuZGU+Cj4gCj4gTVQ3NjIzL0JQSS1SMiBoYXMgaWRsZSB0ZW1wZXJhdHVy
ZSBhZnRlciBib290dXAgZnJvbSA0OCBkZWdyZWVzIGNlbHNpdXMKPiBpbmNyZWFzZSB0aGUgcGFz
c2l2ZSB0cmlwIHRlbXAgdGhyZXNob2xkIHRvIG5vdCB0cm90dGxlIENQVSBmcmVxdWVuY3kgYXQK
PiB0aGlzIHRlbXBlcmF0dXJlCgpUaGUgZHRzIGZpbGUgZm9yIHRoZSBtdDc2MjMgaGFzIGZvdXIg
dHJpcCBwb2ludHM6Ci0gVHJpcCBwb2ludCAwLCBUeXBlPVBhc3NpdmUgQCA0N8KwQyAob3JpZ2lu
YWxseSwgbm93IDU3wrBDKQotIFRyaXAgcG9pbnQgMSwgVHlwZT1BY3RpdmUgQCA2N8KwQwotIFRy
aXAgcG9pbnQgMiwgVHlwZT1Ib3QgQCA4N8KwQwotIFRyaXAgcG9pbnQgMywgVHlwZT1Dcml0aWNh
bCBAIDEwN8KwQwoKSXQgbWFrZXMgbGl0dGxlIHNlbnNlIHRvIGhhdmUgcGFzc2l2ZSBDUFUgdGhy
b3R0bGluZyBlbXBsb3llZCAqYmVmb3JlKiAKZW5nYWdpbmcgYSBmYW4uICBHZW5lcmFsbHkgdXNl
cnMgd2FudCBhIGZhbiAoaWYgcHJlc2VudCkgdG8gYmUgZW5nYWdlZCAKYmVmb3JlIGludGVudGlv
bmFsIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uIGlzIGVtcGxveWVkLgoKPiAgIAkJCQkJY3B1X3Bh
c3NpdmU6IGNwdS1wYXNzaXZlIHsKPiAtCQkJCQkJdGVtcGVyYXR1cmUgPSA8NDcwMDA+Owo+ICsJ
CQkJCQl0ZW1wZXJhdHVyZSA9IDw1NzAwMD47CgpUaGUgb2xkIHRlbXBlcmF0dXJlIG9mIDQ3wrBD
IGFwcGVhcnMsIGluIHByYWN0aWNlLCB0byBiZSBhIGdvb2QgCnRlbXBlcmF0dXJlIGZvciBhbiBh
Y3RpdmUgY29vbGluZyB0cmlwIHBvaW50LiAgSXQgaXMganVzdCBhYm92ZSB0aGUgCnRlbXBlcmF0
dXJlIHRoYXQgYSBnZW5lcmFsbHkgaWRsZSBtdDc2MjMgc2l0cyBhdCBpbiBlbmNsb3N1cmVzIHdo
ZXJlIAp0aGlzIFNvQyBpcyBlbXBsb3llZCwgYnV0IGFsc28gYSB0ZW1wZXJhdHVyZSB0aGF0IGEg
Q1BVIHVuZGVyIGxvYWQgd2lsbCAKcXVpY2tseSByZWFjaC4KClRoZXJlZm9yZSBJIHByb3Bvc2Ug
dGhlIHR5cGVzIG9mIHRyaXAgcG9pbnRzIDAgYW5kIDEgYmUgcmV2ZXJzZWQgYW5kIHRoZSAKdGVt
cGVyYXR1cmVzIGxlZnQgYXMgdGhleSB3ZXJlLgoKCi0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL210
NzYyMy5kdHNpCTIwMjItMDItMjcgMTg6MzY6MzMgLTA0MDAKKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvbXQ3NjIzLmR0c2kJMjAyMi0wMy0wNSAxMTozNzo1MiAtMDQwMApAQCAtMTU4LDE5ICsxNTgs
MTkgQEAKCiAgCQkJCXRoZXJtYWwtc2Vuc29ycyA9IDwmdGhlcm1hbCAwPjsKCiAgCQkJCXRyaXBz
IHsKICAJCQkJCWNwdV9wYXNzaXZlOiBjcHUtcGFzc2l2ZSB7Ci0JCQkJCQl0ZW1wZXJhdHVyZSA9
IDw1NzAwMD47CisJCQkJCQl0ZW1wZXJhdHVyZSA9IDw0NzAwMD47CiAgCQkJCQkJaHlzdGVyZXNp
cyA9IDwyMDAwPjsKLQkJCQkJCXR5cGUgPSAicGFzc2l2ZSI7CisJCQkJCQl0eXBlID0gImFjdGl2
ZSI7CiAgCQkJCQl9OwoKICAJCQkJCWNwdV9hY3RpdmU6IGNwdS1hY3RpdmUgewogIAkJCQkJCXRl
bXBlcmF0dXJlID0gPDY3MDAwPjsKICAJCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+OwotCQkJCQkJ
dHlwZSA9ICJhY3RpdmUiOworCQkJCQkJdHlwZSA9ICJwYXNzaXZlIjsKICAJCQkJCX07CgogIAkJ
CQkJY3B1X2hvdDogY3B1LWhvdCB7CiAgCQkJCQkJdGVtcGVyYXR1cmUgPSA8ODcwMDA+OwogIAkJ
CQkJCWh5c3RlcmVzaXMgPSA8MjAwMD47CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
