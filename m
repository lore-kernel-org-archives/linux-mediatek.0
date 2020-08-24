Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F751C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 21:56:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4023A204EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 21:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x8nFL1P3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ejZiB6ta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4023A204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YWTBrIwxn6imcOQEYUfgYhxKHLato4i+1VKGxd5CcZ4=; b=x8nFL1P3iJI2efdT5Zfx6NtfE
	e/SrYgilKOzOsTMIeAAruBsSolMW7JSwetMucnserZEqcd0CCuEGPjv95XG8lNWTYtuHRhmqShH/U
	17QjIeRFxDNs6fBqFJJIPMlOBUB8WxUJ7sLzFo0Ynw5K/vGaPP4oqAuI5PNd92iB+krG/iAISrV6k
	c4aSfXsjtYhCreKgQLyClHuviIBzfsTftbj+la3/+vfTrqdzuQsY1ZZMbkIBRzxb3dClUeeU+c1DB
	dSVVrL3bErPDCSLKgnGWsQGmzGLNYSLV8YHNkTsJdjd4S95JbNFXaOsG58bLq7fIQHWIdm/X7XEDZ
	5tY9S+nrg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAKS0-0001dm-QQ; Mon, 24 Aug 2020 21:56:24 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAKRz-0001dM-34; Mon, 24 Aug 2020 21:56:24 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07OLtjYQ054833;
 Mon, 24 Aug 2020 16:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598306145;
 bh=ToO+3NPhNZ4b2VimF7JI2m/Y+G+uDEUZKNJic2RPL6o=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ejZiB6taEENr+Hn0hc5bAxqg24U0O44RwRV6vWtKHX8yF2fcogQtJomSomBv68bsw
 PLYH2FmE7jGwhcY7LIUnfJ+iODjLSNf3FaJ0nJiaJysxQlv4DWvzMPBjl/LP0PdV54
 oEReJqNmiKlUmO1gpvLUOBekMLgyCfT8DdSLNWaM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07OLtiU8069939
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Aug 2020 16:55:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 24
 Aug 2020 16:55:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 24 Aug 2020 16:55:43 -0500
Received: from [10.250.32.171] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07OLtgT3075587;
 Mon, 24 Aug 2020 16:55:43 -0500
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
To: Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@iki.fi>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
 <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
 <5190a40e-ad24-d98e-3588-b95592ea2db3@arm.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <86d2fb37-33b8-68f1-fe0c-dad496869b29@ti.com>
Date: Mon, 24 Aug 2020 16:55:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5190a40e-ad24-d98e-3588-b95592ea2db3@arm.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_175623_239496_DDE118F4 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, digetx@gmail.com,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, kyungmin.park@samsung.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gOC8yMC8yMCA2OjAxIFBNLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gT24gMjAyMC0wOC0yMCAy
MDo1NSwgU2FrYXJpIEFpbHVzIHdyb3RlOgo+PiBPbiBUaHUsIEF1ZyAyMCwgMjAyMCBhdCAwNjoy
NToxOVBNICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+PiBPbiAyMDIwLTA4LTIwIDE3OjUz
LCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4+Pj4gSGkgUm9iaW4sCj4+Pj4KPj4+PiBPbiBUaHUsIEF1
ZyAyMCwgMjAyMCBhdCAwNDowODozNlBNICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+Pj4+
IE5vdyB0aGF0IGFyY2gvYXJtIGlzIHdpcmVkIHVwIGZvciBkZWZhdWx0IGRvbWFpbnMgYW5kIGlv
bW11LWRtYSwgZGV2aWNlcwo+Pj4+PiBiZWhpbmQgSU9NTVVzIHdpbGwgZ2V0IG1hcHBpbmdzIHNl
dCB1cCBhdXRvbWF0aWNhbGx5IGFzIGFwcHJvcHJpYXRlLCBzbwo+Pj4+PiB0aGVyZSBpcyBubyBu
ZWVkIGZvciBkcml2ZXJzIHRvIGRvIHNvIG1hbnVhbGx5Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+Pj4+Cj4+Pj4gVGhhbmtz
IGZvciB0aGUgcGF0Y2guCj4+Pgo+Pj4gTWFueSB0aGFua3MgZm9yIHRlc3Rpbmcgc28gcXVpY2ts
eSEKPj4+Cj4+Pj4gSSBoYXZlbid0IGxvb2tlZCBhdCB0aGUgZGV0YWlscyBidXQgaXQgc2VlbXMg
dGhhdCB0aGlzIGNhdXNlcyB0aGUgYnVmZmVyCj4+Pj4gbWVtb3J5IGFsbG9jYXRpb24gdG8gYmUg
cGh5c2ljYWxseSBjb250aWd1b3VzLCB3aGljaCBjYXVzZXMgYSBmYWlsdXJlIHRvCj4+Pj4gYWxs
b2NhdGUgdmlkZW8gYnVmZmVycyBvZiBlbnRpcmVseSBub3JtYWwgc2l6ZS4gSSBndWVzcyB0aGF0
IHdhcyBub3QKPj4+PiBpbnRlbnRpb25hbD8KPj4+Cj4+PiBIbW0sIGl0IGxvb2tzIGxpa2UgdGhl
IGRldmljZSBlbmRzIHVwIHdpdGggdGhlIHdyb25nIERNQSBvcHMsIHdoaWNoIGltcGxpZXMKPj4+
IHNvbWV0aGluZyBkaWRuJ3QgZ28gYXMgZXhwZWN0ZWQgd2l0aCB0aGUgZWFybGllciBJT01NVSBz
ZXR1cCBhbmQgZGVmYXVsdAo+Pj4gZG9tYWluIGNyZWF0aW9uLiBDaGFuY2VzIGFyZSB0aGF0IGVp
dGhlciBJIG1pc3NlZCBzb21lIHN1YnRsZXR5IGluIHRoZQo+Pj4gb21hcF9pb21tdSBjaGFuZ2Us
IG9yIEkndmUgZnVuZGFtZW50YWxseSBtaXNqdWRnZWQgaG93IHRoZSBJU1AgcHJvYmluZyB3b3Jr
cwo+Pj4gYW5kIGl0IG5ldmVyIGFjdHVhbGx5IGdvZXMgZG93biB0aGUgb2ZfaW9tbXVfY29uZmln
dXJlKCkgcGF0aCBpbiB0aGUgZmlyc3QKPj4+IHBsYWNlLiBEbyB5b3UgZ2V0IGFueSBtZXNzYWdl
cyBmcm9tIHRoZSBJT01NVSBsYXllciBlYXJsaWVyIG9uIGR1cmluZyBib290PwoKWWVhaCwgSSBk
b24ndCB0aGluayB3ZSBnbyB0aHJvdWdoIHRoZSBvZl9pb21tdV9jb25maWd1cmUoKSBwYXRoLCB0
aGUgc2V0dXAgaXMKbW9zdGx5IGRvbmUgdXNpbmcgLnByb2JlX2RldmljZSgpIGFuZCAuYXR0YWNo
X2RldigpIG9wcy4gU2luY2UgdGhlIE1NVXMgYXJlCnByZXNlbnQgZGlyZWN0bHkgaW4gdGhlIHJl
c3BlY3RpdmUgc3ViLXN5c3RlbXMgYW5kIHJlbGllcyBvbiB0aGUgc3ViLXN5c3RlbQpjbG9ja2lu
ZyBhbmQgcG93ZXIsIHRoZSBNTVUgaXRzZWxmIGlzIHR1cm5lZCBPTiBhbmQgZW5hYmxlZCBkdXJp
bmcgLmF0dGFjaF9kZXYoKS4KCnJlZ2FyZHMKU3VtYW4KCj4+Cj4+IEkgZG8gZ2V0IHRoZXNlOgo+
Pgo+PiBbwqDCoMKgIDIuOTM0OTM2XSBpb21tdTogRGVmYXVsdCBkb21haW4gdHlwZTogVHJhbnNs
YXRlZAo+PiBbwqDCoMKgIDIuOTQwOTE3XSBvbWFwLWlvbW11IDQ4MGJkNDAwLm1tdTogNDgwYmQ0
MDAubW11IHJlZ2lzdGVyZWQKPj4gW8KgwqDCoCAyLjk0Njg5OV0gcGxhdGZvcm0gNDgwYmMwMDAu
aXNwOiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAgMAo+Pgo+IAo+IFNvIHRoYXQgbXVjaCBsb29rcyBP
SywgaWYgdGhlcmUgYXJlIG5vIG9idmlvdXMgZXJyb3JzLiBVbmZvcnR1bmF0ZWx5IHRoZXJlJ3Mg
bm8KPiBlYXN5IHdheSB0byB0ZWxsIGV4YWN0bHkgd2hhdCBvZl9pb21tdV9jb25maWd1cmUoKSBp
cyBkb2luZyAoYmV5b25kIGVuYWJsaW5nIGEKPiBjb3VwbGUgb2YgdmFndWUgZGVidWcgbWVzc2Fn
ZXMpLiBUaGUgZmlyc3QgdGhpbmcgSSdsbCBkbyB0b21vcnJvdyBpcwo+IGRvdWJsZS1jaGVjayB3
aGV0aGVyIGl0J3MgcmVhbGx5IHdvcmtpbmcgb24gbXkgYm9hcmRzIGhlcmUsIG9yIHdoZXRoZXIg
SSB3YXMKPiBqdXN0IGdldHRpbmcgbHVja3kgd2l0aCBDTUEuLi4gKEkgYXNzdW1lIHlvdSBkb24n
dCBoYXZlIENNQSBlbmFibGVkIGlmIHlvdSdyZQo+IGVuZGluZyB1cCBpbiByZW1hcF9hbGxvY2F0
b3JfYWxsb2MoKSkKPiAKPiBSb2Jpbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
