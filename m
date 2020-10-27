Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C795C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 09:29:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C2C22224E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 09:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1vdEezsG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Krr4jShP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C2C22224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sIbN8FIAraXtD9PcIeL1Xf/r5TwUbHmga24bZzqgDFU=; b=1vdEezsG1wrcwbIO4YcWJmISO
	sGOXUpoahLXD2hQJiSlADVWrADaa66XenntEweEWVRFlVI3Mh8uWSg4K7AIaIhbYPL0/OuLA/Wi2a
	aydUAflHpMzKkZ/KHkXb+QGdHVlGqysGMoBcQPB2LOmSbl+5j+KzvOzmbvlFHk1sQ8gcS3w9kXuKS
	+1V3FWd5AQ87D/W0QQUVAr0aLe/47TBeRGRm3Bmq46VsitwlnuABWglo4FU405pJmcGIypEAsEF75
	avkEEckyrZQ//k+lpRaRR/bhBEIDWXsR3MiYZymvj6tIx4GGnlTws0Gh6Oi7r41ZLvaJkhepxyjSf
	IdsTZGJ0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLHy-0002AE-GM; Tue, 27 Oct 2020 09:29:10 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLHu-00029A-AC; Tue, 27 Oct 2020 09:29:06 +0000
Received: by mail-ot1-x341.google.com with SMTP id f97so537342otb.7;
 Tue, 27 Oct 2020 02:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sgFjZIObLui97V1pIxflfNxV2YXVCYIopn9YOyvuSZ0=;
 b=Krr4jShPctiCY36G2WXzjkwBkSSXI15qqafmMA7Nny9kb2qGvsfFbBVMeMhiWeKU7r
 9Our9rSmPOq1P8DYMd1fbvlOLvh/YNaH6gGipsT00sY160lepyETkMwogA37DnRcTX8q
 qvKrgk60Myw4VC/iS9AHE5aAxFrrKOnYvdfcnUHoQrXnE3X8LrlLuab4C91Mixz2Tqwe
 V7rYK9GuTgeHR0gGG1NziQuhlo6pqfzVZ4P27u9usOGdU9RVsKqVWhEelF9ep8hYFa4f
 5kULVUTujC/6/RoT7gFGmWyKJQs+JbDY2HdhMIzioIBqd739uzx/Wt7AxZoD5ZgUsMKc
 IUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sgFjZIObLui97V1pIxflfNxV2YXVCYIopn9YOyvuSZ0=;
 b=UcZtAQhwjpmHuAaTxFbIuH0NytIEPfVzA9AQ2aCYd6gykh3jcVk012+pR8AO6p3MZt
 HBerzjK0KU2xV+bMu/fvWCnLNGFDIwH6xlFlDXwbbVttTyopwuKZaE/7GwioajMiWHkG
 XeagBfBNNOs2QLOs9+23NtllWGwtk4CmvgHhN5No6U/p1XScnxiS74oY7zT2mmSM4PwD
 NP3Ca8r/oGoLjtXYpCqBGeSRnokbktYM3oOAcLrWca3Y2oLwN0/WqEgRwnDELsrK9J6p
 qJA1oy3xTKOkvI+4sbLcPIu8u/KseB97UuYCvcZ5f1jHkvKS1ePHQDWhZ+HLYg/ctyph
 eIrA==
X-Gm-Message-State: AOAM533jUBGXLOgBU/HGsbPROjOqpuifYZWF5q379oPJdRaEkbnSuBmC
 qjPMXgyF3HVCU8bwCF1TfNRj0YkfNgWUrzYALyc=
X-Google-Smtp-Source: ABdhPJxpYV4rEorf2QEsAUwlP2G0D0Aeuljy4KNnLX1qLc2TcDwV6guRYjpFyNnOtSOQ8cug34OzBCRBEvTuWa4UEE0=
X-Received: by 2002:a9d:6d15:: with SMTP id o21mr858982otp.232.1603790943415; 
 Tue, 27 Oct 2020 02:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
 <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
 <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
In-Reply-To: <8925db23-5cc4-3c5f-932a-461fe6450dad@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 27 Oct 2020 17:28:51 +0800
Message-ID: <CAE+NS379bgtRotqzioR+Ya3mE1kZrKfe9qV=W2p=hH7Omrn8Hw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_052906_368955_43CDD422 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0
MTDmnIgyMeaXpSDpgLHkuIkg5LiK5Y2INTo0N+Wvq+mBk++8mgo+Cj4gT24gMTAvMjAvMjAgODo0
NCBBTSwgR2VuZSBDaGVuIHdyb3RlOgo+ID4gSmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pl
d3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0MTDmnIg55pelIOmAseS6lCDkuIrljYg1OjUx5a+r
6YGT77yaCj4gPj4KPiA+PiBIaSBHZW5lLAo+ID4+Cj4gPj4gT24gMTAvNy8yMCAzOjQyIEFNLCBH
ZW5lIENoZW4gd3JvdGU6Cj4gPj4+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsu
Y29tPgo+ID4+Pgo+ID4+PiBBZGQgTVQ2MzYwIExFRCBkcml2ZXIgaW5jbHVkZSAyLWNoYW5uZWwg
Rmxhc2ggTEVEIHdpdGggdG9yY2gvc3Ryb2JlIG1vZGUsCj4gPj4+IDMtY2hhbm5lbCBSR0IgTEVE
IHN1cHBvcnQgUmVnaXN0ZXIvRmxhc2gvQnJlYXRoIE1vZGUsIGFuZCAxLWNoYW5uZWwgZm9yCj4g
Pj4+IG1vb25saWdodCBMRUQuCj4gPj4+Cj4gPj4+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8
Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4+PiAtLS0KPiA+Pj4gICAgZHJpdmVycy9sZWRzL0tj
b25maWcgICAgICAgfCAgMTIgKwo+ID4+PiAgICBkcml2ZXJzL2xlZHMvTWFrZWZpbGUgICAgICB8
ICAgMSArCj4gPj4+ICAgIGRyaXZlcnMvbGVkcy9sZWRzLW10NjM2MC5jIHwgNzgzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+PiAgICAzIGZpbGVzIGNo
YW5nZWQsIDc5NiBpbnNlcnRpb25zKCspCj4gPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2xlZHMvbGVkcy1tdDYzNjAuYwo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9s
ZWRzL0tjb25maWcgYi9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+ID4+PiBpbmRleCAxYzE4MWRmLi5j
NzE5MmRkIDEwMDY0NAo+ID4+PiAtLS0gYS9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+ID4+PiArKysg
Yi9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+ID4+PiBAQCAtMjcxLDYgKzI3MSwxOCBAQCBjb25maWcg
TEVEU19NVDYzMjMKPiA+Pj4gICAgICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZv
ciBvbi1jaGlwIExFRCBkcml2ZXJzIGZvdW5kIG9uCj4gPj4+ICAgICAgICAgIE1lZGlhdGVrIE1U
NjMyMyBQTUlDLgo+ID4+Pgo+ID4+PiArY29uZmlnIExFRFNfTVQ2MzYwCj4gPj4+ICsgICAgIHRy
aXN0YXRlICJMRUQgU3VwcG9ydCBmb3IgTWVkaWF0ZWsgTVQ2MzYwIFBNSUMiCj4gPj4+ICsgICAg
IGRlcGVuZHMgb24gTEVEU19DTEFTU19GTEFTSCAmJiBPRgo+ID4+PiArICAgICBkZXBlbmRzIG9u
IExFRFNfQ0xBU1NfTVVMVElDT0xPUgo+ID4+Cj4gPj4gU2luY2UgQ09ORklHX0xFRF9DTEFTU19N
VUxUSUNPTE9SIGNhbiBiZSB0dXJuZWQgb2ZmIHlvdSBuZWVkIHRvIGhhdmUKPiA+PiBiZWxvdyBp
bnN0ZWFkOgo+ID4+Cj4gPj4gZGVwZW5kcyBvbiBMRURTX0NMQVNTX01VTFRJQ09MT1IgfHwgISFM
RURTX0NMQVNTX01VTFRJQ09MT1IKPiA+Pgo+ID4+IFVubGVzcyB5b3Ugd2FudCB0byBwcmV2ZW50
IGVuYWJsaW5nIHRoZSBkcml2ZXIgd2l0aG91dCBSR0IgTEVELAo+ID4+IGJ1dCB0aGF0IGRvZXMg
bm90IHNlZW0gdG8gYmUgcmVhc29uYWJsZSBhdCBmaXJzdCBnbGFuY2UuCj4gPj4KPiA+Cj4gPiBN
YXkgSSBjaGFuZ2UgdG8gInNlbGVjdCBMRURTX0NMQVNTX01VTFRJQ09MT1IiPwo+ID4gSSBzdXBw
b3NlIFJHQiBhbHdheXMgdXNlIG11bHRpY29sb3IgbW9kZS4KPgo+IFlvdSB3aWxsIGFsc28gaGF2
ZSBtb29ubGlnaHQgTEVEIHRoYXQgd2lsbCBub3QgbmVlZCBtdWx0aWNvbG9yCj4gZnJhbWV3b3Jr
LiBJcyBpdCBzb21laG93IHRyb3VibGVzb21lIHRvIGtlZXAgImRlcGVuZHMgb24iPwo+CgpJZiBv
bmx5IHVzZSBNTCBMRUQgYW5kIEZMRUQsICBEVFNJIHdpbGwgb25seSBkZWZpbmUgTUwgTEVEIGFu
ZCBGTEVELgpUaGVyZWZvcmUsIHRoZSBkcml2ZXJzIHByb2JlIHdpbGwgbm90IHJlZ2lzdGVyIHJn
YiBtdWx0aWNvbG9yIGRldmljZS4KSSB3aWxsIHJlbW92ZSAiZGVwZW5kcyIsIHVzZSAic2VsZWN0
IiBpbnN0ZWFkLgoKPiAtLQo+IEJlc3QgcmVnYXJkcywKPiBKYWNlayBBbmFzemV3c2tpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
