Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F09DC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:19:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BB76191C
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BB76191C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Tr1HYENORrFObysQHWXGo0Nzhn69raeHXvP0eGM/Zc=; b=XHfGaU2kZImwxAGfpxwVr4K1+
	SyBurLSm12WFOQ8V+2/GJgHPb/sooDC04UNvHbew6EaoY9QfBTotaDuDYXxhXymFA5AfV4EzMPDUc
	utZTAV5kEUrSvbFFBHikCAn2rpc5R/5pgowoVNOBD2doFDBrkp5Bfkef3rgaRamEQwpBxsm2sSAMp
	StwDu9FgSHUbqh7uszC3VRL+bFiN+RvUieramzcarDrV9jdgU+Ob/AHBASJXLI2KDdZxgzjOExRJe
	bKUQ9CRTBoebNoW2OcCs/tMWm2YJJlyWHiV0f9thtJDCkWreCY4fRsnDkhs/9p4wvfARXYb1YRjAJ
	QIDocVX9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSI5-0003FB-VP; Tue, 11 May 2021 13:19:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgRHk-00HK8G-Vt; Tue, 11 May 2021 12:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=Wa5zxC12LevybTjgPskMwjNjFrqR4wunX6KrAZQ3xWM=; b=287oE1bDb4rq9GHGknthvSh+Ak
 0HuSv+MNl/u7GRk9gzU45atH2DadlUvgxjaQGOVw+ryrH3NfBWO9TnNrUGFfdORHadvtSnX8P2Irq
 9N3CmFVDoJz7IFR9s8io6OPrHKl4iD2jrEqhOdGz3omitB5/1PbtTWz9gwJbBwr2GXk5OGP2BN5Qn
 9+PKon3jLPRMT6k41QfFGx1hVFrUg8fsRN6TFocTVKqeqZCJZ2J0KihzjekdNXrEdkKBJbJL15MeJ
 lkAYyINgPiFVF6EKz+J9xoaCJvNWtcTA4drWK3oiEZ3XeUfUgVn+iQW70g0xcxk6O0OAg+q6oPNSc
 Pb2vXi3g==;
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgRHh-009Yel-NE; Tue, 11 May 2021 12:14:47 +0000
Received: by mail-oi1-x234.google.com with SMTP id u16so18820858oiu.7;
 Tue, 11 May 2021 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wa5zxC12LevybTjgPskMwjNjFrqR4wunX6KrAZQ3xWM=;
 b=rngm6j0BTRFq+wHKWTfYYo1vpeqCpapMNcPXRp8InTyDMTP4gD5OY4QMvESFvlyh4P
 XAWi2uGvOM+OBdu+Td9l4Q7DGwI4mjiNq1mVc7PCLdQ+tnrKUDyw7I28oF/F4Ie1Bslp
 g5aERFMEZQy/Y4imeO58JcMqmCn1RhpB5ZMEQUgZvTLSrBPlJSzVeabndA8EJmeE8HQD
 8wLhVBdxP2afAq1Q2+yELu8fB7WKFRrNYWDGVzF1OCtj8a20itfpEKF1AqOtsKl2cK7S
 tV7/QyXuRjF8HTYaFp5LAIaJlCJtTUxXe/pA/ihVT9iNkNKbh0hr/COcab75eWjAncvs
 IfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wa5zxC12LevybTjgPskMwjNjFrqR4wunX6KrAZQ3xWM=;
 b=p92gqg8MYfAi+yzPbXF7Xm1On7fnpdvlMuKyAfbpG3K71F5R9qJHbe+QquEkWWdvL9
 MpTWxJh+lCQMNk3xb+4ZDlOUEQsjr0jNC131d6zDA94qo+YcteCppDKW8XPOA2o/XJDU
 +onwTvhDtIOByF+rWzXLe4EbHAB/FOLvPdefdARqm/lNe3/A7mPV7I2Lql5fbObJQhtb
 LK8ECG2K6u1xsRfraxy0Vykdov0eJYzI0AnNN9OtU0WgFR0p/ImxFCgkAPDPpMONBiFt
 cvYAWAFdqKzMOGa5oBwYKMzCo6tUTqd5i9VIQpEhDu/oFA2fotYH9lLRpH5Y8VD6YFnJ
 +f3g==
X-Gm-Message-State: AOAM5312TCrrGWe5Y4A4gyLH49WNSIDb3Gk8bR6vRT82eePmuVBMmzVe
 4sNhLPKxgzUiwPfNWaIAq3uEcW4+I67QZU94t7U=
X-Google-Smtp-Source: ABdhPJwWA8mgD0ksaPPC7Or1KQ4PViyixmEDpe1wLUYXMhkBD1mm/ns6E6t1wwOaiKKIclHnmgflCsHlXXt+h9tZolg=
X-Received: by 2002:a05:6808:14c8:: with SMTP id
 f8mr3344139oiw.55.1620735281302; 
 Tue, 11 May 2021 05:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
 <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
 <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
 <20210115073241.GC3975472@dell>
 <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
 <20210323093806.GR2916463@dell>
In-Reply-To: <20210323093806.GR2916463@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 11 May 2021 20:14:30 +0800
Message-ID: <CAE+NS37jmcyr2w9Z22-m5Ug7rF3Twq20poOLjptDX6E9E_7NLg@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
To: Lee Jones <lee.jones@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, sre@kernel.org, 
 Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, shufan_lee@richtek.com, 
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_051445_779975_43F76DE7 
X-CRM114-Status: GOOD (  26.26  )
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

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjHlubQz5pyIMjPml6Ug6YCx
5LqMIOS4i+WNiDU6Mzjlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgMDIgTWFyIDIwMjEsIEdlbmUgQ2hl
biB3cm90ZToKPgo+ID4gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjHl
ubQx5pyIMTXml6Ug6YCx5LqUIOS4i+WNiDM6MzLlr6vpgZPvvJoKPiA+ID4KPiA+ID4gT24gRnJp
LCAxNSBKYW4gMjAyMSwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gPgo+ID4gPiA+IE1hdHRoaWFzIEJy
dWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+IOaWvCAyMDIx5bm0MeaciDEy5pelIOmAseS6
jCDkuIvljYg4OjMy5a+r6YGT77yaCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBPbiAxMi8xMS8yMDIwIDExOjM5LCBHZW5lIENoZW4gd3JvdGU6Cj4gPiA+ID4gPiA+IEZy
b206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiBDb21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNvdXJjZXMgaW50byBtdDYzNjAgcmVndWxh
dG9yIHJlc291cmNlcwo+ID4gPiA+ID4gPiB0byBzaW1wbGlmeSB0aGUgc2ltaWxhciByZXNvdXJj
ZXMgb2JqZWN0Lgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENo
ZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4gPiA+ID4gQWNrZWQtZm9yLU1GRC1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4g
PiA+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIHwgMTEgKysrLS0tLS0tLS0KPiA+ID4gPiA+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5j
IGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiA+ID4gPiBpbmRleCA2OTJlNDdiLi41
MTE5ZTUxIDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5j
Cj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ID4gPiA+ID4g
QEAgLTI2NSw3ICsyNjUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9s
ZWRfcmVzb3VyY2VzW10gPSB7Cj4gPiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVE
KE1UNjM2MF9GTEVEMV9TVFJCX1RPX0VWVCwgImZsZWQxX3N0cmJfdG9fZXZ0IiksCj4gPiA+ID4g
PiA+ICB9Owo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZXNv
dXJjZSBtdDYzNjBfcG1pY19yZXNvdXJjZXNbXSA9IHsKPiA+ID4gPiA+ID4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX3JlZ3VsYXRvcl9yZXNvdXJjZXNbXSA9IHsKPiA+ID4g
PiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX1BHQl9FVlQsICJi
dWNrMV9wZ2JfZXZ0IiksCj4gPiA+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1U
NjM2MF9CVUNLMV9PQ19FVlQsICJidWNrMV9vY19ldnQiKSwKPiA+ID4gPiA+ID4gICAgICAgREVG
SU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09WX0VWVCwgImJ1Y2sxX292X2V2dCIpLAo+
ID4gPiA+ID4gPiBAQCAtMjc4LDkgKzI3OCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3Vy
Y2UgbXQ2MzYwX3BtaWNfcmVzb3VyY2VzW10gPSB7Cj4gPiA+ID4gPiA+ICAgICAgIERFRklORV9S
RVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X09DX0VWVCwgImxkbzdfb2NfZXZ0IiksCj4gPiA+ID4g
PiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE82X1BHQl9FVlQsICJsZG82
X3BnYl9ldnQiKSwKPiA+ID4gPiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYw
X0xETzdfUEdCX0VWVCwgImxkbzdfcGdiX2V2dCIpLAo+ID4gPiA+ID4gPiAtfTsKPiA+ID4gPiA+
ID4gLQo+ID4gPiA+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfbGRv
X3Jlc291cmNlc1tdID0gewo+ID4gPiA+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChN
VDYzNjBfTERPMV9PQ19FVlQsICJsZG8xX29jX2V2dCIpLAo+ID4gPiA+ID4gPiAgICAgICBERUZJ
TkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPMl9PQ19FVlQsICJsZG8yX29jX2V2dCIpLAo+ID4g
PiA+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPM19PQ19FVlQsICJs
ZG8zX29jX2V2dCIpLAo+ID4gPiA+ID4gPiBAQCAtMjk4LDEwICsyOTUsOCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG1mZF9jZWxsIG10NjM2MF9kZXZzW10gPSB7Cj4gPiA+ID4gPiA+ICAgICAgICAg
ICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtY2hnIiksCj4gPiA+ID4gPiA+
ICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtbGVkIiwgbXQ2MzYwX2xlZF9yZXNvdXJjZXMsCj4g
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAt
bGVkIiksCj4gPiA+ID4gPiA+IC0gICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtcG1pYyIsIG10NjM2
MF9wbWljX3Jlc291cmNlcywKPiA+ID4gPiA+ID4gLSAgICAgICAgICAgICAgICAgTlVMTCwgMCwg
MCwgIm1lZGlhdGVrLG10NjM2MC1wbWljIiksCj4gPiA+ID4gPiA+IC0gICAgIE9GX01GRF9DRUxM
KCJtdDYzNjAtbGRvIiwgbXQ2MzYwX2xkb19yZXNvdXJjZXMsCj4gPiA+ID4gPiA+IC0gICAgICAg
ICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtbGRvIiksCj4gPiA+ID4gPiA+
ICsgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtcmVndWxhdG9yIiwgbXQ2MzYwX3JlZ3VsYXRvcl9y
ZXNvdXJjZXMsCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRp
YXRlayxtdDYzNjAtcmVndWxhdG9yIiksCj4gPiA+ID4gPgo+ID4gPiA+ID4gQXMgZGlzY3Vzc2Vk
IHdpdGggdGhlIE1GRCBtYWludGFpbmVyIFsxXSwgdGhlIHJlZ3VsYXRvciAoYW5kIHByb2JhYmx5
IGFsbCBjZWxscykKPiA+ID4gPiA+IHNob3VsZG4ndCBoYXZlIGEgRFQgYmluZGluZy4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiBTbyBwbGVhc2Ugc2VuZCBhIG5ldyB2ZXJzaW9uIHdoaWNoIGZpeGVzIHRo
YXQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiA+IE1hdHRoaWFzCj4gPiA+
ID4gPgo+ID4gPiA+ID4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVr
LzIwMjEwMTExMTY0MTE4LkdFNDcyOEBzaXJlbmEub3JnLnVrLwo+ID4gPgo+ID4gPiBJIGRvbid0
IHRoaW5rIE1hcmsgaXMgY29ycmVjdCBoZXJlLgo+ID4gPgo+ID4gPiBXZSB1c3VhbGx5IGRvIGlt
cGxlbWVudCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHN1Yi1kZXZpY2VzIGFuZCB0aGV5IGRvCj4g
PiA+IHRlbmQgdG8gaGF2ZSB0aGVpciBvd24gZGV2aWNlIG5vZGVzLgo+ID4gPgo+ID4gPiBJdCdz
IGEgdmVyeSBsb25nIHRpbWUgYWdvIHNpbmNlIEkgY29kZWQgdGhpcyB1cCBteXNlbGYsIGJ1dCBm
cm9tCj4gPiA+IG1lbW9yeSwgeW91IGNhbid0IGhhdmUgMiBkZXZpY2VzIHNoYXJlIGEgY29tcGF0
aWJsZSBzdHJpbmcuCj4gPiA+Cj4gPgo+ID4gRWl0aGVyIE1hcmsgb3IgTGVlIHN1Z2dlc3Rpb24g
aXMgd29yay4KPiA+IElzIHRoZXJlIGEgY29uY2x1c2lvbiB0aGF0IHdlIGNhbiBhcHBseSBpdD8K
PiA+IElmIE1GRCBpcyBhbHJlYWR5IHN1cHBvcnRlZCBvZl9jb21wYXRpYmxlLCB3ZSBwcmVmZXIg
dXNlIG9mX2NvbXBhdGlibGUgbWFwcGluZy4KPgo+IEkgd291bGQgcmVzdWJtaXQgdGhlIHNldC4g
IFdlIGNhbiBzdGFydCBhZnJlc2ggZnJvbSB0aGVyZS4KPgoKRGVhciBKb25lcywKCiAgICBTaG91
bGQgSSBzZW5kIGZpeGVkIHBhdGNoIGFib3V0IGFkZGluZyByZWd1bGF0b3Igbm9kZSBkaXJlY3Rs
eSBjYW4KbWFrZSBlYXNpZXIgZm9yIHlvdSB0byByZS1zdWJtaXQgbmV3IHBhdGNoPwoKPiAtLQo+
IExlZSBKb25lcyBb5p2O55C85pavXQo+IFNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3Bl
ciBTZXJ2aWNlcwo+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0g
U29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
