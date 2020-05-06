Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3724CC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 06:46:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE2A20714
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 06:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V3bGSq8G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="DT6WmVJO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE2A20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/82SPjOZ5igmkBF8zDSSc/w4BxavzcC1NnNLPaV7+w=; b=V3bGSq8G4CFJEd
	ydolBwGNu0ezS50T15kV5F8WpTZiyUbLZe3qGnFI8pIxkV13N/TbQjRBO3EYNWVkDbl4dQGGgfEdH
	QcTg59DLcQXwohbbTyC2yeKxLfYYywTQJ1aCkuQOAbBDXrkPVjpmSxI8Cqvmy3j2m0QD44/9BxnjW
	AuZZWpId1ajCvfIv/tgOKXdlgzLc+/DnkMlaTYRkr66jrq+giz9xXBEHigeQm/GHJ5rf5DbmgZ0hi
	tqZBEDB6nKZzGkvUsfpT2RFSkhU2AAKBgEJDxGJ3nBaOmAq9IMM7g+TLCInTQJB95f05A3m2EZvAX
	NtOFgayZK88iQbavTnRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWDp8-0008Iu-ST; Wed, 06 May 2020 06:46:30 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWDp0-0008Aa-8b
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 06:46:23 +0000
Received: by mail-il1-x141.google.com with SMTP id e8so716527ilm.7
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 23:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+/CvsVsRvsIe2fdwin42oKRwBiHMUNkSBi3zIOYY4k4=;
 b=DT6WmVJOSFGWbwoJzWlGLC1MHvldjbW1aPbGsebQDxlwZe7iwnSNTolfUa76eOd29p
 bY4+DyIu0HM7Ux+b79wpjv1HEfzbH79157RfuHSyksqzSHLknytmZWYPfXFm5QGWRjr4
 trPVXMgze6AHFPvmnwrxjqlJKc728qaSJfARZbGbfhF4give+X0eaTP+oNhRMf+5ac8P
 Arpc631AY/NRljNjuR5I9hcJdirqymusRyVIeUrXArJFWuT3SoexMOmMizUv/8UFF/8J
 GTpCWHc3c1BWYWTjKwX/5uBZaJK6C+gV4m4MOKsh1M5DtywTmEZjpryYodVi30SRoDCo
 EcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+/CvsVsRvsIe2fdwin42oKRwBiHMUNkSBi3zIOYY4k4=;
 b=PlrhdBQAYEdsoXHMphJwqXTAU7tVVoUzYEHhn4aAJw1/+UzN19L4VFZEaKPVd9j4M9
 +u7u67grjxH5KVdGe0UDA9YdxMbcGth+V5OVTPTyx0NvMcB7Ksb74Xqu5N5TmAAHGlGW
 2JRrDbF4nUNduPLOuzkhs0mHVkIaO7EHRDhrVJdOFrQ3VQvBubq8JrHVuqyNI4oigm/Q
 t7VQoHPbbPYK4TYnugPzsupkLGv4HvzkJ8qOH7hd5b3wX8Z9q64ose6E7CTysgn1zo4P
 zEDfd+bF7xEZonDTvZ4kLNHIu8ppQr6n9UiuwdZvZOrDLoGHqK/9JzIoedcmRORZFMFm
 2y6w==
X-Gm-Message-State: AGi0PubzhJQYIO5ilgrwdTCCfCGxEVmumQPwKy63AbaKQjlyfvVje7ae
 lXiVl0MVIrjIXRSAWtaz2SpSivi6fZ3Sp4Go0AIt8w==
X-Google-Smtp-Source: APiQypKJEgnZebPwGNweIcvVeYvS0XTuBvG2j4m7bwSAxW9ci9eJ/kiRyX1pjwNIRh6SnysmSCqDdQb9gXdF8OxrFFg=
X-Received: by 2002:a92:aa07:: with SMTP id j7mr7777424ili.40.1588747581285;
 Tue, 05 May 2020 23:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <CAKOOJTzcNr7mc9xusQm3nCzkq5P=ha-si3fizeEL2_KJUOC3-Q@mail.gmail.com>
In-Reply-To: <CAKOOJTzcNr7mc9xusQm3nCzkq5P=ha-si3fizeEL2_KJUOC3-Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 May 2020 08:46:10 +0200
Message-ID: <CAMRc=Md7gLMThfGF-7YLqW17MpMhU=UFbdTvfjbr9fFHTLir8g@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To: Edwin Peer <edwin.peer@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_234622_301047_B76C3198 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

d3QuLCA1IG1haiAyMDIwIG8gMjE6MjUgRWR3aW4gUGVlciA8ZWR3aW4ucGVlckBicm9hZGNvbS5j
b20+IG5hcGlzYcWCKGEpOgo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIGRldm1fbmV0ZGV2X3JlbGVh
c2Uoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICp0aGlzKQo+ID4gK3sKPiA+ICsgICAgICAgc3Ry
dWN0IG5ldGRldmljZV9kZXZyZXMgKnJlcyA9IHRoaXM7Cj4gPiArCj4gPiArICAgICAgIHVucmVn
aXN0ZXJfbmV0ZGV2KHJlcy0+bmRldik7Cj4gPiArfQo+ID4gKwo+ID4gKy8qKgo+ID4gKyAqICAg
ICBkZXZtX3JlZ2lzdGVyX25ldGRldiAtIHJlc291cmNlIG1hbmFnZWQgdmFyaWFudCBvZiByZWdp
c3Rlcl9uZXRkZXYoKQo+ID4gKyAqICAgICBAbmRldjogZGV2aWNlIHRvIHJlZ2lzdGVyCj4gPiAr
ICoKPiA+ICsgKiAgICAgVGhpcyBpcyBhIGRldnJlcyB2YXJpYW50IG9mIHJlZ2lzdGVyX25ldGRl
digpIGZvciB3aGljaCB0aGUgdW5yZWdpc3Rlcgo+ID4gKyAqICAgICBmdW5jdGlvbiB3aWxsIGJl
IGNhbGwgYXV0b21hdGljYWxseSB3aGVuIHRoZSBwYXJlbnQgZGV2aWNlIG9mIG5kZXYKPiA+ICsg
KiAgICAgaXMgZGV0YWNoZWQuCj4gPiArICovCj4gPiAraW50IGRldm1fcmVnaXN0ZXJfbmV0ZGV2
KHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2KQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IG5ldGRl
dmljZV9kZXZyZXMgKmRyOwo+ID4gKyAgICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgICAv
KiBzdHJ1Y3QgbmV0X2RldmljZSBpdHNlbGYgbXVzdCBiZSBkZXZyZXMgbWFuYWdlZC4gKi8KPiA+
ICsgICAgICAgQlVHX09OKCEobmRldi0+cHJpdl9mbGFncyAmIElGRl9JU19ERVZSRVMpKTsKPiA+
ICsgICAgICAgLyogc3RydWN0IG5ldF9kZXZpY2UgbXVzdCBoYXZlIGEgcGFyZW50IGRldmljZSAt
IGl0IHdpbGwgYmUgdGhlIGRldmljZQo+ID4gKyAgICAgICAgKiBtYW5hZ2luZyB0aGlzIHJlc291
cmNlLgo+ID4gKyAgICAgICAgKi8KPgo+IENhdGNoaW5nIHN0YXRpYyBwcm9ncmFtbWluZyBlcnJv
cnMgc2VlbXMgbGlrZSBhbiBleHBlbnNpdmUgdXNlIG9mIHRoZQo+IGxhc3QgcnVudGltZSBmbGFn
IGluIHRoZSBlbnVtLiBJdCB3b3VsZCBiZSB3ZWlyZCB0byBkZXZyZXMgbWFuYWdlIHRoZQo+IHVu
cmVnaXN0ZXIgYW5kIG5vdCBhbHNvIGNob29zZSB0byBtYW5hZ2UgdGhlIHVuZGVybHlpbmcgbWVt
b3J5IGluIHRoZQo+IHNhbWUgZmFzaGlvbiwgc28gaXQgd291bGRuJ3QgYmUgYW4gb2J2aW91cyBt
aXN0YWtlIHRvIG1ha2UuIElmIGl0IG11c3QKPiBiZSBlbmZvcmNlZCwgb25lIGNvdWxkIGFsc28g
aXRlcmF0ZSBvdmVyIHRoZSByZWdpc3RlcmVkIHJlbGVhc2UKPiBmdW5jdGlvbnMgYW5kIGNoZWNr
IGZvciB0aGUgcHJlc2VuY2Ugb2YgZGV2bV9mcmVlX25ldGRldiB3aXRob3V0Cj4gYnVybmluZyB0
aGUgZmxhZy4KPgoKSGkgRWR3aW4sCgpJJ3ZlIHN1Ym1pdHRlZCB0aGlzIHBhdGNoIHNvbWUgdGlt
ZSBhZ28gYWxyZWFkeSBhbmQgd2FzIHRvbGQgdG8gY2hlY2sKaWYgdGhlIHVuZGVybHlpbmcgbWVt
b3J5IGlzIG1hbmFnZWQgdG9vLiBJIGd1ZXNzIEkgY291bGQgdHJ5IHRvIHVzZQpkZXZyZXNfZmlu
ZCgpIGhlcmUgdGhvdWdoLgoKUmUgdGhlIGxhc3QgYml0IGluIHByaXZfZmxhZ3M6IGlzIHRoaXMg
cmVhbGx5IGEgcHJvYmxlbSB0aG91Z2g/IEl0J3MKbm90IGxpa2Ugc3RydWN0IG5ldF9kZXZpY2Ug
bXVzdCByZW1haW4gc3RhYmxlIC0gZS5nLiB3ZSBjYW4gbWFrZQpwcml2X2ZsYWdzIGEgYml0bWFw
LgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
