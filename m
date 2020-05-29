Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4274AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 19:05:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1406620723
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 19:05:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eYVP6GHL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deltatee.com header.i=@deltatee.com header.b="Au5x22kd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1406620723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cERtX3bQrR7N4JaNMOXrDb7HVIIkDy2p3TGJ4Z/S/CA=; b=eYVP6GHL9EQiEP
	a7HRWcapzasYVI5KrfJIC5wT/5xNljQQNTlXQ77qWSjI4/GK5toJkA3RU2loNpDmU2Jx6ybhBwqVh
	F/xgvbb2FhhBjUZSW4IRgYH6qlCwIvGsZ/kXE+RWZXM5BFryGcfZ13A1bYRa8q8B7YgH7QxJqjSvL
	YGuPxiQkAga5uCjKDkYAM+WMYvfJav6xGXEO8lZAq2BCcVVNlBoqzTFVpF+iLra4NkS2m4rai/RYl
	bqKzF9d8JOIVQg+v36eo/yF313lMdygPiVMivab3I1an20cD0gkthxX/VvwEMIbKBnYD0nPOYAzv9
	WjF1joXgaxF/ACdZ5LPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jekK1-0004Wk-Kt; Fri, 29 May 2020 19:05:37 +0000
Received: from [204.191.154.188] (helo=ale.deltatee.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jekJt-0004QR-0s; Fri, 29 May 2020 19:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nhAOftfyfj+FPkKvFiLyWhZt65EpTKYajbE3eXvsvFs=; b=Au5x22kdoavuCP15EixJShyeVc
 xSf1ZvVd/sQsd21cm+wlMkMVPvmWUNCuTwOXOspqpww0a042+UM9sc8AJpFSpVUsYFEh4rsbl+FZO
 mMdOQJ13c/r35Pu4XwHP/vpqKEt1ZJMUTg9psw1MVR5EgpPeLY9sRw+TQrOl/N7TMJ4xk94Jk+rsJ
 Mvp7tDsg05uFy8LEnvhacd6Quyv6NmV6RcOMnRcr4Hqh//UfP6DTM/gi45aQ297i+RyOU4NJbKQDQ
 6TF9Pp10KoRcCt2b1u3v2J2JlzgFkHY8usyjXKelkV30hDNKVxV6NcEJ6BWnhbYJBUP/1z43voVXr
 CQIfKJBg==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1jekJh-0002Ks-TI; Fri, 29 May 2020 13:05:18 -0600
To: Christoph Hellwig <hch@infradead.org>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
Date: Fri, 29 May 2020 13:05:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200529124523.GA11817@infradead.org>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: joonas.lahtinen@linux.intel.com, jani.nikula@linux.intel.com,
 m.szyprowski@samsung.com, dwmw2@infradead.org, kgene@kernel.org,
 linux-kernel@vger.kernel.org, cohuck@redhat.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org,
 virtualization@lists.linux-foundation.org, tglx@linutronix.de,
 linux-tegra@vger.kernel.org, rodrigo.vivi@intel.com,
 linux-mediatek@lists.infradead.org, alex.williamson@redhat.com,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-s390@vger.kernel.org, gerald.schaefer@de.ibm.com, agross@kernel.org,
 linux-rockchip@lists.infradead.org, jonathanh@nvidia.com, krzk@kernel.org,
 maz@kernel.org, linux-samsung-soc@vger.kernel.org, jean-philippe@linaro.org,
 will@kernel.org, thierry.reding@gmail.com, julien.grall@arm.com,
 matthias.bgg@gmail.com, bjorn.andersson@linaro.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, kvm@vger.kernel.org,
 iommu@lists.linux-foundation.org, murphyt7@tcd.ie, hch@infradead.org
X-SA-Exim-Mail-From: logang@deltatee.com
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_120529_064288_2C29C140 
X-CRM114-Status: GOOD (  23.59  )
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIwLTA1LTI5IDY6NDUgYS5tLiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24g
VGh1LCBNYXkgMjgsIDIwMjAgYXQgMDY6MDA6NDRQTSAtMDYwMCwgTG9nYW4gR3VudGhvcnBlIHdy
b3RlOgo+Pj4gVGhpcyBpc3N1ZSBpcyBtb3N0IGxpa2VseSBpbiB0aGUgaTkxNSBkcml2ZXIgYW5k
IGlzIG1vc3QgbGlrZWx5IGNhdXNlZCBieSB0aGUgZHJpdmVyIG5vdCByZXNwZWN0aW5nIHRoZSBy
ZXR1cm4gdmFsdWUgb2YgdGhlIGRtYV9tYXBfb3BzOjptYXBfc2cgZnVuY3Rpb24uIFlvdSBjYW4g
c2VlIHRoZSBkcml2ZXIgaWdub3JpbmcgdGhlIHJldHVybiB2YWx1ZSBoZXJlOgo+Pj4gaHR0cHM6
Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvN2UwMTY1YjJmMWE5MTJhMDZlMzgxZTkx
ZjBmNGU0OTVmNGFjMzczNi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG1hYnVm
LmMjTDUxCj4+Pgo+Pj4gUHJldmlvdXNseSB0aGlzIGRpZG7igJl0IGNhdXNlIGlzc3VlcyBiZWNh
dXNlIHRoZSBpbnRlbCBtYXBfc2cgYWx3YXlzIHJldHVybmVkIHRoZSBzYW1lIG51bWJlciBvZiBl
bGVtZW50cyBhcyB0aGUgaW5wdXQgc2NhdHRlciBnYXRoZXIgbGlzdCBidXQgd2l0aCB0aGUgY2hh
bmdlIHRvIHRoaXMgZG1hLWlvbW11IGFwaSB0aGlzIGlzIG5vIGxvbmdlciB0aGUgY2FzZS4gSSB3
YXNu4oCZdCBhYmxlIHRvIHRyYWNrIHRoZSBidWcgZG93biB0byBhIHNwZWNpZmljIGxpbmUgb2Yg
Y29kZSB1bmZvcnR1bmF0ZWx5LiAgCj4gCj4gTWFyayBkaWQgYSBiaWcgYXVkaXQgaW50byB0aGUg
bWFwX3NnIEFQSSBhYnVzZSBhbmQgaW5pdGlhbGx5IGhhZAo+IHNvbWUgaTkxNSBwYXRjaGVzLCBi
dXQgdGhlbiBnYXZlIHVwIG9uIHRoZW0gd2l0aCB0aGlzIGNvbW1lbnQ6Cj4gCj4gIlRoZSBiaWdn
ZXN0IFRPRE8gaXMgRFJNL2k5MTUgZHJpdmVyIGFuZCBJIGRvbid0IGZlZWwgYnJhdmUgZW5vdWdo
IHRvIGZpeAo+ICBpdCBmdWxseS4gVGhlIGRyaXZlciBjcmVhdGl2ZWx5IHVzZXMgc2dfdGFibGUt
Pm9yaWdfbmVudHMgdG8gc3RvcmUgdGhlCj4gIHNpemUgb2YgdGhlIGFsbG9jYXRlIHNjYXR0ZXJs
aXN0IGFuZCBpZ25vcmVzIHRoZSBudW1iZXIgb2YgdGhlIGVudHJpZXMKPiAgcmV0dXJuZWQgYnkg
ZG1hX21hcF9zZyBmdW5jdGlvbi4gSW4gdGhpcyBwYXRjaHNldCBJIG9ubHkgZml4ZWQgdGhlCj4g
IHNnX3RhYmxlIG9iamVjdHMgZXhwb3J0ZWQgYnkgZG1hYnVmIHJlbGF0ZWQgZnVuY3Rpb25zLiBJ
IGhvcGUgdGhhdCBJCj4gIGRpZG4ndCBicmVhayBhbnl0aGluZyB0aGVyZS4iCj4gCj4gaXQgd291
bGQgYmUgcmVhbGx5IG5pY2UgaWYgdGhlIGk5MTUgbWFpbnRhaW5lcnMgY291bGQgaGVscCB3aXRo
IHNvcnRpbmcKPiB0aGF0IEFQSSBhYnVzZSBvdXQuCj4gCgpJIGFncmVlIGNvbXBsZXRlbHkgdGhh
dCB0aGUgQVBJIGFidXNlIHNob3VsZCBiZSBzb3J0ZWQgb3V0LCBidXQgSSB0aGluawp0aGF0J3Mg
bXVjaCBsYXJnZXIgdGhhbiBqdXN0IHRoZSBpOTE1IGRyaXZlci4gUHJldHR5IG11Y2ggZXZlcnkg
ZG1hLWJ1ZgptYXBfZG1hX2J1ZiBpbXBsZW1lbnRhdGlvbiBJIGxvb2tlZCBhdCBpZ25vcmVzIHRo
ZSByZXR1cm5lZCBuZW50cyBvZgpzZ19hdHRycy4gVGhpcyBzdWNrcywgYnV0IEkgZG9uJ3QgdGhp
bmsgaXQncyB0aGUgYnVnIFRvbSByYW4gaW50by4gU2VlOgoKYW1kZ3B1X2RtYV9idWZfbWFwCmFy
bWFkYV9nZW1fcHJpbWVfbWFwX2RtYV9idWYKZHJtX2dlbV9tYXBfZG1hX2J1ZgppOTE1X2dlbV9t
YXBfZG1hX2J1Zgp0ZWdyYV9nZW1fcHJpbWVfbWFwX2RtYV9idWYKClNvIHRoaXMgc2hvdWxkIHBy
b2JhYmx5IGJlIGFkZHJlc3NlZCBieSB0aGUgd2hvbGUgR1BVIGNvbW11bml0eS4KCkhvd2V2ZXIs
IGFzIFJvYmluIHBvaW50ZWQgb3V0LCB0aGVyZSBhcmUgb3RoZXIgdWdseSB0cmlja3MgbGlrZSBz
dG9wcGluZwppdGVyYXRpbmcgdGhyb3VnaCB0aGUgU0dMIHdoZW4gc2dfZG1hX2xlbigpIGlzIHpl
cm8uIEZvciBleGFtcGxlLCB0aGUKQU1EIGRyaXZlciBhcHBlYXJzIHRvIHVzZSBkcm1fcHJpbWVf
c2dfdG9fcGFnZV9hZGRyX2FycmF5cygpIHdoaWNoIGRvZXMKdGhpcyB0cmljayBhbmQgdGh1cyBs
aWtlbHkgaXNuJ3QgYnVnZ3kgKG90aGVyd2lzZSwgSSdkIGV4cGVjdCBzb21lb25lIHRvCmhhdmUg
Y29tcGxhaW5lZCBieSBub3cgc2VlaW5nIEFNRCBoYXMgYWxyZWFkeSBzd2l0Y2hlZCB0byBJT01N
VS1ETUEuCgpBcyBJIHRyaWVkIHRvIHBvaW50IG91dCBpbiBteSBwcmV2aW91cyBlbWFpbCwgaTkx
NSBkb2VzIG5vdCBkbyB0aGlzCnRyaWNrLiBJbiBmYWN0LCBpdCBjb21wbGV0ZWx5IGlnbm9yZXMg
c2dfZG1hX2xlbigpIGFuZCBpcyB0aHVzCmNvbXBsZXRlbHkgYnJva2VuLiBTZWUgaTkxNV9zY2F0
dGVybGlzdC5oIGFuZCB0aGUgX19zZ3RfaXRlcigpIGZ1bmN0aW9uLgpTbyBpdCBkb2Vzbid0IHNv
dW5kIHRvIG1lIGxpa2UgTWFyaydzIGZpeCB3b3VsZCBhZGRyZXNzIHRoZSBpc3N1ZSBhdAphbGwu
IFBlciBteSBwcmV2aW91cyBlbWFpbCwgSSdkIGd1ZXNzIHRoYXQgaXQgY2FuIGJlIGZpeGVkIHNp
bXBseSBieQphZGp1c3RpbmcgdGhlIF9fc2d0X2l0ZXIoKSBmdW5jdGlvbiB0byBkbyBzb21ldGhp
bmcgbW9yZSBzZW5zaWJsZS4KKEJldHRlciB5ZXQsIGlmIHBvc3NpYmxlLCBkaXRjaCBfX3NndF9p
dGVyKCkgYW5kIHVzZSB0aGUgY29tbW9uIERSTQpmdW5jdGlvbiB0aGF0IEFNRCB1c2VzKS4KClRo
aXMgd291bGQgYXQgbGVhc3QgYWxsb3cgdXMgdG8gbWFrZSBwcm9ncmVzcyB3aXRoIFRvbSdzIElP
TU1VLURNQSBwYXRjaApzZXQgYW5kIG9uY2UgdGhhdCBnZXRzIGluLCBpdCB3aWxsIGJlIGhhcmRl
ciBmb3Igb3RoZXIgZHJpdmVycyB0byBtYWtlCnRoZSBzYW1lIG1pc3Rha2UuCgpMb2dhbgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
