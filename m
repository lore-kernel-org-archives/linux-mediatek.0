Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22EDC10DAA
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 07:37:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4466721D7B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 07:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CuFUoJCu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKfNkPvS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4466721D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3707qsmp28Gxmaw5XLQ3IiOOIkNEsdhPki9oTS11p5Y=; b=CuFUoJCujdXV92iJWmttm4hWw
	S4ccOJmltISQQdHZE1zxiDqjQfn1I/znERtamP6LSwREqUDcpMSPAngInrX+aQ9IBeaP8dPVUZ/vI
	eRQWfXBAJgcpRu8ss1YlPnLImXkkRhZJMyLNHUM8bEZ1w2ugDP7vrNfBPSz2M3De0OdQ5sB1B8epr
	cxexttkEBa5zgoyw7kYzsxnOxfPZp0cplqqJYFQY8wLAch7sTa0Uh2F0TB42kIxB5q0WMSqYJFMAy
	gC2X1GZZlkheduVgVmDfBuP4ZAf/8w3yFPkwXSijOUYNqTuUj13aJJNymfduW7Oxk+r4VbdncvEqu
	vyh8XaIjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFufJ-0004Rm-Oo; Wed, 09 Sep 2020 07:37:13 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFuf9-0004Nc-7G
 for linux-mediatek@lists.infradead.org; Wed, 09 Sep 2020 07:37:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id w5so1764248wrp.8
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 00:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wWgDfU9nZzKqdvbVx8y3VyybzRdiTj4qfLQtg4MRrko=;
 b=vKfNkPvSqiCi09QBOevuKE3WTzNxDu6Exs/ueisabXStQuSK3AB5ekMSlyhO5Ekvzn
 Qd42VrxYIuys9XrdUyMAgBTxiOfliJDL/us5t5yVi/CRjDKifwYXMMWmsN6IENcrBNn0
 2u8lOJf7c5sdSWLaXG0j1K1QdQv4UacDhefcSjtVSzcPgMBw8i7Y0T/8F8iaeOaJBbOC
 3HmFIgTcbFfE1C1wPpIcIN6tQoefM20O7EQEn6KaMJVASgtpOz3Z/0JtPUDnMhAB31Ou
 wuNA7DVOA9MllnqftEPlF8ZOYjL6ksA2pJQPP8YeU0qTjxikv/kDs9yYbovFv+EyyUnz
 xU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wWgDfU9nZzKqdvbVx8y3VyybzRdiTj4qfLQtg4MRrko=;
 b=XZATc2wHXpnhParK60TQJeX//sqOlPswHnQERvmrU8/LNCWFDxY4mSydp1oaQ482w7
 /D9rZAh6/wIQ3qD4n+IA/5TnLL5y6VL6swzFJRtQh7NwTEZQ15eWnf4WUiEEhe/C8vyH
 626b2qd2BuRuk/eikBuI5+m6eZ3lqUAlFd09xcpbmrwoJISQRE1KsdIeMOG2CViZALGb
 DjaIWePYDs+UgWFqPWkOnbu4XcPxikNQBRg03jv9MIHwwe8DQ5iFlLAi+g3xbKbyBgmS
 eb9vatukRTkPswa90yV91aiVUFxsd+VRfV6py9e3C1A80G65n5aj/p+gMVZBtKFfnPD/
 aSlQ==
X-Gm-Message-State: AOAM532IIuEDGyLEw41dWH0IWBlgaJOtUQ6C8hvHFyTKHKLVAMRsZR9q
 PJOkFrbtT+uenZuntSWJGiSj+T53j1QdcA==
X-Google-Smtp-Source: ABdhPJzwqJgPmAj9vMXTqolup+yM+UOmHtcxAg+FNcdJ6X/69jQchDfjUR+5dlw1mGEfxngwZltkHQ==
X-Received: by 2002:adf:e391:: with SMTP id e17mr2316189wrm.289.1599637022185; 
 Wed, 09 Sep 2020 00:37:02 -0700 (PDT)
Received: from dell ([91.110.221.179])
 by smtp.gmail.com with ESMTPSA id 91sm3266190wrq.9.2020.09.09.00.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 00:37:01 -0700 (PDT)
Date: Wed, 9 Sep 2020 08:36:59 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
Message-ID: <20200909073659.GA218742@dell>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597661277-27862-10-git-send-email-gene.chen.richtek@gmail.com>
 <20200828104053.GM1826686@dell>
 <CAE+NS37uFoDhWyGkw0WTu+tR+_85EwzYRqecNMG6nK6b2J=9jg@mail.gmail.com>
 <20200908114819.GO4400@dell>
 <CAE+NS36MVA=9e0Ev73gpJ-gOcY+_aNveTr+DhquD6iqY-GKXCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS36MVA=9e0Ev73gpJ-gOcY+_aNveTr+DhquD6iqY-GKXCQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_033703_431389_B6E79E54 
X-CRM114-Status: GOOD (  26.94  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwOSBTZXAgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDnmnIg45pelIOmAseS6jCDkuIvljYg3OjQ45a+r
6YGT77yaCj4gPgo+ID4gT24gVHVlLCAwMSBTZXAgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4K
PiA+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ45pyIMjjm
l6Ug6YCx5LqUIOS4i+WNiDY6NDDlr6vpgZPvvJoKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgMTcg
QXVnIDIwMjAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gRnJvbTogR2VuZSBD
aGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gUmVtb3ZlIHVu
dXNlIHJlZ2lzdGVyIGRlZmluaXRpb24uCj4gPiA+ID4KPiA+ID4gPiBUaGlzIHNob3VsZCBiZSBp
biBhIHNlcGFyYXRlIHBhdGNoLgo+ID4gPiA+Cj4gPiA+ID4gPiBNZXJnZSBkaWZmZXJlbnQgc3Vi
LWRldmljZXMgSTJDIHJlYWQvd3JpdGUgZnVuY3Rpb25zIGludG8gb25lIFJlZ21hcCwKPiA+ID4g
PiA+IGJlY2F1c2UgUE1JQyBhbmQgTERPIHBhcnQgbmVlZCBDUkMgYml0cyBmb3IgYWNjZXNzIHBy
b3RlY3Rpb24uCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxn
ZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL21m
ZC9LY29uZmlnICAgICAgICB8ICAgMSArCj4gPiA+ID4gPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYyAgfCAyNjAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
Cj4gPiA+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmggfCAyNDAgLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+ID4gPiA+ICAzIGZpbGVzIGNoYW5nZWQs
IDIyNiBpbnNlcnRpb25zKCspLCAyNzUgZGVsZXRpb25zKC0pCj4gPiA+ID4gPiAgZGVsZXRlIG1v
ZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL210NjM2MC5oCj4gPiA+ID4gPgo+ID4gPiA+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL0tjb25maWcgYi9kcml2ZXJzL21mZC9LY29uZmlnCj4g
PiA+ID4gPiBpbmRleCBhMzdkN2QxLi4wNjg0ZGRjIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJp
dmVycy9tZmQvS2NvbmZpZwo+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9tZmQvS2NvbmZpZwo+ID4g
PiA+ID4gQEAgLTkxMyw2ICs5MTMsNyBAQCBjb25maWcgTUZEX01UNjM2MAo+ID4gPiA+ID4gICAg
ICAgc2VsZWN0IE1GRF9DT1JFCj4gPiA+ID4gPiAgICAgICBzZWxlY3QgUkVHTUFQX0kyQwo+ID4g
PiA+ID4gICAgICAgc2VsZWN0IFJFR01BUF9JUlEKPiA+ID4gPiA+ICsgICAgIHNlbGVjdCBDUkM4
Cj4gPiA+ID4gPiAgICAgICBkZXBlbmRzIG9uIEkyQwo+ID4gPiA+ID4gICAgICAgaGVscAo+ID4g
PiA+ID4gICAgICAgICBTYXkgWSBoZXJlIHRvIGVuYWJsZSBNVDYzNjAgUE1VL1BNSUMvTERPIGZ1
bmN0aW9uYWwgc3VwcG9ydC4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYz
NjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiA+ID4gaW5kZXggNjc3
Yzk3NC4uZTk5NTIyMCAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1j
b3JlLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ID4gPiA+
IEBAIC0xNCw3ICsxNCw1MyBAQAo+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4K
PiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4gPiA+ID4KPiA+ID4gPiA+IC0j
aW5jbHVkZSA8bGludXgvbWZkL210NjM2MC5oPgo+ID4gPiA+ID4gK2VudW0gewo+ID4gPiA+ID4g
KyAgICAgTVQ2MzYwX1NMQVZFX1RDUEMgPSAwLAo+ID4gPiA+ID4gKyAgICAgTVQ2MzYwX1NMQVZF
X1BNSUMsCj4gPiA+ID4gPiArICAgICBNVDYzNjBfU0xBVkVfTERPLAo+ID4gPiA+ID4gKyAgICAg
TVQ2MzYwX1NMQVZFX1BNVSwKPiA+ID4gPiA+ICsgICAgIE1UNjM2MF9TTEFWRV9NQVgsCj4gPiA+
ID4gPiArfTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICtzdHJ1Y3QgbXQ2MzYwX2RkYXRhIHsKPiA+
ID4gPiA+ICsgICAgIHN0cnVjdCBpMmNfY2xpZW50ICppMmNbTVQ2MzYwX1NMQVZFX01BWF07Cj4g
PiA+ID4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPiA+ID4gPiArICAgICBzdHJ1Y3Qg
cmVnbWFwICpyZWdtYXA7Cj4gPiA+ID4gPiArICAgICBzdHJ1Y3QgcmVnbWFwX2lycV9jaGlwX2Rh
dGEgKmlycV9kYXRhOwo+ID4gPiA+ID4gKyAgICAgdW5zaWduZWQgaW50IGNoaXBfcmV2Owo+ID4g
PiA+ID4gKyAgICAgdTggY3JjOF90YmxbQ1JDOF9UQUJMRV9TSVpFXTsKPiA+ID4gPiA+ICt9Owo+
ID4gPiA+Cj4gPiA+ID4gVGhpcyBpcyBub3QgYSBuZXcgc3RydWN0dXJlLCByaWdodD8gIFdoZXJl
IHdhcyB0aGlzIGJlZm9yZT8gIFN1cmVseSBpdAo+ID4gPiA+IHNob3VsZCBiZSByZW1vdmVkIGZy
b20gd2hlcmV2ZXIgaXQgd2FzIGluIHRoZSBzYW1lIHBhdGNoIHRoYXQgcGxhY2VzCj4gPiA+ID4g
aXQgaGVyZT8KPiA+ID4gPgo+ID4gPgo+ID4gPiBObywgaXQgaXMgbWVyZ2UgZnJvbSBoZWFkZXIg
ZmlsZSB0byBzb3VyY2UgY29kZSBmb3IgdW51c2UgaW4gb3RoZXIgc3ViLW1vZHVsZS4KPiA+Cj4g
PiBTbyB3aGVyZSBkaWQgaXQgY29tZSBmcm9tIGFuZCB3aHkgZG9uJ3QgSSBzZWUgdGhlIHJlbW92
YWwgaW4gdGhpcwo+ID4gcGF0Y2g/Cj4gPgo+IAo+IENoYW5nZSBpcyBpbiB0aGUgYm90dG9tIG9m
IHRoaXMgcGF0Y2guCj4gVGhlcmUgaXMgYSBsaXR0bGUgY29uZnVzZSBwYXJ0IGluICJbUEFUQ0gg
djQgNS85XSBtZmQ6IG10NjM2MDogUmVuYW1lCj4gbXQ2MzYwX3BtdV9kYXRhIGJ5IG10NjM2MF9k
ZGF0YSIKPiBUaGUgIlBBVENIIDUvOSIgY2hhbmdlIG10NjM2MF9wbXVfZGF0YSB0byBtdDYzNjBf
ZGRhdGEgaW5zdGVhZCBvZiBtdDYzNjBfZGF0YS4KPiBJIHdpbGwgdXBkYXRlIFBBVENIIHY1IHRv
IGZpeCBpdC4KPiAKPiBbUEFUQ0ggdjQgOS85XQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L21mZC9tdDYzNjAuaCBiL2luY2x1ZGUvbGludXgvbWZkL210NjM2MC5oCj4gLXN0cnVjdCBtdDYz
NjBfZGF0YSB7Cj4gLSAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjW01UNjM2MF9TTEFWRV9N
QVhdOwo+IC0gICAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+IC0gICAgICAgc3RydWN0IHJlZ21h
cCAqcmVnbWFwOwo+IC0gICAgICAgc3RydWN0IHJlZ21hcF9pcnFfY2hpcF9kYXRhICppcnFfZGF0
YTsKPiAtICAgICAgIHVuc2lnbmVkIGludCBjaGlwX3JldjsKPiAtfTsKPiAKPiBbUEFUQ0ggdjQg
NS85XQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaCBiL2luY2x1ZGUv
bGludXgvbWZkL210NjM2MC5oCj4gLXN0cnVjdCBtdDYzNjBfcG11X2RhdGEgewo+ICtzdHJ1Y3Qg
bXQ2MzYwX2RhdGEgewo+ICAgICAgICAgc3RydWN0IGkyY19jbGllbnQgKmkyY1tNVDYzNjBfU0xB
VkVfTUFYXTsKPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiAgICAgICAgIHN0cnVjdCBy
ZWdtYXAgKnJlZ21hcDsKCk9oLCB5b3UndmUgcmVuYW1lZCBpdCB3aGlsc3QgbW92aW5nIGl0LiAg
VGhhdCBpcyBwcm9iYWJseSBub3QgYmVzdApwcmFjdGlzZSwgYXMgaXQgY2F1c2VzIHRoaXMga2lu
ZCBvZiBjb25mdXNpb24uCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmlj
YWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
