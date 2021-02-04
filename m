Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B016C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 16:06:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28FEF64DFF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 16:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28FEF64DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ayCL/NIalVGyrL3+gff+WJ3Oc3a+lHGbNX266dgSoEU=; b=lpOcDAnnYfGoQpyKKfU6Ln+Vx
	8TKHx/d8cc3MKOz/JwhF+AlRqZj5bTVj24mdDEAJgNM+Dd1JILjwNFZCoRDm6XhUS+J1xbxLVAZG1
	OvfAscgt7oH3F6CuyCDpfY0A3KLw2YeKWwVWsobj6d9Fbk6fhG5aJjlO8yyvzbttGwfSN0zZXFBem
	005a134S7bBIyl3LgudpzOoO+WOI8bL/8Y3pgdHMccXbW3SQQuNIdiXa2yvDrXITxqj31RMMJjv2p
	2tiEOrzxjiIRvnvv0lMBm6bRgi3+jELN3xiUqKJ6yaQgt1r7QH9hlQV0OMA3fTd8ZiE7hlzt9n82v
	lSSJTAuSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7h9I-00011m-W7; Thu, 04 Feb 2021 16:06:29 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7h9D-0000zd-TM; Thu, 04 Feb 2021 16:06:24 +0000
Received: by mail-pg1-x52f.google.com with SMTP id t25so2436754pga.2;
 Thu, 04 Feb 2021 08:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=W/NQRUXI9589A4ZazyD5B/LtPSn045ZMqU/tdzMr9Nk=;
 b=JgOhI2CE0T4LUdKT1fNmcpcfxpFaTbmeD/PHPA8CRSr65dVrRds/cSyg4PeLsHi9va
 rb7k1a2QLMjZtQ2EAuXDIB2suLVzIChIynDNg1JqBJZ0XWotXWgks2h3Ppmr7OJbBc0J
 gMNEwgEFZr1r4B5ixaJ7iinkzL3hyF+FPYENCvP7td6ajRt2oFj01nI5vO/6LEjRjXa+
 iwV5wknuqwIRHrL47qipSp5mBVWsOZdnW9MU8yTWzGs8NaA4ruqnpzqd/FR4wlWPDajT
 s1onThyOpAw1/tmUqbLwvNgkyUAUszcwINQreZmG33C3ONiOJYm3yrAw4E9y7991+vFQ
 zkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=W/NQRUXI9589A4ZazyD5B/LtPSn045ZMqU/tdzMr9Nk=;
 b=Hs/O+7MS4B5YdB+1Yeb59F7Qks0ndRfgtrwMp1oNcTQoo8DR0IPE0X/eCrjY6Jdgwc
 h8R+grRP7THv+XBCyR+HQVyenZ5gOk5JhMVA3o5yQAy0fhErxqGzeQIVetPhiWD8PjAZ
 scggzND5kigC+8Qvq93luMdv8s6RsED788SafO0BxucF6FVNFAogw+LmE5JdsloiJiFi
 Gw/bgj6nB9F+95inwOqVaEnzp2C8hsNbeWRk3euOlAWnjMb6RS/WBPcsRhj4B/wcgDR5
 BDRr5eBPEsAm9rebqHCi1TC1Sw+glo2ri/kIRkmWOIDt1Dk+br09R9Dks1BXh20NPWy/
 DTYw==
X-Gm-Message-State: AOAM530yvDjOo5ej8TTsDNCo9qdCctHKtkWK39AlukWos0PPZ0sPFe8O
 sb0KeW/y21PTzBMcI5XPA+fi3323FClIlhLe4Nk=
X-Google-Smtp-Source: ABdhPJxjFrtCvT2r/ewWjgUTbJGr+6RgPWro771pobQ/EYHPZG4jzCn1uGBr8IE5HSf2YkMBmWchslziqzV5pz8gl0w=
X-Received: by 2002:a63:5c0a:: with SMTP id q10mr9681668pgb.277.1612454781557; 
 Thu, 04 Feb 2021 08:06:21 -0800 (PST)
MIME-Version: 1.0
References: <20210204124658.GB20468@willie-the-truck>
 <20210204145127.75856-1-lecopzer@gmail.com>
 <20210204145547.GD20815@willie-the-truck>
In-Reply-To: <20210204145547.GD20815@willie-the-truck>
From: Lecopzer Chen <lecopzer@gmail.com>
Date: Fri, 5 Feb 2021 00:06:10 +0800
Message-ID: <CANr2M1-=ONun5fLNoODftmfcuWw49hj9yXsrxkqrfCEtELX1hw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: kasan: abstract _text and _end to
 KERNEL_START/END
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_110623_981291_ABB58109 
X-CRM114-Status: GOOD (  23.85  )
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

SSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gbGVhdmUgdGhpcyBmb3IgeW91IHNpbmNlIEkn
bSBub3QKZmFtaWxpYXIgd2l0aCB0aGUgcmVsYXRpb25zaGlwCmJldHdlZW4gdm1lbW1hcCgpIGFu
ZCBOVU1BX05PX05PREUuCgpTbyBJIHdvdWxkIGp1c3Qga2VlcCB0aGlzIHBhdGNoIGluIG5leHQg
dmVyc2lvbiwgaXMgdGhpcyBmaW5lIHdpdGggeW91PwoKClRoYW5rcyBmb3IgeW91ciBoZWxwOikK
CkxlY29wemVyCgoKCldpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0Muac
iDTml6Ug6YCx5ZubIOS4i+WNiDEwOjU15a+r6YGT77yaCj4KPiBPbiBUaHUsIEZlYiAwNCwgMjAy
MSBhdCAxMDo1MToyN1BNICswODAwLCBMZWNvcHplciBDaGVuIHdyb3RlOgo+ID4gPiBPbiBTYXQs
IEphbiAwOSwgMjAyMSBhdCAwNjozMjo1MFBNICswODAwLCBMZWNvcHplciBDaGVuIHdyb3RlOgo+
ID4gPiA+IEFybTY0IHByb3ZpZGUgZGVmaW5lZCBtYWNybyBmb3IgS0VSTkVMX1NUQVJUIGFuZCBL
RVJORUxfRU5ELAo+ID4gPiA+IHRodXMgcmVwbGFjZSB0aGVtIGJ5IHRoZSBhYnN0cmF0aW9uIGlu
c3RlYWQgb2YgdXNpbmcgX3RleHQgYW5kIF9lbmQuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBMZWNvcHplciBDaGVuIDxsZWNvcHplci5jaGVuQG1lZGlhdGVrLmNvbT4KPiA+ID4gPiAt
LS0KPiA+ID4gPiAgYXJjaC9hcm02NC9tbS9rYXNhbl9pbml0LmMgfCA2ICsrKy0tLQo+ID4gPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5jIGIvYXJjaC9h
cm02NC9tbS9rYXNhbl9pbml0LmMKPiA+ID4gPiBpbmRleCAzOWIyMThhNjQyNzkuLmZhOGQ3ZWNl
ODk1ZCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L21tL2thc2FuX2luaXQuYwo+ID4g
PiA+ICsrKyBiL2FyY2gvYXJtNjQvbW0va2FzYW5faW5pdC5jCj4gPiA+ID4gQEAgLTIxOCw4ICsy
MTgsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQga2FzYW5faW5pdF9zaGFkb3codm9pZCkKPiA+ID4g
PiAgIHBoeXNfYWRkcl90IHBhX3N0YXJ0LCBwYV9lbmQ7Cj4gPiA+ID4gICB1NjQgaTsKPiA+ID4g
Pgo+ID4gPiA+IC0ga2ltZ19zaGFkb3dfc3RhcnQgPSAodTY0KWthc2FuX21lbV90b19zaGFkb3co
X3RleHQpICYgUEFHRV9NQVNLOwo+ID4gPiA+IC0ga2ltZ19zaGFkb3dfZW5kID0gUEFHRV9BTElH
TigodTY0KWthc2FuX21lbV90b19zaGFkb3coX2VuZCkpOwo+ID4gPiA+ICsga2ltZ19zaGFkb3df
c3RhcnQgPSAodTY0KWthc2FuX21lbV90b19zaGFkb3coS0VSTkVMX1NUQVJUKSAmIFBBR0VfTUFT
SzsKPiA+ID4gPiArIGtpbWdfc2hhZG93X2VuZCA9IFBBR0VfQUxJR04oKHU2NClrYXNhbl9tZW1f
dG9fc2hhZG93KEtFUk5FTF9FTkQpKTsKPiA+ID4gPgo+ID4gPiA+ICAgbW9kX3NoYWRvd19zdGFy
dCA9ICh1NjQpa2FzYW5fbWVtX3RvX3NoYWRvdygodm9pZCAqKU1PRFVMRVNfVkFERFIpOwo+ID4g
PiA+ICAgbW9kX3NoYWRvd19lbmQgPSAodTY0KWthc2FuX21lbV90b19zaGFkb3coKHZvaWQgKilN
T0RVTEVTX0VORCk7Cj4gPiA+ID4gQEAgLTI0MSw3ICsyNDEsNyBAQCBzdGF0aWMgdm9pZCBfX2lu
aXQga2FzYW5faW5pdF9zaGFkb3codm9pZCkKPiA+ID4gPiAgIGNsZWFyX3BnZHMoS0FTQU5fU0hB
RE9XX1NUQVJULCBLQVNBTl9TSEFET1dfRU5EKTsKPiA+ID4gPgo+ID4gPiA+ICAga2FzYW5fbWFw
X3BvcHVsYXRlKGtpbWdfc2hhZG93X3N0YXJ0LCBraW1nX3NoYWRvd19lbmQsCj4gPiA+ID4gLSAg
ICAgICAgICAgICAgICAgICAgZWFybHlfcGZuX3RvX25pZCh2aXJ0X3RvX3BmbihsbV9hbGlhcyhf
dGV4dCkpKSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgZWFybHlfcGZuX3RvX25pZCh2
aXJ0X3RvX3BmbihsbV9hbGlhcyhLRVJORUxfU1RBUlQpKSkpOwo+ID4gPgo+ID4gPiBUbyBiZSBo
b25lc3QsIEkgdGhpbmsgdGhpcyB3aG9sZSBsaW5lIGlzIHBvaW50bGVzcy4gV2Ugc2hvdWxkIGJl
IGFibGUgdG8KPiA+ID4gcGFzcyBOVU1BX05PX05PREUgbm93IHRoYXQgd2UncmUgbm90IGFidXNp
bmcgdGhlIHZtZW1tYXAoKSBhbGxvY2F0b3IgdG8KPiA+ID4gcG9wdWxhdGUgdGhlIHNoYWRvdy4K
PiA+Cj4gPiBEbyB3ZSBuZWVkIHRvIGZpeCB0aGlzIGluIHRoaXMgc2VyaWVzPyBpdCBzZWVtcyBh
bm90aGVyIHRvcGljLgo+ID4gSWYgbm90LCBzaG91bGQgdGhpcyBwYXRjaCBiZSByZW1vdmVkIGlu
IHRoaXMgc2VyaWVzPwo+Cj4gU2luY2UgeW91J3JlIHJlcG9zdGluZyBhbnl3YXksIHlvdSBtYXkg
YXMgd2VsbCBpbmNsdWRlIGEgcGF0Y2ggZG9pbmcgdGhhdC4KPiBJZiB5b3UgZG9uJ3QsIHRoZW4g
SSB3aWxsLgo+Cj4gV2lsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
