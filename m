Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4672FC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 07:11:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14CC420786
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 07:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fp5hD7U3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crDap6mO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14CC420786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5nlD1XLawZj2XIGEKw7+rHfbLVIqADkbPvd3W8ShOnY=; b=Fp5hD7U39luVU+dZiiWEL/GmY
	x/eC3QAPZCzX1aCGubTl7mBQ23pCqTwHwkdHBD8raump3dLQdLauH9yQScDIUJ9PXo3+ekSFjZo+Z
	l4R8tNTT6m65uHU6q5/6dYonKmY6QWAw/ATPiaGMaeEONsQ7F6kDL/VABTuOBSEJL4/zigM/bXm6l
	5NDTzirBfW5OrXPFnnySaz98BtSRn/AQNPim3FKeGQ5RnCfj7423P+vWFtpHzt6WQCcCDCJZkpK8I
	9sCPdMVX/eTKF3DsVYsdjMrR0V9Lt08NVcqrcdSPoyLYB1+BsHPbbncSzfnZsczc6CiPZvmrVoZqa
	bp2oW6k4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBC4G-0004ZY-Ij; Thu, 27 Aug 2020 07:11:28 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBC4C-0004YU-6L; Thu, 27 Aug 2020 07:11:24 +0000
Received: by mail-lj1-x243.google.com with SMTP id w14so5246105ljj.4;
 Thu, 27 Aug 2020 00:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nv57Gn1eKFngv8s/vSw/Btf+G9R1mZ77PltJIm2hCKI=;
 b=crDap6mOKZrR9ZAtjqKwuhuwWvD9xNLGT8q+sm69RRILe0fG9BkjV+7z0DZ127asDo
 I+jEutBlwKivDNRYRbrGNS/OqE+tcpehypYt15HUhqc2Kjr7Y1OukJc8fcpJnUpQ2WOh
 Dha8PJ14CUJGcZNonjI7mLJZVzAp9qOi39Cdrq5+DZ1Fv2v4QyP7va94M9rrogworQaC
 0SJXA3ZT22RqBUuEUM+8IZqjPOLxlVfBCVQ8Sb6qktu2lK0dfk15e8RrPKWBpWVW6eL9
 P8gH2vpUjlpKXaGVoT08tvMnBDWyerZBD7A+LvO1/xiF7WA8g8bRemf27ZBqYN+JDM7R
 HhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nv57Gn1eKFngv8s/vSw/Btf+G9R1mZ77PltJIm2hCKI=;
 b=K1+fafJ6svby2Z2hGVDmmTdBG2dV+zHjqi8exea1jHqNA3gmsG3vD8uI5i1tomEw0Q
 9XglrZyFtLILadOgoQu2XnxZ/AT4Bf790h5ZaPs1hcAAqdwokHyc7Q4sX/1i4Q0kTXYw
 lH3VafL8jP3MegJDaYgwKpxxAAgDU/8HrIir5lzDqVg0CIfk2hIeYv6aEferTRLIPTZV
 80Y6QbAv3j/3SwITxfxUnMdg6asY3i/TkG01kUJ2F216Av6v+XWuFnXgaWXfvN4vQtmv
 x7OKa6tDCYzpsOfmnBoFFDqMKy5IklyOEZ/iz34bTPI3aP+4BypuuGxQncXjhbps46G0
 K9VQ==
X-Gm-Message-State: AOAM530zJM+xglJJYVvT5zqndZqY4Koc7i9ro0W+mZaTjYi2jEFluCSv
 hOEUkq0Xv3Z5tCSPGG+nhBYCy/FtwYPMh3m0QKA=
X-Google-Smtp-Source: ABdhPJzvJAEB9d5r9zidPaU9W1O7zcbNFi6NXmIb7tdkFFR+S/4m355fVHEQ2ZvkrN/Z08JyvffpgZG4T1Axqa0ooPg=
X-Received: by 2002:a2e:9b08:: with SMTP id u8mr8377257lji.208.1598512282738; 
 Thu, 27 Aug 2020 00:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <1598503859-29620-1-git-send-email-u0084500@gmail.com>
 <20200827070010.GD813478@kuha.fi.intel.com>
In-Reply-To: <20200827070010.GD813478@kuha.fi.intel.com>
From: =?UTF-8?B?5ZWf5Y6f6buD?= <u0084500@gmail.com>
Date: Thu, 27 Aug 2020 15:11:11 +0800
Message-ID: <CADiBU3-GFkjA8p_tOkF-YcJf69K=Z48oDpme-rWWH3kEj=eaDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] usb typec: mt6360: Add support for mt6360 Type-C
 driver
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_031124_283430_0D94B04F 
X-CRM114-Status: GOOD (  15.58  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGVpa2tpIEtyb2dlcnVzIDxoZWlra2kua3JvZ2VydXNAbGludXguaW50ZWwuY29tPiDmlrwgMjAy
MOW5tDjmnIgyN+aXpSDpgLHlm5sg5LiL5Y2IMzowMOWvq+mBk++8mgo+Cj4gT24gVGh1LCBBdWcg
MjcsIDIwMjAgYXQgMTI6NTA6NThQTSArMDgwMCwgY3lfaHVhbmcgd3JvdGU6Cj4gPiBGcm9tOiBD
aGlZdWFuIEh1YW5nIDxjeV9odWFuZ0ByaWNodGVrLmNvbT4KPiA+Cj4gPiBNZWRpYXRlayBNVDYz
NjAgaXMgYSBtdWx0aS1mdW5jdGlvbmFsIElDIHRoYXQgaW5jbHVkZXMgVVNCIFR5cGUtQy4KPiA+
IEl0IHdvcmtzIHdpdGggVHlwZS1DIFBvcnQgQ29udHJvbGxlciBNYW5hZ2VyIHRvIHByb3ZpZGUg
VVNCIFBECj4gPiBhbmQgVVNCIFR5cGUtQyBmdW5jdGlvbmFsaXRpZXMuCj4gPgo+ID4gQWRkIGZp
eCB0byBQcmV2ZW50IHRoZSByYWNlIGNvbmRpdGlvbiBmcm9tIGludGVycnVwdCBhbmQgdGNwY2kg
cG9ydCB1bnJlZ2lzdGVyCj4gPiBkdXJpbmcgbW9kdWxlIHJlbW92ZS4KPgo+IFlvdSBtZXJnZWQg
dHdvIHBhdGNoZXMgZnJvbSB2MiB0b2dldGhlciwgc28gdGhhdCByZWFsbHkgbWFrZXMgdGhpcwo+
IHYzLiBXaGVyZSBpcyB0aGUgY2hhbmdlbG9nPwoKY2hhbmdlbG9nCkFkZCBmaXggdG8gUHJldmVu
dCB0aGUgcmFjZSBjb25kaXRpb24gZnJvbSBpbnRlcnJ1cHQgYW5kIHRjcGNpIHBvcnQgdW5yZWdp
c3RlcgpkdXJpbmcgbW9kdWxlIHJlbW92ZS4KCkRvIEkgbmVlZCB0byByZXNlbnQgdGhlIHJlYWwg
VjMgYW5kIG1hcmsgdGhlIGZpcnN0IHBhdGNoIGZvciB0aGUKY29tbWl0IGxvZyBsaWtlIGFzIGJl
bG93IHRleHQ/CgpNZWRpYXRlayBNVDYzNjAgaXMgYSBtdWx0aS1mdW5jdGlvbmFsIElDIHRoYXQg
aW5jbHVkZXMgVVNCIFR5cGUtQy4KSXQgd29ya3Mgd2l0aCBUeXBlLUMgUG9ydCBDb250cm9sbGVy
IE1hbmFnZXIgdG8gcHJvdmlkZSBVU0IgUEQKYW5kIFVTQiBUeXBlLUMgZnVuY3Rpb25hbGl0aWVz
LgoKVjEgLT4gVjIKMS4gQWRkIGZpeCB0byBQcmV2ZW50IHRoZSByYWNlIGNvbmRpdGlvbiBmcm9t
IGludGVycnVwdCBhbmQgdGNwY2kgcG9ydAp1bnJlZ2lzdGVyCmR1cmluZyBtb2R1bGUgcmVtb3Zl
LgoKVjIgLT4gVjMKMS4gTWVyZ2UgVjIgY2hhbmdlIGludG8gdGhlIGZpcnN0IHBhdGNoLgoKCklm
IHllcywgSSBjYW4gdXNlIHRoaXMgd2F5IHRvIHJlc2VuZCBwYXRjaCB2MyBmb3IgdGhlIHJlYWRh
YmlsaXR5Lgo+Cj4gdGhhbmtzLAo+Cj4gLS0KPiBoZWlra2kKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
