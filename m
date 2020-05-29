Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B21CC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 17:43:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E39482065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 17:43:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9vxhvMw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vNp+WRPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E39482065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTWZkwmoLoPu3TleyCKKqLiFLXWKY/I/k1Yfa625L0M=; b=Y9vxhvMwZVrrJ0
	ezRxkEcLpf20cbNbc04JLd6vP6F1NGjAyVmLJwSyA0v68KLVA9g0MeVjPN2MimvxxKFYGSIj2Vcsm
	ALoOVoanmC3RKrn6eBjjLtS/NrQ6uOMul4saQQAVcsw6H8Det0vZ0FD4t42x08BP2+c3PNCauml8K
	j3GO/UJikMZGzPtisqB6q0QEtSjBt5Um8HN8We7FCDb2KGnPFwuQwPRGQA2GNjM3Ai1gBK0Wh/nCQ
	w4hPgIJdfX2vtT10jf1ixt/DbcRbZ4Qz3bGDhgGV0vD+BnR4j2RziRd0xYLmLF6W5yCKmn53PgkxN
	tIoekbytztaZBuj+afsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jej2j-0001K4-65; Fri, 29 May 2020 17:43:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jej2b-0001Co-5S
 for linux-mediatek@lists.infradead.org; Fri, 29 May 2020 17:43:34 +0000
Received: by mail-wm1-x344.google.com with SMTP id j198so7295109wmj.0
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 10:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gVHswwd0kSAFGKu/imUZP8zXFuR2uDAO/9AxJgTWj2k=;
 b=vNp+WRPzmVLo1r8+DFAF8gNmZb/28QvNPt/T2VsGiAimd+bWW8HoyDgA44dOUlNzMk
 fY65A1nqYFgcKpVZcbbW6tYLMtlh1ht+H5UUiLrE4WcIm9kEtdVSx+NatHrZ+lmYrhhC
 TEkORAF/qRMaBY4K+bWEZXNc34wV8hrH9Sl3bfCSd73vqQudGr/rBOnFlwIQXYpV3J4O
 YveoFJuluD6cvfUPa7l+Qm9w38CmY64aFpgFFPWvaEWCWqOWPw39DK4zY7+IW5lqL77K
 De+wvJPgksSh0vXciTQWXdpFVX/+YAGuASngCU8rlZeV4qPQ6T0jq8K2Odu8OOwprjGT
 T3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gVHswwd0kSAFGKu/imUZP8zXFuR2uDAO/9AxJgTWj2k=;
 b=cuAlg3HAkWV0gLLGDn3sjNwx1Xc9DmEkGSSSGtOecvbi6UoR+QBvnqaibLXJQIbyzY
 b/xJkB6LAaAo/qm+QKhhpENSMgl4H4Fo/keN9j4+HI4F8c2h1ndEdGaUJBKtU7GaQYAL
 EPBsUMXZf+5KedaS6dMmlqWHtiUWzi+7qRxOIKl0fhe6zWM79d05nJTw0WymwMUGPnlC
 FBykiNZ5TVzBtN3p7KW0THoW41W8wfzUPohO6u7VEciUyXD4rr05CtwGQ/sWSRjsO1c/
 cpNVSz2+mlbFlSBRa6gGWCivnzhc+r99vT+3XIzyDlASx/nk5oS8OZAglBcydB0eOI39
 VgZg==
X-Gm-Message-State: AOAM530HIaXiQK7czh6+VrZz0qaXtM0cAcoyCb+FyK1W3cBg4V9cOsCI
 sUM5qe2L49TkokzvYp/wjE+TyA==
X-Google-Smtp-Source: ABdhPJw5RPN4E4dGorLBaNA+WhTMk21B9a7oGwIJp3X1RT5IwHv1j8KNJcB+UIWbVhdzlIO7TazAAQ==
X-Received: by 2002:a1c:a403:: with SMTP id n3mr9510567wme.98.1590774210138;
 Fri, 29 May 2020 10:43:30 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:5568:5913:8a3a:5e4e?
 ([2a01:e34:ed2f:f020:5568:5913:8a3a:5e4e])
 by smtp.googlemail.com with ESMTPSA id q13sm10600040wrn.84.2020.05.29.10.43.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 10:43:29 -0700 (PDT)
Subject: Re: [PATCH v8 3/8] PM / EM: update callback structure and add device
 pointer
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-4-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <666b2f9e-d7ed-6ddb-80aa-e63ab9909ee6@linaro.org>
Date: Fri, 29 May 2020 19:43:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527095854.21714-4-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_104333_214284_54B8ED6E 
X-CRM114-Status: GOOD (  10.10  )
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

T24gMjcvMDUvMjAyMCAxMTo1OCwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gVGhlIEVuZXJneSBNb2Rl
bCBmcmFtZXdvcmsgaXMgZ29pbmcgdG8gc3VwcG9ydCBkZXZpY2VzIG90aGVyIHRoYXQgQ1BVcy4g
SW4KPiBvcmRlciB0byBtYWtlIHRoaXMgaGFwcGVuIGNoYW5nZSB0aGUgY2FsbGJhY2sgZnVuY3Rp
b24gYW5kIGFkZCBwb2ludGVyIHRvCj4gYSBkZXZpY2UgYXMgYW4gYXJndW1lbnQuCj4gCj4gVXBk
YXRlIHRoZSByZWxhdGVkIHVzZXJzIHRvIHVzZSBuZXcgZnVuY3Rpb24gYW5kIG5ldyBjYWxsYmFj
ayBmcm9tIHRoZQo+IEVuZXJneSBNb2RlbC4KPiAKPiBBY2tlZC1ieTogUXVlbnRpbiBQZXJyZXQg
PHFwZXJyZXRAZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogTHViYSA8bHVrYXN6
Lmx1YmFAYXJtLmNvbT4KCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9A
bGluYXJvLm9yZz4KClsgLi4uIF0KCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFy
bzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0
dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5h
cm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
