Return-Path: <SRS0=AGTb=6W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49655C38A2A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 18:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F252173E
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2020 18:39:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lEpejcOc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="bqJnS5va"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F252173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9odaKXzQfCu8wJGgsP075gIGvy8mCELSq2eO4VtaLo=; b=lEpejcOcbAygvt
	zB0oMmayQVwaMJS44MxQ7aK1+He3C+5dBWR4Jnw3mFV1nt+Qdq4NHjovrMWaRBRvNkUNkfv9J1T/K
	HYi+T+RCDA4TSeXmUNbTI/XVvlojUrigXmPcKSDduh36A4K7g+/w8B5vyoj4kukHETne/885oGSTE
	Mes9CjRhfshR+7SHHSZfK+j6x2CRsjB8fD/asCQ4YBC05F7GdnxKPm0WQ2VNAdJrLUBDezMzUJkBP
	eBseDf9YvfUo2UFCvRUjV8RL3wCb+ncztIAuggNd58iUedBKIv54i5OTm/s8Lt4O+DZ9VMstu6fRl
	kJixiOU0c8wsiZpYjegQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX7uV-0004CE-Mh; Fri, 08 May 2020 18:39:47 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX7uJ-00043s-9D
 for linux-mediatek@lists.infradead.org; Fri, 08 May 2020 18:39:36 +0000
Received: by mail-il1-x142.google.com with SMTP id i16so2309617ils.12
 for <linux-mediatek@lists.infradead.org>; Fri, 08 May 2020 11:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RGIpRsn9hXDxHTNl/QnLM0SbzmG3DHjOVcysfR1ByLg=;
 b=bqJnS5vane6smgkAuFEEcD0f6Ycc9yf0lJgeJRU4JjUw54yjKs7BXh8x7lk1vbGGnV
 0f+IMGeKn3Gw8E15EFVxSoihcpqVq3H2ka3HfRPYyf0OuTLXCPToeBb+OyVQEtZC7lHl
 zuolyQtCP3X66zQBV9+hARMxLnivHPtSnxXf5rUK+0xz88gPQQ3kiIwNSw4silZ09ksy
 iZesm817N+ct23uLjo+cnMxE5KHcCYtZJFFhLRXkIQCkpT0bZ5O/5lBtIwyt1tjgyZpr
 XXPJFtNZ04z6cdHl7rsn9ul842f84tS91OI8taD3ChAh0ODWd61l9meBxJla50/OQul7
 oA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RGIpRsn9hXDxHTNl/QnLM0SbzmG3DHjOVcysfR1ByLg=;
 b=M7YMUMCGOwN02XTiWAzkd84/Z6wIva2tWW1s+Z4K3qqQcVm6CjmR/6M5tl4M46V/pt
 YYTo3SkHVESoOZqJKF7E+uzW1yPVOZPGsYJm3h0NbEopfNbyeaJO7n7xBglqdPW5BcXY
 O/X8ILYt2xdVIABAeKyLmtC9BBoMulzzFxRfFTWt+WZVrAQTj04y4yKUvax2HenkvB0Q
 4uRDHRE0Z0n7ts61EnutTA/8065p9c5MpmwJ68p8GKHizV8oom8Jw91jvid/0/yp5OZf
 x/bZvttpDmgoVyzRUrWAgufd/AXSzbNprkfSmLRCWM0CD7LRpYqrIy+04E1VBXHYXeLM
 69Bg==
X-Gm-Message-State: AGi0PuYShcFpV6D/DbTWfAAMCkc5VAdryaOzzP5eQGJ6n5V/EcQ5Qe8B
 2dYuha8FBT/XrXIt7WKlLcZ0MbjhpM54DCdJtoSh6g==
X-Google-Smtp-Source: APiQypIK7HVLTAX4pxfdG4Np+jILsEOGqiII5aB+gQC6LJN5kcIhjqNVKZy0G/G/rBz+o1NbRC9W4C8NgLZeDmRHgVw=
X-Received: by 2002:a92:aa07:: with SMTP id j7mr4467857ili.40.1588963173745;
 Fri, 08 May 2020 11:39:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMRc=Mf0ipaeLKhHCZaq2YeZKzi=QBAse7bEz2hHxXN5OL=ptg@mail.gmail.com>
 <20200506101236.25a13609@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMpxmJWckQdKvUGFDAJ1WMtD9WoGWmGe3kyKYhcfRT2nOB93xw@mail.gmail.com>
 <20200507095315.1154a1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMpxmJUEk3itZs4HujJOXUiL80kmEvGBvLF0NFc2UQoVDVTWRg@mail.gmail.com>
 <20200507155650.0c19229e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <c6e12eb6-d6ea-9ba9-4559-b2eda326601f@gmail.com>
In-Reply-To: <c6e12eb6-d6ea-9ba9-4559-b2eda326601f@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 8 May 2020 20:39:22 +0200
Message-ID: <CAMRc=MdKjZbHFfTYV12DjMet3sXbBht+qgiViddxs9csDvrf-Q@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To: Heiner Kallweit <hkallweit1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_113935_398627_06440EC2 
X-CRM114-Status: GOOD (  14.61  )
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
 Fabien Parent <fparent@baylibre.com>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cHQuLCA4IG1haiAyMDIwIG8gMDc6NTQgSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWls
LmNvbT4gbmFwaXNhxYIoYSk6Cj4KPiBPbiAwOC4wNS4yMDIwIDAwOjU2LCBKYWt1YiBLaWNpbnNr
aSB3cm90ZToKPiA+IE9uIFRodSwgNyBNYXkgMjAyMCAxOTowMzo0NCArMDIwMCBCYXJ0b3N6IEdv
bGFzemV3c2tpIHdyb3RlOgo+ID4+PiBUbyBpbXBsZW1lbnQgRWR3aW4ncyBzdWdnZXN0aW9uPyBN
YWtlcyBzZW5zZSwgYnV0IEknbSBubyBleHBlcnQsIGxldCdzCj4gPj4+IGFsc28gQ0MgSGVpbmVy
IHNpbmNlIGhlIHdhcyBhc2tpbmcgYWJvdXQgaXQgbGFzdCB0aW1lLgo+ID4+Cj4gPj4gWWVzLCBi
ZWNhdXNlIHRha2luZyB0aGUgbGFzdCBiaXQgb2YgcHJpdl9mbGFncyBmcm9tIG5ldF9kZXZpY2Ug
c2VlbXMKPiA+PiB0byBiZSBtb3JlIGNvbnRyb3ZlcnNpYWwgYnV0IGlmIG5ldCBtYWludGFpbmVy
cyBhcmUgZmluZSB3aXRoIHRoYXQgSQo+ID4+IGNhbiBzaW1wbHkgZ28gd2l0aCB0aGUgY3VycmVu
dCBhcHByb2FjaC4KPiA+Cj4gPiBGcm9tIG15IHBlcnNwZWN0aXZlIHdoYXQgRWR3aW4gc3VnZ2Vz
dHMgbWFrZXMgc2Vuc2UuIEFwYXJ0IGZyb20KPiA+IGxpdHRsZSB1c2UgZm9yIHRoZSBiaXQgYWZ0
ZXIgcHJvYmUsIGl0IGFsc28gc2VlbXMgY2xlYW5lciBmb3IgZGV2cmVzCj4gPiB0byBiZSBhYmxl
IHRvIHJlY29nbml6ZSBtYW5hZ2VkIG9iamVjdHMgYmFzZWQgb24gaXRzIG93biBzdGF0ZS4KPiA+
Cj4gV2hhdCBJIHdhcyBzYXlpbmcgaXMgdGhhdCB3ZSBzaG91bGQgY2F0Y2ggdGhlIGNhc2UgdGhh
dCBhIGRyaXZlcgo+IGF1dGhvciB1c2VzIGEgZGV2aWNlLW1hbmFnZWQgcmVnaXN0ZXIoKSB3L28g
ZG9pbmcgdGhlIHNhbWUgZm9yIHRoZQo+IGFsbG9jKCkuIEEgY29yZSBmdW5jdGlvbiBzaG91bGQg
bm90IGFzc3VtZSB0aGF0IGRyaXZlciBhdXRob3JzIGRvCj4gc2FuZSB0aGluZ3Mgb25seS4KPiBJ
IGRvbid0IGhhdmUgYSBzdHJvbmcgcHJlZmVyZW5jZSBob3cgaXQgc2hvdWxkIGJlIGRvbmUuCj4g
Q29uc2lkZXJpbmcgd2hhdCBpcyBiZWluZyBkaXNjdXNzZWQsIGhhdmUgYSBsb29rIGF0IGdldF9w
Y2lfZHIoKSBhbmQKPiBmaW5kX3BjaV9kcigpLCB0aGV5IGRlYWwgd2l0aCBtYW5hZ2luZyB3aGlj
aCBwYXJ0cyBvZiB0aGUgUENJCj4gc3Vic3lzdGVtIGFyZSBkZXZpY2UtbWFuYWdlZC4KClllcywg
SSBoYXZlIC0gdGhhdCdzIHdoeSBJIGFza2VkIGlmIGFueW9uZSBvYmplY3RzIHRvIG1lIG1vdmlu
ZyBhbGwKbmV0d29ya2luZyBkZXZyZXMgZnVuY3Rpb25zIGludG8gdGhlaXIgb3duIHNvdXJjZSBm
aWxlLiBUaGUgcmVhc29uIGZvcgp0aGF0IGJlaW5nOiBkZXZyZXNfZmluZCgpIG5lZWRzIHRvIGtu
b3cgdGhlIGFkZHJlc3Mgb2YgdGhlIHJlbGVhc2UKZnVuY3Rpb24sIG1lYW53aGlsZSBkZXZtX3Jl
Z2lzdGVyX25ldGRldigpIHdvdWxkIGhhdmUgdG8gZ28gaW50bwpuZXQvY29yZSwgd2hpbGUgZGV2
bV9hbGxvY19ldGhlcmRldigpIGxpdmVzIGluIG5ldC9ldGhlcm5ldC4KCkJhcnQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
