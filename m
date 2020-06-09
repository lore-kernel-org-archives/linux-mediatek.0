Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E7CC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 12:53:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5F9020825
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 12:53:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UHrGL1ya";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRudMVlH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5F9020825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+mkvxbd8uVXZhnkSRifqlseNRcllYE66eRfpJANFC8=; b=UHrGL1yaOs9+la
	GiIq0c0smH6CmdOL3xcmvOQhd713oqfEK5ia4uny29sb8dZv3nRK3lk1UdcQ5ox+oLQhJKJ6Cz1rV
	Z4CCs89Ee/TgCMkMBDQ6NOx7T+Zz3nuFQm+1gU1HlYZ0F9S6eKWHie8qVACintsr6BPXT/Ae2nuqj
	ukRcJQQUyTYC32YneTXLe6kMb4ca/kwNXbPr0oPCwOLTCWIIz47+mAQJ7p76Ovq4x96kKRS2b4VKP
	EBOo0m3oaGAHq37PG8IsGkmOhRt1hNOil3jFAQQBmm3Y8Qa3jqhBSAJndV+dqqeA9P1xp8vZvSRp7
	w68w6wF6Wzh+4+fTnREg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jidkn-0005JR-K2; Tue, 09 Jun 2020 12:53:21 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jidke-0005Aa-Ft
 for linux-mediatek@lists.infradead.org; Tue, 09 Jun 2020 12:53:14 +0000
Received: by mail-wr1-x442.google.com with SMTP id l10so21158997wrr.10
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Jun 2020 05:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vrPhBQinJOm2GiOyvxlhSLQ8G2hbgcP888EbPjYnpWE=;
 b=sRudMVlHtnJjHmIBx59yGnZa7TgnSFmEgOv0HeaNM3Yw6g193AyJONzpDj2K1k4nbZ
 3xTl+eARUVcQU6Tt4E8p8c0kSvnhRU6CK94wKp+O1zKCK+BeFLfrkSnDGF3JEPThV4Kd
 sc07ajaQZQWU4bdYabuqev/2HW/xax9AGAylbGoOfdNWNMt9JNAxjWGIYUtRdbqIhMip
 Gds5DE0qh1mqcJn4jEGBTyTRPUXERdeb5nY1+Ia72Gg4h/xKlmGIbxdvsgvQNiE0lLDm
 86jNWlJqpc7q8mwufN9tb6/TTTnBM3wyRs/wn4wAaI7ZPy32ylNLyC2fvzh8u254T5eN
 IetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vrPhBQinJOm2GiOyvxlhSLQ8G2hbgcP888EbPjYnpWE=;
 b=ne6qLZEOPyyl9h/m6qfPfkM9jGDRwvJLoQuVKCZz/p0cDT1/55Q7/nreQx2y1yDWGl
 smBPUWAzI3mZ4sje0DJivv/DojF6sTJ1LuJ8B/48UKxfyvjogMntMewDg153pUxXWeRT
 jfEqOZeUc65XvZ3Typ+aq10+PyhrwaOQjfwNaYwwSyFZV5jzxrWVX9QRsMH3ZkW+tv7+
 fVk4+nCvNORh+RXEteMs178qbQDhDVn52iAfFvlXNSxTxGjLmwdITP5LxwTm3mU5IoEV
 Rr8Q74iwVPUq+FESh2Xgn6rxOaJOMCu3QQxBICE2UuVXQG7icgIj97ARXHAi+9bTPb+m
 3C/A==
X-Gm-Message-State: AOAM532C2fAgEEB9Dpcx3fRygV1OfFbOGvxaWP6hnunYdosjmic1yQ35
 NPIevJA3HS4slOssoQZnhDgnUg==
X-Google-Smtp-Source: ABdhPJyUpfpT9l7B1MvSK8xJp6dacca2BXQKTrAQ4Wc72VOm5cQExzdGg3Ltp/re4zTYpjuCHoMJaA==
X-Received: by 2002:adf:feca:: with SMTP id q10mr3990520wrs.380.1591707191199; 
 Tue, 09 Jun 2020 05:53:11 -0700 (PDT)
Received: from dell ([2.27.167.101])
 by smtp.gmail.com with ESMTPSA id x205sm2925431wmx.21.2020.06.09.05.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 05:53:10 -0700 (PDT)
Date: Tue, 9 Jun 2020 13:53:05 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH] mfd: mt6360: Fix register driver NULL pointer by add
 driver name
Message-ID: <20200609125305.GL4106@dell>
References: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
 <20200608192829.GG4106@dell>
 <CAE+NS36mxw-FpQhJ4qV=_+r2CXVi_PaGaZo2m3jXAGFuOO252Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS36mxw-FpQhJ4qV=_+r2CXVi_PaGaZo2m3jXAGFuOO252Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_055312_597794_1BBBA599 
X-CRM114-Status: GOOD (  14.76  )
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
 cy_huang@richtek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwOSBKdW4gMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDbmnIg55pelIOmAseS6jCDkuIrljYgzOjI45a+r
6YGT77yaCj4gPgo+ID4gT24gTW9uLCAwOCBKdW4gMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgo+ID4K
PiA+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+Cj4gPiA+
IGFjY2lkZW50YWxseSByZW1vdmUgZHJpdmVyIG5hbWUgd2hlbgo+ID4gPiByZXBsYWNlIHByb2Jl
IGJ5IHByb2JlX25ldyBpbiBhZGQgbXQ2MzYwIG1mZCBkcml2ZXIgcGF0Y2ggdjQKPiA+ID4KPiA+
ID4gWyAgMTIxLjI0MzAxMl0gRUFYOiBjMmE4YmM2NCBFQlg6IDAwMDAwMDAwIEVDWDogMDAwMDAw
MDAgRURYOiAwMDAwMDAwMAo+ID4gPiBbICAxMjEuMjQzMDEyXSBFU0k6IGMyYThiYzc5IEVESTog
MDAwMDAwMDAgRUJQOiBlNTRiZGVhOCBFU1A6IGU1NGJkZWEwCj4gPiA+IFsgIDEyMS4yNDMwMTJd
IERTOiAwMDdiIEVTOiAwMDdiIEZTOiAwMDAwIEdTOiAwMDAwIFNTOiAwMDY4IEVGTEFHUzogMDAw
MTAyODYKPiA+ID4gWyAgMTIxLjI0MzAxMl0gQ1IwOiA4MDA1MDAzMyBDUjI6IDAwMDAwMDAwIENS
MzogMDJlYzMwMDAgQ1I0OiAwMDAwMDZiMAo+ID4gPiBbICAxMjEuMjQzMDEyXSBDYWxsIFRyYWNl
Ogo+ID4gPiBbICAxMjEuMjQzMDEyXSAga3NldF9maW5kX29iaisweDNkLzB4YzAKPiA+ID4gWyAg
MTIxLjI0MzAxMl0gIGRyaXZlcl9maW5kKzB4MTYvMHg0MAo+ID4gPiBbICAxMjEuMjQzMDEyXSAg
ZHJpdmVyX3JlZ2lzdGVyKzB4NDkvMHgxMDAKPiA+ID4gWyAgMTIxLjI0MzAxMl0gID8gaTJjX2Zv
cl9lYWNoX2RldisweDM5LzB4NTAKPiA+ID4gWyAgMTIxLjI0MzAxMl0gID8gX19wcm9jZXNzX25l
d19hZGFwdGVyKzB4MjAvMHgyMAo+ID4gPiBbICAxMjEuMjQzMDEyXSAgPyBjaHRfd2NfZHJpdmVy
X2luaXQrMHgxMS8weDExCj4gPiA+IFsgIDEyMS4yNDMwMTJdICBpMmNfcmVnaXN0ZXJfZHJpdmVy
KzB4MzAvMHg4MAo+ID4gPiBbICAxMjEuMjQzMDEyXSAgPyBpbnRlbF9scHNzX3BjaV9kcml2ZXJf
aW5pdCsweDE2LzB4MTYKPiA+ID4gWyAgMTIxLjI0MzAxMl0gIG10NjM2MF9wbXVfZHJpdmVyX2lu
aXQrMHhmLzB4MTEKPiA+ID4gWyAgMTIxLjI0MzAxMl0gIGRvX29uZV9pbml0Y2FsbCsweDMzLzB4
MWEwCj4gPiA+IFsgIDEyMS4yNDMwMTJdICA/IHBhcnNlX2FyZ3MrMHgxZWIvMHgzZDAKPiA+ID4g
WyAgMTIxLjI0MzAxMl0gID8gX19taWdodF9zbGVlcCsweDMxLzB4OTAKPiA+ID4gWyAgMTIxLjI0
MzAxMl0gID8ga2VybmVsX2luaXRfZnJlZWFibGUrMHgxMGEvMHgxN2YKPiA+ID4gWyAgMTIxLjI0
MzAxMl0gIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MTJjLzB4MTdmCj4gPiA+IFsgIDEyMS4yNDMw
MTJdICA/IHJlc3RfaW5pdCsweDExMC8weDExMAo+ID4gPiBbICAxMjEuMjQzMDEyXSAga2VybmVs
X2luaXQrMHhiLzB4MTAwCj4gPiA+IFsgIDEyMS4yNDMwMTJdICA/IHNjaGVkdWxlX3RhaWxfd3Jh
cHBlcisweDkvMHhjCj4gPiA+IFsgIDEyMS4yNDMwMTJdICByZXRfZnJvbV9mb3JrKzB4MTkvMHgy
NAo+ID4gPiBbICAxMjEuMjQzMDEyXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiA+ID4gWyAgMTIxLjI0
MzAxMl0gQ1IyOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiA+IFsgIDEyMS4yNDMwMTJdIHJhbmRvbTog
Z2V0X3JhbmRvbV9ieXRlcyBjYWxsZWQgZnJvbSBpbml0X29vcHNfaWQrMHgzYS8weDQwIHdpdGgg
Y3JuZ19pbml0PTAKPiA+ID4gWyAgMTIxLjI0MzAxMl0gLS0tWyBlbmQgdHJhY2UgMzhhODAzNDAw
ZjFhMmJlZSBdLS0tCj4gPiA+IFsgIDEyMS4yNDMwMTJdIEVJUDogc3RyY21wKzB4MTEvMHgzMAo+
ID4KPiA+IEhvdyBkaWQgdGhpcyBkcml2ZXIgZXZlciB3b3JrIGZvciB5b3U/Cj4gCj4gaSBhc2sg
bXkgY293b3JrZXIgaGVscCBtZSB2ZXJpZnkuCj4gaSB3aWxsIGNoZWNrIHRoZSBwYXRjaCBteXNl
bGYsIHNpbmNlcmVseSBhcG9sb2dpZXMgZm9yIHRoaXMuCgpXaGF0IGRvZXMgdGhpcyBtZWFuPwoK
QXJlIHlvdSBzYXlpbmcgdGhhdCBmb3IgYWxsIDEwIHZlcnNpb25zIG9mIHRoaXMgcGF0Y2ggc3Vi
bWlzc2lvbiwgaXQKaGFzIG5ldmVyIGJlZW4gdGVzdGVkPyAgQW5kIGRlc3BpdGUgYmVpbmcgYXV0
aG9yZWQgYnkgeW91IGFuZApzdWJtaXR0ZWQgYnkgeW91LCB5b3UgaGF2ZSBuZXZlciBhY3R1YWxs
eSBib290IHRlc3RlZCB0aGUgZHJpdmVyCnlvdXJzZWxmPyAgUmVseWluZyBpbnN0ZWFkIG9uIHlv
dXIgY28td29ya2VyIHRvIGNvbmR1Y3QgdGhlIHRlc3RpbmcsCndobyBmYWlsZWQgdG8gZG8gc28u
ICBJcyB0aGF0IHJlYWxseSBjb3JyZWN0PwoKPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVu
IDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tZmQvbXQ2
MzYwLWNvcmUuYyB8IDEgKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVy
cy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiBpbmRleCBkYjhjZGY1Li5lOWNhY2MyIDEwMDY0NAo+
ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
bWZkL210NjM2MC1jb3JlLmMKPiA+ID4gQEAgLTQxMiw2ICs0MTIsNyBAQCBNT0RVTEVfREVWSUNF
X1RBQkxFKG9mLCBtdDYzNjBfcG11X29mX2lkKTsKPiA+ID4KPiA+ID4gIHN0YXRpYyBzdHJ1Y3Qg
aTJjX2RyaXZlciBtdDYzNjBfcG11X2RyaXZlciA9IHsKPiA+ID4gICAgICAgLmRyaXZlciA9IHsK
PiA+ID4gKyAgICAgICAgICAgICAubmFtZSA9ICJtdDYzNjBfcG11IiwKPiA+ID4gICAgICAgICAg
ICAgICAucG0gPSAmbXQ2MzYwX3BtdV9wbV9vcHMsCj4gPiA+ICAgICAgICAgICAgICAgLm9mX21h
dGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG10NjM2MF9wbXVfb2ZfaWQpLAo+ID4gPiAgICAgICB9
LAo+ID4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0g
RGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
