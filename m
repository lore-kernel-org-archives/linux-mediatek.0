Return-Path: <SRS0=cCBG=6I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09CDC2BA1A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 10:43:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A73CF2087E
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Apr 2020 10:43:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tq3INFNC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="piLvENvW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A73CF2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9IOJ6P4A4JEKKMcf1WQdW2T/0oCsluQNskpkesSUj7M=; b=tq3INFNCvxWLrc
	cYYKblPzFUNQ7v++9yo2kb4zNtDDYJyQt+r/NZkyPK4jOHEINqsY6Yv6O1X7n/PubAEB16iDpvh7c
	8SbGzlUAkoOEwbLlUxmEY9Rlyqhls30t7JixvEAJ+S83Y+DGBTPbQ7TZiek2hHzRtZeV0YrrWYR25
	geKuGO6og/oqvsDTaXCO+Bhy9QdBhfj+K0E79Y2kvN9iE/PI2h6WagnljUj3uANDokf+4Zwztc0mm
	N7S6IWYsQzLkdxdt9YWk8kxYTpsXYpG8mn8yN4JYe96FU9L8xzoLRGwBn04a01JWR9qg+zgS8MixP
	W78P94N9tF59PmqDqhFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRvnv-00014w-0l; Fri, 24 Apr 2020 10:43:31 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRvnr-00013i-GY
 for linux-mediatek@lists.infradead.org; Fri, 24 Apr 2020 10:43:30 +0000
Received: by mail-wm1-x344.google.com with SMTP id v4so9675306wme.1
 for <linux-mediatek@lists.infradead.org>; Fri, 24 Apr 2020 03:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dnKniRRBm6KLmX43VEEOIzRt6LvZaDlvdGMTuziUADI=;
 b=piLvENvWl4DmoeSXfPxu8cdGgMrHv2thfba7D+KeyKcqRq/kNFVVmKom7MLokxYEuw
 879epAZEr1e2PpWgseR+b75NAsekCVl6NCQoM153pJJCSpIeP+6b3oEHRZLWZiNP58hl
 P9DroLVXk/DWSoF5KHOurjOqNB4LOM7EUPV4Gi6X5heKiiaM55ttbsdUycg2GLZQcxul
 gF90xjqqxT8NIuixcLqed8aWxMKSXoOgeufFHqDlxj/esFD8joBr4w3NLmBGoxdujOlc
 OLzS4B4TB0qg1ReZnFkVVNfYELkuLqzE0zceluUvZmW1Yd7rSGF0/vctUFq9hZkFtRje
 8wZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dnKniRRBm6KLmX43VEEOIzRt6LvZaDlvdGMTuziUADI=;
 b=DA5RvceFYBSLbvFvQyaKsgTCH9D7Z6rkE8nHqexiRJD4diCzALpFP2Wi2ZGcRMTukl
 M0ys7Owz8Bib9cECv+2VPJuH4TgT79XGJVuhIjNka5wKQVfjGYQ9VRwvbIzq3+W0LccP
 DW+it1bWoAW+Si+Q5rWp/vRdzAg0rnuKCzyxLqkFQWIifUVQE2TpTSgKC5OuBCvbwLnj
 l4aIyKAhmFJXN9GIAIR1Xe8QRZeh6vG7HnMMz80iIMHjzUwVZjtrBPTDicBqxZmLqX57
 /zY1I5iwAFqnOr+Cckt6JuQvv9CTIAp1X4MQ0Y6DXyYmMd9TpmxdEbAznspqDD/Frchq
 Xwdw==
X-Gm-Message-State: AGi0PubhLBvPEpR2V1kN9IfZzb7LDIlJ8J2rL3v1se1Cbx4KiHxWXBsM
 8Lm+SQYtU4hA0VIUsvQj4aOwWQ==
X-Google-Smtp-Source: APiQypI2Afy4s5XfsjxxMEU/3JcXJfiG2GDyNW0Ogfm/BVtwSxQPPPiy1JiCL97MEDi+IXKQD3oz7Q==
X-Received: by 2002:a1c:5448:: with SMTP id p8mr9189810wmi.173.1587725005656; 
 Fri, 24 Apr 2020 03:43:25 -0700 (PDT)
Received: from [192.168.43.23] ([37.166.159.243])
 by smtp.googlemail.com with ESMTPSA id t2sm2341981wmt.15.2020.04.24.03.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Apr 2020 03:43:24 -0700 (PDT)
Subject: Re: [PATCH v6 09/10] thermal: devfreq_cooling: Refactor code and
 switch to use Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-10-lukasz.luba@arm.com>
 <20200423175708.GG65632@linaro.org>
 <b93226ac-a1f1-c1d0-fc25-0bd0f336252a@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <73fb5d45-d8ac-534f-fd38-619739130160@linaro.org>
Date: Fri, 24 Apr 2020 12:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b93226ac-a1f1-c1d0-fc25-0bd0f336252a@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_034328_078781_2899D761 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjQvMDQvMjAyMCAxMjowMiwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gSGkgRGFuaWVsLAo+IAo+
IE9uIDQvMjMvMjAgNjo1NyBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+IE9uIEZyaSwgQXBy
IDEwLCAyMDIwIGF0IDA5OjQyOjA5QU0gKzAxMDAsIEx1a2FzeiBMdWJhIHdyb3RlOgo+Pj4gVGhl
IG92ZXJoYXVsZWQgRW5lcmd5IE1vZGVsIChFTSkgZnJhbWV3b3JrIHN1cHBvcnQgYWxzbyBkZXZm
cmVxIGRldmljZXMuCj4+PiBUaGUgdW5pZmllZCBBUEkgaW50ZXJmYWNlIG9mIHRoZSBFTSBjYW4g
YmUgdXNlZCBpbiB0aGUgdGhlcm1hbAo+Pj4gc3Vic3lzdGVtIHRvCj4+PiBub3QgZHVwbGljYXRl
IGNvZGUuIFRoZSBwb3dlciB0YWJsZSBub3cgaXMgdGFrZW4gZnJvbSBFTSBzdHJ1Y3R1cmUgYW5k
Cj4+PiB0aGVyZSBpcyBubyBuZWVkIHRvIG1haW50YWluIGNhbGN1bGF0aW9uIGZvciBpdCBsb2Nh
bGx5LiBJbiBjYXNlIHdoZW4KPj4+IHRoZQo+Pj4gRU0gaXMgbm90IHByb3ZpZGVkIGJ5IHRoZSBk
ZXZpY2UgYSBzaW1wbGUgaW50ZXJmYWNlIGZvciBjb29saW5nCj4+PiBkZXZpY2UgaXMKPj4+IHVz
ZWQuCj4+Pgo+Pj4gW2xrcDogUmVwb3J0ZWQgdGhlIGJ1aWxkIHdhcm5pbmddCj4+PiBSZXBvcnRl
ZC1ieToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+PiBSZXZpZXdlZC1ieTog
U3RldmVuIFJvc3RlZHQgKFZNd2FyZSkgPHJvc3RlZHRAZ29vZG1pcy5vcmc+ICMgZm9yCj4+PiB0
cmFjaW5nIGNvZGUKPj4+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBMdWJhIDxsdWthc3oubHViYUBh
cm0uY29tPgo+Pgo+PiBJcyBpdCBwb3NzaWJsZSB0byBzcGxpdCB0aGlzIHBhdGNoIGludG8gc21h
bGxlciBwYXJ0cz8gSXQgaXMgaGFyZCB0bwo+PiB1bmRlcnN0YW5kCj4+IHdoYXQgaXMgcmVsYXRl
ZCB0byB0aGUgZW0gY29udmVyc2lvbiBhbmQgb3RoZXIgY2hhbmdlcyB3aGljaCBsb29rIG5vdAo+
PiByZWxhdGVkCj4+IHNvIGZhci4KPj4KPiAKPiBObyBwcm9ibGVtLCBJIHdpbGwgZG8gdGhlIHNw
bGl0IChpdCB3aWxsIGJlIGluIHRoZSB2NykuCgpUaGFua3MgTHVrYXN6CgoKLS0gCjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMv
TGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0
dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
