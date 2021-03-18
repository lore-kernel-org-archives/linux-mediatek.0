Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB386C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 14:12:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5562364F24
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 14:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5562364F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rmOQz8JO26WWVOe3Ge0+G/VDdblGZYh4hwb3CXZo5uc=; b=JYcxCBfldJ8P34LkORYWyzjnI
	UwPijQDXjKx2AQF6TV8VZ7osc2hJy+g4yIV3WsEGqLv8f2W/rv1qn+AslrHArOQkZR7Upz5ZN/56Z
	pu44UrCty4qa/v9o6L4+fRYaA1PBnbhr4mjUmlczma7we4fDSWKwfAEOiBy678ZdBO/hzw890RCbB
	HicwpASzHKV8Ymf3qlzMm0s3QSsZLvq86w80uRFBSFbUY3UB0Dvf9rKI+iaUIKDDi0iZbCtuuNspP
	ioZu4FcABUPq+a7FP75B56CZ0CFS7EwPddMri2ZGh+us8KLiBKobCksFup19g7IDm3FLePpvzKxwL
	5NRTEeeyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMtNm-005RvU-Ir; Thu, 18 Mar 2021 14:12:14 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMtNi-005RuA-4n; Thu, 18 Mar 2021 14:12:12 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso5305663otq.3; 
 Thu, 18 Mar 2021 07:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=a50uAhSDderMggKK8RFXjAkHNeNGYqS63dv1RpSuGyc=;
 b=pgxmK244IvKUUg6U3uQJetoS+P0+C8mca9STqv7sC4W8TZCh5gs2zqBkg6m0/1MHrd
 zDFi6ctfeSfr8D88QSqD9ENo8Fl4YJw7lv2//Gpd8mYKT9ly3G7ZVDAOmodrP16TY9HS
 uoGzDxmAp4r4JyuepHDPwpObn9sADhthag0/LMq3gq29wU0ZBi8RFp2hacxC3Edr+5Er
 lUR9QIiOoDQgqsyjHZi0xHL3qwzfIclZOB+C2mjjAW80ukWtpIOziYTHHGQZvu28DGRu
 5WKgq+LPHhqNfM7jkltObWELadokmy3rzlZP1I8knEpn0jzma24CppiQeUYNtKyl+5Gh
 buiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=a50uAhSDderMggKK8RFXjAkHNeNGYqS63dv1RpSuGyc=;
 b=iCuWpZOhLsfdgl4Xpk5KBwM8WaW0BXX3YfJwxxxecH4t/oaMDq0mjpxpnBzzdpNGys
 7fwu/skb7l7DBSXz8v7yj4Hk6HVl94sASu89uni+88Zhzc8+1kjWr9m1/4T+ONQ/DPdJ
 1xu0i5o7o6cBIaKtj8NpyITdE9oIS/63c8q6qg4O2scLDdrQQs565qZCA39HGDqRwUVn
 UyWhe/ZFQmc5W3wSnQWcJSHPSYE6czlNgdrEZi78ZIYBlV8/E13AA0pWi0G8ZEQinjQl
 12i0ajHa1TNrpQUeguPWpmpBeVna17Bxn0MHu5Oz63hGcYiwcwTUoFsSgbB2/UmQgxMa
 fT8Q==
X-Gm-Message-State: AOAM5328175ewHviwXd6bFbPdiaocIOyIlUH93n4ruy2EokCVJ/M9LO6
 Q8GkbGz+gm5/GJwoVtWyVucog3/yi81qwxDHJ2I=
X-Google-Smtp-Source: ABdhPJw4DThuBC9XHi/q9lTAvpKLtWEp1SFB4rMT1KtPPWqAyCi1s2Scsgg6cdjyBkmyan/VAEidSQQvMEkhEBLQHUs=
X-Received: by 2002:a9d:7b4e:: with SMTP id f14mr7771017oto.281.1616076728381; 
 Thu, 18 Mar 2021 07:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
 <20210312145545.26050-2-matthias.bgg@kernel.org>
In-Reply-To: <20210312145545.26050-2-matthias.bgg@kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 18 Mar 2021 15:11:56 +0100
Message-ID: <CAFqH_500_xUU9=y1t=FFErD5LwUb8p9KT7qngW_t99_OPQWeVg@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindigns: regulator: mtk: Drop unneeded compatible
To: matthias.bgg@kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <mbrugger@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_141210_290570_89387648 
X-CRM114-Status: GOOD (  22.20  )
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

SGkgTWF0dGhpYXMsCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guIFRoZXJlIGlzIGEgdHlwbyBp
biB0aGUgc3ViamVjdCBsaW5lCnMvZHQtYmluZGlnbnMvZHQtYmluZGluZ3MvIFJvYiBtaWdodCBt
aXNzIHRoaXMgcGF0Y2ggYXMgaGUgZmlsdGVycyB0aGUKcGF0Y2hlcyBieSBzdWJqZWN0IEkgZ3Vl
c3MuCgpNaXNzYXRnZSBkZSBsJ2FkcmXDp2EgPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiBkZWwg
ZGlhIGR2LiwgMTIgZGUgbWFyw6cKMjAyMSBhIGxlcyAxNTo1NzoKPgo+IEZyb206IE1hdHRoaWFz
IEJydWdnZXIgPG1icnVnZ2VyQHN1c2UuY29tPgo+Cj4gVGhlIHJlZ3VsYXRvciBkb2VzIG5vdCBu
ZWVkIHRvIGhhdmUgYSBkZXZpY2UgdHJlZSBjb21wYXRpYmxlLCBpZiBpdCdzCj4gcGFydCBvZiBh
biBNRkQuIFdlIGxlYXZlIHRoZSBub2RlIG5hbWUgdG8gdGhlIFNvQyBzcGVjaWZpYyBuYW1lIChl
LmcuCj4gbXQ2MzIzcmVndWxhdG9yKSB0byBhbGxvdyBvbGRlciBrZXJuZWxzIHRvIHdvcmsgd2l0
aCB0aGUgbmV3IGJpbmRpbmcuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxt
YnJ1Z2dlckBzdXNlLmNvbT4KPiAtLS0KPiAgLi4uL2JpbmRpbmdzL3JlZ3VsYXRvci9tdDYzMjMt
cmVndWxhdG9yLnR4dCAgICAgICAgfCAgMiArLQo+ICAuLi4vYmluZGluZ3MvcmVndWxhdG9yL210
NjM1OC1yZWd1bGF0b3IudHh0ICAgICAgICB8ICA0ICstLS0KPiAgLi4uL2JpbmRpbmdzL3JlZ3Vs
YXRvci9tdDYzOTctcmVndWxhdG9yLnR4dCAgICAgICAgfCAxNCArKysrKy0tLS0tLS0tLQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tdDYz
MjMtcmVndWxhdG9yLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1
bGF0b3IvbXQ2MzIzLXJlZ3VsYXRvci50eHQKPiBpbmRleCBhNDg3NDlkYjRkZjM2Li42OWYzMmUx
YTY3MDJlIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZWd1bGF0b3IvbXQ2MzIzLXJlZ3VsYXRvci50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL210NjMyMy1yZWd1bGF0b3IudHh0Cj4gQEAgLTE5LDcg
KzE5LDcgQEAgTERPOgo+ICBFeGFtcGxlOgo+Cj4gICAgICAgICBwbWljOiBtdDYzMjMgewo+IC0g
ICAgICAgICAgICAgICBtdDYzMjNyZWd1bGF0b3I6IHJlZ3VsYXRvcnMgewo+ICsgICAgICAgICAg
ICAgICBtdDYzMjNyZWd1bGF0b3IgewoKSWYgeW91IGNvbnZlcnQgdGhpcyBiaW5kaW5nIHRvIFlB
TUwsIHlvdSdsbCBwcm9iYWJseSBnZXQgYSByZXZpZXcgdGhhdAp0aGUgbm9kZSBuYW1lIG11c3Qg
YmUganVzdCAncmVndWxhdG9ycycgaGVyZS4gQW5kIHRoZW4sIGxvb2tpbmcgYXQgdGhlCm90aGVy
IHBhdGNoZXMgc29tZXRoaW5nIHdpbGwgYnJlYWsgSSBndWVzcyAuLi4KCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgbXQ2MzIzX3Zwcm9jX3JlZzogYnVja192cHJvY3sKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gInZwcm9jIjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPCA3MDAwMDA+
Owo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxh
dG9yL210NjM1OC1yZWd1bGF0b3IudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3JlZ3VsYXRvci9tdDYzNTgtcmVndWxhdG9yLnR4dAo+IGluZGV4IDlhOTBhOTJmMmQ3ZTEu
LmJhMTIxNGRhNWJmN2MgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3JlZ3VsYXRvci9tdDYzNTgtcmVndWxhdG9yLnR4dAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvbXQ2MzU4LXJlZ3VsYXRvci50eHQKPiBA
QCAtMjMsOSArMjMsNyBAQCBFeGFtcGxlOgo+ICAgICAgICAgcG1pYyB7Cj4gICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzU4IjsKPgo+IC0gICAgICAgICAgICAgICBt
dDYzNThyZWd1bGF0b3I6IG10NjM1OHJlZ3VsYXRvciB7Cj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzNTgtcmVndWxhdG9yIjsKPiAtCj4gKyAgICAg
ICAgICAgICAgIG10NjM1OHJlZ3VsYXRvciB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgbXQ2
MzU4X3ZkcmFtMV9yZWc6IGJ1Y2tfdmRyYW0xIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZ3VsYXRvci1jb21wYXRpYmxlID0gImJ1Y2tfdmRyYW0xIjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0gInZkcmFtMSI7Cj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvbXQ2Mzk3
LXJlZ3VsYXRvci50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxh
dG9yL210NjM5Ny1yZWd1bGF0b3IudHh0Cj4gaW5kZXggYzA4MDA4NmQzZTYyOS4uMmIxNDM2MmFj
NTZlMSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVn
dWxhdG9yL210NjM5Ny1yZWd1bGF0b3IudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3JlZ3VsYXRvci9tdDYzOTctcmVndWxhdG9yLnR4dAo+IEBAIC0xLDExICsx
LDkgQEAKPiAgTWVkaWF0ZWsgTVQ2Mzk3IFJlZ3VsYXRvcgo+Cj4gLVJlcXVpcmVkIHByb3BlcnRp
ZXM6Cj4gLS0gY29tcGF0aWJsZTogIm1lZGlhdGVrLG10NjM5Ny1yZWd1bGF0b3IiCj4gLS0gbXQ2
Mzk3cmVndWxhdG9yOiBMaXN0IG9mIHJlZ3VsYXRvcnMgcHJvdmlkZWQgYnkgdGhpcyBjb250cm9s
bGVyLiBJdCBpcyBuYW1lZAo+IC0gIGFjY29yZGluZyB0byBpdHMgcmVndWxhdG9yIHR5cGUsIGJ1
Y2tfPG5hbWU+IGFuZCBsZG9fPG5hbWU+Lgo+IC0gIFRoZSBkZWZpbml0aW9uIGZvciBlYWNoIG9m
IHRoZXNlIG5vZGVzIGlzIGRlZmluZWQgdXNpbmcgdGhlIHN0YW5kYXJkIGJpbmRpbmcKPiAtICBm
b3IgcmVndWxhdG9ycyBhdCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxh
dG9yL3JlZ3VsYXRvci50eHQuCj4gK0xpc3Qgb2YgcmVndWxhdG9ycyBwcm92aWRlZCBieSB0aGlz
IGNvbnRyb2xsZXIuIEl0IGlzIG5hbWVkCj4gK2FjY29yZGluZyB0byBpdHMgcmVndWxhdG9yIHR5
cGUsIGJ1Y2tfPG5hbWU+IGFuZCBsZG9fPG5hbWU+Lgo+ICtUaGUgZGVmaW5pdGlvbiBmb3IgZWFj
aCBvZiB0aGVzZSBub2RlcyBpcyBkZWZpbmVkIHVzaW5nIHRoZSBzdGFuZGFyZCBiaW5kaW5nCj4g
K2ZvciByZWd1bGF0b3JzIGF0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1
bGF0b3IvcmVndWxhdG9yLnR4dC4KPgo+ICBUaGUgdmFsaWQgbmFtZXMgZm9yIHJlZ3VsYXRvcnMg
YXJlOjoKPiAgQlVDSzoKPiBAQCAtMjMsOSArMjEsNyBAQCBFeGFtcGxlOgo+ICAgICAgICAgcG1p
YyB7Cj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2Mzk3IjsKPgo+
IC0gICAgICAgICAgICAgICBtdDYzOTdyZWd1bGF0b3I6IG10NjM5N3JlZ3VsYXRvciB7Cj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzOTctcmVndWxh
dG9yIjsKPiAtCj4gKyAgICAgICAgICAgICAgIG10NjM5N3JlZ3VsYXRvciB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgbXQ2Mzk3X3ZwY2ExNV9yZWc6IGJ1Y2tfdnBjYTE1IHsKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1jb21wYXRpYmxlID0gImJ1Y2tfdnBj
YTE1IjsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1uYW1lID0g
InZwY2ExNSI7Cj4gLS0KPiAyLjMwLjEKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
