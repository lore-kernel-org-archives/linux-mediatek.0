Return-Path: <SRS0=Kof6=5Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9020AC2D0EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 14:23:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C11A20B1F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 14:23:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gV+p2L7I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Q16PeABv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C11A20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:
	Date:Message-ID:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjuV2mr39mzyVS+LsH/4vbp/1J8JnvUSVXMfYSXqtFQ=; b=gV+p2L7IV1O84c
	B99fvLiKnjpkoguFE7sIBU0duLVn2Orga9x6Qt8ynokWTk2g1ipZ2qP8c6TugRO/ib6tCyGh/GR4V
	w6DW6DTj5LdQbQGnmNQ9lLEZZbC94dL5eM3PHxJntF5cIfpBd4lGKbzAOP34X57ABLK/+oPac54bb
	7Bl3/k6djm6nID0NFvOCP+1SIrZWo7OwrqlbPxvtplLDJSMyjWBSYqivfkk+4c3reoQVuyVeS8L89
	1mLwfn5USljESUBNo1auoSDiKAwqNbh2+O2Xw2PzCGTT/WW5X6N52gzmYspJR1JN6Rv5de0hkA9ul
	rdT7+Vds61p4xrnM/wZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMBbo-0004tI-H2; Wed, 08 Apr 2020 14:23:16 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMBbl-0004rB-LC
 for linux-mediatek@lists.infradead.org; Wed, 08 Apr 2020 14:23:15 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200408142306euoutp014bef1b7652878e0f89f3be19ed6a0aad~D3i7eP6z11029110291euoutp01w
 for <linux-mediatek@lists.infradead.org>; Wed,  8 Apr 2020 14:23:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200408142306euoutp014bef1b7652878e0f89f3be19ed6a0aad~D3i7eP6z11029110291euoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1586355786;
 bh=fPbQcPR1oF/v5hK09P8uzwfqplWO3pBhbWYE2b0EXHE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Q16PeABv1KJDXsi+C6wbSRMnvW0UWxgws6fTgiTAHn8bC8/JzqU+/Rnnt8dOjLYGB
 XruNzZbDx3gU7i2vk7971pGcLF/MO7BdK5t/RGCxyjKDmiVVOaSMJSzpFsn/gyqoH+
 kg3zpOvmQbH5I5lmEVI8kxn8Xs3BHwPbX/NWVT8A=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200408142306eucas1p2c1e75b5c003294b987b54204f8374a6e~D3i7Bz_u61843118431eucas1p2o;
 Wed,  8 Apr 2020 14:23:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id B5.D7.60679.A4EDD8E5; Wed,  8
 Apr 2020 15:23:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200408142305eucas1p1425276324bb62d9d5ce10138dbc91efb~D3i6uRwxk0469604696eucas1p1_;
 Wed,  8 Apr 2020 14:23:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200408142305eusmtrp1312d5ec55fb881d4b3abc5bda7d3acb0~D3i6tN3IK1183911839eusmtrp1F;
 Wed,  8 Apr 2020 14:23:05 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-51-5e8dde4a50e2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 7C.B7.07950.94EDD8E5; Wed,  8
 Apr 2020 15:23:05 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200408142304eusmtip13441c366871541f79223a15a5111bf46~D3i5Y6XIu1251612516eusmtip1B;
 Wed,  8 Apr 2020 14:23:04 +0000 (GMT)
Subject: Re: [RFC PATCH 31/34] iommu/exynos: Create iommu_device in struct
 exynos_iommu_owner
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof
 Kozlowski <krzk@kernel.org>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Gerald
 Schaefer <gerald.schaefer@de.ibm.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Message-ID: <f59b0bb3-8c08-9cc9-bb1a-e69b7b226f60@samsung.com>
Date: Wed, 8 Apr 2020 16:23:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUzMcRze934v9ysuv070WczLjRAisX0t8zZ//Lw1zJrZiqPfEpV2V8jZ
 tO6GTtHpj3LlVF4KpbpU7pjcUYfbXZGdJKHacC6Z2rwu7vp56b/neT7P830+n+3LEFIjHcIk
 pqTxihR5koz2Jxtavjnnr+vOjVt42kNjZ+8PEtfp6mlsb/pIYt2VfAKbPO9o/KvnA4VLmqJw
 5rU2Cmv0ZSTOLqoR4/xH50T4dO8HAre2eqmuySHG7eZiGrerHyP8+fUvAueVqglc2HpHhLOH
 9DTO0kTit6VfCWz51Efhb2YDicsdBhprupasDOH6LAYRV2moRJylx0pzJv1LMVdXEcYZr2bT
 XJfrNs0ZHm7m6i4e5fI7yhGXq/5Ic40uA8HV2VXcoHHKpoDt/svi+aTEA7xiwfKd/ntavjdQ
 qS2zDuVUW1Emejxdi/wYYBeD4161WIv8GSlbgaDzeQElkCEEDtctQiCDCJov9oj+Rn6eqv7j
 Kkfg0ZpGBlJ2AIHr/gYfHs/ugP6yYcKHaTYCtP1a2hcIYr+QUNJcP/IswXaI4PKAUexzSdjl
 YHrwZiRBsjMgZ7iT9uEJbCw4ezoowRMID8/2kT7sx64AtaNgxEOwU0FdX0QIOBg6+86LfAXA
 vmNAk1f8Z+81UHbBRgt4PLhtN8QCngz2/BxSCKgRvHFWiQWSg6A9qxAJrijocn73phlvxRyo
 Ni8Q5FVgc5aKfTKwAdDRHygsEQBnGgoIQZbAiWNSwR0Ketv1f7WWtidEHpLpR52mH3WOftQ5
 +v+9JYi8ioL5dGVyAq9clMIfDFfKk5XpKQnhu/cnG5H3J9uHbUM3kfnnLitiGSQbK7l7OzdO
 SskPKDOSrQgYQhYkWZ/llSTx8ozDvGL/DkV6Eq+0okkMKQuWRJa9j5WyCfI0fh/Pp/KKv1MR
 4xeSiRpPSKPd3X41QfYrYyauHqtTBaQf2Xt8WlOEwmS/mcpMaA6bRs0cuButcn869qR/S15M
 +fOtS3WFU2wW1aUHA/FtXWGGQUMU9Sx0W0PNwXG1G0PQK7fnS5prTWNt5bwXbRFPn3a7X/xI
 nH1yrSdGpvLoMg5XRYYqYjQL52ImyHwkXEYq98gjwgiFUv4b+k7N28UDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA03Se0hTURwHcM7uwyktblPzJFE2gkJxuc3pscxSKG4FoRZJltpNL2o6J7uz
 p5A5/9DlE8ty1pxiaGpYW1o+8LHKUjMVQ8Q0fAwMTBOL6CGu6Qz873fO9/s5cODHx4SvCXd+
 YoqaVaUwySLSCe9beTvhfexzXrRPZZsX+jDzF0emokYS9XUs4KjocTGGmr9+IZF1eo5Aho4D
 KKNukEBZukoc5ZQ9dUDFvQ95qGBmDkMDA7ZjUUe/AxpueUCiYc0QQEuTVgwVVmgwdH+gnYdy
 fuhIlJklQ7MVvzDUtWgh0O8WPY6q+/UkyhqXH3anLV16Hl2vrwd017SZpJt1Ew60qcaTNtbm
 kPT4SBtJ63vCaFPVTbp4tBrQeZoFkn4xosdoU98N+rtxR+jmSHGgSpmmZj0SlJz6oOicBEnF
 kgAklvoGiCUy/6j9UrloX1BgHJuceJlV7Qu6IE7o/tNEpHbvuZrbYAYZYGiXFjjyIeULl/Mb
 CC1w4gupRwC2PhnF7MF22FOSQdhnZ7g8oiXtpXkAawez1wJnKgbOV66sAZKSQO28veRC/cVh
 1WgruRpg1CgPvqneatezAN6dKOWtBgIqCDa/m1rTOLUb5q6MrQFXKgoWaFqBvbMF9pRa8NXZ
 kToENf331h/1g3qT3WLUTqhpLFuf3eCYpZxXCIS6DVy3geg2EN0GYgB4LXBh0zhFvIKTijlG
 waWlxItjlQojsG1QU/fv5y+BduGUGVB8INok6GzLixYSzGXumsIMIB8TuQhOZNquBHHMteus
 ShmjSktmOTOQ2z5XhLm7xipt+5iijpHIJf4oQOIv85f5IZGbIJvqOi+k4hk1m8Syqazqv+Px
 Hd0zgF9EQZh179nQn955PiLGdMtyybTo0hDuMP7iveFE5oUsw9hQPespHwO3Syev5Nc/Oy0M
 Xo4ypjPZhGwpgqmz7jeGHvpU3h7SHYN9+7nN62NwYHv8QQ3mc7wgPSS9ppLfdNSjvXfqVceZ
 ZcZa1XLkZefFlUjngBlDSWz4yaQ7FWYRziUwEk9MxTH/APyyaD1XAwAA
X-CMS-MailID: 20200408142305eucas1p1425276324bb62d9d5ce10138dbc91efb
X-Msg-Generator: CA
X-RootMTR: 20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82
References: <20200407183742.4344-1-joro@8bytes.org>
 <CGME20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82@eucas1p2.samsung.com>
 <20200407183742.4344-32-joro@8bytes.org>
 <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_072313_824737_7C41D91F 
X-CRM114-Status: GOOD (  23.07  )
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgYWdhaW4sCgpPbiAwOC4wNC4yMDIwIDE0OjIzLCBNYXJlayBTenlwcm93c2tpIHdyb3RlOgo+
IEhpIEpvZXJnLAo+Cj4gT24gMDcuMDQuMjAyMCAyMDozNywgSm9lcmcgUm9lZGVsIHdyb3RlOgo+
PiBGcm9tOiBKb2VyZyBSb2VkZWwgPGpyb2VkZWxAc3VzZS5kZT4KPj4KPj4gVGhlICdzdHJ1Y3Qg
ZXh5bm9zX2lvbW11X293bmVyJyBpcyBhbiB1bWJyZWxsYSBmb3IgbXVsdGlwbGUgU1lTTU1VCj4+
IGluc3RhbmNlcyBhdHRhY2hlZCB0byBvbmUgbWFzdGVyLiBBcyBzdWNoIGFsbCB0aGVzZSBpbnN0
YW5jZXMgYXJlCj4+IGhhbmRsZWQgdGhlIHNhbWUsIHRoZXkgYXJlIGFsbCBjb25maWd1cmVkIHdp
dGggdGhlIHNhbWUgaW9tbXVfZG9tYWluLAo+PiBmb3IgZXhhbXBsZS4KPj4KPj4gVGhlIElPTU1V
IGNvcmUgY29kZSBleHBlY3RzIGVhY2ggZGV2aWNlIHRvIGhhdmUgb25seSBvbmUgSU9NTVUKPj4g
YXR0YWNoZWQsIHNvIGNyZWF0ZSB0aGUgSU9NTVUtZGV2aWNlIGZvciB0aGUgdW1icmVsbGEgaW5z
dGVhZCBvZiBlYWNoCj4+IGhhcmR3YXJlIFNZU01NVS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSm9l
cmcgUm9lZGVsIDxqcm9lZGVsQHN1c2UuZGU+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2lvbW11L2V4
eW5vcy1pb21tdS5jIHwgOTYgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvZXh5bm9zLWlvbW11LmMgYi9kcml2ZXJzL2lv
bW11L2V4eW5vcy1pb21tdS5jCj4+IGluZGV4IDE4NmZmNWNjOTc1Yy4uODZlY2NjYmYwNDM4IDEw
MDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L2V4eW5vcy1pb21tdS5jCj4+ICsrKyBiL2RyaXZl
cnMvaW9tbXUvZXh5bm9zLWlvbW11LmMKPj4gQEAgLTIzNSw2ICsyMzUsOCBAQCBzdHJ1Y3QgZXh5
bm9zX2lvbW11X293bmVyIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIGNvbnRyb2xs
ZXJzO8KgwqDCoCAvKiBsaXN0IG9mIAo+PiBzeXNtbXVfZHJ2ZGF0YS5vd25lcl9ub2RlICovCj4+
IMKgwqDCoMKgwqAgc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tYWluO8KgwqDCoCAvKiBkb21haW4g
dGhpcyBkZXZpY2UgaXMgCj4+IGF0dGFjaGVkICovCj4+IMKgwqDCoMKgwqAgc3RydWN0IG11dGV4
IHJwbV9sb2NrO8KgwqDCoMKgwqDCoMKgIC8qIGZvciBydW50aW1lIHBtIG9mIGFsbCBzeXNtbXVz
ICovCj4+ICsKPj4gK8KgwqDCoCBzdHJ1Y3QgaW9tbXVfZGV2aWNlIGlvbW11O8KgwqDCoCAvKiBJ
T01NVSBjb3JlIGhhbmRsZSAqLwo+PiDCoCB9Owo+PiDCoCDCoCAvKgo+PiBAQCAtMjc0LDggKzI3
Niw2IEBAIHN0cnVjdCBzeXNtbXVfZHJ2ZGF0YSB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGxpc3Rf
aGVhZCBvd25lcl9ub2RlO8KgwqDCoCAvKiBub2RlIGZvciBvd25lciBjb250cm9sbGVycyAKPj4g
bGlzdCAqLwo+PiDCoMKgwqDCoMKgIHBoeXNfYWRkcl90IHBndGFibGU7wqDCoMKgwqDCoMKgwqAg
LyogYXNzaWduZWQgcGFnZSB0YWJsZSBzdHJ1Y3R1cmUgKi8KPj4gwqDCoMKgwqDCoCB1bnNpZ25l
ZCBpbnQgdmVyc2lvbjvCoMKgwqDCoMKgwqDCoCAvKiBvdXIgdmVyc2lvbiAqLwo+PiAtCj4+IC3C
oMKgwqAgc3RydWN0IGlvbW11X2RldmljZSBpb21tdTvCoMKgwqAgLyogSU9NTVUgY29yZSBoYW5k
bGUgKi8KPj4gwqAgfTsKPj4gwqAgwqAgc3RhdGljIHN0cnVjdCBleHlub3NfaW9tbXVfZG9tYWlu
ICp0b19leHlub3NfZG9tYWluKHN0cnVjdCAKPj4gaW9tbXVfZG9tYWluICpkb20pCj4+IEBAIC02
MjUsMTggKzYyNSw2IEBAIHN0YXRpYyBpbnQgZXh5bm9zX3N5c21tdV9wcm9iZShzdHJ1Y3QgCj4+
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gwqDCoMKgwqDCoCBkYXRhLT5zeXNtbXUgPSBkZXY7
Cj4+IMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2luaXQoJmRhdGEtPmxvY2spOwo+PiDCoCAtwqDCoMKg
IHJldCA9IGlvbW11X2RldmljZV9zeXNmc19hZGQoJmRhdGEtPmlvbW11LCAmcGRldi0+ZGV2LCBO
VUxMLAo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfbmFt
ZShkYXRhLT5zeXNtbXUpKTsKPj4gLcKgwqDCoCBpZiAocmV0KQo+PiAtwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHJldDsKPj4gLQo+PiAtwqDCoMKgIGlvbW11X2RldmljZV9zZXRfb3BzKCZkYXRhLT5p
b21tdSwgJmV4eW5vc19pb21tdV9vcHMpOwo+PiAtwqDCoMKgIGlvbW11X2RldmljZV9zZXRfZndu
b2RlKCZkYXRhLT5pb21tdSwgJmRldi0+b2Zfbm9kZS0+Zndub2RlKTsKPgo+IFRoZSBpb21tdV9k
ZXZpY2Vfc2V0X2Z3bm9kZSgpIGNhbGwgaXMgbG9zdCBkdXJpbmcgdGhpcyBjb252ZXJzaW9uLCAK
PiB3aGF0IGJyZWFrcyBkcml2ZXIgb3BlcmF0aW9uLiBNb3N0IG9mIHRoZSBhYm92ZSBJT01NVSBm
dyBjYWxscyB5b3UgCj4gaGF2ZSBtb3ZlZCB0byB4bGF0ZSBmdW5jdGlvbi4gSSd2ZSBjaGVja2Vk
IGJyaWVmbHkgYnV0IGl0IGxvb2tzIHRoYXQgCj4gdGhlcmUgaXMgYSBjaGlja2VuLWVnZyBwcm9i
bGVtIGhlcmUuIFRoZSBvd25lciBzdHJ1Y3R1cmUgaXMgYWxsb2NhdGVkIAo+IGFuZCBpbml0aWFs
aXplZCBmcm9tIG9mX3hsYXRlKCksIHdoaWNoIHdvbid0IGJlIGNhbGxlZCB3aXRob3V0IGxpbmtp
bmcgCj4gdGhlIHByb2JsZW0gaW9tbXUgc3RydWN0dXJlIHdpdGggdGhlIGZ3bm9kZSBmaXJzdCwg
d2hhdCBtaWdodCBiZSBkb25lIAo+IG9ubHkgaW4gc3lzbW11X3Byb2JlKCkuIEkgd2lsbCBjaGVj
ayBob3cgdG8gaGFuZGxlIHRoaXMgaW4gYSBkaWZmZXJlbnQgCj4gd2F5LgoKSSd2ZSBwbGF5ZWQg
d2l0aCB0aGlzIGEgYml0IGFuZCBpdCBsb29rcyB0aGF0IHdvbid0IGJlIGVhc3kgdG8gbWFrZSBp
dCAKd29ya2luZyBvbiBBUk0gMzJiaXQuCgpJIG5lZWQgYSBwbGFjZSB0byBpbml0aWFsaXplIHBy
b3Blcmx5IGFsbCB0aGUgc3RydWN0dXJlcyBmb3IgdGhlIGdpdmVuIAptYXN0ZXIgKElPTU1VIGNs
aWVudCBkZXZpY2UsIHRoZSBvbmUgd2hpY2ggcGVyZm9ybXMgRE1BIG9wZXJhdGlvbnMpLgoKSSB0
cmllZCB0byBtb3ZlIGFsbCB0aGUgaW5pdGlhbGl6YXRpb24gZnJvbSB4bGF0ZSgpIHRvIGRldmlj
ZV9wcm9iZSgpLCAKYnV0IHN1Y2ggYXBwcm9hY2ggZG9lc24ndCB3b3JrLgoKT24gQVJNMzJiaXQg
ZXh5bm9zX2lvbW11X2RldmljZV9wcm9iZSgpIGlzIGNhbGxlZCBieSB0aGUgZGV2aWNlIGNvcmUg
YW5kIApJT01NVSBmcmFtZXdvcmsgdmVyeSBlYXJseSwgYmVmb3JlIHRoZSBFeHlub3MgU1lTTU1V
IHBsYXRmb3JtIGRldmljZXMgCihjb250cm9sbGVycykgYXJlIHByb2JlZCB5ZXQuIEV2ZW4gaW9t
bXUgY2xhc3MgaXMgbm90IHlldCBpbml0aWFsaXplZCAKdGhhdCB0aW1lLCBzbyByZXR1cm5pbmcg
YW55dGhpbmcgc3VjY2Vzc2Z1bCBmcm9tIGl0IGNhdXNlcyBmb2xsb3dpbmcgCk5VTEwgcHRyIGRl
cmVmZXJlbmNlOgoKVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJl
bmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDA0YwouLi4KCihfX2lvbW11X3Byb2JlX2Rldmlj
ZSkgZnJvbSBbPGMwNTViMzM0Pl0gKGlvbW11X3Byb2JlX2RldmljZSsweDE4LzB4MTE0KQooaW9t
bXVfcHJvYmVfZGV2aWNlKSBmcm9tIFs8YzA1NWI0YWM+XSAoaW9tbXVfYnVzX25vdGlmaWVyKzB4
N2MvMHg5NCkKKGlvbW11X2J1c19ub3RpZmllcikgZnJvbSBbPGMwMTRlOGVjPl0gKG5vdGlmaWVy
X2NhbGxfY2hhaW4rMHg0NC8weDg0KQoobm90aWZpZXJfY2FsbF9jaGFpbikgZnJvbSBbPGMwMTRl
OWVjPl0gCihfX2Jsb2NraW5nX25vdGlmaWVyX2NhbGxfY2hhaW4rMHg0OC8weDYwKQooX19ibG9j
a2luZ19ub3RpZmllcl9jYWxsX2NoYWluKSBmcm9tIFs8YzAxNGVhMWM+XSAKKGJsb2NraW5nX25v
dGlmaWVyX2NhbGxfY2hhaW4rMHgxOC8weDIwKQooYmxvY2tpbmdfbm90aWZpZXJfY2FsbF9jaGFp
bikgZnJvbSBbPGMwNWM4ZDFjPl0gKGRldmljZV9hZGQrMHgzZTgvMHg3MDQpCihkZXZpY2VfYWRk
KSBmcm9tIFs8YzA3YmFmYzQ+XSAob2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0ZV9wZGF0YSsweDkw
LzB4YzQpCihvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRlX3BkYXRhKSBmcm9tIFs8YzA3YmIxMzg+
XSAKKG9mX3BsYXRmb3JtX2J1c19jcmVhdGUrMHgxMzQvMHg0OGMpCihvZl9wbGF0Zm9ybV9idXNf
Y3JlYXRlKSBmcm9tIFs8YzA3YmIxYTQ+XSAKKG9mX3BsYXRmb3JtX2J1c19jcmVhdGUrMHgxYTAv
MHg0OGMpCihvZl9wbGF0Zm9ybV9idXNfY3JlYXRlKSBmcm9tIFs8YzA3YmI2M2M+XSAob2ZfcGxh
dGZvcm1fcG9wdWxhdGUrMHg4NC8weDExNCkKKG9mX3BsYXRmb3JtX3BvcHVsYXRlKSBmcm9tIFs8
YzExMjVlOWM+XSAKKG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCsweDkwLzB4YWMp
CihvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRlX2luaXQpIGZyb20gWzxjMDEwMzI2Yz5dIAoo
ZG9fb25lX2luaXRjYWxsKzB4ODAvMHg0MmMpCihkb19vbmVfaW5pdGNhbGwpIGZyb20gWzxjMTEw
MTA3ND5dIChrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDE1Yy8weDIwOCkKKGtlcm5lbF9pbml0X2Zy
ZWVhYmxlKSBmcm9tIFs8YzBhZmRkZTA+XSAoa2VybmVsX2luaXQrMHg4LzB4MTE4KQooa2VybmVs
X2luaXQpIGZyb20gWzxjMDEwMTBiND5dIChyZXRfZnJvbV9mb3JrKzB4MTQvMHgyMCkKCkkndmUg
dHJpZWQgcmV0dXJuaW5nIEVSUl9QVFIoLUVQUk9CRV9ERUZFUikgZnJvbSBkZXZpY2VfcHJvYmUo
KSwgYnV0IEkgCmRvZXNuJ3Qgd29yayB0aGVyZS4gU29tZSBtb3JlIGNoYW5nZXMgaW4gdGhlIGZy
YW1ld29yayBhcmUgbmVlZGVkLi4uCgogPiAuLi4KCkJlc3QgcmVnYXJkcwotLSAKTWFyZWsgU3p5
cHJvd3NraSwgUGhEClNhbXN1bmcgUiZEIEluc3RpdHV0ZSBQb2xhbmQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
