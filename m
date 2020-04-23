Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131BCC2BA19
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 09:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A7020776
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 09:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MD6xOjcx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsyXxkNH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A7020776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEthZ4TE6Wp9Pp9No/GAGc9nTIWSpiZ61drN4FnAnx0=; b=MD6xOjcx++c33q
	VgFq1CSQ1D9daZ/5faOXqX06saxgjxbdLYI/VB6NSaOJ4TRwcLx0llTccE5Qre6PxmbyUfnhCkXNZ
	N+t+UjG+mOXAJRn2Z35WU+JTqT7uIlTjfA6YZ/9KkHYcnyeQ6C0E9ySQN2WAVj5Mr2BdzhtcCqDiB
	a9kiMDD7vWIE1+ObwrgEmBdK9aaDW3DaKiAw4MTqFnp+NeMRIciuW8GL8PwcxG8XBnVclT1+ht6z2
	nXmzV1zsthoEfJcIEOH3rHyVbhAbjCL5QP7g4NW6ocfH30xEFsBt/MLrMU+uH3AVORSsJGs260d8W
	bf4YOjktA4TzXd7YzvHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRYZw-0006VY-3i; Thu, 23 Apr 2020 09:55:32 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRYZk-0006Lm-9e
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 09:55:21 +0000
Received: by mail-wm1-x343.google.com with SMTP id u16so5853347wmc.5
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2020 02:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CNZHIzr/sBiOQMg4o7SLifEDxLKhTFFCAk3xHKq/Wkk=;
 b=DsyXxkNH0btzVamhIFYzv5e350yw7X/w1LKFwogh0iIwGOZ96kVPXuXkDX32LZlwAC
 94fwg0MWeHie4nOwR95Jrn7cRtHYa60rXz9VOiMSFM/iKMyymQip57NZrPEQTg9A9yrb
 sU1IjCQpH+9HLWLKs738y4q6R63guG/pQy4hAMFfXU/FaxMDYHU6DOWGVn+x2CbWEpkx
 Vo5zrIPAcwf72RxKvq889DHMx7Sv/eAARH47GGoJKHa8+8uB7M208Vnt1tgwYaqBlp/v
 5UkeF6iEQSn2bZD9AtRien1PivU6B7DVufUotKDoDbqTxnfNsCAXWKrMdChEeIIErbT7
 0RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CNZHIzr/sBiOQMg4o7SLifEDxLKhTFFCAk3xHKq/Wkk=;
 b=cX+ZNZxqoexWSd+cI9w6nZz9w//UtmL/HDzdCrUyXHfQKlepi2WpvXNUR9lkdkAMBF
 JVy/wgSJkkoEyulRpP0mHwUp6YJKlnIM1VexePbM2il80dY3V3lvPrxCQ3425AX//MMp
 /G4BBxOuH4+uC3X6d1fcTQq2ruiydRA4nS/OWvO8Siz6RAJoj+eHARTdt9hWUT2tkO65
 bgRpLzG3hAcpWIiSZZdvPkZkJO3oKbXY3QkHMJm+kYcW29fKl9ljKRqSwP+YDLcRuKaZ
 HEvw0IosEOoD6Pid/DOxX9ySxUFkF+AZYHPN8f4EOZCqDuHqy0ecJwOR70ROLHt3WWSV
 OmLw==
X-Gm-Message-State: AGi0PuZzYynL9Ohp7xTT5/F3Mg1+Cycl7rIb+Q2kgK3FRLE8fJC4RwMn
 j+6b34nschBAYfcUf+S0NDTDNg==
X-Google-Smtp-Source: APiQypL6ZyvDfFcOWCfVXnw6SXTOR2+Oss71maaUGGL6LrnXJ7de4PKprtb6zu5/4UALDKzAFGgGXw==
X-Received: by 2002:a05:600c:2112:: with SMTP id
 u18mr3386058wml.112.1587635717910; 
 Thu, 23 Apr 2020 02:55:17 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:75d8:694c:3b71:4e43?
 ([2a01:e34:ed2f:f020:75d8:694c:3b71:4e43])
 by smtp.googlemail.com with ESMTPSA id i17sm2997016wml.23.2020.04.23.02.55.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 02:55:17 -0700 (PDT)
Subject: Re: [PATCH v6 01/10] PM / EM: change naming convention from
 'capacity' to 'performance'
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-2-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <3f764593-99fa-bce3-3630-ce16101df536@linaro.org>
Date: Thu, 23 Apr 2020 11:55:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200410084210.24932-2-lukasz.luba@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_025520_340812_0C3625B5 
X-CRM114-Status: UNSURE (   8.22  )
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

T24gMTAvMDQvMjAyMCAxMDo0MiwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gVGhlIEVuZXJneSBNb2Rl
bCB1c2VzIGNvbmNlcHQgb2YgcGVyZm9ybWFuY2UgZG9tYWluIGFuZCBjYXBhY2l0eSBzdGF0ZXMg
aW4KPiBvcmRlciB0byBjYWxjdWxhdGUgcG93ZXIgdXNlZCBieSBDUFVzLiBDaGFuZ2UgbmFtaW5n
IGNvbnZlbnRpb24gZnJvbQo+IGNhcGFjaXR5IHRvIHBlcmZvcm1hbmNlIHN0YXRlIHdvdWxkIGVu
YWJsZSB3aWRlciB1c2FnZSBpbiBmdXR1cmUsIGUuZy4KPiB1cGNvbWluZyBzdXBwb3J0IGZvciBv
dGhlciBkZXZpY2VzIG90aGVyIHRoYW4gQ1BVcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWthc3og
THViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPiAtLS0KCkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2Fu
byA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9s
bG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vi
b29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDov
L3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
