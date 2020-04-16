Return-Path: <SRS0=NHOn=6A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FCDC2BB85
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 08:48:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A521020784
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Apr 2020 08:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rd8PNO7a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qMyY08os"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A521020784
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkscsrcXkURYcFhx7ENHAhwrnJVdUNPz/EVqX3yAy+U=; b=Rd8PNO7a2A0WTu
	GtQgAeJsc81ZzssEZFcV4/xjWHe6JrfpO1xvZoP+UIh+7IQWc19tYvsvRG2+zTu69mgxNFt2TSnMm
	oSfUNtCOPjk4QKMz5FnfoofZ023r1usG2++ehrGhGeG8H0qxxumiFjR7HdvtOiJS4L2r92ohD35Gf
	oJ4tBo5WQoV5Hrv/vXwuFGNEReE7CfpAGs2T/9SuaLWUfbTnsRChnYqX/lihMU6iPf4/enonBDwF8
	JiuFjK/G1tj9Zu75K50qNJM1PItuFTbRpKugktsT3/g7beSUhfhwG8kFa2ar88O6fQokyi3LAVOz6
	YbeX10tAVUdF4m0NLtYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP0C8-0007uf-NH; Thu, 16 Apr 2020 08:48:24 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP0Bw-0007jB-Qr
 for linux-mediatek@lists.infradead.org; Thu, 16 Apr 2020 08:48:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id f13so3780056wrm.13
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Apr 2020 01:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gCC6rxpfNBHEEJoswTl2+v3GlY13e+wv1Apu4C5uUJ0=;
 b=qMyY08os0xXarDJEQ8j9nJU1G/4i1ajvSN1547JGWNAU4kptYy+l0ETyItzmwelvLC
 nCDep5Cl1t95mbiIhlCDcowJNJGFakofRU/UeiPQv049DorrDQDyvOhQ0iXlohLp8hin
 3bAdw+39EFnaQiFiejH+534QfsSXNhMyYx4ZtJs1O8APzJpuT9KiZORIU2xx8m9me3GJ
 nRCzeSz6fhZnRuGUV65gJOj0k8DMrASVs1ffDMfO5wQ+4MKhMzyo1Hf7xWdNJii/ENzy
 uOrTcZOmWLeo1D6phvtKajqfSbjF0JkyzG19tN5chV4GtOZYui9witk4RNmc7L0KIuBW
 GEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gCC6rxpfNBHEEJoswTl2+v3GlY13e+wv1Apu4C5uUJ0=;
 b=gTGDABdK6NxFJ9/IWMzWZtwkaP7sTD14yf5/HMQLJ5ZM7j+9yxdPf4bdpKe5YB6h4M
 qY5leGWNdQDQKIgBtCjklXnOsFdyVvPS39DKI/ssd458hKTD8Sq2MWBbg1fGYQMkQ/9H
 Fav+yAASo/oAoOIt9Fu6/tC3CKvYmds+4YgE5eV0VhM6iUEDQYJRP7T3nosnP4JkMl9h
 lk60FcGXJtfiZltoGs9/s2bVMVXKtH/IRH0WeUcxpYjxB8tPPMNyfgRJdfpqXGE2fi3+
 Jbb6JBtuLxcw18MOFyWt4mNf0MRM6F8X0GhH8OPcOxgcs57phTVDmf5qHZ3bEx8Pq2Y+
 8Vkg==
X-Gm-Message-State: AGi0PuYOgLVuWp9Bwtq4IpY8JG+hJ50hYNTWaiM6n0u/wp/eGNZ4/ixS
 ZY3tVSRVCDUfEshrSJ7JPLvbmw==
X-Google-Smtp-Source: APiQypLyhDVW4E+VOlBHWErivAdlGrtxixDqwonOAkbRNQamJnKVsV0vJKLtvSLryabLtX0HhH0tLg==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr21252278wrq.222.1587026890846; 
 Thu, 16 Apr 2020 01:48:10 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id z15sm14429845wrs.47.2020.04.16.01.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 01:48:10 -0700 (PDT)
Date: Thu, 16 Apr 2020 09:49:10 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v12 1/6] mfd: mt6397: Modify suspend/resume behavior
Message-ID: <20200416084910.GX2167633@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-2-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586333531-21641-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_014812_864612_B0E4F049 
X-CRM114-Status: GOOD (  15.22  )
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
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 linux-rtc@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>, srv_heupstream@mediatek.com,
 Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAwOCBBcHIgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gU29tZSBwbWlj
cyBkb24ndCBuZWVkIGJhY2t1cCBpbnRlcnJ1cHQgc2V0dGluZ3MsIHNvIHdlIGNoYW5nZSB0byB1
c2UKPiBwbSBub3RpZmllciBmb3IgdGhlIHBtaWNzIHdoaWNoIGFyZSBuZWNlc3NhcnkgdG8gc3Rv
cmUgc2V0dGluZ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1o
c2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL210NjM5Ny1jb3Jl
LmMgICAgICAgfCAzMCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9t
ZmQvbXQ2Mzk3LWlycS5jICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystCj4gIGluY2x1ZGUvbGludXgvbWZkL210NjM5Ny9jb3JlLmggfCAgMiArKwo+ICAzIGZp
bGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21mZC9tdDYzOTctY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2Mzk3LWNv
cmUuYwo+IGluZGV4IDA0MzdjODUuLmQyZTcwZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZmQv
bXQ2Mzk3LWNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM5Ny1jb3JlLmMKPiBAQCAtMTAw
LDM1ICsxMDAsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIG10NjM5N19kZXZzW10g
PSB7Cj4gIAl9Cj4gIH07Cj4gIAo+IC0jaWZkZWYgQ09ORklHX1BNX1NMRUVQCj4gLXN0YXRpYyBp
bnQgbXQ2Mzk3X2lycV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAtewo+IC0Jc3RydWN0
IG10NjM5N19jaGlwICpjaGlwID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gLQo+IC0JcmVnbWFw
X3dyaXRlKGNoaXAtPnJlZ21hcCwgY2hpcC0+aW50X2NvblswXSwgY2hpcC0+d2FrZV9tYXNrWzBd
KTsKPiAtCXJlZ21hcF93cml0ZShjaGlwLT5yZWdtYXAsIGNoaXAtPmludF9jb25bMV0sIGNoaXAt
Pndha2VfbWFza1sxXSk7Cj4gLQo+IC0JZW5hYmxlX2lycV93YWtlKGNoaXAtPmlycSk7Cj4gLQo+
IC0JcmV0dXJuIDA7Cj4gLX0KPiAtCj4gLXN0YXRpYyBpbnQgbXQ2Mzk3X2lycV9yZXN1bWUoc3Ry
dWN0IGRldmljZSAqZGV2KQo+IC17Cj4gLQlzdHJ1Y3QgbXQ2Mzk3X2NoaXAgKmNoaXAgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsKPiAtCj4gLQlyZWdtYXBfd3JpdGUoY2hpcC0+cmVnbWFwLCBjaGlw
LT5pbnRfY29uWzBdLCBjaGlwLT5pcnFfbWFza3NfY3VyWzBdKTsKPiAtCXJlZ21hcF93cml0ZShj
aGlwLT5yZWdtYXAsIGNoaXAtPmludF9jb25bMV0sIGNoaXAtPmlycV9tYXNrc19jdXJbMV0pOwo+
IC0KPiAtCWRpc2FibGVfaXJxX3dha2UoY2hpcC0+aXJxKTsKPiAtCj4gLQlyZXR1cm4gMDsKPiAt
fQo+IC0jZW5kaWYKPiAtCj4gLXN0YXRpYyBTSU1QTEVfREVWX1BNX09QUyhtdDYzOTdfcG1fb3Bz
LCBtdDYzOTdfaXJxX3N1c3BlbmQsCj4gLQkJCW10NjM5N19pcnFfcmVzdW1lKTsKPiAtCj4gIHN0
cnVjdCBjaGlwX2RhdGEgewo+ICAJdTMyIGNpZF9hZGRyOwo+ICAJdTMyIGNpZF9zaGlmdDsKPiBA
QCAtMjM4LDcgKzIwOSw2IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10NjM5N19k
cml2ZXIgPSB7Cj4gIAkuZHJpdmVyID0gewo+ICAJCS5uYW1lID0gIm10NjM5NyIsCj4gIAkJLm9m
X21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG10NjM5N19vZl9tYXRjaCksCj4gLQkJLnBtID0g
Jm10NjM5N19wbV9vcHMsCj4gIAl9LAo+ICAJLmlkX3RhYmxlID0gbXQ2Mzk3X2lkLAo+ICB9Owo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzOTctaXJxLmMgYi9kcml2ZXJzL21mZC9tdDYz
OTctaXJxLmMKPiBpbmRleCBiMmQzY2UxLi4yOTI0OTE5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bWZkL210NjM5Ny1pcnEuYwo+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM5Ny1pcnEuYwo+IEBAIC05
LDYgKzksNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPgo+ICsjaW5j
bHVkZSA8bGludXgvc3VzcGVuZC5oPgo+ICAjaW5jbHVkZSA8bGludXgvbWZkL210NjMyMy9jb3Jl
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9tZmQvbXQ2MzIzL3JlZ2lzdGVycy5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvbWZkL210NjM5Ny9jb3JlLmg+Cj4gQEAgLTgxLDcgKzgyLDcgQEAgc3RhdGljIHN0
cnVjdCBpcnFfY2hpcCBtdDYzOTdfaXJxX2NoaXAgPSB7Cj4gIHN0YXRpYyB2b2lkIG10NjM5N19p
cnFfaGFuZGxlX3JlZyhzdHJ1Y3QgbXQ2Mzk3X2NoaXAgKm10NjM5NywgaW50IHJlZywKPiAgCQkJ
CSAgaW50IGlycWJhc2UpCj4gIHsKPiAtCXVuc2lnbmVkIGludCBzdGF0dXM7Cj4gKwl1bnNpZ25l
ZCBpbnQgc3RhdHVzID0gMDsKClRoaXMgbG9va3MgbGlrZSBhbiB1bnJlbGF0ZWQgY2hhbmdlLCBu
bz8KCj4gIAlpbnQgaSwgaXJxLCByZXQ7Cj4gIAo+ICAJcmV0ID0gcmVnbWFwX3JlYWQobXQ2Mzk3
LT5yZWdtYXAsIHJlZywgJnN0YXR1cyk7Cj4gQEAgLTEyOCw2ICsxMjksMzYgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBpcnFfZG9tYWluX29wcyBtdDYzOTdfaXJxX2RvbWFpbl9vcHMgPSB7Cj4gIAku
bWFwID0gbXQ2Mzk3X2lycV9kb21haW5fbWFwLAo+ICB9OwoKT3RoZXIgdGhhbiB0aGF0LgoKRm9y
IG15IG93biByZWZlcmVuY2U6CiAgQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2Vz
IFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
Uk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
