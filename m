Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A55EC38A24
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 16:53:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1673D2063A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 16:53:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sq6EjwqT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JlpUvKEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1673D2063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlzcAdVkU45zdSeuO71yyKhNUtf5J8Dv+jvj8DTtktQ=; b=Sq6EjwqTVFHb8C
	yNFBcJQYPUNEw2InGvXVkkJ+NkgXjjNQnHMGzPbkphcvxioEz3y0E7YF7gAxHX7eFb2Uab5c0D2OP
	C2jFGXMGKo2RnDaHM4f5b9KPcRf0kJCPNlreX3ARJqAb1BmvGVLP55/L2KroIYVeBK8FLH2pNspPy
	+r+KOh/hhSOPTvePZfG20VRpYXAvhSeHgAQd58ZixrIAwarEc3PTJXf8/D1Xb/IN85Tw6c2lHJUvI
	V7Bh55yOwADlh1+1IxeghA5/iK+i+uvAnqKEsCm2dAMY0AxqDPIMR3LTa2PetorAih+Gk/9LSUvar
	Vkc2xOlcz4tjxoaP12tA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWjm3-0006Cl-GE; Thu, 07 May 2020 16:53:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWjlv-000656-3p; Thu, 07 May 2020 16:53:20 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA13720870;
 Thu,  7 May 2020 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588870398;
 bh=NujDvlsKX4AJIFdjy/ZhQD238Qri2e97mGwjx7CIqAE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JlpUvKEn0HsL1QzZ6h0GinpcwY43KR9GznAQ+FL4QesMiCkMJw93GU5TwBvOCIFlz
 oDiB+OAbY87TeFnWWySAZIX6SU7tU2T9wJTNWj2i7/rl5S7c6osUw7TFtna6K9D1mG
 wfTQmnKlhMMMYAIGnBkzPrnxLqDRRPiR4meHNTtg=
Date: Thu, 7 May 2020 09:53:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
Message-ID: <20200507095315.1154a1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAMpxmJWckQdKvUGFDAJ1WMtD9WoGWmGe3kyKYhcfRT2nOB93xw@mail.gmail.com>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMRc=Mf0ipaeLKhHCZaq2YeZKzi=QBAse7bEz2hHxXN5OL=ptg@mail.gmail.com>
 <20200506101236.25a13609@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMpxmJWckQdKvUGFDAJ1WMtD9WoGWmGe3kyKYhcfRT2nOB93xw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_095319_198362_C3F81168 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCA3IE1heSAyMDIwIDExOjI1OjAxICswMjAwIEJhcnRvc3ogR29sYXN6ZXdza2kgd3Jv
dGU6Cj4gxZtyLiwgNiBtYWogMjAyMCBvIDE5OjEyIEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5l
bC5vcmc+IG5hcGlzYcWCKGEpOgo+ID4KPiA+IE9uIFdlZCwgNiBNYXkgMjAyMCAwODozOTo0NyAr
MDIwMCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOiAgCj4gPiA+IHd0LiwgNSBtYWogMjAyMCBv
IDE5OjMxIEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+IG5hcGlzYcWCKGEpOiAgCj4g
PiA+ID4KPiA+ID4gPiBPbiBUdWUsICA1IE1heSAyMDIwIDE2OjAyOjI1ICswMjAwIEJhcnRvc3og
R29sYXN6ZXdza2kgd3JvdGU6ICAKPiA+ID4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gUHJvdmlkZSBk
ZXZtX3JlZ2lzdGVyX25ldGRldigpIC0gYSBkZXZpY2UgcmVzb3VyY2UgbWFuYWdlZCB2YXJpYW50
Cj4gPiA+ID4gPiBvZiByZWdpc3Rlcl9uZXRkZXYoKS4gVGhpcyBuZXcgaGVscGVyIHdpbGwgb25s
eSB3b3JrIGZvciBuZXRfZGV2aWNlCj4gPiA+ID4gPiBzdHJ1Y3RzIHRoYXQgaGF2ZSBhIHBhcmVu
dCBkZXZpY2UgYXNzaWduZWQgYW5kIGFyZSBkZXZyZXMgbWFuYWdlZCB0b28uCj4gPiA+ID4gPgo+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tp
QGJheWxpYnJlLmNvbT4gIAo+ID4gPiA+ICAKPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9uZXQvY29y
ZS9kZXYuYyBiL25ldC9jb3JlL2Rldi5jCj4gPiA+ID4gPiBpbmRleCA1MjIyODgxNzdiYmQuLjk5
ZGI1MzdjOTQ2OCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL25ldC9jb3JlL2Rldi5jCj4gPiA+ID4g
PiArKysgYi9uZXQvY29yZS9kZXYuYwo+ID4gPiA+ID4gQEAgLTk1MTksNiArOTUxOSw1NCBAQCBp
bnQgcmVnaXN0ZXJfbmV0ZGV2KHN0cnVjdCBuZXRfZGV2aWNlICpkZXYpCj4gPiA+ID4gPiAgfQo+
ID4gPiA+ID4gIEVYUE9SVF9TWU1CT0wocmVnaXN0ZXJfbmV0ZGV2KTsKPiA+ID4gPiA+Cj4gPiA+
ID4gPiArc3RydWN0IG5ldGRldmljZV9kZXZyZXMgewo+ID4gPiA+ID4gKyAgICAgc3RydWN0IG5l
dF9kZXZpY2UgKm5kZXY7Cj4gPiA+ID4gPiArfTsgIAo+ID4gPiA+Cj4gPiA+ID4gSXMgdGhlcmUg
cmVhbGx5IGEgbmVlZCB0byBkZWZpbmUgYSBzdHJ1Y3R1cmUgaWYgd2Ugb25seSBuZWVkIGEgcG9p
bnRlcj8KPiA+ID4gPiAgCj4gPiA+Cj4gPiA+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoYXQsIGJ1
dCBpdCByZWFsbHkgaXMgbW9yZSByZWFkYWJsZSB0aGlzIHdheS4KPiA+ID4gQWxzbzogdXNpbmcg
YSBwb2ludGVyIGRpcmVjdGx5IGRvZXNuJ3Qgc2F2ZSB1cyBhbnkgbWVtb3J5IG5vciBjb2RlCj4g
PiA+IGhlcmUuICAKPiA+Cj4gPiBJIGRvbid0IGNhcmUgZWl0aGVyIHdheSBidXQgZGV2bV9hbGxv
Y19ldGhlcmRldl9tcXMoKSBhbmQgY28uIGFyZSB1c2luZwo+ID4gdGhlIGRvdWJsZSBwb2ludGVy
IGRpcmVjdGx5LiBQbGVhc2UgbWFrZSB0aGluZ3MgY29uc2lzdGVudC4gRWl0aGVyIGRvCj4gPiB0
aGUgc2FtZSwgb3IgZGVmaW5lIHRoZSBzdHJ1Y3R1cmUgaW4gc29tZSBoZWFkZXIgYW5kIGNvbnZl
cnQgb3RoZXIKPiA+IGhlbHBlcnMgdG8gYWxzbyBtYWtlIHVzZSBvZiBpdC4gIAo+IAo+IEluIG9y
ZGVyIHRvIHVzZSBkZXZyZXNfZmluZCgpIHRvIGNoZWNrIGlmIHN0cnVjdCBuZXRfZGV2aWNlIGlz
IG1hbmFnZWQKPiBpbiBkZXZtX3JlZ2lzdGVyX25ldGRldigpIEkgbmVlZCB0byBrbm93IHRoZSBh
ZGRyZXNzIG9mIHRoZSByZWxlYXNlCj4gZnVuY3Rpb24gdXNlZCBieSBkZXZtX2FsbG9jX2V0aGVy
ZGV2X21xcygpLiBEbyB5b3UgbWluZCBpZiBJIG1vdmUgYWxsCj4gbmV0d29ya2luZyBkZXZyZXMg
cm91dGluZXMgKGN1cnJlbnRseSBvbmx5IGRldm1fYWxsb2NfZXRoZXJkZXZfbXFzKCkpCj4gaW50
byBhIHNlcGFyYXRlIC5jIGZpbGUgKGUuZy4gdW5kZXIgbmV0L2RldnJlcy5jKT8KClRvIGltcGxl
bWVudCBFZHdpbidzIHN1Z2dlc3Rpb24/IE1ha2VzIHNlbnNlLCBidXQgSSdtIG5vIGV4cGVydCwg
bGV0J3MKYWxzbyBDQyBIZWluZXIgc2luY2UgaGUgd2FzIGFza2luZyBhYm91dCBpdCBsYXN0IHRp
bWUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
