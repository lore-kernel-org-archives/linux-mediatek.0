Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5305C55186
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 10:47:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928F02098B
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 10:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uelE30f/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LZH+oOof"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928F02098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQ7X2tGSqKuLKZzhJrJPSO5QLeagmuoY+x69emUQ6Ik=; b=uelE30f/0XkHyh
	J6Q5Tw739hMT5+jfZarxiGHAJ06eRZML2dpc7riTiRZEfVv7E7llWMikUKVaWJPNL5sjIkcHqcRQa
	VFl8dlygEcQUNOWATFNMAEZw+MgnkMg8OBbGe0BGqXHowoC2fjSGFN0rSpkGPYgF19PzsatN7dMHI
	xb3Ni1/axdF/B2sbaSzduiYC5pETi16lrWOwhjx0Z34S/BYgbRAUDpeqkuk82vQepXFHqHm6MkorI
	HfUOd9YDV4AFLHrbZDcyu+2dTluVO//dZ9GFa9suUm2GKvTxkIOWBOkZCu13TdYGU/g2FBRFrLvBh
	ZvF56QZ9qochBIuaLvJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRZNg-0001GJ-NA; Thu, 23 Apr 2020 10:46:56 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRZNe-0001EW-33
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 10:46:56 +0000
Received: by mail-wr1-x442.google.com with SMTP id x18so6282692wrq.2
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2020 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B1TBwFKRribKH6U+f2YHZKct8m6eaNTnkPh6s+3we4I=;
 b=LZH+oOofFZ6HTrIFYsXaoNlGuvZDH5TfmDKrwIVEwXATLJ/gyO7J7sHyrTD+/agh8O
 wWiBCM0FAZhVUMCrQXO7MVYC4rLCk7VA2qyt9dIa3ZKfWghqzp+RuJgis10Fj5K0M5sO
 pglrlJg6UBZe/QVph5+sbzAlxLr83iDJkP8jfFart0ffS4ED2ONJgo/X5zGpe2mTItrI
 D2/MiHPJ0/UjxCcnfxINq0p8TeK/xKrdedYUGtckd19yz7WTCbDj+abPTK1xTbstCekz
 /PV4W/s0wv/F/z6wBMYDWjuOGUjW1Zj5Ma6SnFE3rWo5uuxGnWI5vpdvebrxZVskGRg4
 Iiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B1TBwFKRribKH6U+f2YHZKct8m6eaNTnkPh6s+3we4I=;
 b=ryYutzkJ2TPG7DglqFr2r1WChkBhmVJj0IujAdUyBjE/f6hBH1YgZ7bKiGnAdCt/d2
 7wPAG1oqnWZYNAECLS64nxuPwL4uwdiEZaTw1mU4VF1GZEEioGFiWEGw99dmm27E0Vfr
 PcejXcghb9B+bNqZr7LAxBOYEQUy+Ha0dQNMqX7RuzMyrF+7An+QEBmWFF91FTXxhuNd
 W9boAXig3QMxf515Wb52+JhPPSby3YATR+mKo8UIKgUyztNbCB298KVSHIfjmlgf+EUn
 ZyjHGfPg9IlwvTfD+XSYowyyRM9i/gdxAZoxSls0Ed+XC5KyqAHVFNEN3Wsn8WyNNtsR
 0p8A==
X-Gm-Message-State: AGi0PubgI/Vx5oryk+ZtVIDYtO7Zm9FlGRWtGBWNTnA25paKKYZQVHpc
 NGanmnY+sVdAyrBajxjp+foACA==
X-Google-Smtp-Source: APiQypKk6XUIzuutA3wLhgUEchycCeMPsBVS0IXvX9Ni7yK3fu/lKAGauoLlCdpwWe5IfJMCbOUR+w==
X-Received: by 2002:a5d:5652:: with SMTP id j18mr4521872wrw.40.1587638812041; 
 Thu, 23 Apr 2020 03:46:52 -0700 (PDT)
Received: from [192.168.43.23] ([37.167.216.250])
 by smtp.googlemail.com with ESMTPSA id 17sm3087293wmo.2.2020.04.23.03.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 03:46:51 -0700 (PDT)
Subject: Re: [PATCH v6 02/10] PM / EM: introduce em_dev_register_perf_domain
 function
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-3-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4a1d8d5b-84f2-46b7-00ce-03178d7df72f@linaro.org>
Date: Thu, 23 Apr 2020 12:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200410084210.24932-3-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_034654_173568_380DFD1A 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, festevam@gmail.com, mka@chromium.org, robh@kernel.org,
 amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de, rui.zhang@intel.com,
 alyssa.rosenzweig@collabora.com, orjan.eide@arm.com, daniel@ffwll.ch,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTAvMDQvMjAyMCAxMDo0MiwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gQWRkIG5vdyBmdW5jdGlv
biBpbiB0aGUgRW5lcmd5IE1vZGVsIGZyYW1ld29yayB3aGljaCBpcyBnb2luZyB0byBzdXBwb3J0
Cj4gbmV3IGRldmljZXMuIFRoaXMgZnVuY3Rpb24gd2lsbCBoZWxwIGluIHRyYW5zaXRpb24gYW5k
IG1ha2UgaXQgc21vb3RoZXIuCj4gRm9yIG5vdyBpdCBzdGlsbCBjaGVja3MgaWYgdGhlIGNwdW1h
c2sgaXMgYSB2YWxpZCBwb2ludGVyLCB3aGljaCB3aWxsIGJlCj4gcmVtb3ZlZCBsYXRlciB3aGVu
IHRoZSBuZXcgc3RydWN0dXJlcyBhbmQgaW5mcmFzdHJ1Y3R1cmUgd2lsbCBiZSByZWFkeS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogTHViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPiAtLS0K
CkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KCgoK
LS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9v
ay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGlu
YXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJs
b2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
