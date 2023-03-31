Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812DEC6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 10:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeLG3SmKVoYAE/gwaTVKHgqiUXEu5PfzU6zaovu3/zE=; b=2BJPZxKzLUf2lSR28UsUB7MQuy
	eWf4pXRtVzzM+D+j7Lyl63ay0A0BJLDKseKVBKTiJCYVedZ67ooMIc4XHNhKXCaGqILP3UA1hMh5o
	Rp04x/rYO8LnzcxBAeHfFgCOCQn+om/cHs/IGXv8vEANTB2s0iqRzeqP+F5nSPqyrmmJR+i9yZ8qM
	EjEs7WEYEBOfN3+stiEYAH7A/Gq2enxPFWFLy8ZCryXyOITyxsWxkqhtRrLbtXeu1aWsyWg+4AoKD
	NVnwHhyMdA7VXu0epMIavfckQMeau6PKvaabn+3ZBFvXrdSIgJPdcCDbitgAoYb8074EVLuvEwbtZ
	I9aO1hIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piC8B-006xGm-06;
	Fri, 31 Mar 2023 10:37:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piC80-006xBh-18;
	Fri, 31 Mar 2023 10:37:05 +0000
Received: by mail-wr1-x432.google.com with SMTP id i9so21917327wrp.3;
        Fri, 31 Mar 2023 03:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680259014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeLG3SmKVoYAE/gwaTVKHgqiUXEu5PfzU6zaovu3/zE=;
        b=QpDa14UIm5S6KX7Xj3tCP7mEFM8GCkjFb3RgvdmV16zv6/ZN2Q3qIWes5E7Fcy6MtN
         8jWjkklZhsFl24feC02AhLHW9yAH22aMPTDy1ATfj0EeX/tThFZzLuGaiUnIOpTCjxJF
         +DnJHLYtw8Kd5Bs1YdwHyL47ijjVz0qbASevXkg9soAgSA4PdLVabRqY0NnhYFkIK1Sj
         r3Ys3a3AdgtrPnN1DrvccLcxM/qOSaFJ6++BiGcNhaDV6nGTZok1R7KDZkSOtul9Jmqh
         OU53e3ud63mUb1cv9oMkurFz3AxjXJgPji2LMiLaJH1XrbrH//AjFDspo9O696rkj3k+
         ycgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680259014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeLG3SmKVoYAE/gwaTVKHgqiUXEu5PfzU6zaovu3/zE=;
        b=KK0ZVNLerObFO9ddj0q0tmYvAdn4aMX8cVBwsyfpY3JpFSiirIkXhj5sT2gSOd4gb5
         IN22BlpWUKPbmW/GyVVXbC2rrmOA+buk7z4aAovkiSmUAVgdIkjBfXislFnLAAgFkZuN
         WMgJVNSktt0vt7YtDu4oN1HrErMnCFXuyyGiLI7VUNdu3+9PTs0w5J3iGou9Vc5DA2DO
         qADmllWPZ2+iJeABQKLTv0iFMaEK2uqn+6lSo+0xCVHDgVeBZtbTQhu08jWBPH8H4Bva
         OEY9Jih021bOJKeQXhypccluXQ303AxCtFn54HNyjp41JVzz/qQOopSMtEoistkRha+f
         mByw==
X-Gm-Message-State: AAQBX9foaQIybCgixwqjbhiDDxtmTa+uevzlJ+h6dFqvqwZcIqG3VTI4
	Y3ImTL3aM4JgU2ykTCCeQYM=
X-Google-Smtp-Source: AKy350Zd8s0vzQSVNquNFIc6CYHt3yGGpsThtNQB0RBm1ZUMCQwEfLqUw7AqLmN3YHCa1IEHnWkmjg==
X-Received: by 2002:adf:ea91:0:b0:2c5:9ef9:9bab with SMTP id s17-20020adfea91000000b002c59ef99babmr20931861wrm.43.1680259014240;
        Fri, 31 Mar 2023 03:36:54 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i12-20020a5d55cc000000b002c3f81c51b6sm1834023wrw.90.2023.03.31.03.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:36:52 -0700 (PDT)
Message-ID: <a1fde974-f392-1493-b48a-b4cce05f3ea3@gmail.com>
Date: Fri, 31 Mar 2023 12:36:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v14 6/6] arm64: dts: mediatek: mt8195: Add temperature
 mitigation threshold
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org,
 rui.zhang@intel.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230209105628.50294-1-bchihi@baylibre.com>
 <20230209105628.50294-7-bchihi@baylibre.com>
 <CAGuA+oqOgprdu0dVcmB=qJd5HJjada3d8ZazMpoG-SBPizzuPQ@mail.gmail.com>
 <80c60f09-56eb-cb84-43f0-7b055ea4b32c@collabora.com>
 <CAGuA+oqJVTXE5YHm6rSv4pPWsGxR8nZD-T5EM7LS9gPtdcu4HA@mail.gmail.com>
 <CAGuA+oroM1XmLTDZcFx5F+tHvbOJXUGuj8SnZnUxD56+9XAb2Q@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGuA+oroM1XmLTDZcFx5F+tHvbOJXUGuj8SnZnUxD56+9XAb2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_033704_387361_AE376876 
X-CRM114-Status: UNSURE (   9.93  )
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



On 07/03/2023 12:10, Balsam CHIHI wrote:
> Hi Matthias,
> 
> Is it time to apply those last two patches of the series "Add LVTS
> Thermal Architecture"?
> 
> [v14,6/6] arm64: dts: mediatek: mt8195: Add temperature mitigation threshold
> https://lore.kernel.org/all/20230209105628.50294-7-bchihi@baylibre.com/
> and
> [v14,5/6] arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
> https://lore.kernel.org/all/20230209105628.50294-6-bchihi@baylibre.com/
> 
> Is there anything that I could do from my side, to make it possible?
> 

Both applied now. Thanks!

