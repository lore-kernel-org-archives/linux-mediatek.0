Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEEDC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 18:11:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1358764E49
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 18:11:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1358764E49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=prEc9N0RZOCQZlZUqB0frBXp4K9HalPn8KGTZfmVi58=; b=QnkXdZPKXK3U9dA/Vd2AwXOb3
	tCny4XOkp+rNCSvl3b6sCB9znwJtt4UjGdM0o8GlvMXVNC2Bhuge1MM2iaCmJbm/nJ2q6YQzBz/B5
	Y5h37GEkV/BtegOrizjRpC5MMeua8cRL6ImCJFRf35yLBzVuH0uV5uaossUpTs6tYzN6XVti+UaM2
	HmoCgHWjC2U2kdpofCckeqvxUshgeJnsWUP6G6frevPUU+75XqkqE1yJfrH3rJH94lD6mB2lN0fui
	dLtnnVOSelmbHG4Mg+COYodUAK4n9VKWNGIJQ9LHDjCJTzg4OrGzlTE0Sgjba2wagPJHfsZsqhdUC
	AXFOmxNaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l85Zf-0003BE-7A; Fri, 05 Feb 2021 18:11:19 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l85ZY-00039V-Ig; Fri, 05 Feb 2021 18:11:15 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id u9so1160903vkb.0;
 Fri, 05 Feb 2021 10:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F4x29TTVEpw+IQOs4pBG2aQj/4xmoAAS+aT8UOnwOmY=;
 b=qknmJZd3jqr6x5X39DF2bWa4iCWwABpUdPV+kiRS7BjkpstQ3R85pT/tbr5d3hNpB9
 yW0LXkiBIQ9AFs9DG2uvmihC17ZgotzN27Hng1dlGt5QTun/RUerKK2911tPvuoXn1ZI
 4Qj5x0Fa4n/4T20Qe+2kDzkJuUwxbIOcCOEdtKU2SULF01iC1zgPMTeESFhTMb2BjGOz
 xfKAZYqWDlQvvnzppXYrhii9X4yNttSXp2f+ubulxYF5MhWK7sPq9jj178SvqlBEpC5U
 9Frwc1oFfSbQaJhEktTE7yUVcL/0L7g33b9cogvvwjWiH0rNtSaE0XoSdkY1RCp4AF4l
 MwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F4x29TTVEpw+IQOs4pBG2aQj/4xmoAAS+aT8UOnwOmY=;
 b=q5ktiTneVHLGsArwZtXPstrj8/WmQ53rXxofhYB9zXhch6I2A+3OTfhxQHtlO62l3u
 JmU7AsZYVnwLBFc027fbXV1d/2DtYRaG0rSt168Coqd+AmzRaGoUAZPGxh1J13NOiUML
 IsrxEZjnbFoPP9JMGqoaRoxuUWTM6pUVJcQF006+mhxI+mpyCKzjwbo9JBRlm7KSuTVA
 JzO3/TkDBSUKNYDwVG686sqy6RWXtF6k5aeh6QmCilYTRqEGx8CP/w4JXj8CdFofVGLf
 I3ncu+18Omf962oSpPRovrB0HVo4PGJghwHQFT1WSMjIp9uqZIz0R0ObK3uQ4ircZIUL
 emJw==
X-Gm-Message-State: AOAM5303OkXRBfn1OcGHK+h6uYVhLUAuHmm4HTD0GLF64isdC0n5k5J5
 EHyOjyxL4uBiorwIO2hEFkIhoJhPWGfSrQlGQ7M=
X-Google-Smtp-Source: ABdhPJyQSyKITQ1MekomM876tjivL1ZvoCSAVcqpJpbeCFMyFC9uD/Ttet6N6ReP2+QW6Yc6xVzXQLrj29pjrTCK+Po=
X-Received: by 2002:a1f:9c57:: with SMTP id f84mr4084825vke.2.1612548668509;
 Fri, 05 Feb 2021 10:11:08 -0800 (PST)
MIME-Version: 1.0
References: <20210204150100.GE20815@willie-the-truck>
 <20210204163721.91295-1-lecopzer@gmail.com>
 <20210205171859.GE22665@willie-the-truck>
In-Reply-To: <20210205171859.GE22665@willie-the-truck>
From: Lecopzer Chen <lecopzer@gmail.com>
Date: Sat, 6 Feb 2021 02:10:56 +0800
Message-ID: <CANr2M1_9Y9s1jYXOYJDxTtZbnxyc4Xwb2Ask+nZ_eSaZCnCd7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: kasan: don't populate vmalloc area for
 CONFIG_KASAN_VMALLOC
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_131112_710750_89D49EAE 
X-CRM114-Status: GOOD (  34.19  )
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
Cc: Jian-Lin Chen <lecopzer.chen@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 tyhicks@linux.microsoft.com, Alexander Potapenko <glider@google.com>,
 vincenzo.frascino@arm.com, ardb@kernel.org, yj.chiang@mediatek.com,
 kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>,
 aryabinin@virtuozzo.com, linux@roeck-us.net,
 Andrey Konovalov <andreyknvl@google.com>, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, dan.j.williams@intel.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, gustavoars@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, robin.murphy@arm.com,
 rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

V2lsbCBEZWFjb24gPHdpbGxAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQy5pyINuaXpSDpgLHlha0g
5LiK5Y2IMToxOeWvq+mBk++8mgo+Cj4gT24gRnJpLCBGZWIgMDUsIDIwMjEgYXQgMTI6Mzc6MjFB
TSArMDgwMCwgTGVjb3B6ZXIgQ2hlbiB3cm90ZToKPiA+Cj4gPiA+IE9uIFRodSwgRmViIDA0LCAy
MDIxIGF0IDEwOjQ2OjEyUE0gKzA4MDAsIExlY29wemVyIENoZW4gd3JvdGU6Cj4gPiA+ID4gPiBP
biBTYXQsIEphbiAwOSwgMjAyMSBhdCAwNjozMjo0OVBNICswODAwLCBMZWNvcHplciBDaGVuIHdy
b3RlOgo+ID4gPiA+ID4gPiBMaW51eCBzdXBwb3J0IEtBc2FuIGZvciBWTUFMTE9DIHNpbmNlIGNv
bW1pdCAzYzVjM2NmYjllZjRkYTkKPiA+ID4gPiA+ID4gKCJrYXNhbjogc3VwcG9ydCBiYWNraW5n
IHZtYWxsb2Mgc3BhY2Ugd2l0aCByZWFsIHNoYWRvdyBtZW1vcnkiKQo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBMaWtlIGhvdyB0aGUgTU9EVUxFU19WQUREUiBkb2VzIG5vdywganVzdCBub3QgdG8g
ZWFybHkgcG9wdWxhdGUKPiA+ID4gPiA+ID4gdGhlIFZNQUxMT0NfU1RBUlQgYmV0d2VlbiBWTUFM
TE9DX0VORC4KPiA+ID4gPiA+ID4gc2ltaWxhcmx5LCB0aGUga2VybmVsIGNvZGUgbWFwcGluZyBp
cyBub3cgaW4gdGhlIFZNQUxMT0MgYXJlYSBhbmQKPiA+ID4gPiA+ID4gc2hvdWxkIGtlZXAgdGhl
c2UgYXJlYSBwb3B1bGF0ZWQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IExlY29wemVyIENoZW4gPGxlY29wemVyLmNoZW5AbWVkaWF0ZWsuY29tPgo+ID4gPiA+ID4gPiAt
LS0KPiA+ID4gPiA+ID4gIGFyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5jIHwgMjMgKysrKysrKysr
KysrKysrKysrLS0tLS0KPiA+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9tbS9rYXNhbl9pbml0LmMgYi9hcmNoL2FybTY0L21tL2thc2FuX2luaXQuYwo+
ID4gPiA+ID4gPiBpbmRleCBkOGU2NmM3ODQ0MGUuLjM5YjIxOGE2NDI3OSAxMDA2NDQKPiA+ID4g
PiA+ID4gLS0tIGEvYXJjaC9hcm02NC9tbS9rYXNhbl9pbml0LmMKPiA+ID4gPiA+ID4gKysrIGIv
YXJjaC9hcm02NC9tbS9rYXNhbl9pbml0LmMKPiA+ID4gPiA+ID4gQEAgLTIxNCw2ICsyMTQsNyBA
QCBzdGF0aWMgdm9pZCBfX2luaXQga2FzYW5faW5pdF9zaGFkb3codm9pZCkKPiA+ID4gPiA+ID4g
IHsKPiA+ID4gPiA+ID4gICB1NjQga2ltZ19zaGFkb3dfc3RhcnQsIGtpbWdfc2hhZG93X2VuZDsK
PiA+ID4gPiA+ID4gICB1NjQgbW9kX3NoYWRvd19zdGFydCwgbW9kX3NoYWRvd19lbmQ7Cj4gPiA+
ID4gPiA+ICsgdTY0IHZtYWxsb2Nfc2hhZG93X3N0YXJ0LCB2bWFsbG9jX3NoYWRvd19lbmQ7Cj4g
PiA+ID4gPiA+ICAgcGh5c19hZGRyX3QgcGFfc3RhcnQsIHBhX2VuZDsKPiA+ID4gPiA+ID4gICB1
NjQgaTsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gQEAgLTIyMyw2ICsyMjQsOSBAQCBzdGF0aWMg
dm9pZCBfX2luaXQga2FzYW5faW5pdF9zaGFkb3codm9pZCkKPiA+ID4gPiA+ID4gICBtb2Rfc2hh
ZG93X3N0YXJ0ID0gKHU2NClrYXNhbl9tZW1fdG9fc2hhZG93KCh2b2lkICopTU9EVUxFU19WQURE
Uik7Cj4gPiA+ID4gPiA+ICAgbW9kX3NoYWRvd19lbmQgPSAodTY0KWthc2FuX21lbV90b19zaGFk
b3coKHZvaWQgKilNT0RVTEVTX0VORCk7Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICsgdm1hbGxv
Y19zaGFkb3dfc3RhcnQgPSAodTY0KWthc2FuX21lbV90b19zaGFkb3coKHZvaWQgKilWTUFMTE9D
X1NUQVJUKTsKPiA+ID4gPiA+ID4gKyB2bWFsbG9jX3NoYWRvd19lbmQgPSAodTY0KWthc2FuX21l
bV90b19zaGFkb3coKHZvaWQgKilWTUFMTE9DX0VORCk7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ID4gICAvKgo+ID4gPiA+ID4gPiAgICAqIFdlIGFyZSBnb2luZyB0byBwZXJmb3JtIHByb3BlciBz
ZXR1cCBvZiBzaGFkb3cgbWVtb3J5Lgo+ID4gPiA+ID4gPiAgICAqIEF0IGZpcnN0IHdlIHNob3Vs
ZCB1bm1hcCBlYXJseSBzaGFkb3cgKGNsZWFyX3BnZHMoKSBjYWxsIGJlbG93KS4KPiA+ID4gPiA+
ID4gQEAgLTI0MSwxMiArMjQ1LDIxIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBrYXNhbl9pbml0X3No
YWRvdyh2b2lkKQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAgIGthc2FuX3BvcHVsYXRlX2Vhcmx5
X3NoYWRvdyhrYXNhbl9tZW1fdG9fc2hhZG93KCh2b2lkICopUEFHRV9FTkQpLAo+ID4gPiA+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lkICopbW9kX3NoYWRvd19zdGFydCk7
Cj4gPiA+ID4gPiA+IC0ga2FzYW5fcG9wdWxhdGVfZWFybHlfc2hhZG93KCh2b2lkICopa2ltZ19z
aGFkb3dfZW5kLAo+ID4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICh2b2lk
ICopS0FTQU5fU0hBRE9XX0VORCk7Cj4gPiA+ID4gPiA+ICsgaWYgKElTX0VOQUJMRUQoQ09ORklH
X0tBU0FOX1ZNQUxMT0MpKSB7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gRG8gd2UgcmVhbGx5IG5lZWQg
eWV0IGFub3RoZXIgQ09ORklHIG9wdGlvbiBmb3IgS0FTQU4/IFdoYXQncyB0aGUgdXNlLWNhc2UK
PiA+ID4gPiA+IGZvciAqbm90KiBlbmFibGluZyB0aGlzIGlmIHlvdSdyZSBhbHJlYWR5IGVuYWJs
aW5nIG9uZSBvZiB0aGUgS0FTQU4KPiA+ID4gPiA+IGJhY2tlbmRzPwo+ID4gPiA+Y29tbWl0IG1l
c3NhZ2UKPiA+ID4gPiBBcyBJIGtub3csIEtBU0FOX1ZNQUxMT0Mgbm93IG9ubHkgc3VwcG9ydHMg
S0FTQU5fR0VORVJJQyBhbmQgYWxzbwo+ID4gPiA+IEtBU0FOX1ZNQUxMT0MgdXNlcyBtb3JlIG1l
bW9yeSB0byBtYXAgcmVhbCBzaGFkb3cgbWVtb3J5ICgxLzggb2Ygdm1hbGxvYyB2YSkuCj4gPiA+
Cj4gPiA+IFRoZSBzaGFkb3cgaXMgYWxsb2NhdGVkIGR5bmFtaWNhbGx5IHRob3VnaCwgaXNuJ3Qg
aXQ/Cj4gPgo+ID4gWWVzLCBidXQgSXQncyBzdGlsbCBhIGNvc3QuCj4gPgo+ID4gPiA+IFRoZXJl
IHNob3VsZCBiZSBzb21lb25lIGNhbiBlbmFibGUgS0FTQU5fR0VORVJJQyBidXQgY2FuJ3QgdXNl
IFZNQUxMT0MKPiA+ID4gPiBkdWUgdG8gbWVtb3J5IGlzc3VlLgo+ID4gPgo+ID4gPiBUaGF0IGRv
ZXNuJ3Qgc291bmQgcGFydGljdWxhcmx5IHJlYWxpc3RpYyB0byBtZS4gVGhlIHJlYXNvbiBJJ20g
cHVzaGluZyBoZXJlCj4gPiA+IGlzIGJlY2F1c2UgSSB3b3VsZCBfcmVhbGx5XyBsaWtlIHRvIG1v
dmUgdG8gVk1BUCBzdGFjayB1bmNvbmRpdGlvbmFsbHksIGFuZAo+ID4gPiB0aGF0IHdvdWxkIGVm
ZmVjdGl2ZWx5IGZvcmNlIEtBU0FOX1ZNQUxMT0MgdG8gYmUgc2V0IGlmIEtBU0FOIGlzIGluIHVz
ZS4KPiA+ID4KPiA+ID4gU28gdW5sZXNzIHRoZXJlJ3MgYSByZWFsbHkgZ29vZCByZWFzb24gbm90
IHRvIGRvIHRoYXQsIHBsZWFzZSBjYW4gd2UgbWFrZQo+ID4gPiB0aGlzIHVuY29uZGl0aW9uYWwg
Zm9yIGFybTY0PyBQcmV0dHkgcGxlYXNlPwo+ID4KPiA+IEkgdGhpbmsgaXQncyBmaW5lIHNpbmNl
IHdlIGhhdmUgYSBnb29kIHJlYXNvbi4KPiA+IEFsc28gaWYgc29tZW9uZSBoYXZlIG1lbW9yeSBp
c3N1ZSBpbiBLQVNBTl9WTUFMTE9DLAo+ID4gdGhleSBjYW4gdXNlIFNXX1RBRywgcmlnaHQ/Cj4g
Pgo+ID4gSG93ZXZlciB0aGUgU1dfVEFHL0hXX1RBRyBpcyBub3Qgc3VwcG9ydGVkIFZNQUxMT0Mg
eWV0Lgo+ID4gU28gdGhlIGNvZGUgd291bGQgYmUgbGlrZQo+ID4KPiA+ICAgICAgIGlmIChJU19F
TkFCTEVEKENPTkZJR19LQVNBTl9HRU5FUklDKSkKPgo+IEp1c3QgbWFrZSB0aGlzIENPTkZJR19L
QVNBTl9WTUFMTE9DLCBzaW5jZSB0aGF0IGRlcGVuZHMgb24gS0FTQU5fR0VORVJJQy4KCk9LLCB0
aGlzIGFsc28gbWFrZSBzZW5zZS4KTXkgZmlyc3QgdGhvdWdodCB3YXMgdGhhdCBzZWxlY3Rpbmcg
S0FTQU5fR0VORVJJQyBpbXBsaWVzIFZNQUxMT0MgaW4KYXJtNjQgaXMgYSBzcGVjaWFsIGNhc2Ug
c28gdGhpcyBuZWVkIHdlbGwgZG9jdW1lbnRlZC4KSSdsbCBkb2N1bWVudCB0aGlzIGluIHRoZSBj
b21taXQgbWVzc2FnZSBvZiBLY29uZmlnIHBhdGNoIHRvIGF2b2lkCm1lc3NpbmcgdXAgdGhlIGNv
ZGUgaGVyZS4KCkknbSBnb2luZyB0byBzZW5kIFYzIHBhdGNoLCB0aGFua3MgYWdhaW4gZm9yIHlv
dXIgcmV2aWV3LgoKQlJzLApMZWNvcHplcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
