Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3223CC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 15:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E831E2065F
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 15:27:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="trl5yrI4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jfK/zDIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E831E2065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivr3mFLOlLwuZ7GMh1cUUcyR0E39qatXkMf+Fg4zLTo=; b=trl5yrI4cPdMq+
	s9cpIFlGSi+81C+q1UYxnmqBTgMbcsHTKjelVHVRmh0jvyIbvfx/hnY/6fY8/hiXjVxdNhHB4ImQK
	Nf06xk/tB8nw4lfS9r6BwL0qR1FJNcswOalwflM33yTXNve0NFU9FySKMEvIjRmhe9+kX+5mSXj7c
	/y3x8TRlhD/Hcx3DE9OxutGaN9Upqya5/nvyV8LKzx1xaXXjeKlaSboz+P3Uz9kxgnWLlz81404RK
	HQkde8dZaCW42epb+SgnCgiqgoXLUqaNZrHJQ2magMzzLArOpecjQqZoz+AWDxvL9e52nh9yUSVgC
	q0pEZPl+CkQnj7GT5Slw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc9Zw-0007DM-4L; Fri, 22 May 2020 15:27:20 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc9Zr-0007CA-Tq
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 15:27:18 +0000
Received: by mail-qt1-x843.google.com with SMTP id o19so8531420qtr.10
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SRsdOjWWL+ErLjyMojixNVl7s3eXgVVstDINvK3dtXg=;
 b=jfK/zDIFzAwRiPF5rSe1xq8YO+ZE0VL+EQPe6K4YPFRj9xXRozQLQi0tJM2zyK91BM
 w6Q6wyRRRq4Qq46NUYu/kcCX1f78ojBrzaVsc9LDiIYA/RuUiiX8vfA7GBkol9Finv11
 mQ7Ox5f4M3JlcOOKELjHlwqAPzd7yc/GQhYmlEdYOXV+xnBdH0/HrN2sD/BWNxqHT91u
 rAo5gUjweaCu8QoaGEUC5QVe8xt2NF2nAQIlJ5w++VFJJpSUf/6ig5/aEe3d+a7IVzuF
 82wUAcK7HdnhoZthoiL4FwdoJXIAvTjfiqfV6kii/d5yWsSktVexR4BbOAqcqg9hjBrg
 Vgdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SRsdOjWWL+ErLjyMojixNVl7s3eXgVVstDINvK3dtXg=;
 b=C1x1Fx9pZYeYGef2nXxbTJZQchQuovyicNu87DeThiFz4Rcq2gmZuUQEzK9qHYyjqS
 C1Xn6yLWX35uYM8alRovi4Zl5EsbkKh3Bb1fjnhs5gpR9dVHduj/bqbGSLIfTd3Uhjbe
 T3fg2ZC3cNagNCvF+fjjQtSqBdPDuSRIx1uZjRme6P6mOZ9GqcU0ucJUcUTKkr9XmhKR
 pYn8CUeDN3GtLUUV8LETHfX/xZGFLs+MsqqzpAZrvGsLSLAuqoSgPWj0FdLG/hTM93Mg
 rzSBN1u234kcfvTwLUf4/7WjiDPh1IwuCWU06/fug8udy313VusS1Vn5K1x8D7XPwTkC
 4IZA==
X-Gm-Message-State: AOAM530fUtQaatzP21fa9gbS/EkL+VotPDfBI4VJQvDr33v5TpR+AOlv
 05yVg1dzyN36GoLD+U3ggplgdGc/iZ65AnZO8+uk6w==
X-Google-Smtp-Source: ABdhPJy8zE09hP3ssAEXIS8PrMxrdtczpkONJnriZwX1UvQjiBseW1fjfukwynTIX1jUsud00Bk+uIw6wPtBlxqVO3Q=
X-Received: by 2002:aed:37e7:: with SMTP id j94mr16165439qtb.57.1590161230357; 
 Fri, 22 May 2020 08:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200522120700.838-1-brgl@bgdev.pl>
 <20200522120700.838-7-brgl@bgdev.pl>
 <5627e304-3463-9229-fa86-d7d31cad7a61@gmail.com>
In-Reply-To: <5627e304-3463-9229-fa86-d7d31cad7a61@gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Fri, 22 May 2020 17:26:59 +0200
Message-ID: <CAMpxmJVCE0RBNqBQw03bT5uqnCk3vDi1ncbNeWj=VvcN1wEaZg@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] net: ethernet: mtk-star-emac: new driver
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_082715_964192_5086AD54 
X-CRM114-Status: UNSURE (   7.83  )
X-CRM114-Notice: Please train this message.
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
Cc: Edwin Peer <edwin.peer@broadcom.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, netdev <netdev@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Sean Wang <sean.wang@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>, Pedro Tsai <pedro.tsai@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Jakub Kicinski <kuba@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cHQuLCAyMiBtYWogMjAyMCBvIDE3OjA2IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0Bn
bWFpbC5jb20+IG5hcGlzYcWCKGEpOgo+Cj4gT24gMjIvMDUvMjAyMCAxNDowNiwgQmFydG9zeiBH
b2xhc3pld3NraSB3cm90ZToKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pl
d3NraUBiYXlsaWJyZS5jb20+Cj4gPgo+ID4gVGhpcyBhZGRzIHRoZSBkcml2ZXIgZm9yIHRoZSBN
ZWRpYVRlayBTVEFSIEV0aGVybmV0IE1BQyBjdXJyZW50bHkgdXNlZAo+ID4gb24gdGhlIE1UOCog
U29DIGZhbWlseS4gRm9yIG5vdyB3ZSBvbmx5IHN1cHBvcnQgZnVsbC1kdXBsZXguCj4KPiBNVDg1
KiogU29DIGZhbWlseSwgQUZBSVUgaXQncyBub3QgdXNlZCBvbiBNVDgxKiogZGV2aWNlcy4gQ29y
cmVjdD8KPgoKTVQ4MSoqIGFuZCBNVDg1KiogYXJlIHZlcnkgY2xvc2VseSByZWxhdGVkLiBUaGlz
IElQIGlzIGN1cnJlbnRseSB1c2VkCm9uIE1UODUqKiwgTVQ4MSoqIGFuZCBNVDgzKiouIEl0IG1h
eSBiZSB1c2VkIGluIG5ldyBkZXNpZ25zIGluIHRoZQpmdXR1cmUgdG9vLgoKQmFydAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
