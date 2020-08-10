Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8EEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 12:44:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD92120729
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 12:44:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O3OCRnWE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lca.pw header.i=@lca.pw header.b="rUgIUgpg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD92120729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y5MUeKNL1zfw3NcO9tcYUDMx7oRfbmorB0t7sOfvHhw=; b=O3OCRnWEXBIov3VAE8Pn0GAJd
	xgE4UsictvBjH+4lze+8JcTtt8sJTvWUXTpXsjMqVDwge90D7gIc9LWdlCXU6gg+sQRBGP38uPXGP
	Jg5kPojVXXq83KUZGaf2t4UYSf8/pTbQ/H8ieKzflhuILUTa2gXvV0OYTNGqZNAQOz4WdRUyPpW8+
	jZyEe/ZLeqlOPVqccGI4fGftEF54pNaMpiOvaixRaVSF/vhN77FfV2aCcrNQV0Nynqz1ZaxuL1leA
	fURMoEUm2wOE4Vne3SV3rpz4AI0t3i/EDOa+E17zW31nUrqVZBqg/8v/KX3GXbw3CWhf8MJinhxb+
	2n8sJSv8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k57AV-0004xF-Ft; Mon, 10 Aug 2020 12:44:47 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k57AP-0004uz-2d
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 12:44:42 +0000
Received: by mail-qt1-x841.google.com with SMTP id c12so6554117qtn.9
 for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2020 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=gAr4D/ePrFPzg5ITCo7F2eiZjjapefZpMToAlkphjvI=;
 b=rUgIUgpgGYUj+dAL7OY+LRW5B1iNfQaizOTu9QModP4rJmLpbj0zM8gSoW2w1gF1gY
 zJV8PNKkE6NtgSi2X3vVTIBw/spdtf7mf7l9OcqJ3uA+1MZ72PhMp3lhE+yX+35/6sKm
 2BXOKptXGfmHSiMh9t93c6NwQX6CX8nkh7+lXAUa2XI8pLhB0IyVbvrXRpeBmlyGd86M
 orq/baff+/CDquuUn8Tt53OsDBxzd8zRTB2ioMuODI0kfd0ZnVPsoFuHJT2QU09M2CEj
 R60Lg3qbqsLE70u2+kBwOqcWgpANqUVqEkqWPi+87reEyhb5ukrem2Y8FB0qlr/gmCwE
 ABqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=gAr4D/ePrFPzg5ITCo7F2eiZjjapefZpMToAlkphjvI=;
 b=UbYZQWalzyExHTX8K20BtuQc6n1zZYa55bv9ABeeoP+vl++TQCkYu6TtlZLHC9IPzg
 v65TDv9YQqVyLrPzcD38MjQ/2tCG8ZZvmYeHCAJfWW4CSAKBwZlFpAIPH7XDtHLUHIdT
 jtTVdGBXqZHZHKVEwx6dI7VWlUn6NLCrzU7lEVi8k1mO027/Buz6qfLi4nOY0JusuTh2
 XZ7C8DsqcXZYVWItbYZ+1UYYNpiniz1Ljc2t3VXkg4g3QYzIcfS4rzVpIRsDHHzOD/F1
 pzBGV1WbMCYfPZBtWl/c5vCQToPWiZmAz+xSYhoyBegoVl/sYDYL+WgyJLv954qGR8sH
 5HRQ==
X-Gm-Message-State: AOAM533lHw3g9ttzZClBooUUazE8OZkhySRSxxxegNkdJjznioqSLa9f
 BZXyxTX5CAzY9Gv1aDyOkY9eKQ==
X-Google-Smtp-Source: ABdhPJzs2CqjFarg0XkEZgbuZmZNab5q0MHr7iwix6stb9A6MtLvWHu783qEEPSn0NIzKfkEUxh6CA==
X-Received: by 2002:ac8:47c8:: with SMTP id d8mr25413219qtr.32.1597063478706; 
 Mon, 10 Aug 2020 05:44:38 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id l1sm15330349qtp.96.2020.08.10.05.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:44:38 -0700 (PDT)
Date: Mon, 10 Aug 2020 08:44:31 -0400
From: Qian Cai <cai@lca.pw>
To: Walter Wu <walter-zh.wu@mediatek.com>
Subject: Re: [PATCH 0/5] kasan: add workqueue and timer stack for generic KASAN
Message-ID: <20200810124430.GA5307@lca.pw>
References: <20200810072115.429-1-walter-zh.wu@mediatek.com>
 <B873B364-FF03-4819-8F9C-79F3C4EF47CE@lca.pw>
 <1597060257.13160.11.camel@mtksdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597060257.13160.11.camel@mtksdccf07>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200810_084441_200140_740BF50E 
X-CRM114-Status: GOOD (  33.70  )
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
Cc: John Stultz <john.stultz@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-mm@kvack.org,
 Stephen Boyd <sboyd@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 Tejun Heo <tj@kernel.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBdWcgMTAsIDIwMjAgYXQgMDc6NTA6NTdQTSArMDgwMCwgV2FsdGVyIFd1IHdyb3Rl
Ogo+IE9uIE1vbiwgMjAyMC0wOC0xMCBhdCAwNzoxOSAtMDQwMCwgUWlhbiBDYWkgd3JvdGU6Cj4g
PiAKPiA+ID4gT24gQXVnIDEwLCAyMDIwLCBhdCAzOjIxIEFNLCBXYWx0ZXIgV3UgPHdhbHRlci16
aC53dUBtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4gPiAKPiA+ID4g77u/U3l6Ym90IHJlcG9ydHMg
bWFueSBVQUYgaXNzdWVzIGZvciB3b3JrcXVldWUgb3IgdGltZXIsIHNlZSBbMV0gYW5kIFsyXS4K
PiA+ID4gSW4gc29tZSBvZiB0aGVzZSBhY2Nlc3MvYWxsb2NhdGlvbiBoYXBwZW5lZCBpbiBwcm9j
ZXNzX29uZV93b3JrKCksCj4gPiA+IHdlIHNlZSB0aGUgZnJlZSBzdGFjayBpcyB1c2VsZXNzIGlu
IEtBU0FOIHJlcG9ydCwgaXQgZG9lc24ndCBoZWxwCj4gPiA+IHByb2dyYW1tZXJzIHRvIHNvbHZl
IFVBRiBvbiB3b3JrcXVldWUuIFRoZSBzYW1lIG1heSBzdGFuZCBmb3IgdGltZXMuCj4gPiA+IAo+
ID4gPiBUaGlzIHBhdGNoc2V0IGltcHJvdmVzIEtBU0FOIHJlcG9ydHMgYnkgbWFraW5nIHRoZW0g
dG8gaGF2ZSB3b3JrcXVldWUKPiA+ID4gcXVldWVpbmcgc3RhY2sgYW5kIHRpbWVyIHF1ZXVlaW5n
IHN0YWNrIGluZm9ybWF0aW9uLiBJdCBpcyB1c2VmdWwgZm9yCj4gPiA+IHByb2dyYW1tZXJzIHRv
IHNvbHZlIHVzZS1hZnRlci1mcmVlIG9yIGRvdWJsZS1mcmVlIG1lbW9yeSBpc3N1ZS4KPiA+ID4g
Cj4gPiA+IEdlbmVyaWMgS0FTQU4gd2lsbCByZWNvcmQgdGhlIGxhc3QgdHdvIHdvcmtxdWV1ZSBh
bmQgdGltZXIgc3RhY2tzLAo+ID4gPiBwcmludCB0aGVtIGluIEtBU0FOIHJlcG9ydC4gSXQgaXMg
b25seSBzdWl0YWJsZSBmb3IgZ2VuZXJpYyBLQVNBTi4KPiA+ID4gCj4gPiA+IEluIG9yZGVyIHRv
IHByaW50IHRoZSBsYXN0IHR3byB3b3JrcXVldWUgYW5kIHRpbWVyIHN0YWNrcywgc28gdGhhdAo+
ID4gPiB3ZSBhZGQgbmV3IG1lbWJlcnMgaW4gc3RydWN0IGthc2FuX2FsbG9jX21ldGEuCj4gPiA+
IC0gdHdvIHdvcmtxdWV1ZSBxdWV1ZWluZyB3b3JrIHN0YWNrcywgdG90YWwgc2l6ZSBpcyA4IGJ5
dGVzLgo+ID4gPiAtIHR3byB0aW1lciBxdWV1ZWluZyBzdGFja3MsIHRvdGFsIHNpemUgaXMgOCBi
eXRlcy4KPiA+ID4gCj4gPiA+IE9yaWduaWFsIHN0cnVjdCBrYXNhbl9hbGxvY19tZXRhIHNpemUg
aXMgMTYgYnl0ZXMuIEFmdGVyIGFkZCBuZXcKPiA+ID4gbWVtYmVycywgdGhlbiB0aGUgc3RydWN0
IGthc2FuX2FsbG9jX21ldGEgdG90YWwgc2l6ZSBpcyAzMiBieXRlcywKPiA+ID4gSXQgaXMgYSBn
b29kIG51bWJlciBvZiBhbGlnbm1lbnQuIExldCBpdCBnZXQgYmV0dGVyIG1lbW9yeSBjb25zdW1w
dGlvbi4KPiA+IAo+ID4gR2V0dGluZyBkZWJ1Z2dpbmcgdG9vbHMgY29tcGxpY2F0ZWQgc3VyZWx5
IGlzIHRoZSBiZXN0IHdheSB0byBraWxsIGl0LiBJIHdvdWxkIGFyZ3VlIHRoYXQgaXQgb25seSBt
YWtlIHNlbnNlIHRvIGNvbXBsaWNhdGUgaXQgaWYgaXQgaXMgdXNlZnVsIG1vc3Qgb2YgdGhlIHRp
bWUgd2hpY2ggSSBuZXZlciBmZWVsIG9yIGhlYXIgdGhhdCBpcyB0aGUgY2FzZS4gVGhpcyByZW1p
bmRzIG1lIHlvdXIgcmVjZW50IGNhbGxfcmN1KCkgc3RhY2tzIHRoYXQgbW9zdCBvZiB0aW1lIGp1
c3QgbWFrZXMgcGFyc2luZyB0aGUgcmVwb3J0IGN1bWJlcnNvbWUuIFRodXMsIEkgdXJnZSB0aGlz
IGV4ZXJjaXNlIHRvIG92ZXItZW5naW5lZXIgb24gc3BlY2lhbCBjYXNlcyBuZWVkIHRvIHN0b3Ag
ZW50aXJlbHkuCj4gPiAKPiAKPiBBIGdvb2QgZGVidWcgdG9vbCBpcyB0byBoYXZlIGNvbXBsZXRl
IGluZm9ybWF0aW9uIGluIG9yZGVyIHRvIHNvbHZlCj4gaXNzdWUuIFdlIHNob3VsZCBmb2N1cyBv
biBpZiBLQVNBTiByZXBvcnRzIGFsd2F5cyBzaG93IHRoaXMgZGVidWcKPiBpbmZvcm1hdGlvbiBv
ciBjcmVhdGUgYSBvcHRpb24gdG8gZGVjaWRlIGlmIHNob3cgaXQuIEJlY2F1c2UgdGhpcwo+IGZl
YXR1cmUgaXMgRGltaXRyeSdzIHN1Z2dlc3Rpb24uIHNlZSBbMV0uIFNvIEkgdGhpbmsgaXQgbmVl
ZCB0byBiZQo+IGltcGxlbWVudGVkLiBNYXliZSB3ZSBjYW4gd2FpdCBoaXMgcmVzcG9uc2UuIAo+
IAo+IFsxXWh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDIwLzYvMjMvMjU2CgpJIGRvbid0IGtub3cg
aWYgaXQgaXMgRG1pdHJ5J3MgcGlwZS1kcmVhbSB3aGljaCBldmVyeSBLQVNBTiByZXBvcnQgd291
bGQgZW5hYmxlCmRldmVsb3BlcnMgdG8gZml4IGl0IHdpdGhvdXQgcmVwcm9kdWNpbmcgaXQuIEl0
IGlzIGFsd2F5cyBhbiBvbmdvaW5nIHN0cnVnZ2xpbmcKYmV0d2VlbiB0byBtYWtlIGtlcm5lbCBl
YXNpZXIgdG8gZGVidWcgYW5kIHRoZSB0aGluZ3MgbGVzcyBjdW1iZXJzb21lLgoKT24gdGhlIG90
aGVyIGhhbmQsIERtaXRyeSdzIHN1Z2dlc3Rpb24gbWFrZXMgc2Vuc2Ugb25seSBpZiB0aGUgcHJp
Y2Ugd2UgYXJlCmdvaW5nIHRvIHBheSBpcyBmYWlyLiBXaXRoIHRoZSBjdXJyZW50IGRpZmZzdGF0
IGFuZCB0aGUgcmVjZW50IGV4cGVyaWVuY2Ugb2YKY2FsbF9yY3UoKSBzdGFja3MgIndhc3RlIiBz
Y3JlZW4gc3BhY2VzIGFzIGEgaGVhdnkgS0FTQU4gdXNlciBteXNlbGYsIEkgY2FuJ3QKcmVhbGx5
IGdldCB0aGF0IGV4Y2l0aW5nIGZvciBwdXNoaW5nIHRoZSBsaW1pdCBhZ2FpbiBhdCBhbGwuCgo+
IAo+IFRoYW5rcy4KPiAKPiA+ID4gCj4gPiA+IFsxXWh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20v
Zy9zeXprYWxsZXItYnVncy9zZWFyY2g/cT0lMjJ1c2UtYWZ0ZXItZnJlZSUyMitwcm9jZXNzX29u
ZV93b3JrCj4gPiA+IFsyXWh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vZy9zeXprYWxsZXItYnVn
cy9zZWFyY2g/cT0lMjJ1c2UtYWZ0ZXItZnJlZSUyMiUyMGV4cGlyZV90aW1lcnMKPiA+ID4gWzNd
aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTg0MzcKPiA+ID4g
Cj4gPiA+IFdhbHRlciBXdSAoNSk6Cj4gPiA+IHRpbWVyOiBrYXNhbjogcmVjb3JkIGFuZCBwcmlu
dCB0aW1lciBzdGFjawo+ID4gPiB3b3JrcXVldWU6IGthc2FuOiByZWNvcmQgYW5kIHByaW50IHdv
cmtxdWV1ZSBzdGFjawo+ID4gPiBsaWIvdGVzdF9rYXNhbi5jOiBhZGQgdGltZXIgdGVzdCBjYXNl
Cj4gPiA+IGxpYi90ZXN0X2thc2FuLmM6IGFkZCB3b3JrcXVldWUgdGVzdCBjYXNlCj4gPiA+IGth
c2FuOiB1cGRhdGUgZG9jdW1lbnRhdGlvbiBmb3IgZ2VuZXJpYyBrYXNhbgo+ID4gPiAKPiA+ID4g
RG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMva2FzYW4ucnN0IHwgIDQgKystLQo+ID4gPiBpbmNsdWRl
L2xpbnV4L2thc2FuLmggICAgICAgICAgICAgfCAgNCArKysrCj4gPiA+IGtlcm5lbC90aW1lL3Rp
bWVyLmMgICAgICAgICAgICAgICB8ICAyICsrCj4gPiA+IGtlcm5lbC93b3JrcXVldWUuYyAgICAg
ICAgICAgICAgICB8ICAzICsrKwo+ID4gPiBsaWIvdGVzdF9rYXNhbi5jICAgICAgICAgICAgICAg
ICAgfCA1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiA+ID4gbW0va2FzYW4vZ2VuZXJpYy5jICAgICAgICAgICAgICAgIHwgNDIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+IG1tL2thc2FuL2thc2Fu
LmggICAgICAgICAgICAgICAgICB8ICA2ICsrKysrLQo+ID4gPiBtbS9rYXNhbi9yZXBvcnQuYyAg
ICAgICAgICAgICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCj4gPiA+IDggZmlsZXMg
Y2hhbmdlZCwgMTM0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiA+IAo+ID4gPiAt
LSAKPiA+ID4gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2Ny
aWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAia2FzYW4tZGV2IiBncm91cC4KPiA+ID4gVG8gdW5z
dWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBp
dCwgc2VuZCBhbiBlbWFpbCB0byBrYXNhbi1kZXYrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNv
bS4KPiA+ID4gVG8gdmlldyB0aGlzIGRpc2N1c3Npb24gb24gdGhlIHdlYiB2aXNpdCBodHRwczov
L2dyb3Vwcy5nb29nbGUuY29tL2QvbXNnaWQva2FzYW4tZGV2LzIwMjAwODEwMDcyMTE1LjQyOS0x
LXdhbHRlci16aC53dSU0MG1lZGlhdGVrLmNvbS4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
