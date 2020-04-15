Return-Path: <SRS0=9LKV=57=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726CBC2BA2B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 07:20:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4649B206F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Apr 2020 07:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rb7y9o3j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icZ8PQrX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4649B206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dN8tUEbrXBA/TBw8Ht6B4ss7k/6DiAEFMnM4xwZk2lw=; b=Rb7y9o3jQ1fOxj
	PuKgA2glp2rKw0KOcKaJbCuoDQOgsCnSdpmxfb43vXul0xeSsdzAQNpjGYfXyebnKDK+dkFwdWob9
	b29Guv99hbAs3jaVQVRDhjSRqIStTCmBs8ypgV4NGln8ZojUg/bskaz/5cDcBzjOMOhktXzDWLPdJ
	aMV8W7oZT/5wZmma/oxF3tWOMDVBMBuTIctcloIQYe+WrFx1hDUWFtGc8DqFy6p4VS95pI73UB9jR
	i1XQrgRG6laYSK0ePBb5Iitbke4S8+zQ81ZkI5hnLD9HlJIvpTllpKgQAvx5eLT1IikEoxMxH7V09
	rrpwSNMjbGsB9IXkL1Ig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOcLH-00027w-7d; Wed, 15 Apr 2020 07:20:15 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOcLC-0001oL-TP
 for linux-mediatek@lists.infradead.org; Wed, 15 Apr 2020 07:20:13 +0000
Received: by mail-wm1-x342.google.com with SMTP id a81so17588576wmf.5
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Apr 2020 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JNTtrAlb/mmW6eYfSwP0Ro8M7IaMvjXCniYxJ2CnwM8=;
 b=icZ8PQrXhCZI6D32MNsceXbhSUdE3ss+k0PgEpqDHKKpUuNLoudWdHM44NERTbVm8o
 LgPj3+qoxx5rF5qJjQv0Y1ykLL37R/dqLSLiZ3J9hvBMgGZ8SBYTXgL4W61sPsaPkkmg
 tj8QWK8y/A2zfxups2uwgfp/r8d19M2NCwdg4cf5sElp5s0no2yDwcTjLX6DRaaNwZK6
 sU/M+nt9Hk9F9avYx4KpUOdeSVd6vX9NBHEAEQ1Uh9M3Esv8cpfZnoAyxp2ig3UX2B4y
 DMziWRGoduMn20Oc0ArYn16VU+Y8rXMG+QmlShsO9H/q0VXyNs0/rf79/7Pg/bvbRN2/
 3Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JNTtrAlb/mmW6eYfSwP0Ro8M7IaMvjXCniYxJ2CnwM8=;
 b=cahvtSYcx5gkJ6hw/0H6VhMtawm7FWZ5qzXiQqAL78zyIMFP7Rtfj3f0a7wcnFmein
 jL3QXb4ek2w1MVWwO4OTXALATZvRzR5EVR8Uu799swMNBG4drB6INPnUS8/J46pNcy1q
 LE84aRh+N/OAQlsPh725kVvIRDQgLdkA76A4sIRVK0Z/MUwuuRs3mT30wXnzJ+efzUi4
 7GQ2vm8ndKdug+8b318c3Aoo3BVU5MACsUx46OpyEqa7oxDE4nKE0xU32QkwISs6k2Js
 e+8v9umIywpWJBdaTuDDKx/Ip2EjRwdQ/9Hx+z5OGFckwl7KYLjeEfYQlQRBpQERhRs2
 oxTg==
X-Gm-Message-State: AGi0Pua0vZ9QaG09TdeQZluzstOhtFDt6SSoheAjtLMp7oGfHikEdNuT
 zVx44jB2dV86nhnYhlIqkY2HhA==
X-Google-Smtp-Source: APiQypIt8y3v1RcXGhlIV5rcKng20PQp5/POLLPotSkVPDavNgF+b9tnwft19fx0HP2uPFDJdrAkQQ==
X-Received: by 2002:a1c:1d92:: with SMTP id d140mr3649301wmd.67.1586935208412; 
 Wed, 15 Apr 2020 00:20:08 -0700 (PDT)
Received: from dell ([95.149.164.124])
 by smtp.gmail.com with ESMTPSA id a9sm16577131wmm.38.2020.04.15.00.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:20:07 -0700 (PDT)
Date: Wed, 15 Apr 2020 08:21:08 +0100
From: Lee Jones <lee.jones@linaro.org>
To: =?utf-8?B?Z2VuZV9jaGVuKOmZs+S/iuWuhyk=?= <gene_chen@richtek.com>
Subject: Re: [PATCH resend v8] mfd: mt6360: add pmic mt6360 driver
Message-ID: <20200415072108.GE2167633@dell>
References: <1586273804-7722-1-git-send-email-gene.chen.richtek@gmail.com>
 <0f60497f62d24a37a0530941d6eec258@ex1.rt.l>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f60497f62d24a37a0530941d6eec258@ex1.rt.l>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_002011_469217_AB60F549 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?Y3lfaHVhbmco6buD5ZWf5Y6fKQ==?= <cy_huang@richtek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Gene Chen <gene.chen.richtek@gmail.com>,
 "Wilma.Wu@mediatek.com" <Wilma.Wu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 =?utf-8?B?c2h1ZmFuX2xlZSjmnY7mm7jluIYp?= <shufan_lee@richtek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxNSBBcHIgMjAyMCwgZ2VuZV9jaGVuKOmZs+S/iuWuhykgd3JvdGU6Cgo+IEhpIExl
ZS9NYXR0aGlhcywKPiAKPiBJIHRyeSB0byBmaXggc3ViamVjdCBhbmQgdXBkYXRlIGFnYWluLCBw
bGVhc2UgaGVscCB0byByZXZpZXcgaXQsIHRoYW5rcwoKRmV3IHRoaW5ncyB3cm9uZyB3aXRoIHRo
aXMuCgogLSBQbGVhc2UgZG9uJ3QgdG9wIHBvc3QKIC0gUGxlYXNlIHNuaXAgdGhlIHBhcnRzIG9m
IHRoZSBtZXNzYWdlIHlvdSdyZSBub3QgZGlyZWN0bHkgcmVwbHlpbmcgdG8gCiAtIFBsZWFzZSBk
byBub3Qgc2VuZCBjb250ZW50bGVzcyBwaW5ncwoKV2l0aCByZWdhcmRzIHRvIHRoZSBsYXR0ZXIg
cG9pbnQ7IHlvdSBzZW50IHRoaXMgcGF0Y2ggZHVyaW5nIHRoZQptZXJnZS13aW5kb3cgKHBsZWFz
ZSBwYXkgYXR0ZW50aW9uIHRvIHRoZSByZWxlYXNlIGN5Y2xlKS4gIE5vdCBhIGdyZWF0CmRlYWwg
b2YgcmV2aWV3aW5nIGhhcHBlbnMgZHVyaW5nIHRoaXMgcGVyaW9kLiAgSWYgfjIgd2Vla3MgaGF2
ZSBwYXNzZWQKKHRoZXkgaGF2ZW4ndCksIHlvdSBtYXkgYXNzdW1lIHRoYXQgeW91ciBwYXRjaCBo
YXMgYmVlbiBtaXNzZWQgYW5kCnN1Ym1pdCBhIFtSRVNFTkRdLCBidXQgd2hhdGV2ZXIgaGFwcGVu
cywgZG8gbm90IHBpbmcuCgpGWUksIHlvdXIgcGF0Y2ggaXMgb24gdGhlIGxpc3QgLSB5b3UgZG8g
bm90IG5lZWQgdG8gc2VuZCBhIFtSRVNFTkRdLgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQo+IEZyb206IEdlbmUgQ2hlbiBbbWFpbHRvOmdlbmUuY2hlbi5yaWNodGVrQGdtYWlsLmNvbV0K
PiBTZW50OiBUdWVzZGF5LCBBcHJpbCAwNywgMjAyMCAxMTozNyBQTQo+IFRvOiBsZWUuam9uZXNA
bGluYXJvLm9yZzsgbWF0dGhpYXMuYmdnQGdtYWlsLmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGdlbmVfY2hlbijpmbPkv4rlrocpIDxnZW5l
X2NoZW5AcmljaHRlay5jb20+OyBXaWxtYS5XdUBtZWRpYXRlay5jb207IHNodWZhbl9sZWUo5p2O
5pu45biGKSA8c2h1ZmFuX2xlZUByaWNodGVrLmNvbT47IGN5X2h1YW5nKOm7g+WVn+WOnykgPGN5
X2h1YW5nQHJpY2h0ZWsuY29tPgo+IFN1YmplY3Q6IFtQQVRDSCByZXNlbmQgdjhdIG1mZDogbXQ2
MzYwOiBhZGQgcG1pYyBtdDYzNjAgZHJpdmVyCj4gCj4gQWRkIG1mZCBkcml2ZXIgZm9yIG10NjM2
MCBwbWljIGNoaXAgaW5jbHVkZSBCYXR0ZXJ5IENoYXJnZXIvVVNCX1BEL0ZsYXNoIExFRC9SR0Ig
TEVEL0xETy9CdWNrCj4gCj4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5Acmlj
aHRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgIHwgIDEyICsrCj4g
IGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9tZmQvbXQ2MzYw
LWNvcmUuYyAgfCA0MjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gIGluY2x1ZGUvbGludXgvbWZkL210NjM2MC5oIHwgMjQwICsrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA2NzggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGluY2x1ZGUvbGludXgvbWZkL210NjM2MC5oCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxp
bmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwg
QmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
