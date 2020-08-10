Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356D2C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 23:28:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B2E206C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 23:28:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BaSx+1We";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMtC168B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01B2E206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uv9dJkxTrT9fTevnSOHcUB+pRd96bdGv6dTtcZfEhAM=; b=BaSx+1WeF5k8Obign2eqShIW0
	hXUZ8TVdQL133acRpYaa/2c7o1x0Ridx0uTMya5zKJVzfB2rB7psvb9TQ8+/hDfkrTYCdtY9KoEXo
	Zkdp7KOIspH70ST3K+IErYl1SbN4EtJF2cPXEbDjLUcz/KiNsbqzFDadFuLt1y7NhBEBvFzhplcUe
	5HYRCoYMuE60XdgTVjv104i8evbsJWwG+LquCC6HOJA9Mz8/azU5xFnsuoKmsj/TwN3aWignuWyNz
	TQx5VztpN2mP+3m9729dySx3pIktrN1SOgoRpHh9sZpwr2S8W3GamqtnQMVp0EJ0zN2HOOz9fJeHF
	ZEo9ixirQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5HDh-0004Po-OB; Mon, 10 Aug 2020 23:28:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5HDc-0004O9-7L; Mon, 10 Aug 2020 23:28:41 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45DAC20768;
 Mon, 10 Aug 2020 23:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597102119;
 bh=z0r+lCZYPiccixe3QpsKbupOQvldS1z/zwKsOkfGnbY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tMtC168Bnm85aHCmeS+xFlUQehFiZbUw8MhBWzmR+rX9oXkBTJ9+6sjcAGUs/ol6B
 VuYqe1fumGkUlr+mxa3T/EuBk1y2t1nTxpQvBKSzP90oJ3cNI5r3pdhOO61Z0m5ri8
 b1WJ4rR5P8XSyYq0Q+bD2m2pLDXcvF8KQ7/6ZfEM=
Received: by mail-ed1-f50.google.com with SMTP id q4so7642114edv.13;
 Mon, 10 Aug 2020 16:28:39 -0700 (PDT)
X-Gm-Message-State: AOAM531Ob+W9DimJmS6swPYwTNB/umx9YnGkCE15m+fNnv2JUUiJDq66
 wo+4XN076Zxsx6wjHExMB4ynXdVQJoIplxUIew==
X-Google-Smtp-Source: ABdhPJxj39TNRd8PZmBPNLHQXvrBc9ZMP5IPGhmxFpa1bdCoTDN9dM+s7gqXWNb3Zrxm/Il68M8rnUnavB35d/xb8W8=
X-Received: by 2002:a50:d80b:: with SMTP id o11mr1986679edj.148.1597102117741; 
 Mon, 10 Aug 2020 16:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
In-Reply-To: <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 11 Aug 2020 07:28:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4Qs93EMjrpK_jW4NsxyZf7w3RHa7vDSRecea_JwAxKw@mail.gmail.com>
Message-ID: <CAAOTY__4Qs93EMjrpK_jW4NsxyZf7w3RHa7vDSRecea_JwAxKw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to
 mt7623n.dtsi
To: David Woodhouse <dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_192840_406501_05F8EF8D 
X-CRM114-Status: GOOD (  25.24  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, Ryder Lee <ryder.lee@mediatek.com>,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIERhdmlkOgoKRGF2aWQgV29vZGhvdXNlIDxkd213MkBpbmZyYWRlYWQub3JnPiDmlrwgMjAy
MOW5tDjmnIgxMOaXpSDpgLHkuIAg5LiL5Y2IMzo0OOWvq+mBk++8mgo+Cj4gT24gU3VuLCAyMDIw
LTA4LTA5IGF0IDA4OjE2ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSSB3b3VsZCBs
aWtlIHRvIHB1dCBhbGwgZGV2aWNlIGluIG10NzYyMy5kdHNpIHdpdGggc29tZSBkZXZpY2Uncwo+
ID4gc3RhdHVzIGlzICJkaXNhYmxlZCIgYW5kIGNoYW5nZSBpdHMgc3RhdHVzIGluIHBsYXRmb3Jt
IGR0c2kuCj4gPiBJIHdvdWxkIGxpa2UgdG8gc2VlIGFsbCBkZXZpY2UgaW4gbXQ3NjIzLmR0c2kg
YmVjYXVzZSBvZiBpdHMgbmFtZS4gSWYKPiA+IHlvdSBtb3ZlIHNvbWUgZGV2aWNlIHRvIHBsYXRm
b3JtIGR0c2ksIHdlIHdvdWxkIHRyYWNlIGFsbCBwbGF0Zm9ybQo+ID4gZHRzaSB0byBmaW5kIG91
dCBob3cgbWFueSBkZXZpY2UgaW4gbXQ3NjIzLiBPbmUgZGF5IGEgbmV3IHBsYXRmb3JtCj4gPiBl
bmFibGUgZGlmZmVyZW50IGRldmljZXMsIHlvdSB3b3VsZCByZW9yZ2FuaXplIGFsbCB0aGVzZSBw
bGF0Zm9ybQo+ID4gZHRzaT8KPgo+IE5vLCB0aGlzIGlzbid0ICJwbGF0Zm9ybSBkdHNpIiwgc3Vy
ZWx5PyBUaGlzIGlzIG10NzYyM2EgYW5kIG10NzYyM24KPiBkdHNpIGZvciB0aGUgdHdvIGRpZmZl
cmVudCBTb0NzLCBhbmQgcGxhdGZvcm1zIHRoZW4ganVzdCBpbmNsdWRlCj4gbXQ3NjIzYS5kdHNp
IG9yIG10NzYyM24uZHRzaSBhcyBhcHByb3ByaWF0ZSBmb3IgdGhlIFNvQyB0aGV5IGFyZSB1c2lu
Zy4KPgo+IElmIHlvdSByZWFsbHkgd2FudCAqYWxsKiB0aGUgbm9kZXMgZm9yIGJvdGggTVQ3NjIz
QSBhbmQgTVQ3NjIzTiBjaGlwcwo+IGluIGEgc2luZ2xlIG10NzYyMy5kdHNpIGJ1dCBkaXNhYmxl
ZCwgY291bGQgd2Ugc3RpbGwgaGF2ZSBtdDc2MjNhLmR0c2kKPiBhbmQgbXQ3NjIzbi5kdHNpIGZv
ciB0aGUgY2hpcHMsIGVuYWJsaW5nIHRoZSBub2RlcyB0aGF0IGFyZSBvbmx5LWZvci1BCj4gb3Ig
b25seS1mb3ItTiwgc28gdGhhdCBlYWNoIHBsYXRmb3JtIGRvZXNuJ3QgaGF2ZSB0byBkbyB0aGF0
IGZvcgo+IGl0c2VsZj8KPgo+IEFsdGhvdWdoIHB1dHRpbmcgdGhvc2Ugbm9kZXMgdGhhdCBleGlz
dCBvbmx5IGluIG9uZSBjaGlwIG9yIHRoZSBvdGhlcgo+IGRpcmVjdGx5IGludG8gdGhlIG10NzYy
M1thbl0uZHRzaSBzdGlsbCBzZWVtcyB0byBtYWtlIG1vcmUgc2Vuc2UgdG8KPiBtZS4KClNvcnJ5
IEkgZG9lcyBub3Qgbm90aWNlIHRoYXQgbXQ3NjIzYSBhbmQgbXQ3NjIzbiBhcmUgZGlmZmVyZW50
IFNvQy4KQmVjYXVzZSB0aGV5IGFyZSBkaWZmZXJlbnQgU29DLCBJIHRoaW5rIHRoZSBmaXJzdCBz
dGVwIGlzIHRvIHVwc3RyZWFtCm10NzYyM2EuZHRzaSBhbmQgbXQ3NjIzbi5kdHNpIGluZGVwZW5k
ZW50bHkuIFRoYXQgbWVhbnMgaW4gZWFjaCBkdHNpLAppdCBpbmNsdWRlIGFsbCBkZXZpY2VzIG9m
IGl0cyBTb0MuIEFmdGVyIGJvdGggZHRzaSBpcyB1cHN0ZWFtZWQsIHdlCmNvdWxkIGZpbmQgb3V0
IHdoYXQgaXMgdGhlIGNvbW1vbiBwYXJ0LCB0aGVuIHdlIGNyZWF0ZSBhIGNvbW1vbiBkdHNpCnRo
ZXNlIHR3byBTb0MsIGZvciBleGFtcGxlIG10NzYyM2FfbXQ3NjIzbl9jb21tb24uZHRzaS4gKE1h
eWJlIHRoZXJlCmlzIGEgU29DJ3MgbmFtZSBpcyBleGFjdGx5ICdtdDc2MjMnLCBzbyBJIHByZWZl
ciBtdDc2MjMuZHRzaSBpcwpyZXNlcnZlZCBmb3IgdGhhdCBTb0MsIGFuZCBtdDc2MjNfY29tbW9u
LmR0c2kgaXMgbm90IHByZWZlcnJlZCBiZWNhdXNlCkkgZG9uJ3Qga25vdyB0aGVyZSBhcmUgaG93
IG1hbnkgbXQ3NjIzIGZhbWlseSBTb0MgYW5kCm10NzYyM19jb21tb24uZHRzaSBzaG91bGQgYmUg
dXNlIGZvciBhbGwgbXQ3NjIzIGZhbWlseSkKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
