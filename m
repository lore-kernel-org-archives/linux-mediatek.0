Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C95C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 10:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FFD6206B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 10:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KqQ+nejf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdeY/dYK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FFD6206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5u+rb2iCxNrKHYV9pO2MDPoNfriv3qaZXTpTIT7J8Ck=; b=KqQ+nejfcLlVFx
	BfRfBHNp3nWAlgOxhw/7UovR5IC13FaU35UoNhRbG1hGLL7BNkMIKAyComyalbOyfrlXBCklNERPO
	ujcu422UMafRn12peZ6iiWdH/lxE/J6C7kkia3zQwK0lFCjwky+RekKUmUBOWVAPhTvsx2jWQG3sy
	GrvD2/cuHhw7RTrIasTDgMK6/qIABqd5hflrB7PHs7NBcEf14VcBy/nRv6Bvsi9O1BnFSGI4oIyIF
	hyM3qcYjUoIIoABjB91oaFK8E/HgX9QgdlrtFSFDPgGmOMxRwdF5aO7PanEsYnCYdrW70gSmrmYsA
	rwfF8i4E0rbYQU0rFvKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc597-000088-9Q; Fri, 22 May 2020 10:43:21 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc595-00007R-4Z
 for linux-mediatek@lists.infradead.org; Fri, 22 May 2020 10:43:20 +0000
Received: by mail-wr1-x443.google.com with SMTP id c11so198386wrn.6
 for <linux-mediatek@lists.infradead.org>; Fri, 22 May 2020 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VGoYWtdu5N5u5jqWgNJFmyeBLxTDklq5XGRfQf6qY4Q=;
 b=YdeY/dYKbHgnjF5Rfbcb+eEpYTqwDn5A1vVV0JJ5zhynRDstj4c9FpHWPMl+epaBKj
 4+oNruH5nf6kCafoeC8oqKNyZ/Po23OIUoBNbYN9r4/k0SejSAvyGC92UsY58XQLUfsa
 3JjDrFGsY19YdyfPsHQclmg1uXVg+LMh91ZPjSFXVChXGrVWjG0Ui7eJQGqklE6+5kay
 g5Uz20ffaV5DdoIjAToXKulBulbkNzxmwxh2KnSMRG7DYDLx1ioPSUF/Sq5icU69Spbb
 sYt6m5Pg2RyBF7ZlFDkiMCnoSB3EaxfTGXp6TNa8MZWvQOKRiLEeX0kDcZ6ep0ep66E5
 CPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VGoYWtdu5N5u5jqWgNJFmyeBLxTDklq5XGRfQf6qY4Q=;
 b=rNk0JD/1bLi1jc9ltDDiIL74NNvX7R/XfqOMQuIkYEIXeppis51DViPHdaqtthYLRk
 T/aqvfhWKiY7bGoMOvUAnwqJsrmjetR6AOuSKwxOCcrWAGSuojgtg0LOkw2Y3lgLugVl
 vkLcCaDXBsi15zPYSy3dqJ9laLjQJoeT6s0KHqe9JGFxN8kx6fNg03xfbnkCVunav5sf
 b+xPfi4+8PL3feqDF/lQ0FJ9LftOlod52zhLs5a83uzagATX4hw8oHS3E8KBScjujlfw
 CfA72/zJ1fCINThDHBy/PtYxp31BvQ+iVfduhGZEuszPjYgZmHk1cfxplnxlDhLn/q7U
 b1LQ==
X-Gm-Message-State: AOAM533jnWn7cQ78eiPHNqxkEP3UMfZFj4FhcvkoBmjDMUgRs/Dh+4hH
 6Af9Yob4C9yFRUHsdsvr5uWfRQ==
X-Google-Smtp-Source: ABdhPJybiYUfjcoyk6EZQDK4C+UEDo86CQQDAJc9f/khvU4Ce7Ww2hRO343VGYU3st9oV83jeHWEKA==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr2933510wrv.269.1590144196705; 
 Fri, 22 May 2020 03:43:16 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a?
 ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
 by smtp.googlemail.com with ESMTPSA id h1sm9702407wme.42.2020.05.22.03.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 03:43:16 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] Add support for devices in the Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200511111912.3001-1-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
Date: Fri, 22 May 2020 12:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511111912.3001-1-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_034319_243846_EF33BA52 
X-CRM114-Status: GOOD (  16.39  )
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

CkhpIEx1a2FzeiwKCk9uIDExLzA1LzIwMjAgMTM6MTgsIEx1a2FzeiBMdWJhIHdyb3RlOgo+IEhp
IGFsbCwKPiAKPiBUaGlzIHBhdGNoIHNldCBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIGRldmljZXMg
aW4gdGhlIEVuZXJneSBNb2RlbCAoRU0pCj4gZnJhbWV3b3JrLiBJdCB3aWxsIHVuaWZ5IHRoZSBw
b3dlciBtb2RlbCBmb3IgdGhlcm1hbCBzdWJzeXN0ZW0uIEl0IHdpbGwKPiBtYWtlIHNpbXBsZXIg
dG8gYWRkIHN1cHBvcnQgZm9yIG5ldyBkZXZpY2VzIHdpbGxpbmcgdG8gdXNlIG1vcmUKPiBhZHZh
bmNlZCBmZWF0dXJlcyAobGlrZSBJbnRlbGxpZ2VudCBQb3dlciBBbGxvY2F0aW9uKS4gTm93IGl0
IHNob3VsZAo+IHJlcXVpcmUgbGVzcyBrbm93bGVkZ2UgYW5kIGVmZm9ydCBmb3IgZHJpdmVyIGRl
dmVsb3BlciB0byBhZGQgZS5nLgo+IEdQVSBkcml2ZXIgd2l0aCBzaW1wbGUgZW5lcmd5IG1vZGVs
LiBBIG1vcmUgc29waGlzdGljYXRlZCBlbmVyZ3kgbW9kZWwKPiBpbiB0aGUgdGhlcm1hbCBmcmFt
ZXdvcmsgaXMgYWxzbyBwb3NzaWJsZSwgZHJpdmVyIG5lZWRzIHRvIHByb3ZpZGUKPiBhIGRlZGlj
YXRlZCBjYWxsYmFjayBmdW5jdGlvbi4gTW9yZSBpbmZvcm1hdGlvbiBjYW4gYmUgZm91bmQgaW4g
dGhlCj4gdXBkYXRlZCBkb2N1bWVudGF0aW9uIGZpbGUuCj4gCj4gRmlyc3QgNyBwYXRjaGVzIGFy
ZSByZWZhY3RvcmluZyBFbmVyZ3kgTW9kZWwgZnJhbWV3b3JrIHRvIGFkZCBzdXBwb3J0Cj4gb2Yg
b3RoZXIgZGV2aWNlcyB0aGF0IENQVXMuIFRoZXkgY2hhbmdlOgo+IC0gbmFtaW5nIGNvbnZlbnRp
b24gZnJvbSAnY2FwYWNpdHknIHRvICdwZXJmb3JtYW5jZScgc3RhdGUsCj4gLSBBUEkgYXJndW1l
bnRzIGFkZGluZyBkZXZpY2UgcG9pbnRlciBhbmQgbm90IHJlbHkgb25seSBvbiBjcHVtYXNrLAo+
IC0gY2hhbmdlIG5hbWluZyB3aGVuICdjcHUnIHdhcyB1c2VkLCBub3cgaXQncyBhICdkZXZpY2Un
Cj4gLSBpbnRlcm5hbCBzdHJ1Y3R1cmUgdG8gbWFpbnRhaW4gcmVnaXN0ZXJlZCBkZXZpY2VzCj4g
LSB1cGRhdGUgdXNlcnMgdG8gdGhlIG5ldyBBUEkKPiBQYXRjaCA4IHVwZGF0ZXMgT1BQIGZyYW1l
d29yayBoZWxwZXIgZnVuY3Rpb24gdG8gYmUgbW9yZSBnZW5lcmljLCBub3QKPiBDUFUgc3BlY2lm
aWMuCj4gUGF0Y2hlcyA5LTE0IGNoYW5nZSBkZXZmcmVxIGNvb2xpbmcsIGRyb3BwaW5nIHBhcnQg
b2Ygb2xkIHBvd2VyIG1vZGVsIGFuZAo+IGFkZGluZyByZWdpc3RyYXRpb24gd2l0aCBFbmVyZ3kg
TW9kZWwgdmlhIGV4cG9ydGVkIEdQTCBmdW5jdGlvbi4KPiBUaGUgbGFzdCBwYXRoIGlzIGEgc2lt
cGxlIGNoYW5nZSBmb3IgUGFuZnJvc3QgR1BVIGRyaXZlci4KPiAKPiBUaGUgcGF0Y2ggc2V0IGlz
IGJhc2VkIG9uIGxpbnV4LW5leHQgdGFnIG5leHQtMjAyMDA1MDguCgpEbyB5b3UgdGhpbmsgaXQg
aXMgcG9zc2libGUgdG8gcmVzcGluIGFnYWluc3QgbGludXgtcG0gbmV4dCA/CgpJIHdhbnRlZCB0
byB0cnkgdGhlIHNlcmllcyBidXQgSSdtIGdldHRpbmcgbm9uIHRyaXZpYWwgY29uZmxpY3RzIHdp
dGgKdGhlIGRldmZyZXFfY29vbGluZyBjaGFuZ2VzCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZv
bGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNl
Ym9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6
Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
