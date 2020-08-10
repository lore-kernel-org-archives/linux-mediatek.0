Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A60C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:31:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420F62073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 07:31:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3UlSHMgu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KmjOr7lG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 420F62073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Lq4uuJACWgXW5xSITW05ZEYLDopG/Ldwzv0EyIDiBGY=; b=3UlSHMguUaBZO9kA6+lr760Rk
	ExB/KUScPLjtCmiaM+VcJc3iU2zv9if3voV5yJmEh6SRZIRRuZZIyHEcWjuP8o+iC4zpEX/7h0Ae9
	eQMQHnxJMIy1x+7kGzp0JqSMz+FIIbw0405B/oF8Bp6+/9nYsl17UlD7V2FH2eLuLwvX3hShFE5Ko
	IksDHHSpB4hTooBIzuAczyM82YdBsfPSlbbCKNi5CndseijO4NvB/ksh8ypZLNl9J7wT4yX8eznf3
	N0eLXqDRTv82Eh4O+4vOhY0BjozRjCGUAFopuqvJix1pNlDs76EPvJQkOIb6m9FadEhPZbbYy31KE
	qP3S5olZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k52HP-0004Wj-Sg; Mon, 10 Aug 2020 07:31:35 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k52HM-0004Vg-C3
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 07:31:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id a14so7159780wra.5
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2020 00:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4x9G4BKQPEodKbNbhS34JTOCfB7se7v0YDW0moilQvg=;
 b=KmjOr7lGhApH6KmO1rV2ur9Cq8V7cNEvM8FRBK312jsW9+HLFlI/uzKP10UPa5smUh
 MoOjclfPeo/4V+LP8l7LPZ68sn9H/heVE996XMzsiBINWGZfhnIE+3CJJd4WeacdBgBa
 kg4kjO9LHV4tvpX3bK4xbgbWcsXdIN4b3k/ISucIebTERr0TEg1H8+JuovkT6/2gBHWn
 HcWBMkGEy5oDrrBGqN9Haq1IlLCWfIWvZsDoy/7r1majuwzYvVqFwkiLFLJ3SeHEjEl+
 ENQHPT2cAjuLfipnQNOXfEHR9/QMK+2cPXur508C9BBp0SQIbaek9bsgdDPq4vL/m0il
 YJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4x9G4BKQPEodKbNbhS34JTOCfB7se7v0YDW0moilQvg=;
 b=LYLKX04Qy1dCGTGyfWsGQ/dRpiHkdkhegU8qApqUa2CwMKRaKQLfOcoyBnv+uLU+iz
 Ik0sFEH7UfQLQUDmHb+hkNVOhcR/rPHdYjiEcWmYWmIbKwg8XeUfTcmBAzYoW7CSs8fm
 x2phRgVAykcMIp75fJVFF0T4RbFP6f5apzcQbQOD5oAQXa8rit2A2QMJVNwIpEFoGELD
 B0Kq0mV5tZ9Fa2VWTbSM94msRPIsUIqcbmcwzh0drLnKKtVeMJl3LGSKK6gTvvqto3cM
 r1g+5e6gLVNhLX2+zjAN2tXcyqlt4hapgKKjAEmFMagx9zUPyy7XCeCUom9k9qKqc5S7
 fWPA==
X-Gm-Message-State: AOAM533q86nZ8W72WdOoKjKIEJ41wu0EQZ92yh1iu4vU81CsRhqgADli
 ToYpB75EmhJ4T8DWSUtDojJmhw==
X-Google-Smtp-Source: ABdhPJxExxrYLyu6qXhRPgZztXKPrU/zgJr51FhpKEO58wSzN65gPrJEPbrrE6QHLTBHtOvwIbO0TA==
X-Received: by 2002:adf:a351:: with SMTP id d17mr23056398wrb.111.1597044691012; 
 Mon, 10 Aug 2020 00:31:31 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id z15sm20056653wrn.89.2020.08.10.00.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 00:31:30 -0700 (PDT)
Date: Mon, 10 Aug 2020 08:31:28 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 1/8] mfd: mt6358: refine interrupt code
Message-ID: <20200810073128.GC4411@dell>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-2-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200727154840.GY1850026@dell>
 <1596443379.31084.3.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596443379.31084.3.camel@mtksdaap41>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_033132_723741_93BC00FE 
X-CRM114-Status: GOOD (  24.58  )
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAwMyBBdWcgMjAyMCwgSHNpbi1oc2l1bmcgV2FuZyB3cm90ZToKCj4gSGksCj4gCj4g
T24gTW9uLCAyMDIwLTA3LTI3IGF0IDE2OjQ4ICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBP
biBUaHUsIDIzIEp1bCAyMDIwLCBIc2luLUhzaXVuZyBXYW5nIHdyb3RlOgo+ID4gCj4gPiA+IFRo
aXMgcGF0Y2ggcmVmaW5lcyB0aGUgaW50ZXJydXB0IHJlbGF0ZWQgY29kZSB0byBzdXBwb3J0IG5l
dyBjaGlwcy4KPiA+IAo+ID4gUmVmaW5lcyBpbiB3aGF0IHdheT8KPiA+IAo+ID4gV2hhdCBtYWtl
cyB0aGlzIGJldHRlcj8KPiA+IAo+IAo+IFRoYW5rcyBmb3IgdGhlIGNvbW1lbnQuIEkgd2lsbCBh
ZGQgbW9yZSBpbmZvcm1hdGlvbiBpbnRvIGNvbW1lbnQgbWVzc2FnZQo+IGJhc2VkIG9uIG15IGJl
bG93IGV4cGxhbmF0aW9uLgoKVGhhbmtzLgoKPiA+ID4gU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1
bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Cj4gPiA+IC0tLQo+ID4gPiAg
ZHJpdmVycy9tZmQvbXQ2MzU4LWlycS5jICAgICAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gPiA+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNTgvY29y
ZS5oIHwgIDggKystLS0KPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwg
MzIgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbXQ2
MzU4LWlycS5jIGIvZHJpdmVycy9tZmQvbXQ2MzU4LWlycS5jCj4gPiA+IGluZGV4IGRiNzM0ZjIu
LjRiMDk0ZTUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbWZkL210NjM1OC1pcnEuYwo+ID4g
PiArKysgYi9kcml2ZXJzL21mZC9tdDYzNTgtaXJxLmMKPiA+ID4gQEAgLTEzLDcgKzEzLDkgQEAK
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiA+ID4gICNpbmNsdWRl
IDxsaW51eC9yZWdtYXAuaD4KPiA+ID4gIAo+ID4gPiAtc3RhdGljIHN0cnVjdCBpcnFfdG9wX3Qg
bXQ2MzU4X2ludHNbXSA9IHsKPiA+ID4gKyNkZWZpbmUgTVRLX1BNSUNfUkVHX1dJRFRIIDE2Cj4g
PiA+ICsKPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaXJxX3RvcF90IG10NjM1OF9pbnRzW10g
PSB7Cj4gPiA+ICAJTVQ2MzU4X1RPUF9HRU4oQlVDSyksCj4gPiA+ICAJTVQ2MzU4X1RPUF9HRU4o
TERPKSwKPiA+ID4gIAlNVDYzNThfVE9QX0dFTihQU0MpLAo+ID4gPiBAQCAtMjQsNiArMjYsMTMg
QEAgc3RhdGljIHN0cnVjdCBpcnFfdG9wX3QgbXQ2MzU4X2ludHNbXSA9IHsKPiA+ID4gIAlNVDYz
NThfVE9QX0dFTihNSVNDKSwKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gK3N0YXRpYyBzdHJ1Y3Qg
cG1pY19pcnFfZGF0YSBtdDYzNThfaXJxZCA9IHsKPiA+ID4gKwkubnVtX3RvcCA9IEFSUkFZX1NJ
WkUobXQ2MzU4X2ludHMpLAo+ID4gPiArCS5udW1fcG1pY19pcnFzID0gTVQ2MzU4X0lSUV9OUiwK
PiA+ID4gKwkudG9wX2ludF9zdGF0dXNfcmVnID0gTVQ2MzU4X1RPUF9JTlRfU1RBVFVTMCwKPiA+
ID4gKwkucG1pY19pbnRzID0gbXQ2MzU4X2ludHMsCj4gPiA+ICt9Owo+ID4gCj4gPiBEeW5hbWlj
YWxseSBhc3NpZ25lZCBkcml2ZXIgZGF0YSBpcyB1c3VhbGx5IHByZWZlcnJlZC4KPiA+IAo+ID4g
V2h5IGhhdmUgeW91IGdvbmUgc3RhdGljPwo+ID4gCj4gCj4gRG8geW91IGNvbnNpZGVyIHRoZSBt
ZW1vcnkgYWxsb2NhdGlvbj8KPiBCZWxvdyBtb2RpZmljYXRpb24gaXMgdG8gYXNzaWduIG5lY2Vz
c2FyeSBkYXRhIGR5bmFtaWNhbGx5IGFuZCB0aGUgY29kZQo+IHdpbGwgYmVjb21lIGxvbmdlciB3
aXRoIG1vcmUgY2hpcHMgaWYgd2UgYXNzaWduIGV2ZXJ5IG1lbWJlciBvZiB0aGUKPiBzdHJ1Y3R1
cmUuCgpbLi4uXQoKTmV2ZXIgbWluZC4gIE9uIHNlY29uZCBnbGFuY2UsIHRoaXMgc2hvdWxkIGJl
IGZpbmUuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAt
IERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
