Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FE8C8303F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 05:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SVM2NB/+Q5TwegaC+cQ6efQn2fgkr/tPokgrfCaQZxo=; b=rOL8o++mBNLbonHDUbSYlCXb3d
	N8K/pGCmjp6eUL2goOTtpkcAPa6DtgHyihLruyMhW6/OEm3vFM0jKJPIvHFhPPLpiNEzHyr+/K6Ep
	ev5lW0yH19ySiA0Zxl6Axo6lAC8c6T1MwycbYr+E4dH/DqMVUrRtzgZDvP6D43t+TRKSFDGzU/xXE
	Zg2QtEWIX8juHqZA9bJO58Dbk+2BC/6KTxROFwFeYrrEljfPCZ/L6iQUJdKMMWrL3Mob0FqLgguk3
	TYLWMzL4A6b2ccd9lHTmwVbzNQy2p5XaGCQn55aU7cohKUlvhgTlgCBW87QDY42Cs4ldJQfrOMFfH
	RocE/5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urs3H-00000004XuR-2J6Y;
	Fri, 29 Aug 2025 05:53:31 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urrxY-00000004XN3-0KFb
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Aug 2025 05:47:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-327705d0a9bso1585970a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Aug 2025 22:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756446455; x=1757051255; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SVM2NB/+Q5TwegaC+cQ6efQn2fgkr/tPokgrfCaQZxo=;
        b=ln/Lle5vWmcBTBxvjq65wnw2L9W01MNvpvnSwriqEzwMnI3mFZVpBD62tsKLY/4BQr
         VPbcbIJKA6p9LCIUK6hdi/x5HCwuECAykcX2HwzLr/nFoSUAGqvf0O/LwoQy+wefBZIs
         OxifSMboHt4r/RwaKRz8dSbrARxXss12RA7DIhX/Sf4af8wpo8xdEu1BqYmttLQvpwa5
         n0S279z6eklUIrAdM7uJghfOx85Z7Ilf/EdaNtbjv+FmMtZ73EnaOG2YM7Uv+rUMLD3G
         aCUGHPoV4mFEcUXJHrcYFQj1XA/KkzFiO/ewAFDkY6hNoNpO4R8ELOHPDAOZufzNQBUL
         udMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756446455; x=1757051255;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVM2NB/+Q5TwegaC+cQ6efQn2fgkr/tPokgrfCaQZxo=;
        b=RxuT99r8sHdacEen3jSD8myBcHks6KHKvmlLvYlGUCLHCBHWut0vGVK92MsFCOMGqE
         48FOcEQJrEbjCIRqEFuPmf86Q3WXTJeaDIivR0E5QAXXYTyAqDadaLOXRzlx2+vCX6R7
         elRMjC2VbLbBpKh5hSnSlZXUTYszd/2SEW0JNPbWeub9meBUW3PuwLPDHtbuuyinqq0S
         946+25jGD2zABcR9YJUttSOWbvqqF9YZQllMYRnc04VuiO3N+AuW2gTYNVVNqkeDonO9
         IaYO7ZgB5lJAxKOClqUFypnF2SfstCTHU571T5nXKRG6OFFU3M7Ai16YFtXxMN/ndaL3
         tykQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbQeoRoYmwJrLrmuco8xDNoxUxUnH9jE7E9HzGQxgtmfVBLMqONpEUkEqpEs+8Rtr+9e8DFMbcq5tFrXQxrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2M9uSBrd6/KDZ+I5qMzLtotwvwextfiaMkfLgp0asMi03S0Dw
	lKpXJgoERQWvlIE4NxikBUDy95TYlE1fc039mnlTQRHnc2r3IZjMSG0V/6He1pUWNEA=
X-Gm-Gg: ASbGnctGZ3xnM59Qow9UrYagPpfH8+7tmQX5/F9tf7F8ZEvkCpqYKM0p6+3HQLZ6LLo
	qVqaiBRFSzC+F3LB/ovOV0UPFizgUlCMb6JKgwyZO6IQ8Wq+k2jdXjQaOnEFgk07pyGbic1BRC2
	lGRTZpYH1Ezdzj14oJQZZTy7Kkmyw1bADkUrL4t5/NXiRrSBf/+UJa8ZtX7PI+28HWao9ca4yi+
	+xJCDfCbtZicQiE0edb/HqbnV4lmtyhpP7k3wfnp6vQbLHBvr2AVRVUN4MecMo/1gbDcLaIfoeo
	0X3rmCjHIr+SHqhUxL3j6uXT/KCTCsr1QjE9aQemID+0Pjy1J30qxZus8IpqJtM/pFuhCCK2Xo+
	yO3tDN+gVSSGO7K28kw80VeKbMtOCU257OP4=
X-Google-Smtp-Source: AGHT+IFGFRX8jr8klOJHgeApacbbUnrvb94Dt+QaaXsozbhIjGsZDvjH/LL4aUVoWgpbErAkB6CKrg==
X-Received: by 2002:a17:90b:3c0e:b0:327:dce5:f635 with SMTP id 98e67ed59e1d1-327dce5f897mr3153327a91.25.1756446454625;
        Thu, 28 Aug 2025 22:47:34 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327d93547f4sm1536101a91.11.2025.08.28.22.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:47:33 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:17:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
	"kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
	"cw00.choi@samsung.com" <cw00.choi@samsung.com>,
	Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] cpufreq: mediatek: using global lock avoid race
 condition
Message-ID: <20250829054731.utl6pmgan6sg4mfn@vireshk-i7>
References: <20250219054209.erwfp7sgzchaiuds@vireshk-i7>
 <e8337c5eee0cadb797bacf26b00f1ca303c5147f.camel@mediatek.com>
 <20250321045624.mwm2mnkqeow5uids@vireshk-i7>
 <2a73b5ca35692c8ffa68c9ff0df73e24a592967d.camel@mediatek.com>
 <20250321060148.adhxjexpnm4dkpnt@vireshk-i7>
 <e1c2c12bace22d1803d16ecbfb32129518d87157.camel@mediatek.com>
 <20250324054333.sgwwksawnybx3lp4@vireshk-i7>
 <06356a55cdb3c34dfc716349d1967f95655b0ab2.camel@mediatek.com>
 <20250416080517.feansrkpycsynk6t@vireshk-i7>
 <CAGXv+5FyR8bt16nLvS0V=_YRWM6G7V0OOpxctA+_4hVnnCjDtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGXv+5FyR8bt16nLvS0V=_YRWM6G7V0OOpxctA+_4hVnnCjDtg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_224736_124610_212261CA 
X-CRM114-Status: GOOD (  19.46  )
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

On 28-08-25, 15:26, Chen-Yu Tsai wrote:
> Maybe a different set of eyes will help. I talked to Chun-Jen offline,
> and I'll try to explain what I understand.
> 
> First of all, the issue lies not in cpufreq, but in the CCI devfreq,
> and how the passive devfreq governor is linked to cpufreq.
> 
> The CCI hardware unit on the MT8186 is sensitive to frequency changes.
> If the performance level of the CCI unit is much lower than either
> of the CPU clusters, it  will hard hang the whole system. So the CCI
> devfreq must always take into account the performance level of both
> clusters, or in other words the settings of both cpufreq policies.
> 
> Since the cpufreq policies only serialize with themselves, it is possible
> for one policy to change and trigger a devfreq update, and when the
> CCI devfreq driver is doing its calculations, the other policy changes
> and causes a big deviation from the assumed performance levels, leaving the
> CCI into a non-matching performance level and causing a system hang.
> 
> So I think we need to handle CPUFREQ_PRECHANGE events for the frequency
> increase direction, as well as enlarging the devfreq mutex to cover
> the CPU frequency tracking bits in the passive governor.
> 
> I hope that makes sense.

If some sort of serialization is required in the CCI driver, then a
lock must be present there to prevent the issues.

-- 
viresh

