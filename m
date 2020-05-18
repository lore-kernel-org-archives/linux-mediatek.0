Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C263C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 06:26:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C8A22070A
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 06:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHZCA5F4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3xPJZtp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C8A22070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twLrtLbW16kSe/jeSgwP4mJtw4bS1C6aFQOhq86+iAw=; b=qHZCA5F48gC1Gl
	y4RtW1GEX4l3X6qMZczZhFtsEc4ZCq1AOu1uMjYXORAt4NpvR0xb1xdH9y9kTE2Soiup1sHxBPNcr
	/Un2nRqI1/dC13wlpGOeAj1lWcYpj+z8ewlN2EoIKDbSSXs5UaLRlVmHUlgasYTmWMgl9SljEl34W
	Lg9YtjGB8MNqJ98DlVYCk/FJAzJKTjPT0zbJ2wlzKfYM6/IJZZcSNQUuw2ko5PjAie2Y5l5bpDz6i
	1NFE/Uz8e3h/3QSVSdkpN2e54gVHi0f/cVN8NK7lbkU9lfiTXWhCPctDQbU7iA8HcxiZDFJvZpkm7
	7inRLfhaXRfh+Hiwx91Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaZE8-0001nP-Lc; Mon, 18 May 2020 06:26:16 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaZE6-0001mz-1W; Mon, 18 May 2020 06:26:15 +0000
Received: by mail-pj1-x1041.google.com with SMTP id s69so4650371pjb.4;
 Sun, 17 May 2020 23:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sqEbuUUC6vd4Sa66d08NNo4B0txnWr9aDhBTPjvmYJ8=;
 b=X3xPJZtpZ+1rw0mFFaFkJlO44v9hlmZCh+zJeg9JgWkvvtlZOPOXfPTsK01TqHRmgr
 oLDaaMSe5J/NidcHTI+itTPoh7TsAZJ8xd1iMI/5nltzxBJzppACR5SdjJtxw56JwHOw
 o03MowbtjoB6XR0HlELcpQFaI4lE3F51CCdp7GsHRTzIkA9AbO83juZNwf7dyJUCZ6XE
 8tLUzs9bkvSuBs1PbvkDXilxaEDWIU8TN4tCfSKuYG/RzOUCBWw64ffJSU+Ev3OuqusW
 OBGzjpi33ZJCL4CBKM1hQ6CQApI7CgYKkJqn35zU2xE0cW0x574QIJ+lmAVo4IiUKn8A
 QSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sqEbuUUC6vd4Sa66d08NNo4B0txnWr9aDhBTPjvmYJ8=;
 b=C09bO6ADP1iuim7ESWSD9JWYCDxylEla1CDTZLr7+ZHhukLaK3fltb0ZSuikyrdMJ5
 CUDLWhkLokk/nbn7POePBbwnmuyTMd9kw/xmU6PbV1nwAl9mpNFzUI3jChd3E1EKzGnI
 oguo+qEswPHKPNn6/RGoBB0HYxpz6VxSHOGu2K8G4LZrp0/+zTR7SiobZsgdYveQc4pi
 GkLaWp9xnfebyAMroPPbdBrs1B0e+HPGh8tTLwLbKmdjGwqvepb7Q38HFYnUzf87ncuT
 XrHB8YBTes3v2hRd+LN0+fQmTQFKR6vEQhGtOuEWXMWmZeSQIswDm2KAPOU8sYUwclzD
 Oo3w==
X-Gm-Message-State: AOAM5332ND17SPKF5ppEtX1rtjZnRA3paDHXwegTfK6hPGCC9wA/3hvw
 /gDqDifXrv1WcJl1luWE5hXNpWuKh/dUZRpm35Y=
X-Google-Smtp-Source: ABdhPJzYBVm9s1yrTK8/5YWe8NEHNxv4hskZUXZjYG1F24Mm5WP6B5+11QjZuwKa0CwSkFe2FsaUj0X2L8ft4fkWmjo=
X-Received: by 2002:a17:902:b088:: with SMTP id
 p8mr15507720plr.123.1589783173163; 
 Sun, 17 May 2020 23:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200516124857.75004-1-lecopzer@gmail.com>
 <CAFA6WYNwp+_ENiS8QDao5+RXyt5ofJZyq6c5CKG_d0CNEmBNYg@mail.gmail.com>
In-Reply-To: <CAFA6WYNwp+_ENiS8QDao5+RXyt5ofJZyq6c5CKG_d0CNEmBNYg@mail.gmail.com>
From: Lecopzer Chen <lecopzer@gmail.com>
Date: Mon, 18 May 2020 14:26:00 +0800
Message-ID: <CANr2M19unLW8n0P2DiOYEZ=GZcaD-L2ygPht_5HNtNZ6e4h6xQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: perf: Add support for Perf NMI interrupts
To: Sumit Garg <sumit.garg@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_232614_083102_91A3E0E3 
X-CRM114-Status: GOOD (  18.85  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jian-Lin Chen <lecopzer.chen@mediatek.com>, Will Deacon <will@kernel.org>,
 alexander.shishkin@linux.intel.com, Catalin Marinas <catalin.marinas@arm.com>,
 yj.chiang@mediatek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, acme@kernel.org,
 Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 matthias.bgg@gmail.com, namhyung@kernel.org, jolsa@redhat.com,
 julien.thierry.kdev@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SEkgU3VtaXQsCgpUaGFua3MgZm9yIHlvdXIgaW5mb3JtYXRpb24uCgpJJ3ZlIGFscmVhZHkgaW1w
bGVtZW50ZWQgSVBJIChzYW1lIGFzIHlvdSBkaWQgWzFdLCBsaXR0bGUgZGlmZmVyZW5jZQppbiBk
ZXRhaWwpLCBoYXJkbG9ja3VwIGRldGVjdG9yIGFuZCBwZXJmIGluIGxhc3QgeWVhcigyMDE5KSBm
b3IKZGVidWdnYWJpbGl0eS4KQW5kIG5vdyB3ZSB0ZW5kIHRvIHVwc3RyZWFtIHRvIHJlZHVjZSBr
ZXJuZWwgbWFpbnRhaW5pbmcgZWZmb3J0LgpJJ20gZ2xhZCBpZiBzb21lb25lIGluIEFSTSBjYW4g
ZG8gdGhpcyB3b3JrIDopCgpIaSBKdWxpZW4sCgpEb2VzIGFueSBBcm0gbWFpbnRhaW5lcnMgY2Fu
IHByb2NlZWQgdGhpcyBhY3Rpb24/ClRoaXMgaXMgcmVhbGx5IHVzZWZ1bCBpbiBkZWJ1Z2dpbmcu
ClRoYW5rIHlvdSEhCgoKClsxXSBodHRwczovL2xrbWwub3JnL2xrbWwvMjAyMC80LzI0LzMyOAoK
CkxlY29wemVyCgpTdW1pdCBHYXJnIDxzdW1pdC5nYXJnQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0
NeaciDE45pelIOmAseS4gCDkuIvljYgxOjQ25a+r6YGT77yaCj4KPiArIEp1bGllbgo+Cj4gSGkg
TGVjb3B6ZXIsCj4KPiBPbiBTYXQsIDE2IE1heSAyMDIwIGF0IDE4OjIwLCBMZWNvcHplciBDaGVu
IDxsZWNvcHplckBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZXNlIHNlcmllcyBpbXBsZW1l
bnQgUGVyZiBOTUkgZnVueHRpb25hbGl0eSBhbmQgZGVwZW5kcyBvbgo+ID4gUHNldWRvIE5NSSBb
MV0gd2hpY2ggaGFzIGJlZW4gdXBzdHJlYW1lZC4KPiA+Cj4gPiBJbiBhcm02NCB3aXRoIEdJQ3Yz
LCBQc2V1ZG8gTk1JIHdhcyBpbXBsZW1lbnRlZCBmb3IgTk1JLWxpa2UgaW50ZXJydXRzLgo+ID4g
VGhhdCBjYW4gYmUgZXh0ZW5kZWQgdG8gUGVyZiBOTUkgd2hpY2ggaXMgdGhlIHByZXJlcXVpc2l0
ZSBmb3IgaGFyZC1sb2NrdXAKPiA+IGRldGVjdG9yIHdoaWNoIGhhZCBhbHJlYWR5IGEgc3RhbmRh
cmQgaW50ZXJmYWNlIGluc2lkZSBMaW51eC4KPiA+Cj4gPiBUaHVzIHRoZSBmaXJzdCBzdGVwIHdl
IG5lZWQgdG8gaW1wbGVtZW50IHBlcmYgTk1JIGludGVyZmFjZSBhbmQgbWFrZSBzdXJlCj4gPiBp
dCB3b3JrcyBmaW5lLgo+ID4KPgo+IFRoaXMgaXMgc29tZXRoaW5nIHRoYXQgaXMgYWxyZWFkeSBp
bXBsZW1lbnRlZCB2aWEgSnVsaWVuJ3MgcGF0Y2gtc2V0Cj4gWzFdLiBJdHMgdjQgaGFzIGJlZW4g
ZmxvYXRpbmcgc2luY2UgSnVseSwgMjAxOSBhbmQgSSBjb3VsZG4ndCBmaW5kIGFueQo+IG1ham9y
IGJsb2NraW5nIGNvbW1lbnRzIGJ1dCBub3Qgc3VyZSB3aHkgdGhpbmdzIGhhdmVuJ3QgcHJvZ3Jl
c3NlZAo+IGZ1cnRoZXIuCj4KPiBNYXliZSBKdWxpZW4gb3IgQXJtIG1haW50YWluZXJzIGNhbiBw
cm92aWRlIHVwZGF0ZXMgb24gZXhpc3RpbmcKPiBwYXRjaC1zZXQgWzFdIGFuZCBob3cgd2Ugc2hv
dWxkIHByb2NlZWQgZnVydGhlciB3aXRoIHRoaXMgaW50ZXJlc3RpbmcKPiBmZWF0dXJlLgo+Cj4g
QW5kIHJlZ2FyZGluZyBoYXJkLWxvY2t1cCBkZXRlY3Rpb24sIEkgaGF2ZSBiZWVuIGFibGUgdG8g
ZW5hYmxlIGl0Cj4gYmFzZWQgb24gcGVyZiBOTUkgZXZlbnRzIHVzaW5nIEp1bGllbidzIHBlcmYg
cGF0Y2gtc2V0IFsxXS4gSGF2ZSBhCj4gbG9vayBhdCB0aGUgcGF0Y2ggaGVyZSBbMl0uCj4KPiBb
MV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTA0NzQwNy8KPiBbMl0gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LWFybS1rZXJuZWwvMjAyMC1N
YXkvNzMyMjI3Lmh0bWwKPgo+IC1TdW1pdAo+Cj4gPiBQZXJmIE5NSSBoYXMgYmVlbiB0ZXN0IGJ5
IGRkIGlmPS9kZXYvdXJhbmRvbSBvZj0vZGV2L251bGwgbGlrZSB0aGUgbGluayBbMl0KPiA+IGRp
ZC4KPiA+Cj4gPiBbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMS8zMS81MzUKPiA+IFsy
XSBodHRwczovL3d3dy5saW5hcm8ub3JnL2Jsb2cvZGVidWdnaW5nLWFybS1rZXJuZWxzLXVzaW5n
LW5taWZpcQo+ID4KPiA+Cj4gPiBMZWNvcHplciBDaGVuICgzKToKPiA+ICAgYXJtX3BtdTogQWRk
IHN1cHBvcnQgZm9yIHBlcmYgTk1JIGludGVycnVwdHMgcmVnaXN0cmF0aW9uCj4gPiAgIGFybTY0
OiBwZXJmOiBTdXBwb3J0IE5NSSBjb250ZXh0IGZvciBwZXJmIGV2ZW50IElTUgo+ID4gICBhcm02
NDogS2NvbmZpZzogQWRkIHN1cHBvcnQgZm9yIHRoZSBQZXJmIE5NSQo+ID4KPiA+ICBhcmNoL2Fy
bTY0L0tjb25maWcgICAgICAgICAgICAgfCAxMCArKysrKysrCj4gPiAgYXJjaC9hcm02NC9rZXJu
ZWwvcGVyZl9ldmVudC5jIHwgMzYgKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gPiAgZHJpdmVy
cy9wZXJmL2FybV9wbXUuYyAgICAgICAgIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvcGVyZi9hcm1fcG11LmggICB8ICA2ICsrKysKPiA+
ICA0IGZpbGVzIGNoYW5nZWQsIDg4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+ID4K
PiA+IC0tCj4gPiAyLjI1LjEKPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4g
PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
