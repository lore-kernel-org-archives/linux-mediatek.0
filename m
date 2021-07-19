Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96159C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49AE6610A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49AE6610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lf4h+vWgSNK61sdhhvqD5MUgWpSR6I7TtEvCR5LHzGk=; b=dzJ9ZBIpevUef6
	G6Px5ysPzEWPly21Rcgak/N8NhllhqafGOhacY63lKFszBzPZA6JLOXKCgiGaGq17ga/J1TwJGZmT
	I+uymdw66ABVhYdjuXdZ/DBhJcfCLv6V3RFGnzBn9KXappVKHgQJcj5oLod7tTPhl+G5FLW7pCAC+
	wi0eM1qgQjS/0uFMEdXROufcWUHct0NSndrd0wij3aK+95GgnS/SCKXIooGEdU92+gBTfd4T11Xp9
	JOdVnkFmuijrMm27BhN9FDPcY4o6Cs0Kq8VSCuJVFGKZIaOH9BAkPpS6QiSQ8q6pwTtLCiDz8Ur6h
	64w5yWG+44JQXjPJsZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5K6W-008LTA-6L; Mon, 19 Jul 2021 03:38:04 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5K6J-008LPr-7a; Mon, 19 Jul 2021 03:37:52 +0000
Received: by mail-oi1-x232.google.com with SMTP id s23so3502227oiw.12;
 Sun, 18 Jul 2021 20:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AvTNwoF5AZVAHORrZMZQKhvKuBZ19iRiLg9Xw654rGw=;
 b=su3WkGSFSRwJ5ZZEu33QPn45mX8Aseu/Gg1gU5hLkIoR3FRTmyOQuQqgP5o1zsr+S9
 jE1RjEmJT2luR2/NrKdhWsFglh/7CiUPc/qMerZ4wXqNw8U4Xtur9fWD2lD+Uag40GRn
 TkY+MF5YdF6fhjefr328iUf7vNx14vAyAiH3XrC84+mPssRS2x0PNjdhvi1DPLrj8DTq
 M0nB0yf/6DDxa6MSFtb2x5HfrbOZERuRkaC9Pkt6yfrXi5HciBZa/PCYFrn7vBJqlQ2t
 8xNKug/95hSz6lGyTNIo/nDVM+q4XqU3OLDtjqbLDb4iEQhdaZhMl/EoUQFHaHIBAjMs
 cUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AvTNwoF5AZVAHORrZMZQKhvKuBZ19iRiLg9Xw654rGw=;
 b=iSHBWkI5Va86EYQa5adLXm3U5T+4fonk3ZSaFS3rEdKR+Fkt4rd25TcnGSwGMgcNK5
 CMWKWtRuYL663SU+lhFROHsBf+t0dPCg7udXrYrnmjdfH1LzPC/Rh1FTwplNL9bCCWp2
 UZIHv2R9II0BOUdB8Ras5S2UZDFzglxVPFTZH3KC6gkbYHROvih3FqCACwUQUHxd6aec
 v1n0SbG/I8qCeavt2zyA3RD04BpFo8ManitE1f/wKxqkg5R2HBOlJ/MUw+5ttCK8E2ux
 THKcoFRcbeXMnTqg77mXTvOiFp8pI3aRuI2Wh8JJyOkOtOCzXUgJyr1dlTgsJ8zT8WWa
 NjXA==
X-Gm-Message-State: AOAM532/VsBZP16CQ+mQwrT4TRJ8uqxl38sTW1jxkyxcZKWXGyYFulgH
 nWfof5rkq65fjwkCY7epXYrgNT/YzRjAv4Aypul3oHM+
X-Google-Smtp-Source: ABdhPJz7C3w8ThcmqrcxQqG7kpkXeowK12zcUDhuE9v+IVNUF/SCIzmagsLzCRRRCeXcSPBtnhCLiZ1kSpdZbTiSu2k=
X-Received: by 2002:aca:3786:: with SMTP id e128mr5904176oia.55.1626665870299; 
 Sun, 18 Jul 2021 20:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
 <a01521d3-bd79-a813-554a-39a750775938@infradead.org>
In-Reply-To: <a01521d3-bd79-a813-554a-39a750775938@infradead.org>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 19 Jul 2021 11:37:39 +0800
Message-ID: <CAE+NS37K99ebPbFSk_3XgCbRwr6K8u+VcLMcxG5ag6dH861WAg@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] power: supply: mt6360_charger: add MT6360 charger
 support
To: Randy Dunlap <rdunlap@infradead.org>
Cc: sre@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 "Vaittinen, Matti" <matti.vaittinen@fi.rohmeurope.com>,
 Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>,
 benjamin.chao@mediatek.com, Linux PM list <linux-pm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_203751_320222_8A5AA249 
X-CRM114-Status: GOOD (  15.35  )
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

UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IOaWvCAyMDIx5bm0N+aciDE35pel
IOmAseWFrSDkuIrljYgxMjoyOeWvq+mBk++8mgo+Cj4gT24gNy8xNi8yMSAyOjQzIEFNLCBHZW5l
IENoZW4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIE1UNjM2MCBDaGFyZ2Vy
IHN1cHBvcnQgY29udGFpbnMgZHJpdmVyIGFuZCBiaW5kaW5nCj4gPiBkb2N1bWVudAo+ID4KPiA+
IEdlbmUgQ2hlbiAoMykKPiA+ICBsaWI6IGFkZCBsaW5lYXIgcmFuZ2UgZ2V0IHNlbGVjdG9yIHdp
dGhpbgo+ID4gIGR0LWJpbmRpbmdzOiBwb3dlcjogQWRkIGJpbmRpbmdzIGRvY3VtZW50IGZvciBD
aGFyZ2VyIHN1cHBvcnQgb24gTVQ2MzYwIFBNSUMKPiA+ICBwb3dlcjogc3VwcGx5OiBtdDYzNjBf
Y2hhcmdlcjogYWRkIE1UNjM2MCBjaGFyZ2VyIHN1cHBvcnQKPiA+Cj4gPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3N1cHBseS9tdDYzNjBfY2hhcmdlci55YW1sIHwg
ICA0OAo+ID4gIGRyaXZlcnMvcG93ZXIvc3VwcGx5L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMTEKPiA+ICBkcml2ZXJzL3Bvd2VyL3N1cHBseS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxCj4gPiAgZHJp
dmVycy9wb3dlci9zdXBwbHkvbXQ2MzYwX2NoYXJnZXIuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDg2NyArKysrKysrKysrCj4gPiAgaW5jbHVkZS9saW51eC9saW5lYXJfcmFuZ2Uu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMgo+ID4gIGxpYi9s
aW5lYXJfcmFuZ2VzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMzEKPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDk2MCBpbnNlcnRpb25zKCspCj4gPgo+
Cj4KPiBIaSBHZW5lLAo+Cj4gQWxsIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgYXJlIGFkZHJlc3Nl
ZCB0byAiaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmciIChtaXNzaW5nIGxlYWRpbmcgJ2wnKSwKPiBz
byBJIGV4cGVjdCB0aGF0IHlvdSBzaG91bGQgcmVzZW5kIHRoZSBzZXJpZXMuCj4KPiAtLQo+IH5S
YW5keQo+CgpBQ0ssIEkgd2lsbCBmaXggaXQgYW5kIHJlc2VuZCB0aGUgcGF0Y2hlcy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
