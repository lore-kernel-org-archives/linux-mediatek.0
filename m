Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AE7C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 14:07:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EB6364D99
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 14:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EB6364D99
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eMTWiz3bZMzexGbKgezjIUr0L+cnSclBunny/Yso1yI=; b=w9S/5f/bl18g01BSdk9ebXDl5
	J+hvn9fXrxSRqN1JZXetOBobSm+O4CbrnrtN3GD50DR0WZS9Ns4Zzc3smb3PkNtquJOqoZJofFALL
	y1cq91vMhgJwgr0UfMcRmr4yQ3Tzs3CRU45Ht2u9aXy+NIjbDCBCoPM2xBRHn7c6370tR+5xEhO5p
	s5wqYdXhEA//bbojQjKCT2mDUOsWp3qdZj/gAbEWaLLCCJaqlgXRiPlcNIjX3cqH7Llk+Qn2ZdU4u
	ZD/YdNpKSChi5M8DJMwcT12OjEgsexPdjOQO8eZBPlqAv7eXWsSdE5uGBWr+bye4Vie96+LRYeXBZ
	IX0nzdRvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjCy-0004yn-03; Mon, 01 Mar 2021 14:07:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjCu-0004y8-Ec; Mon, 01 Mar 2021 14:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=WHdVxhV29YlPM0mWIDGXvrTHgZ6Mnz3VlczXPrbnEZI=; b=Ibp3RD+N3NFyFsA1kZGfawLK/T
 x709CvQMOmo+bTNAIWzG5FU9igVHDRsRFUTRwEC+oLPY8l/3SzkwCi9JLMRdqLrfVZMhPjo6K0HlX
 3z1pYytEHy0+AoMwLrXwMbN5KLW+kndfqblc1pDsULas1a9liuoRka/0rYrBTiW3nUXNhUZ6MBH5c
 00bORRmu2A+QewnjPbDonvOArgzzoFT2P07eYDu3v3qdse4TC3s1pM9o4tntv5DE/VTcLmLy+9Dd0
 Ze0cYqJRMJEHj8dH4ig++//D1Bbu2kaNeeFUvINbuq4pQtxCXJ5F24Gc31+/2hi1XWBQnyBruuvI1
 7BzHiCBw==;
Received: from mout.gmx.net ([212.227.17.22])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lGjCp-00FoHM-P2; Mon, 01 Mar 2021 14:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1614607598;
 bh=den9Zg5WTYMa1+hk6yVW+XcXT5cE1vgzQ1fj1l8Xzmg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lK/QKL4Nn4oxvF+p3HJkfH+axulgw5KgJHU7z7PeqrC4umD8DhqfZ4Q4MPxPJOg3o
 3IwlkSopZVnHvn70fElJhcy1jpJr0izdHinuh7ZZqG2ZXsKzTpb97W3V8OgUnp/rgO
 H0Gmt2CC5RJ2+91u6nMKL7AoJvy8LZtrZTM57l20=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.155.40] ([217.61.155.40]) by web-mail.gmx.net
 (3c-app-gmx-bap67.server.lan [172.19.172.67]) (via HTTP); Mon, 1 Mar 2021
 15:06:38 +0100
MIME-Version: 1.0
Message-ID: <trinity-e6593a34-3e03-4154-a03c-f3aed01e33bf-1614607598428@3c-app-gmx-bap67>
From: Frank Wunderlich <frank-w@public-files.de>
To: Marc Zyngier <maz@kernel.org>, Chuanjia Liu <chuanjia.liu@mediatek.com>
Subject: Aw: Re:  Re:  [PATCH 09/13] PCI: mediatek: Advertise lack of MSI
 handling
Date: Mon, 1 Mar 2021 15:06:38 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <5afd1d656299d87c43bdf31b8ced2d5f@kernel.org>
References: <20210225151023.3642391-1-maz@kernel.org>
 <20210225151023.3642391-10-maz@kernel.org>
 <trinity-b7e2cf18-f0e6-4d88-8a80-de6758b5a91f-1614595396771@3c-app-gmx-bap67>
 <b7721e2ff751cc9565a662cb713819e3@kernel.org>
 <trinity-9fa6d24e-f9de-4741-bf44-86f6197b174d-1614600961297@3c-app-gmx-bap67>
 <5afd1d656299d87c43bdf31b8ced2d5f@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ZQRRsjs6c1f84vfCoFTlATSpGq7/GPSSqcOXpNHZnIPBxXdGKhnluVmsRPL7cvd5TixfO
 rd++Gy3YXyTot3JK+rRMPXe91y4N7z8P1CbSHrdHSLRLID8kPxErKuGOmXrleO0Bfb/FSYLVD7I1
 exjG1WwZLNf5mVqZAzqoqU+D2jXRNkmHYRdopomO4GdIOot/isQJAVevQ9dFLx9eAKpi1FqR7jLw
 E4devkrLQdn73q338vzExSxYVbRc4wqcWru7hdZXCfLQogz/sYe3GUE2V0pDJ2F9Bx0nnqfifZU4
 tU=
X-UI-Out-Filterresults: notjunk:1;V03:K0:KytOOKdXDHg=:nIlbptdfbifxSWJxa1OENK
 vqWu+JcL+p7AVrxyhTxBs9N3lu1OZ6alc2D+z8+8P5aBLH/tR6sFTAxujDL0D39bhvvgTkPQA
 1C+xGfcWpNc3o341HgE8sVMz4/zXiUbpHh5khZM9fiOPl7M7LHWvyVeMveOXcbiui0sLfNRjt
 4/V/EmQ/QPR9S1OMHVLlx+pYYoDrNXVXDHx8g2jUllJQeFIA7+gJJJ++GLkKDsUl3mEjezfHH
 hk7KB2wWc2KfU68qPtxNstL3cDRbTn6nFavqAnIKeGWOxIBaVbLfEZMRJrmLczqEZOiUani21
 +flCSu7xfQpJU0Rhz+vjORbcGFGIT4zyr2UUM8bFjDV2DwQTUFIvlixb+tZx6g4LJkL+87eW/
 qgt9DIwUT4WlUIxqGqBCZI30vs/P8eiyGhxIVLz9BrjOYH5AsEatn6KFiv89MzaVjvNxDy6QU
 b4u1/eKsLbnLqRPKfZHQCL8gZ7+ZYzRD+yZ3L0WBEb8UiUTx8TOKpTLCTuNNvFKXrfr+/QFYl
 HgK6+96WGuPk9VEq2c3gIY37/zs3+lLh6w7g5FekMLDvpTi1NUgCiiXsw3V7L01UuZqA99QDO
 YFzWVW5oOYmGY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_140728_748371_74C23AC1 
X-CRM114-Status: GOOD (  22.85  )
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
Cc: linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Will Deacon <will@kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <treding@nvidia.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBHZXNlbmRldDogTW9udGFnLCAwMS4gTcOkcnogMjAyMSB1bSAxNDozMSBVaHIKPiBWb246ICJN
YXJjIFp5bmdpZXIiIDxtYXpAa2VybmVsLm9yZz4KPgo+IEZyYW5rLAo+IAo+ID4+ID4gaSBndWVz
cyBpdCdzIGEgYnVnIGluIGF0aDEwayBkcml2ZXIgb3IgbXkgcjY0IGJvYXJkIChpdCBpcyBhIHYx
LjEKPiA+PiA+IHdoaWNoIGhhcyBtaXNzaW5nIGNhcGFjaXRvcnMgb24gdHggbGluZXMpLgo+ID4+
IAo+ID4+IE5vLCB0aGlzIGRlZmluaXRlbHkgbG9va3MgbGlrZSBhIGJ1ZyBpbiB0aGUgTVRLIFBD
SWUgZHJpdmVyLAo+ID4+IHdoZXJlIHRoZSBtdXRleCBpcyBlaXRoZXIgbm90IHByb3Blcmx5IGlu
aXRpYWxpc2VkLCBjb3JydXB0ZWQsCj4gPj4gb3IgdGhlIHdyb25nIHBvaW50ZXIgaXMgcGFzc2Vk
Lgo+ID4gCj4gPiBidXQgd2h5IGRvZXMgaXQgaGFwcGVuIG9ubHkgd2l0aCB0aGUgYXRoMTBrLWNh
cmQgYW5kIG5vdCB0aGUgbXQ3NjEyIGluCj4gPiBzYW1lIHNsb3Q/Cj4gCj4gRG9lcyBtdDc2MTIg
dXNlIE1TST8gV2hhdCB3ZSBoYXZlIGhlcmUgaXMgYSBib2d1cyBtdXRleCBpbiB0aGUKPiBNVEsg
UENJZSBkcml2ZXIsIGFuZCB0aGUgb25seSB3YXkgbm90IHRvIGdldCB0aGVyZSB3b3VsZCBiZQo+
IHRvIGF2b2lkIHVzaW5nIE1TSXMuCgppIGd1ZXNzIHRoaXMgY2FyZC9pdHMgZHJpdmVyIGRvZXMg
bm90IHVzZSBNU0kuIERpZCBub3QgZm91bmQgYW55dGhpbmcgaW4gImRhdGFzaGVldCIgWzFdIG9y
IGRyaXZlciBbMl0gYWJvdXQgbXNpCgo+ID4gCj4gPj4gVGhpcyByNjQgbWFjaGluZSBpcyBzdXBw
b3NlZCB0byBoYXZlIHdvcmtpbmcgTVNJcywgcmlnaHQ/Cj4gPiAKPiA+IGltaG8gbXQ3NjIyIGhh
dmUgd29ya2luZyBNU0kKPiA+IAo+ID4+IERvIHlvdSBnZXQgdGhlIHNhbWUgaXNzdWUgd2l0aG91
dCB0aGlzIHNlcmllcz8KPiA+IAo+ID4gdGVzdGVkIDUuMTEuMCBbMV0gd2l0aG91dCB0aGlzIHNl
cmllcyAoYnV0IHdpdGggeW91ci90aG9tYXMnIHBhdGNoCj4gPiBmcm9tIGRpc2N1c3Npb24gYWJv
dXQgbXkgb2xkIHBhdGNoKSBhbmQgZ290IHNhbWUgdHJhY2UuIHNvIHRoaXMgc2VyaWVzCj4gPiBk
b2VzIG5vdCBicmVhayBhbnl0aGluZyBoZXJlLgo+IAo+IENhbiB5b3UgcmV0ZXN0IHdpdGhvdXQg
YW55IGFkZGl0aW9uYWwgcGF0Y2ggb24gdG9wIG9mIDUuMTE/Cj4gVGhlc2UgdHdvIHBhdGNoZXMg
b25seSBhZmZlY3QgcGxhdGZvcm1zIHRoYXQgZG8gKm5vdCogaGF2ZSBNU0lzIGF0IGFsbC4KCmkg
Y2FuIHJldmVydCB0aGVzZSAyLCBidXQgc3RpbGwgbmVlZCBwYXRjaGVzIGZvciBtdDc2MjIgcGNp
ZS1zdXBwb3J0IFszXS4uLmJ0dy4gaSBzZWUgdGhhdCBpIG1pc3MgdGhlc2UgaW4gNS4xMS1tYWlu
Li4uZG8gbm90IHNlZSB0cmFjZWJhY2sgd2l0aCB0aGVtIChoYXZlIGZpcm13YXJlIG5vdCBpbnN0
YWxsZWQuLi4pCgpyb290QGJwaS1yNjQ6fiMgZG1lc2cgfCBncmVwIGF0aCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApbICAgIDYuNDUwNzY1XSBhdGgxMGtf
cGNpIDAwMDA6MDE6MDAuMDogYXNzaWduIElSUTogZ290IDE0NiAgICAgICAgICAgICAgICAgICAg
IApbICAgIDYuNjYxNzUyXSBhdGgxMGtfcGNpIDAwMDA6MDE6MDAuMDogZW5hYmxpbmcgZGV2aWNl
ICgwMDAwIC0+IDAwMDIpICAgICAgICAgIApbICAgIDYuNjk3ODExXSBhdGgxMGtfcGNpIDAwMDA6
MDE6MDAuMDogZW5hYmxpbmcgYnVzIG1hc3RlcmluZyAgICAgICAgICAgICAgICAgIApbICAgIDYu
NzIxMjkzXSBhdGgxMGtfcGNpIDAwMDA6MDE6MDAuMDogcGNpIGlycSBtc2kgb3Blcl9pcnFfbW9k
ZSAyIGlycV9tb2RlIDAgcgplc2V0X21vZGUgMCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApbICAgIDYuOTIxMDMwXSBh
dGgxMGtfcGNpIDAwMDA6MDE6MDAuMDogRmFpbGVkIHRvIGZpbmQgZmlybXdhcmUtTi5iaW4gKE4g
YmV0d2VlbgogMiBhbmQgNikgZnJvbSBhdGgxMGsvUUNBOTg4WC9odzIuMDogLTIgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApbICAgIDYuOTMxNjk4XSBhdGgxMGtfcGNp
IDAwMDA6MDE6MDAuMDogY291bGQgbm90IGZldGNoIGZpcm13YXJlIGZpbGVzICgtMikgICAgIApb
ICAgIDYuOTQwNDE3XSBhdGgxMGtfcGNpIDAwMDA6MDE6MDAuMDogY291bGQgbm90IHByb2JlIGZ3
ICgtMikKCnNvIHRyYWNlYmFjayB3YXMgY2F1c2VkIGJ5IG1pc3NpbmcgY2hhbmdlcyBpbiBtdGsg
cGNpZS1kcml2ZXIgbm90IHlldCB1cHN0cmVhbSwgYWRkZWQgQ2h1YW5qaWEgTGl1Cgo+ID4gCj4g
Pj4gPiBUcmllZCB3aXRoIGFuIG10NzYxMmUsIHRoaXMgc2VlbXMgdG8gd29yayB3aXRob3V0IGFu
eSBlcnJvcnMuCj4gPj4gPgo+ID4+ID4gc28gZm9yIG10NzYyMi9tdDc2MjMKPiA+PiA+Cj4gPj4g
PiBUZXN0ZWQtYnk6IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgo+
ID4+IAo+ID4+IFdlIGRlZmluaXRlbHkgbmVlZCB0byB1bmRlcnN0YW5kIHRoZSBhYm92ZS4KPiA+
IAo+ID4gdGhlcmUgaXMgYSBoYXJkd2FyZS1idWcgd2hpY2ggbWF5IGNhdXNlIHRoaXMuLi5hZmFp
ciBpIHNhdyB0aGlzIHdpdGgKPiA+IHRoZSBjYXJkIGluIHI2NCB3aXRoIGVhcmxpZXIgS2VybmVs
LXZlcnNpb25zIHdoZXJlIG90aGVyIGNhcmRzIHdvcmsKPiA+IChsaWtlIHRoZSBtdDc2MTJlKS4K
PiAKPiBJIGRvbid0IHRoaW5rIGEgSFcgYnVnIGFmZmVjdGluZyBQQ0kgd291bGQgY2F1c2Ugd2hh
dCB3ZSBhcmUgc2VlaW5nCj4gaGVyZSwgdW5sZXNzIGl0IHJlc3VsdHMgaW4gbWVtb3J5IGNvcnJ1
cHRpb24uCgoKWzFdIGh0dHBzOi8vd3d3LmFzaWFyZi5jb20vc2hvcC93aWZpLXdsYW4vd2lmaV9t
aW5pX3BjaWUvd3MyNDMzLXdpZmktMTFhYy1taW5pLXBjaWUtbW9kdWxlLW1hbnVmYWN0dXJlci8K
WzJdIGdyZXAgLVJuaSAnbXNpJyBkcml2ZXJzL25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210
NzZ4Mi8KWzNdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRp
YXRlay9saXN0Lz9zZXJpZXM9MzcyODg1CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
