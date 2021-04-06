Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E36C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:15:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87100613C2
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 16:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87100613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVcgpcexZwQIYIAtIZJ65PqOyHqu7XaEFomEAkmlVnk=; b=WjLb4R8iRD5O2iS+d2fB+PUZT
	lR/enqjcphR0I0agxGw4Z7FkfIJ+c+EhZ4iaEqy6oUaP9BuMJJRH5DURrxt4xjyRcCk/GOTSfi4iZ
	xHWNT554UIprMnmp6lljFj+V5ljcB5vXqaISVwxEBbCbOsKK2SEOuJgD0FIuuLAtlCA15ZDKRgV+U
	kHMh4StJiyZ0KfVa0SOaOpSJrttdNfZN8qaBh4mP9Rw07Vh5AeCo4OiFa4LjBPxfShygf1wH+P2bM
	AU0cuS8bi4fmVjUE9qPQhhJDiQ2aookWuXE0a1bIk2EHn6ThjdSSWoP7y+gRlexXB0gok0+TH1mZX
	8XYQAZeBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lToLx-002z5p-PM; Tue, 06 Apr 2021 16:14:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lToLt-002z5E-Np
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 16:14:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DE34613CB
 for <linux-mediatek@lists.infradead.org>; Tue,  6 Apr 2021 16:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617725692;
 bh=e7fZVz6b0FMgjgCkbnNmNXBn1MD/C6gNDZ3usE0y5hc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=USE73gN/6PJf5bTwmAe+aEqN6RlKtxqQvoAKsF4cnQbuDuqs74aFV4L67qwrB1B1f
 ASAuseMeo2vKHBrzGPD5ZkjbM2PZKOgQpY5IdRvPAlgU6nHf253ygstru7Mn1kiE5u
 sUtwZxrU2QzHAcL6oaxTFfijDRsnFie0Lz8q1+efl0E+feU+vxKqM3+SHecqAXcS83
 dhDlDZUi/LxctuCNKHqqD49sBmCYAw4LkrS+WWpRGld39qSWcgzUtk196LKQc5etVQ
 PXsKhshbW02RyTa8jaoBIiQByJBgvRJcZ+nPQwDpvtC+tvBvJEIwOEhL45ssbdlo/a
 xD1V7eSe6r45w==
Received: by mail-ej1-f42.google.com with SMTP id ap14so22918114ejc.0
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 09:14:52 -0700 (PDT)
X-Gm-Message-State: AOAM531+c56SlvCYJ1AtkhawGAEO3K2eRNcM0zZGY2lTXH4Z4ioqP5f7
 PDBdyxeWryuK9wU+gMZy2ZFecQPffTg28xzhFA==
X-Google-Smtp-Source: ABdhPJxus3vaJlBolyIDnwHcY8HUfh+bhu44dUc1lwfkvNdASWzEwWAgbEIKh7zaUEUIwYwhnk1eltD52lV6wsnPcD0=
X-Received: by 2002:a17:906:490e:: with SMTP id
 b14mr6498315ejq.303.1617725690674; 
 Tue, 06 Apr 2021 09:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210406141819.1025864-1-dqfext@gmail.com>
 <20210406141819.1025864-2-dqfext@gmail.com>
 <CAAOTY_8snSTcguhyB9PJBWydqNaWZL3V4zXiYULVp5n48fN24w@mail.gmail.com>
 <YGyGFOrXwEsqCW/z@lunn.ch>
In-Reply-To: <YGyGFOrXwEsqCW/z@lunn.ch>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Apr 2021 00:14:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9feP7bBFJFVBWzNbnAK7xZQFLZJ=viFFncyS55JghP9A@mail.gmail.com>
Message-ID: <CAAOTY_9feP7bBFJFVBWzNbnAK7xZQFLZJ=viFFncyS55JghP9A@mail.gmail.com>
Subject: Re: [RFC net-next 1/4] net: phy: add MediaTek PHY driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DENG Qingfang <dqfext@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-staging@lists.linux.dev, 
 DTML <devicetree@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
 Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_171454_158304_62307CDF 
X-CRM114-Status: GOOD (  21.32  )
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

QW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPiDmlrwgMjAyMeW5tDTmnIg35pelIOmAseS4iSDk
uIrljYgxMjowMuWvq+mBk++8mgo+Cj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMTE6NDc6MDhQ
TSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+IEhpLCBRaW5nZmFuZzoKPiA+Cj4gPiBE
RU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPiDmlrwgMjAyMeW5tDTmnIg25pelIOmAseS6
jCDkuIvljYgxMDoxOeWvq+mBk++8mgo+ID4gPgo+ID4gPiBBZGQgc3VwcG9ydCBmb3IgTWVkaWFU
ZWsgUEhZcyBmb3VuZCBpbiBNVDc1MzAgYW5kIE1UNzUzMSBzd2l0Y2hlcy4KPiA+ID4gVGhlIGlu
aXRpYWxpemF0aW9uIHByb2NlZHVyZSBpcyBmcm9tIHRoZSB2ZW5kb3IgZHJpdmVyLCBidXQgZHVl
IHRvIGxhY2sKPiA+ID4gb2YgZG9jdW1lbnRhdGlvbiwgdGhlIGZ1bmN0aW9uIG9mIHNvbWUgcmVn
aXN0ZXIgdmFsdWVzIHJlbWFpbnMgdW5rbm93bi4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTog
REVORyBRaW5nZmFuZyA8ZHFmZXh0QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJz
L25ldC9waHkvS2NvbmZpZyAgICB8ICAgNSArKwo+ID4gPiAgZHJpdmVycy9uZXQvcGh5L01ha2Vm
aWxlICAgfCAgIDEgKwo+ID4gPiAgZHJpdmVycy9uZXQvcGh5L21lZGlhdGVrLmMgfCAxMDkgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCAxMTUgaW5zZXJ0aW9ucygrKQo+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbmV0
L3BoeS9tZWRpYXRlay5jCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9waHkv
S2NvbmZpZyBiL2RyaXZlcnMvbmV0L3BoeS9LY29uZmlnCj4gPiA+IGluZGV4IGE2MTViMzY2MGIw
NS4uZWRkODU4Y2VjOWVjIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL25ldC9waHkvS2NvbmZp
Zwo+ID4gPiArKysgYi9kcml2ZXJzL25ldC9waHkvS2NvbmZpZwo+ID4gPiBAQCAtMjA3LDYgKzIw
NywxMSBAQCBjb25maWcgTUFSVkVMTF84OFgyMjIyX1BIWQo+ID4gPiAgICAgICAgICAgU3VwcG9y
dCBmb3IgdGhlIE1hcnZlbGwgODhYMjIyMiBEdWFsLXBvcnQgTXVsdGktc3BlZWQgRXRoZXJuZXQK
PiA+ID4gICAgICAgICAgIFRyYW5zY2VpdmVyLgo+ID4gPgo+ID4gPiArY29uZmlnIE1FRElBVEVL
X1BIWQo+ID4KPiA+IFRoZXJlIGFyZSBtYW55IE1lZGlhdGVrIHBoeSBkcml2ZXJzIGluIFsxXSwg
c28gdXNlIGEgc3BlY2lmaWMgbmFtZS4KPgo+IFRob3NlIGFyZSBnZW5lcmljIFBIWSBkcml2ZXJz
LCB3aGVyZSBhcyB0aGlzIHBhdGNoIGlzIGFkZCBhIFBIWQo+IGRyaXZlci4gVGhlIG5hbWluZyB1
c2VkIGluIHRoaXMgcGF0Y2ggaXMgY29uc2lzdGVudCB3aXRoIG90aGVyIFBIWQo+IGRyaXZlcnMu
IFNvIGknbSBoYXBweSB3aXRoIHRoaXMgcGF0Y2ggaW4gdGhpcyByZXNwZWN0Lgo+Cj4gUEhZIGRy
aXZlcnMgaGF2ZSBiZWVuIGFyb3VuZCBhIGxvdCBsb25nZXIgdGhhbiBnZW5lcmljIFBIWSBkcml2
ZXJzLiBTbwo+IGkgd291bGQgYWN0dWFsbHkgc2F5IHRoZSBnZW5lcmljIFBIWSBkcml2ZXIgbmFt
aW5nIHNob3VsZCBtYWtlIGl0Cj4gY2xlYXIgdGhleSBhcmUgZ2VuZXJpYyBQSFlzLCBub3QgUEhZ
cy4KPgoKT0ssIHNvIGp1c3QgaWdub3JlIG15IGNvbW1lbnQuCgo+IEJ1dCBsZXRzIG5vdCBiaWtl
IHNoZWQgYWJvdXQgdGhpcyB0b28gbXVjaC4KPgo+ICAgICAgIEFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
