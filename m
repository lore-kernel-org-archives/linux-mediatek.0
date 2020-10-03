Return-Path: <SRS0=+yJE=DK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD59BC4363C
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 03:23:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F32B8206E3
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 03:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PO3W8yOR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFlAjzq6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F32B8206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=atXmMZtalU+IPXT5Xe+NDw7jtulCxI38Zmacn/hoNgE=; b=PO3W8yORbll2EkSGVry/r6H/K
	/GVUgprf+dYTzdXnl31IFK6ECGBBMqAbvweyWCJHyODcnZUkVeAm5dfXyramL1Q+xLNlzXykGdMz/
	ZCFCxzerVh6tFReWdglpCLp92JQhrMkHxKXeLapr/Sxw9ImukpvOUqzz531+ybF0l7qIUyXoKhkUZ
	NYk/Y2QXY1c1SnkzkvzJ5EivZJWslNj1YlgWTBGeNqJKVPFxwRQdRkN3ZcJtdFcvOoz6FQn846Cf5
	IMQ1cTHab7CfZHWE4MAPrS68KbKqqDeP0rZLXAK72FD848Glw5F0KLUSMugf9G6x/lOa93gf/WQMi
	vAaIZHXUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOY8H-0000dE-0r; Sat, 03 Oct 2020 03:22:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOY8D-0000cW-61; Sat, 03 Oct 2020 03:22:46 +0000
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 23DFC206E3;
 Sat,  3 Oct 2020 03:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601695363;
 bh=vshNU8D+9cfgnyb4qi/vgpJ80rl6DobvFOc+lNmiq4A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hFlAjzq6mVuQfPmTTpOyDSjt2poAiniCQC7B4VG6VvKy/a9HVw1KOanp3JnlMwGcz
 OsYAzWC62+LsskUIxEsw5P2ZhQLt09I23uMxY35DuZEk8tPOtZ0iY7dUwa69pddMV+
 SVeJ1Gt2OgHRnTkYSAr6RLFodXInMeh/iwBwen+A=
Received: by mail-ej1-f43.google.com with SMTP id u21so4442024eja.2;
 Fri, 02 Oct 2020 20:22:43 -0700 (PDT)
X-Gm-Message-State: AOAM531YP4vL4U/ze4jhRFGYWo27pMLBvCBZhKoUD9pPnzPZdWOPGri4
 3T3eEWIfz6wmMmtUFw/WgBalkGW1lvGbZrDtzA==
X-Google-Smtp-Source: ABdhPJwfK6hFOAL1k6cStLol7QwYclHeuIdUmnRprFtlrITDDNE5+T91NUK9YTbudQEGp0c8nEIdFwMRV6jYoHi1EXo=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr180684ejd.310.1601695361687; 
 Fri, 02 Oct 2020 20:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200927230422.11610-1-chunkuang.hu@kernel.org>
 <CABb+yY1zq0+sqXuSzkkX9+dTaTZgg5HJyQLC3N-yZx35QLLvDQ@mail.gmail.com>
In-Reply-To: <CABb+yY1zq0+sqXuSzkkX9+dTaTZgg5HJyQLC3N-yZx35QLLvDQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 3 Oct 2020 11:22:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9bgYK2MDySstc4F2jN0M+Zpmcq2R3G_PdWz2sgt9wp7A@mail.gmail.com>
Message-ID: <CAAOTY_9bgYK2MDySstc4F2jN0M+Zpmcq2R3G_PdWz2sgt9wp7A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Mediatek DRM driver detect CMDQ execution timeout by
 vblank IRQ
To: Jassi Brar <jassisinghbrar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_232245_432110_5BF3B93D 
X-CRM114-Status: GOOD (  20.94  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEphc3NpOgoKSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPiDmlrwgMjAy
MOW5tDEw5pyIM+aXpSDpgLHlha0g5LiK5Y2INDozMOWvq+mBk++8mgo+Cj4gT24gU3VuLCBTZXAg
MjcsIDIwMjAgYXQgNjowNCBQTSBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4gPgo+ID4gQ01EUSBoZWxwZXIgcHJvdmlkZSB0aW1lciB0byBkZXRlY3QgZXhl
Y3V0aW9uIHRpbWVvdXQsIGJ1dCBEUk0gZHJpdmVyCj4gPiBjb3VsZCBoYXZlIGEgYmV0dGVyIHdh
eSB0byBkZXRlY3QgZXhlY3V0aW9uIHRpbWVvdXQgYnkgdmJsYW5rIElSUS4KPiA+IEZvciBEUk0s
IENNRFEgY29tbWFuZCBzaG91bGQgZXhlY3V0ZSBpbiB2YmxhbmssIHNvIGlmIGl0IGZhaWwgdG8K
PiA+IGV4ZWN1dGUgaW4gbmV4dCAyIHZibGFuaywgdGltZW91dCBoYXBwZW4uIEV2ZW4gdGhvdWdo
IHdlIGNvdWxkCj4gPiBjYWxjdWxhdGUgdGltZSBiZXR3ZWVuIDIgdmJsYW5rIGFuZCB1c2UgdGlt
ZXIgdG8gZGVsZWN0LCB0aGlzIHdvdWxkCj4gPiBtYWtlIHRoaW5ncyBtb3JlIGNvbXBsaWNhdGVk
Lgo+ID4KPiA+IFRoaXMgaW50cm9kdWNlIGEgc2VyaWVzIHJlZmluZW1lbnQgZm9yIENNRFEgbWFp
bGJveCBjb250cm9sbGVyIGFuZCBDTURRCj4gPiBoZWxwZXIuIFJlbW92ZSB0aW1lciBoYW5kbGVy
IGluIGhlbHBlciBmdW5jdGlvbiBiZWNhdXNlIGRpZmZlcmVudAo+ID4gY2xpZW50IGhhdmUgZGlm
ZmVyZW50IHdheSB0byBkZXRlY3QgdGltZW91dC4gVXNlIHN0YW5kYXJkIG1haWxib3gKPiA+IGNh
bGxiYWNrIGluc3RlYWQgb2YgcHJvcHJpZXRhcnkgb25lIHRvIGdldCB0aGUgbmVjZXNzYXJ5IGRh
dGEKPiA+IGluIGNhbGxiYWNrIGZ1bmN0aW9uLiBSZW1vdmUgc3RydWN0IGNtZHFfY2xpZW50IHRv
IGFjY2VzcyBjbGllbnQKPiA+IGluc3RhbmNlIGRhdGEgYnkgc3RydWN0IG1ib3hfY2xpZW50Lgo+
ID4KPiA+IENodW4tS3VhbmcgSHUgKDQpOgo+ID4gICBzb2MgLyBkcm06IG1lZGlhdGVrOiBjbWRx
OiBSZW1vdmUgdGltZW91dCBoYW5kbGVyIGluIGhlbHBlciBmdW5jdGlvbgo+ID4gICBtYWlsYm94
IC8gc29jIC8gZHJtOiBtZWRpYXRlazogVXNlIG1haWxib3ggcnhfY2FsbGJhY2sgaW5zdGVhZCBv
Zgo+ID4gICAgIGNtZHFfdGFza19jYgo+ID4gICBtYWlsYm94IC8gc29jIC8gZHJtOiBtZWRpYXRl
azogUmVtb3ZlIHN0cnVjdCBjbWRxX2NsaWVudAo+ID4gICBkcm0vbWVkaWF0ZWs6IERldGVjdCBD
TURRIGV4ZWN1dGlvbiB0aW1lb3V0Cj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2NydGMuYyAgfCAgNTQgKysrKysrLS0tCj4gPiAgZHJpdmVycy9tYWlsYm94L210ay1j
bWRxLW1haWxib3guYyAgICAgICB8ICAyNCArKy0tCj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bXRrLWNtZHEtaGVscGVyLmMgICB8IDE0NiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIGlu
Y2x1ZGUvbGludXgvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmggfCAgMjUgKy0tLQo+ID4gIGlu
Y2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmggICAgfCAgNTQgKy0tLS0tLS0tCj4g
PiAgNSBmaWxlcyBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspLCAyMzcgZGVsZXRpb25zKC0pCj4g
Pgo+IFBsZWFzZSBicmVhayB0aGlzIGludG8gdHdvIHBhdGNoc2V0cyAtIG9uZSBmb3IgbWFpbGJv
eCBhbmQgb25lIGZvciBpdHMgdXNlcnMuCj4gQWxzbywgQ0Mgb3JpZ2luYWwgYXV0aG9yIGFuZCBy
ZWNlbnQgbWFqb3IgY29udHJpYnV0b3JzIHRvIG10ay1jbWRxLW1haWxib3guYwo+CgpBZ3JlZSB3
aXRoIHlvdS4gQnV0IGZvciBwYXRjaCBbMi80XSAoIlVzZSBtYWlsYm94IHJ4X2NhbGxiYWNrIGlu
c3RlYWQKb2YgY21kcV90YXNrX2NiIiksIEkgdGhpbmsgaXQgd291bGQgYmUgYSBsb25nIHRlcm0g
cHJvY2Vzcy4KSSB3b3VsZCBicmVhayBpdCBpbnRvOgoKMS4gbXRrLWNtZHEtbWFpbGJveC5jOiBh
ZGQgcnhfY2FsbGJhY2sgYW5kIGtlZXAgIGNtZHFfdGFza19jYiBiZWNhdXNlCmNsaWVudCBpcyB1
c2luZyBjbWRxX3Rhc2tfY2IuCjIuIGNsaWVudDogY2hhbmdlIGZyb20gY21kcV90YXNrX2NiIHRv
IHJ4X2NhbGxiYWNrLgozLiBtdGstY21kcS1tYWlsYm94LmM6IHJlbW92ZSBjbWRxX3Rhc2tfY2Iu
CgpUaGUgdGhyZWUgc3RlcCBoYXMgZGVwZW5kZW5jeSwgYnV0IHRoZSAybmQgc2hvdWxkIG1vdmUg
dG8gYW5vdGhlcgpzZXJpZXMsIHNvIEkgd291bGQgZ28gMXN0IHN0ZXAgZmlyc3QuCgpSZWdhcmRz
LApDaHVuLUt1YW5nLgoKPiBUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
