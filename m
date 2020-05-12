Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F01C54E8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 06:05:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E2A20746
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 06:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZomrakI4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="m7upY6SS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E2A20746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swboPptc/mUvBeB0jyVDho0qle6RwvC/8Yn0i484Jtw=; b=ZomrakI4pDbK+K
	//5LCWxfG4M6OVKB0gwB+Xi7rQG7OzeH5wuOKp4N+cFP/qq1NbaPsWKa4OAeMFCAL1t7o/Fe5V2z2
	u5NO/CbXVv/uxIbXRoZf6rO6BfzTUUV1+bwbItndkmOpGO/NzAZL37auxGjU/Oqo1nXSpfhQXnn5i
	mFZ1NVF/oTeaLlD+2qF/THO20xHeRscEoZQ1WzaesRzqzSVyuiU0A101SXiAAZANhryT7LbpnhDjT
	AOAAl87Ux0hwSkUt09q4H0PrVVO4/q5BQDEKzCST8wJdw2y0t5+xcWL1lV/anoCFqahxdKeraHCMn
	0lCXlR/6FPCgC63cMFcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYO2A-0003FB-Pi; Tue, 12 May 2020 06:04:54 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYO28-0003E5-CS
 for linux-mediatek@lists.infradead.org; Tue, 12 May 2020 06:04:53 +0000
Received: by mail-io1-xd41.google.com with SMTP id f5so5279679iow.10
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 23:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GmXNnj8j0/DuRakjHfxnYDbYR3/p1C2Z1WRm/EsJUCQ=;
 b=m7upY6SSbbF74mMD/6Ct02MUFC+lcQkE0M2ZSEfUwz8/zFr2LXYe+zyjsa7QHwNxLU
 E1xtIq6cls/6Xl5PC2oNnB9MLcngcGNCboLNlcaeqdA/QhxuPYlg6fSrcTJ1yt3PhSm8
 p4nRLQKIhwwNJhMXFsKo8spE1CkbB7rxxDxOXRA7BfDWjuXaNdcoB7xzLfrvlvITzqGj
 GRDhl86kJpFQABV/jgrZEMNArbKiAHRlWiOkJuHnOqoDLPX8y/BKcsiIq/fZA9FWsRgS
 M6x3a8yUDx3NluBpbUUiWoIc4eo6aHzDUy3W/pNCYGkvOGYvjt9nct4K+D71V8iCXDLZ
 4eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GmXNnj8j0/DuRakjHfxnYDbYR3/p1C2Z1WRm/EsJUCQ=;
 b=CCLiIuUas+jHTt0Yv21Alz/sNEyJcyRpveCTVyAhJtH9OIhcD5dEn/UMdySyAoU441
 RX1nLTRBL0IE6UzGE+HK4dDRc7g5u0Cru5elKAXnrVzPovc/KcB69mzEaNI1lYfVcBTk
 /JGOZVbm+lJm031c85X63EIyQ8MfUIOgrJ1KFpB+DNHAP98FagaZcbMbYwlZg6s5VFyP
 zR+3jX9k/KG+lx2cezedHdXecZrPLzAZwKIUYxCUv1HzHp+q/My01fIvKrbSFt68uPsr
 2jt9n5SdD9JvdiVNbg8l3r2B28FCmuVxrygzKQrWifiyamX+x5/ag54EALOYlHmbkB6q
 wkaw==
X-Gm-Message-State: AGi0PuZBlsCQmJMnSQFlOPhB2jJZTD/GyHORkubk/mClmR+AvfKt8RNC
 rKj8KKEeE9Fj6Asf35hWJnrQdcIpepyXmS4PllAvVA==
X-Google-Smtp-Source: APiQypJHsy1ID5UWXbduZedwCawN698UUwnJAsyuBfNBmcx4c7aVWyTBXfSDemrrZVvNV8ztJq5Z7EWAvNiviNgU3nE=
X-Received: by 2002:a5d:91c6:: with SMTP id k6mr18867980ior.13.1589263490440; 
 Mon, 11 May 2020 23:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200511150759.18766-1-brgl@bgdev.pl>
 <20200511150759.18766-6-brgl@bgdev.pl>
 <20200511.134117.1336222619714836904.davem@davemloft.net>
In-Reply-To: <20200511.134117.1336222619714836904.davem@davemloft.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 May 2020 08:04:39 +0200
Message-ID: <CAMRc=MdUCkgCo8UndDbhQRZt_tXJJjtR4uM2g05N5ti7Hw1f2w@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] net: core: provide priv_to_netdev()
To: David Miller <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_230452_449366_1F9822A0 
X-CRM114-Status: GOOD (  13.35  )
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
 devicetree <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

cG9uLiwgMTEgbWFqIDIwMjAgbyAyMjo0MSBEYXZpZCBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5u
ZXQ+IG5hcGlzYcWCKGEpOgo+Cj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rl
di5wbD4KPiBEYXRlOiBNb24sIDExIE1heSAyMDIwIDE3OjA3OjUwICswMjAwCj4KPiA+IEZyb206
IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPgo+ID4g
QXBwcm9wcmlhdGUgYW1vdW50IG9mIGV4dHJhIG1lbW9yeSBmb3IgcHJpdmF0ZSBkYXRhIGlzIGFs
bG9jYXRlZCBhdAo+ID4gdGhlIGVuZCBvZiBzdHJ1Y3QgbmV0X2RldmljZS4gV2UgaGF2ZSBhIGhl
bHBlciAtIG5ldGRldl9wcml2KCkgLSB0aGF0Cj4gPiByZXR1cm5zIGl0cyBhZGRyZXNzIGJ1dCB3
ZSBkb24ndCBoYXZlIHRoZSByZXZlcnNlOiBhIGZ1bmN0aW9uIHdoaWNoCj4gPiBnaXZlbiB0aGUg
YWRkcmVzcyBvZiB0aGUgcHJpdmF0ZSBkYXRhLCByZXR1cm5zIHRoZSBhZGRyZXNzIG9mIHN0cnVj
dAo+ID4gbmV0X2RldmljZS4KPiA+Cj4gPiBUaGlzIGhhcyBjYXVzZWQgbWFueSBkcml2ZXJzIHRv
IHN0b3JlIHRoZSBwb2ludGVyIHRvIG5ldF9kZXZpY2UgaW4KPiA+IHRoZSBwcml2YXRlIGRhdGEg
c3RydWN0dXJlLCB3aGljaCBiYXNpY2FsbHkgbWVhbnMgc3RvcmluZyB0aGUgcG9pbnRlcgo+ID4g
dG8gYSBzdHJ1Y3R1cmUgaW4gdGhpcyB2ZXJ5IHN0cnVjdHVyZS4KPiA+Cj4gPiBUaGlzIHBhdGNo
IHByb3Bvc2VzIHRvIGFkZCBwcml2X3RvX25ldGRldigpIC0gYSBoZWxwZXIgd2hpY2ggY29udmVy
dHMKPiA+IHRoZSBhZGRyZXNzIG9mIHRoZSBwcml2YXRlIGRhdGEgdG8gdGhlIGFkZHJlc3Mgb2Yg
dGhlIGFzc29jaWF0ZWQKPiA+IG5ldF9kZXZpY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFy
dG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KPgo+IFNvcnJ5LCBw
bGVhc2UgZG9uJ3QgZG8gdGhpcy4gIFdlIGhhZCB0aGlzIGFsbW9zdCB0d28gZGVjYWRlcyBhZ28g
YW5kCj4gZXhwbGljaXRseSByZW1vdmVkIGl0IGludGVudGlvbmFsbHkuCj4KPiBTdG9yZSB0aGUg
YmFjayBwb2ludGVyIGluIHlvdXIgc29mdHdhcmUgc3RhdGUganVzdCBsaWtlIGV2ZXJ5b25lIGVs
c2UKPiBkb2VzLgoKSSB3aWxsIGlmIHlvdSBpbnNpc3QgYnV0IHdvdWxkIHlvdSBtaW5kIHNoYXJp
bmcgc29tZSBkZXRhaWxzIG9uIHdoeSBpdAp3YXMgcmVtb3ZlZD8gVG8gbWUgaXQgc3RpbGwgbWFr
ZXMgbW9yZSBzZW5zZSB0aGFuIHN0b3JpbmcgdGhlIHBvaW50ZXIKdG8gYSBzdHJ1Y3R1cmUgaW4g
KnRoYXQqIHN0cnVjdHVyZS4KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
