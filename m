Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AC8C6FA8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 07:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C53HtJ4DBXLp5KOrDxIzDofJkGbHCKgUwuQc6lINrPY=; b=1dXqxDi/Izrf7DlRFeIibu3IZq
	a1mptaxWzzDULevlrJUP+qfvuNGRfvpq8vcydnJ43bxS8LObkeZcQ4Zpi9kmbWS7ArZmJ0PnpfmVn
	tDyC73MswBBRqGViOqsyETyuVQkNpIbI+N4n0B/1BNCkw2ANrMRa+Ad1lwuzZTTugQJrxZIX9+V7h
	o1/jcOnecvGJ+m3V5cYEdhhVChtUaTmtP3V4GtzjXFkNazGIE+1+7C7KM/0sdMyc7Gy+5/v1uy3Rg
	VRSdZWyQDltKMf0soU5M8owXUb8mGg/NZi6lPYX2as2fPlxPhjYCANmCIab4UX32as0I6auqij+7u
	9K4aS2+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qass8-00Auls-0B;
	Tue, 29 Aug 2023 07:10:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qass4-00AukI-0d
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 07:10:41 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso24378705ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Aug 2023 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693293025; x=1693897825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C53HtJ4DBXLp5KOrDxIzDofJkGbHCKgUwuQc6lINrPY=;
        b=c2LIbqdddC/y2boPhFLZSexkGaPMRzHa8WBhpPU/dW/a1f+8kRJLcS5xeC9Dz1Xt0i
         kVQI60RWq3RglgpsDAdIOVu/qtFEGCiXv1k1tA9zZ+vMW7HMsyOb2ucU0qFSVXsf5yqs
         HvQctBh4rFsG4XqD29Qi/93xA9En5ppiUAWnoF027+qsXQpMg6LHoBv+mrrB0TLl8Gvu
         6UV4wXKad8NkX8mcsag2nTs0P3L8RQPBXcStzhAhJA0cDbkqJnzAYWxSDHHpLYNptwxe
         Q84WBFj+ut/8CPX+ez4ka/+f+Hyw6GMD4E20P/C0vtNAg1rBXfxhKZ0y4DYfJEE70QlZ
         sOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693293025; x=1693897825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C53HtJ4DBXLp5KOrDxIzDofJkGbHCKgUwuQc6lINrPY=;
        b=R3LJRA5ksSEZT2lbtqHTnyAos7UYnZoEqjAeF+jDZVSVUcXkGi//1v+ldu96wvr5G/
         zUjsI0YpDmjRQusITOabSNOKCl6mP7R2RS9cKWmqokbrrVEi18+ir9c5ggL69v98Fvv1
         DS+ZztHlN68AUBun5lJSIi/FJTD2bMXizYA6QXxCxmOvWsJk6e54M5vl9Z1cORmref4m
         BCqfBO4SHQgTMHWviMcwwpUApl2bD4hzIKXAtTrKMcDQYj++RkVPheEwAhoCjgydV+jg
         Wqljq1Jeaf/xW1BCVCS46wfgfHpu9LRqcIEbkDqp8qpKPGI2b3XiqiR5fDU/T0tA8quM
         8/tw==
X-Gm-Message-State: AOJu0Yw41URN/bMMx3GRBjQLIv7So6Otkin9ZcCNFwgCpLZntYwvHGmG
	tfPfch0Zhj6zs6DSGH/4uqyevw==
X-Google-Smtp-Source: AGHT+IHbCUZX7SB7d9rJn3PhB9G08weUn078u6BH0+hYz6BRc/zp44JVfzvbFSI9yBYXEOv8nDZEbg==
X-Received: by 2002:a17:902:f7ca:b0:1c0:cf84:c9d2 with SMTP id h10-20020a170902f7ca00b001c0cf84c9d2mr8913767plw.8.1693293024989;
        Tue, 29 Aug 2023 00:10:24 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b001bf095dfb79sm8578085plf.235.2023.08.29.00.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 00:10:24 -0700 (PDT)
Date: Tue, 29 Aug 2023 12:40:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chun-Jen Tseng =?utf-8?B?KOabvuS/iuS7gSk=?= <Chun-Jen.Tseng@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"sumitg@nvidia.com" <sumitg@nvidia.com>,
	"sanjayc@nvidia.com" <sanjayc@nvidia.com>,
	"rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"rafael@kernel.org" <rafael@kernel.org>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] cpufreq: mediatek: change transition delay for MT8186
Message-ID: <20230829071022.n7wubb2dhbt3ukyk@vireshk-i7>
References: <20230818020616.4748-1-chun-jen.tseng@mediatek.com>
 <20230828063904.r7huxclehlblkkjx@vireshk-i7>
 <86f49ce84f32941185c961da8a5c671e7aed46b1.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86f49ce84f32941185c961da8a5c671e7aed46b1.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_001040_312539_DD44F66B 
X-CRM114-Status: GOOD (  15.52  )
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

On 29-08-23, 06:57, Chun-Jen Tseng (曾俊仁) wrote:
> For MT8186 set freq must Big CPU -> Little CPU -> CCI like this order
> and it 
> takes 10 ms.
> 
> But in cpufreq & devfreq flow , when Big CPU or Little CPU change freq
> , it will call
> CCI setting by different policy. It will become Big CPU -> CCI setting
> or Little CPU ->
> CCI setting. Howevery, It will cause CCI setting to wrong value when
> per 1ms call governor
> and change freq.
 
> this patch (44295af5019f) , fixed cpufreq_out_of_sync() condition from
> 1000 Mhz to 1 Mhz.
> So, when cpufreq_verify_current_freq() call clk_get_rate() over 1 Mhz,
> it must to do freq sync
> by cpufreq_out_of_sync(). In MT8186, it offen over 1 Mhz when call
> clk_get_rate(), so I modify
> transition delay from 1 ms to 10 ms for make sure freq setting done. 
 
> In MT8186, if CCI freq is lower than Bit CPU freq 70%, it will causes
> kernel panic
> on Big CPU.

Okay, I get it now. First of all, the kernel shouldn't crash because
of a simple delay anywhere, like the latency delay here. If that is
happening it means something else is wrong somewhere else.

From what I understand now, your CCI have a constraint compared to the
frequency of the BIG CPU (and little CPU too). You need something else
that guarantees that the CCI is always configured in the right range.
Perhaps a devfreq governor or something else that takes care of this.
It shall evaluate the next state based on both big and little CPU
frequencies and not only the caller via which we reached CCI. Please
see how others have solved this.

I am very sure this is working by chance here and will break with some
other delay somewhere else. Fix the real cause of it.

-- 
viresh

