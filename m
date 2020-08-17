Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62ECC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 14:56:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B459B205CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 14:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RiSwkYlq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GxOQzsE9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B459B205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z+4JkOXiLSyEY44OUPPm33lZg8eRrgbeTaqgFXEJO3w=; b=RiSwkYlqp9cfVrJqSKSGWH5CE
	Zns1Vn46Ta/gcm4gHQuRU2AcGRmoWsZTal0t4p0sQu4FdeB5EZPbbkQpLz5HvsBjhoaZaZCUWSXWr
	FrxksHR3YYuwS7C2pkFQ4wvBBEZneQ2aeryNy7D/OcbpRv/7y2Z8JtO68sJq71RLPIRRXSSRrfGPe
	xvbs6ZPpPvQxR3LlemQnmAo3daynPk6gGUZePq8Jc/GlEKNWKSYyCQhLzhRz3MN23vMyEHuBMRTiX
	Wgq+v1y8vxQbB/NqMAWu78wJsxEAjG+yfb+kjvpmqoQJnhtc+CcpovKCol3qQZR0qvJIvvZl/FH79
	DCL0idSYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7gYk-0001vy-GQ; Mon, 17 Aug 2020 14:56:26 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7gYi-0001ur-6C
 for linux-mediatek@lists.infradead.org; Mon, 17 Aug 2020 14:56:25 +0000
Received: by mail-oo1-xc41.google.com with SMTP id u28so3440975ooe.12
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Aug 2020 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LEq4BmbM6NwhbOqFE2FhCpoi1VYEMSkPRFzPRH5IW3c=;
 b=GxOQzsE9dyQ0IXoSsbmKr2359q3ZzDs0IxkZWDpwb4+2iXAZxvFUsZfUHoMC06NeTC
 6v0XrZMi30iGDfmm83vM6I0vq+6XuIMG89r+0PXkGirpA1VYpvOr294kP+dwfGKY3WkI
 BCQW8KVjDUG41CXcjn7rp6EBizvMI4vF1ETFJ3jKt41LexinclP1eL32cvugpXDXpgi7
 U8Ns8QK8UL8S6vPW0PyCctvrALDaSv9UmPzDGdfoMi5p3fdQqP4/+MaQINnIAyIFB9iI
 6bpkMXdG2blDsTIB0t4ohbm8Xns3eO87NJLorAJIYIa/GVapbapM/bJfH74uggwqjBme
 rlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LEq4BmbM6NwhbOqFE2FhCpoi1VYEMSkPRFzPRH5IW3c=;
 b=a1KVpHij7s0s/4tG8wn+kaCvFSSnaKc5/+meUc3y7DAY9d/0BU5Z09aPPu8N7roHWA
 fLEFY7YPoT+CDyy6tGU5Y2XvqjHz7plI2vZzp4K95C3dr9ebRQnLKiElgNCBDbgTuAng
 D1rIYrjkDUw+vsz2QfFoPm1LrITT86T6cYfOXeDK2rQZZ5Vs3B87vvXkpcyjnRknA2J0
 7x6P0AnX/jmuLr6QV8bV4kMqLpuX3J6fHhqnfEuE8AJyrym6B/ImoBgBKZ1BzmWNHr/5
 6akY8C+d/bOTO2xyEzvM2aPBIH5Pvf9Zwh8pQfCaCYPFJVS3s6AWuM2P1nielZtxBPeq
 fjOQ==
X-Gm-Message-State: AOAM530ugcA4yMYyZpEow41lHVEPyq2z4QV6PQWtk6XHACCa9js28KE9
 md7URnbWnuLH3YA1L7evcyr9gUVM9R5GvYKEY1E=
X-Google-Smtp-Source: ABdhPJwd03kpRCw1Zwh51o7SjseXp7aqp5Pc25IzoSjgjnnMBF52f+6xOCwpjK6xqadlMK7REEVUaIhRjDmpvnN0KQ4=
X-Received: by 2002:a4a:e618:: with SMTP id f24mr11184531oot.75.1597676180613; 
 Mon, 17 Aug 2020 07:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <trinity-e15639c2-d077-4b70-b351-a5888543688c-1597675629284@3c-app-gmx-bs07>
In-Reply-To: <trinity-e15639c2-d077-4b70-b351-a5888543688c-1597675629284@3c-app-gmx-bs07>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 17 Aug 2020 16:56:08 +0200
Message-ID: <CAFqH_510ykRd=79hUKbK5k8fqWzt=wri6=-Mv1zvV8inquPmPg@mail.gmail.com>
Subject: Re: [BUG] 5.9-rc1 broken bootup on mt7622/mt7623
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_105624_254067_6B7B8D2E 
X-CRM114-Status: GOOD (  14.55  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgRnJhbmssCgpNaXNzYXRnZSBkZSBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1YmxpYy1m
aWxlcy5kZT4gZGVsIGRpYSBkbC4sIDE3CmTigJlhZy4gMjAyMCBhIGxlcyAxNjo0ODoKPgo+IEhp
Cj4KPiBhdCBsZWFzdCBteSBCYW5hbmFwaSBSMi9SNjQgZG9lcyBub3QgYm9vdHVwIChubyBvdXRw
dXQgb24gc2VyaWFsIGNvbnNvbGUpIHdpdGggNS45LXJjMQo+Cj4gbWFkZSBhIGJpc2VjdCB3aGlj
aCBwb2ludHMgbWUgdG8gdGhpcyBjb21taXQ6Cj4KPiBjb21taXQgZjk3ZGJmNDhjYTQzMDA5ZThi
OGJjZGYwN2Y0N2ZjOWYwNjE0OWIzNgo+IEF1dGhvcjogU2FyYXZhbmEgS2FubmFuIDxzYXJhdmFu
YWtAZ29vZ2xlLmNvbT4KPiBEYXRlOiAgIEZyaSBKdWwgMTcgMTc6MDY6MzYgMjAyMCAtMDcwMAo+
Cj4gICAgIGlycWNoaXAvbXRrLXN5c2lycTogQ29udmVydCB0byBhIHBsYXRmb3JtIGRyaXZlcgo+
Cj4gICAgIFRoaXMgZHJpdmVyIGNhbiB3b3JrIGFzIGEgcGxhdGZvcm0gZHJpdmVyLiBTbyBjb3Zl
cnQgaXQgdG8gYSBwbGF0Zm9ybQo+ICAgICBkcml2ZXIuCj4KPiAgICAgU2lnbmVkLW9mZi1ieTog
U2FyYXZhbmEgS2FubmFuIDxzYXJhdmFuYWtAZ29vZ2xlLmNvbT4KPiAgICAgU2lnbmVkLW9mZi1i
eTogTWFyYyBaeW5naWVyIDxtYXpAa2VybmVsLm9yZz4KPiAgICAgUmV2aWV3ZWQtYnk6IEhhbmtz
IENoZW4gPGhhbmtzLmNoZW5AbWVkaWF0ZWsuY29tPgo+ICAgICBMaW5rOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjAwNzE4MDAwNjM3LjM2MzI4NDEtNC1zYXJhdmFuYWtAZ29vZ2xlLmNv
bQo+CgpMb29rcyBsaWtlIGFsbCBNZWRpYXRlayBkZXZpY2VzIGFyZSBicm9rZW4sIHlvdSBzaG91
bGQgdHJ5IGlmIHRoaXMgWzFdCmZpeGVzIHRoZSBpc3N1ZSBmb3IgeW91LiBJdCBmaXhlcyBmb3Ig
bWUuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bWF6L2FybS1wbGF0Zm9ybXMuZ2l0L2NvbW1pdC8/aD1pcnEvaXJxY2hpcC1uZXh0JmlkPTc4Mjhh
M2VmODY0NmZiMmU2OWVkNDU2MTZjODQ1M2EwMzdjYTc4NjcKCkNoZWVycywKIEVucmljCgo+ICBk
cml2ZXJzL2lycWNoaXAvaXJxLW10ay1zeXNpcnEuYyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBhdCBsZWFzdCBvbiBteSBkZXZp
Y2VzIGkgZ290IDUuOSB3b3JraW5nIGJ5IHJldmVydGluZyB0aGUgY29tbWl0LCB3aWxsIHNlbmQg
YSByZXZlcnQtUGF0Y2gKPgo+ICQgZ2l0IGJpc2VjdCBsb2cKPiBnaXQgYmlzZWN0IHN0YXJ0Cj4g
IyBiYWQ6IFtkMjRiNWFiYzQ2NDBiNDZiYjM1NmJiNTM3MWQyNDQ4NjZhNWZlMGEzXSBnaXRpZ25v
cmU6IGFkZCBmcm9tIDUuOCArIGl0Yi9tb2QKPiBnaXQgYmlzZWN0IGJhZCBkMjRiNWFiYzQ2NDBi
NDZiYjM1NmJiNTM3MWQyNDQ4NjZhNWZlMGEzCj4gIyBnb29kOiBbYmNmODc2ODcwYjk1NTkyYjUy
NTE5ZWQ0YWFmY2Y5ZDk1OTk5YmM5Y10gTGludXggNS44Cj4gZ2l0IGJpc2VjdCBnb29kIGJjZjg3
Njg3MGI5NTU5MmI1MjUxOWVkNGFhZmNmOWQ5NTk5OWJjOWMKPiAjIGJhZDogWzgxODY3NDk2MjFl
ZDZiOGZjNDI2NDRjMzk5ZThjNzU1YTJiNmY2MzBdIE1lcmdlIHRhZyAnZHJtLW5leHQtMjAyMC0w
OC0wNicgb2YgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybQo+IGdpdCBiaXNl
Y3QgYmFkIDgxODY3NDk2MjFlZDZiOGZjNDI2NDRjMzk5ZThjNzU1YTJiNmY2MzAKPiAjIGJhZDog
WzIzMjRkNTBkMDUxZWMwZjE0YTU0OGU3ODU1NGZiMDI1MTNkNmRjZWZdIE1lcmdlIHRhZyAnZG9j
cy01LjknIG9mIGdpdDovL2dpdC5sd24ubmV0L2xpbnV4Cj4gZ2l0IGJpc2VjdCBiYWQgMjMyNGQ1
MGQwNTFlYzBmMTRhNTQ4ZTc4NTU0ZmIwMjUxM2Q2ZGNlZgo+ICMgZ29vZDogWzkyYzU5ZTEyNmIy
MWZkMjEyMTk1MzU4YTBkMjk2ZTc4N2U0NDQwODddIE1lcmdlIHRhZyAnYXJtLWRlZmNvbmZpZy01
LjknIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9zb2Mv
c29jCj4gZ2l0IGJpc2VjdCBnb29kIDkyYzU5ZTEyNmIyMWZkMjEyMTk1MzU4YTBkMjk2ZTc4N2U0
NDQwODcKPiAjIGdvb2Q6IFtkNGRiNGU1NTMyNDllZGE5MDE2ZmFiMmUzNjNjMjZlNTJjNDc5MjZm
XSBNZXJnZSB0YWcgJ2FybS1uZXdzb2MtNS45JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvc29jL3NvYwo+IGdpdCBiaXNlY3QgZ29vZCBkNGRiNGU1NTMy
NDllZGE5MDE2ZmFiMmUzNjNjMjZlNTJjNDc5MjZmCj4gIyBnb29kOiBbZmQ3NmE3NGQ5NDBhZTNk
NmI4YjIzOTVjZDEyOTE0NjMwYzdlMTczOV0gTWVyZ2UgdGFnICdhdWRpdC1wci0yMDIwMDgwMycg
b2YgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3BjbW9vcmUv
YXVkaXQKPiBnaXQgYmlzZWN0IGdvb2QgZmQ3NmE3NGQ5NDBhZTNkNmI4YjIzOTVjZDEyOTE0NjMw
YzdlMTczOQo+ICMgYmFkOiBbOTVmZmE2NzY1ODNiMjNiYWVkNDA4NjFkMzBiNjVmZTMxMzk3ZGEw
MF0gTWVyZ2UgYnJhbmNoICdwYXJpc2MtNS45LTEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9kZWxsZXIvcGFyaXNjLWxpbnV4Cj4gZ2l0IGJpc2VjdCBi
YWQgOTVmZmE2NzY1ODNiMjNiYWVkNDA4NjFkMzBiNjVmZTMxMzk3ZGEwMAo+ICMgYmFkOiBbZjhi
MDM2YTdmYzIzMWZlNmU4Mjk3ZGFkZGVlNWRmZmRiYmYyNTgxZl0gTWVyZ2UgdGFnICdpcnEtY29y
ZS0yMDIwLTA4LTA0JyBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvdGlwL3RpcAo+IGdpdCBiaXNlY3QgYmFkIGY4YjAzNmE3ZmMyMzFmZTZlODI5N2RhZGRl
ZTVkZmZkYmJmMjU4MWYKPiAjIGdvb2Q6IFs0ZjMwYTYwYWE3ODQxMDQ5NmU1ZmZlNjMyYTM3MWMw
MGYwZDgzYThkXSBNZXJnZSB0YWcgJ2Nsb3NlLXJhbmdlLXY1LjknIG9mIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icmF1bmVyL2xpbnV4Cj4gZ2l0IGJpc2Vj
dCBnb29kIDRmMzBhNjBhYTc4NDEwNDk2ZTVmZmU2MzJhMzcxYzAwZjBkODNhOGQKPiAjIGdvb2Q6
IFs4ZDE2ZjViOTc5NjYwYzBmZGNmYTIxYTQxOGNjMDNmMWZkZTYwY2Y3XSBnZW5pcnE6IEV4cG9y
dCBpcnFfY2hpcF9yZXRyaWdnZXJfaGllcmFyY2h5IGFuZCBpcnFfY2hpcF9zZXRfdmNwdV9hZmZp
bml0eV9wYXJlbnQKPiBnaXQgYmlzZWN0IGdvb2QgOGQxNmY1Yjk3OTY2MGMwZmRjZmEyMWE0MThj
YzAzZjFmZGU2MGNmNwo+ICMgYmFkOiBbYzljNzNhMDU0MTNlYTRhNDY1Y2FlMWNiMzU5M2IwMWIx
OTBhMjMzZl0gaXJxY2hpcC9sb29uZ3Nvbi1saW9pbnRjOiBGaXggbWlzdXNlIG9mIGdjLT5tYXNr
X2NhY2hlCj4gZ2l0IGJpc2VjdCBiYWQgYzljNzNhMDU0MTNlYTRhNDY1Y2FlMWNiMzU5M2IwMWIx
OTBhMjMzZgo+ICMgYmFkOiBbZjk3ZGJmNDhjYTQzMDA5ZThiOGJjZGYwN2Y0N2ZjOWYwNjE0OWIz
Nl0gaXJxY2hpcC9tdGstc3lzaXJxOiBDb252ZXJ0IHRvIGEgcGxhdGZvcm0gZHJpdmVyCj4gZ2l0
IGJpc2VjdCBiYWQgZjk3ZGJmNDhjYTQzMDA5ZThiOGJjZGYwN2Y0N2ZjOWYwNjE0OWIzNgo+ICMg
YmFkOiBbZjk3ZGJmNDhjYTQzMDA5ZThiOGJjZGYwN2Y0N2ZjOWYwNjE0OWIzNl0gaXJxY2hpcC9t
dGstc3lzaXJxOiBDb252ZXJ0IHRvIGEgcGxhdGZvcm0gZHJpdmVyCj4gZ2l0IGJpc2VjdCBiYWQg
Zjk3ZGJmNDhjYTQzMDA5ZThiOGJjZGYwN2Y0N2ZjOWYwNjE0OWIzNiAvL25lZWRzIGNoYW5nZSBm
cm9tIDc2MmEyMWZkNDVlMCBhcyBidWlsZC1maXgKPiAjIGdvb2Q6IFszYWY5NTcxY2Q1ODVlZmFm
YzJmYWNiZDhkYmQ0MDczMTdmZjg5OGNmXSBpcnFjaGlwL2dpYy12NC4xOiBFbnN1cmUgYWNjZXNz
aW5nIHRoZSBjb3JyZWN0IFJEIHdoZW4gd3JpdGluZyBJTlZBTExSCj4gZ2l0IGJpc2VjdCBnb29k
IDNhZjk1NzFjZDU4NWVmYWZjMmZhY2JkOGRiZDQwNzMxN2ZmODk4Y2YKPiAjIGdvb2Q6IFtmODQx
MGU2MjY1NjkzMjRjZmU4MzFhYWVjYzA1MDRjYWZjMTJiNDcxXSBpcnFjaGlwOiBBZGQgSVJRQ0hJ
UF9QTEFURk9STV9EUklWRVJfQkVHSU4vRU5EIGFuZCBJUlFDSElQX01BVENIIGhlbHBlciBtYWNy
b3MKPiBnaXQgYmlzZWN0IGdvb2QgZjg0MTBlNjI2NTY5MzI0Y2ZlODMxYWFlY2MwNTA0Y2FmYzEy
YjQ3MQo+ICMgZ29vZDogWzViZTU3MDk5ZDQ0NTUwZDJjNGNmNDRhODZjNDRkZjg3ZWRiNzlhNTdd
IGlycWNoaXAvcWNvbS1wZGM6IFN3aXRjaCB0byB1c2luZyBJUlFDSElQX1BMQVRGT1JNX0RSSVZF
UiBoZWxwZXIgbWFjcm9zCj4gZ2l0IGJpc2VjdCBnb29kIDViZTU3MDk5ZDQ0NTUwZDJjNGNmNDRh
ODZjNDRkZjg3ZWRiNzlhNTcKPiAjIGZpcnN0IGJhZCBjb21taXQ6IFtmOTdkYmY0OGNhNDMwMDll
OGI4YmNkZjA3ZjQ3ZmM5ZjA2MTQ5YjM2XSBpcnFjaGlwL210ay1zeXNpcnE6IENvbnZlcnQgdG8g
YSBwbGF0Zm9ybSBkcml2ZXIKPgo+IHJlZ2FyZHMgRnJhbmsKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
