Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A5AC433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:54:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9420A207F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:54:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2bPhH6C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y7UnrF+z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9420A207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x0R+ouGWFlwxPoDMCHJkS0czwFh7pHvk4hTh/iZcSkQ=; b=L2bPhH6CYc6tR/C+B8Zvl0RDv
	ylZlFiw9hPGuKFsN74bOYHtlv5vOiVk9r4cH+1Dg19dT7gNBFv1GduHZ8N703dUr4Qtqat0WEzbKX
	kL71ynZsLEMzsIyyFjZT/3MSUla6L30di0VOCoyDd6H9o87lHl++mH0ZeVgFNdEWmArXLnbpMpCZm
	aschNwW1XNK1/YGY7of+L30l/DB0z7iMGgCpvfLcttz7CQQVf3Z4+bZjViC4QYRxELzziZQpfHyZp
	reXlHolyN7W3e5nmICt8+YOcbk2RV+SxSUfHgpplQzXu8f5vDTwRdF1Nu7IwyvvV9BYtxh8J2e+Dg
	QKKNyzmzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0JVN-0005KQ-Qb; Tue, 28 Jul 2020 06:54:29 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0JVK-0005JP-GY
 for linux-mediatek@lists.infradead.org; Tue, 28 Jul 2020 06:54:28 +0000
Received: by mail-wm1-x341.google.com with SMTP id g8so5064156wmk.3
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 23:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=P6Lqe4llSuecNdw86Pntzf7Skr9CgvSQhntZY8kiVRI=;
 b=Y7UnrF+zQ6RZzUtdCmLwHT+qGIIM+SlR11df3sIrCsX1Sv04XzTX5+BxERbzoBt0aw
 JoioAp2JBQTwRD8ooaOCRM530mFZ7NuigqOGzkUfCJrJzjCS7OwxLHz4kOEO2FJVGe3F
 urTrZnT/cIpsJEP2KqX1j/c30vtKXd94FVVwHpUfMIb+ix93g7BWgmq7T4mpI30EWWYn
 ZDnzLesDqL4vtv2aPHjCLn29iN1UjEyak9K9eFCOM1C6C2f2MiTBkWMiVr1JPx1UHU5q
 FKKGya97qY63gog7LwWxVuclmifG8KeTPe/mQUkVnCpkqbY2tSUNA8RDgy4I2Zevf2ZZ
 sKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=P6Lqe4llSuecNdw86Pntzf7Skr9CgvSQhntZY8kiVRI=;
 b=rxEKCuulh+5jw0CwjSwVb5KfXmV01SXH/XdWan4FIIgK6VFq73OoPUVK4+SJhBDnJg
 1dmVLRLPdNHnFX/O9y4JBDF7rwe6/yxKPuiVuxWnh5EJ53lbMZg6GrqvTe96DHdBrCQP
 q6nsSWkd3EDCvXs5KZC+jkuNKYBNtVAkF1Hlsg8U5PbNbmP742O9qEVSxHwY7mZJP91w
 s4k9VgT2dIWO72zaVViQwrkDgbeAPsT7wOpOl+8LnoXl9FO1XGgbbtCbGbKNj7hSoHf1
 hjdoT8JuFqMrsQepcmOPqtDk7UraesMCRi078jaTkx19iJkg+OE5onCEGUTFKpJUFmb1
 Io4w==
X-Gm-Message-State: AOAM533rWRt92nf1BQ5sJsmcpyQWwFBUgguVXls2BVzV93Y3zN+E0ir6
 CnW5J0ATDmkFy6CoCTmUJ331/g==
X-Google-Smtp-Source: ABdhPJyYHSILXD2MIwfCFMGk9+lW5DTHp7MxrU7c6jTiPIN7VeIarin13dG2nNifravck2a1bhTjMQ==
X-Received: by 2002:a1c:7f91:: with SMTP id a139mr2450962wmd.153.1595919265386; 
 Mon, 27 Jul 2020 23:54:25 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id w125sm2823355wma.15.2020.07.27.23.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 23:54:24 -0700 (PDT)
Date: Tue, 28 Jul 2020 07:54:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v2 4/9] mfd: mt6360: Combine mt6360 pmic/ldo resouces
 into mt6360 regulator resources
Message-ID: <20200728065422.GB1850026@dell>
References: <1594983811-25908-1-git-send-email-gene.chen.richtek@gmail.com>
 <1594983811-25908-5-git-send-email-gene.chen.richtek@gmail.com>
 <20200727112921.GK1850026@dell>
 <CAE+NS36cxY9KqxxcmuctK_W_3ZmZnC_xK8VVVaTZqC3vSoqbUw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS36cxY9KqxxcmuctK_W_3ZmZnC_xK8VVVaTZqC3vSoqbUw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_025427_268640_ACF45CC4 
X-CRM114-Status: GOOD (  19.57  )
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

T24gVHVlLCAyOCBKdWwgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDfmnIgyN+aXpSDpgLHkuIAg5LiL5Y2INzoyOeWv
q+mBk++8mgo+ID4KPiA+IE9uIEZyaSwgMTcgSnVsIDIwMjAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+
Cj4gPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPgo+ID4g
PiBDb21iaW5lIG10NjM2MCBwbWljL2xkbyByZXNvdWNlcyBpbnRvIG10NjM2MCByZWd1bGF0b3Ig
cmVzb3VyY2VzCj4gPiA+IHRvIHNpbXBsaWZ5IHRoZSBzaW1pbGFyIHJlc291cmNlcyBvYmplY3Qu
Cj4gPgo+ID4gRG8gdGhlIHN1Yi1kZXZpY2VzIGFjdHVhbGx5IHNoYXJlIHRoZXNlIHJlc291cmNl
cywgb3IgYXJlIHlvdSBkb2luZwo+ID4gdGhpcyBqdXN0IHRvIG1ha2UgdGhlIGNvZGUgc2ltcGxl
cj8KPiA+Cj4gCj4gVGhleSBhcmUgZGlmZmVyZW50IHJlc291cmNlcyB1c2VkIGJ5IGRpZmZlcmVu
dCBidWNrcyBhbmQgbGRvcyB3aXRob3V0Cj4gc2hhcmluZyByZWxhdGlvbnMuCj4gSSBqdXN0IHRv
IG1ha2UgdGhlIGNvZGUgc2ltcGxlci4KCkkgZG9uJ3QgdGhpbmsgdGhhdCdzIHNlbnNpYmxlLgoK
WW91IHNob3VsZCBvbmx5IHNoYXJlIHJlc291cmNlcyB3aXRoIGNoaWxkIGRldmljZXMgdGhhdCBj
b25zdW1lIHRoZW0uCgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkBy
aWNodGVrLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIHwg
MTEgKysrLS0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDgg
ZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzNjAt
Y29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiBpbmRleCA3Y2MxYjU5Li42
NjVlMjZmIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+
ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ID4gQEAgLTI2NSw3ICsyNjUsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9sZWRfcmVzb3VyY2VzW10gPSB7
Cj4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9GTEVEMV9TVFJCX1RPX0VW
VCwgImZsZWQxX3N0cmJfdG9fZXZ0IiksCj4gPiA+ICB9Owo+ID4gPgo+ID4gPiAtc3RhdGljIGNv
bnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfcG1pY19yZXNvdXJjZXNbXSA9IHsKPiA+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX3JlZ3VsYXRvcl9yZXNvdXJjZXNbXSA9
IHsKPiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX1BHQl9FVlQs
ICJidWNrMV9wZ2JfZXZ0IiksCj4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2
MF9CVUNLMV9PQ19FVlQsICJidWNrMV9vY19ldnQiKSwKPiA+ID4gICAgICAgREVGSU5FX1JFU19J
UlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09WX0VWVCwgImJ1Y2sxX292X2V2dCIpLAo+ID4gPiBAQCAt
Mjc4LDkgKzI3OCw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX3BtaWNf
cmVzb3VyY2VzW10gPSB7Cj4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9M
RE83X09DX0VWVCwgImxkbzdfb2NfZXZ0IiksCj4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05B
TUVEKE1UNjM2MF9MRE82X1BHQl9FVlQsICJsZG82X3BnYl9ldnQiKSwKPiA+ID4gICAgICAgREVG
SU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzdfUEdCX0VWVCwgImxkbzdfcGdiX2V2dCIpLAo+
ID4gPiAtfTsKPiA+ID4gLQo+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYz
NjBfbGRvX3Jlc291cmNlc1tdID0gewo+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChN
VDYzNjBfTERPMV9PQ19FVlQsICJsZG8xX29jX2V2dCIpLAo+ID4gPiAgICAgICBERUZJTkVfUkVT
X0lSUV9OQU1FRChNVDYzNjBfTERPMl9PQ19FVlQsICJsZG8yX29jX2V2dCIpLAo+ID4gPiAgICAg
ICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPM19PQ19FVlQsICJsZG8zX29jX2V2dCIp
LAo+ID4gPiBAQCAtMjk4LDEwICsyOTUsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxs
IG10NjM2MF9kZXZzW10gPSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJt
ZWRpYXRlayxtdDYzNjAtY2hnIiksCj4gPiA+ICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtbGVk
IiwgbXQ2MzYwX2xlZF9yZXNvdXJjZXMsCj4gPiA+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAs
IDAsICJtZWRpYXRlayxtdDYzNjAtbGVkIiksCj4gPiA+IC0gICAgIE9GX01GRF9DRUxMKCJtdDYz
NjAtcG1pYyIsIG10NjM2MF9wbWljX3Jlc291cmNlcywKPiA+ID4gLSAgICAgICAgICAgICAgICAg
TlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1wbWljIiksCj4gPiA+IC0gICAgIE9GX01GRF9D
RUxMKCJtdDYzNjAtbGRvIiwgbXQ2MzYwX2xkb19yZXNvdXJjZXMsCj4gPiA+IC0gICAgICAgICAg
ICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtbGRvIiksCj4gPiA+ICsgICAgIE9G
X01GRF9DRUxMKCJtdDYzNjAtcmVndWxhdG9yIiwgbXQ2MzYwX3JlZ3VsYXRvcl9yZXNvdXJjZXMs
Cj4gPiA+ICsgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcmVn
dWxhdG9yIiksCj4gPiA+ICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtdGNwYyIsIE5VTEwsCj4g
PiA+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtdGNwYyIp
LAo+ID4gPiAgfTsKPiA+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmlj
YWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
