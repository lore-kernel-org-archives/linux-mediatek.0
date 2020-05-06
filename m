Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C657C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 06:40:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32C7520721
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 06:40:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nRAwsZUl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Kr5jrMX/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32C7520721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3++NLxfavZ0RRv9YKKKsE9P8V+tKrdJdUJnPtkwIdyw=; b=nRAwsZUl1E4Iiu
	hhkgNjxRQRrQSYMjvzllWu+4FVQpeXmfDoUxIc2g1zy+vZXcwO/I7LeIQ5838RgZ7IvZ5XJH0CQP9
	Vc2JG/Ewmy8OUC8x0IrWMYl9mhfoOk7oL2m2PCmUU/Uq7FgnZEDpEKhNyTKJOMfyhKyzUVo0L9Mh2
	m1f/KFLH1gMWv8GkKaiuo87VtVb8mur17L3Fzr/4WJTsujA252E7ekar/+6DQZLO+TQ4PnR0zUN9G
	Hy803bbWG3EAq8KZpVfXbs9xCrSGs6UHtoqGuBYKvUf6xd5AHRyzYMA/xa7IowW6TS62UshB5TS6a
	oqeaCFr9QjhdRRy2VHOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWDis-0001nH-5j; Wed, 06 May 2020 06:40:02 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWDip-0001hZ-Cc
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 06:40:00 +0000
Received: by mail-il1-x142.google.com with SMTP id n11so722417ilj.4
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 23:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PsWFEGMVJXcSSkAjwrVFH6KJLf0s0b6ByKNGvxglslg=;
 b=Kr5jrMX/+PcTSTiywlXvOb8Kl6wEWgrrE0EqA30uFVzGqFsiZXfp945Iq9nxoAburZ
 7Rs3ERUy82Zma/rH7oPkI8imeqGVZ7htwpQI0s4j1XgCEJxdreiWmrbw37k7528UOLIb
 7GJUXVP8ogrq5C8xkXS6xCpM36TXREVn7F0WZt3t9xRUw/yl4d3x6F8m2ATmEFJrdnky
 +kODoPK5I9u3PytnmWA3652DueJnRefdk+JoJCaJkUIaZaZRfFWw27b/ikrzoVD7PlH4
 /1E2pniM3AM9nVvVC2/+EKPtYlz0RGBckD9orVy5059umC2zzj9Zk+RB8+BROBCqRXGm
 TyDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PsWFEGMVJXcSSkAjwrVFH6KJLf0s0b6ByKNGvxglslg=;
 b=N5NqWYMN48gZxeSceSiOaF8ChgosGzO8DWHrpxJZgif6qRTc1UrHPiR/YvTvC2HgzF
 +On6uqP1Rf8CcLXrYYFy1dPQOWlJ5HhGn44gXXGFKfDsWT8TfPPBA1n0IHt1LfBXAnKG
 VrP00ayGr2IV9cPjP+rxABu1NdKCviOGLCuiH550Wr26XfZSP32kEnJ0OzTwNsltkEq4
 GVFEyCTY1BtvorVjUq8O8TII1qb208Su6xEHPVoXwN98LFQRxKTTGwoUyDpY9v+LDLYD
 voMSOX9edkZAs+d78z1xmGigXrUhxf2za6coDKaf8coNJnu/j70qPSz7LDmA7S6Yr0W8
 xgKQ==
X-Gm-Message-State: AGi0PuYBVViKHrNtmlag7tCnASNyI1wIAV5A3TGyv6W/cE5c8O7hXysE
 Z/KMAymBQ7KB3hBpy9C8WjC1kh1lkpaqdwL00z8kdA==
X-Google-Smtp-Source: APiQypKqtjH4SAI/hXBWX3+KWPEY3bw3Ls+I33LVzGThbfZA9NOr8ifN8iSwMhFGSis6GvXv/BqSn8GW32PMwFDzUQw=
X-Received: by 2002:a92:dac8:: with SMTP id o8mr7207819ilq.189.1588747198311; 
 Tue, 05 May 2020 23:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 May 2020 08:39:47 +0200
Message-ID: <CAMRc=Mf0ipaeLKhHCZaq2YeZKzi=QBAse7bEz2hHxXN5OL=ptg@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To: Jakub Kicinski <kuba@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_233959_476228_3DED4D19 
X-CRM114-Status: GOOD (  11.58  )
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
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
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

d3QuLCA1IG1haiAyMDIwIG8gMTk6MzEgSmFrdWIgS2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz4g
bmFwaXNhxYIoYSk6Cj4KPiBPbiBUdWUsICA1IE1heSAyMDIwIDE2OjAyOjI1ICswMjAwIEJhcnRv
c3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29s
YXN6ZXdza2lAYmF5bGlicmUuY29tPgo+ID4KPiA+IFByb3ZpZGUgZGV2bV9yZWdpc3Rlcl9uZXRk
ZXYoKSAtIGEgZGV2aWNlIHJlc291cmNlIG1hbmFnZWQgdmFyaWFudAo+ID4gb2YgcmVnaXN0ZXJf
bmV0ZGV2KCkuIFRoaXMgbmV3IGhlbHBlciB3aWxsIG9ubHkgd29yayBmb3IgbmV0X2RldmljZQo+
ID4gc3RydWN0cyB0aGF0IGhhdmUgYSBwYXJlbnQgZGV2aWNlIGFzc2lnbmVkIGFuZCBhcmUgZGV2
cmVzIG1hbmFnZWQgdG9vLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4KPiA+IGRpZmYgLS1naXQgYS9uZXQvY29y
ZS9kZXYuYyBiL25ldC9jb3JlL2Rldi5jCj4gPiBpbmRleCA1MjIyODgxNzdiYmQuLjk5ZGI1Mzdj
OTQ2OCAxMDA2NDQKPiA+IC0tLSBhL25ldC9jb3JlL2Rldi5jCj4gPiArKysgYi9uZXQvY29yZS9k
ZXYuYwo+ID4gQEAgLTk1MTksNiArOTUxOSw1NCBAQCBpbnQgcmVnaXN0ZXJfbmV0ZGV2KHN0cnVj
dCBuZXRfZGV2aWNlICpkZXYpCj4gPiAgfQo+ID4gIEVYUE9SVF9TWU1CT0wocmVnaXN0ZXJfbmV0
ZGV2KTsKPiA+Cj4gPiArc3RydWN0IG5ldGRldmljZV9kZXZyZXMgewo+ID4gKyAgICAgc3RydWN0
IG5ldF9kZXZpY2UgKm5kZXY7Cj4gPiArfTsKPgo+IElzIHRoZXJlIHJlYWxseSBhIG5lZWQgdG8g
ZGVmaW5lIGEgc3RydWN0dXJlIGlmIHdlIG9ubHkgbmVlZCBhIHBvaW50ZXI/Cj4KClRoZXJlIGlz
IG5vIG5lZWQgZm9yIHRoYXQsIGJ1dCBpdCByZWFsbHkgaXMgbW9yZSByZWFkYWJsZSB0aGlzIHdh
eS4KQWxzbzogdXNpbmcgYSBwb2ludGVyIGRpcmVjdGx5IGRvZXNuJ3Qgc2F2ZSB1cyBhbnkgbWVt
b3J5IG5vciBjb2RlCmhlcmUuCgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
