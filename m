Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3703BC369BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=inoGsYpigja5jTUghwsLjcEVgXmFJ+nXb0AjbaYD9QM=; b=XzD7VzMcgDIuBwoHK26sSkpaOr
	+ueHE8Yntk13an2avnRXfVbSEZyoaOyTeup1TX2OYY2Yalfg8QJDzeLvfiRkHxRW3vzl3Z2I5Woij
	AC1NYifBRitMYJTQNQEmR3nn5IGkY29GuYj6YIzHdn7ocft35ZGwUvWgy7yBkIK1rXSplcQcdyduq
	gLYvZXyEFmPQ1aCffmqI1GHXpBbDce2UqleBKTZuiN13VI+ljikNRIXH8jbu7PAZp8lOQbt1xpmox
	ZldhqKKLSdQMEeAm4shbgdI4plfJM/TpgKnfN/RsadPT8hazm4qWro73YI8NlSumIL7ss9Ip5xYts
	whLiigvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xnQ-00000008kCQ-0QZr;
	Wed, 16 Apr 2025 08:07:00 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xlo-00000008jtl-3NJQ
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 08:05:22 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7376e311086so8514819b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 01:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744790720; x=1745395520; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=inoGsYpigja5jTUghwsLjcEVgXmFJ+nXb0AjbaYD9QM=;
        b=ToCuc8Nqdn3j+ES5QlKlicHoYl8UyLeTKEiB+DpXY0dwvi/+OP3xbMT6A3qrU+BTMk
         dasUXs/nCKHNP6AxtDpW2q9vmUArl1VGdlgcuGYJX46JEmoTi0SCkNwaXqGIXw3n3Bfz
         xal5pae1MjgGyiWTgY8LFCWZWl2OI1L1qiifeGdMfNFHKsF58nPc06R2nUiDzlvrcarq
         769IguzDOfhkZp+oImL+PHWrbBTPYt0UNLIuvSaZ9SE/8eymdnLETF4Ipi54cyp3FRs2
         /ytZMKYZ8TpC8CMU4j1AMLp3MKXmB+JwLq8kXBije9h1G95BHv/PbzFoIfvjQ9YL4lFg
         tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744790720; x=1745395520;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=inoGsYpigja5jTUghwsLjcEVgXmFJ+nXb0AjbaYD9QM=;
        b=X7k1AAk4+EGE7hwHE2kaC4vIDIcMjlKuFP1DoBwR9yjRfNeCIWIAgCqPsq4cwdk7vG
         nNQ5rft9tVWAVJFxeeAvR1GzEb+qAzRVPXW8XT8BSQ74TIE+6DBEEqF1pIauvpUpTrMs
         IygLxDNcBVWpCTu5iidp8wC2G87SgcH8Pnl+javeA0lRoRan2UcUbgqbvoGFlo9Z4uQi
         TqBku23KPVNLelfMXeqFQB5yK+cF44o7jy6hqT5EEjLBBTThuhmrOZdnbW9ZFpx5i33X
         V57QkNFSJJfMMwGSpo8VNgmRjWAYigYzZJDJ4n20TWa61m4dANHGcrcvrSoGmQoZrup2
         q30g==
X-Forwarded-Encrypted: i=1; AJvYcCXR/8BSaAzDk57bh9U/6UZMAVSYhw+SlZ7xYXPlHh6M0RHyAMhfzeg8ZbSLUmrB8qpOkTSbx6/XSE6jCTIc9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh0vBd2AvCuSLslwiytQ6tmdK3BBJpblm1CUIjtF/ydtVYtGfg
	wyZdbSCth3HFsBf9swaZ4YihZP7JhyN2mg5X1kESjZULwmClPUMa4pkr9aIGnv5ducCnHEjjDNz
	a
X-Gm-Gg: ASbGncu9qluXhEW9O87YA21uZUazmbuUoYvwjVb7RC7NGogfPV0hroqFTklDRSOlaL0
	+mAvw7iP+AHQoSaEuggIGiPnm4vyBdrRt28NKQu+nVad8cz19T8fC0pGHsaoC8JJOXypJO2ewKh
	9tzpsFRS3QYSD62yWalD6WjXzIQIxSVAs6JX0AxUg7GswAtN7bE3lhYHf1Y1F+OUNDhrxoeDUeG
	fCHr5SRg//d4jyah6UhtkbH18JrcJ0F+w5+TatS6ofwf0XiHBPK606PFc95ViSYTDp+Dfvchjjz
	oBUWbASGeKNCMkAHQy0ehshf+l/wHemnfU7FCFysYtiFIGgx+shZ
X-Google-Smtp-Source: AGHT+IHE9GKOiXUJRd9ZbjDhVSEPnNsM58LQq5KKO/sJrxGQ10BPtZiiagmUa7v9I1/Pe/Ala+WMrA==
X-Received: by 2002:aa7:888d:0:b0:736:baa0:2acd with SMTP id d2e1a72fcca58-73c267f1bebmr1314183b3a.20.1744790720067;
        Wed, 16 Apr 2025 01:05:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd17sm9721455b3a.129.2025.04.16.01.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:05:19 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:35:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <20250416080517.feansrkpycsynk6t@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-2-chun-jen.tseng@mediatek.com>
 <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
 <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
 <20250321060148.adhxjexpnm4dkpnt@vireshk-i7>
 <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
 <20250324054333.sgwwksawnybx3lp4@vireshk-i7>
 <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_010520_852007_4BE020AD 
X-CRM114-Status: GOOD (  11.34  )
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

On 14-04-25, 08:42, Chun-Jen Tseng (曾俊仁) wrote:
> Hi Viresh,
> 
> The CCI level choose by Max_Level(LCPU & BCPU frequency) in devfreq
> driver.
> without global lock, It may choose wrong CCI level and cause system
> stall.
> 
> I hope this flow is serial setting like, BCPU / LCPU set frequency ->
> set CCI level -> BCPU / LCPU set frequency -> set CCI level -> ......
> 
> without global lock, it could be LCPU / BCPU set frequency -> set CCI
> level(during this time, it may change BCPU / LCPU frequency and cause
> system stall.
> 
> I also can only do global lock on ccifreq_support SoC.

As explained earlier, I don't think there is a race here. May be I am
wrong. And so I need a clear code path example from you, which proves
that there is a race here.

-- 
viresh

