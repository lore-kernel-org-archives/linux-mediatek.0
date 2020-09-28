Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2547C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 11:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F9D32080C
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 11:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swR9lg6T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YpOdnes0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F9D32080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:Date:Message-ID:
	From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x0MMz0GfmQQy0bOuWxJiEBcJElK35BqW1s2a1EqCetE=; b=swR9lg6TQb1kHTdq3OKXBXgBG
	BWTHKCsODFyJijqYU8zYn4EwcIK34L68jP3Rnjs6cjpfGgHjk4zufUw1CrR0Ww/oZBezcX81480WF
	lFw6ATon7s7+1+HNxxvwDTDfFbpPXr3ZhK/HBXp2vnut6ncAY9f4WGqSCjbzxMqdFzGhIdYIUgzv9
	qu0rlbJoCHRhO+XUQyk+B1ipZxPM/LwNfuOwuG8laf3YoEPmP0bear25L9PSGaujRNP2PiF51i58f
	0GyV4uuWWxHu7X9lDvi8N6iUfyGXspF+hQVgUQzGnJPJmnRcZsWgAU0HDYRRE+EO3YU+p9QQaegFN
	qOEFOuW4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMrOm-0002vs-KL; Mon, 28 Sep 2020 11:32:52 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMrOj-0002ur-Tj
 for linux-mediatek@lists.infradead.org; Mon, 28 Sep 2020 11:32:51 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200928113247euoutp02953feb7e89408f30ab273754df93d7cf~470myEE7n1280712807euoutp02-
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2020 11:32:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200928113247euoutp02953feb7e89408f30ab273754df93d7cf~470myEE7n1280712807euoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1601292767;
 bh=+uo/0vdDAtG25qGjp09xK2qh3VzfFRoNQyQxfRdW754=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YpOdnes0Yjrqe/2nD9pUx4yDJsVEH06XpDI80qW/qBwE3rogv45G29fnEEVF+r6Ee
 yoyhQHwQ+nPLYtnMvvSJ5ZP53xf/vJXJlkXfIogmz0iAwvbvVdYHGzlvSDwdQqjAn5
 Z2XpcVUnqsiQu+/SqBz/eQq02REcXoh7I2FTCNF0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200928113246eucas1p202daf455573dc6614f1285c7fcca2757~470mZVS1T1751417514eucas1p2H;
 Mon, 28 Sep 2020 11:32:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id BC.8B.06318.ED9C17F5; Mon, 28
 Sep 2020 12:32:46 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200928113246eucas1p12a4b178ec04da6d0b1448d42861bf78c~470l1yIz31119311193eucas1p1z;
 Mon, 28 Sep 2020 11:32:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200928113246eusmtrp21d25f691a89ecf6d64b491f43a9cda3d~470l0uE8e1717117171eusmtrp2g;
 Mon, 28 Sep 2020 11:32:46 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-ae-5f71c9de010c
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id FC.80.06314.ED9C17F5; Mon, 28
 Sep 2020 12:32:46 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200928113244eusmtip2fd0487d5ac28e35d0bf3f6adfb341026~470kVFgvX0454604546eusmtip2a;
 Mon, 28 Sep 2020 11:32:44 +0000 (GMT)
Subject: Re: [PATCH 05/18] ARM/dma-mapping: Switch to iommu_dma_ops
To: Robin Murphy <robin.murphy@arm.com>, hch@lst.de, joro@8bytes.org,
 linux@armlinux.org.uk
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1d4c80ef-db03-3c31-a827-ab047fe9741f@samsung.com>
Date: Mon, 28 Sep 2020 13:32:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <4b51f1685a7ff88b673bf013ca6c27501e52f9b4.1597931876.git.robin.murphy@arm.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTHeXpv7700ltwWDCeiaJppwhKlyMyexIX5sg832RIXzT6ovFj0
 Dhpo0RacMDc7IIYyRCgx4q0CaTAoRWUFVJAXaSYNLy0ohjHWrRtgCCBiIzph+NbebfLt9z/n
 f/Kc/8nDEEoPtYbR6rN5g16TqaJk5M2eRc/mP3qPpahfvtiKPRP/kLi/6wmJ7f4JhB8+n6fw
 JasF4av2exJs8ZWRuKZrOy4UbCQ2Wxtp7M5/TGNzeS2NHRMjUlze5abxcNtFCpc0tkjxcMF9
 hCsHOyXYvCBQ2HmuA+E/7XMUzi+Mx91PJ6W4Y6lTiisrpilc+6iIwottVSQu7diLC73bsM/S
 RO6I5ia7qyRcQ1UD4oZH7hNcuXsz1yr8TnPWogtSzlFvpjjvSDvF+X50Sbim2lNcxWgd4u78
 aqK4wt4ukjtT8ITiSpvrEecavSX5UnFA9skRPlN7nDfEJhySpc+3fHzUE3HCfjnChGoUxYhh
 gP0IvHe/KEYyRsleQTDgOisRxQKCvtlBqSieIXh6x/9OhAYnOhaWCLFRh2DQ5qZFMY/APXCP
 DLjC2d0wdn2aCHAEmwRLt5eDJoJtl4LJ4guaKDYOiueKqQDL2QQYr/LSASbZjWAt7w/WV7PJ
 0NM3TooeBfRemAxyKHsQZuouBZlg10NBi5UQORLGJqsl4qpnQ+Gnoe9F/gxsD81I5HCYcTXT
 Iq+FN63VwdDAFiD4y3ONFkUJguH8yn8ntoPXs0QFTkawMXCjLVYs74TWcQctXjIMRucU4g5h
 YLl5nhDLcig6rRTdm0BwXf//2e6hB0QZUgkrkgkr0ggr0gjv361BZD2K5HOMujTeGK/nv9li
 1OiMOfq0LYezdA707pf3v3Y9v406l1OdiGWQapVc7TyWopRqjhtzdU4EDKGKkO9y9ycr5Uc0
 uXm8ISvFkJPJG50oiiFVkfJ423SSkk3TZPMZPH+UN/zXlTCha0zoB/Wzb7UxsaZGx6mckyUl
 f+u+GzuoS7gyNduUsng4ujbxWp52/jfZocSMzyv8cr9sVWvZ1AtbzKvkhqivQr5W1PmifDs/
 aAjXx5V+ui5ssW99/b6hBPtdV8/u/esi92p/KfIvqF+GbNPcWo6e6syzhKSOxWjVvdnRwurG
 9g2x+OfZPSrSmK6J+5AwGDVvAb76VTLhAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e0+NqPRdU38Ib1YDSJodn20Y9Z6EVyIoAeBPdSGXdRyLne3
 0giSKaHLxBmVbrbER5aLMs3evhYmOk3UECvTzAVZTo0ssBfpVuB/H875fjgc+EoI2QgVIklO
 NfKGVG2Kgl5Auv+0Da0dak+LX/fs9yJ4MfqTBHfTBAnOL6MIXn6bpOGqvRDBTWerCAqHC0go
 bYqGbFsZCbn2GjF0mcfFkGutEEPtaD8F1qYuMfQ9LqEhr6aegr6sHgRF3Y0iyJ220eC61IDg
 ndNLgzk7HFqmPBQ0/GikoOjiGA0VH3JomHnsICG/YS9kD0bCcGEduWUZ52lxiLhbjluI6+vv
 IThr11ruke2tmLPnFFNcbXUuzQ32P6W54fNtIq6u4ix3caAKcU9eZdJcdnsTyV3ImqC5/HvV
 iGsbeCDaHXhQtdGgNxn5FUl6wbhJcYiFMBUbBaqwiCgVG66O3RAWqQjVbDzKpySf5A2hmiOq
 pMl69YkX8nRnpTwTlQZaUIAEMxG4YfoHYUELJDKmEuGbX8y0f7EEt1/OpPy8GP/qt9D+kBfh
 /OYpcm6xmNmOX98eI+ZYzsTi6SqnTyaYpxSu9Ib4hUGEz30f8Ak0w2KL1+ILSRkNfu8YFM8x
 ySix3er2zYOYONyZ9/FfJhC3F3t8bgBzCH+qukr6D6zHjroRws/LcVa9/R8H49eea6ICJLPN
 023zFNs8xTZPKUVkNZLzJkGXqBNYlaDVCabURFWCXleLZut1//lM3UPUe3efCzESpFgoXedK
 i5dR2pNChs6FsIRQyKXbutxxMulRbcZp3qCPN5hSeMGFImefsxIhQQn62bKmGuPZSFYNUaw6
 XB2+HhTB0hym5bCMSdQa+eM8f4I3/PdEkoCQTFROTiVpgsnN5s4jaM99W4nhnnJlREbajes7
 xBr3KUZ5Xn979c6YvKDrFzpORX0OPfbmj6Sn+2wnnbDNMzK++ivV3FGz9P3Mw9itr4ralHxY
 nKj8gMf0s2XXqpcFea1lVZN3hjZ4oydSSAZqpWYZFTOyP2Zh/ZWp9DOtvcronc2UghSStOwa
 wiBo/wJinf+vdAMAAA==
X-CMS-MailID: 20200928113246eucas1p12a4b178ec04da6d0b1448d42861bf78c
X-Msg-Generator: CA
X-RootMTR: 20200820150917eucas1p258445fb7b4aa1da9fa605d63423aed01
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200820150917eucas1p258445fb7b4aa1da9fa605d63423aed01
References: <cover.1597931875.git.robin.murphy@arm.com>
 <CGME20200820150917eucas1p258445fb7b4aa1da9fa605d63423aed01@eucas1p2.samsung.com>
 <4b51f1685a7ff88b673bf013ca6c27501e52f9b4.1597931876.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_073250_157726_64FCC3B6 
X-CRM114-Status: GOOD (  18.94  )
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
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 kyungmin.park@samsung.com, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgUm9iaW4sCgpPbiAyMC4wOC4yMDIwIDE3OjA4LCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gV2l0
aCB0aGUgSU9NTVUgb3BzIG5vdyBsb29raW5nIG11Y2ggdGhlIHNhbWUgc2hhcGUgYXMgaW9tbXVf
ZG1hX29wcywKPiBzd2l0Y2ggdGhlbSBvdXQgaW4gZmF2b3VyIG9mIHRoZSBpb21tdS1kbWEgbGli
cmFyeSwgY3VycmVudGx5IGVuaGFuY2VkCj4gd2l0aCB0ZW1wb3Jhcnkgd29ya2Fyb3VuZHMgdGhh
dCBhbGxvdyBpdCB0byBhbHNvIHNpdCB1bmRlcm5lYXRoIHRoZQo+IGFyY2gtc3BlY2lmaWMgQVBJ
LiBXaXRoIHRoYXQgaW4gcGxhY2UsIHdlIGNhbiBub3cgc3RhcnQgY29udmVydGluZyB0aGUKPiBy
ZW1haW5pbmcgSU9NTVUgZHJpdmVycyBhbmQgY29uc3VtZXJzIHRvIHdvcmsgd2l0aCBJT01NVSBB
UEkgZGVmYXVsdAo+IGRvbWFpbnMgaW5zdGVhZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJvYmluIE11
cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+CgpJJ3ZlIHBsYXllZCBhIGJpdCBsb25nZXIgd2l0
aCB0aGlzIGFuZCBmb3VuZCB0aGF0IHJlYWRpbmcgdGhlIGtlcm5lbCAKdmlydHVhbCBhZGRyZXNz
IG9mIHRoZSBidWZmZXJzIGFsbG9jYXRlZCB2aWEgZG1hX2FsbG9jX2F0dHJzKCkgZnJvbSAKZG1h
LWlvbW11IG9wcyBnaXZlcyB0cmFzaGVzIGZyb20gdGltZSB0byB0aW1lLiBJdCB0b29rIG1lIGEg
d2hpbGUgdG8gCmRlYnVnIHRoaXMuLi4KCllvdXIgY29udmVyc2lvbiBtaXNzZXMgYWRkaW5nIGFy
Y2hfZG1hX3ByZXBfY29oZXJlbnQoKSB0byBhcmNoL2FybSwgc28gCnRoZSBidWZmZXJzIGFyZSBj
bGVhcmVkIGJ5IHRoZSBtbSBhbGxvY2F0b3IsIGJ1dCB0aGUgY2FjaGVzIGFyZSBOT1QgCmZsdXNo
ZWQgZm9yIHRoZSBuZXdseSBhbGxvY2F0ZWQgYnVmZmVycy4KClRoaXMgZml4ZXMgdGhlIGlzc3Vl
OgoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL0tjb25maWcgYi9hcmNoL2FybS9LY29uZmlnCmluZGV4
IGZlYzNlNTkyMTViOC4uOGI2MGJjYzViMTRmIDEwMDY0NAotLS0gYS9hcmNoL2FybS9LY29uZmln
CisrKyBiL2FyY2gvYXJtL0tjb25maWcKQEAgLTIsNiArMiw3IEBACiDCoGNvbmZpZyBBUk0KIMKg
wqDCoMKgwqDCoMKgIGJvb2wKIMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQgeQorwqDCoMKgwqDCoMKg
IHNlbGVjdCBBUkNIX0hBU19ETUFfUFJFUF9DT0hFUkVOVAogwqDCoMKgwqDCoMKgwqAgc2VsZWN0
IEFSQ0hfMzJCSVRfT0ZGX1QKIMKgwqDCoMKgwqDCoMKgIHNlbGVjdCBBUkNIX0hBU19CSU5GTVRf
RkxBVAogwqDCoMKgwqDCoMKgwqAgc2VsZWN0IEFSQ0hfSEFTX0RFQlVHX1ZJUlRVQUwgaWYgTU1V
CmRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9kbWEtbWFwcGluZy5jIGIvYXJjaC9hcm0vbW0vZG1h
LW1hcHBpbmcuYwppbmRleCBmZjZjNDk2MjE2MWEuLjY5NTQ2ODFiNzNkYSAxMDA2NDQKLS0tIGEv
YXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcuYworKysgYi9hcmNoL2FybS9tbS9kbWEtbWFwcGluZy5j
CkBAIC0yNjYsNiArMjY2LDIwIEBAIHN0YXRpYyB2b2lkIF9fZG1hX2NsZWFyX2J1ZmZlcihzdHJ1
Y3QgcGFnZSAqcGFnZSwgCnNpemVfdCBzaXplLCBpbnQgY29oZXJlbnRfZmxhZwogwqDCoMKgwqDC
oMKgwqAgfQogwqB9Cgordm9pZCBhcmNoX2RtYV9wcmVwX2NvaGVyZW50KHN0cnVjdCBwYWdlICpw
YWdlLCBzaXplX3Qgc2l6ZSkKK3sKKworwqDCoMKgwqDCoMKgIGlmIChQYWdlSGlnaE1lbShwYWdl
KSkgeworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaHlzX2FkZHJfdCBiYXNlID0gX19w
Zm5fdG9fcGh5cyhwYWdlX3RvX3BmbihwYWdlKSk7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHBoeXNfYWRkcl90IGVuZCA9IGJhc2UgKyBzaXplOworwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBvdXRlcl9mbHVzaF9yYW5nZShiYXNlLCBlbmQpOworwqDCoMKgwqDCoMKgIH0gZWxz
ZSB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgKnB0ciA9IHBhZ2VfYWRkcmVz
cyhwYWdlKTsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hY19mbHVzaF9yYW5nZShw
dHIsIHB0ciArIHNpemUpOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvdXRlcl9mbHVz
aF9yYW5nZShfX3BhKHB0ciksIF9fcGEocHRyKSArIHNpemUpOworwqDCoMKgwqDCoMKgIH0KK30K
KwogwqAvKgogwqAgKiBBbGxvY2F0ZSBhIERNQSBidWZmZXIgZm9yICdkZXYnIG9mIHNpemUgJ3Np
emUnIHVzaW5nIHRoZQogwqAgKiBzcGVjaWZpZWQgZ2ZwIG1hc2suwqAgTm90ZSB0aGF0ICdzaXpl
JyBtdXN0IGJlIHBhZ2UgYWxpZ25lZC4KCkkgYWxzbyB3b25kZXIgaWYgaXQgd291bGQgYmUgYmV0
dGVyIHRvIHVzZSBwZXItYXJjaCBfX2RtYV9jbGVhcl9idWZmZXIoKSAKaW5zdGVhZCBvZiBzZXR0
aW5nIF9fR0ZQX1pFUk8gdW5jb25kaXRpb25hbGx5IGluIGRtYS1pb21tdS5jLiBUaGlzIApzaG91
bGQgYmUgZmFzdGVyIG9uIEFSTSB3aXRoIGhpZ2htZW0uLi4KCiA+IC4uLgoKQmVzdCByZWdhcmRz
Ci0tIApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
