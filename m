Return-Path: <SRS0=JQRm=JB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683A0C433B4
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Apr 2021 20:34:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 073C260231
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Apr 2021 20:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 073C260231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SIrNUCuIZqj2APHvkZRaTDZtrW2sBI0reXPyzmk2IZg=; b=MTsllK1F6uO4TmDaf7Vjjq3c3
	FK8f0gV97uo74axTQXY4DiIs7c3RK1BU79lMdoUxttih9XGxtn0NpQVZDyupoW6nv0uXpUGxV1mdG
	K4MmBLzr9QEaPNTUBX07NPPmeSTY8q6ouk2hHWbjlqQAYxbgZ5hK5vG7lkzfSr5cx9p+es1gFoUpN
	S1aWRgIJQ7wAz9FgN/8fTnaujrnxZN5B5NSKS5DF4XXghMKvbccyKqalLZylIwpWiVTGcY+dOlQzY
	xPWuSt7QqArUhFcO2f8WGE1b/fvPw6QBUJLO1MTIFwBJnQHZNegBwHw6MH4xkXi6yaRXPvtp864In
	okDGdOGlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lT9RJ-00GEk0-Dl; Sun, 04 Apr 2021 20:33:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lT9R6-00GEi3-JY
 for linux-mediatek@lists.infradead.org; Sun, 04 Apr 2021 20:33:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id q26so3582366wrz.9
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Apr 2021 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qLAy95bvS1zAnYuhC/w4xxxlm+O0tzNR1N2BJpqbw5w=;
 b=Uj0Y5h5dAclSEpTTchKZoN6d6/X2/jxuIIdiY2TiTyk3Va6KgXWEIR7nXrbx2G6DmG
 DEj8NTV0WHUfrymtdaelg8IdCSbFubY9BkAoUgH6qQf8EqAg7oNdPZikt1hBXz6v20zs
 A8AaPWXWp0Z2jemWr2KvX3VEPPGU3IlyIZPwCyiC+SenicBH6/PCmHtanTK6GQ1U+Ifg
 VY2SBWvWpq0G2yymbRGsBY5fsQ3VQ4aGS/FzsLk9krR6A4W7hb8uudpCoMiP1AUhW51x
 KAc2oi6Fi2BSvj3YthT1WKevVUyAKnRg3u5L4ySofPzK4gqEB2ss/pH/Whz46Pfeo62Z
 VcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qLAy95bvS1zAnYuhC/w4xxxlm+O0tzNR1N2BJpqbw5w=;
 b=GZsq11hXv0OWendTtmU5b7zXCjtqAo+ThqQkTW4HnifcAal2RSj+ezAPXqAnwvVP97
 Xkc1tFhw655vt+ATyJ/bgcLiQ9wnZwJo+2Iwhb5jNykMIb0uRKHhqjqhFgZFsY1sBYWu
 gQ7a+kY0HZelvvsgeGA4KM8REV1SL66b21cn+I8dug4wTT3STZH7OzqROAKL7eLRIgT4
 zyekpKnqsW2w8MW5kFVgMLrzxBME0LmU4+DhJjp1reG0C+ndoJPFmlFy63pqhlNbhaur
 uNIC1s0P8WIOOhVWvYPCx+RuypNdsufQrfOpRq5ajFT0V0FbfyJ6a/HaMPMUXGZhteLi
 eNqQ==
X-Gm-Message-State: AOAM5339pkRjXSoCGptlKq0GJ3MO/2XNcAb35jgquu4DDdo4u8Pf378N
 DNWLwMVRMuQ+SbKsCffUq53ZIg==
X-Google-Smtp-Source: ABdhPJyhT6Ya2IgUD2RMKPgOE6BwHgGaUQpbUoSsELec3O9UxvF/KjbQKc6zYs03mvxBXK/bekFFsg==
X-Received: by 2002:a05:6000:10c4:: with SMTP id
 b4mr8456271wrx.386.1617568410016; 
 Sun, 04 Apr 2021 13:33:30 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:6d68:6b9a:7a3c:4a9f?
 ([2a01:e34:ed2f:f020:6d68:6b9a:7a3c:4a9f])
 by smtp.googlemail.com with ESMTPSA id u19sm8383785wml.28.2021.04.04.13.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Apr 2021 13:33:29 -0700 (PDT)
Subject: Re: [PATCH v2 1/8] dt-bindings: timer: Add compatible for Mediatek
 MT8195
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Seiya Wang <seiya.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Stanley Chu
 <stanley.chu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com
References: <20210319023427.16711-1-seiya.wang@mediatek.com>
 <20210319023427.16711-3-seiya.wang@mediatek.com>
 <bf7ad31e-974a-3e0a-12bd-32973c7c3cbd@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <11bf6761-8902-bfa5-8577-d397846e7638@linaro.org>
Date: Sun, 4 Apr 2021 22:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bf7ad31e-974a-3e0a-12bd-32973c7c3cbd@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_213332_899284_DE155849 
X-CRM114-Status: GOOD (  10.82  )
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

T24gMjkvMDMvMjAyMSAxMzo1MiwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiAKPiAKPiBPbiAx
OS8wMy8yMDIxIDAzOjM0LCBTZWl5YSBXYW5nIHdyb3RlOgo+PiBUaGlzIGNvbW1pdCBhZGRzIGR0
LWJpbmRpbmcgZG9jdW1lbnRhdGlvbiBvZiB0aW1lciBmb3IgTWVkaWF0ZWsgTVQ4MTk1IFNvQwo+
PiBQbGF0Zm9ybS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogU2VpeWEgV2FuZyA8c2VpeWEud2FuZ0Bt
ZWRpYXRlay5jb20+Cj4gCj4gQXBwbGllZCB0byB2NS4xMi1uZXh0L2R0czY0CgpVc3VhbGx5IGJp
bmRpbmdzIGdvIHRocm91Z2ggdGhlIHN1YnN5c3RlbSBtYWludGFpbmVyLgoKCi0tIAo8aHR0cDov
L3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9y
IEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2Vz
L0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdp
dHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
