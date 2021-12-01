Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83100C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AoLaJMpMqW8WcreaDlGyghYGAq949n2rjdHx4f5tVQ=; b=g9Vh8VJdUkMJvv
	hI0ZhHyvxTv2G40UcwRdrYpFTEkAMRDEBGogkv5RoaRi2xoOeCgGwDLFbCI/2pAKOPDfOnzlw8uUz
	Q3IpNcXV/yEQt8zr6dxLkMN2ShrrajTQu5BizZOxgCUaWIAeVAkK2W6b8hJ/kPQ+5x/9K5bCN0f+m
	3uXMmAKMDyMPwtdsSDpxyAgzlgGUT+9wDPkutT3hpeAQyfYBCZfMcLfB9lQe1ay+g+MYlWe65cYhW
	EgUWROs7v0joUaYSoZBAVf+JuYhTPsxgSb1RmDdwF8EE3lKNu8cb9oC4D7zs4Y3NnZyv33p/3Witc
	nswutpy5VcNZWIQXlldQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msMYR-0083P1-CA; Wed, 01 Dec 2021 10:09:35 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msMYO-0083MR-1u
 for linux-mediatek@lists.infradead.org; Wed, 01 Dec 2021 10:09:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id j18so33856464ljc.12
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 02:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OUz5GIJwWhsCyqmvdwiSMp+8PenKcEyq20yCWjGw6oo=;
 b=h0Fitg9dKp6Gl/4ZI0YCCzy6luvo1s9aJSiGf6y033HzRqpc5bZcL22MlRCxP3mbCw
 qaFmDSHUWkmclJFd6Gfp/IFpPuiU7sHzEXpo7ODUC+M3ObKQBAze5n0u8m5zdnSf40pd
 rWicWAkANUpI3/KhOCbjO6u0XEmS6Zjz6t6xbahAOXpcxxGSwPHx2ZvT9rC83GjQ/Jyi
 Zs4Tb/H/YaHN/WStBxRlcFz1073veJYxBn+ifRYQ4WrGuao/yfclD+EQY65wwJ1LSDgT
 t35ruCeNnZ7SL3r0UrUHhEBHvQHgn/B3WNXWOVMGwWma20ykKSLR2Leaqfo+hPq4XYAq
 HpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OUz5GIJwWhsCyqmvdwiSMp+8PenKcEyq20yCWjGw6oo=;
 b=10nC51jQUDpPwGBhqARxNlaKLmF5dT6mWkMtdVhuiq2ROFKxRG+BKPhPRteQ/E96qr
 3zMCk4mTC4zt83Kys+mE/WIhHp11SXpUpmdSvlFw/enHrN9Vd7z9FDzLYtxWZSp+uXa3
 Ou2Z3qLqOlM/+KjYjD8Z41YEIgBEl5Gd1e7i1cBBn43tSA+kfSO8O5T4lJ35yGsSk8fS
 yRE9tpw6VrALWE7uckbYM9HLBjjmnsuCIj6RRwTXqmD1rPA4t4Jf+8+fVDa69zC0wSJm
 plQf2+7AVkf7QC3g+VtcPfKfmamdZXJTMsHjJRrpR4vPT5pP7xdmvdNF/joXe+z077ZL
 TLeg==
X-Gm-Message-State: AOAM531hUvjQLipPaWxaQ9HgKw5jwrvNOwuGnwNBl7QVbUrIiugZG8i4
 akrcn4PhvV/SnvcKrUjJO8xpE1Ip2swHH30U9Q2llA==
X-Google-Smtp-Source: ABdhPJzDsJHqm+aHiy+lkIXP5Ar3k9o7SMl/nP/3Xx3p2ShJFSukJaXUE1CMRVgy9JAkWUv59xYkYWSvKKpQZ+pGyjE=
X-Received: by 2002:a2e:5850:: with SMTP id x16mr4763005ljd.122.1638353369362; 
 Wed, 01 Dec 2021 02:09:29 -0800 (PST)
MIME-Version: 1.0
References: <YaB/JHP/pMbgRJ1O@kroah.com>
 <20211126074904.88388-1-guangming.cao@mediatek.com>
 <CALAqxLVF1BPznzwjem2BcsDDoo5gMoBqjKEceZDLJan4zCtk3w@mail.gmail.com>
In-Reply-To: <CALAqxLVF1BPznzwjem2BcsDDoo5gMoBqjKEceZDLJan4zCtk3w@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 1 Dec 2021 15:39:17 +0530
Message-ID: <CAO_48GHxanR=-mN232ANwxQEiBo9zb3WjvO-6WmP6eFYWA1M5A@mail.gmail.com>
Subject: Re: [PATCH v4] dma-buf: system_heap: Use 'for_each_sgtable_sg' in
 pages free flow
To: John Stultz <john.stultz@linaro.org>
Cc: guangming.cao@mediatek.com, greg@kroah.com, brian.starkey@arm.com, 
 benjamin.gaignard@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, labbott@redhat.com, 
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, lmark@codeaurora.org, 
 matthias.bgg@gmail.com, robin.murphy@arm.com, stable@vger.kernel.org, 
 wsd_upstream@mediatek.com, kuan-ying.lee@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_020932_143309_F3A44777 
X-CRM114-Status: GOOD (  14.75  )
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

SGVsbG8gR3VhbmdtaW5nLAoKT24gTW9uLCAyOSBOb3YgMjAyMSBhdCAyMzozNSwgSm9obiBTdHVs
dHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgMjUsIDIw
MjEgYXQgMTE6NDggUE0gPGd1YW5nbWluZy5jYW9AbWVkaWF0ZWsuY29tPiB3cm90ZToKPiA+Cj4g
PiBGcm9tOiBHdWFuZ21pbmcgPEd1YW5nbWluZy5DYW9AbWVkaWF0ZWsuY29tPgo+ID4KPiA+IEZv
ciBwcmV2aW91cyB2ZXJzaW9uLCBpdCB1c2VzICdzZ190YWJsZS5uZW50J3MgdG8gdHJhdmVyc2Ug
c2dfdGFibGUgaW4gcGFnZXMKPiA+IGZyZWUgZmxvdy4KPiA+IEhvd2V2ZXIsICdzZ190YWJsZS5u
ZW50cycgaXMgcmVhc3NpZ25lZCBpbiAnZG1hX21hcF9zZycsIGl0IG1lYW5zIHRoZSBudW1iZXIg
b2YKPiA+IGNyZWF0ZWQgZW50cmllcyBpbiB0aGUgRE1BIGFkZGVyZXNzIHNwYWNlLgo+ID4gU28s
IHVzZSAnc2dfdGFibGUubmVudHMnIGluIHBhZ2VzIGZyZWUgZmxvdyB3aWxsIGNhc2Ugc29tZSBw
YWdlcyBjYW4ndCBiZSBmcmVlZC4KPiA+Cj4gPiBIZXJlIHdlIHNob3VsZCB1c2Ugc2dfdGFibGUu
b3JpZ19uZW50cyB0byBmcmVlIHBhZ2VzIG1lbW9yeSwgYnV0IHVzZSB0aGUKPiA+IHNndGFibGUg
aGVscGVyICdmb3IgZWFjaF9zZ3RhYmxlX3NnJygsIGluc3RlYWQgb2YgdGhlIHByZXZpb3VzIHJh
dGhlciBjb21tb24KPiA+IGhlbHBlciAnZm9yX2VhY2hfc2cnIHdoaWNoIG1heWJlIGNhdXNlIG1l
bW9yeSBsZWFrKSBpcyBtdWNoIGJldHRlci4KClRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcyBhbmQg
dGhlIHBhdGNoOyBhcHBsaWVkIHRvIGRybS1taXNjLWZpeGVzLgo+ID4KPiA+IEZpeGVzOiBkOTYz
YWIwZjE1ZmIwICgiZG1hLWJ1Zjogc3lzdGVtX2hlYXA6IEFsbG9jYXRlIGhpZ2hlciBvcmRlciBw
YWdlcyBpZiBhdmFpbGFibGUiKQo+ID4gU2lnbmVkLW9mZi1ieTogR3VhbmdtaW5nIDxHdWFuZ21p
bmcuQ2FvQG1lZGlhdGVrLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmlu
Lm11cnBoeUBhcm0uY29tPgo+ID4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPiAjIDUuMTEu
Kgo+Cj4gVGhhbmtzIHNvIG11Y2ggZm9yIGNhdGNoaW5nIHRoaXMgYW5kIHNlbmRpbmcgaW4gYWxs
IHRoZSByZXZpc2lvbnMhCj4KPiBSZXZpZXdlZC1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6
QGxpbmFyby5vcmc+CgoKQmVzdCwKU3VtaXQuCgotLSAKVGhhbmtzIGFuZCByZWdhcmRzLAoKU3Vt
aXQgU2Vtd2FsIChoZSAvIGhpbSkKVGVjaCBMZWFkIC0gTENHLCBWZXJ0aWNhbCBUZWNobm9sb2dp
ZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
