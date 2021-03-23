Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC05CC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:38:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8E96192E
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 09:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B8E96192E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6LoV5OXCwwGcJw2WI3U4uFzTuWq9ViMrn0HVMt2km+4=; b=UXd823jXeytEM2Q/3HBrshj5x
	mt03WtU8wPcw8QgQrb/jvMLN6EWTbezXUoVfCKk3sMtExpNtKT1xePgkym2/XJN1iomh8yIQ775J9
	I4rwwNGSbanE0/ylyGNJESXX+UVJCbW5pcjAUX758Wclze7TI1UrYkCoOtfvJL7h8ZBrOmK6U+U4A
	+q5bG4s5KA+fiCeug2r2ZSPl87vqaDJ989OlNa3rAXQwXSWXzeS7XRHTLqtcXTO50LXWw09vtu4rJ
	pSlx7DWA4ZFJgwDMgyt7Nto/xpuC3x1TNQ5YZg1j7awdjkfhrfbQH3sh64AU76TAJ9yRaa16Y71B/
	DvyyL1AEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOdUa-00ETwB-S2; Tue, 23 Mar 2021 09:38:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOdUH-00ETsM-VU
 for linux-mediatek@lists.infradead.org; Tue, 23 Mar 2021 09:38:12 +0000
Received: by mail-ed1-x52e.google.com with SMTP id e7so22589859edu.10
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Mar 2021 02:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0jEA2q4Aaw2ZtcKO1cqlqt1glbyKrTnhi87C48RZtAM=;
 b=yAvKFG7A0oMQmtxQy5Sp8oXbqx947Q69OvWO2V0qsimcWUAfew4wyVUjqSRQeu/yeo
 49ZN2P7ECpDDmwbX4PdqmndoYnlRgcnUgZpKYtlNBkgDAl3EIsoBVMBv8+jargId8Arb
 9Vw/fYAPIjv2RNBoeeEDTaGlj1syolEiQieg08gkP8Z+m8m+jOj5AYcsRrhyowZ8yFjU
 6tOnH3yCEBeomTxFTf5Ntd3G8ZJV9ijUf2Zo+h5/1VQsjBAHnFoR9XuupRXTAtvqNuhD
 fxpm2FU2uH43VbAK9jW6DaLEtV4agyabD+vtDEQ2BZE55ZdbkNk75GkegetDuDaovftd
 3aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0jEA2q4Aaw2ZtcKO1cqlqt1glbyKrTnhi87C48RZtAM=;
 b=iYTBKsM1rQ7yBUkri1ocGUmAFGZRtChYQkObFg301/lZlApPYe9QxzqOLimjsFckX0
 6svRQ5NQi5PR8j16zsZryChHiS2wTs2wN6sloNJPBgcwcOzj6qR7QQ4igjyQNHH3lp8F
 V1HCOHgdXC7MmZ9vN4zv++H5Q4um2yqIg94kXXHVYNw7JZDTW1NJGuZSYW5ZywzLjeEG
 cj8V6HtOT6VPt1bXqCQ/mMcyoAmfjTaLQ7AVPuvb1tHVL4wzhdrhypEUQMyrOJw9BK8M
 Kq5UKkpcf/w8iGwSlrDfyqC7J25EqIXIiLH1dc2kHxkTVWbiKoE7nYJPABmcE8bq9HVF
 8MJw==
X-Gm-Message-State: AOAM533Fwyt3TKZ327JRuUghCHTY3TXaFqrL3YRUmf9JyXYfqtdA3rGT
 p9VXF7YgVflgX+5nQOvXW4JHiw==
X-Google-Smtp-Source: ABdhPJwW4mqlJyLJmx5PFFyr4uXYYH6MQQhFbOmFuns9sUC3DPQG6k2/fTJcihGXeieRDqshA10EjA==
X-Received: by 2002:a05:6402:34d:: with SMTP id
 r13mr3725729edw.64.1616492289370; 
 Tue, 23 Mar 2021 02:38:09 -0700 (PDT)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id g12sm6470839eje.120.2021.03.23.02.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:38:08 -0700 (PDT)
Date: Tue, 23 Mar 2021 09:38:06 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, sre@kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
 benjamin.chao@mediatek.com
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
Message-ID: <20210323093806.GR2916463@dell>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
 <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
 <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
 <20210115073241.GC3975472@dell>
 <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_093810_139414_B9344EEC 
X-CRM114-Status: GOOD (  24.90  )
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

T24gVHVlLCAwMiBNYXIgMjAyMSwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMeW5tDHmnIgxNeaXpSDpgLHkupQg5LiL5Y2IMzozMuWv
q+mBk++8mgo+ID4KPiA+IE9uIEZyaSwgMTUgSmFuIDIwMjEsIEdlbmUgQ2hlbiB3cm90ZToKPiA+
Cj4gPiA+IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+IOaWvCAyMDIx
5bm0MeaciDEy5pelIOmAseS6jCDkuIvljYg4OjMy5a+r6YGT77yaCj4gPiA+ID4KPiA+ID4gPgo+
ID4gPiA+Cj4gPiA+ID4gT24gMTIvMTEvMjAyMCAxMTozOSwgR2VuZSBDaGVuIHdyb3RlOgo+ID4g
PiA+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gQ29tYmluZSBtdDYzNjAgcG1pYy9sZG8gcmVzb3VyY2VzIGludG8gbXQ2MzYwIHJl
Z3VsYXRvciByZXNvdXJjZXMKPiA+ID4gPiA+IHRvIHNpbXBsaWZ5IHRoZSBzaW1pbGFyIHJlc291
cmNlcyBvYmplY3QuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVu
IDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+ID4gPiBBY2tlZC1mb3ItTUZELWJ5OiBMZWUg
Sm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJp
dmVycy9tZmQvbXQ2MzYwLWNvcmUuYyB8IDExICsrKy0tLS0tLS0tCj4gPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyBiL2RyaXZlcnMvbWZk
L210NjM2MC1jb3JlLmMKPiA+ID4gPiA+IGluZGV4IDY5MmU0N2IuLjUxMTllNTEgMTAwNjQ0Cj4g
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+ID4gPiArKysgYi9k
cml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+ID4gPiBAQCAtMjY1LDcgKzI2NSw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX2xlZF9yZXNvdXJjZXNbXSA9IHsKPiA+
ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9GTEVEMV9TVFJCX1RPX0VW
VCwgImZsZWQxX3N0cmJfdG9fZXZ0IiksCj4gPiA+ID4gPiAgfTsKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfcG1pY19yZXNvdXJjZXNbXSA9
IHsKPiA+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9yZWd1bGF0
b3JfcmVzb3VyY2VzW10gPSB7Cj4gPiA+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChN
VDYzNjBfQlVDSzFfUEdCX0VWVCwgImJ1Y2sxX3BnYl9ldnQiKSwKPiA+ID4gPiA+ICAgICAgIERF
RklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNLMV9PQ19FVlQsICJidWNrMV9vY19ldnQiKSwK
PiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNLMV9PVl9FVlQs
ICJidWNrMV9vdl9ldnQiKSwKPiA+ID4gPiA+IEBAIC0yNzgsOSArMjc4LDYgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfcG1pY19yZXNvdXJjZXNbXSA9IHsKPiA+ID4gPiA+
ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X09DX0VWVCwgImxkbzdfb2Nf
ZXZ0IiksCj4gPiA+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPNl9Q
R0JfRVZULCAibGRvNl9wZ2JfZXZ0IiksCj4gPiA+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9O
QU1FRChNVDYzNjBfTERPN19QR0JfRVZULCAibGRvN19wZ2JfZXZ0IiksCj4gPiA+ID4gPiAtfTsK
PiA+ID4gPiA+IC0KPiA+ID4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2
MF9sZG9fcmVzb3VyY2VzW10gPSB7Cj4gPiA+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1F
RChNVDYzNjBfTERPMV9PQ19FVlQsICJsZG8xX29jX2V2dCIpLAo+ID4gPiA+ID4gICAgICAgREVG
SU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzJfT0NfRVZULCAibGRvMl9vY19ldnQiKSwKPiA+
ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE8zX09DX0VWVCwgImxk
bzNfb2NfZXZ0IiksCj4gPiA+ID4gPiBAQCAtMjk4LDEwICsyOTUsOCBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IG1mZF9jZWxsIG10NjM2MF9kZXZzW10gPSB7Cj4gPiA+ID4gPiAgICAgICAgICAgICAg
ICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLWNoZyIpLAo+ID4gPiA+ID4gICAgICAg
T0ZfTUZEX0NFTEwoIm10NjM2MC1sZWQiLCBtdDYzNjBfbGVkX3Jlc291cmNlcywKPiA+ID4gPiA+
ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtbGVkIiksCj4g
PiA+ID4gPiAtICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLXBtaWMiLCBtdDYzNjBfcG1pY19yZXNv
dXJjZXMsCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWss
bXQ2MzYwLXBtaWMiKSwKPiA+ID4gPiA+IC0gICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtbGRvIiwg
bXQ2MzYwX2xkb19yZXNvdXJjZXMsCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICBOVUxMLCAw
LCAwLCAibWVkaWF0ZWssbXQ2MzYwLWxkbyIpLAo+ID4gPiA+ID4gKyAgICAgT0ZfTUZEX0NFTEwo
Im10NjM2MC1yZWd1bGF0b3IiLCBtdDYzNjBfcmVndWxhdG9yX3Jlc291cmNlcywKPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcmVndWxhdG9y
IiksCj4gPiA+ID4KPiA+ID4gPiBBcyBkaXNjdXNzZWQgd2l0aCB0aGUgTUZEIG1haW50YWluZXIg
WzFdLCB0aGUgcmVndWxhdG9yIChhbmQgcHJvYmFibHkgYWxsIGNlbGxzKQo+ID4gPiA+IHNob3Vs
ZG4ndCBoYXZlIGEgRFQgYmluZGluZy4KPiA+ID4gPgo+ID4gPiA+IFNvIHBsZWFzZSBzZW5kIGEg
bmV3IHZlcnNpb24gd2hpY2ggZml4ZXMgdGhhdC4KPiA+ID4gPgo+ID4gPiA+IFJlZ2FyZHMsCj4g
PiA+ID4gTWF0dGhpYXMKPiA+ID4gPgo+ID4gPiA+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1tZWRpYXRlay8yMDIxMDExMTE2NDExOC5HRTQ3MjhAc2lyZW5hLm9yZy51ay8KPiA+
Cj4gPiBJIGRvbid0IHRoaW5rIE1hcmsgaXMgY29ycmVjdCBoZXJlLgo+ID4KPiA+IFdlIHVzdWFs
bHkgZG8gaW1wbGVtZW50IGNvbXBhdGlibGUgc3RyaW5ncyBmb3Igc3ViLWRldmljZXMgYW5kIHRo
ZXkgZG8KPiA+IHRlbmQgdG8gaGF2ZSB0aGVpciBvd24gZGV2aWNlIG5vZGVzLgo+ID4KPiA+IEl0
J3MgYSB2ZXJ5IGxvbmcgdGltZSBhZ28gc2luY2UgSSBjb2RlZCB0aGlzIHVwIG15c2VsZiwgYnV0
IGZyb20KPiA+IG1lbW9yeSwgeW91IGNhbid0IGhhdmUgMiBkZXZpY2VzIHNoYXJlIGEgY29tcGF0
aWJsZSBzdHJpbmcuCj4gPgo+IAo+IEVpdGhlciBNYXJrIG9yIExlZSBzdWdnZXN0aW9uIGlzIHdv
cmsuCj4gSXMgdGhlcmUgYSBjb25jbHVzaW9uIHRoYXQgd2UgY2FuIGFwcGx5IGl0Pwo+IElmIE1G
RCBpcyBhbHJlYWR5IHN1cHBvcnRlZCBvZl9jb21wYXRpYmxlLCB3ZSBwcmVmZXIgdXNlIG9mX2Nv
bXBhdGlibGUgbWFwcGluZy4KCkkgd291bGQgcmVzdWJtaXQgdGhlIHNldC4gIFdlIGNhbiBzdGFy
dCBhZnJlc2ggZnJvbSB0aGVyZS4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
