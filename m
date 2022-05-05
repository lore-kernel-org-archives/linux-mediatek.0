Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AFAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwkWtxAIZdvhsVwGRxRKCc9t2R5XlST6yEXpdFDtVxo=; b=iq9gAC8Bptjrzc
	cky6lxmF3YzWB3qRyXcb4sSNx9uRndjP4BqFsoNCfRCBbjmXTZWC2AfnCgy/EH6xt7i7qRJkWVwxY
	co6Tmen24D0X4mIB01wyzqf38OyaH+xM8iDdtDts7g2iyDoNKNXEOUyv1lkYeld0aiVF2U+x6xNJ0
	XSIwfmbrrHmtFjzzI+r6Oml90G+j/7w8JhdQzIbfzl/BJ0q/87Ng0efzT4sTDsXpjAb9avWh69pcO
	/waMDnEZa4nIqX6bswfyNOlRlf/LdJRrNQT9IP487T4fs+asHgC0sld+ho7y+yGTJApdMuU1eCTK0
	iTrkbIhXh6lK4TyaAkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmXFa-00ErUP-CW; Thu, 05 May 2022 08:54:18 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmXFK-00ErLc-M3
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:54:04 +0000
Received: by mail-pg1-x52f.google.com with SMTP id e5so3159585pgc.5
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 01:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qsLVNCQbuqNelZfcG6SxH1A2kbkVX6IY27mcYuqmtzk=;
 b=hEBwtnbs2qsJgQ6Y3heHEf4jDHU69XMtUIPlTYr5E7Mwo4jsLOvz9FxXKLh854/sPQ
 bK9Gth2BLbto3q5+hQvwkKFE0dqt69oDvPedSJ95mr00ChZWS7EjAd9igGYRkKqQAsd2
 vAVyvodLYegU7aQNOfH9d6ESJyo/NghjtPrDm0OMGoQMhnk5/kgeq78jU0UexUtklvQN
 d8zh2PCMSOdzz4IpQCwJg/wqploxBlOovLM3o+VWlvLV2uJwjYt47XwBQAalSI8d0Vpi
 TjzqvaTSJuNxVpU96Oe1mAeBPa+GHUVLTiH5mTlQqpBjgFaBrB/3szDYyIUbhacHXiBC
 hoNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qsLVNCQbuqNelZfcG6SxH1A2kbkVX6IY27mcYuqmtzk=;
 b=wAYTPFQOWBt1BxOIb3IeExrEI5WTBx0jM+FK4XgLimhaqvc7a2lG0++ZGHJE7/MZBS
 I60K0la0MnwAy3AsdTxYH5zqO5pSzTViGs6/YjVH8HjJU3NmPAZMC572OULHOrwZ9qSE
 qsYVWAPg4EYyM6ZQ/5dcBXNpx1kpnacp8oKNJLyMRR/tv/OuRZmVIcR6AsWcavRbV0QX
 UOkeNUd85kopaQuTP5w+RDUjotcDCdxk6NS0vY5zYKIRsCF+CUY7ZvvOiJsyQ22cF1Tc
 wc2HszCxojiurWLaJSwZUiMfHo1KRbtjxM2YTUBt7AWCXLjBJWUGSjJ7oIpQLSXeoLik
 gRjA==
X-Gm-Message-State: AOAM5329g43RgmMcj8yQ4zxRFKpLhtPAEtUk3+S+ql7/Vg7HtLoGqKIv
 OowXTdjJuikHnl6gLLqU6TZVJg==
X-Google-Smtp-Source: ABdhPJxx/Nw6BtoZublv6LltW3nNlrc2IvnZviGEus5evK/SUN+o7dLcUxn30ZDTaOdfsZ3C01YK6w==
X-Received: by 2002:a62:8684:0:b0:50d:972b:d9d2 with SMTP id
 x126-20020a628684000000b0050d972bd9d2mr24615633pfd.4.1651740841059; 
 Thu, 05 May 2022 01:54:01 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 t22-20020a1709028c9600b0015e8d4eb1ecsm955056plo.54.2022.05.05.01.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 01:54:00 -0700 (PDT)
Date: Thu, 5 May 2022 14:23:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v5 0/9] cpufreq: mediatek: Cleanup and support MT8183 and
 MT8186
Message-ID: <20220505085358.nmohfx3akk7to46r@vireshk-i7>
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_015402_752694_1C5C768D 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 04-05-22, 21:05, Rex-BC Chen wrote:
>   arm64: dts: mediatek: Add opp table and clock property for MT8183
>     cpufreq
>   arm64: dts: mediatek: Add MediaTek CCI node for MT8183
>   arm64: dts: mediatek: Add mediatek,cci property for MT8183 cpufreq

I guess these would also go through my tree? Please get them acked by
SoC maintainers.

I would also need an Ack from Rob for the binding patch.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
