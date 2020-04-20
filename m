Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FC6C3815B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 11:15:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDAE320735
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 11:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V0zX/uIa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z69BlBZc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDAE320735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhF6Z7DeyWK5+CJ42soIs5yqSq91teSoWSGrWnuiWVU=; b=V0zX/uIaGiD/7E
	/yan0bKFE4lKP9gbHeARUvbJfs0q3TGyPJWCiHBydWNG0z/anBi1i2I7pQB74bZwmdva7bgktC1fZ
	tQZ1wUs0Hp0YbNklFz669gXmD7F4PZs3qObfFCoZYtPZ3+bRyrZF4/5rtk+0sx54C/HVxXnIdL8Cp
	URJkL+pzyaEv1tZ/en5sOtOsvtIFQV2FqdGDMXTQXn0YF+jNAPVUei8BeD16aDN/azSQpHN60mffC
	72XMXjQAS2LnyNUX5f+9HBMwLsHuEZRkpgXartmrv6G3Jx5rsNvlEkNkwTcdqjcX2xkNGWvYEB4YT
	2dLCVuCP5eQEyuZChcIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQUOs-0001xU-VJ; Mon, 20 Apr 2020 11:15:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQUOc-0001kM-QU
 for linux-mediatek@lists.infradead.org; Mon, 20 Apr 2020 11:15:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id k1so11646436wrx.4
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2020 04:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4uCgchzEKUbGCjVb5ErPQQvp7VtDEqWO3rkjRlf6Z0c=;
 b=Z69BlBZc3+yIjY+OiSNwt8bsyBI0gsYDwMfdiucsDa5C+MKP/wOJquAOhh0jY8LvP8
 DrypNHoQ8098wugctLVFMem6rV1KysE9rL4PQbw9dgV9IX4vzDo8vaR3IolrnwdZnlue
 oiYWMkYalyjVcjm2bEgoiKKZoPYWWSYOSW2mlfPKPx+R10IJHuVAXZKI+CMv1NXjZwBe
 4ApmE0F3A3wQai4D9aDrDuXakAc3roQsOINa7eE95IHRnzDQ2WMpJIYitHW849I7SOu2
 /WgTnsClHrd3yTWNDwW+tMRpyK1PDxfZIy/Qi+no+uSblRgwH6XmDdXWWcVSG1+c8QGu
 WI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4uCgchzEKUbGCjVb5ErPQQvp7VtDEqWO3rkjRlf6Z0c=;
 b=HkUIsDaBH12QJdgpi72P8dzdywEXZd7IPbluYMFgJtjdCKfEVbLHUG7J03zZY6LQyE
 tpm1Rx6KtybFA49wyJpcd61rK5vKKtsGGx4/6g8Wu9DIVGrEKb6qVcVTR7yCyWm0W0VU
 OYrpHipoLlT0sVw3tb6BkOWAk/7LtW+tSSvbJKEi38SDqnvVhRm8rISkRixPnlyzB0iX
 GGzSCOcSYlBD3h6631mrcYwBhxCRdxvK2w4nvOyXA9xcbHoTQHwqv+PbPFP4kyuRrLkJ
 ELOFoa+i9gFEYsMDnVORKLL2tgDaY411kfUkrU017GtZ6lcI34X5MJozQMrGRVJh0icw
 Vjrg==
X-Gm-Message-State: AGi0PuYEh5ihFJe+F9KvSi2Hh1h7lJJvTunVylkIC7jF0QmNG0wuqHZW
 emWOn9jqu3JnikcyXMeMq5npog==
X-Google-Smtp-Source: APiQypJhmbeviPbiHBjSOOZlAdECJVyeKqJZLm8MMiKHA1YJPMBCV2InSlX2aY5iSqxkecD8aYWnaQ==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr17746146wrt.290.1587381324902; 
 Mon, 20 Apr 2020 04:15:24 -0700 (PDT)
Received: from dell ([95.149.164.107])
 by smtp.gmail.com with ESMTPSA id q143sm969035wme.31.2020.04.20.04.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 04:15:24 -0700 (PDT)
Date: Mon, 20 Apr 2020 12:15:22 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v12 1/6] mfd: mt6397: Modify suspend/resume behavior
Message-ID: <20200420111522.GB3612@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-2-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200416084910.GX2167633@dell>
 <1587379959.6297.2.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587379959.6297.2.camel@mtksdaap41>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_041526_854877_DE1580B1 
X-CRM114-Status: GOOD (  22.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, Richard Fontana <rfontana@redhat.com>,
 linux-rtc@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAyMCBBcHIgMjAyMCwgSHNpbi1oc2l1bmcgV2FuZyB3cm90ZToKCj4gSGksCj4gCj4g
T24gVGh1LCAyMDIwLTA0LTE2IGF0IDA5OjQ5ICswMTAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBP
biBXZWQsIDA4IEFwciAyMDIwLCBIc2luLUhzaXVuZyBXYW5nIHdyb3RlOgo+ID4gCj4gPiA+IFNv
bWUgcG1pY3MgZG9uJ3QgbmVlZCBiYWNrdXAgaW50ZXJydXB0IHNldHRpbmdzLCBzbyB3ZSBjaGFu
Z2UgdG8gdXNlCj4gPiA+IHBtIG5vdGlmaWVyIGZvciB0aGUgcG1pY3Mgd2hpY2ggYXJlIG5lY2Vz
c2FyeSB0byBzdG9yZSBzZXR0aW5ncy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEhzaW4t
SHNpdW5nIFdhbmcgPGhzaW4taHNpdW5nLndhbmdAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+
ID4gIGRyaXZlcnMvbWZkL210NjM5Ny1jb3JlLmMgICAgICAgfCAzMCAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+ID4gIGRyaXZlcnMvbWZkL210NjM5Ny1pcnEuYyAgICAgICAgfCAz
NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gPiAgaW5jbHVkZS9saW51
eC9tZmQvbXQ2Mzk3L2NvcmUuaCB8ICAyICsrCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWZkL210NjM5Ny1jb3JlLmMgYi9kcml2ZXJzL21mZC9tdDYzOTctY29yZS5jCj4gPiA+
IGluZGV4IDA0MzdjODUuLmQyZTcwZDggMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbWZkL210
NjM5Ny1jb3JlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9tZmQvbXQ2Mzk3LWNvcmUuYwo+ID4gPiBA
QCAtMTAwLDM1ICsxMDAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIG10NjM5N19k
ZXZzW10gPSB7Cj4gPiA+ICAJfQo+ID4gPiAgfTsKPiA+ID4gIAo+ID4gPiAtI2lmZGVmIENPTkZJ
R19QTV9TTEVFUAo+ID4gPiAtc3RhdGljIGludCBtdDYzOTdfaXJxX3N1c3BlbmQoc3RydWN0IGRl
dmljZSAqZGV2KQo+ID4gPiAtewo+ID4gPiAtCXN0cnVjdCBtdDYzOTdfY2hpcCAqY2hpcCA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4gPiAtCj4gPiA+IC0JcmVnbWFwX3dyaXRlKGNoaXAtPnJl
Z21hcCwgY2hpcC0+aW50X2NvblswXSwgY2hpcC0+d2FrZV9tYXNrWzBdKTsKPiA+ID4gLQlyZWdt
YXBfd3JpdGUoY2hpcC0+cmVnbWFwLCBjaGlwLT5pbnRfY29uWzFdLCBjaGlwLT53YWtlX21hc2tb
MV0pOwo+ID4gPiAtCj4gPiA+IC0JZW5hYmxlX2lycV93YWtlKGNoaXAtPmlycSk7Cj4gPiA+IC0K
PiA+ID4gLQlyZXR1cm4gMDsKPiA+ID4gLX0KPiA+ID4gLQo+ID4gPiAtc3RhdGljIGludCBtdDYz
OTdfaXJxX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiA+IC17Cj4gPiA+IC0Jc3RydWN0
IG10NjM5N19jaGlwICpjaGlwID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gPiA+IC0KPiA+ID4g
LQlyZWdtYXBfd3JpdGUoY2hpcC0+cmVnbWFwLCBjaGlwLT5pbnRfY29uWzBdLCBjaGlwLT5pcnFf
bWFza3NfY3VyWzBdKTsKPiA+ID4gLQlyZWdtYXBfd3JpdGUoY2hpcC0+cmVnbWFwLCBjaGlwLT5p
bnRfY29uWzFdLCBjaGlwLT5pcnFfbWFza3NfY3VyWzFdKTsKPiA+ID4gLQo+ID4gPiAtCWRpc2Fi
bGVfaXJxX3dha2UoY2hpcC0+aXJxKTsKPiA+ID4gLQo+ID4gPiAtCXJldHVybiAwOwo+ID4gPiAt
fQo+ID4gPiAtI2VuZGlmCj4gPiA+IC0KPiA+ID4gLXN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyht
dDYzOTdfcG1fb3BzLCBtdDYzOTdfaXJxX3N1c3BlbmQsCj4gPiA+IC0JCQltdDYzOTdfaXJxX3Jl
c3VtZSk7Cj4gPiA+IC0KPiA+ID4gIHN0cnVjdCBjaGlwX2RhdGEgewo+ID4gPiAgCXUzMiBjaWRf
YWRkcjsKPiA+ID4gIAl1MzIgY2lkX3NoaWZ0Owo+ID4gPiBAQCAtMjM4LDcgKzIwOSw2IEBAIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10NjM5N19kcml2ZXIgPSB7Cj4gPiA+ICAJLmRy
aXZlciA9IHsKPiA+ID4gIAkJLm5hbWUgPSAibXQ2Mzk3IiwKPiA+ID4gIAkJLm9mX21hdGNoX3Rh
YmxlID0gb2ZfbWF0Y2hfcHRyKG10NjM5N19vZl9tYXRjaCksCj4gPiA+IC0JCS5wbSA9ICZtdDYz
OTdfcG1fb3BzLAo+ID4gPiAgCX0sCj4gPiA+ICAJLmlkX3RhYmxlID0gbXQ2Mzk3X2lkLAo+ID4g
PiAgfTsKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL210NjM5Ny1pcnEuYyBiL2RyaXZl
cnMvbWZkL210NjM5Ny1pcnEuYwo+ID4gPiBpbmRleCBiMmQzY2UxLi4yOTI0OTE5IDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9tdDYzOTctaXJxLmMKPiA+ID4gKysrIGIvZHJpdmVycy9t
ZmQvbXQ2Mzk3LWlycS5jCj4gPiA+IEBAIC05LDYgKzksNyBAQAo+ID4gPiAgI2luY2x1ZGUgPGxp
bnV4L29mX2lycS5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+
ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3N1
c3BlbmQuaD4KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9tZmQvbXQ2MzIzL2NvcmUuaD4KPiA+ID4g
ICNpbmNsdWRlIDxsaW51eC9tZmQvbXQ2MzIzL3JlZ2lzdGVycy5oPgo+ID4gPiAgI2luY2x1ZGUg
PGxpbnV4L21mZC9tdDYzOTcvY29yZS5oPgo+ID4gPiBAQCAtODEsNyArODIsNyBAQCBzdGF0aWMg
c3RydWN0IGlycV9jaGlwIG10NjM5N19pcnFfY2hpcCA9IHsKPiA+ID4gIHN0YXRpYyB2b2lkIG10
NjM5N19pcnFfaGFuZGxlX3JlZyhzdHJ1Y3QgbXQ2Mzk3X2NoaXAgKm10NjM5NywgaW50IHJlZywK
PiA+ID4gIAkJCQkgIGludCBpcnFiYXNlKQo+ID4gPiAgewo+ID4gPiAtCXVuc2lnbmVkIGludCBz
dGF0dXM7Cj4gPiA+ICsJdW5zaWduZWQgaW50IHN0YXR1cyA9IDA7Cj4gPiAKPiA+IFRoaXMgbG9v
a3MgbGlrZSBhbiB1bnJlbGF0ZWQgY2hhbmdlLCBubz8KPiA+IAo+IAo+IEl0IGlzIHRvIGZpeCB0
aGUgY292ZXJpdHkgZGVmZWN0LgoKV2hpY2ggaXNuJ3QgbWVudGlvbmVkIGluIHRoZSBjb21taXQg
bG9nIGFuZCBkb2Vzbid0IGhhdmUgYW55dGhpbmcgdG8KZG8gd2l0aCB0aGlzIHBhdGNoLiAgVGh1
cyBpdCBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaCwgYnV0IEknbQpub3QgZ29pbmcgdG8g
bG9zZSBhbnkgc2xlZXAgb3ZlciBpdC4KCj4gPiA+ICAJaW50IGksIGlycSwgcmV0Owo+ID4gPiAg
Cj4gPiA+ICAJcmV0ID0gcmVnbWFwX3JlYWQobXQ2Mzk3LT5yZWdtYXAsIHJlZywgJnN0YXR1cyk7
Cj4gPiA+IEBAIC0xMjgsNiArMTI5LDM2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXJxX2RvbWFp
bl9vcHMgbXQ2Mzk3X2lycV9kb21haW5fb3BzID0gewo+ID4gPiAgCS5tYXAgPSBtdDYzOTdfaXJx
X2RvbWFpbl9tYXAsCj4gPiA+ICB9Owo+ID4gCj4gPiBPdGhlciB0aGFuIHRoYXQuCj4gPiAKPiA+
IEZvciBteSBvd24gcmVmZXJlbmNlOgo+ID4gICBBY2tlZC1mb3ItTUZELWJ5OiBMZWUgSm9uZXMg
PGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+ID4gCj4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4gSSB3
aWxsIGFkZCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+IAoKLS0gCkxlZSBKb25lcyBb5p2O55C8
5pavXQpMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBz
b3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdp
dHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
