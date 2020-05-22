Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B80AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 07:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D0422072C
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 07:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VSnKYxLL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D0422072C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4HC6raL3Uq3ei2JqDiaVrcceh/uo9pra61lCJpnILyM=; b=VSnKYxLLnlSbzN
	eTyvMGdV7+lgxYDbQu9aMdqS5KcfdMBW8vSNE5x2PC+UIBeliZhDhNrev/rEa7gkSa7u5dv025A+P
	RB8n4Y/m3zhrm/Ueb+86Rm4aakaC/fY/Khrk87oNZY2AkxjrI/g1i7OE4Edq7Wmg3zdXsBC3BGw5c
	qgvij3w4NYalLF76MOU5xBAwAcCvvD/N2ZODkSUjyQOiLqOME4GHDi85LrV6+ceT484xuU69MvQlv
	B2YydDJQT3Q99U8imayyhyf/8b4AtLiT2mnJuzMmLg9gkO4CrY8Y+VuWEZJIATscQjUFe5ho+1tqa
	P8Z0zYLz8vMQ84+ubBMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc2Rj-00065i-0f; Fri, 22 May 2020 07:50:23 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc2RX-00058U-KA; Fri, 22 May 2020 07:50:13 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N8EdM-1iyQNb1CBU-0149I5; Fri, 22 May 2020 09:50:07 +0200
Received: by mail-qv1-f52.google.com with SMTP id f89so4333577qva.3;
 Fri, 22 May 2020 00:50:06 -0700 (PDT)
X-Gm-Message-State: AOAM530R0t3h1hLMYn7jbao71H246fmuPZyPOxR07eCscGCHmYfH2Lse
 U1G5oz+8aKC8DtGRBkH4wMcuEFFyLj+PJUotIFc=
X-Google-Smtp-Source: ABdhPJzTX2r7xydKqbJAwhK2+QTpPNnz3LZTzzTI94w3ZoU1ZULE1GyhxQ/7OzXgkRXqp42O1WffI9SLJ6KlmPBCdgc=
X-Received: by 2002:a05:6214:1392:: with SMTP id
 g18mr2340434qvz.210.1590133805879; 
 Fri, 22 May 2020 00:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200520112523.30995-1-brgl@bgdev.pl>
 <20200520112523.30995-7-brgl@bgdev.pl>
 <CAK8P3a3jhrQ3p1JsqMNMOOnfo9t=rAPWaOAwAdDuFMh7wUtZQw@mail.gmail.com>
 <CAMRc=MeuQk9rFDFGWK0ijsiM-r296cVz9Rth8hWhW5Aeeti_cA@mail.gmail.com>
 <CAK8P3a1nhPj6kRhwyXzDK3BGbh66XG6Fmp44QuM1NhFPPBTtPQ@mail.gmail.com>
 <CAMRc=MfVkbDSfEV71SD57dpYthdx5epD0FOvjRx8qQGT+SgsTQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfVkbDSfEV71SD57dpYthdx5epD0FOvjRx8qQGT+SgsTQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 May 2020 09:49:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3qXf2NSDEoMHOQnChZmqQdVF--f_PFFHCyOKPhA=iW_w@mail.gmail.com>
Message-ID: <CAK8P3a3qXf2NSDEoMHOQnChZmqQdVF--f_PFFHCyOKPhA=iW_w@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] net: ethernet: mtk-eth-mac: new driver
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Provags-ID: V03:K1:USBbwF6HgbAE/UaI9FWkNynmcR1PFTWqvmWH4lSbDsyAAw6HGXY
 4ioLuoUXEDP0t0NTtzpNK4QZnA2GWw0TwkrNVZTyk9Ialx8Nu29bKn9ULDIPF0lE2VoVWGn
 y++Tsp95zgOsvHGOgLMKJKIwl1FUwBMJkGSFxcZ75d/coDgO30UHRVDOiIz6HW9bBmdXzeq
 uO74xgyqbLA/1rbzR6Bcw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:O+aWlIl/z2c=:Jb5hFpu6STZPpArs9bqCCK
 1J/ok7Etq+sBifGaHb81AyxsP5U15kQQxfHqFrT09HoaA3jH9mpV02DqgIqbw90YWch3D+TTU
 +M8jWmEmM3CFWpYLxrHHvVukFOsbyAWWBWu3Cz5ARzeHt24M/9H2q8/e+KMv6EV+jOz+99ik3
 QgduYzGyGhmTXnmfobt9cnRvBQzk/ICN1UsAAyb0KoHC5w0lBXYo3LLoZ1ZpwAmReMyzfnXNo
 /vyZSFEcL2OU+B3lqEuEIZUw+f5IFSxHj+eBDqpWST30x8jmz0pWaM2OdB4KV3uu4tOoSXQY/
 hmKH+XdVfOk2SfvI307RRUAmXJtAGE2xEUfmL7tPHgwc56ocNgb321jT14tr3IQl4nFrzHDpy
 V/dUp/jeirJp4GERqY54bQLzE3p4pVohdSJk4a40CtfN3nKU9UAI6SdPx/bcWh+z6cifcsMpT
 OA/2XffAfnPyKzTMPIa6+z2KGbPq/nN20rhEn8FCEvjBYVjxzl+Pv9Ti4KGmX6ceYuS7OIFni
 /506e2Gj+PMseOuWfmYZO9ODWYb9CQbAlr+nHovcTm+4k9JgesAypomlgRNtd5KtTFt2hQAzL
 VN/U7Av1+eIAAkbRMtGU/zzOY30x4A/kAVWQQ6sAk5IYDUTwZ3laMNJXGKBpj6dIMRh4Ch/Cc
 p9jFchpU1s/FGRIMDx3iyuBgnZaZ7GxjOU0dthtcVSyYwJQEemiNKLs349+CM22nvVNzv79vg
 JGfFxj2ZRDe5SGA9WxTT0044P7QsDevxclXIdUUPsQBD3+Vu8xHcJywq2IfoB2qLSsaI/NwQ0
 pH5X60a+kHvz+0zKHQ5o/NEcEVRtHyTi1Ejvl7tb5Je1DHBVRY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_005011_975939_ADAFC220 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>, DTML <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Networking <netdev@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMjIsIDIwMjAgYXQgOTo0NCBBTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPiB3cm90ZToKPiDFm3IuLCAyMCBtYWogMjAyMCBvIDIzOjIzIEFybmQgQmVyZ21h
bm4gPGFybmRAYXJuZGIuZGU+IG5hcGlzYcWCKGEpOgo+ID4gT24gV2VkLCBNYXkgMjAsIDIwMjAg
YXQgNzozNSBQTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKPiA+
ID4gxZtyLiwgMjAgbWFqIDIwMjAgbyAxNjozNyBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRl
PiBuYXBpc2HFgihhKToKCj4gPiA+IE15IHRoaW5raW5nIHdhcyB0aGlzOiBpZiBJIG1hc2sgdGhl
IHJlbGV2YW50IGludGVycnVwdCAoVFgvUlgKPiA+ID4gY29tcGxldGUpIGFuZCBhY2sgaXQgcmln
aHQgYXdheSwgdGhlIHN0YXR1cyBiaXQgd2lsbCBiZSBhc3NlcnRlZCBvbgo+ID4gPiB0aGUgbmV4
dCBwYWNrZXQgcmVjZWl2ZWQvc2VudCBidXQgdGhlIHByb2Nlc3Mgd29uJ3QgZ2V0IGludGVycnVw
dGVkCj4gPiA+IGFuZCB3aGVuIEkgdW5tYXNrIGl0LCBpdCB3aWxsIGZpcmUgcmlnaHQgYXdheSBh
bmQgSSB3b24ndCBoYXZlIHRvCj4gPiA+IHJlY2hlY2sgdGhlIHN0YXR1cyByZWdpc3Rlci4gSSBu
b3RpY2VkIHRoYXQgaWYgSSBhY2sgaXQgYXQgdGhlIGVuZCBvZgo+ID4gPiBuYXBpIHBvbGwgY2Fs
bGJhY2ssIEkgZW5kIHVwIG1pc3NpbmcgY2VydGFpbiBUWCBjb21wbGV0ZSBpbnRlcnJ1cHRzCj4g
PiA+IGFuZCBlbmQgdXAgc2VlaW5nIGEgbG90IG9mIHJldHJhbnNtaXNzaW9ucyBldmVuIGlmIEkg
cmVyZWFkIHRoZSBzdGF0dXMKPiA+ID4gcmVnaXN0ZXIuIEknbSBub3QgeWV0IHN1cmUgd2hlcmUg
dGhpcyByYWNlIGhhcHBlbnMuCj4gPgo+ID4gUmlnaHQsIEkgc2VlLiBJZiB5b3UganVzdCBhY2sg
YXQgdGhlIGVuZCBvZiB0aGUgcG9sbCBmdW5jdGlvbiwgeW91IG5lZWQKPiA+IHRvIGNoZWNrIHRo
ZSByaW5ncyBhZ2FpbiB0byBlbnN1cmUgeW91IGRpZCBub3QgbWlzcyBhbiBpbnRlcnJ1cHQKPiA+
IGJldHdlZW4gY2hlY2tpbmcgb2JzZXJ2aW5nIGJvdGggcmluZ3MgdG8gYmUgZW1wdHkgYW5kIHRo
ZSBpcnEtYWNrLgo+ID4KPiA+IEkgc3VzcGVjdCBpdCdzIHN0aWxsIGNoZWFwZXIgdG8gY2hlY2sg
dGhlIHR3byByaW5ncyB3aXRoIGFuIHVuY2FjaGVkCj4gPiByZWFkIGZyb20gbWVtb3J5IHRoYW4g
dG8gdG8gZG8gdGhlIHJlYWQtbW9kaWZ5LXdyaXRlIG9uIHRoZSBtbWlvLAo+ID4gYnV0IHlvdSdk
IGhhdmUgdG8gbWVhc3VyZSB0aGF0IHRvIGJlIHN1cmUuCj4gPgo+Cj4gVW5mb3J0dW5hdGVseSB0
aGUgUEhZIG9uIHRoZSBib2FyZCBJIGhhdmUgaXMgMTAwTWJwcyB3aGljaCBpcyB0aGUKPiBsaW1p
dGluZyBmYWN0b3IgaW4gYmVuY2htYXJraW5nIHRoaXMgZHJpdmVyLiA6KAo+Cj4gSWYgeW91J3Jl
IGZpbmUgd2l0aCB0aGlzIC0gSSdkIGxpa2UgdG8gZml4IHRoZSBtaW5vciBpc3N1ZXMgeW91Cj4g
cG9pbnRlZCBvdXQgYW5kIHN0aWNrIHdpdGggdGhlIGN1cnJlbnQgYXBwcm9hY2ggZm9yIG5vdy4g
V2UgY2FuIGFsd2F5cwo+IGZpeCB0aGUgaW1wbGVtZW50YXRpb24gaW4gdGhlIGZ1dHVyZSBvbmNl
IGEgYm9hcmQgd2l0aCBhIEdpZ2FiaXQgUEhZCj4gaXMgb3V0LiBNb3N0IGV0aGVybmV0IGRyaXZl
cnMgZG9uJ3QgdXNlIHN1Y2ggZmluZS1ncmFpbmVkIGludGVycnVwdAo+IGNvbnRyb2wgYW55d2F5
LiBJIGV4cGVjdCB0aGUgcGVyZm9ybWFuY2UgZGlmZmVyZW5jZXMgdG8gYmUgbWluaXNjdWxlCj4g
cmVhbGx5LgoKT2ssIGZhaXIgZW5vdWdoLiBUaGUgQlFMIGxpbWl0aW5nIGlzIHRoZSBwYXJ0IHRo
YXQgbWF0dGVycyB0aGUgbW9zdApmb3IgcGVyZm9ybWFuY2Ugb24gc2xvdyBsaW5lcyAocHJldmVu
dGluZyBsb25nIGxhdGVuY2llcyBmcm9tCmJ1ZmZlciBibG9hdCksIGFuZCAgeW91IGhhdmUgdGhh
dCBub3cuCgogICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
