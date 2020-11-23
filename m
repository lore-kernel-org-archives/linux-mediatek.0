Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1ED3C5519F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:20:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6211F212CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 03:20:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sitV80xH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEv9koOs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6211F212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PjnU0TLLlLJ21I0GL/L9qWOjLiN2hWteXk9aZO/Gr+4=; b=sitV80xH0h0iVmSABwHSAWTfK
	Ul/H4jqjSLB2xqqrBueGlIa7dWXJgGfn0REyIMQ2d2lJyTL3NzJbdOyo7dD9DhYUaas52fyCfMHEH
	9BXKodr0QpBVIZmTI4YarU5WAUDEEbCDsL6rfErazx9Su8XiT5RGqVRxLEVzgpd4K8lr0ZxYB1iSk
	P+/tZkm9I2luIAAbnmbk65LkHItgeiEYzBUzOIgLuoR6UPv2hlIzQJvvtx/0CgpMeZJg0914W4DUX
	nQdfv7g5zKyci1gcrAP+Law/nMtijx0Fn0mGZS7RLwhaDjMralzwmyF1Tel25Uq8bDyKRZd3FHFSc
	vvfQdX/9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh2Os-00084w-TY; Mon, 23 Nov 2020 03:20:22 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh2On-00084D-SG; Mon, 23 Nov 2020 03:20:18 +0000
Received: by mail-ot1-x341.google.com with SMTP id l36so14660319ota.4;
 Sun, 22 Nov 2020 19:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rmUZ/LefwZKjwq5aooyNQE4MC8myDjdpN3Ckl6d1zcs=;
 b=oEv9koOsTJ2WOd46od2F9FFUSIWNHZbckGQwAdsWs4zZMift70bSlIYBmW6NcPSNFI
 XpztoiWYbYV4m3jqG/OSoeB49QZPVIVn1jiLAcm2csSnc4bHTOWrW8d453rNs0noabG2
 N9o/EKno/E5fZ+6BIt8xTEaw/LaiJtng4+KFNXdVeBgw6zS+hb6qvK+adFKA6sIt8QFx
 jlkzXUFzQYGTCQkjDv/FNFx2zTgvGDOeE7Gat+aUkF8/kdRpzB6wC1M6749W2c9E+2D3
 nneZ9pEgN3CQxCAfAxeHc+2iJk4t+dxHC7/BX/8RZXi3VcnoAF2F5Y6xD2e6y3z/QGlu
 5s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rmUZ/LefwZKjwq5aooyNQE4MC8myDjdpN3Ckl6d1zcs=;
 b=kkOg6ZslFFGUDq6CqwhnCe2H3Ahgfkk3kQfDr8bEogRsV1AbrmDYgzgFi8BJpXh9pe
 i0kNipDPNLusIxMH9kOeaF7zrLBWpjX8PGgOUqVERYfRlXtJ1OzTOrNngAuGdlJplrcX
 oWZqLU7T8tvmnJCiMi3WqkWQa1b5p3mzqiyTiqYYiSZerQ0DN00J2SCD+3FuxTGwsg+r
 Moe0GPDQ65LDI4+stq+iqrya5jgdDRqceojG2WQxUT2vE1nS2jCERqCW/D07s039IWii
 g07opHS33T88tQK+BXL9EYjW8gmIRa0MXD0AAY00O8wk93qqhAJ1Jy8E12Tlx3sorPZJ
 NZmg==
X-Gm-Message-State: AOAM530BaK6NsqP8l600cbv3BHSCtnO0cB8hH6SkogrxUbhcYYaJe5uj
 ZOpVjrUugLWs+XekOOJ1Qr0G2Kk+FdayCrahwA4=
X-Google-Smtp-Source: ABdhPJwmZ+yhrflagrOqYCRNj7dnimh/KjhNwCI/2kJH//K6O8faeNXSzM1EAjFZjsIHMzoNWnfnz6XIjOoFTw0qmLY=
X-Received: by 2002:a9d:6c99:: with SMTP id c25mr22827600otr.327.1606101613081; 
 Sun, 22 Nov 2020 19:20:13 -0800 (PST)
MIME-Version: 1.0
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-2-git-send-email-gene.chen.richtek@gmail.com>
 <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
In-Reply-To: <3164b1ed-9e47-88cd-d492-ff5a9243e5ef@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 23 Nov 2020 11:20:03 +0800
Message-ID: <CAE+NS350vuY1qNwn4_7ow8Z22_DfHrJAnKX1dsFM_WbaHziZiw@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] leds: flash: Add flash registration with undefined
 CONFIG_LEDS_CLASS_FLASH
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_222017_944253_E0123C76 
X-CRM114-Status: GOOD (  24.26  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0
MTHmnIgyMOaXpSDpgLHkupQg5LiK5Y2INjoyOeWvq+mBk++8mgo+Cj4gSGkgR2VuZSwKPgo+IE9u
IDExLzE4LzIwIDExOjQ3IEFNLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+Cj4gPiBBZGQgZmxhc2ggcmVnaXN0cmF0aW9uIHdp
dGggdW5kZWZpbmVkIENPTkZJR19MRURTX0NMQVNTX0ZMQVNICj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiAtLS0KPiA+ICAgaW5jbHVk
ZS9saW51eC9sZWQtY2xhc3MtZmxhc2guaCB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2xlZC1jbGFzcy1mbGFzaC5oIGIvaW5jbHVkZS9s
aW51eC9sZWQtY2xhc3MtZmxhc2guaAo+ID4gaW5kZXggMjFhMzM1OC4uNGY1NmMyOCAxMDA2NDQK
PiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbGVkLWNsYXNzLWZsYXNoLmgKPiA+ICsrKyBiL2luY2x1
ZGUvbGludXgvbGVkLWNsYXNzLWZsYXNoLmgKPiA+IEBAIC04NSw2ICs4NSw3IEBAIHN0YXRpYyBp
bmxpbmUgc3RydWN0IGxlZF9jbGFzc2Rldl9mbGFzaCAqbGNkZXZfdG9fZmxjZGV2KAo+ID4gICAg
ICAgcmV0dXJuIGNvbnRhaW5lcl9vZihsY2Rldiwgc3RydWN0IGxlZF9jbGFzc2Rldl9mbGFzaCwg
bGVkX2NkZXYpOwo+ID4gICB9Cj4gPgo+ID4gKyNpZiBJU19FTkFCTEVEKENPTkZJR19MRURTX0NM
QVNTX0ZMQVNIKQo+ID4gICAvKioKPiA+ICAgICogbGVkX2NsYXNzZGV2X2ZsYXNoX3JlZ2lzdGVy
X2V4dCAtIHJlZ2lzdGVyIGEgbmV3IG9iamVjdCBvZiBMRUQgY2xhc3Mgd2l0aAo+ID4gICAgKiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbml0IGRhdGEgYW5kIHdpdGggc3VwcG9ydCBm
b3IgZmxhc2ggTEVEcwo+ID4gQEAgLTEyNyw2ICsxMjgsNDEgQEAgc3RhdGljIGlubGluZSBpbnQg
ZGV2bV9sZWRfY2xhc3NkZXZfZmxhc2hfcmVnaXN0ZXIoc3RydWN0IGRldmljZSAqcGFyZW50LAo+
ID4gICB2b2lkIGRldm1fbGVkX2NsYXNzZGV2X2ZsYXNoX3VucmVnaXN0ZXIoc3RydWN0IGRldmlj
ZSAqcGFyZW50LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgbGVkX2NsYXNzZGV2X2ZsYXNoICpmbGVkX2NkZXYpOwo+ID4KPiA+ICsjZWxzZQo+ID4gKwo+
ID4gK3N0YXRpYyBpbmxpbmUgaW50IGxlZF9jbGFzc2Rldl9mbGFzaF9yZWdpc3Rlcl9leHQoc3Ry
dWN0IGRldmljZSAqcGFyZW50LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBsZWRfY2xhc3NkZXZfZmxhc2ggKmZsZWRfY2RldiwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbGVkX2luaXRfZGF0YSAqaW5pdF9kYXRhKQo+ID4g
K3sKPiA+ICsgICAgIHJldHVybiAtRUlOVkFMOwo+Cj4gcy8tRUlOVkFMLzAvCj4KPiBUaGUgZ29h
bCBoZXJlIGlzIHRvIGFzc3VyZSB0aGF0IGNsaWVudCB3aWxsIG5vdCBmYWlsIHdoZW4gdXNpbmcg
bm8tb3AuCj4KPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSBpbnQgbGVkX2NsYXNzZGV2
X2ZsYXNoX3JlZ2lzdGVyKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGxlZF9jbGFzc2Rldl9mbGFzaCAqZmxl
ZF9jZGV2KQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiBsZWRfY2xhc3NkZXZfZmxhc2hfcmVnaXN0
ZXJfZXh0KHBhcmVudCwgZmxlZF9jZGV2LCBOVUxMKTsKPiA+ICt9Cj4KPiBUaGlzIGZ1bmN0aW9u
IHNob3VsZCBiZSBwbGFjZWQgYWZ0ZXIgI2lmZGVmIGJsb2NrIGJlY2F1c2UgaXRzCj4gc2hhcGUg
aXMgdGhlIHNhbWUgZm9yIGJvdGggY2FzZXMuCj4KPiA+ICtzdGF0aWMgaW5saW5lIHZvaWQgbGVk
X2NsYXNzZGV2X2ZsYXNoX3VucmVnaXN0ZXIoc3RydWN0IGxlZF9jbGFzc2Rldl9mbGFzaCAqZmxl
ZF9jZGV2KSB7fTsKPiA+ICtzdGF0aWMgaW5saW5lIGludCBkZXZtX2xlZF9jbGFzc2Rldl9mbGFz
aF9yZWdpc3Rlcl9leHQoc3RydWN0IGRldmljZSAqcGFyZW50LAo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbGVkX2NsYXNzZGV2X2ZsYXNoICpmbGVkX2NkZXYs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBsZWRfaW5pdF9k
YXRhICppbml0X2RhdGEpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIC1FSU5WQUw7Cj4KPiAvLUVJ
TlZBTC8wLwo+Cj4gUGxlYXNlIGRvIHRoZSBzYW1lIGZpeCBpbiBhbGwgbm8tb3BzIGluIHRoZSBs
ZWQtY2xhc3MtbXVsdGljb2xvci5oLAo+IGFzIHdlJ3ZlIGRpc2N1c3NlZC4KPgoKSSB0aGluayBy
ZXR1cm4gLUVJTlZBTCBpcyBjb3JyZWN0LCBiZWNhdXNlIEkgc2hvdWxkIHJlZ2lzdGVyIGZsYXNo
CmxpZ2h0IGRldmljZSBpZiBJIGRlZmluZSBGTEVEIGluIERUUyBub2RlLgoKPiA+ICt9Cj4gPiAr
Cj4gPiArc3RhdGljIGlubGluZSBpbnQgZGV2bV9sZWRfY2xhc3NkZXZfZmxhc2hfcmVnaXN0ZXIo
c3RydWN0IGRldmljZSAqcGFyZW50LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3QgbGVkX2NsYXNzZGV2X2ZsYXNoICpmbGVkX2NkZXYpCj4gPiArewo+ID4gKyAg
ICAgcmV0dXJuIGRldm1fbGVkX2NsYXNzZGV2X2ZsYXNoX3JlZ2lzdGVyX2V4dChwYXJlbnQsIGZs
ZWRfY2RldiwgTlVMTCk7Cj4gPiArfQo+Cj4KPiBUaGlzIGZ1bmN0aW9uIHNob3VsZCBhbHNvIGJl
IHBsYWNlZCBhZnRlciAjaWZkZWYgYmxvY2suCj4gUGxlYXNlIG1ha2UgdGhlIHNhbWUgb3B0aW1p
emF0aW9ucyBpbiB0aGUgbGVkLWNsYXNzLW11bHRpY29sb3IuaCBhcyB5b3UKPiBhcmUgYXQgaXQu
Cj4KPiA+ICsKPiA+ICt2b2lkIGRldm1fbGVkX2NsYXNzZGV2X2ZsYXNoX3VucmVnaXN0ZXIoc3Ry
dWN0IGRldmljZSAqcGFyZW50LAo+Cj4gcy92b2lkL3N0YXRpYyBpbmxpbmUgdm9pZC8KPgo+IFRo
YXQncyB0aGUgcmVhc29uIHdoeSB5b3UgZ290IHdhcm5pbmcgZnJvbSBidWlsZGJvdC4KPgoKQUNL
Cgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbGVkX2Ns
YXNzZGV2X2ZsYXNoICpmbGVkX2NkZXYpCj4gPiAre307Cj4gPiArCj4gPiArI2VuZGlmICAvKiBJ
U19FTkFCTEVEKENPTkZJR19MRURTX0NMQVNTX0ZMQVNIKSAqLwo+ID4gKwo+ID4gICAvKioKPiA+
ICAgICogbGVkX3NldF9mbGFzaF9zdHJvYmUgLSBzZXR1cCBmbGFzaCBzdHJvYmUKPiA+ICAgICog
QGZsZWRfY2RldjogdGhlIGZsYXNoIExFRCB0byBzZXQgc3Ryb2JlIG9uCj4gPgo+Cj4gLS0KPiBC
ZXN0IHJlZ2FyZHMsCj4gSmFjZWsgQW5hc3pld3NraQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
