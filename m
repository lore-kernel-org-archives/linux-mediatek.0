Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C66C2BA15
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 17:19:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E0DD20B1F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 17:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AInD/m2g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDXYMNKf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E0DD20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZu3X2ImhkgFanBYfY5Sz1TFaTNXUPvPBakR8fAOJVc=; b=AInD/m2g9XdVKE
	og9BBjLG27twVnBsg30WPko9sK40aRHXxgWOlYzYmZnE+9Gc0mzwKUoKWiKhKG7ehZbYzKaTXTQ3m
	b8VJ9HtFV0y+CHuLigr/3zqxGRj5lDPwqnrZxIFX3gplPCt4SIWyayCnjUmJqNFlzhUQWG9hVJaqi
	V+y3aDgCQ6r+BCF6B6q+YWOuZaUOClIPc9qwhdKz6kllp8hN4jkgK32ody7kK/bcpm2lbIEMoEkqW
	s+z+sAe//8nIhQZFa+VKdRASIuR5JGuBp4HTGUqEJ2iEBSayjE844YM/9iRhHqktP+kMnxFEBa0Y/
	eryXAndMVNO5pF9+2tdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKPyn-0003Jn-HN; Fri, 03 Apr 2020 17:19:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKPyk-0003J2-KH
 for linux-mediatek@lists.infradead.org; Fri, 03 Apr 2020 17:19:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id f6so8551172wmj.3
 for <linux-mediatek@lists.infradead.org>; Fri, 03 Apr 2020 10:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lcpNoI7xIY4kNiB3ex5eUnMyPccu+6NxZPGvlIGD290=;
 b=TDXYMNKfZiYa/EW+laebpfeH6DTOSiUF2yoOKXyQnE6H9rvq3j/1B+tkjM0ZLtMIWc
 2W4s8N2jtLdiS4unn+cBkh8zRMy0GV3JcebEIwrQ7ZVHEQKpaAa/xS6Qk4w8KPjTu896
 lj7wzwJZd6WUrmUpLfH3T2wmVjVV48CjIoA1G99pup3G8ZW+UITRdgECh5ypz+xxxvCB
 0VOhec4TfoHjmc/E0GiQBE04KCO3LHKp0mlKMy46gOZsM0WtQPH5r++V9DlPYa5+btPt
 MagtVEVvvAKuOHGtOFIgRaajkJAHc0ubBMf7xceuHqxxla7C3l1Yx5yopQkWBx6Q1DnY
 on3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=lcpNoI7xIY4kNiB3ex5eUnMyPccu+6NxZPGvlIGD290=;
 b=caGizh2doBhi5SD8fnoM7Qfg3zDS304hMBTXkr8Q2Cpj8Ea6WUKceDsuI+YWEYgfpJ
 lIoJXFeMKb01Mf1duOJuxwnHPS1o5L3Zo9SnN7Io9222cS+HnqwkMOUSZ7KtmwbhrOKM
 6Q12gYJEL92XT4wZyD6oDzWbhS9RPQaeg6uwoJajiV4+W5t0gj0W+tFJra88o0ZMQITk
 69X4Pb9qNW+oKIj3vBfbip1ocIzJJ0QFEv00VbnAZWEiIO5oYvfncFTTuksfCuTvZsms
 NEORVkUCozJcySkNdTLcSmYlZcoT2s0or6YfIUyG6TEzPecWctZWCJPjeG5i04RJXPxq
 TcNw==
X-Gm-Message-State: AGi0PuYr4pi18ZgDS31AShZSqchhvGteI9J7XqG6nZKDamcxPANdsb9H
 kF6pH7ei8KDY2crQjaAiUbyx5A==
X-Google-Smtp-Source: APiQypLOgQbj5Ks9utH7lmYdWi+N0qGdsebz0Zh8KZCLyjWZMJOBFHMnhBmL72ERIGTmEUoPMkkWJg==
X-Received: by 2002:a1c:382:: with SMTP id 124mr8216482wmd.151.1585934376969; 
 Fri, 03 Apr 2020 10:19:36 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:cc78:8018:8980:25d8?
 ([2a01:e34:ed2f:f020:cc78:8018:8980:25d8])
 by smtp.googlemail.com with ESMTPSA id s2sm12925936wru.68.2020.04.03.10.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 10:19:36 -0700 (PDT)
Subject: Re: [PATCH v5 3/5] thermal: devfreq_cooling: Use PM QoS to set
 frequency limits
To: Matthias Kaehlcke <mka@chromium.org>
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-4-lukasz.luba@arm.com>
 <d73ce772-8d0a-e5f4-097a-d89e01ff7578@linaro.org>
 <20200403171818.GO199755@google.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <82997cd2-1e4d-fb9d-8c64-6771b72456e9@linaro.org>
Date: Fri, 3 Apr 2020 19:19:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403171818.GO199755@google.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_101939_187010_25A47EB1 
X-CRM114-Status: GOOD (  11.09  )
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
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDMvMDQvMjAyMCAxOToxOCwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gSGkgRGFuaWVs
LAo+IAo+IE9uIEZyaSwgQXByIDAzLCAyMDIwIGF0IDA2OjQzOjIwUE0gKzAyMDAsIERhbmllbCBM
ZXpjYW5vIHdyb3RlOgo+PiBPbiAxOC8wMy8yMDIwIDEyOjQ1LCBMdWthc3ogTHViYSB3cm90ZToK
Pj4+IEZyb206IE1hdHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgo+Pj4KPj4+IE5v
dyB0aGF0IGRldmZyZXEgc3VwcG9ydHMgbGltaXRpbmcgdGhlIGZyZXF1ZW5jeSByYW5nZSBvZiBh
IGRldmljZQo+Pj4gdGhyb3VnaCBQTSBRb1MgbWFrZSB1c2Ugb2YgaXQgaW5zdGVhZCBvZiBkaXNh
YmxpbmcgT1BQcyB0aGF0IHNob3VsZAo+Pj4gbm90IGJlIHVzZWQuCj4+Pgo+Pj4gVGhlIHN3aXRj
aCBmcm9tIGRpc2FibGluZyBPUFBzIHRvIFBNIFFvUyBpbnRyb2R1Y2VzIGEgc3VidGxlIGJlaGF2
aW9yYWwKPj4+IGNoYW5nZSBpbiBjYXNlIG9mIGNvbmZsaWN0aW5nIHJlcXVlc3RzIChtaW4gPiBt
YXgpOiBQTSBRb1MgZ2l2ZXMKPj4+IHByZWNlZGVuY2UgdG8gdGhlIE1JTl9GUkVRVUVOQ1kgcmVx
dWVzdCwgd2hpbGUgaGlnaGVyIE9QUHMgZGlzYWJsZWQKPj4+IHdpdGggZGV2X3BtX29wcF9kaXNh
YmxlKCkgd291bGQgb3ZlcnJpZGUgTUlOX0ZSRVFVRU5DWS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPj4+IFJldmlld2VkLWJ5OiBM
dWthc3ogTHViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBDaGFud29v
IENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KPj4KPj4gVGhpcyBwYXRjaCBpcyBzdGFuZGFs
b25lLCByaWdodD8gSWYgeWVzLCBJIHdpbGwgYXBwbHkgaXQuCj4gCj4gWWVzLCBpdCBpcyBzdGFu
ZGFsb25lLCBwbGVhc2UgYXBwbHkKCkFwcGxpZWQgb24gJ3Rlc3RpbmcnLCB0aGFua3MKCgotLSAK
PGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3
YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNv
bS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9v
cmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
