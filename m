Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C66FC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 01:12:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04582073A
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 01:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S7Ih7qPH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTA3SJS1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D04582073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gfXHlW778Hvmug7GEer+KztwQGw6lGm406HV/LcZdcQ=; b=S7Ih7qPHauXMNlPCvx/+YL7/j
	Rq/SUinMiAOXxNBc2j11ShYkbtT0udvS7QUGBnazXcj2vmNzoZlFReuoOiym7U75m85tYeVVnmQNH
	tcnZyRZ53BOZtU7B+BpJH5TWLMPIU6/MhgZFS2oB052gFfHXef9nrlLr1zNrQX9seEfdHjcXJRNha
	QPznI4i7qwWIcCt7j0s6PDYd/JDh9TqyOi1w4M/LiKEDANzyDasloTy/+mECujnTZSO0Wr8IKyg8g
	9u324tX7u11T482MOL2viDy8YehhejOHCWtYNnU2wOEDu9xW82bn09BEfNehBhBVIQJymOatxOpYW
	g6ZdQ85Fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB6SO-0001wJ-K7; Thu, 27 Aug 2020 01:12:00 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB6SL-0001vY-Gb; Thu, 27 Aug 2020 01:11:58 +0000
Received: by mail-lj1-x242.google.com with SMTP id f26so4500578ljc.8;
 Wed, 26 Aug 2020 18:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m/8pB8Sw21i7XQLubODjblLQyuDRrCYhn+Eq3ZDQVx0=;
 b=TTA3SJS1N/caMZX9Nag1kHB/iT0fK4yOYmxP3aMRd75Z2BueqjS4WGzvX3hU8cgNYw
 br9qLPus7nDMRlbM630MvGiWgR1tFlr7ZG7v8SNBu0iNMCvRVjwsOqIkMyz8/8fUKaIx
 C6hGhspEoFOxM6rUY5ERS3UNGItKKusEBXK6LvtdJK9W/07KMy6mXl8uaaEVjKS4knsy
 bXY4/ngTaCKfitIuKfJkwr4X4xSCDpUlXpf+EOUZN6EZwNhHrX7mHfgfrp4hX3TLmvib
 E3oxNcnZGr5WYLHtA4bAkRY6e6wnO+UOegOwN9VrxZtijgjOT8pY3w02NPCumMMjc8BF
 JhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m/8pB8Sw21i7XQLubODjblLQyuDRrCYhn+Eq3ZDQVx0=;
 b=OiWcwt5MFw1YdSsjeehVgkfe9bmes2XV0V7W9Tul1ocWRaRAbKre4IZv1GBS0eniHU
 ZpgYytX4oaOFo1MSGy7f6LOYJU6Ld8kv9gngJQxAA2QKVgEHTij9f5dX0axyDpl9Iyp+
 1/VIbqM7oIYZ1KYYRgBJdNpbAzTieZjltlX/mF0I4Yc4e2MlUgRhyDFhvrRfPxOwskDx
 aynBZpeznDuL4h1Yu/OiuMkozyHlMg0/b+z/6Hp3l9KTbSCYZ6psIyzj8CYLDp4KtbQS
 2h/RK1FJMLovrpbkJ8iYRSLoQUEhcH55bykwOP3v3NxJ3208fArcxx+FZarHYSALyuWv
 nLLA==
X-Gm-Message-State: AOAM531Af/At3QHWBac4hvfbH5aifsOV3ypGMKVfkBGvE+xajnWzQcGT
 vJrxNpn1WBEBnjtnEyADd6Vi9x4BuNH4qc/AfVU=
X-Google-Smtp-Source: ABdhPJydzD1WwH6+x47tyNqs5lJxZhmJOXy71zWRsrVhFlJb3UW8drng/iudHsH+0nuncrCwHunivBrN3aq1Cyaa5dk=
X-Received: by 2002:a2e:2c0e:: with SMTP id s14mr8994396ljs.28.1598490716116; 
 Wed, 26 Aug 2020 18:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <1598440602-8648-1-git-send-email-u0084500@gmail.com>
 <a7d1a5d9-97e9-bcf6-23f4-2c4be356913f@roeck-us.net>
 <CADiBU3_x5-P8A0erchFpWucX4_R8M01-CdOJv38FjrPGSn+55A@mail.gmail.com>
 <627dd188-9379-1179-432e-b53948052823@roeck-us.net>
In-Reply-To: <627dd188-9379-1179-432e-b53948052823@roeck-us.net>
From: =?UTF-8?B?5ZWf5Y6f6buD?= <u0084500@gmail.com>
Date: Thu, 27 Aug 2020 09:11:44 +0800
Message-ID: <CADiBU3_GX+BvxQCDkMtf70sXHnwFVNmBCJsrydROHjy5Lr9B4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb typec: mt6360: Add support for mt6360 Type-C
 driver
To: Guenter Roeck <linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_211157_661697_F6C65AE1 
X-CRM114-Status: GOOD (  11.70  )
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
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang <cy_huang@richtek.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

R3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0PiDmlrwgMjAyMOW5tDjmnIgyN+aXpSDp
gLHlm5sg5LiK5Y2IOTowMuWvq+mBk++8mgo+Cj4gT24gOC8yNi8yMCA1OjU5IFBNLCDllZ/ljp/p
u4Mgd3JvdGU6Cj4gWyAuLi4gXQo+ID4+PiArc3RhdGljIGludCBtdDYzNjBfdGNwY19yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+Pj4gK3sKPiA+Pj4gKyAgICAgc3RydWN0
IG10NjM2MF90Y3BjX2luZm8gKm10aSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+ID4+
PiArCj4gPj4+ICsgICAgIHRjcGNpX3VucmVnaXN0ZXJfcG9ydChtdGktPnRjcGNpKTsKPiA+Pgo+
ID4+IFRoYXQgbGVhdmVzIGludGVycnVwdHMgZW5hYmxlZCwgd2hpY2ggbWlnaHQgYmUgcmFjeQo+
ID4+IGJlY2F1c2UgaW50ZXJydXB0cyBhcmUgc3RpbGwgZW5hYmxlZCBoZXJlLgo+ID4gTS4uLiwg
eWVzLCBpdCB3aWxsIGNhdXNlIHRoZSByYWNlIGNvbmRpdGlvbiBkdXJpbmcgbW9kdWxlIHJlbW92
ZS4KPiA+IEknbGwgYWRkIGRpc2FibGVfaXJxIGJlZm9yZSB0Y3BjaSB1bnJlZ2lzdGVyIHRvIHBy
ZXZlbnQgaXQuCj4KPiBPciBqdXN0IHNldCBUQ1BDX0FMRVJUX01BU0sgdG8gMCwgYXMgaW4gdGNw
Y2kuYy4KQm90aCBhcmUgcmlnaHQsIFRoeC4gSSdsbCBjaG9vc2Ugb25lLgoKQlRXLCBpdCBzZWVt
cyBlbnVtIHR5cGVjX2NjX3N0YXR1cyBpcyB1c2VkIGJ5IHRjcGNpLmguCklmIEkgZG9uJ3QgaW5j
bHVkZSB0Y3BtLmgsIGl0IHdpbGwgcmFpc2UgYSB3YXJuaW5nIGR1cmluZyB0aGUgY29tcGlsZSB0
aW1lLgo+Cj4gR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
