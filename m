Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4306AC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 09:38:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19FEA2075E
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 09:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mKKXlQsU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="ncii/QMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19FEA2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6atMKiRnQEuumK8vvp4WLsJulxuc2MRpmRQz0qlZAcM=; b=mKKXlQsUganD0F
	Qu6wVirrYt6knUSsESiJOHr58gyfG0MEefPBH02WGph42SYWLsfH8Q9yIQE1DaLptsv+si2omumLG
	4jyUZ9dZmaoLPi7y1H4qPeUTOl5T6ZBJHXP1uja5dDUYoUFxG/qsUQYwRM8Bs5QXrjpnqlC4A5HdP
	BWYuK18LsKwfWRhHSuHAIBJqkmfEsygnmzf2oth4rylSwC+0IpwVnsj5gGIu2OYV4+4wDmiPCujYk
	yvl7SGm8Kf0xRcGqJ9aWotz9QmNJakTx1C4lfigWEU5BNdL+WyLrn25YgvfVeE3jIhZoDqWXrNQdf
	8LTgNKv5YZH/K7iVfLkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWGVK-0000qn-Gs; Wed, 06 May 2020 09:38:14 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWGVH-0000pO-R3
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 09:38:13 +0000
Received: by mail-qk1-x743.google.com with SMTP id b188so1206138qkd.9
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=da9Msd6VhXx/3o4OwwaQEairzk+A5t5H6NDxBwzjlV0=;
 b=ncii/QMt765z12zCCRyYs27sJbBG55KS6EXgAt7uA/nAMWDhb5SHWhLAsl67GI2EoZ
 M8oLJnLRBvHLjeXdD4dcTwGX5lvZsRQlXW/VdJ5A5UG4MK0C0ulIURk5H/8tNBoDaiIx
 gdHY6M1cX35EHbi2BxS2kf8m7sXjfDgqqg+VdiCZ49OiOv2jz2Ef46X8koWsWasgYdK+
 bpeXm4R264TMadTOVkieNdWTkWI29YNk27LeBy3LsP8sRxUuonyXbewfko/HGB0BL9AB
 CTgR25v8+cAv6LwtMchkSgHRNjqGZDYpLsrhiIe5fjWVqJq9Nb1O7fnneO6+SAspPv3J
 L7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=da9Msd6VhXx/3o4OwwaQEairzk+A5t5H6NDxBwzjlV0=;
 b=Tc9ZHtfr7aR+oUAmzPG+qdgymXs3e95PWkKBVDO08QxSgByEF2GUqjVDGMqYIT64J2
 rGQtoV37C+dT187u597tm2/s4G97VCKs5GkXCGc+Ed3Pv9sZ6nuCzNJ+9mlbx2f/maEr
 1aSr39RbMtuu9O3hgTm9OGFsdg9t0rmYGuKhroGQZBMseC7uEcYXhsEQu8CrgsYTU0Fb
 smAxISI1I8OTawHB5ItuJdeke7qsmBJB6Uo4qBUsqEGH7muVZW3DYkPGKfJMRgnMxahU
 53qj+sZD3TrWb2XPme9Y0casGoXhqgBWvVajbPTEEP7TqtsZukjygaZtsfYjrfjQtp41
 CrxQ==
X-Gm-Message-State: AGi0PubRS/8Dx4PE9o9zkFyYmnnFfV4XezAikNQrlhcahg+2kmBMFpRW
 akaWda7TAdHdNlwu1qCV6kFgVidI7oayufKwx8VNkw==
X-Google-Smtp-Source: APiQypKkPwnxUq8+DlhhdqgWHdUkT5LHK+5uGXTodzsX0U7vrL7xa9kBwImSOF/TnuGRNKJl1K2bC7yaOlhwM1P6u2E=
X-Received: by 2002:ae9:ed05:: with SMTP id c5mr2109866qkg.250.1588757886424; 
 Wed, 06 May 2020 02:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200506051853.14380-1-walter-zh.wu@mediatek.com>
 <2BF68E83-4611-48B2-A57F-196236399219@lca.pw>
 <1588746219.16219.10.camel@mtksdccf07>
In-Reply-To: <1588746219.16219.10.camel@mtksdccf07>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 6 May 2020 11:37:54 +0200
Message-ID: <CACT4Y+atTS6p4b23AH+G9LM-k2gU=kMdkKQdARSboxc-H8CLTQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] kasan: memorize and print call_rcu stack
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_023811_880961_D34270CC 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: Qian Cai <cai@lca.pw>, wsd_upstream <wsd_upstream@mediatek.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 kasan-dev <kasan-dev@googlegroups.com>, LKML <linux-kernel@vger.kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, linux-mediatek@lists.infradead.org,
 Alexander Potapenko <glider@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgNiwgMjAyMCBhdCA4OjIzIEFNIFdhbHRlciBXdSA8d2FsdGVyLXpoLnd1QG1l
ZGlhdGVrLmNvbT4gd3JvdGU6Cj4gPiA+IFRoaXMgcGF0Y2hzZXQgaW1wcm92ZXMgS0FTQU4gcmVw
b3J0cyBieSBtYWtpbmcgdGhlbSB0byBoYXZlCj4gPiA+IGNhbGxfcmN1KCkgY2FsbCBzdGFjayBp
bmZvcm1hdGlvbi4gSXQgaXMgaGVscGZ1bCBmb3IgcHJvZ3JhbW1lcnMKPiA+ID4gdG8gc29sdmUg
dXNlLWFmdGVyLWZyZWUgb3IgZG91YmxlLWZyZWUgbWVtb3J5IGlzc3VlLgo+ID4gPgo+ID4gPiBU
aGUgS0FTQU4gcmVwb3J0IHdhcyBhcyBmb2xsb3dzKGNsZWFuZWQgdXAgc2xpZ2h0bHkpOgo+ID4g
Pgo+ID4gPiBCVUc6IEtBU0FOOiB1c2UtYWZ0ZXItZnJlZSBpbiBrYXNhbl9yY3VfcmVjbGFpbSsw
eDU4LzB4NjAKPiA+ID4KPiA+ID4gRnJlZWQgYnkgdGFzayAwOgo+ID4gPiBzYXZlX3N0YWNrKzB4
MjQvMHg1MAo+ID4gPiBfX2thc2FuX3NsYWJfZnJlZSsweDExMC8weDE3OAo+ID4gPiBrYXNhbl9z
bGFiX2ZyZWUrMHgxMC8weDE4Cj4gPiA+IGtmcmVlKzB4OTgvMHgyNzAKPiA+ID4ga2FzYW5fcmN1
X3JlY2xhaW0rMHgxYy8weDYwCj4gPiA+IHJjdV9jb3JlKzB4OGI0LzB4MTBmOAo+ID4gPiByY3Vf
Y29yZV9zaSsweGMvMHgxOAo+ID4gPiBlZmlfaGVhZGVyX2VuZCsweDIzOC8weGE2Ywo+ID4gPgo+
ID4gPiBGaXJzdCBjYWxsX3JjdSgpIGNhbGwgc3RhY2s6Cj4gPiA+IHNhdmVfc3RhY2srMHgyNC8w
eDUwCj4gPiA+IGthc2FuX3JlY29yZF9jYWxscmN1KzB4YzgvMHhkOAo+ID4gPiBjYWxsX3JjdSsw
eDE5MC8weDU4MAo+ID4gPiBrYXNhbl9yY3VfdWFmKzB4MWQ4LzB4Mjc4Cj4gPiA+Cj4gPiA+IExh
c3QgY2FsbF9yY3UoKSBjYWxsIHN0YWNrOgo+ID4gPiAoc3RhY2sgaXMgbm90IGF2YWlsYWJsZSkK
PiA+ID4KPiA+ID4KPiA+ID4gQWRkIG5ldyBDT05GSUcgb3B0aW9uIHRvIHJlY29yZCBmaXJzdCBh
bmQgbGFzdCBjYWxsX3JjdSgpIGNhbGwgc3RhY2sKPiA+ID4gYW5kIEtBU0FOIHJlcG9ydCBwcmlu
dHMgdHdvIGNhbGxfcmN1KCkgY2FsbCBzdGFjay4KPiA+ID4KPiA+ID4gVGhpcyBvcHRpb24gZG9l
c24ndCBpbmNyZWFzZSB0aGUgY29zdCBvZiBtZW1vcnkgY29uc3VtcHRpb24uIEl0IGlzCj4gPiA+
IG9ubHkgc3VpdGFibGUgZm9yIGdlbmVyaWMgS0FTQU4uCj4gPgo+ID4gSSBkb27igJl0IHVuZGVy
c3RhbmQgd2h5IHRoaXMgbmVlZHMgdG8gYmUgYSBLY29uZmlnIG9wdGlvbiBhdCBhbGwuIElmIGNh
bGxfcmN1KCkgc3RhY2tzIGFyZSB1c2VmdWwgaW4gZ2VuZXJhbCwgdGhlbiBqdXN0IGFsd2F5cyBn
YXRoZXIgdGhvc2UgaW5mb3JtYXRpb24uIEhvdyBkbyBkZXZlbG9wZXJzIGp1ZGdlIGlmIHRoZXkg
bmVlZCB0byBzZWxlY3QgdGhpcyBvcHRpb24gb3Igbm90Pwo+Cj4gQmVjYXVzZSB3ZSBkb24ndCB3
YW50IHRvIGluY3JlYXNlIHNsdWIgbWV0YS1kYXRhIHNpemUsIHNvIGVuYWJsaW5nIHRoaXMKPiBv
cHRpb24gY2FuIHByaW50IGNhbGxfcmN1KCkgc3RhY2tzLCBidXQgdGhlIGluLXVzZSBzbHViIG9i
amVjdCBkb2Vzbid0Cj4gcHJpbnQgZnJlZSBzdGFjay4gU28gaWYgaGF2ZSBvdXQtb2YtYm91bmQg
aXNzdWUsIHRoZW4gaXQgd2lsbCBub3QgcHJpbnQKPiBmcmVlIHN0YWNrLiBJdCBpcyBhIHRyYWRl
LW9mZiwgc2VlIFsxXS4KPgo+IFsxXSBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19i
dWcuY2dpP2lkPTE5ODQzNwoKSGkgV2FsdGVyLAoKR3JlYXQgeW91IGFyZSB0YWNrbGluZyB0aGlz
IQoKSSBoYXZlIHRoZSBzYW1lIGdlbmVyYWwgc2VudGltZW50IGFzIFFpYW4uIEkgd291bGQgZW5h
YmxlIHRoaXMKdW5jb25kaXRpb25hbGx5IGJlY2F1c2U6CgoxLiBXZSBzdGlsbCBjYW4ndCBnZXQg
Ym90aCByY3Ugc3RhY2sgYW5kIGZyZWUgc3RhY2suIEkgd291bGQgYXNzdW1lCm1vc3Qga2VybmVs
IHRlc3Rpbmcgc3lzdGVtcyBuZWVkIHRvIGVuYWJsZSB0aGlzICh3ZSBkZWZpbml0ZWx5IGVuYWJs
ZQpvbiBzeXpib3QpLiBUaGlzIG1lYW5zIHdlIGRvIG5vdCBoYXZlIGZyZWUgc3RhY2sgZm9yIGFs
bG9jYXRpb24Kb2JqZWN0cyBpbiBhbnkgcmVwb3J0cyBjb21pbmcgZnJvbSB0ZXN0aW5nIHN5c3Rl
bXMuIFdoaWNoIGdyZWF0bHkKZGltaW5pc2hlcyB0aGUgdmFsdWUgb2YgdGhlIG90aGVyIG1vZGUu
CgoyLiBLZXJuZWwgaXMgdW5kZXJ0ZXN0ZWQuIEludHJvZHVjaW5nIGFueSBhZGRpdGlvbmFsIGNv
bmZpZ3VyYXRpb24Kb3B0aW9ucyBpcyBhIHByb2JsZW0gaW4gc3VjaCBjb250ZXh0LiBDaGFuY2Vz
IGFyZSB0aGF0IHNvbWUgb2YgdGhlCm1vZGVzIGFyZSBub3Qgd29ya2luZyBvciB3aWxsIGJyZWFr
IGluIGZ1dHVyZS4KCjMuIFRoYXQgZnJlZSBzdGFjayBhY3R1YWxseSBjYXVzZXMgbG90cyBvZiBj
b25mdXNpb24gYW5kIEkgbmV2ZXIgZm91bmQKaXQgdXNlZnVsOgpodHRwczovL2J1Z3ppbGxhLmtl
cm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTE5ODQyNQpJZiBpdCdzIGEgdmVyeSBkZWxheWVkIFVB
RiwgZWl0aGVyIG9uZSBtYXkgZ2V0IGFub3RoZXIgcmVwb3J0IGZvciB0aGUKc2FtZSBidWcgd2l0
aCBub3Qgc28gZGVsYXllZCBVQUYsIG9yIGlmIGl0J3Mgd2F5IHRvbyBkZWxheWVkLCB0aGVuIHRo
ZQpwcmV2aW91cyBmcmVlIHN0YWNrIGlzIHdyb25nIGFzIHdlbGwuCgo0LiBNb3N0IHVzZXJzIGRv
bid0IGNhcmUgdGhhdCBtdWNoIGFib3V0IGRlYnVnZ2luZyB0b29scyB0byBsZWFybgpldmVyeSBi
aXQgb2YgZXZlcnkgZGVidWdnaW5nIHRvb2wgYW5kIHNwZW5kIHRpbWUgZmluZS10dW5pbmcgaXQg
Zm9yCnRoZWlyIGNvbnRleHQuIE1vc3QgS0FTQU4gdXNlcnMgd29uJ3QgZXZlbiBiZSBhd2FyZSBv
ZiB0aGlzIGNob2ljZSwKYW5kIHRoZXkgd2lsbCBqdXN0IHVzZSB3aGF0ZXZlciBpcyB0aGUgZGVm
YXVsdC4KCjUuIEVhY2ggY29uZmlndXJhdGlvbiBvcHRpb24gaW5jcmVhc2VzIGltcGxlbWVudGF0
aW9uIGNvbXBsZXhpdHkuCgpXaGF0IHdvdWxkIGhhdmUgdmFsdWUgaXMgaWYgd2UgZmlndXJlIG91
dCBob3cgdG8gbWFrZSBib3RoIG9mIHRoZW0Kd29yayBhdCB0aGUgc2FtZSB0aW1lIHdpdGhvdXQg
aW5jcmVhc2luZyBtZW1vcnkgY29uc3VtcHRpb24uIEJ1dCBJCmRvbid0IHNlZSBhbnkgd2F5IHRv
IGRvIHRoaXMuCgpJIHByb3Bvc2UgdG8gbWFrZSB0aGlzIHRoZSBvbmx5IG1vZGUuIEkgYW0gc3Vy
ZSBsb3RzIG9mIHVzZXJzIHdpbGwKZmluZCB0aGlzIGFkZGl0aW9uYWwgc3RhY2sgdXNlZnVsLCB3
aGVyZWFzIHRoZSBmcmVlIHN0YWNrIGlzIGV2ZW4KZnJlcXVlbnRseSBjb25mdXNpbmcuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
