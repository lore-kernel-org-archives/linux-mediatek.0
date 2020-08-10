Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C90C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 00:06:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416EA2070B
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 00:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vIlnS/l5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFJUK4Rb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416EA2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dOvr/XxUaarAvnRmjiWh3YfHYlqfrV7JePHB6M2ewPc=; b=vIlnS/l5S7zsXnqt+WwRZ56rL
	F18hw7r/BR8/lcag+I9hkRZHpMP8H+kXl5Mg/R5LEw4gWtHbjuJHykjOePlnmuss4iz0eKdXImnO7
	DQberWxasKdMp7a/0QBUVlykf5sxvMSoaOBLrb+6NCa+HfdgezYRXrrjHL99QKyWy59izgWngYvWx
	ipDoHy2RhUjHgSa1umiOa1pUl2H44zZdCCMazlVAy2BCOrlJDRD8e2PSOhRzfEZYYXMMUWTanlNY8
	C3TzaVKbKrGyUKjlwkIfqaZeWcrTPz456LBzN0ZNETWSaZHkLFEvX8nB4HPqUMy8pKemyGFFiAiH7
	kTpRvFl3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4vKw-0005pf-1e; Mon, 10 Aug 2020 00:06:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4vKs-0005ol-BS; Mon, 10 Aug 2020 00:06:43 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6152520716;
 Mon, 10 Aug 2020 00:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597018000;
 bh=R4aysq8cb7E0lt1g+L7QoE7drym+sqAlY7Kl5ewT9W4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PFJUK4RboaUyQadDQQxPBwd2mWFx5eqi8vYU/1ln23GMqVDmgxMjmS8OiCE5deT3T
 3jL6lR41OYOSmVjW7gbdLQs4YANUBtRuawMrQz6qjssK0V/MZ1bA1wI7barj0aKoPP
 oOqZccr58IG6qLu1rgsAHBxZYdck4+UEHXlk0n0U=
Received: by mail-ed1-f51.google.com with SMTP id m20so5141892eds.2;
 Sun, 09 Aug 2020 17:06:40 -0700 (PDT)
X-Gm-Message-State: AOAM532t4/25GQg8MLyehF/RCssMixJUK9OntVAPvOcT0WQuPgXQZMQt
 Fk4b6z2+vo5992QUJB8NulIQuV49VkhyhjDoJw==
X-Google-Smtp-Source: ABdhPJzs3hNq441TdiNg5sGMfiRejhS75UfI9CWnqxJ5HqFTUExR+ocEV58lXwZry63RX+M/RRZzyTn/TlCXxBAyudU=
X-Received: by 2002:a05:6402:38c:: with SMTP id
 o12mr19470902edv.271.1597017998978; 
 Sun, 09 Aug 2020 17:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <81DFA743-B455-498F-B2F2-161DD9D51F57@public-files.de>
In-Reply-To: <81DFA743-B455-498F-B2F2-161DD9D51F57@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 10 Aug 2020 08:06:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-DYsbAWkdKfiGeJOwmPUOO1T+6WmOmhDQEUbzoRh+KPw@mail.gmail.com>
Message-ID: <CAAOTY_-DYsbAWkdKfiGeJOwmPUOO1T+6WmOmhDQEUbzoRh+KPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to
 mt7623n.dtsi
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_200642_645147_D31D89BB 
X-CRM114-Status: GOOD (  16.48  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0OOaciDnml6Ug6YCx5pelIOS4i+WNiDM6MjLlr6vpgZPvvJoKPgo+Cj4KPiBBbSA5
LiBBdWd1c3QgMjAyMCAwMjoxNjo1OSBNRVNaIHNjaHJpZWIgQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1
YW5nLmh1QGtlcm5lbC5vcmc+Ogo+ID4KPiA+SSB3b3VsZCBsaWtlIHRvIHB1dCBhbGwgZGV2aWNl
IGluIG10NzYyMy5kdHNpIHdpdGggc29tZSBkZXZpY2Uncwo+ID5zdGF0dXMgaXMgImRpc2FibGVk
IiBhbmQgY2hhbmdlIGl0cyBzdGF0dXMgaW4gcGxhdGZvcm0gZHRzaS4KPiA+SSB3b3VsZCBsaWtl
IHRvIHNlZSBhbGwgZGV2aWNlIGluIG10NzYyMy5kdHNpIGJlY2F1c2Ugb2YgaXRzIG5hbWUuIElm
Cj4gPnlvdSBtb3ZlIHNvbWUgZGV2aWNlIHRvIHBsYXRmb3JtIGR0c2ksIHdlIHdvdWxkIHRyYWNl
IGFsbCBwbGF0Zm9ybQo+ID5kdHNpIHRvIGZpbmQgb3V0IGhvdyBtYW55IGRldmljZSBpbiBtdDc2
MjMuIE9uZSBkYXkgYSBuZXcgcGxhdGZvcm0KPiA+ZW5hYmxlIGRpZmZlcmVudCBkZXZpY2VzLCB5
b3Ugd291bGQgcmVvcmdhbml6ZSBhbGwgdGhlc2UgcGxhdGZvcm0KPiA+ZHRzaT8KPgo+IE9rLHRo
ZW4gaSBjaGFuZ2UgdGhlIGR0cy1wYXRjaCBmcm9tIGhkbWktc2VyaWVzIHRvIGRpc2FibGUgYWxs
IG5vZGVzIGFuZCBlbmFibGluZyB0aGVtIGluIGJwaS1yMiBkdHMuIERvIHRoZXkgbmVlZCB0byBi
ZSBpbiBhbHBoYWJldGljYWwgb3JkZXIgKG9yIGFueSBvdGhlcik/CgpBbHBoYWJldGljYWwgb3Jk
ZXIgaXMgYmV0dGVyLgoKPgo+IElzIHRoZSB0bWRzIFBhdGNoIG9rPyAoYmVjYXVzZSByZXZpZXcg
bWlzc2luZykgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMTcwMDY3OS8KClRo
YXQgcGF0Y2ggbG9va3MgcmVhbGx5IGxpa2UgYSBoYWNrIHBhdGNoLiBJIHdvdWxkIHdhaXQgZm9y
IGEgbG9uZwp0aW1lIHRvIHNlZSB3aGV0aGVyIGFueSBvbmUgaGFzIGNvbW1lbnQgZm9yIHRoaXMu
IE9yIHlvdSBjb3VsZCBoYXZlIGEKYmV0dGVyIGV4cGxhaW4gZm9yIGl0LgpJIGNvdWxkIGFwcGx5
IG90aGVyIHBhdGNoZXMgZmlyc3QuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IEp1c3QgdG8g
a25vdyBiZWZvcmUgcmVwb3N0aW5nIHNlcmllcyBhcyB2NSA6KQo+IHJlZ2FyZHMgRnJhbmsKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
