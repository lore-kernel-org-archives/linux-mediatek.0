Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E09C83F14
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 08:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxEvsNmBX1w/FxBOil6ywt2JzLvDO2Z9SpnBsUOMs/g=; b=cLUwl6RMI/vjcHgmy53pJXJxyc
	p1SHIJEjIi+BTuBQxeiIX0duItFRTUbP9qJlmBxKRgAAuUw51L28mEOzgNogu6fX0eJDPZFwaXeYT
	zSw8ft7C5fPykKqSjpK9U6zfNln+Hsj9fiFLM6kO3LtqLn60QSreXajomqXbHvCmaQAFq7fAx1Hwa
	YXAZBlRcNPPp4YZZIX+EiqCsT4tihde9UUU2rTU0hewFVPt8E7TO/nMcFLwRghBQGmUU3oSk5mx3a
	Q4G9og9RDKcTtks67FQNR0fmd+EP/O3M2lpoL2I7/ElSRGcqRyOr4+F8TE56rd59HoYN1ySGH6PLq
	NHO3sF7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qau8p-00B2Zd-1Y;
	Tue, 29 Aug 2023 08:32:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qau8m-00B2Yj-3D
	for linux-mediatek@lists.infradead.org;
	Tue, 29 Aug 2023 08:32:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-68bed286169so3572849b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Aug 2023 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693297917; x=1693902717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kxEvsNmBX1w/FxBOil6ywt2JzLvDO2Z9SpnBsUOMs/g=;
        b=Wg9YQW19Ga4tL5U4iicqXb5DnAOusUtkmDRn1qpV7pcDkElGX3fU6xvrduZd+v2bNQ
         54DR1LvFSBNBYHpkGgyPd4uu2HG3+6L5nDJJDZs0cn0S2k7ILRz4MqlHDqU+e7qaVzs6
         4SatVTRK8vCHErExeGOq08+vO2jNNU+qGwE7xeOGhQwyD1hxWr1WhTnSaTQaoP7YWhnt
         A5BlAaFz0vX0qRQD80A4JPpHzrK9jhUypK5DxHB0fKV+CI+sivRBHjOT6VinaRyKTIom
         2BqpWXDiWP+oCdmo9IL/Z4+0lMZiJ01H+AYDoIG738kZApHE+fZ3uOln+DgjxAb1xa3F
         mBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693297917; x=1693902717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxEvsNmBX1w/FxBOil6ywt2JzLvDO2Z9SpnBsUOMs/g=;
        b=GJnZlpd7wL5zA2YkOJFb0kK2VDuDzgG5gjBMCaQTnC9knMxgLVc1AK2G0jhY1U8JLl
         iIazMSurEGxMLXvVdCktSUOMU/bAP8Yi1Vrqcqmta8+/arJTKKPNNQTIDFhpzgq0f+j1
         yPHLbF+PH4UDyjF0UuNDXW7AwTfCsxb17n4f+XTT5Fnpp+DGw9XSROwwddWgXOtqkAhz
         qXHgjtB9B27qIaHWVp1IYvqtXhlzTxxa5bALhnArDoIWbmM8JZ4SN5OEdUBEm1yKLe6o
         Pz64v4joVX5dZU+GFCLCa2iVH3CSt36CNTMaaDgs+CxPxeP6SWOlHzEcfayWPNCY/Kl3
         27Sw==
X-Gm-Message-State: AOJu0YxcDuJQ/V+6/YFpqQhgCLzwXWBcm8BUQreH8wTVhgDYCjYvjSod
	R7FrUVU4dHTNUW97oeF3yplBiQ==
X-Google-Smtp-Source: AGHT+IH3Bc9VVldqwH6h3JKmUdZSrwY9deKbBhswjSLhSRD2dJd7heOvhVyrXTB8OXkJSJk/Ino3vQ==
X-Received: by 2002:a05:6a00:1702:b0:68a:2c24:57df with SMTP id h2-20020a056a00170200b0068a2c2457dfmr32445133pfc.7.1693297916743;
        Tue, 29 Aug 2023 01:31:56 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id u24-20020a62ed18000000b0068620bee456sm7818917pfh.209.2023.08.29.01.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 01:31:56 -0700 (PDT)
Date: Tue, 29 Aug 2023 14:01:54 +0530
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
Message-ID: <20230829083154.27ckyuwnqk4zpejs@vireshk-i7>
References: <20230818020616.4748-1-chun-jen.tseng@mediatek.com>
 <20230828063904.r7huxclehlblkkjx@vireshk-i7>
 <86f49ce84f32941185c961da8a5c671e7aed46b1.camel@mediatek.com>
 <20230829071022.n7wubb2dhbt3ukyk@vireshk-i7>
 <d0745e1cee9fae33252bb8d3db741c2a463983d6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0745e1cee9fae33252bb8d3db741c2a463983d6.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_013201_034863_13314D35 
X-CRM114-Status: GOOD (  12.95  )
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

On 29-08-23, 08:25, Chun-Jen Tseng (曾俊仁) wrote:
> Actually, the root cause is the CPU freq setting finish time. If MT8186
> needs 10 ms for two clusters findish setting CPU clock done, I should
> set transition delay 10 ms which avoid call clk_get_rate() get previous
> clock value. If I get previous CPU clock and it over 1 Mhz, the
> cpufreq_out_of_sync() will set CPU freq again but it wrong CPU freq.

Even if another attempt is made to update the frequency, it shouldn't
result in crashing the kernel. If it crashes, then there is something
wrong here.

> Howervery, transition delay seting is by individual SoC , it should not
> force 1 ms for all SoC. So, I wish I can do this patch here.

Its fine if you want to make it 1 second too :), the only thing is
that you should do it for the right reason and I don't think we know
it yet.

Why exactly does the kernel crash here ? Any idea ?

-- 
viresh

