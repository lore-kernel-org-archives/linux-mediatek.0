Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF00C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 16:24:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94A3B205CB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 16:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p6cmw9V/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="dbg0PtMP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94A3B205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:Message-ID:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9dn1NUmuNTIT8ScfcOr1lCYUx1dH2ERA1iVVr/p4wvI=; b=p6cmw9V/MzS0U06wfvXAdxkWN
	P/2DykJl6R85ThHEpo24QN0Jm4krBSHGwllF1EWvRMy0OM0aenxaf++Y4RmggtXxCRVx2zK/QHzcS
	L9rm1pkl9r5l97xIgx+r5OEIfOL7lfTOv7qbLHwOcecOth63uvi1uI+BMX3FcM/AE8fA/rpsdSWjz
	fq9LU7YpwXr2E/rgmcFg9hfLqsvJToKTtIWhkxBHqcJLEDNmleoH0zbbDZcnxO3mzU8oJHjp6xcms
	soXp8Z/eKdDhcgF3lq6ngca26BOsDiAmz75ZyQZXFHv6gsdP2PVD0qbtfc7xTLUxAWL9V9ZU5F6Lr
	1nOH7A/dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFfnQ-0007Ez-Qc; Tue, 08 Sep 2020 15:44:36 +0000
Received: from ale.deltatee.com ([204.191.154.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFfnO-0007EK-7b; Tue, 08 Sep 2020 15:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DvSiEr2JCy+2h9dy7CIecEenG2gQsa0A5OP2d9PI/p0=; b=dbg0PtMPK+HbvI6GMZzh/J5E8Z
 Q/TWc7UsDFhg1cOVJt/pysWKo3QQRWraF1mqHM6mdRGQ6y0rj+OXqZUSgbgyS5kW1MF22xpb3bm/M
 J9Rf7mpjgRlZVOcx1SZJ6EJp7lFy55R6nqk8PsS8AEsD0hf0g4vJC65mDtFEAYzf7cE0mQHAAVUlU
 S7bbDUQqTHtHsrq5f8RHYZU0yCa5rG3lpeqMLTKlNXStV+C6+vhM0UL/8Wjc5CgLnNZYF3jPybjc/
 ulyb1L7dumDVfTJQeMlSwf7IyaVvWKGWBe0b9ikUV9lDLMezAf5m+fY9DJk+AU+8aTTS01s/mCgwR
 I5zJe2Ew==;
Received: from s01060023bee90a7d.cg.shawcable.net ([24.64.145.4]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1kFfnI-0008Go-Gj; Tue, 08 Sep 2020 09:44:29 -0600
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tom Murphy <murphyt7@tcd.ie>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
 <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
 <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
 <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
 <60a82319-cbee-4cd1-0d5e-3c407cc51330@linux.intel.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <e598fb31-ef7a-c2ee-8a54-bf62d50c480c@deltatee.com>
Date: Tue, 8 Sep 2020 09:44:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <60a82319-cbee-4cd1-0d5e-3c407cc51330@linux.intel.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 24.64.145.4
X-SA-Exim-Rcpt-To: robin.murphy@arm.com, kgene@kernel.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 cohuck@redhat.com, dwmw2@infradead.org, gerald.schaefer@de.ibm.com,
 virtualization@lists.linux-foundation.org, tglx@linutronix.de,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 agross@kernel.org, linux-rockchip@lists.infradead.org, hch@infradead.org,
 jonathanh@nvidia.com, krzk@kernel.org, maz@kernel.org,
 linux-samsung-soc@vger.kernel.org, jean-philippe@linaro.org,
 m.szyprowski@samsung.com, will@kernel.org, julien.grall@arm.com,
 linux-tegra@vger.kernel.org, bjorn.andersson@linaro.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, kvm@vger.kernel.org,
 murphyt7@tcd.ie, tvrtko.ursulin@linux.intel.com
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [Intel-gfx] [PATCH 0/8] Convert the intel iommu driver to the
 dma-iommu api
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_114434_340992_1EA027A2 
X-CRM114-Status: GOOD (  19.38  )
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIwLTA5LTA4IDk6MjggYS5tLiwgVHZydGtvIFVyc3VsaW4gd3JvdGU6Cj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3NjYXR0ZXJsaXN0LmgKPj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1Cj4+IGluZGV4IGI3YjU5MzI4Y2I3Ni4uOTM2N2FjODAx
ZjBjIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3NjYXR0ZXJsaXN0
LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9zY2F0dGVybGlzdC5oCj4+IEBA
IC0yNywxMyArMjcsMTkgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBzdHJ1Y3Qgc2d0X2l0ZXIg
ewo+PiDCoCB9IF9fc2d0X2l0ZXIoc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wsIGJvb2wgZG1hKSB7
Cj4+IMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNndF9pdGVyIHMgPSB7IC5zZ3AgPSBzZ2wgfTsK
Pj4KPj4gK8KgwqDCoMKgwqDCoCBpZiAoc2dsICYmICFzZ19kbWFfbGVuKHMuc2dwKSkKPiAKPiBJ
J2QgZXh0ZW5kIHRoZSBjb25kaXRpb24gdG8gYmUsIGp1c3QgdG8gYmUgc2FmZToKPiDCoMKgwqDC
oGlmIChkbWEgJiYgc2dsICYmICFzZ19kbWFfbGVuKHMuc2dwKSkKPgoKUmlnaHQsIGdvb2QgY2F0
Y2gsIHRoYXQncyBkZWZpbml0ZWx5IG5lY2Vzc2FyeS4KCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHMuc2dwID0gTlVMTDsKPj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChzLnNn
cCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzLm1heCA9IHMuY3VyciA9
IHMuc2dwLT5vZmZzZXQ7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHMubWF4ICs9
IHMuc2dwLT5sZW5ndGg7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChkbWEp
Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRtYSkgewo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcy5tYXggKz0gc2dfZG1h
X2xlbihzLnNncCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzLmRtYSA9IHNnX2RtYV9hZGRyZXNzKHMuc2dwKTsKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVs
c2Ugewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcy5t
YXggKz0gcy5zZ3AtPmxlbmd0aDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHMucGZuID0gcGFnZV90b19wZm4oc2dfcGFnZShzLnNncCkpOwo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gT3RoZXJ3aXNlIGhhcyB0aGlzIGJl
ZW4gdGVzdGVkIG9yIGFsdGVybmF0aXZlbHkgaG93IHRvIHRlc3QgaXQ/IChIb3cgdG8KPiByZXBy
byB0aGUgaXNzdWUuKQoKSXQgaGFzIG5vdCBiZWVuIHRlc3RlZC4gVG8gdGVzdCBpdCwgeW91IG5l
ZWQgVG9tJ3MgcGF0Y2ggc2V0IHdpdGhvdXQgdGhlCmxhc3QgIkRPIE5PVCBNRVJHRSIgcGF0Y2g6
CgpodHRwczovL2xrbWwua2VybmVsLm9yZy9sa21sLzIwMjAwOTA3MDcwMDM1LkdBMjUxMTRAaW5m
cmFkZWFkLm9yZy9ULwoKVGhhbmtzLAoKTG9nYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
