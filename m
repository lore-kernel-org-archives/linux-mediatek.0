Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E099DC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 10:35:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760B964F0F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 10:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760B964F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lDZbY7Pd9qKUCZ7BU2nry54Ef6/INV7+2DLT6x4rtZM=; b=Es5A1zhNj/s35ZB1qBaE9sO2W
	/HyvOw7dYbY6jpPgs9gjL2uPhY2O/65WZms/sQVRa3rrkMzMC+WKsC/FNtZiKoGj7M9bVV5eGVboU
	GzuCPKjJ/fMmcoDpaJcqQvqPYe4TZCqi5ORaZ3u47mwIze4JDaCkv17K4NxeOZaMTSFGTpfqBMlqs
	OshlWFZL7WEaUxkyWow9ybrMCHXGis2b1OIJmQasvVOCn5GJNbdWNMaqiofBqFNQxJX+BsEdbhtgl
	yx6ai97F/zAkFRd0POCWQPf5WcBoxn6dD6vphvMuD9znp7+Auz3BA1b40JPlY+oTvLAuY1wza+P9y
	6iXgOfpoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lH2NI-0004pg-4v; Tue, 02 Mar 2021 10:35:32 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lH2NC-0004ly-DM; Tue, 02 Mar 2021 10:35:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8851AED1;
 Tue,  2 Mar 2021 02:35:24 -0800 (PST)
Received: from [10.57.48.219] (unknown [10.57.48.219])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 25EFF3F73C;
 Tue,  2 Mar 2021 02:35:20 -0800 (PST)
Subject: Re: Aw: Re: Re: [PATCH 09/13] PCI: mediatek: Advertise lack of MSI
 handling
To: Frank Wunderlich <frank-w@public-files.de>, Marc Zyngier
 <maz@kernel.org>, Chuanjia Liu <chuanjia.liu@mediatek.com>
References: <20210225151023.3642391-1-maz@kernel.org>
 <20210225151023.3642391-10-maz@kernel.org>
 <trinity-b7e2cf18-f0e6-4d88-8a80-de6758b5a91f-1614595396771@3c-app-gmx-bap67>
 <b7721e2ff751cc9565a662cb713819e3@kernel.org>
 <trinity-9fa6d24e-f9de-4741-bf44-86f6197b174d-1614600961297@3c-app-gmx-bap67>
 <5afd1d656299d87c43bdf31b8ced2d5f@kernel.org>
 <trinity-e6593a34-3e03-4154-a03c-f3aed01e33bf-1614607598428@3c-app-gmx-bap67>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8b9c013a-b5d5-9b19-f28a-4af543e47fff@arm.com>
Date: Tue, 2 Mar 2021 10:35:14 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <trinity-e6593a34-3e03-4154-a03c-f3aed01e33bf-1614607598428@3c-app-gmx-bap67>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_053526_575850_70E84053 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjAyMS0wMy0wMSAxNDowNiwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPj4gR2VzZW5kZXQ6
IE1vbnRhZywgMDEuIE3DpHJ6IDIwMjEgdW0gMTQ6MzEgVWhyCj4+IFZvbjogIk1hcmMgWnluZ2ll
ciIgPG1hekBrZXJuZWwub3JnPgo+Pgo+PiBGcmFuaywKPj4KPj4+Pj4gaSBndWVzcyBpdCdzIGEg
YnVnIGluIGF0aDEwayBkcml2ZXIgb3IgbXkgcjY0IGJvYXJkIChpdCBpcyBhIHYxLjEKPj4+Pj4g
d2hpY2ggaGFzIG1pc3NpbmcgY2FwYWNpdG9ycyBvbiB0eCBsaW5lcykuCj4+Pj4KPj4+PiBObywg
dGhpcyBkZWZpbml0ZWx5IGxvb2tzIGxpa2UgYSBidWcgaW4gdGhlIE1USyBQQ0llIGRyaXZlciwK
Pj4+PiB3aGVyZSB0aGUgbXV0ZXggaXMgZWl0aGVyIG5vdCBwcm9wZXJseSBpbml0aWFsaXNlZCwg
Y29ycnVwdGVkLAo+Pj4+IG9yIHRoZSB3cm9uZyBwb2ludGVyIGlzIHBhc3NlZC4KPj4+Cj4+PiBi
dXQgd2h5IGRvZXMgaXQgaGFwcGVuIG9ubHkgd2l0aCB0aGUgYXRoMTBrLWNhcmQgYW5kIG5vdCB0
aGUgbXQ3NjEyIGluCj4+PiBzYW1lIHNsb3Q/Cj4+Cj4+IERvZXMgbXQ3NjEyIHVzZSBNU0k/IFdo
YXQgd2UgaGF2ZSBoZXJlIGlzIGEgYm9ndXMgbXV0ZXggaW4gdGhlCj4+IE1USyBQQ0llIGRyaXZl
ciwgYW5kIHRoZSBvbmx5IHdheSBub3QgdG8gZ2V0IHRoZXJlIHdvdWxkIGJlCj4+IHRvIGF2b2lk
IHVzaW5nIE1TSXMuCj4gCj4gaSBndWVzcyB0aGlzIGNhcmQvaXRzIGRyaXZlciBkb2VzIG5vdCB1
c2UgTVNJLiBEaWQgbm90IGZvdW5kIGFueXRoaW5nIGluICJkYXRhc2hlZXQiIFsxXSBvciBkcml2
ZXIgWzJdIGFib3V0IG1zaQoKRldJVywgbm8gbmVlZCB0byBndWVzcyAtIGBsc3BjaSAtdmAgKGFz
IHJvb3QpIHNob3VsZCB0ZWxsIHlvdSB3aGV0aGVyIAp0aGUgY2FyZCBoYXMgTVNJIChhbmQvb3Ig
TVNJLVgpIGNhcGFiaWxpdHksIGFuZCB3aGV0aGVyIGl0IGlzIGVuYWJsZWQgaWYgc28uCgpSb2Jp
bi4KCj4+Pgo+Pj4+IFRoaXMgcjY0IG1hY2hpbmUgaXMgc3VwcG9zZWQgdG8gaGF2ZSB3b3JraW5n
IE1TSXMsIHJpZ2h0Pwo+Pj4KPj4+IGltaG8gbXQ3NjIyIGhhdmUgd29ya2luZyBNU0kKPj4+Cj4+
Pj4gRG8geW91IGdldCB0aGUgc2FtZSBpc3N1ZSB3aXRob3V0IHRoaXMgc2VyaWVzPwo+Pj4KPj4+
IHRlc3RlZCA1LjExLjAgWzFdIHdpdGhvdXQgdGhpcyBzZXJpZXMgKGJ1dCB3aXRoIHlvdXIvdGhv
bWFzJyBwYXRjaAo+Pj4gZnJvbSBkaXNjdXNzaW9uIGFib3V0IG15IG9sZCBwYXRjaCkgYW5kIGdv
dCBzYW1lIHRyYWNlLiBzbyB0aGlzIHNlcmllcwo+Pj4gZG9lcyBub3QgYnJlYWsgYW55dGhpbmcg
aGVyZS4KPj4KPj4gQ2FuIHlvdSByZXRlc3Qgd2l0aG91dCBhbnkgYWRkaXRpb25hbCBwYXRjaCBv
biB0b3Agb2YgNS4xMT8KPj4gVGhlc2UgdHdvIHBhdGNoZXMgb25seSBhZmZlY3QgcGxhdGZvcm1z
IHRoYXQgZG8gKm5vdCogaGF2ZSBNU0lzIGF0IGFsbC4KPiAKPiBpIGNhbiByZXZlcnQgdGhlc2Ug
MiwgYnV0IHN0aWxsIG5lZWQgcGF0Y2hlcyBmb3IgbXQ3NjIyIHBjaWUtc3VwcG9ydCBbM10uLi5i
dHcuIGkgc2VlIHRoYXQgaSBtaXNzIHRoZXNlIGluIDUuMTEtbWFpbi4uLmRvIG5vdCBzZWUgdHJh
Y2ViYWNrIHdpdGggdGhlbSAoaGF2ZSBmaXJtd2FyZSBub3QgaW5zdGFsbGVkLi4uKQo+IAo+IHJv
b3RAYnBpLXI2NDp+IyBkbWVzZyB8IGdyZXAgYXRoCj4gWyAgICA2LjQ1MDc2NV0gYXRoMTBrX3Bj
aSAwMDAwOjAxOjAwLjA6IGFzc2lnbiBJUlE6IGdvdCAxNDYKPiBbICAgIDYuNjYxNzUyXSBhdGgx
MGtfcGNpIDAwMDA6MDE6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpCj4gWyAg
ICA2LjY5NzgxMV0gYXRoMTBrX3BjaSAwMDAwOjAxOjAwLjA6IGVuYWJsaW5nIGJ1cyBtYXN0ZXJp
bmcKPiBbICAgIDYuNzIxMjkzXSBhdGgxMGtfcGNpIDAwMDA6MDE6MDAuMDogcGNpIGlycSBtc2kg
b3Blcl9pcnFfbW9kZSAyIGlycV9tb2RlIDAgcgo+IGVzZXRfbW9kZSAwCj4gWyAgICA2LjkyMTAz
MF0gYXRoMTBrX3BjaSAwMDAwOjAxOjAwLjA6IEZhaWxlZCB0byBmaW5kIGZpcm13YXJlLU4uYmlu
IChOIGJldHdlZW4KPiAgIDIgYW5kIDYpIGZyb20gYXRoMTBrL1FDQTk4OFgvaHcyLjA6IC0yCj4g
WyAgICA2LjkzMTY5OF0gYXRoMTBrX3BjaSAwMDAwOjAxOjAwLjA6IGNvdWxkIG5vdCBmZXRjaCBm
aXJtd2FyZSBmaWxlcyAoLTIpCj4gWyAgICA2Ljk0MDQxN10gYXRoMTBrX3BjaSAwMDAwOjAxOjAw
LjA6IGNvdWxkIG5vdCBwcm9iZSBmdyAoLTIpCj4gCj4gc28gdHJhY2ViYWNrIHdhcyBjYXVzZWQg
YnkgbWlzc2luZyBjaGFuZ2VzIGluIG10ayBwY2llLWRyaXZlciBub3QgeWV0IHVwc3RyZWFtLCBh
ZGRlZCBDaHVhbmppYSBMaXUKPiAKPj4+Cj4+Pj4+IFRyaWVkIHdpdGggYW4gbXQ3NjEyZSwgdGhp
cyBzZWVtcyB0byB3b3JrIHdpdGhvdXQgYW55IGVycm9ycy4KPj4+Pj4KPj4+Pj4gc28gZm9yIG10
NzYyMi9tdDc2MjMKPj4+Pj4KPj4+Pj4gVGVzdGVkLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFu
ay13QHB1YmxpYy1maWxlcy5kZT4KPj4+Pgo+Pj4+IFdlIGRlZmluaXRlbHkgbmVlZCB0byB1bmRl
cnN0YW5kIHRoZSBhYm92ZS4KPj4+Cj4+PiB0aGVyZSBpcyBhIGhhcmR3YXJlLWJ1ZyB3aGljaCBt
YXkgY2F1c2UgdGhpcy4uLmFmYWlyIGkgc2F3IHRoaXMgd2l0aAo+Pj4gdGhlIGNhcmQgaW4gcjY0
IHdpdGggZWFybGllciBLZXJuZWwtdmVyc2lvbnMgd2hlcmUgb3RoZXIgY2FyZHMgd29yawo+Pj4g
KGxpa2UgdGhlIG10NzYxMmUpLgo+Pgo+PiBJIGRvbid0IHRoaW5rIGEgSFcgYnVnIGFmZmVjdGlu
ZyBQQ0kgd291bGQgY2F1c2Ugd2hhdCB3ZSBhcmUgc2VlaW5nCj4+IGhlcmUsIHVubGVzcyBpdCBy
ZXN1bHRzIGluIG1lbW9yeSBjb3JydXB0aW9uLgo+IAo+IAo+IFsxXSBodHRwczovL3d3dy5hc2lh
cmYuY29tL3Nob3Avd2lmaS13bGFuL3dpZmlfbWluaV9wY2llL3dzMjQzMy13aWZpLTExYWMtbWlu
aS1wY2llLW1vZHVsZS1tYW51ZmFjdHVyZXIvCj4gWzJdIGdyZXAgLVJuaSAnbXNpJyBkcml2ZXJz
L25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzZ4Mi8KPiBbM10gaHR0cHM6Ly9wYXRjaHdv
cmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz0zNzI4ODUK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hcm0ta2VybmVsCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
