Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7D2C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 07:50:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F21207EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 07:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C436torx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vfyHU6z2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F21207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jp3BQpOxeo9CIbrUo1i7s1n+UBgRIE+RIWJgYun5t3Y=; b=C436torxgKxig9tQaqs9iM8iN
	FRI1dnxQ56tVMIKsMDuw1mhj9cSlCsozo291MBiu14i+NLa/4YBtzBGZFHeqxHL+kYigBamfGSQgz
	IF7WQRd8fJhFAllek47mPKJXHes+OhTvuyG9ZEXh6wLi2e29ksQre6lYYb7D/ri1DDVwMKldp+Rot
	FEGjZO7GtJIFpHCRCcy2OaXYWu/RkFeHrFM06w9xQiGbamWv5sU+U951WSZ3N7c6yTmc+Aeq177fj
	J3DtOOk0c2SrMVMpAW2eB+V5/OMhbBeB22IWiCPWRPfSDjY4+ULp+G57SWWTtUvFNvnNT63PUaIM5
	fAO8fuwZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHL7-0004vo-8T; Thu, 10 Sep 2020 07:49:53 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHL3-0004uz-LB; Thu, 10 Sep 2020 07:49:50 +0000
Received: by mail-io1-xd42.google.com with SMTP id u126so6019596iod.12;
 Thu, 10 Sep 2020 00:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1PTiGOyennkCERiFVjnl2rpLQDxKh0UO1rwGXhcdHGQ=;
 b=vfyHU6z2AJeojj+DWgkbr8McnduBaV7heEabpt0g7kNPwmEEG10g4cZCf2g5RoUr8L
 Q9mrImohY/lrKLwhtTFKLikxUndWYRFzDTnnIPRyDhfOoe4z4P/rrfporvWxZjZQYhD6
 OduT7XQZbzNZhau4enoa/5whfKYXaBewGG8T1EMPWpUwZ5lRtug1Pyx7inuxUi1oOcxD
 gqtstBvTo5Sc7MjPW5IZT8o10fx+6AGZ9jn7DhZm0e0hFgln4T5seRFyRHUZOYGQL3lf
 qTbGjWNYed3kKGn9WQW/wwK5Gj+cSixputaA11nRgAQ9aXfQ9gSIz2/G+2rIJ2JJHM5N
 Suvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1PTiGOyennkCERiFVjnl2rpLQDxKh0UO1rwGXhcdHGQ=;
 b=Ps2KCwz2J1/W4JYzXCXZye8fvr4vDFhfUfibFerVPLuakj2fpN4CQ6LvuG6IJcyrmv
 Q/m8826SrctPngAUeOgJAvaEE/jdaFNK/S0KRZQqLa3peHqcB7FXpWWFFT07GPFbWJL6
 NG4H31jzVKlS4mW7/wuiLTm3mYOJUn5lpqRlr59rZ++cSZHl0eE/ArpiJVTnDg45HEcc
 XPPHyDNSQsu5krtOnKpQO6gMgjMaLMJ4hWGnP/oRsujyhGgXc6OOggovSZZoPPM2T9YP
 ethcFoVa2KnRJ5oX7HG6XMQHCpExkYUYVVFZbdeKAxduUm8ViXqwjG6OLFV0RNJRjvRf
 m66A==
X-Gm-Message-State: AOAM531ipV8xoGUazW+eF2OTSiFs1rdaOWjtRIze9TqNab0riwW3m7Zd
 XpmUPkrPPl7hBRXNGm5S5kyF3WqKTUwdCwccYfw=
X-Google-Smtp-Source: ABdhPJwgD4ZKx8mYopgg3XNY+Per6BffD+Xe9MaqvAy593SfYzFkMrwyS/vdUj1XLskp7sbFyMsOb1GTewknce7HAXI=
X-Received: by 2002:a02:ce8c:: with SMTP id y12mr7734842jaq.53.1599724185207; 
 Thu, 10 Sep 2020 00:49:45 -0700 (PDT)
MIME-Version: 1.0
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200908222544.GF1005@bug>
In-Reply-To: <20200908222544.GF1005@bug>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 10 Sep 2020 07:49:33 +0800
Message-ID: <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_034949_712388_CED38C80 
X-CRM114-Status: GOOD (  17.20  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, Matthias Brugger <matthias.bgg@gmail.com>,
 shufan_lee@richtek.com, Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IOaWvCAyMDIw5bm0OeaciDnml6Ug6YCx5LiJIOS4
iuWNiDY6MjXlr6vpgZPvvJoKPgo+IEhpIQo+Cj4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hl
bkByaWNodGVrLmNvbT4KPiA+Cj4gPiBBZGQgTVQ2MzYwIExFRCBkcml2ZXIgaW5jbHVkZSAyLWNo
YW5uZWwgRmxhc2ggTEVEIHdpdGggdG9yY2gvc3Ryb2JlIG1vZGUsCj4gPiBhbmQgNC1jaGFubmVs
IFJHQiBMRUQgc3VwcG9ydCBSZWdpc3Rlci9GbGFzaC9CcmVhdGggTW9kZQo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gLS0tCj4gPiAg
ZHJpdmVycy9sZWRzL0tjb25maWcgICAgICAgfCAgMTEgKwo+ID4gIGRyaXZlcnMvbGVkcy9NYWtl
ZmlsZSAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL2xlZHMvbGVkcy1tdDYzNjAuYyB8IDY4MSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAzIGZpbGVz
IGNoYW5nZWQsIDY5MyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvbGVkcy9sZWRzLW10NjM2MC5jCj4gPgo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBUaGlz
IG9wdGlvbiBlbmFibGVzIHN1cHBvcnQgZm9yIGR1YWwgRmxhc2ggTEVEIGRyaXZlcnMgZm91bmQg
b24KPiA+ICsgICAgICAgTWVkaWF0ZWsgTVQ2MzYwIFBNSUMuCj4gPiArICAgICAgIEluZGVwZW5k
ZW50IGN1cnJlbnQgc291cmNlcyBzdXBwbHkgZm9yIGVhY2ggZmxhc2ggTEVEIHN1cHBvcnQgdG9y
Y2ggYW5kIHN0cm9iZSBtb2RlLgo+ID4gKyAgICAgICBJbmNsdWRlcyBMb3ctVkYgYW5kIHNob3J0
IHByb3RlY3Rpb24uCj4gPiArCj4KPiA4MCBjb2x1bW5zLiBBbmQgcGVyaGFwcyB1c2VyIGRvZXMg
bm90IG5lZWQgdG8ga25vdyBhYm91dCBwcm90ZWN0aW9ucy4uLiBhbmQgYWN0dWFsbHkKPiBhYm91
dCBpbmRlcGVuZGVuZCBzb3VyY2VzLCBlaXRoZXIuCj4KCkFDSwoKPiAiRW5hYmxlIHRoaXMgZm9y
IFJHQiBMRUQgYW5kIGZsYXNoIExFRCBzdXBwb3J0IG9uLi4uIj8KPgo+ID4gK3N0YXRpYyBpbnQg
bXQ2MzYwX3RvcmNoX2JyaWdodG5lc3Nfc2V0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxjZGV2LCBl
bnVtIGxlZF9icmlnaHRuZXNzIGxldmVsKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBtdDYzNjBf
bGVkICpsZWQgPSBjb250YWluZXJfb2YobGNkZXYsIHN0cnVjdCBtdDYzNjBfbGVkLCBmbGFzaC5s
ZWRfY2Rldik7Cj4gPiArICAgICBzdHJ1Y3QgbXQ2MzYwX3ByaXYgKnByaXYgPSBsZWQtPnByaXY7
Cj4gPiArICAgICB1MzIgZW5hYmxlX21hc2sgPSBNVDYzNjBfVE9SQ0hFTl9NQVNLIHwgTVQ2MzYw
X0ZMQ1NFTl9NQVNLKGxlZC0+bGVkX25vKTsKPiA+ICsgICAgIHUzMiB2YWwgPSAobGV2ZWwpID8g
TVQ2MzYwX0ZMQ1NFTl9NQVNLKGxlZC0+bGVkX25vKSA6IDA7Cj4gPiArICAgICB1MzIgcHJldiA9
IHByaXYtPmZsZWRfdG9yY2hfdXNlZCwgY3VycjsKPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4g
PiArICAgICBkZXZfZGJnKGxjZGV2LT5kZXYsICJbJWRdIGJyaWdodG5lc3MgJWRcbiIsIGxlZC0+
bGVkX25vLCBsZXZlbCk7Cj4gPiArICAgICBpZiAocHJpdi0+ZmxlZF9zdHJvYmVfdXNlZCkgewo+
ID4gKyAgICAgICAgICAgICBkZXZfd2FybihsY2Rldi0+ZGV2LCAiUGxlYXNlIGRpc2FibGUgc3Ry
b2JlIGZpcnN0IFslZF1cbiIsIHByaXYtPmZsZWRfc3Ryb2JlX3VzZWQpOwo+ID4gKyAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgIH0KPgo+IFNvLi4uIGhvdyBkb2VzIGl0cyB1
c2VybGFuZCBpbnRlcmZhY2UgbG9vayBsaWtlPwo+CgoxLiBzZXQgRkxFRDEgYnJpZ2h0bmVzcwoj
IGVjaG8gMSA+IC9zeXMvY2xhc3MvbGVkcy93aGl0ZTpmbGFzaDEvZmxhc2hfYnJpZ2h0bmVzcwoy
LiBlbmFibGUgRkxFRDEgc3Ryb2JlCiMgZWNobyAxID4gL3N5cy9jbGFzcy9sZWRzL3doaXRlOmZs
YXNoMS9mbGFzaF9zdHJvYmUKMyAuIHR1cm4gb2ZmIEZMRUQxIHN0cm9iZSAoanVzdCB1c2VkIHRv
IGdhdXJhbnRlZSB0aGUgc3Ryb2JlIG1vZGUKZmxhc2ggbGVkcyBtdXN0IGJlIHR1cm5lZCBvZmYp
CiMgZWNobyAwID4gL3N5cy9jbGFzcy9sZWRzL3doaXRlOmZsYXNoMS9mbGFzaF9zdHJvYmUKCj4g
QmVzdCByZWdhcmRzLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBhdmVsCj4gLS0KPiAoZW5nbGlzaCkgaHR0
cDovL3d3dy5saXZlam91cm5hbC5jb20vfnBhdmVsbWFjaGVrCj4gKGNlc2t5LCBwaWN0dXJlcykg
aHR0cDovL2F0cmV5Lmthcmxpbi5tZmYuY3VuaS5jei9+cGF2ZWwvcGljdHVyZS9ob3JzZXMvYmxv
Zy5odG1sCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
