Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7F8C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 12:17:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF3AA20736
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 12:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UvqzWj09";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="BHr6Q2jz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF3AA20736
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGTGnR+RzL22e1b1A6RbgcpIGxmY+IKpeOnfJYpw+4U=; b=UvqzWj09Hhx0DB
	yhBWlqw4emLl3fxDun5JX6QcYa8g8196+b48oI2YxYsBZBkzdlMCJIcCXMH6OnSDKqIKnh1klRZlw
	Y0nfoONyOmU7Y1KdQXWdXcgIaVZa2PD4l6sp3/o4mIBFDrOmn6FUMncP22kx1skLHfU/r+2DenJvC
	nBy0obY4Z4zNLzHj1I/DkEQiOEvJ4sYWRlOsD1OQeAmpWpBtUh+ngtEGQdlzeJJ419qRsaibzoLSO
	5OwhpNsOEG1EAd3fAB7nB7GQ7duHrTBptRDi1D6FBg7CEmyrOUpU/UqfRWIJJAUaGCAJWOXzFvK8T
	ttkV9hv4YAp84ypQb0qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWIzC-0006dv-BH; Wed, 06 May 2020 12:17:14 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWIz9-0006cy-CY
 for linux-mediatek@lists.infradead.org; Wed, 06 May 2020 12:17:13 +0000
Received: by mail-qv1-xf42.google.com with SMTP id di6so538075qvb.10
 for <linux-mediatek@lists.infradead.org>; Wed, 06 May 2020 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2a9aw64zHH2XF20M2Lyiu+UmzKecSTayjdQ/idjqxfY=;
 b=BHr6Q2jzo+84lP6Z7rD+n92hBNK0J3xtLZiORVstiSPMFaJU2Q08ATAnMyiKLt7Iq/
 WJow5rRUtuEqLl5IfJON+yyxZEvqPXXkHJ/N9UjYJK6fnTil18q6e5XcpOkjjLljW8Ka
 5GeRpv26dpS8o+n/1Rczh3Mv/jLV4aSlNReTRicrUOzXSYO1WM1X/beJQvgIHG+AhF8n
 M0BASyfeJuiA3B7amYptZ3U9XnZLWQUrQptic3LY4SIGh7ipe23bf9ss1Cn1cj8XWJql
 HZnBp9AUiL8Dd9GGFT2ohEukPgv+URk1d6Hvonk751ChvkcIQYnzBbODSCLSPAj9kk3O
 TH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2a9aw64zHH2XF20M2Lyiu+UmzKecSTayjdQ/idjqxfY=;
 b=Gglhxq6lpjY1poolMr8J1rRTZnwq5SXnlLDbpdzNaFvYSNg88DNz86sueHFaHMw5tm
 QjSTtsnrdSg6OimriXTtKk8aPYImROB8xXFWsGP5J9mjVCwKdIEMZRWWSfO+n2Jg1gj/
 dJmwjwODe5wunEbKQcutf7oo7tnitGqDWMqcsQzVKSBxCl36n1wICm2tvkMZgsgQHBiR
 uAwAVzZ4ucifpWbqCzvUJSbqbi440pzf/IstiaxHz1MSE1noeX7a+MHQmyKohFq2q+Wa
 zQXa7dXWNuqM6fLeUurjeEumK+F7BjLGwuZQJaNbagZwhFAOC9PJup1LJgHdJ6znrUzX
 Ja8g==
X-Gm-Message-State: AGi0PubmbrQJkXXmhHv+cLsynOSDJ1NOj9hGK9RPOungEA6DQUF0SuMr
 m8l/dBU3bnpe9JWk0pA1T95A3WZ/d+kQYH7iV+rV+w==
X-Google-Smtp-Source: APiQypJbI2sDdte0KVJrP00sH4lrzaXCuhrc9uqDNq31LxmRU2w1Jfi7oSoFrR2PB+CFe6EOcMAP0hph9TTqo0L/XA0=
X-Received: by 2002:ad4:4d06:: with SMTP id l6mr7710326qvl.34.1588767429553;
 Wed, 06 May 2020 05:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200506051853.14380-1-walter-zh.wu@mediatek.com>
 <2BF68E83-4611-48B2-A57F-196236399219@lca.pw>
 <1588746219.16219.10.camel@mtksdccf07>
 <CACT4Y+atTS6p4b23AH+G9LM-k2gU=kMdkKQdARSboxc-H8CLTQ@mail.gmail.com>
 <1588766510.23664.31.camel@mtksdccf07>
In-Reply-To: <1588766510.23664.31.camel@mtksdccf07>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 6 May 2020 14:16:58 +0200
Message-ID: <CACT4Y+baJtLf=ppLjjYtcZNQwPW0daQYcQLTmYe-WU2-FxPHEg@mail.gmail.com>
Subject: Re: [PATCH 0/3] kasan: memorize and print call_rcu stack
To: Walter Wu <walter-zh.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_051711_455002_BC861054 
X-CRM114-Status: GOOD (  29.07  )
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

T24gV2VkLCBNYXkgNiwgMjAyMCBhdCAyOjAxIFBNIFdhbHRlciBXdSA8d2FsdGVyLXpoLnd1QG1l
ZGlhdGVrLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIDIwMjAtMDUtMDYgYXQgMTE6MzcgKzAyMDAs
ICdEbWl0cnkgVnl1a292JyB2aWEga2FzYW4tZGV2IHdyb3RlOgo+ID4gT24gV2VkLCBNYXkgNiwg
MjAyMCBhdCA4OjIzIEFNIFdhbHRlciBXdSA8d2FsdGVyLXpoLnd1QG1lZGlhdGVrLmNvbT4gd3Jv
dGU6Cj4gPiA+ID4gPiBUaGlzIHBhdGNoc2V0IGltcHJvdmVzIEtBU0FOIHJlcG9ydHMgYnkgbWFr
aW5nIHRoZW0gdG8gaGF2ZQo+ID4gPiA+ID4gY2FsbF9yY3UoKSBjYWxsIHN0YWNrIGluZm9ybWF0
aW9uLiBJdCBpcyBoZWxwZnVsIGZvciBwcm9ncmFtbWVycwo+ID4gPiA+ID4gdG8gc29sdmUgdXNl
LWFmdGVyLWZyZWUgb3IgZG91YmxlLWZyZWUgbWVtb3J5IGlzc3VlLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IFRoZSBLQVNBTiByZXBvcnQgd2FzIGFzIGZvbGxvd3MoY2xlYW5lZCB1cCBzbGlnaHRseSk6
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQlVHOiBLQVNBTjogdXNlLWFmdGVyLWZyZWUgaW4ga2FzYW5f
cmN1X3JlY2xhaW0rMHg1OC8weDYwCj4gPiA+ID4gPgo+ID4gPiA+ID4gRnJlZWQgYnkgdGFzayAw
Ogo+ID4gPiA+ID4gc2F2ZV9zdGFjaysweDI0LzB4NTAKPiA+ID4gPiA+IF9fa2FzYW5fc2xhYl9m
cmVlKzB4MTEwLzB4MTc4Cj4gPiA+ID4gPiBrYXNhbl9zbGFiX2ZyZWUrMHgxMC8weDE4Cj4gPiA+
ID4gPiBrZnJlZSsweDk4LzB4MjcwCj4gPiA+ID4gPiBrYXNhbl9yY3VfcmVjbGFpbSsweDFjLzB4
NjAKPiA+ID4gPiA+IHJjdV9jb3JlKzB4OGI0LzB4MTBmOAo+ID4gPiA+ID4gcmN1X2NvcmVfc2kr
MHhjLzB4MTgKPiA+ID4gPiA+IGVmaV9oZWFkZXJfZW5kKzB4MjM4LzB4YTZjCj4gPiA+ID4gPgo+
ID4gPiA+ID4gRmlyc3QgY2FsbF9yY3UoKSBjYWxsIHN0YWNrOgo+ID4gPiA+ID4gc2F2ZV9zdGFj
aysweDI0LzB4NTAKPiA+ID4gPiA+IGthc2FuX3JlY29yZF9jYWxscmN1KzB4YzgvMHhkOAo+ID4g
PiA+ID4gY2FsbF9yY3UrMHgxOTAvMHg1ODAKPiA+ID4gPiA+IGthc2FuX3JjdV91YWYrMHgxZDgv
MHgyNzgKPiA+ID4gPiA+Cj4gPiA+ID4gPiBMYXN0IGNhbGxfcmN1KCkgY2FsbCBzdGFjazoKPiA+
ID4gPiA+IChzdGFjayBpcyBub3QgYXZhaWxhYmxlKQo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBBZGQgbmV3IENPTkZJRyBvcHRpb24gdG8gcmVjb3JkIGZpcnN0IGFuZCBsYXN0IGNhbGxf
cmN1KCkgY2FsbCBzdGFjawo+ID4gPiA+ID4gYW5kIEtBU0FOIHJlcG9ydCBwcmludHMgdHdvIGNh
bGxfcmN1KCkgY2FsbCBzdGFjay4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIG9wdGlvbiBkb2Vz
bid0IGluY3JlYXNlIHRoZSBjb3N0IG9mIG1lbW9yeSBjb25zdW1wdGlvbi4gSXQgaXMKPiA+ID4g
PiA+IG9ubHkgc3VpdGFibGUgZm9yIGdlbmVyaWMgS0FTQU4uCj4gPiA+ID4KPiA+ID4gPiBJIGRv
buKAmXQgdW5kZXJzdGFuZCB3aHkgdGhpcyBuZWVkcyB0byBiZSBhIEtjb25maWcgb3B0aW9uIGF0
IGFsbC4gSWYgY2FsbF9yY3UoKSBzdGFja3MgYXJlIHVzZWZ1bCBpbiBnZW5lcmFsLCB0aGVuIGp1
c3QgYWx3YXlzIGdhdGhlciB0aG9zZSBpbmZvcm1hdGlvbi4gSG93IGRvIGRldmVsb3BlcnMganVk
Z2UgaWYgdGhleSBuZWVkIHRvIHNlbGVjdCB0aGlzIG9wdGlvbiBvciBub3Q/Cj4gPiA+Cj4gPiA+
IEJlY2F1c2Ugd2UgZG9uJ3Qgd2FudCB0byBpbmNyZWFzZSBzbHViIG1ldGEtZGF0YSBzaXplLCBz
byBlbmFibGluZyB0aGlzCj4gPiA+IG9wdGlvbiBjYW4gcHJpbnQgY2FsbF9yY3UoKSBzdGFja3Ms
IGJ1dCB0aGUgaW4tdXNlIHNsdWIgb2JqZWN0IGRvZXNuJ3QKPiA+ID4gcHJpbnQgZnJlZSBzdGFj
ay4gU28gaWYgaGF2ZSBvdXQtb2YtYm91bmQgaXNzdWUsIHRoZW4gaXQgd2lsbCBub3QgcHJpbnQK
PiA+ID4gZnJlZSBzdGFjay4gSXQgaXMgYSB0cmFkZS1vZmYsIHNlZSBbMV0uCj4gPiA+Cj4gPiA+
IFsxXSBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTE5ODQzNwo+
ID4KPiA+IEhpIFdhbHRlciwKPiA+Cj4gPiBHcmVhdCB5b3UgYXJlIHRhY2tsaW5nIHRoaXMhCj4g
Pgo+ID4gSSBoYXZlIHRoZSBzYW1lIGdlbmVyYWwgc2VudGltZW50IGFzIFFpYW4uIEkgd291bGQg
ZW5hYmxlIHRoaXMKPiA+IHVuY29uZGl0aW9uYWxseSBiZWNhdXNlOgo+ID4KPiA+IDEuIFdlIHN0
aWxsIGNhbid0IGdldCBib3RoIHJjdSBzdGFjayBhbmQgZnJlZSBzdGFjay4gSSB3b3VsZCBhc3N1
bWUKPiA+IG1vc3Qga2VybmVsIHRlc3Rpbmcgc3lzdGVtcyBuZWVkIHRvIGVuYWJsZSB0aGlzICh3
ZSBkZWZpbml0ZWx5IGVuYWJsZQo+ID4gb24gc3l6Ym90KS4gVGhpcyBtZWFucyB3ZSBkbyBub3Qg
aGF2ZSBmcmVlIHN0YWNrIGZvciBhbGxvY2F0aW9uCj4gPiBvYmplY3RzIGluIGFueSByZXBvcnRz
IGNvbWluZyBmcm9tIHRlc3Rpbmcgc3lzdGVtcy4gV2hpY2ggZ3JlYXRseQo+ID4gZGltaW5pc2hl
cyB0aGUgdmFsdWUgb2YgdGhlIG90aGVyIG1vZGUuCj4gPgo+ID4gMi4gS2VybmVsIGlzIHVuZGVy
dGVzdGVkLiBJbnRyb2R1Y2luZyBhbnkgYWRkaXRpb25hbCBjb25maWd1cmF0aW9uCj4gPiBvcHRp
b25zIGlzIGEgcHJvYmxlbSBpbiBzdWNoIGNvbnRleHQuIENoYW5jZXMgYXJlIHRoYXQgc29tZSBv
ZiB0aGUKPiA+IG1vZGVzIGFyZSBub3Qgd29ya2luZyBvciB3aWxsIGJyZWFrIGluIGZ1dHVyZS4K
PiA+Cj4gPiAzLiBUaGF0IGZyZWUgc3RhY2sgYWN0dWFsbHkgY2F1c2VzIGxvdHMgb2YgY29uZnVz
aW9uIGFuZCBJIG5ldmVyIGZvdW5kCj4gPiBpdCB1c2VmdWw6Cj4gPiBodHRwczovL2J1Z3ppbGxh
Lmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTE5ODQyNQo+ID4gSWYgaXQncyBhIHZlcnkgZGVs
YXllZCBVQUYsIGVpdGhlciBvbmUgbWF5IGdldCBhbm90aGVyIHJlcG9ydCBmb3IgdGhlCj4gPiBz
YW1lIGJ1ZyB3aXRoIG5vdCBzbyBkZWxheWVkIFVBRiwgb3IgaWYgaXQncyB3YXkgdG9vIGRlbGF5
ZWQsIHRoZW4gdGhlCj4gPiBwcmV2aW91cyBmcmVlIHN0YWNrIGlzIHdyb25nIGFzIHdlbGwuCj4g
Pgo+ID4gNC4gTW9zdCB1c2VycyBkb24ndCBjYXJlIHRoYXQgbXVjaCBhYm91dCBkZWJ1Z2dpbmcg
dG9vbHMgdG8gbGVhcm4KPiA+IGV2ZXJ5IGJpdCBvZiBldmVyeSBkZWJ1Z2dpbmcgdG9vbCBhbmQg
c3BlbmQgdGltZSBmaW5lLXR1bmluZyBpdCBmb3IKPiA+IHRoZWlyIGNvbnRleHQuIE1vc3QgS0FT
QU4gdXNlcnMgd29uJ3QgZXZlbiBiZSBhd2FyZSBvZiB0aGlzIGNob2ljZSwKPiA+IGFuZCB0aGV5
IHdpbGwganVzdCB1c2Ugd2hhdGV2ZXIgaXMgdGhlIGRlZmF1bHQuCj4gPgo+ID4gNS4gRWFjaCBj
b25maWd1cmF0aW9uIG9wdGlvbiBpbmNyZWFzZXMgaW1wbGVtZW50YXRpb24gY29tcGxleGl0eS4K
PiA+Cj4gPiBXaGF0IHdvdWxkIGhhdmUgdmFsdWUgaXMgaWYgd2UgZmlndXJlIG91dCBob3cgdG8g
bWFrZSBib3RoIG9mIHRoZW0KPiA+IHdvcmsgYXQgdGhlIHNhbWUgdGltZSB3aXRob3V0IGluY3Jl
YXNpbmcgbWVtb3J5IGNvbnN1bXB0aW9uLiBCdXQgSQo+ID4gZG9uJ3Qgc2VlIGFueSB3YXkgdG8g
ZG8gdGhpcy4KPiA+Cj4gPiBJIHByb3Bvc2UgdG8gbWFrZSB0aGlzIHRoZSBvbmx5IG1vZGUuIEkg
YW0gc3VyZSBsb3RzIG9mIHVzZXJzIHdpbGwKPiA+IGZpbmQgdGhpcyBhZGRpdGlvbmFsIHN0YWNr
IHVzZWZ1bCwgd2hlcmVhcyB0aGUgZnJlZSBzdGFjayBpcyBldmVuCj4gPiBmcmVxdWVudGx5IGNv
bmZ1c2luZy4KPiA+Cj4KPiBPay4KPiBJZiB3ZSB3YW50IHRvIGhhdmUgYSBkZWZhdWx0IGVuYWJs
aW5nIGl0LCBidXQgaXQgc2hvdWxkIG9ubHkgd29yayBpbgo+IGdlbmVyaWMgS0FTQU4sIGJlY2F1
c2Ugd2UgbmVlZCB0byBnZXQgb2JqZWN0IHN0YXR1cyhhbGxvY2F0aW9uIG9yCj4gZnJlZWluZykg
ZnJvbSBzaGFkb3cgbWVtb3J5LCB0YWctYmFzZWQgS0FTQU4gY2FuJ3QgZG8gaXQuIFNvIHdlIHNo
b3VsZAo+IGhhdmUgYSBkZWZhdWx0IGVuYWJsaW5nIGl0IGluIGdlbmVyaWMgS0FTQU4/CgpZZXMs
IGxldCdzIGRvIGdlbmVyaWMgS0FTQU4gYWx3YXlzIG1lbW9yaXplcyByY3Ugc3RhY2s7IHRhZ3Mg
S0FTQU4KbmV2ZXIgbWVtb3JpemVzIHJjdSBzdGFja3MuIE5vIG5ldyBjb25maWd1cmF0aW9ucy4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
