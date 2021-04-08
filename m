Return-Path: <SRS0=hXrw=JF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BCBC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 14:03:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCCC6102A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Apr 2021 14:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCCC6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fb2oHCr48k1VN6JVh3oMa2NlnzFIZ7iTwLNKx3K4kdk=; b=BUxw7c+DMVeQnr
	2++d5k3BmOhkL0zBC3+AOf6TUT7clrwLSrmMYfJA6YHx1xAhX6gVR97geDNaIMQT2oIbK5CbIOwjX
	gWpwIJ1nIy3b/XxgH/EMNHoF+dEBmeLDztkXR1L7lXCzR3G+vPj5FNXBXYB4nebhUZRTrDOo8GQCY
	wXpMU6fOwl7UOKwqy6w3pkpLdHfsEdxHV8xEENuMcyzIT1BLMUSRXNjeJU5HwHHQwJRk0C/cG3XP/
	Omm/pWpIGM7aobAqIAloAOeUhOYaXvnYl5GQvMetAORhmp3sPiugd9peiNTWgd+1gqi0kjYDg1TTn
	iNP64+f8Sva6aw2ALF7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUVFc-008DAl-1K; Thu, 08 Apr 2021 14:03:16 +0000
Received: from mx.i2x.nl ([5.2.79.48])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUVFX-008D9L-SA
 for linux-mediatek@lists.infradead.org; Thu, 08 Apr 2021 14:03:14 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mx.i2x.nl (Postfix) with ESMTPS id 486E75FAE1;
 Thu,  8 Apr 2021 16:02:56 +0200 (CEST)
Authentication-Results: mx.i2x.nl;
 dkim=pass (2048-bit key) header.d=vdorst.com header.i=@vdorst.com
 header.b="GaDX8GbP"; dkim-atps=neutral
Received: from www (unknown [192.168.2.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 0413FBC4A3C;
 Thu,  8 Apr 2021 16:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 0413FBC4A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1617890576;
 bh=iTjQMjGaO13j0gfO948rxz1a3FR1rjNSKNPgqaVS82o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=GaDX8GbPzXFw0HGykitrLCBztl5DCDMQISYBbXc+j5DyttDBGVa34OOw5oeWseVqK
 TTW3Yqspd0SGsPQmN86G+682rx4ZXggI8IGKGtDB6cuWO3B1vIsPOboeLF8L+wZ8iH
 JfdHXoljUplYhnvpxxcU096xNsTkuLneoK1yqdkWDShETRx9iCDf7b39TzVOSBltN4
 8waSRdvcqba2R4SNDdSnH7+G1nDe98inN0JwJqnBshKh/ro91tBPYyYxeXYJUaokIy
 GUFtCRAvoFderbLegZHbq2mU8oPUqsIdYzfmgcKr99h36HisX3W2WCDqLYZAYokLCz
 lBxpMUBh//QEg==
Received: from 48.79.2.5.in-addr.arpa (48.79.2.5.in-addr.arpa [5.2.79.48])
 by www.vdorst.com (Horde Framework) with HTTPS; Thu, 08 Apr 2021 14:02:55
 +0000
Date: Thu, 08 Apr 2021 14:02:55 +0000
Message-ID: <20210408140255.Horde.Pl-DXtrqmiH9imsWjDqblfM@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Landen Chao
 <Landen.Chao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v3 net-next 0/4] MT7530 interrupt support
In-Reply-To: <20210408123919.2528516-1-dqfext@gmail.com>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_150312_324754_3DC89BE4 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UXVvdGluZyBERU5HIFFpbmdmYW5nIDxkcWZleHRAZ21haWwuY29tPjoKCj4gQWRkIHN1cHBvcnQg
Zm9yIE1UNzUzMCBpbnRlcnJ1cHQgY29udHJvbGxlci4KPgo+IERFTkcgUWluZ2ZhbmcgKDQpOgo+
ICAgbmV0OiBwaHk6IGFkZCBNZWRpYVRlayBQSFkgZHJpdmVyCj4gICBuZXQ6IGRzYTogbXQ3NTMw
OiBhZGQgaW50ZXJydXB0IHN1cHBvcnQKPiAgIGR0LWJpbmRpbmdzOiBuZXQ6IGRzYTogYWRkIE1U
NzUzMCBpbnRlcnJ1cHQgY29udHJvbGxlciBiaW5kaW5nCj4gICBzdGFnaW5nOiBtdDc2MjEtZHRz
OiBlbmFibGUgTVQ3NTMwIGludGVycnVwdCBjb250cm9sbGVyCj4KPiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L2RzYS9tdDc1MzAudHh0ICAgIHwgICA1ICsKPiAgZHJpdmVycy9uZXQvZHNh
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9uZXQvZHNh
L210NzUzMC5jICAgICAgICAgICAgICAgICAgICAgIHwgMjY2ICsrKysrKysrKysrKysrKystLQo+
ICBkcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmggICAgICAgICAgICAgICAgICAgICAgfCAgMjAgKy0K
PiAgZHJpdmVycy9uZXQvcGh5L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsK
PiAgZHJpdmVycy9uZXQvcGh5L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsK
PiAgZHJpdmVycy9uZXQvcGh5L21lZGlhdGVrLmMgICAgICAgICAgICAgICAgICAgIHwgMTEyICsr
KysrKysrCj4gIGRyaXZlcnMvc3RhZ2luZy9tdDc2MjEtZHRzL210NzYyMS5kdHNpICAgICAgICB8
ICAgMyArCj4gIDggZmlsZXMgY2hhbmdlZCwgMzg0IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9u
cygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9uZXQvcGh5L21lZGlhdGVrLmMKPgo+
IC0tCj4gMi4yNS4xCgpJIGFscmVhZHkgdGVzdGVkIHYyIHdoaWNoIHdvcmtzIGZpbmUuCnYzIHdv
cmtzIHRvby4KClRlc3RlZCBvbiBVYmlxdWl0aSBFUi1YLVNGUCAoTVQ3NjIxKSB3aXRoIDEgZXh0
ZXJuYWwgcGh5IHdoaWNoIHVzZXMgaXJxPVBPTEwuCgpTZWUgZG1lc2cgbG9nOgoKWyAgIDEyLjA0
NTY0NV0gbXQ3NTMwIG1kaW8tYnVzOjFmIGV0aDAgKHVuaW5pdGlhbGl6ZWQpOiBQSFkgIApbbXQ3
NTMwLTA6MDBdIGRyaXZlciBbTWVkaWFUZWsgTVQ3NTMwIFBIWV0gKGlycT0yNCkKWyAgIDEyLjQy
NTY0M10gbXQ3NTMwIG1kaW8tYnVzOjFmIGV0aDEgKHVuaW5pdGlhbGl6ZWQpOiBQSFkgIApbbXQ3
NTMwLTA6MDFdIGRyaXZlciBbTWVkaWFUZWsgTVQ3NTMwIFBIWV0gKGlycT0yNSkKWyAgIDEyLjc0
NTY0Ml0gbXQ3NTMwIG1kaW8tYnVzOjFmIGV0aDIgKHVuaW5pdGlhbGl6ZWQpOiBQSFkgIApbbXQ3
NTMwLTA6MDJdIGRyaXZlciBbTWVkaWFUZWsgTVQ3NTMwIFBIWV0gKGlycT0yNikKWyAgIDEzLjA2
NTY1Nl0gbXQ3NTMwIG1kaW8tYnVzOjFmIGV0aDMgKHVuaW5pdGlhbGl6ZWQpOiBQSFkgIApbbXQ3
NTMwLTA6MDNdIGRyaXZlciBbTWVkaWFUZWsgTVQ3NTMwIFBIWV0gKGlycT0yNykKWyAgIDEzLjQ0
NTY1N10gbXQ3NTMwIG1kaW8tYnVzOjFmIGV0aDQgKHVuaW5pdGlhbGl6ZWQpOiBQSFkgIApbbXQ3
NTMwLTA6MDRdIGRyaXZlciBbTWVkaWFUZWsgTVQ3NTMwIFBIWV0gKGlycT0yOCkKWyAgIDEzLjc4
NTY1Nl0gbXQ3NTMwIG1kaW8tYnVzOjFmIGV0aDUgKHVuaW5pdGlhbGl6ZWQpOiBQSFkgIApbbWRp
by1idXM6MDddIGRyaXZlciBbUXVhbGNvbW0gQXRoZXJvcyBBUjgwMzEvQVI4MDMzXSAoaXJxPVBP
TEwpCgpUZXN0ZWQtYnk6IFJlbsOpIHZhbiBEb3JzdCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPgoK
R3JlYXRzLAoKUmVuw6kKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
