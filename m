Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E63C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 10:55:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03CD96186A
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 10:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03CD96186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PnORyD3hZAkeUrc7CcpttVqO3DYVPacWRZs0Gp9vbsw=; b=NVhoDblmDQggqNwhbT/F81jaT
	oMLO4BE0TD4Y+ZSFupljQxPkadHYVb0Rm9G8/XY3VFBk3T7EtSlKyb7Eigs62zd9QB7ty0+JuBUUj
	cAXMi0X50LfT0vu6qEer8DLXP79pihYsU/NzE2OCfRi5GJa/Hh/LG6m9ejbpZFCqJIC99rGrSBmdo
	StzVsGp3w1rkyzaaIBE3rmnLlAoj2Tk+K5vvcOj2Z1YzSyEj0JmRYUdbUKirZcn+tdZgFoJ5fAa2g
	OrBSWyqL2e7ELU7B9/+omWBX8H4BdgcECR0XkI7gXTi4ICunuVsclh1q89Hrayy2Gs9iW04mvVPdf
	ARzHJb7yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOID1-00BN78-FG; Mon, 22 Mar 2021 10:54:55 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOICj-00BN62-Mm; Mon, 22 Mar 2021 10:54:43 +0000
Received: by mail-oi1-x231.google.com with SMTP id k25so12534050oic.4;
 Mon, 22 Mar 2021 03:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4btGnEyoNuVChZYQdjnSeuZUMKkjapFAE1UjjfFOhXg=;
 b=AXSN3tkM/O+AP8mifoDYebSrDhypdDFA9bIsFvE5KVjYYFhKewHRdSrP2xlEH338Ye
 B5IsGT7pdRwi5OhPQV7ac884568cL/y2GFCGxYTn2VF8nKhN4kPr4P90UQktyRQSiSdC
 lGFPjEETdE3WM9X+q7HbQp1xem8xk+qNsA+H4K7l6F/mdPAY54I8k7Airj4adsZq6hd2
 X1etzfzBj459ebL2L46klon9a2hc9n7ldemCwGtKKuJgc6M50qANR21zXDWY8PklcKDk
 MVzSZGANIzKVZmTLcqGUnbypNtZDlT4vNa1Wl5TIAZIE9f3CBn/FGZrv/XkfrRc9gLY1
 0MDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4btGnEyoNuVChZYQdjnSeuZUMKkjapFAE1UjjfFOhXg=;
 b=AnfGJLgqEJ1BsVvlTGTS824qf4h+z5anae+VbV5xoRHhCMmgnW/rN68ymjztVXv1OH
 NkvWUxZz5kVHC24fGz7QCiGS0h6+4iS3EgOSV8csDTYCU4/blpBQWILGvd8yzdmhWJSo
 wB2kAkTlmskAk3CfNIsPuMjMg5/XzULzbMJW8Z+BaPzPq+sQcFzUNrkEj5Kwu3Vf0niC
 ElN+fyA0qYJDzBQe9ukZrDG1oE+w/KjBkrh6lUvY1t4l/oX3XpfxqrsDI70x42O+qILU
 3hedXhS5+BrBALpZU4u1b9iUHvvf8xp9PWn/0w8Sv8xbs2O/7sjMtvM8BWayt6NZQDlV
 FtsA==
X-Gm-Message-State: AOAM530m+aOYlnru3CdcEQvLyujS6BJSvLRDkaXW/GKulViS1CXgdQNW
 JVzpVAn4HkVGrA9V12Ur4V4PmYFr+Q4PNd6vJPA=
X-Google-Smtp-Source: ABdhPJxiyHeNB8axrMRnudukjDpmAsBj09fDs/WjMXObgtI2684KhRJG7sNOZQx2D4NZTsnAJZgIPi138fY+Ik+P+O4=
X-Received: by 2002:a05:6808:14c8:: with SMTP id
 f8mr9860256oiw.55.1616410474915; 
 Mon, 22 Mar 2021 03:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
 <1608547554-6602-4-git-send-email-gene.chen.richtek@gmail.com>
 <20210219104724.GC19207@duo.ucw.cz>
 <CAE+NS36NvH-s_UOR8RUZA_gd+FUZ5oLqb=n0s41dSMYWDn9DnA@mail.gmail.com>
In-Reply-To: <CAE+NS36NvH-s_UOR8RUZA_gd+FUZ5oLqb=n0s41dSMYWDn9DnA@mail.gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 22 Mar 2021 18:54:23 +0800
Message-ID: <CAE+NS37XOgRotVTBLeFtbLYEksRydOLBHdCfMH9fTFNZ5J+2Dw@mail.gmail.com>
Subject: Re: [PATCH v13 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Dan Murphy <dmurphy@ti.com>, 
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, shufan_lee@richtek.com, 
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_105438_688129_7622214F 
X-CRM114-Status: GOOD (  14.59  )
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

R2VuZSBDaGVuIDxnZW5lLmNoZW4ucmljaHRla0BnbWFpbC5jb20+IOaWvCAyMDIx5bm0M+aciDLm
l6Ug6YCx5LqMIOS4i+WNiDI6MDjlr6vpgZPvvJoKPgo+IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3
LmN6PiDmlrwgMjAyMeW5tDLmnIgxOeaXpSDpgLHkupQg5LiL5Y2INjo0N+Wvq+mBk++8mgo+ID4K
PiA+IEhpIQo+ID4KPiA+ID4gRnJvbTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+
Cj4gPiA+Cj4gPiA+IEFkZCBMRURfRlVOQ1RJT05fTU9PTkxJR0hUIGRlZmluaXRpb25zCj4gPiA+
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+
ID4gPiBBY2tlZC1ieTogSmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5j
b20+Cj4gPiA+IEFja2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4KPiA+
IE5vLCBzb3JyeSwgSSBkb24ndCBiZWxpZXZlIHdlIG5lZWQgYW5vdGhlciBkZWZpbmUgZm9yIGZs
YXNoL3RvcmNoLgo+ID4KPgo+IEFzIHByZXZpb3VzIGRpc2N1c3MsCj4gPiBXZSB1c2UgdGVybSAi
TW9vbmxpZ2h0IiBhcyByZWZlcmVuY2Ugc2F5cwo+ID4gIldoZW4geW91IGFyZSB0cnlpbmcgdG8g
aW1pdGF0ZSBtb29ubGlnaHQgeW91IG5lZWQgdG8gdXNlIGxvdyB2b2x0YWdlLAo+ID4gc29mdGVy
IGxpZ2h0aW5nLiBZb3UgZG9u4oCZdCB3YW50IHNvbWV0aGluZyB0aGF04oCZcyB0b28gYnJpZ2h0
Igo+ID4gd2hpY2ggaXMgZm9jdXMgb24gYnJpZ2h0bmVzcyBpbnN0ZWFkIG9mIGNvbG9yLgo+Cj4g
SWYgYW55IGNvbmNlcm4gYWJvdXQgdGhpcyBjaGFuZ2UsIG1heWJlIHdlIHVzZSBMRURfRlVOQ1RJ
T05fSU5ESUNBVE9SIGluc3RlYWQ/Cj4gKHJlZnM6IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIw
LzExLzI0LzEyNjcpCgpJcyB0aGVyZSBhbnkgdXBkYXRlPwoKPiA+IEJlc3QgcmVnYXJkcywKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQYXZlbAo+ID4gLS0KPiA+IGh0dHA6Ly93d3cubGl2ZWpvdXJuYWwuY29tL35wYXZl
bG1hY2hlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
