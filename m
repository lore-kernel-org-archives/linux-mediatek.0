Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6B6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5f2szHXaGzFXM+QokmgsfkmBLkNqXSfiDGTjKRlczWs=; b=HU2zjPTROKKWvhloMFW0iT/FZ8
	FwnXRr1tLKy5Ho05IrpvLzX3/tlEEzGFCX7yZrdDa7oJP8rl6bwmgh2ZDfloplXOxziBhh70X7NTS
	EX56MztFTo4LyAaNOVGPIgYJ/PYrAmnXeDVCURxZY1ZvvUdeq3LAVdt0p1FmdiuLiCDljwgfaufY8
	f/30Dz61qUoPBiyP55R0fckFo84gkXc9sQBQHERb3iMZIxPIc0uuk8k5GPomNEVWWTnetQfObkDAb
	1Wn2TfNiJCwLTGquYkek2EH5w+MFGoJ5Au6LMkUc98f5s/3ob5dPIY09d1y0M1sXvaWMKDBdxS9Os
	RTu8tlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69EC-00EemC-PW; Fri, 16 Dec 2022 11:50:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69EA-00EekX-Ho; Fri, 16 Dec 2022 11:50:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id m19so1670191wms.5;
        Fri, 16 Dec 2022 03:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5f2szHXaGzFXM+QokmgsfkmBLkNqXSfiDGTjKRlczWs=;
        b=qNZ/FYhREmmt5LtYE0eoBDKw5tiLcmpSabQQ8BzMy35Npi5VQMIekUewPLAqdd/iyj
         8Yq7IbCiXb7szX5M/6hlnfGr9rMOGm4DdPuSy1DW3qp9QY216qFd8f944J6cv3ljEt/o
         KgnlPEjTDQIShYwigGHS/TGqgC2pvUQNKx53o/Q2Gz+D1yawFjyCZpKtAsZYvpgzlJjg
         lmFfkStNvmdsUZVGvOcArGBvfdMOl+IH9pMzTFk+kanuc2qPun0SOSosEqCUN572wmvi
         XFZTU4WBsW/OwBdcNAr6z+cKpCVhKoCiQ/LI40OnAtSg7jZKTZIZo5yz8HYjMJXgB8TN
         sUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5f2szHXaGzFXM+QokmgsfkmBLkNqXSfiDGTjKRlczWs=;
        b=xD5xUQwn1CuNp7BTy6UN1NBRpsG6u9uI6zxg12k8vR6yDFQwKcEr90fabUmNmefHz5
         +zQNashy5iGcz9ohMAs7CL163cuR7D7sRjxghRs0j6AgH+xPMKdGcQ/943mS2HkrT1rD
         WvJveObActdlCB7Ni+7VdOeLy4Jfa5xPyjZHAMn67OOnTVjd48C43U34+EnIQKUsUbE2
         gQp0qqc/KimNbtG4l61pDAn3xXlJYAK/PmMFDXONUARBY7WSZs709RKtIfCd0bDFvZXw
         LrauruDCXHSPD8lqwI9zAh1s+88cJkILnwAfsrUHNq/BQKaBDWdDkZ2UmmnbLIlIapU+
         fy/w==
X-Gm-Message-State: ANoB5pn0SFHT03fsmwgCd1RvUaFIdTMuI2h/6F3dAphkW+D+ur4Kv/E7
	df2EtHZPtLd6V6g9fvKg/0o=
X-Google-Smtp-Source: AA0mqf51vop4o/eMa8yjEyPDs/nsh8zNaWybH6NyGggUTd/tMDmyk1W78wI73sdCdOZ6ajioW9R8BQ==
X-Received: by 2002:a05:600c:3508:b0:3cf:b73f:bf8f with SMTP id h8-20020a05600c350800b003cfb73fbf8fmr25612865wmq.7.1671191407196;
        Fri, 16 Dec 2022 03:50:07 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c468c00b003cf483ee8e0sm11375737wmo.24.2022.12.16.03.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:50:06 -0800 (PST)
Message-ID: <bc718a1e-13e9-db16-efef-06e94395ba39@gmail.com>
Date: Fri, 16 Dec 2022 12:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 5/7] arm64: dts: mediatek: Remove pins-are-numbered
 property
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 krzysztof.kozlowski@linaro.org, angelogioacchino.delregno@collabora.com,
 linux-gpio@vger.kernel.org, linus.walleij@linaro.org
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-6-bero@baylibre.com> <7ho7si56n3.fsf@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <7ho7si56n3.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_035010_626211_2B295293 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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



On 05/12/2022 14:20, Kevin Hilman wrote:
> Matthias,
> 
> Bernhard Rosenkränzer <bero@baylibre.com> writes:
> 
>> Remove the unnecessary pins-are-numbered property from
>> arm64 Mediatek DeviceTrees
>>
>> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Acked-by: Kevin Hilman <khilman@baylibre.com>
> 
> Now that the driver/binding parts are queued, I'm assuming you'll take this patch
> (and patch 6) via the mediatek tree?
> 

Yes, both applied now. Thanks for the heads up.

> Thanks,
> 
> Kevin

