Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8557DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 21:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKcJ9M+TIliFISwvRLEcmOz4cgiB7EiZStMnRNVLhBA=; b=HifDuVSqtZIk33
	AHoACLpy5CKGNIxQUDHl7jimow/u4YlbMnnby2PErzot55WCCSUeqmigvxtLczlTN2Ago7btNs1cT
	VhCRLipex9HO3JeMihOGraHQKI8vdNISUv5lvpSVM6jk2lucBqavwQkcOWnpz0lXMVlPGLm7ymef4
	MV0ipLKYijmbmjKjMY2QMPg4W5g57vsicPBZmfawCvKKXnIDWZYwubMNm7lQI2RCxkQUKaVq1ndG0
	IUynyDNNFkNAxJJHt6+dy/oKxgmL0qUx3bVeGt4bwzB8oTmO0DsSBV19tSOs5Lb7mRZUsIbK7tcFL
	yyTOewllLOUB4KJEIYMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOnKa-00E7Ko-Hi; Mon, 28 Feb 2022 21:13:20 +0000
Received: from bedivere.hansenpartnership.com ([2607:fcd0:100:8a00::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOnKW-00E7Is-JQ; Mon, 28 Feb 2022 21:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1646082795;
 bh=b0jOc0WDOwLaR9eob939Fu/T9iRVE4QNy1gcUuEgORI=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=fTQp+HhEyDWfdTRw9MD74D4dNoy4lJbDD6ufhn8pOCgDG9LKN5I5E2XfQsXuEnTyE
 o41BjR/wB9Zx796mcVO5HItpPdbUBqFA5gZFvpxw0W0+8SaIBYecaW0t63X4w0ysYd
 Uxmzs2O4chqjQ5mD0m0R9/q9wYnJ2eru8WGs04Zw=
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id EE6F612811CE;
 Mon, 28 Feb 2022 16:13:15 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id fdilm1jMyJ2v; Mon, 28 Feb 2022 16:13:15 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1646082795;
 bh=b0jOc0WDOwLaR9eob939Fu/T9iRVE4QNy1gcUuEgORI=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=fTQp+HhEyDWfdTRw9MD74D4dNoy4lJbDD6ufhn8pOCgDG9LKN5I5E2XfQsXuEnTyE
 o41BjR/wB9Zx796mcVO5HItpPdbUBqFA5gZFvpxw0W0+8SaIBYecaW0t63X4w0ysYd
 Uxmzs2O4chqjQ5mD0m0R9/q9wYnJ2eru8WGs04Zw=
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:5c4:4300:c551::527])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 980CE1280320;
 Mon, 28 Feb 2022 16:13:11 -0500 (EST)
Message-ID: <ade13f419519350e460e7ef1e64477ec72e828ed.camel@HansenPartnership.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop
 body as a ptr
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Linus
 Torvalds <torvalds@linux-foundation.org>
Cc: Jakob Koschel <jakobkoschel@gmail.com>, alsa-devel@alsa-project.org, 
 linux-aspeed@lists.ozlabs.org, "Gustavo A. R. Silva"
 <gustavo@embeddedor.com>,  linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,  Cristiano Giuffrida
 <c.giuffrida@vu.nl>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 samba-technical@lists.samba.org, linux1394-devel@lists.sourceforge.net, 
 drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>, CIFS
 <linux-cifs@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, linux-scsi
 <linux-scsi@vger.kernel.org>, linux-rdma <linux-rdma@vger.kernel.org>, 
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe
 <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org, 
 kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,  Dan Carpenter
 <dan.carpenter@oracle.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Arnd
 Bergman <arnd@arndb.de>, Linux PM <linux-pm@vger.kernel.org>, intel-gfx
 <intel-gfx@lists.freedesktop.org>,  Brian Johannesmeyer
 <bjohannesmeyer@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, v9fs-developer@lists.sourceforge.net, 
 linux-tegra <linux-tegra@vger.kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
 Netdev <netdev@vger.kernel.org>,  linux-usb@vger.kernel.org, linux-wireless
 <linux-wireless@vger.kernel.org>,  Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux F2FS Dev Mailing List
 <linux-f2fs-devel@lists.sourceforge.net>, 
 tipc-discussion@lists.sourceforge.net, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, dma <dmaengine@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, Andrew Morton
 <akpm@linux-foundation.org>,  linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Mike Rapoport <rppt@kernel.org>
Date: Mon, 28 Feb 2022 16:13:09 -0500
In-Reply-To: <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
 <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_131316_671734_80A5922E 
X-CRM114-Status: GOOD (  28.25  )
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

T24gTW9uLCAyMDIyLTAyLTI4IGF0IDIxOjU2ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+IAo+IEFtIDI4LjAyLjIyIHVtIDIxOjQyIHNjaHJpZWIgSmFtZXMgQm90dG9tbGV5Ogo+ID4g
T24gTW9uLCAyMDIyLTAyLTI4IGF0IDIxOjA3ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Ogo+ID4gPiBBbSAyOC4wMi4yMiB1bSAyMDo1NiBzY2hyaWViIExpbnVzIFRvcnZhbGRzOgo+ID4g
PiA+IE9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDQ6MTkgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+ID4g
PiA+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+ID4gPiA+IFtTTklQXQo+ID4g
PiA+IEFueWJvZHkgaGF2ZSBhbnkgaWRlYXM/Cj4gPiA+IEkgdGhpbmsgd2Ugc2hvdWxkIGxvb2sg
YXQgdGhlIHVzZSBjYXNlcyB3aHkgY29kZSBpcyB0b3VjaGluZwo+ID4gPiAocG9zKQo+ID4gPiBh
ZnRlciB0aGUgbG9vcC4KPiA+ID4gCj4gPiA+IEp1c3QgZnJvbSBza2ltbWluZyBvdmVyIHRoZSBw
YXRjaGVzIHRvIGNoYW5nZSB0aGlzIGFuZCBleHBlcmllbmNlCj4gPiA+IHdpdGggdGhlIGRyaXZl
cnMvc3Vic3lzdGVtcyBJIGhlbHAgdG8gbWFpbnRhaW4gSSB0aGluayB0aGUKPiA+ID4gcHJpbWFy
eSBwYXR0ZXJuIGxvb2tzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4gPiA+IAo+ID4gPiBsaXN0X2Zv
cl9lYWNoX2VudHJ5KGVudHJ5LCBoZWFkLCBtZW1iZXIpIHsKPiA+ID4gICAgICAgaWYgKHNvbWVf
Y29uZGl0aW9uX2NoZWNraW5nKGVudHJ5KSkKPiA+ID4gICAgICAgICAgIGJyZWFrOwo+ID4gPiB9
Cj4gPiA+IGRvX3NvbWV0aGluZ193aXRoKGVudHJ5KTsKPiA+IAo+ID4gQWN0dWFsbHksIHdlIHVz
dWFsbHkgaGF2ZSBhIGNoZWNrIHRvIHNlZSBpZiB0aGUgbG9vcCBmb3VuZAo+ID4gYW55dGhpbmcs
IGJ1dCBpbiB0aGF0IGNhc2UgaXQgc2hvdWxkIHNvbWV0aGluZyBsaWtlCj4gPiAKPiA+IGlmIChs
aXN0X2VudHJ5X2lzX2hlYWQoZW50cnksIGhlYWQsIG1lbWJlcikpIHsKPiA+ICAgICAgcmV0dXJu
IHdpdGggZXJyb3I7Cj4gPiB9Cj4gPiBkb19zb21ldGhpbl93aXRoKGVudHJ5KTsKPiA+IAo+ID4g
U3VmZmljZT8gIFRoZSBsaXN0X2VudHJ5X2lzX2hlYWQoKSBtYWNybyBpcyBkZXNpZ25lZCB0byBj
b3BlIHdpdGgKPiA+IHRoZSBib2d1cyBlbnRyeSBvbiBoZWFkIHByb2JsZW0uCj4gCj4gVGhhdCB3
aWxsIHdvcmsgYW5kIGlzIGFsc28gd2hhdCBwZW9wbGUgYWxyZWFkeSBkby4KPiAKPiBUaGUga2V5
IHByb2JsZW0gaXMgdGhhdCB3ZSBsZXQgcGVvcGxlIGRvIHRoZSBzYW1lIHRoaW5nIG92ZXIgYW5k
Cj4gb3ZlciBhZ2FpbiB3aXRoIHNsaWdodGx5IGRpZmZlcmVudCBpbXBsZW1lbnRhdGlvbnMuCj4g
Cj4gT3V0IGluIHRoZSB3aWxkIEkndmUgc2VlbiBhdCBsZWFzdCB1c2luZyBhIHNlcGFyYXRlIHZh
cmlhYmxlLCB1c2luZwo+IGEgYm9vbCB0byBpbmRpY2F0ZSB0aGF0IHNvbWV0aGluZyB3YXMgZm91
bmQgYW5kIGp1c3QgYXNzdW1pbmcgdGhhdAo+IHRoZSBsaXN0IGhhcyBhbiBlbnRyeS4KPiAKPiBU
aGUgbGFzdCBjYXNlIGlzIGJvZ3VzIGFuZCBiYXNpY2FsbHkgd2hhdCBjYW4gYnJlYWsgYmFkbHku
CgpZZXMsIEkgdW5kZXJzdGFuZCB0aGF0LiAgSSdtIHNheWluZyB3ZSBzaG91bGQgcmVwbGFjZSB0
aGF0IGJvZ3VzIGNoZWNrcwpvZiBlbnRyeS0+c29tZXRoaW5nIGFnYWluc3Qgc29tZV92YWx1ZSBs
b29wIHRlcm1pbmF0aW9uIGNvbmRpdGlvbiB3aXRoCnRoZSBsaXN0X2VudHJ5X2lzX2hlYWQoKSBt
YWNyby4gIFRoYXQgc2hvdWxkIGJlIGEgb25lIGxpbmUgYW5kIGZhaXJseQptZWNoYW5pY2FsIGNo
YW5nZSByYXRoZXIgdGhhbiB0aGUgZXhwbG9zaW9uIG9mIGNvZGUgY2hhbmdlcyB3ZSBzZWVtIHRv
CmhhdmUgaW4gdGhlIHBhdGNoIHNlcmllcy4KCkphbWVzCgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
