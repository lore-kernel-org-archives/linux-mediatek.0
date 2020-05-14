Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2E3C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:08:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA9E9206DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 08:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z+obj2V5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p6ePzTd2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA9E9206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOuGE9HgSFSqClx0y7BYOkLZBVIIYZzHpVw5ozUfKKg=; b=Z+obj2V5uFDDC0
	c6fivKRGVzqmsjBZWuCuvBW+TPgbauvi6sZpXg4GE5pQy1LkduQHThpsikvimmOZk2l1su0WHTcxI
	frslevvs6ncZBoekwVwUT8BpkBmbPNXbASo42kxD5hOnbcX7ropfToeZ5xOJAyB2tvrLyf/GesXiO
	lvQ2nnE4NKBps3lS6z2HYsz/sPvnPL2cPQDDLqfv5NFlssPXIY/PJe9rsQ5ZKwnyWrSGcF1skCjzw
	I6vrS5Y5GPdwdMW0GMJTfG/H9ETUB/YsmbvhftTbusTrrj+QOIuLxcz/qHqFj3x5vlXKWlDbIQl2j
	hQgTiHuEsGAcgUHsPt+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZ8ud-0003Wn-Df; Thu, 14 May 2020 08:08:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZ8ua-0003Vl-Rb
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 08:08:14 +0000
Received: by mail-wm1-x344.google.com with SMTP id u16so31321277wmc.5
 for <linux-mediatek@lists.infradead.org>; Thu, 14 May 2020 01:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+dBTttPdObnoAHm8o3XOpB6wiom9rFH5IVHvtwcE0HI=;
 b=p6ePzTd27zTHt8YXadOh+yoHGm+Jq5Ilo3RFJ0ldQcG6r0KUmypuXk5qeszLRta7cQ
 y8Mk/1VZCW+nO+tGbNExaZIOLHdDrvGHs5SuUwYqtIFvLaJzyIWWxVfLJUEu0iduxz0v
 mDl2sk29sX7F8ZHh/tR9P7FwKia5yfSQyzT2g5ExKjASfyYsNho75mLvE60R39UKSgSO
 Lu6eTJNxpQOQ+9+BaCWnmo6uKWNLDmBWIGP7hWAxe/jlo+ZiIH03E/m99g1EM/2Nh0bB
 Mt61DMfCMIYUXvLKb/muchhMzPavtv8rY52o0c5ykqUWGZUvJn7fwDsSB6oLa29h2yDX
 dbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+dBTttPdObnoAHm8o3XOpB6wiom9rFH5IVHvtwcE0HI=;
 b=hjvNFNFO4FqunByo7q2gtaaYHix56VVtzyaxRzxxZItxyRdsJqduMOAwo3FqHUqmnM
 Oo2qyTj+hc32DymW964afMbyZGBX+rRJj5u/HLIa56hrXZbYzBKvyDxO+tOm+CGottD3
 L+BaOB9Iwelq2iYTgMUA5Pc8fETAzUFXZQ2ek3JIpffZrkjyyW5FmErw7xPKKcuyS6qM
 MySROia51CmAmxhxwDujrcZJumIUfvto/oRKMPCTf3tX+Li+AvO0N7VxytR+qrI9uNt/
 Ne5tVaNQKVXmtxYu/w6yKNus+D7w0GI7tD/C0DgGlArCMLd1+hATLllAIs/10ZHKEKXj
 FP0g==
X-Gm-Message-State: AOAM531vL8lyunCI3Ju8JRq2czt9VK3lq514ilbdCdIs0RPigowN+nlV
 B3zfF79rm7EJut4DVRMK+Vtc7g==
X-Google-Smtp-Source: ABdhPJxp4IlgGcuqBONSjUjvyjF5xuOobYyR62/UafK9OpqwbPrMPajEW49YlhsRquv+6SOQWVf3iA==
X-Received: by 2002:a1c:4806:: with SMTP id v6mr1080870wma.20.1589443691089;
 Thu, 14 May 2020 01:08:11 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:ddb0:8d90:9d95:ff51?
 ([2a01:e34:ed2f:f020:ddb0:8d90:9d95:ff51])
 by smtp.googlemail.com with ESMTPSA id
 g187sm10106409wmf.30.2020.05.14.01.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 01:08:10 -0700 (PDT)
Subject: Re: [v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL
To: Michael Kao <michael.kao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20200323121537.22697-1-michael.kao@mediatek.com>
 <20200323121537.22697-8-michael.kao@mediatek.com>
 <1589439322.11120.2.camel@mtksdccf07>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <09278638-aa39-c130-95ff-7e9de34cc4eb@linaro.org>
Date: Thu, 14 May 2020 10:08:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589439322.11120.2.camel@mtksdccf07>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_010812_927576_1CA846BB 
X-CRM114-Status: GOOD (  11.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTQvMDUvMjAyMCAwODo1NSwgTWljaGFlbCBLYW8gd3JvdGU6Cj4gT24gTW9uLCAyMDIwLTAz
LTIzIGF0IDIwOjE1ICswODAwLCBNaWNoYWVsIEthbyB3cm90ZToKPj4gRnJvbTogIm1pY2hhZWwu
a2FvIiA8bWljaGFlbC5rYW9AbWVkaWF0ZWsuY29tPgo+Pgo+PiBUaGUgZHJpdmVyIG9mIHRoZXJt
YWwgYW5kIHN2cyB3aWxsIHVzZSB0aGUKPj4gc2FtZSByZWdpc3RlciBmb3IgdGhlIHByb2plY3Qg
d2hpY2ggc2hvdWxkIHNlbGVjdAo+PiBiYW5rIGJlZm9yZSByZWFkaW5nIHNlbnNvciB2YWx1ZS4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBLYW8gPG1pY2hhZWwua2FvQG1lZGlhdGVrLmNv
bT4KPj4gLS0tCj4+ICBkcml2ZXJzL3RoZXJtYWwvbXRrX3RoZXJtYWwuYyB8IDkgKysrKy0tLS0t
Cj4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+PgoK
WyAuLi4gXQoKPiBIaSBNYXR0aGlhcywKClRob3NlIHBhdGNoZXMgZmFsbCB1bmRlciB0aGUgdGhl
cm1hbCBmcmFtZXdvcmsgdW1icmVsbGEuCgpUaGFua3MKICAtLSBEYW5pZWwKCgotLSAKPGh0dHA6
Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZv
ciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdl
cy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3
aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
