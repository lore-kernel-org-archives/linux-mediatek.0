Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6256C4BA12
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 13:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26652467B
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 13:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvgpP0b6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26652467B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MP9XotVIXxDfk4ek59Xb9YKtT1zg0amdtFmWSuvSsmo=; b=pvgpP0b6HLLnqbtshTyncMXBa
	10XTPoiLpzwztBVZ7UeDV3Bx3O4jyiuSpMEOTEtqlfujhvRA8pVeJ08kvfIQY+jXe0faKGSzMh9fN
	kqkR6xdeCqPwWqtEFsrKJ+YnU2A268DUV1WBit5C2eR1uKpJU1SQomG3pNikhCdie/4Aa4fBDzHuW
	ZpmR5ZNbwc5MonqT9rcCzTu78TKOK8scv6VL17egpyXMKO+hZYPJPc7hPl9XZUcvW318aED4YkYp8
	afLA5NDLYsOMPMub2jrLylMzss+cYL0u4rfffl8cjGVOMoJhJHys7gZbzmDDjiQk4f3OvrpuZL/n5
	pllR976jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6xAb-00070C-DW; Wed, 26 Feb 2020 13:56:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6xAR-0006sA-Am; Wed, 26 Feb 2020 13:56:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E36C30E;
 Wed, 26 Feb 2020 05:56:02 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B1C723F9E6;
 Wed, 26 Feb 2020 05:55:55 -0800 (PST)
Subject: Re: [PATCH v3 4/4] drm/panfrost: Register to the Energy Model with
 devfreq device
To: Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>
References: <20200221194731.13814-1-lukasz.luba@arm.com>
 <20200221194731.13814-5-lukasz.luba@arm.com>
 <CAL_JsqJ1D6Cf2cxdskDS2JCEe8ja6uUeoSpA3i-wxNgi=S1SYA@mail.gmail.com>
 <96d3287c-4559-7c4a-2f99-0a3aad9e42f6@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <67aef493-82ab-e3e0-7564-610ef8756b48@arm.com>
Date: Wed, 26 Feb 2020 13:55:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <96d3287c-4559-7c4a-2f99-0a3aad9e42f6@arm.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_055603_459584_077A7FD5 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Nishanth Menon <nm@ti.com>, juri.lelli@redhat.com,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, bsegall@google.com,
 Fabio Estevam <festevam@gmail.com>,
 Morten Rasmussen <Morten.Rasmussen@arm.com>, patrick.bellasi@matbug.net,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Ingo Molnar <mingo@redhat.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Zhang Rui <rui.zhang@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 orjan.eide@arm.com, Sascha Hauer <kernel@pengutronix.de>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>, mgorman@suse.de,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, David Airlie <airlied@linux.ie>,
 javi.merino@arm.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 qperret@google.com, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andy Gross <agross@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Dietmar.Eggemann@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjYvMDIvMjAyMCAxMDowNiBhbSwgTHVrYXN6IEx1YmEgd3JvdGU6ClsuLi5dCj4+PiBAQCAt
MTE4LDYgKzEyMCw3IEBAIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9maW5pKHN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgCj4+PiAqcGZkZXYpCj4+PiDCoCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmIChw
ZmRldi0+ZGV2ZnJlcS5jb29saW5nKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2ZnJlcV9jb29saW5nX3VucmVnaXN0ZXIocGZkZXYtPmRldmZyZXEuY29vbGluZyk7Cj4+
PiArwqDCoMKgwqDCoMKgIGRldl9wbV9vcHBfb2ZfdW5yZWdpc3Rlcl9lbSgmcGZkZXYtPnBkZXYt
PmRldik7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIGRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxlKCZw
ZmRldi0+cGRldi0+ZGV2KTsKPj4KPj4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIGtlZXAgdGhpcyAo
YW5kIHRoZSByZWdpc3RyYXRpb24gc2lkZSkgYXMKPj4gc2VwYXJhdGUgY2FsbHM/IFBlcmhhcHMg
dGhlcmUncyBzb21lIG9yZGVyaW5nIHJlcXVpcmVtZW50IHdpdGgKPj4gZXZlcnl0aGluZyBiZXR3
ZWVuIGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKCkgYW5kCj4+IGRldl9wbV9vcHBfb2ZfcmVnaXN0
ZXJfZW0oKT8KPiAKPiBZZXMsIGRldl9wbV9vcHBfb2ZfcmVnaXN0ZXJfZW0oKSB1c2VzIGVtX2Rh
dGFfY2FsbGJhY2sgd2hpY2ggb3BlcmF0ZXMKPiBvbiBPUFBzIHRvIGNhbGN1bGF0ZSBwb3dlciB2
YWx1ZXMgYW5kIGNvc3RzLCBzbyB0aGUgdGhlIE9QUCB0YWJsZSBzaG91bGQKPiBiZSBhbHJlYWR5
IHRoZXJlLgo+IAo+Pgo+PiBXaGlsZSB5b3UncmUganVzdCBhZGRpbmcgMiBsaW5lcywgaXQgc2Vl
bXMgdGhlcmUncyBhIGxvdCBvZiBjb21wbGV4aXR5Cj4+IGV4cG9zZWQgdG8gdGhlIGRyaXZlciBq
dXN0IHRvIGluaXRpYWxpemUgZGV2ZnJlcS9vcHAuCj4gCj4gSXQgZGVwZW5kcywgZm9yIGV4YW1w
bGUgZGV2ZnJlcSBkZXZpY2VzIGxpa2UgYnVzZXMgd291bGQgbGlrZWx5IG5ldmVyCj4gdXNlIHRo
ZSBlbmVyZ3kgbW9kZWwuIFBvdGVudGlhbCBjbGllbnRzIHdvdWxkIGJlIEdQVXMsIERTUHMsIElT
UHMuCgpTdGlsbCwgaXQgc2VlbXMgbGVzcyB0aGFuIGlkZWFsIGZvciBldmVyeSBjbGllbnQgdG8g
aGF2ZSB0byByZW1lbWJlciB0byAKbWFrZSBhbGwgdGhlc2UgaW5kaXZpZHVhbCBjYWxscywgYWxs
IGluIHRoZSByaWdodCBvcmRlciAoZXNwZWNpYWxseSB3aGVuIAppdCBjb21lcyB0byB1bmRvaW5n
IHRoZW0gaW4gZmFpbHVyZSBwYXRocykuCgpJIGhhdmVuJ3QgcXVpdGUgZ3Jhc3BlZCB3aGV0aGVy
IHRoZSBlbmVyZ3kgbW9kZWwgaXMgY29uY2VwdHVhbGx5ICJvd25lZCIgCmJ5IHRoZSBPUFAgdGFi
bGUgb3IgYnkgdGhlIGNvb2xpbmcgZGV2aWNlLCBidXQgZWl0aGVyIHdheSBpdCB3b3VsZCBzZWVt
IAp0byBiZSBhIG11Y2ggbmljZXIgQVBJIGlmIHRoZXJlIHdlcmUgc2ltcGx5IGFuIGFkZGl0aW9u
YWwgIndpdGggZW5lcmd5IAptb2RlbCIgdmFyaWFudCBvZiB0aGUgcmVnaXN0cmF0aW9uIGNhbGws
IGFuZCB0aGUgc3RhbmRhcmQgcmVtb3ZhbCBjYWxsIApqdXN0IGF1dG9tYXRpY2FsbHkgY2xlYW5l
ZCB1cCBhbiBlbmVyZ3kgbW9kZWwgYXMgd2VsbCBpZiBvbmUgd2FzIHByZXNlbnQuCgpSb2Jpbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
