Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074FCC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 15:05:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1496128C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 15:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF1496128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXku4OQajVKYnBcHsxBGx1QGfd5WzaSZScHaOJZ2hek=; b=FyFsGpNco5X2vA
	lDxYKiU7GLP78kmNxjyE6xh8O/x9eNXBnCQqraGABeFOSehyFG50YbXV21/uY/OD8jPzgNSF8PQPn
	OO+qsmKgyvh8jcl76L7xAIXSd3OsxyskIRQYkr/Y4ukEqQfIvJm/yEAOVCxItcWQhOn0VCG38oiRt
	SL5vwAV4tesF2kVe2LOWSd7eKSrSDuzcibXUGazil7awQJqftondJdzzd5LrXpgqVcFNfE0DB/TdK
	hz5OeF11K3T6XnVbHTjs7oXYUPI7kosjMNfk6gbjw+2DyJdpQ+76JX54g3KDzZk5/Pkwh95SS4jP1
	+/dfKl6hdXT4Nqj6YAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lso9c-00Eeys-1D; Mon, 14 Jun 2021 15:05:32 +0000
Received: from mail-lj1-f173.google.com ([209.85.208.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lso9M-00Eeuz-9h; Mon, 14 Jun 2021 15:05:17 +0000
Received: by mail-lj1-f173.google.com with SMTP id l4so8095474ljg.0;
 Mon, 14 Jun 2021 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=amLIRuKnX8etVBSiINMJCmDXT6ZlQpwL3htcwT0iYfw=;
 b=HqNjQ+tMbZJq5JAwtGeHbUE3rr52qEq/eM/9wyt39c/Oi45aL+/qQ2BV6XglFCeAOc
 41sv5B+PJ0ZvQqdOdZP4byrqsI61Po7CIz47VUnyMyU8f9aaun2VfrB6Zj4hb2UHkOkH
 +NwNTv0CqYoPnkVLpgXYaZxxdY511dBFMGhgqg/+nuKquX3QOn0tkiFqBVi+nij+5OxU
 lCgmvm62M1hfH8K5PmifI8NxKoM9qPEZDPfNJEpRS2TNwCteVvE5klB4WTKVf3nzI8Y2
 B3rgFvtNw6PAlN4lGELO6SMEFwfaITgmfDaNMd2zFwAuEtVOPLVJBEpWklxyL4LTxZzM
 BKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=amLIRuKnX8etVBSiINMJCmDXT6ZlQpwL3htcwT0iYfw=;
 b=EnTQ91Zrz++lo+0qdyNFRDAsgbFTprDiB/eQvE0kT/pjjTOAhRJZ+ZfNyI9/qsxqiF
 ggaCqJ+mwXIsADMeA+NVSNqZf+5qwzQZ7onlBMzvIFhBnlp+1GknaLDpuD6WDYB0nnrb
 OnMZXc1KPBzgkpk4FrImQHWYRrBr6JWHxtret6w3zPP28/CdFdOiUAxIlcSBJAYNqobf
 /JplNtilCM8QS943dMnMzsVnNhlQF78ej+BYfpcTIDO0RrenTMQzKkJu0cKV4TPhXOXF
 6GokfvBn20qyGIrKurY5D4hJJuQaOk3fgSLOnCS3Mfd6W9W84KqM0Y94Y4bz2NTJ1ieW
 do+g==
X-Gm-Message-State: AOAM533EjD3UWSZw8zk4xq3VfdyRPIgZRTOvRx5rlKkJvwH/yGB5MixY
 ggkd2rByL85Y2EPl/sxEO1j+2/VGJoojMV26nCY=
X-Google-Smtp-Source: ABdhPJxHddSXn7MQEp2UzCg15YgRi/rclsfAe5DXKS289hueqMrow1G88LUOOdzToY/PLKHRHzJnJCnx8KUSm8YacgE=
X-Received: by 2002:a2e:2f03:: with SMTP id v3mr13547128ljv.168.1623683053157; 
 Mon, 14 Jun 2021 08:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <1622616875-22740-1-git-send-email-u0084500@gmail.com>
 <20210611201643.GA1583875@robh.at.kernel.org>
In-Reply-To: <20210611201643.GA1583875@robh.at.kernel.org>
From: ChiYuan Huang <u0084500@gmail.com>
Date: Mon, 14 Jun 2021 23:04:01 +0800
Message-ID: <CADiBU39Prz99ZLtkYdcM9XDQsd0nKKeiEGjW3wq=u75JGjwX=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] regulator: mt6360: Add optional
 mediatek.power-off-sequence in bindings document
To: Rob Herring <robh@kernel.org>
Cc: lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 matthias.bgg@gmail.com, 
 gene_chen@richtek.com, lkml <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, cy_huang <cy_huang@richtek.com>, 
 gene.chen.richtek@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_080516_378453_304EDF78 
X-CRM114-Status: GOOD (  26.17  )
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

SGksIFJvYjoKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0NuaciDEy
5pelIOmAseWFrSDkuIrljYg0OjE25a+r6YGT77yaCj4KPiBPbiBXZWQsIEp1biAwMiwgMjAyMSBh
dCAwMjo1NDozNFBNICswODAwLCBjeV9odWFuZyB3cm90ZToKPiA+IEZyb206IENoaVl1YW4gSHVh
bmcgPGN5X2h1YW5nQHJpY2h0ZWsuY29tPgo+ID4KPiA+IEFkZCBvcHRpb25hbCBtZWRpYXRlay5w
b3dlci1vZmYtc2VxdWVuY2UgaW4gYmluZGluZ3MgZG9jdW1lbnQuCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogQ2hpWXVhbiBIdWFuZyA8Y3lfaHVhbmdAcmljaHRlay5jb20+Cj4gPiAtLS0KPiA+IEhp
LAo+ID4KPiA+IE9yaWdpbmFsbHksIHdlIHRoaW5rIGl0IG11c3Qgd3JpdGUgaW4gcGxhdGZvcm0g
ZGVwZW5kZW50IGNvZGUgbGlrZSBhcyBib290bG9hZGVyLgo+ID4gQnV0IGFmdGVyIHRoZSBldmFs
dWF0aW9uLCBpdCBtdXN0IHdyaXRlIG9ubHkgd2hlbiBzeXN0ZW0gbm9ybWFsIEhBTFQgb3IgUE9X
RVJfT0ZGLgo+ID4gRm9yIHRoZSBvdGhlciBjYXNlcywganVzdCBmb2xsb3cgSFcgaW1tZWRpYXRl
IG9mZiBieSBkZWZhdWx0Lgo+Cj4gV291bGRuJ3QgdGhpcyBiZSBoYW5kbGVkIGJ5IFBTQ0kgaW1w
bGVtZW50YXRpb24/Ck5vLCB0aGUgY3VycmVudCBhcHBsaWNhdGlvbiBkZWZhdWx0IG9uIHBvd2Vy
cyBidWNrMS9idWNrMi9sZG83L2xkbzYKYXJlIGZvciBEcmFtIHBvd2VyLgpJdCdzIG5vdCB0aGUg
c29jIGNvcmUgcG93ZXIuIEl0IHNlZW1zIG5vdCBhcHByb3ByaWF0ZSAgdG8gaW1wbGVtZW50Cmxp
a2UgYXMgUFNDSS4KTVQ2MzYwIHBsYXkgdGhlIHJvbGUgZm9yIHRoZSBzdWJwbWljIGluIHRoZSBT
T0MgYXBwbGljYXRpb24gcmVmZXJlbmNlIGRlc2lnbi4KPgo+ID4gLS0tCj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL210NjM2MC1yZWd1bGF0b3IueWFtbCAgICAgICB8IDEx
ICsrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRv
ci9tdDYzNjAtcmVndWxhdG9yLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmVndWxhdG9yL210NjM2MC1yZWd1bGF0b3IueWFtbAo+ID4gaW5kZXggYTQ2MmQ5OS4uZWFm
MzZlMiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
ZWd1bGF0b3IvbXQ2MzYwLXJlZ3VsYXRvci55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL210NjM2MC1yZWd1bGF0b3IueWFtbAo+ID4gQEAg
LTI0LDYgKzI0LDE2IEBAIHByb3BlcnRpZXM6Cj4gPiAgICBMRE9fVklOMy1zdXBwbHk6Cj4gPiAg
ICAgIGRlc2NyaXB0aW9uOiBJbnB1dCBzdXBwbHkgcGhhbmRsZShzKSBmb3IgTERPNi83Cj4gPgo+
ID4gKyAgbWVkaWF0ZWsscG93ZXItb2ZmLXNlcXVlbmNlOgo+ID4gKyAgICBkZXNjcmlwdGlvbjog
fAo+ID4gKyAgICAgIFBvd2VyIG9mZiBzZXF1ZW5jZSB0aW1lIHNlbGVjdGlvbiBmb3IgQlVDSzEv
QlVDSzIvTERPNy9MRE82LCByZXNwZXRpdmVseS4KPiA+ICsgICAgICBDYXVzZSB0aGVzZSByZWd1
bGF0b3JzIGFyZSBhbGwgZGVmYXVsdC1vbiBwb3dlci4gRWFjaCB2YWx1ZSBmcm9tIDAgdG8gNjMs
Cj4gPiArICAgICAgYW5kIHN0ZXAgaXMgMS4gRWFjaCBzdGVwIG1lYW5zIDIgbWlsbGlzZWNvbmQg
ZGVsYXkuCj4gPiArICAgICAgVGhlcmVmb3JlLCB0aGUgcG93ZXIgb2ZmIHNlcXVlbmNlIGRlbGF5
IHRpbWUgcmFuZ2UgaXMgZnJvbSAwbXMgdG8gMTI2bXMuCj4gPiArICAgICRyZWY6ICIvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheSIKPiA+ICsgICAgbWluSXRlbXM6
IDQKPiA+ICsgICAgbWF4SXRlbXM6IDQKPgo+IFNvIHRoaXMgaXMgdGhlIGRlbGF5IGJldHdlZW4g
QlVDSzEgYW5kIEJVQ0syLCB0aGVuIEJVQ0syIHRvIExETzcsIGV0Y2M/Ck5vLiB5b3UgbWF5IG1p
c3VuZGVyc3RhbmQuIHRoZXJlJ3MgYW4gZXh0ZXJuYWwgJ0VuYWJsZScgcGluIHRoYXQncwpjb25u
ZWN0ZWQgdG8gdGhlIG1haW4gcG1pYy4KVGhlIHN0YXJ0aW5nIHBvaW50IG9mIGRlbGF5IHRpbWUg
YXJlIGFsbCBmcm9tICB0aGUgZXh0ZXJuYWwgJ0VuYWJsZScgSCB0byBMLgpOb3Qgb25lLWJ5LW9u
ZSBkZWxheSB0aW1lLAo+IElmIHdlIHdhbnRlZCB0byBleHByZXNzIHRoaXMgaW4gRFQsIHdlJ2Qg
bWFkZSB0aGlzIGdlbmVyaWMgd2hpY2ggd291bGQKPiBuZWVkIHRvIGJlIG1vcmUgZmxleGlibGUu
IEEgcG93ZXJvZmYgZGVsYXkgaW4gZWFjaCByZWd1bGF0b3IgKHNpbWlsYXIgdG8KPiB0aGUgZXhp
c3RpbmcgcG93ZXIgb24gZGVsYXkpIHdvdWxkIGJlIHN1ZmZpY2llbnQgZm9yIHdoYXQgeW91IG5l
ZWQgSQo+IHRoaW5rLgpQb3dlciBvbiBzZXF1ZW5jZSBhbHJlYWR5IGRlZmluZWQgYnkgdGhlIHBh
cnQgbnVtYmVyLCBJdCdzIG5vdCBkZWNpZGVkIGJ5IFNXLgpTbyBmb3IgdGhlIGZsZXhpYmlsaXR5
LCBJIGltcGxlbWVudCBpdCBpbiBEVC4KCkR1ZWwgdG8gdGhlcmUncmUgbWFueSBwYXJ0IG51bWJl
ciBNVDYzNjAgUC9VUC9MUCwgZXRjLgpUaGUgZGlmZmVyZW5jZSBhcmUgdGhlIHBvd2VyIG9uIHNl
cXVlbmNlLgoKRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gYWJvdXQgdGhpcyBzaXR1YXRpb24/
CgpQUzogRHVlIHRvIERSQU0gcG93ZXIgdXNhZ2UgLCBzb21ldGltZXMgaXQgYWxzbyBuZWVkIHRv
IGN1c3RvbWl6ZWQgYnkKdGhlIERSQU0gdGhhdCBjdXN0b21lciBjaG9vc2VkLgpJdCBtYXkgZGlm
ZmVyIGZyb20gZXh0ZXJuYWwgRFJBTSBwYXJ0IGNob29zZW4gZm9sbG93aW5nIGJ5IEpFREVDIHNw
ZWMuCj4KPiBSb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
