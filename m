Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD08C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 12:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlT+2nXHH7figLXYqN6h97DwdAFo3rxIuidTGSYR/P0=; b=TRm59LkJ8/bOqIY3/9uhNWeW6b
	3Te63hPgf8t1pfUbb14GH8C+vRUNlYNTwPyAK0z/R9+MOjrwvyWNZWGKkfVcVAnTRldMfe25/lKk0
	tI01FWOPopfJnqOpVphZl0n/MzLlLHDN6w94R9/btu6A7eHL57bkiNMCt9oL3i9UYm3f+s5P4XBt7
	taBgEHfq7CXvBFMZ9bBbCQ5yzHinrgAJTtHHFawRupUkcBZgjmN9OSJnIw3CK4C78JgDikbo4Er0+
	HSdnSAtR0WoLusJWZ+C8P1UlYeetG4bWSmbB1jXrTYYH9VUi1BeMEjb8h0/b6C9QjCuGecNpkyJTc
	/4lO8NqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yS3-00Dqe5-28;
	Tue, 30 May 2023 12:27:47 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yS0-00DqbV-0C
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 12:27:45 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-30af86a96b4so122699f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685449658; x=1688041658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tlT+2nXHH7figLXYqN6h97DwdAFo3rxIuidTGSYR/P0=;
        b=sI3MnPYHWBdlGJxiLPwGf/TfKcYpod81NSp/jqBI3YWZtng5r/1mPKNwzutsfR10Kg
         DwHcdqhPcVpeSrLYmXXOWsb3iH3S4Qm80vFDhZLXQVOOayYS9XKAhPo9S76wn9sB1ArQ
         PwZWzRRrwr8mNnGETh/SBJgw/jjQk+CIKC9kVLnSme8yPNMasFySwRn1D+uo27CWNNHN
         xzPf4rayDYp4Saq1c+Tzd/ZEw/4Z0umLRNsTZRBKj30NRJ0Ebl2G3gOk6LZKdXEkZMWM
         eogv660XswWl/hQ2wcPZybEtPHy6xKc8I3mf7sQtGd39dAlRit3RXAbyft/o56g36/lb
         mlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685449658; x=1688041658;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlT+2nXHH7figLXYqN6h97DwdAFo3rxIuidTGSYR/P0=;
        b=It4PiVixHBQ73INxVoKYOui7GSud25nKWhmAvcuF9cLAWIIPyzFwdgNO2+QiU+d4l0
         Kbxymm6KMFoHczz3X69JM/M87w4nzE00RFveI80wxZBZbFju4v9pjDztEJTenP11JdLG
         VzPYJF/ahC1hbLuZXk+ShhiHgSCmHX6zBQ/8h70tH0vCi6HVTOac69/o8dprg/toYp/0
         zBGuyfCbiEf9k8A9lLq7fEIbQC/fKcrE+0Zepmcj9gy8ugg3JahyaYK9wwt87F358G9j
         JA75m2/qpf+taL0I1Fq9wDBqNa4gD0yMLSBz2FHva5jWdrtokyFXkqo36UzKnkbtQiiy
         KyLw==
X-Gm-Message-State: AC+VfDzkys7ZGvTrge8xnL/t+x6zEq/oBWEQjaWYWUeNoAXktHWW8IBw
	/arJN0tLkEg+vIbtd6LLSLgV0g==
X-Google-Smtp-Source: ACHHUZ7tZSoWKLv88vvxIwF7juwlLyZPiMNgkF2OQNOSMP/LIQEoMZgC2CZdWs3Pf8uYLb5InErZcg==
X-Received: by 2002:a5d:4eca:0:b0:30a:a478:f559 with SMTP id s10-20020a5d4eca000000b0030aa478f559mr1456676wrv.2.1685449658181;
        Tue, 30 May 2023 05:27:38 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:dd1c:e75b:56ba:6bf? ([2a05:6e02:1041:c10:dd1c:e75b:56ba:6bf])
        by smtp.googlemail.com with ESMTPSA id c17-20020adffb11000000b0030633152664sm3101590wrr.87.2023.05.30.05.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 05:27:37 -0700 (PDT)
Message-ID: <87b0f5cd-67a8-fbd5-5ca7-a286b543d796@linaro.org>
Date: Tue, 30 May 2023 14:27:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: Fixes to the
 interrupt handling
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Alexandre Bailon <abailon@baylibre.com>, kernel@collabora.com,
 Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230428195347.3832687-1-nfraprado@collabora.com>
 <20230502103344.GA3388518@google.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230502103344.GA3388518@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_052744_095513_F5BBFA3C 
X-CRM114-Status: GOOD (  12.17  )
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


Hi,

On 02/05/2023 12:33, Chen-Yu Tsai wrote:
> On Fri, Apr 28, 2023 at 03:53:44PM -0400, Nícolas F. R. A. Prado wrote:
>>
>> Fixes in the interrupt handling of the LVTS thermal driver noticed while
>> testing it on the Spherion Chromebook (mt8192-asurada-spherion) with the
>> MT8192 support series [1].
>>
>> These are standalone fixes and don't depend on anything else.
>>
>> [1] https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/
>>
>> Thanks,
>> Nícolas
>>
>>
>> Nícolas F. R. A. Prado (3):
>>    thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
>>    thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
>>    thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
> 
> This series seems to have solved all interrupt storm issue I ran into, so
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

I gave a try on a mt8195 board and I don't see any interrupt firing when 
crossing the temperature thresholds.

Did I miss something ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


