Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D45C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 18:57:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BBB420853
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 18:57:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s9OLskA5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2D+EipK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BBB420853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vgEtIv7ppKFuQyz3l7F3S0FQpWjVKN3/vtrGcUS4r8g=; b=s9OLskA5k4IQabzPqLrPJiFnG
	CSPMjot6JX6QN/VmCJCRboZWFJLSYpsoNEYD63Ml51cM4UGs5ZGEU1ywXzSq44QMvAEa+Xt6PmpsN
	zxrjAa7qqeQmv9EqaBWsYM7RaP75r7tRZdKpMYqvD4jvlwn/AnjB6z8OiwHbJS+irBbV3iS3IKKzG
	qW0bANB24rOMz1zKXxKNHywBbY2jR/98DpNo1eWTQMMXFn0XK3PMVkMiINFsszxbthZ1Sy2s0bQYI
	o5mLWgURoUCDLh3OBynDIt5y5WOfvheJo7sCFNb0qej/ls4FBPC84BIk0czJodmxlKab1UkpyenuP
	cMjhTS5fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPVg4-0005J3-2A; Mon, 05 Oct 2020 18:57:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPVfx-0005HP-0S; Mon, 05 Oct 2020 18:57:36 +0000
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B8CD20853;
 Mon,  5 Oct 2020 18:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601924252;
 bh=5sBlf2EPxcY+i8bwPmBW/rVdcSRu5idEAY1UAVMD3lY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=I2D+EipKP0omGz0Ld3Luie8tPjs8y+9S4HKFn4ya6Q50+mBz4Dq9HHdE9LRbCy1Kb
 bd1O09H814/GO7oBRkovr7Ha3bbtMVhuAJn6k7VJiySYzrXjLC0oxygyLdqK4btkh7
 keddtmnyNEIwAo8gg0gqcRkxXyEf8Cdgx4Cvlz9w=
Received: by mail-oi1-f181.google.com with SMTP id u17so3585827oie.3;
 Mon, 05 Oct 2020 11:57:32 -0700 (PDT)
X-Gm-Message-State: AOAM531tlUaNqiKceq9r6KJxdiDxN+K3KapAABRnuGElELWi3Ri0OONF
 sfP2/VF5teGXyqfN/w9iwG75vXqAtBXSE58vOg==
X-Google-Smtp-Source: ABdhPJyXdcSo2Li4laYJlNMKjj8n6wrlDkVCgB3+NRhqSkW2Z9SImOMNHT5VmWucvZaU5k4QlTl/x8x+pbU+t/xixj8=
X-Received: by 2002:a54:4f89:: with SMTP id g9mr492047oiy.106.1601924251431;
 Mon, 05 Oct 2020 11:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201004055024.23542-1-phil.chang@mediatek.com>
 <CAAOTY_8vCb-adkbpdmbTWLeOFt-+dHjr4HVonHX7XPkLkzy1yA@mail.gmail.com>
 <1601918237.17256.3.camel@mtksdccf07>
In-Reply-To: <1601918237.17256.3.camel@mtksdccf07>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Oct 2020 13:57:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJQcWsguwfehAoaRf4o-2VqXxSzKzTqg7s4+N1bp=6V5Q@mail.gmail.com>
Message-ID: <CAL_JsqJQcWsguwfehAoaRf4o-2VqXxSzKzTqg7s4+N1bp=6V5Q@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] of_reserved_mem: Increase the number of reserved
 regions
To: Phil Chang <phil.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_145733_194040_57F850F0 
X-CRM114-Status: GOOD (  29.54  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Alix Wu <alix.wu@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, YJ Chiang <yj.chiang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Joe Liu <joe.liu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBPY3QgNSwgMjAyMCBhdCAxMjoxNyBQTSBQaGlsIENoYW5nIDxwaGlsLmNoYW5nQG1l
ZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBIaSBDaHVuLUt1YW5nCgpQbGVhc2UgZG9uJ3QgdG9wIHBv
c3QgdG8gdGhlIGxpc3RzLgoKPiBTb3JyeSBmb3IgdHlwby4gSW4gZmFjdCwgdGhlIGR0cyBvZiBu
ZXcgU29DIGlzIG5vdCB1cHN0cmVhbSB5ZXQuIEknbSBzbwo+IHNvcnJ5IGZvciBjb3VsZG4ndCBz
aG93IHRoZSBkZXRhaWwgbm93LgoKRG9uJ3QgaGF2ZSB0byBoYXZlIHRoZSBkdHMgdXBzdHJlYW0u
IENhbiB5b3UgcG9pbnQgdG8gYSBkb3duc3RyZWFtIGR0cwpvciBwb3N0IGEgc25pcHBldCBvZiB0
aGUgcmVzZXJ2ZWQgbWVtb3J5PwoKPiBIb3cgYWJvdXQgdGhlIGNvbmZpZ3VyYWJsZSBNQVhfUkVT
RVJWRURfUkVHSU9OUyBzaXplIGxpa2UgdGhpcyBwYXRjaD8KPiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzEwNjkyMTAxLwoKTm8sIGFzIEkgYWxyZWFkeSBzYWlkIGluIHRoYXQg
cGF0Y2guIEJ1dCBnbGFkIHlvdSBmb3VuZCB3aGF0J3MgbmVlZGVkCnRvIG1ha2UgaXQgZHluYW1p
Yy4gQnV0IGV2ZW4gZm9yIGR5bmFtaWMsIEkgd2FudCB0byB1bmRlcnN0YW5kIHRoZQp1c2UuCgpS
b2IKCj4KPgo+IE9uIFN1biwgMjAyMC0xMC0wNCBhdCAyMTowNSArMDgwMCwgQ2h1bi1LdWFuZyBI
dSB3cm90ZToKPiA+IEhpLCBQaGlsOgo+ID4KPiA+IFBoaWwgQ2hhbmcgPHBoaWwuY2hhbmdAbWVk
aWF0ZWsuY29tPiDmlrwgMjAyMOW5tDEw5pyINOaXpSDpgLHml6Ug5LiL5Y2IMTo1MeWvq+mBk++8
mgo+ID4gPgo+ID4gPiBDZXJ0YWluIFNvQ3MgbmVlZCB0byBzdXBwb3J0IGxhcmdlIGFtb3VudCBv
ZiByZXNlcnZlZCBtZW1vcnkKPiA+ID4gcmVnaW9ucywgZXNwZWNpYWxseSB0byBmb2xsb3cgdGhl
IEdLSSBydWxlcyBmcm9tIEdvb2dsZS4KPiA+ID4gSW4gTVRLIG5ldyBTb0MgcmVxdWlyZXMgbW9y
ZSB0aGFuIDY4IHJlZ2lvbnMgb2YgcmVzZXJ2ZWQgbWVtb3J5Cj4gPiA+IGZvciBlYWNoIElQJ3Mg
dXNhZ2UsIHN1Y2ggYXMgbG9hZCBmaXJtd2FyZSB0byBzcGVjaWZpYyBzYXBjZSwKPiA+Cj4gPiBz
cGFjZQo+ID4KPiA+ID4gc28gdGhhdCBuZWVkIHRvIHJlc2VydmUgbW9yZSByZWdpc2lvbnMKPiA+
Cj4gPiByZWdpb25zLgo+ID4KPiA+IEkgZ3Vlc3MgdGhpcyByZXF1aXJlbWVudCBpcyBmcm9tIE1l
ZGlhdGVrIFNvQywgYnV0IEkgZmluZCBiZWxvdyBkZXZpY2UKPiA+IHRyZWUgYW5kIGp1c3QgZmlu
ZCBvbmUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbiwKPiA+Cj4gPiBhcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210NzYyMi5kdHNpCj4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE3My5kdHNpCj4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODUxNi5kdHNpCj4g
Pgo+ID4gQ291bGQgeW91IHNob3cgbWUgdGhlIDY4IHJlZ2lvbnM/Cj4gPgo+ID4gUmVnYXJkcywK
PiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2UgTGl1IDxq
b2UubGl1QG1lZGlhdGVrLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogWUogQ2hpYW5nIDx5ai5j
aGlhbmdAbWVkaWF0ZWsuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbGl4IFd1IDxhbGl4Lnd1
QG1lZGlhdGVrLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBDaGFuZyA8cGhpbC5jaGFu
Z0BtZWRpYXRlay5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9t
ZW0uYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9t
ZW0uYyBiL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKPiA+ID4gaW5kZXggNDZiOTM3MWM4
YTMzLi41OTVmMDc0MWRjZWYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2
ZWRfbWVtLmMKPiA+ID4gKysrIGIvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0uYwo+ID4gPiBA
QCAtMjIsNyArMjIsNyBAQAo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiA+ID4gICNp
bmNsdWRlIDxsaW51eC9tZW1ibG9jay5oPgo+ID4gPgo+ID4gPiAtI2RlZmluZSBNQVhfUkVTRVJW
RURfUkVHSU9OUyAgIDY0Cj4gPiA+ICsjZGVmaW5lIE1BWF9SRVNFUlZFRF9SRUdJT05TICAgMTI4
Cj4gPiA+ICBzdGF0aWMgc3RydWN0IHJlc2VydmVkX21lbSByZXNlcnZlZF9tZW1bTUFYX1JFU0VS
VkVEX1JFR0lPTlNdOwo+ID4gPiAgc3RhdGljIGludCByZXNlcnZlZF9tZW1fY291bnQ7Cj4gPiA+
Cj4gPiA+IC0tCj4gPiA+IDIuMTguMAo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+ID4gPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiA+
ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
