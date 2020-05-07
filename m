Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE74C38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 09:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6662078C
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 09:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mwdzuNFR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hVcFRSKF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D6662078C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lVPtgphLnB0bxEWXxqR92KjK+M96KuPbL3LiuclgkF0=; b=mwdzuNFRM8shfU
	9RYI15WZaEY0n9EtryNpH6qmTrTyddD9+e6ZuO/2K0ChuLA+TBgAigLJk7vyyreQ2X2XK2fMKzo2o
	hzkyi2ByUo5ebkgHzXwc7YchtBCOVsVvpDrcQpqTYJ0PSzTGrdT41ElJa6skm9QXPRefs5Q3DcjPP
	CRqh+B8JCjLNFL93mNO27vev6t186wgYgB0vNkctXu9EhadBWl0XIfsew9APIFlHyp2i3UoVRXV9o
	YLLQ6ADoYbjixkaJVHahS+clvGiHAlR411ydwsTrRtNIiNEJSqY2XIK1A7H/kChglILdYHqFEgp1V
	MWLPkE+Au8NxXTKgj6WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWcmM-0007fW-Hv; Thu, 07 May 2020 09:25:18 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWcmJ-0007e4-Cc
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 09:25:17 +0000
Received: by mail-qk1-x744.google.com with SMTP id t3so5281928qkg.1
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 02:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JbyrTxjTZIm41hIBopPv7oBGmFhzJlTGvI6JGZoJteY=;
 b=hVcFRSKFl9lmb9j77HI03fHv6Hk1v73kcQa902XWtGd6PrAdnJrdvBGI59aZDmbRnl
 QnTav+0K5mLsSEZQ+KAHILuJauchPaRpwCZ2HSvGeKxlR2yK4cJ0EcXZADu40Fwy4x1Z
 7Td0waIzoSgNxJnjGTqKuH6UjSRss+Omt6RfgBDuoNZUOr1hny/f+F+Kqz8+YBJjRvbF
 VI5sQ5IOLK/ydoybPZPeKcEAJqD5SJUS8bRmzndUxkTm6yJSD6dATGFBmttsyzC366Lk
 ATnnN77ZG4GiXFS++MXDBiLfnEwEZzbIJZrEkoVLXC2F5G/7JO9R6O9saQzfQLTr4med
 V/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JbyrTxjTZIm41hIBopPv7oBGmFhzJlTGvI6JGZoJteY=;
 b=MUFmma8DQxYUhHIEtBBWQp1D1p2zfclrTU2LBpIcHaCVr2MWsVEvjiYudx3CaEOJ0o
 y0reHDJ4Vi+4SK8e9KsAk6R8eLUoTfUBv8cVvbkk11v54TTiYc4U8PXsqLNCbvL2hCQo
 1PM66CbchV9JY2VhWtDVHmFvOW+4bZZ0M03TaETzTYmDrUyI7q21DKfC2yu/Ch52bbXs
 ZmFDF1jZUVx8UN+g2B7Q5eFJll5FB9FG5+10pjLBwpJql44+i9TfPgMy9oqxAQ7kpn5u
 v9TOhqmcvIbQNPFGmmzbl4/OpctUcpqHxF+NaPEbHU4q9tmz3RAclQHPvpklHB95SoOi
 4Z7Q==
X-Gm-Message-State: AGi0Pub54JU/OgbsB4yxE3nFBmy+5TT6STShZKAfsrdvlFpj0prcfoU+
 GNVW4T9wyPksa4wyxEgtcSC/6YVWS74vlLxotoE5bA==
X-Google-Smtp-Source: APiQypLSXck1EaP6FHaf/R4OayTt1mguGYQPHoVpSdiDDIrFzvY+Z5TozNRG3W20rgYO4xwmyohpCkW+LYwhZ5sejQE=
X-Received: by 2002:a05:620a:1289:: with SMTP id
 w9mr12058283qki.263.1588843511709; 
 Thu, 07 May 2020 02:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMRc=Mf0ipaeLKhHCZaq2YeZKzi=QBAse7bEz2hHxXN5OL=ptg@mail.gmail.com>
 <20200506101236.25a13609@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200506101236.25a13609@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 7 May 2020 11:25:01 +0200
Message-ID: <CAMpxmJWckQdKvUGFDAJ1WMtD9WoGWmGe3kyKYhcfRT2nOB93xw@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To: Jakub Kicinski <kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_022515_488721_EE2D07BA 
X-CRM114-Status: GOOD (  16.14  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, netdev <netdev@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

xZtyLiwgNiBtYWogMjAyMCBvIDE5OjEyIEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+
IG5hcGlzYcWCKGEpOgo+Cj4gT24gV2VkLCA2IE1heSAyMDIwIDA4OjM5OjQ3ICswMjAwIEJhcnRv
c3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiB3dC4sIDUgbWFqIDIwMjAgbyAxOTozMSBKYWt1YiBL
aWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPiBuYXBpc2HFgihhKToKPiA+ID4KPiA+ID4gT24gVHVl
LCAgNSBNYXkgMjAyMCAxNjowMjoyNSArMDIwMCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+
ID4gPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5j
b20+Cj4gPiA+ID4KPiA+ID4gPiBQcm92aWRlIGRldm1fcmVnaXN0ZXJfbmV0ZGV2KCkgLSBhIGRl
dmljZSByZXNvdXJjZSBtYW5hZ2VkIHZhcmlhbnQKPiA+ID4gPiBvZiByZWdpc3Rlcl9uZXRkZXYo
KS4gVGhpcyBuZXcgaGVscGVyIHdpbGwgb25seSB3b3JrIGZvciBuZXRfZGV2aWNlCj4gPiA+ID4g
c3RydWN0cyB0aGF0IGhhdmUgYSBwYXJlbnQgZGV2aWNlIGFzc2lnbmVkIGFuZCBhcmUgZGV2cmVz
IG1hbmFnZWQgdG9vLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xh
c3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPiA+ID4KPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvbmV0L2NvcmUvZGV2LmMgYi9uZXQvY29yZS9kZXYuYwo+ID4gPiA+IGluZGV4IDUyMjI4
ODE3N2JiZC4uOTlkYjUzN2M5NDY4IDEwMDY0NAo+ID4gPiA+IC0tLSBhL25ldC9jb3JlL2Rldi5j
Cj4gPiA+ID4gKysrIGIvbmV0L2NvcmUvZGV2LmMKPiA+ID4gPiBAQCAtOTUxOSw2ICs5NTE5LDU0
IEBAIGludCByZWdpc3Rlcl9uZXRkZXYoc3RydWN0IG5ldF9kZXZpY2UgKmRldikKPiA+ID4gPiAg
fQo+ID4gPiA+ICBFWFBPUlRfU1lNQk9MKHJlZ2lzdGVyX25ldGRldik7Cj4gPiA+ID4KPiA+ID4g
PiArc3RydWN0IG5ldGRldmljZV9kZXZyZXMgewo+ID4gPiA+ICsgICAgIHN0cnVjdCBuZXRfZGV2
aWNlICpuZGV2Owo+ID4gPiA+ICt9Owo+ID4gPgo+ID4gPiBJcyB0aGVyZSByZWFsbHkgYSBuZWVk
IHRvIGRlZmluZSBhIHN0cnVjdHVyZSBpZiB3ZSBvbmx5IG5lZWQgYSBwb2ludGVyPwo+ID4gPgo+
ID4KPiA+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoYXQsIGJ1dCBpdCByZWFsbHkgaXMgbW9yZSBy
ZWFkYWJsZSB0aGlzIHdheS4KPiA+IEFsc286IHVzaW5nIGEgcG9pbnRlciBkaXJlY3RseSBkb2Vz
bid0IHNhdmUgdXMgYW55IG1lbW9yeSBub3IgY29kZQo+ID4gaGVyZS4KPgo+IEkgZG9uJ3QgY2Fy
ZSBlaXRoZXIgd2F5IGJ1dCBkZXZtX2FsbG9jX2V0aGVyZGV2X21xcygpIGFuZCBjby4gYXJlIHVz
aW5nCj4gdGhlIGRvdWJsZSBwb2ludGVyIGRpcmVjdGx5LiBQbGVhc2UgbWFrZSB0aGluZ3MgY29u
c2lzdGVudC4gRWl0aGVyIGRvCj4gdGhlIHNhbWUsIG9yIGRlZmluZSB0aGUgc3RydWN0dXJlIGlu
IHNvbWUgaGVhZGVyIGFuZCBjb252ZXJ0IG90aGVyCj4gaGVscGVycyB0byBhbHNvIG1ha2UgdXNl
IG9mIGl0LgoKSW4gb3JkZXIgdG8gdXNlIGRldnJlc19maW5kKCkgdG8gY2hlY2sgaWYgc3RydWN0
IG5ldF9kZXZpY2UgaXMgbWFuYWdlZAppbiBkZXZtX3JlZ2lzdGVyX25ldGRldigpIEkgbmVlZCB0
byBrbm93IHRoZSBhZGRyZXNzIG9mIHRoZSByZWxlYXNlCmZ1bmN0aW9uIHVzZWQgYnkgZGV2bV9h
bGxvY19ldGhlcmRldl9tcXMoKS4gRG8geW91IG1pbmQgaWYgSSBtb3ZlIGFsbApuZXR3b3JraW5n
IGRldnJlcyByb3V0aW5lcyAoY3VycmVudGx5IG9ubHkgZGV2bV9hbGxvY19ldGhlcmRldl9tcXMo
KSkKaW50byBhIHNlcGFyYXRlIC5jIGZpbGUgKGUuZy4gdW5kZXIgbmV0L2RldnJlcy5jKT8KCkJh
cnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
