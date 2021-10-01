Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36277C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 16:17:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87AF6187D
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 16:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D87AF6187D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0H/eDcuV6Xe3sHwK/tkuFSTC/pneyn3VjiIeK5HRkcA=; b=YwdDh/FxwOaQhJ
	ACvtSkhQNzxw5+DjAjZsx0t1djC40UOczUlSCdoMQe01BSVAESV6P4QfWYPu6OTe8njRc/26W7uIr
	lUL1AqMfWyCLysdt2zmE4jIrW5HR+NxtkBkstzoVf3r9iRyTer7wz9UWS5cmeCKzaARIY44MyK1f5
	rEOdGxYtrOYrV6vNZkhXSLTKV8s/oDvQUDCF7lale6tsItIMoD+u62BBCFcYDYe8QmTvgSYrM2FK9
	nV/gD95gPk8XJQ93AQbP5qYlnkum3UonZMJqyP9dpyGnRQmAwsbUWBrwgRzTLKhTaNV0sRlEt26w1
	eTDaAlpoQZKUyKXc1qhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWLDP-000pPf-Tl; Fri, 01 Oct 2021 16:16:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWLDE-000pO6-0C; Fri, 01 Oct 2021 16:16:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94E1D6124C;
 Fri,  1 Oct 2021 16:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633104999;
 bh=y6gzPCzFEYqWjJJZ50x5Nvv9YaW/g8C/t7SEwVGfOeo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=trYKk9gJNFlmMZdp9wMbstUchEx7/VTBLfc54MLKNyXHa1JseLdjG31uXRKInyyNO
 oHjbsvCADt84QEWX4ih/X8ZCn3mNgtXgKlsU/xgfOlca3BpVnbgAibm4huKkI3F/UZ
 YSeIdfdx07PZsG5MJaL3JZoGT1S4pBImVcZe+MkORMZKaQzGco+CfyHfCWQqkrS5La
 otvP+Ilij1PgX/yrB/AWfC+38s3FKeMFva1ytYDWibQa08AtdgmwtdBMhe0PNs7h55
 THfqJMnIMgaNEL93KFg1ksY7UY9+CJ5YWNYJ6vftJRJhFLlm9KvlNPnvxCyXEw0TBa
 YrS0yaVEHGNGg==
Received: by mail-ed1-f49.google.com with SMTP id b8so2133612edk.2;
 Fri, 01 Oct 2021 09:16:39 -0700 (PDT)
X-Gm-Message-State: AOAM531NXRn1WbuETr6huQ+8CVo/OeYxCXXRSYxzjxJvB/TQfC+z8uNL
 KX5WUQKWonLC9RgEcJgigBp/Xp4z6t/vVPxmuw==
X-Google-Smtp-Source: ABdhPJyAcVVeRZ5bgKNb/3DzdkplX2GlSIaFLY0Nq7ZaQMn1jHN3Guv20jQFVddPTQdYdEjMDfZCWZ8HPwg2W8djkZM=
X-Received: by 2002:a05:6402:40c5:: with SMTP id
 z5mr12424387edb.272.1633104997391; 
 Fri, 01 Oct 2021 09:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211001094443.2770169-1-msp@baylibre.com>
 <20211001094443.2770169-7-msp@baylibre.com>
In-Reply-To: <20211001094443.2770169-7-msp@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 2 Oct 2021 00:16:26 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com>
Message-ID: <CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/mediatek: Add mt8195 DisplayPort driver
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_091640_093633_4A95AAA5 
X-CRM114-Status: GOOD (  23.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hcmt1czoKCk1hcmt1cyBTY2huZWlkZXItUGFyZ21hbm4gPG1zcEBiYXlsaWJyZS5jb20+
IOaWvCAyMDIx5bm0MTDmnIgx5pelIOmAseS6lCDkuIvljYg1OjQ05a+r6YGT77yaCj4KPiBUaGlz
IHBhdGNoIGFkZHMgYSBEaXNwbGF5UG9ydCBkcml2ZXIgZm9yIHRoZSBNZWRpYXRlayBtdDgxOTUg
U29DIGFuZCBhCj4gYWNjb3JkaW5nIHBoeSBkcml2ZXIgbWVkaWF0ZWstZHAtcGh5Lgo+Cj4gSXQg
c3VwcG9ydHMgYm90aCBmdW5jdGlvbmFsIHVuaXRzIG9uIHRoZSBtdDgxOTUsIHRoZSBlbWJlZGRl
ZAo+IERpc3BsYXlQb3J0IGFzIHdlbGwgYXMgdGhlIGV4dGVybmFsIERpc3BsYXlQb3J0IHVuaXRz
LiBJdCBvZmZlcnMKPiBob3QtcGx1Zy1kZXRlY3Rpb24sIGF1ZGlvIHVwIHRvIDggY2hhbm5lbHMs
IGFuZCBEaXNwbGF5UG9ydCAxLjQgd2l0aCB1cAo+IHRvIDQgbGFuZXMuCj4KPiBUaGUgZHJpdmVy
IGNyZWF0ZXMgYSBjaGlsZCBkZXZpY2UgZm9yIHRoZSBwaHkuIFRoZSBjaGlsZCBkZXZpY2Ugd2ls
bAo+IG5ldmVyIGV4aXN0IHdpdGhvdXQgdGhlIHBhcmVudCBiZWluZyBhY3RpdmUuIEFzIHRoZXkg
YXJlIHNoYXJpbmcgYQo+IHJlZ2lzdGVyIHJhbmdlLCB0aGUgcGFyZW50IHBhc3NlcyBhIHJlZ21h
cCBwb2ludGVyIHRvIHRoZSBjaGlsZCBzbyB0aGF0Cj4gYm90aCBjYW4gd29yayB3aXRoIHRoZSBz
YW1lIHJlZ2lzdGVyIHJhbmdlLiBUaGUgcGh5IGRyaXZlciBzZXRzIGRldmljZQo+IGRhdGEgdGhh
dCBpcyByZWFkIGJ5IHRoZSBwYXJlbnQgdG8gZ2V0IHRoZSBwaHkgZGV2aWNlIHRoYXQgY2FuIGJl
IHVzZWQKPiB0byBjb250cm9sIHRoZSBwaHkgcHJvcGVydGllcy4KPgo+IFRoaXMgZHJpdmVyIGlz
IGJhc2VkIG9uIGFuIGluaXRpYWwgdmVyc2lvbiBieQo+IEphc29uLUpILkxpbiA8amFzb24tamgu
bGluQG1lZGlhdGVrLmNvbT4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgU2NobmVpZGVyLVBh
cmdtYW5uIDxtc3BAYmF5bGlicmUuY29tPgo+IC0tLQo+Cj4gTm90ZXM6Cj4gICAgIENoYW5nZXMg
djIgLT4gdjM6Cj4gICAgIC0gU29sdmUgVE9ET3MgYW5kIGFkZCBkZWZpbmVzIGZvciB1bmRlc2Ny
aWJlZCByZWdpc3RlcnMKPiAgICAgLSBSZW1vdmUgVE9ET3MgdGhhdCB3ZXJlIGlycmVsZXZhbnQK
Pgo+ICAgICBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgICAtIEZpeCBjaGVja3BhdGNoIC0tc3RyaWN0
IHN1Z2dlc3Rpb25zCj4gICAgIC0gR2VuZXJhbCBjbGVhbnVwcyBvZiB0aGUgY29kZS4KPiAgICAg
LSBSZW1vdmUgYWxsIHJlbWFpbmluZyBub24tYXRvbWljIGZ1bmN0aW9ucy4KPiAgICAgLSBSZW1v
dmUgdW51c2VkIGluY2x1ZGVzIGFuZCBzb3J0IHRoZW0uCj4gICAgIC0gUmVtb3ZlIHVudXNlZCBz
ZWxlY3QgR0VORVJJQ19QSFkKPiAgICAgLSBSZW5hbWUgcGh5IHJlZ2lzdGVycyBEUF9QSFkgLT4g
TVRLX0RQX1BIWQo+ICAgICAtIFJlcGxhY2UgdXNhZ2Ugb2YgZGVsYXlzIHdpdGggdXNsZWVwX3Jh
bmdlLgo+ICAgICAtIFNwbGl0IHRoZSBwaHkgcmVnaXN0ZXIgYWNjZXNzZXMgaW50byBhIHNlcGFy
YXRlIHBoeSBkcml2ZXIuCj4gICAgIC0gVXNlIGEgbG9jayB0byBndWFyZCBhY2Nlc3MgdG8gbXRr
X2RwLT5lZGlkIGFzIGl0IGNhbiBiZSBhbGxvY2F0ZWQvdXNlZC9mcmVlZAo+ICAgICAgIGluIGRp
ZmZlcmVudCB0aHJlYWRzCj4gICAgIC0gdXNlIHN0cnVjdCBkcF9zZHAgZm9yIHNkcCBwYWNrZXRz
Lgo+Cj4gICAgIENoYW5nZXMgUkZDIC0+IHYxOgo+ICAgICAtIFJlbW92ZWQgdW51c2VkIHJlZ2lz
dGVyIGRlZmluaXRpb25zLgo+ICAgICAtIFJlcGxhY2VkIHdvcmtxdWV1ZSB3aXRoIHRocmVhZGVk
IGlycS4KPiAgICAgLSBSZW1vdmVkIGNvbm5lY3RvciBjb2RlLgo+ICAgICAtIE1vdmUgdG8gYXRv
bWljXyogZHJtIGZ1bmN0aW9ucy4KPiAgICAgLSBHZW5lcmFsIGNsZWFudXBzIG9mIHRoZSBjb2Rl
Lgo+ICAgICAtIFJlbW92ZSB1bnVzZWQgc2VsZWN0IEdFTkVSSUNfUEhZLgo+Cj4gIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9LY29uZmlnICAgICAgIHwgICAgNyArCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9NYWtlZmlsZSAgICAgIHwgICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHAuYyAgICAgIHwgMjgyNSArKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9yZWcuaCAgfCAgNTM1ICsrKysrCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIHwgICAgMSArCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oIHwgICAgMSArCj4gIGRyaXZlcnMvcGh5L21lZGlh
dGVrL0tjb25maWcgICAgICAgICAgIHwgICAgOCArCj4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL01h
a2VmaWxlICAgICAgICAgIHwgICAgMSArCj4gIGRyaXZlcnMvcGh5L21lZGlhdGVrL3BoeS1tdGst
ZHAuYyAgICAgIHwgIDIxOCArKwoKU2VwYXJhdGUgdGhlIHBoeSBkcml2ZXIgdG8gYW5vdGhlciBw
YXRjaCBiZWNhdXNlIHBoeSBkcml2ZXIgd291bGQgZ28KaW50byBkaWZmZXJlbnQgbWFpbnRhaW5l
cidzIHRyZWUuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiAgaW5jbHVkZS9saW51eC9zb2MvbWVk
aWF0ZWsvbXRrLW1tc3lzLmggfCAgICAyICsKPiAgMTAgZmlsZXMgY2hhbmdlZCwgMzYwMCBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBfcmVnLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvcGh5L21lZGlhdGVrL3Bo
eS1tdGstZHAuYwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
