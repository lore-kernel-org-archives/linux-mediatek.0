Return-Path: <SRS0=zNLT=LW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48678C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 15:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DF1F619A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jun 2021 15:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DF1F619A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=musHHnJetMWwMD8V1piy2ZUTYTKUsBS1GoS9r3VBy1E=; b=Tcy07e2AJDQrvO6rUkaxZQRQLI
	UUhSbGT21avZM6cEPT82v2MdlFBYH9QPVIUGg99J//NCO0GOctsigJeq+WderwStpWdElfDz9cXyO
	Qwq96FsvC3G/BtHIvGl+xZQe+JJp2+GCUIcYPLRn7lmWdQlgp/P0E2RJPBSUU3kBGO5j0l0ufDnKv
	Mnvkund65Y5Y4zDcS+Oe1mcTanvNYkys2tu+fURWeJuEr4YCCZ8GjdHBHxEPFvYo4GlArwyZ4HuYU
	9ZX97Is8BQf8AMjxDP0UF4krfqkalhz7UAc9PACDWjViBq8MJBuWrFoMIpcFK6kNqv4dJcP+wDYO+
	hCdM0D0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxtL8-008Tdy-SA; Mon, 28 Jun 2021 15:38:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxtL5-008TdH-Tf
 for linux-mediatek@lists.infradead.org; Mon, 28 Jun 2021 15:38:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id w13so11778963wmc.3
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4JaQqvoR+0f2Sh2zrstf6yPCyntyADWYeNdjvtHLij8=;
 b=c5xC4O2gzmT8kiPNdVZtcIyKFj2dtP0Kw3VkhUSA1SlC3B89ZfhSnIf4I2fVKDvxHl
 4cjB77Ug+GRxMI3yG8r9q3vj49dyJntVgmYPBK4wFCMPoguBewEX27uhpv1BdCN0ggDw
 MfBAp+cPreX2UHW/D5AvKoN/19EQgHg1OSFqUo8ELBGiI00TnqyHC6tZtHaME7A9CLIF
 TDZrRo57qxDPAjCbyDIdbc//FYLIQtpN6nuJBbRArPQOwC3ex/xtRtkR+SunR0Zdr06w
 FT9oUUY6Ho+O5uTzFpQjm5bYmWAQ0UlOGzedfm00G8bc+Is3uLeFvMVDUv/xZLwrAjwN
 VEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4JaQqvoR+0f2Sh2zrstf6yPCyntyADWYeNdjvtHLij8=;
 b=jwmac6Xf7TWaNQVc5A3UXHkJVTGnGtVZC8J05s21M5PeaLxsifgX1xHyNVjmWMFla5
 EXfVkv0sKj73KB1b6YhII5pjKFlgPT4vdNcrCHdutp37sEbc+oK0Zbr7WvRK6WHC8v5j
 Ejn4YroDfWPHsrl3o6VVW+FOUktw163eXcZ9YQeQamjmW2FGCsgapK3lYfGY1VQB//4i
 1hK28yTkogxVSZnRZ/CWdENo1L2QyU93g27c3KdwowJAbDjzqtT7hhPpLQEiVyyZPHO/
 as5Nu+6vp+EqS9JlS41qmhWKcIB5Bf0EbmsxQV7hh8q9yIM3AWyAC136kMDYBwsHWbPL
 FuvA==
X-Gm-Message-State: AOAM533kGLFna02QNOVeoLm3LGnjwcRib6KCD1kIFmk7YVUVMBvLDyYP
 Z5UrSIEnwmr0Yz5x5iEYHw/Epg==
X-Google-Smtp-Source: ABdhPJy5S03IXoODGLADcWPT9mB85Cqt9LLwCy+impxfJlWAc+wlKP6dltP61XPzG97lnieMZPl08Q==
X-Received: by 2002:a1c:ac87:: with SMTP id v129mr28215948wme.45.1624894701198; 
 Mon, 28 Jun 2021 08:38:21 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:c9b2:a9e9:8b67:65fc?
 ([2a01:e34:ed2f:f020:c9b2:a9e9:8b67:65fc])
 by smtp.googlemail.com with ESMTPSA id h10sm15414567wmq.0.2021.06.28.08.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 08:38:20 -0700 (PDT)
Subject: Re: Aw: Re: [PATCH v4] thermal: mediatek: add sensors-support
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210608154530.70074-1-linux@fw-web.de>
 <9eb45f06-1303-1438-7ba0-b9ccaa898b34@gmail.com>
 <trinity-de0268f6-e2f2-4ce9-abdd-8016c593894c-1624874759475@3c-app-gmx-bs72>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <0ff513a4-a419-ea47-4b44-9034f538c633@linaro.org>
Date: Mon, 28 Jun 2021 17:38:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-de0268f6-e2f2-4ce9-abdd-8016c593894c-1624874759475@3c-app-gmx-bs72>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_083824_037253_D51B908B 
X-CRM114-Status: GOOD (  10.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMjgvMDYvMjAyMSAxMjowNSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiBIaSwKPiAKPiBB
IGdlbnRsZSBwaW5nIGFzIGl0IGlzIHJldmlld2VkIGJ1dCBub3QgeWV0IHZpc2libGUgaW4gdGhl
cm1hbCB0cmVlIFsxXSBpIGd1ZXNzIGl0IHNob3VsZCBkbyxyaWdodD8KPiAKClJpZ2h0LCBJIHRo
b3VnaHQgSSB0b29rIGl0LgoKRml4ZWQsIHRoYW5rcyBmb3IgdGhlIGhlYWRzIHVwLgoKCi0tIAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29t
L3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29y
Zz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
