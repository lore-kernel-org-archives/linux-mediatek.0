Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50044C25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGZsWMQxIR/8a9H8paH0XFiZvIlanvQPzCmlVbwusdU=; b=VXvxn8TC/VydjsPu54kQ5KKjcP
	2K4lTigZpye3fXJhIRTb/iI7cYIlwew2zaw9BCFVJv0aLvT6cm1bNQwsbp/JGsp7FtKm6ZvX5Olhi
	J6Yro6e8rv27B8Vgt9VSLvpxb49mv/9PSic/U7iSw+6MuO56iLd6ZGhB8TMZjjtwvdlS9MapTDAHn
	nGvnfBkiFqV969C81WqQdPSzQW4iBvxPVgFXgOfPmRHHEdMCWOs83RjSRxvxzIQ8yJmCoDyu8fr8o
	T5Vw2WDMxoZcJlN9hmXFGlChF9/Z+yBre7PVrYsN5XvtppTF/k6qX3/5zTYQvJ7wpOUdLF3NVCRY+
	jplF8iTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH2F0-0000000970G-3zQf;
	Tue, 11 Jun 2024 14:12:50 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH2Ex-000000096zP-2Bk1;
	Tue, 11 Jun 2024 14:12:49 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so112571071fa.0;
        Tue, 11 Jun 2024 07:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718115165; x=1718719965; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGZsWMQxIR/8a9H8paH0XFiZvIlanvQPzCmlVbwusdU=;
        b=XcmSrb5cem020o+EvztDW/7pX0CwXTQe+AM/JnOw9AMJToR2+WWvV5LvmA1P1Cx1HA
         v6ymh+8rQqTv8zIM/UCdbCpNlFTMlNF0oVusAKDPQ0/XzTH75mvjFp7JLO7iB7KoDEDS
         vPh0OKBY9UXm/9IqfIM9XfQz1qNmQlDapFQiT4XkYH4thROyh3/T6mCDGVDXJbcWm5aJ
         +eg2TjCiycVL+918oTolITiEBgFv6VL93kHAirJKB96qMePfVNg35ZvQsGbfdLGFgsGp
         g+XPqKyowWT4mGFyzBXm6ygFNdJ3Xx4xd1QLtMbKh7kcFFfSquRgCn2s1h14Dv2LVmpT
         OJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718115165; x=1718719965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RGZsWMQxIR/8a9H8paH0XFiZvIlanvQPzCmlVbwusdU=;
        b=j1iZvUYz8nD4suPhqy102k550Zw31HlGJhEuVJwPIUfH1yhdjR8sQsIHnRRIDBj23y
         mVHaaPpx8fkEbQkWkFrpBGJZ+OMz3IhBzpiySaQflGzUIJZdlS3l5GBvLa9FnCpucLQU
         o1lbUpYtuq6kB625FfoBjtCl9LVbFXrcAWzJsd8v8jXI7DsRsdcUqbHYdbhSFcQ9JPBT
         iPsCPOQHBjpBA9fHQAWxXcY4YzCJS6mNPgVJ9bLHCqmqE8y7EIj/NUH7uDezQVXItCMv
         Xk12uo3o2PkKRYA6528q5asHFEarVFgN6o+/o8K3OvGViExTaMBOjgDcAaaOmbZEe7af
         WsPg==
X-Forwarded-Encrypted: i=1; AJvYcCWr6ppgni5hu5JYZlMKZFJQucuCEc4LpT/4zGBBNoMHMhBoHoCB5PrRF6sCTsZAQ7f9N9+owR8Sqb9SUCwsgif3kOB2dSv6/9o2zTdXXeSmOM6XdEvejivostUo2viuL5EevnQOxerulcUDnxg0Raiie9cYPeZSE0I=
X-Gm-Message-State: AOJu0YxUQx2bDN3WNioBJddvlhonlvSOiu4I+dd5DvJiOsKlaZbW/ya/
	R+rfs6g7s/nIVF8wLAuJA9jpDEwUDx/ZSqSU+11qwXG+N3aeDnPO
X-Google-Smtp-Source: AGHT+IGuq4XXKdcSy2MRECTQb8OvnrexiaWWjJespHlYnvTZ0wLoCtN53WXIbcE0kkCOgg4nKbvssA==
X-Received: by 2002:a2e:3612:0:b0:2eb:17fe:a144 with SMTP id 38308e7fff4ca-2eb17fea1c5mr62244931fa.34.1718115164779;
        Tue, 11 Jun 2024 07:12:44 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:89c3:827b:2198:62f2? (2a02-8389-41cf-e200-89c3-827b-2198-62f2.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:89c3:827b:2198:62f2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6effb9cd7asm457716466b.208.2024.06.11.07.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 07:12:44 -0700 (PDT)
Message-ID: <233d56de-8d5d-4bad-a380-45321a2d86ac@gmail.com>
Date: Tue, 11 Jun 2024 16:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
To: Markus Elfring <Markus.Elfring@web.de>, linux-leds@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pavel Machek <pavel@ucw.cz>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
 <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_071247_583354_CE83FAC5 
X-CRM114-Status: GOOD (  11.72  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/06/2024 16:01, Markus Elfring wrote:
> …
>> Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
>> in the error paths.
> 
> I suggest to apply a goto chain for a while.
> https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+goto+chain+when+leaving+a+function+on+error+when+using+and+releasing+resources
> 
> Will the application of scope-based resource management become feasible with another delay?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h#L8
> 
> Regards,
> Markus

I considered that option too, but there is still no _scoped() variant of
the loop. The scoped version of the _available_ variant is being
discussed, though. Maybe that one could be used here if there is no need
to iterate over unavailable nodes.

We could not back port that solution anyway, so I would suggest this
solution (or the one with a goto), and then a separate patch to used a
scoped macro if preferred.

Best regards,
Javier Carrasco



