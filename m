Return-Path: <SRS0=+2Q0=DW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71225C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 16:07:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE94822210
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Oct 2020 16:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nx4tEwvt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE94822210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8T7+miPDkHkA628QlBdBk3+p/O3r8ctXl9LdqALICZo=; b=nx4tEwvtB2q8C9+dGM1kvteMK
	kdI+l+Y5cU/ptvx4SnbcEuab5U96vIkR+lMd3l9WV1vMcFUbz4jUE3ko4LN2C2pIRihnEhPVGo4fq
	4RFFh09XJlp/RFaIVbBOaoKJ9z8u7vCYS+tuKG5B1EVdnhwnVOiMKnVdcw3C8Jzl8D/yKs8PYv79s
	vhkxLqZlgeQ+rJVoFdNqEjtCslmjfMFPLSb+eDTbv/lp4NHGeuCV0XGLxvMRqGMvv6E++UTXvTC8V
	Dks/yRn0ltRF3s5d74ibKbmuydHDVy6m6YpCb8/sTzfqE90XGOUFAWTniIBUnc8VMHCVHDTGBDl0X
	b3li+NyBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT5n5-0007Vf-Uo; Thu, 15 Oct 2020 16:07:43 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT5n1-0007Ub-ID; Thu, 15 Oct 2020 16:07:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 7D5DE1F45C3D
Subject: Re: [PATCH] arm64: dts: mediatek: Add smi_common node for MT8183
To: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
References: <20201001162823.3592352-1-enric.balletbo@collabora.com>
 <d937daf7-469f-8d74-4267-057b89cf1dd1@gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <dbb00f05-6c1f-e5a2-12ae-aca494ecc6da@collabora.com>
Date: Thu, 15 Oct 2020 18:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d937daf7-469f-8d74-4267-057b89cf1dd1@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_120739_724967_C7129BBC 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 fparent@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWF0dGhpYXMsCgpPbiAyLzEwLzIwIDExOjE3LCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3RlOgo+
IAo+IAo+IE9uIDAxLzEwLzIwMjAgMTg6MjgsIEVucmljIEJhbGxldGJvIGkgU2VycmEgd3JvdGU6
Cj4+IFRoZSBTTUkgKFNtYXJ0IE11bHRpbWVkaWEgSW50ZXJmYWNlKSBDb21tb24gaXMgYSBicmlk
Z2UgYmV0d2VlbiB0aGUgbTR1Cj4+IChNdWx0aW1lZGlhIE1lbW9yeSBNYW5hZ2VtZW50IFVuaXQp
IGFuZCB0aGUgTXVsdGltZWRpYSBIVy4gVGhpcyBibG9jayBpcwo+PiBuZWVkZWQgdG8gc3VwcG9y
dCBkaWZmZXJlbnQgbXVsdGltZWRpYSBmZWF0dXJlcywgbGlrZSBkaXNwbGF5LCB2aWRlbwo+PiBk
ZWNvZGUsIGFuZCBjYW1lcmEuIEFsc28gaXMgbmVlZGVkIHRvIGNvbnRyb2wgdGhlIHBvd2VyIGRv
bWFpbnMgb2Ygc3VjaAo+PiBIVyBibG9ja3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEVucmljIEJh
bGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+Cj4+IC0tLQo+Pgo+
PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My5kdHNpIHwgMTAgKysrKysr
KysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaQo+PiBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kKPj4gaW5kZXggYzJmZDE0MWFmY2Y2
Li45MDgyYmM2NWUxNWUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ4MTgzLmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
ODMuZHRzaQo+PiBAQCAtOTE2LDYgKzkxNiwxNiBAQCBtbXN5czogc3lzY29uQDE0MDAwMDAwIHsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDE+Owo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgfTsKPj4gwqAgK8KgwqDCoMKgwqDCoMKgIHNtaV9jb21tb246IHNtaUAx
NDAxOTAwMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibWVkaWF0
ZWssbXQ4MTgzLXNtaS1jb21tb24iLCAic3lzY29uIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnID0gPDAgMHgxNDAxOTAwMCAwIDB4MTAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX1NNSV9DT01NT04+LAo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZtbXN5cyBDTEtfTU1fU01JX0NPTU1PTj4sCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8Jm1tc3lzIENMS19NTV9HQUxTX0NPTU0wPiwK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmbW1zeXMgQ0xLX01NX0dBTFNf
Q09NTTE+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJhcGIiLCAi
c21pIiwgImdhbHMwIiwgImdhbHMxIjsKPj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+ICsKPiAKPiBI
YXZpbmcgYSBsb29rIGF0IHRoZSBiaW5kaW5ncyBkZXNjcmlwdGlvbiwgaXQgc3RhdGVzIHRoYXQg
dGhlIHBvd2VyLWRvbWFpbnMKPiBwaGFuZGxlIGlzIGEgcmVxdWlyZWQgcHJvcGVydHkuCgpIbW1t
LCB0aGlzIG1ha2VzIG1lIHRoaW5rIHRoYXQgdGhlcmUgaXMgYSBraW5kIG9mIGNpcmN1bGFyIGRl
cGVuZGVuY3kgZm9yCk1UODE4Mywgc28gTVQ4MTgzIHBvd2VyIGRvbWFpbnMgZGVwZW5kcyBvbiBz
bWlfY29tbW9uIGFuZCBzbWlfY29tbW9uIGRlcGVuZHMgb24KTVQ4MTgzIHBvd2VyIGRvbWFpbnMu
IFdpbGwgdGFrZSBhIGRlZXBlciBsb29rLgoKVGhhbmtzCiAgRW5yaWMKCgo+IFNvIEkgc3VwcG9z
ZSB5b3UgaGF2ZSB0byBiYXNlIHRoaXMgb24gdGhlIHBvd2VyIGRvbWFpbnMgc2VyaWVzLgo+IAo+
IFJlZ2FyZHMsCj4gTWF0dGhpYXMKPiAKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGltZ3N5czogc3lz
Y29uQDE1MDIwMDAwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDgxODMtaW1nc3lzIiwgInN5c2NvbiI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJlZyA9IDwwIDB4MTUwMjAwMDAgMCAweDEwMDA+Owo+PgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
