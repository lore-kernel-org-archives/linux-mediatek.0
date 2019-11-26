Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4F8C432C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 09:16:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC1C20678
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 09:16:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m3+Btbmd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EdpzRc8J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC1C20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wb4BB6Byj7EDvdEzbJS6zPuX2uJ94lWcECr0/0ucCSg=; b=m3+BtbmdGs0VDd
	IcJuq5RJcpQISQTKXfKwA7aeT79ZxN+Y9lfaiCezB2URveTBdDvM7WuQ6Teko7aGNwF7EnYhba7kp
	lQjStycxCeZNYsOyCHkpuRaWhu1Y2NqQPlPxLD8LV7rCI593PDqeNSB6P3SvfHOBGxwajrywxij1F
	qUDeil3kGQDkCH4D2e3SbIJZRl1phCZ59RL6XCWl9DoUbGlgwGx3vdbkEumGCOf5+wfj2aC4/vaVn
	LR+szOOOfgs1UbjvMUq62qBW9xPvdkleft0uGswcFDPOcd1wJ3qyQe1BAp2p5CVf0/yq9lazf77io
	UDsDXR8TkPkox+SvhV7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZWxM-0004z6-42; Tue, 26 Nov 2019 09:16:24 +0000
Received: from us-smtp-1.mimecast.com ([207.211.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZWxI-0004yR-TW
 for linux-mediatek@lists.infradead.org; Tue, 26 Nov 2019 09:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574759777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vb+oxQxZRkNlkuBEQUYVCl/O5AvuVY4nZz95WVzmQq8=;
 b=EdpzRc8JhTiLchPwYZZW4ww4kbVEkgW9pr17buLOHPZQg9bexXfyw5LKraQ8SCG00g55Cn
 cCNU0TYQVW+q5hb2QOAwkWmLj5reGG/zAa+CS17olWpXpca5yGt7Kp27+AeYiY618tjxms
 1vnheu8hrmCQ+HES95LBzqpjO0VKbn0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-I-j--IWBNSawGohks0IMlQ-1; Tue, 26 Nov 2019 04:16:14 -0500
Received: by mail-lj1-f199.google.com with SMTP id n11so3546443lji.9
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2019 01:16:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=+GixzF/KaQHv0D6//vs+c5ZE/FXLP7KWC/hh8q0IT38=;
 b=D0vWH8vHtCpnG7LXOWG4QzSPcvaW1bl+cFPuynzzGyo4QUPjl/Bgv+wTIIrW2yVRoA
 dDYuSqBPgJ9l9lhytyWV07fAJMqssqgGfmsDPGJNSxTX1OeMeiyTZsU8FkQbiMdIVW+Q
 FFKEJbV/q4pxAVLswJDqHBwnqSK8LeHOwst0IU2FgUzHjZqrWSl3tGO49whgWVVovkEw
 AmA3uPlSc6QA6e9i848YNQwz/HkroOJSVERIFPu3U1DrlVs3WciSpa/j/JNg92y5gf5S
 nVHr9EOvDramdLAmPLH4XfJYS6CF1UZSvYRvgLiYoqpTKGblL3d/nnjnVA3WCXZ+a8d/
 Q5LQ==
X-Gm-Message-State: APjAAAXmnB5XllQRb3h+VFp9+Ly/51hZxputndhARdu+udMwplyhDmEn
 T82WnWZL+ZPZSFTccwoUW+D3Bj6wxnrPPKutFtAi258+djfWJOaoXh88LMOYB+cABY27y/JleCq
 r/t3I9FOn3jk8479cAzYTR5rhtG8A6Xhq
X-Received: by 2002:a19:f811:: with SMTP id a17mr23461975lff.132.1574759772744; 
 Tue, 26 Nov 2019 01:16:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqxi4cxslTGXaPEgklZisShtCL52V7ndFFVsbgvulKaJ2kiSJRyrQs7o0m+akem1uQZYddlS3g==
X-Received: by 2002:a19:f811:: with SMTP id a17mr23461957lff.132.1574759772531; 
 Tue, 26 Nov 2019 01:16:12 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id s27sm4937135lfc.31.2019.11.26.01.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 01:16:11 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id DC18D1818BF; Tue, 26 Nov 2019 10:16:10 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] mt76: Off by one in mt76_calc_rx_airtime()
In-Reply-To: <20191126091150.GA1759@kadam>
References: <20191121213935.2cbgh3qmd4hv4v5a@kili.mountain>
 <87v9r7ysg0.fsf@toke.dk> <20191126091150.GA1759@kadam>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 26 Nov 2019 10:16:10 +0100
Message-ID: <87h82ryp45.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: I-j--IWBNSawGohks0IMlQ-1
X-Mimecast-Spam-Score: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_011621_035475_8539808C 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-wireless@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3cml0ZXM6Cgo+IE9uIFR1
ZSwgTm92IDI2LCAyMDE5IGF0IDA5OjA0OjE1QU0gKzAxMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdl
bnNlbiB3cm90ZToKPj4gRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPiB3
cml0ZXM6Cj4+IAo+PiA+IFRoZSBzYmFuZC0+Yml0cmF0ZXNbXSBhcnJheSBoYXMgInNiYW5kLT5u
X2JpdHJhdGVzIiBlbGVtZW50cyBzbyB0aGlzCj4+ID4gY2hlY2sgbmVlZHMgdG8gYmUgPj0gaW5z
dGVhZCBvZiA+IG9yIHdlIGNvdWxkIHJlYWQgYmV5b25kIHRoZSBlbmQgb2YgdGhlCj4+ID4gYXJy
YXkuCj4+ID4KPj4gPiBUaGVzZSB2YWx1ZXMgY29tZSBmcm9tIHdoZW4gd2UgY2FsbCBtdDc2X3Jl
Z2lzdGVyX2RldmljZSgpOgo+PiA+Cj4+ID4gCXJldCA9IG10NzZfcmVnaXN0ZXJfZGV2aWNlKCZk
ZXYtPm10NzYsIHRydWUsIG10NzYwM19yYXRlcywKPj4gPiAJCQkJICAgQVJSQVlfU0laRShtdDc2
MDNfcmF0ZXMpKTsKPj4gPgo+PiA+IEhlcmUgc2JhbmQtPmJpdHJhdGVzW10gaXMgbXQ3NjAzX3Jh
dGVzW10gYW5kIC0+bl9iaXRyYXRlcyBpcyB0aGUKPj4gPiBBUlJBWV9TSVpFKCkKPj4gPgo+PiA+
IEZpeGVzOiA1Y2UwOWMxYTc5MDcgKCJtdDc2OiB0cmFjayByeCBhaXJ0aW1lIGZvciBhaXJ0aW1l
IGZhaXJuZXNzIGFuZCBzdXJ2ZXkiKQo+PiA+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KPj4gPiAtLS0KPj4gPiAgZHJpdmVycy9uZXQvd2ly
ZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9haXJ0aW1lLmMgfCAyICstCj4+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvYWlydGltZS5jIGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9haXJ0aW1lLmMKPj4gPiBpbmRleCA1NTExNmYzOTVmOWEu
LmE0YTc4NTQ2Nzc0OCAxMDA2NDQKPj4gPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9tZWRp
YXRlay9tdDc2L2FpcnRpbWUuYwo+PiA+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlh
dGVrL210NzYvYWlydGltZS5jCj4+ID4gQEAgLTI0Miw3ICsyNDIsNyBAQCB1MzIgbXQ3Nl9jYWxj
X3J4X2FpcnRpbWUoc3RydWN0IG10NzZfZGV2ICpkZXYsIHN0cnVjdCBtdDc2X3J4X3N0YXR1cyAq
c3RhdHVzLAo+PiA+ICAJCQlyZXR1cm4gMDsKPj4gPiAgCj4+ID4gIAkJc2JhbmQgPSBkZXYtPmh3
LT53aXBoeS0+YmFuZHNbc3RhdHVzLT5iYW5kXTsKPj4gPiAtCQlpZiAoIXNiYW5kIHx8IHN0YXR1
cy0+cmF0ZV9pZHggPiBzYmFuZC0+bl9iaXRyYXRlcykKPj4gPiArCQlpZiAoIXNiYW5kIHx8IHN0
YXR1cy0+cmF0ZV9pZHggPj0gc2JhbmQtPm5fYml0cmF0ZXMpCj4+ID4gIAkJCXJldHVybiAwOwo+
PiA+ICAKPj4gPiAgCQlyYXRlID0gJnNiYW5kLT5iaXRyYXRlc1tzdGF0dXMtPnJhdGVfaWR4XTsK
Pj4gCj4+IFRoaXMgY29kZSBoYXMgcmVjZW50bHkgYmVlbiBwb3J0ZWQgdG8gbWFjODAyMTEgKG5l
dC9tYWM4MDIxMS9haXJ0aW1lLmMpLgo+PiBJdCBzZWVtcyB0aGF0IHRoZSBidWcgaXMgYWxzbyBw
cmVzZW50IHRoZXJlOyBjYXJlIHRvIHNlbmQgYSBwYXRjaCBmb3IKPj4gdGhhdCBhcyB3ZWxsPyA6
KQo+Cj4gT2guICBUaGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0LiAgSSBhY3R1YWxseSBzYXcg
dGhlIHN0YXRpYyBjaGVja2VyCj4gd2FybmluZyBmb3IgdGhhdCBhbmQgaWdub3JlZCBpdCB0aGlu
a2luZyB0aGF0IGl0IHdhcyB0aGUgc2FtZSBjb2RlLgo+IDpQCgpXZWxsLCBpdCdzIGNvcHktcGFz
dGVkIGZyb20gdGhlIHNhbWUgY29kZSA7KQoKVGhlIHBsYW4gaXMgdG8gZ2V0IHJpZCBvZiB0aGUg
dmVyc2lvbiBpbnNpZGUgbXQ3Njsgd2FzIHdhaXRpbmcgZm9yIHRoZQp0cmVlcyB0byBjb252ZXJn
ZSwgdGhvdWdoLCBzbyBJIGd1ZXNzIGFmdGVyIHRoZSBtZXJnZSB3aW5kb3c/Cgo+IEkgd2lsbCBz
ZW5kIGEgZml4IGZvciBpdC4KCkdyZWF0LCB0aGFua3MhCgotVG9rZQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
