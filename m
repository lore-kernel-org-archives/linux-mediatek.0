Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812C4C63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 06:42:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B78E206F9
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 06:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B78E206F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ah2ik9j3mgJyNYrwQeqjNJMyq56Jt81FFM33LKO2VyE=; b=hVTVlIU+x5CyjDrPuE39R90Xd
	vaObRv1PoLV/Ht+2O6gZ6EKxNyxtCqW/L6v9XEkJXLlTK2VwK9wSeW/ywP+n6JNuGon29yKyBMnTt
	SesGZniU3U4Uu65Oxi4C9nMRUBKksN98eGJ+sMFHcyXJUOLwRPerhdLOL7W4hDMYZmJXwQw5vOT1T
	uB++ssx4m9riptwFXMLyWJQo+Tcji3dokadkwLRXJxWuMz7vSKlaRrTHLCQ3jRNEhkVheyHIbF/6x
	sIE0F6WgupA2p7KXHjr9OOPwMamZnFvu/Qbs8JLevjj2PkAyl8Tqp4aihB8Az+uYF/lFc9SJ9ofQx
	GTvFOxTGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkiJv-00007t-5Y; Thu, 03 Dec 2020 06:42:27 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkiJq-00006m-KZ; Thu, 03 Dec 2020 06:42:23 +0000
Received: by mail-oi1-x242.google.com with SMTP id s18so1169654oih.1;
 Wed, 02 Dec 2020 22:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yO4TsI43MuLziGL33Z3oiOkLAP8j5oHC1iNCg4TI+/s=;
 b=do7maqArbCHRAVqvvu3JPEzYvoePnCjywZhayzI88KuqX/pY/Mk/RUtCE64RPOVfRm
 TgP1176mObueziXjkJE6hqIistnArhXtSoNRwoR1Ig1yMTgbZdczCOMIHKUvAqyLLjMw
 NPlTOCb87S9lxfK1SuC9diY1uJYvQrIIYi0+UsUU94ddIKHVdCSeQuiB6RL7dmh7sE1H
 dvo1pomq2vZEYTPqfk11jw02eHma9nEv6HARLxIGaNyclUPED2HyLEdv5vmHk97OBQ2x
 FRo70IFI7ym0cY0hujL5T49ryJ5IaMK9wzDKW6Kr9TwXCgY3hah7i2iJYLJb0CjeIPm7
 5FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yO4TsI43MuLziGL33Z3oiOkLAP8j5oHC1iNCg4TI+/s=;
 b=J7ZtMVWAPoqElmfb7RDUDZMZv4JtWcDEk5Cmka9KNqzkTG+QK6RkQLRT6CDMWmWDMp
 sZmUPXDWmXt0IRfQTxS9YPB2DDXce2mcUfZEuWVDb4OwQSjsGO0bK8dNrmanNZ+ZomkS
 wKs3QjaTJ5iRhdj63lHpw0ogOIpx3Zsaxbcw/S4PrqZszUgADqE5/sArlLEoLoSn2gDe
 tn69TVyX+pLScjmXyRz0+SP411kH+F2pr3nZu0zRb1NelLt5kO1Z5lkLo9rb8JS7wml1
 ZdOrnXGT2Mg/i4ba5N6V9f00lMooRntM60W1811NsZXk5O3lfi2dEgLv8B7FcMjxhXF0
 WJBA==
X-Gm-Message-State: AOAM533PZOpcNOgP7lmbFjPPPCCjAhfJ84nHralvyT/Lgi4ZSDXn+WhV
 9eb1IK9oHSDdwdChrJUp3uyMWONttiBH0Ffx6Qg=
X-Google-Smtp-Source: ABdhPJyZxsbM2i/OH6A7N9hQqS+cFLzd3IgXb6p+JDZhAGOqIiZA9i7J/kWZ06MeDUjjRo9n1my70PTRPfSRt+eQDZE=
X-Received: by 2002:aca:3e84:: with SMTP id l126mr976185oia.55.1606977740583; 
 Wed, 02 Dec 2020 22:42:20 -0800 (PST)
MIME-Version: 1.0
References: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606906011-25633-4-git-send-email-gene.chen.richtek@gmail.com>
 <20201202122329.GA30929@duo.ucw.cz>
In-Reply-To: <20201202122329.GA30929@duo.ucw.cz>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 3 Dec 2020 14:42:08 +0800
Message-ID: <CAE+NS34D8a6Udt7ZZ0=U7oqm5POtihKvD3WjD_sAADamqQ=1AQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_014222_729659_5743E680 
X-CRM114-Status: GOOD (  17.90  )
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
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, shufan_lee@richtek.com,
 Wilma.Wu@mediatek.com, Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IOaWvCAyMDIw5bm0MTLmnIgy5pelIOmAseS4iSDk
uIvljYg4OjIz5a+r6YGT77yaCj4KPiBPbiBXZWQgMjAyMC0xMi0wMiAxODo0Njo0OSwgR2VuZSBD
aGVuIHdyb3RlOgo+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4g
Pgo+ID4gQWRkIExFRF9GVU5DVElPTl9NT09OTElHSFQgZGVmaW5pdGlvbnMKPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+IEFja2VkLWJ5
OiBKYWNlayBBbmFzemV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT4KPiA+IEFja2Vk
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgaW5jbHVkZS9k
dC1iaW5kaW5ncy9sZWRzL2NvbW1vbi5oIHwgMSArCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9j
b21tb24uaCBiL2luY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9jb21tb24uaAo+ID4gaW5kZXggNTJi
NjE5ZC4uODQzZTY1ZCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvbGVkcy9j
b21tb24uaAo+ID4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9sZWRzL2NvbW1vbi5oCj4gPiBA
QCAtNzgsNiArNzgsNyBAQAo+ID4gICNkZWZpbmUgTEVEX0ZVTkNUSU9OX0lORElDQVRPUiAiaW5k
aWNhdG9yIgo+ID4gICNkZWZpbmUgTEVEX0ZVTkNUSU9OX0xBTiAibGFuIgo+ID4gICNkZWZpbmUg
TEVEX0ZVTkNUSU9OX01BSUwgIm1haWwiCj4gPiArI2RlZmluZSBMRURfRlVOQ1RJT05fTU9PTkxJ
R0hUICJtb29ubGlnaHQiCj4KPiBUaGVyZSdzICJ0b3JjaCIgZnVuY3Rpb24gdGhhdCBzaG91bGQg
YmUgdXNlZCBmb3IgdGhpcy4gSSBndWVzcyBjb21tZW50Cj4gc2hvdWxkIGJlIGFkZGVkIHdpdGgg
ZXhwbGFuYXRpb24gd2hhdCBleGFjdGx5IHRoYXQgaXMgYW5kIGhvdyBzaG91bGQKPiB0aGUgTEVE
IGJlIG5hbWVkLgo+CgpBY2NvcmRpbmcgdG8gbWFpbCwgMTEvMjUgIlJlOiBbUEFUQ0ggdjcgMi81
XSBkdC1iaW5kaW5nczogbGVkczogQWRkCkxFRF9DT0xPUl9JRF9NT09OTElHSFQgZGVmaW5pdGlv
bnMiLApUaGUgTW9vbmxpZ2h0IExFRCBpcyBMRUQgd2hpY2ggbWF4aW11bSBjdXJyZW50IG1vcmUg
dGhhbiB0b3JjaCwgYnV0Cmxlc3MgdGhhbiBmbGFzaC4gU3VjaCBhcyBmcm9udCBjYW1lcmEgZmls
bCBsaWdodC4KSSB0aGluayBvdXIgY2hhbm5lbCBpcyBtb29ubGlnaHQsIG5vdCB0b3JjaC4KSSB3
aWxsIGFkZCB0aGlzIGRlc2NyaXB0aW9uIHRvIGNvbW1lbnQuCldlIGNhbid0IGV4YWN0bHkgZGVm
aW5lIG1vb25saWdodCBjdXJyZW50IGxldmVsLCBiZWNhdXNlIGV2ZXJ5IHZlbmRvcgpoYXMgdGhl
aXIgb3duIHNwZWNpZmljYXRpb24uCgo+IEJlc3QgcmVnYXJkcywKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUGF2ZWwKPiAt
LQo+IGh0dHA6Ly93d3cubGl2ZWpvdXJuYWwuY29tL35wYXZlbG1hY2hlawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
