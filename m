Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D62C33CA8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D24C42082E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A1ASsgy0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="FD+lzBYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D24C42082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=253thj+1AoBESKaqJ3+LCVPQGUmAbtxQ/Pn3yCbeuZw=; b=A1ASsgy0urSRDHjwIlXschsz3
	tknH7eRD3o3FTay/tV33+SEMjqMvBgFhBL87p9dS0kdj8tCIiHVMsJ+lD9OKldF87CJFm1lPWoJYL
	KoV4Iwh4d6laFOmgB/9NYr1p828Uz6HV9B0IyEFmXf7O7RizzZ5fBq7I4cf8WeQj8QajccuVBxC6x
	pveubO5a8mJcysoGtauu7bNm2EY5cvhgk2fThcJ49ASzykmxZtnyk4WtJtfFNg4iWnNpcVgFtQ35Q
	YFYD1XbXHaTssFZqy6hmntha9vr7wqpZzBOsnN8QqFbrsGCMAamk93/dQQVxfxtJXMOh3KKK7qeHK
	mYNEbFbqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqw3Y-0003EL-7f; Mon, 13 Jan 2020 09:30:44 +0000
Received: from fd.dlink.ru ([178.170.168.18])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqw3C-0002uT-9E; Mon, 13 Jan 2020 09:30:24 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 99A3A1B201D0; Mon, 13 Jan 2020 12:30:15 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 99A3A1B201D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1578907815; bh=ay0aQdubfRd2z0EzjvG25Fck9nkLxv3o/IS7a8ekqDc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=FD+lzBYViDyUELo+wu2Dz25kt1BtrTaoYevGr/umDm0za9Z8Uc/z4QSi8y62aO8XR
 r0/J1deZIrP6Om+XuYlVeyqmJ2i39as7p3CoM7HrDDq0Hw8DDs/M3bxi4Fl6FQ/+Th
 D/7b08u0P0PBCYZ06zORiTgIXi5224hd5igU8c+A=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id CCEA41B20968;
 Mon, 13 Jan 2020 12:30:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru CCEA41B20968
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id 2FC251B2613E;
 Mon, 13 Jan 2020 12:30:07 +0300 (MSK)
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 13 Jan 2020 12:30:07 +0300 (MSK)
MIME-Version: 1.0
Date: Mon, 13 Jan 2020 12:30:06 +0300
From: Alexander Lobakin <alobakin@dlink.ru>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH RFC net-next 00/20] net: dsa: add GRO support
In-Reply-To: <CA+h21hq95SmS3BraUQeEytP+3Y7irmShBEwpXqqJv+xOp4ePrg@mail.gmail.com>
References: <20191230143028.27313-1-alobakin@dlink.ru>
 <CA+h21hq95SmS3BraUQeEytP+3Y7irmShBEwpXqqJv+xOp4ePrg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.0
Message-ID: <607283965483d3bc3c0e969b1fadf540@dlink.ru>
X-Sender: alobakin@dlink.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_013022_532942_F58A651E 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, Matteo Croce <mcroce@redhat.com>,
 Edward Cree <ecree@solarflare.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sean Wang <sean.wang@mediatek.com>,
 Jiri Pirko <jiri@mellanox.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev <netdev@vger.kernel.org>,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VmxhZGltaXIgT2x0ZWFuIHdyb3RlIDMxLjEyLjIwMTkgMTg6MzI6Cj4gSGkgQWxleGFuZGVyLAoK
SGksCgo+IE9uIE1vbiwgMzAgRGVjIDIwMTkgYXQgMTY6MzEsIEFsZXhhbmRlciBMb2Jha2luIDxh
bG9iYWtpbkBkbGluay5ydT4gCj4gd3JvdGU6Cj4+IAo+PiBJIG1hcmsgdGhpcyBhcyBSRkMsIGFu
ZCB0aGVyZSBhcmUgdGhlIGtleSBxdWVzdGlvbnMgZm9yIG1haW50YWluZXJzLAo+PiBkZXZlbG9w
ZXJzLCB1c2VycyBldGMuOgo+PiAtIERvIHdlIG5lZWQgR1JPIHN1cHBvcnQgZm9yIERTQSBhdCBh
bGw/Cj4+IC0gV2hpY2ggdGFnZ2VyIHByb3RvY29scyByZWFsbHkgbmVlZCBpdCBhbmQgd2hpY2gg
ZG9uJ3Q/Cj4+IC0gRG9lcyB0aGlzIHNlcmllcyBicmluZyBhbnkgcGVyZm9ybWFuY2UgaW1wcm92
ZW1lbnRzIG9uIHRoZQo+PiAgIGFmZmVjdGVkIHN5c3RlbXM/Cj4gCj4gSWYgdGhlc2UgYXJlIHRo
ZXNlIHF1ZXN0aW9ucyBmb3IgbWFpbnRhaW5lcnMsIGRldmVsb3BlcnMsIHVzZXJzIGV0YywKPiB0
aGVuIHdoYXQgaGFzIGRldGVybWluZWQgeW91IHRvIG1ha2UgdGhlc2UgY2hhbmdlcz8KClRoZSBt
YWluIHJlYXNvbiB3YXMgb2J2aW91c2x5IHByZXR0eSBnb29kIHJlc3VsdHMgb24gYSBwYXJ0aWN1
bGFyCmhhcmR3YXJlIG9uIHdoaWNoIEkgZGV2ZWxvcGVkIHRoaXMgKGFuZCBvdGhlcikgc2VyaWVz
IGFuZCBhIGdlbmVyYWwKb3BpbmlvbiB0aGF0IEdSTyBpbXByb3ZlcyBvdmVyYWxsIHBlcmZvcm1h
bmNlIG9uIG1vc3Qgc3lzdGVtcy4KRFNBIGlzIGEgc3BlY2lhbCBjYXNlIHRob3VnaC4KCj4gVGhh
bmtzLAo+IC1WbGFkaW1pcgoKUmVnYXJkcywK4Zq3IOGbliDhmqIg4ZqmIOGaoCDhmrEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
