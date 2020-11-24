Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEC4C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 10:54:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26FD32076B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 10:54:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jE+GRpOi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Al1ICsud"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26FD32076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uz8YC0Vb83JKvp+tJcqnihqxoToIylFtbStk35QUAkk=; b=jE+GRpOiWczm5LnbRv9O+cSbM
	VH2iz5lpd61zCECqPfQHp1V1OhQk0B45NFSj/igL/KjDFRH/44dRhBQadTiwOLyI15jWM3SbVp1ns
	rl+ccPX+Y2G/ZEkBjWZ76NrD0BfHnmAW3dXwczsKWLvQFxNpWy01JAZiwVkI9FDMxUnQ3JibRTlE4
	vOU1HMy7jQHWHFti8RKnIf/4EPwXhDtQtJSiUAzI3Jmp+ssFEo4kupKLmV2mZ+eMdn38fLedxUqRM
	cYjNB9PHZR0jEHtiyUpJFZixju4U9rdG7TV56xbMPfqQJ54UCOYSDbVf1fv7MrIKCIrRAT2YjkxQR
	yPSr6Np4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khVxa-0004Tg-Ce; Tue, 24 Nov 2020 10:54:10 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khVxX-0004S4-El
 for linux-mediatek@lists.infradead.org; Tue, 24 Nov 2020 10:54:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id c198so2019601wmd.0
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2020 02:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kvdr8KP4BhHPunB6/HiX28Sf9PSdmI9kMBfi8vaUsaQ=;
 b=Al1ICsudCsEbcON7RNT7a0Aq78qbaIjzkhprm1rz6a59jc1X7l9uuJitKRcl/SxyGM
 3RadN3gB39d3VNCKxPPNecy9fP1t9roSKy8Bnyrv1s26sin9R9GPRKSv37d7pn9zfDKu
 YV9HGC59lYbc3LsGq3TFTSt7MM2h6gUeTGAD7YcWL7Sv6G6x3hJ2iUUHMQ/B5Qh09KCg
 /ScovBicjTLEts2r89XApTzbaljzMdjLcFFP9o9TsYEA/tQys8UKzWbbqEgFAhW6ci0x
 YLTt4F8odZQmK+5KeZazDes3cq4gk1EOTq0sNTS7PitYkQe8hIsdF+UKlhlJyp+lFmBx
 wvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kvdr8KP4BhHPunB6/HiX28Sf9PSdmI9kMBfi8vaUsaQ=;
 b=Y+AphlMl2vim1VpSyxFNB/i57ENTwHOFEnWxZ6rJjYb1Bv3nAg+Hm35Jgi1bSloXH1
 wb3iaN6xCj+rAIEeKF2tMWbKkSjdPMjLCG5q8jTsO69DPXASPvjDVOnkaSqJ46t5ukhJ
 iJFyuT+3T9/rtzg5nPM5qZb4Gqp8LoNa+6boKmkaaCViYHbh832C3oNR/wGvncAOOhDz
 hr59MGt55ZFCQypIjpDu75tBGsSnstVFntyDZHOVUSug+PqfdGm/nDryduy5BECkcP77
 PoLQz132gL5SaY+t245GDjHVmWUDp4faVYdUjMMar9+UAQ2bDaQJYJ7KdWTlw4ifWz7d
 ZyLA==
X-Gm-Message-State: AOAM533xpFLdUES/zDdUSD7BR1pi1GLPfAgvj0i6neocoSTHkeM1CUH5
 QHOEZkVkRyqRhrN5ViYkYJEnlg==
X-Google-Smtp-Source: ABdhPJxdsl2r1PW9eMx03bqdIbiAzAu599V8F/cQEp3EzXU3lEc4g9vLOKzCqj4J2BCsZVy4Ht54Ig==
X-Received: by 2002:a1c:2c88:: with SMTP id s130mr3773241wms.79.1606215246270; 
 Tue, 24 Nov 2020 02:54:06 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id z8sm18928761wrv.0.2020.11.24.02.54.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Nov 2020 02:54:05 -0800 (PST)
Subject: Re: [PATCH 1/2] dt-bindings: nvmem: mtk-efuse: add documentation for
 MT8516 SoC
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20201016171837.3261310-1-fparent@baylibre.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d5cade4b-de2e-9137-ef0d-afd3c11d1884@linaro.org>
Date: Tue, 24 Nov 2020 10:54:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201016171837.3261310-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_055407_595345_9B48F65E 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 16/10/2020 18:18, Fabien Parent wrote:
> Add binding documentation for MT8516 SoCs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

I have picked up the dt-bindings patch, but dts changes have to go via 
arm-soc tree!

--srini

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
