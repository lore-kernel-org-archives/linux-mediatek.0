Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DC2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 09:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tv0U1kOt+uC3qL6S+XsyZLn5Rz4tZRWgkTQXuDEVGa8=; b=aeNEAkPIr6TPFt
	Gdc4iGwaPbQdkSwtMFE3DtfZha2JFskV+E6K/g9ubm2rEE7eIhMcAwiW9YbQjoMW18n7ZLM4smJzv
	19/7YBc9BbT10uwd1Lt7DfswOHDG0F980DUgr903XY4JncAfFGqF7qGORLSVB4TJrg1S/gLtMDHEk
	eHETXh8AAK3JxB7Cy6O4ZJa5drhJhzCoDpkdNe+sd4ZRWyp8ThGmaAnCyWgSmYArHkoWzK1kscrny
	zRr2Z5jjEd1bsP4EGH3013d9W/XcqqJ7w0V29UUBGe+64mkfpYA7+1qx3ZF+AMmfmd0Ev2dJBiEaO
	DcpVdJcwCmBV4QJeNQcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noLuu-000lCE-B0; Tue, 10 May 2022 09:12:28 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noLuj-000l8k-Ax
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 09:12:18 +0000
Received: by mail-pg1-x531.google.com with SMTP id g184so11645717pgc.1
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=h0/eXylGNAueAU7FrP3IwXCzMzPqW0qtEOPvWEn2U/M=;
 b=DDh5nMeA6yw8EpZ5Xio66OeElfarNGX6D3MwNsbrwQg5KDtHnLf8dfABDTPQsu9zEC
 d6mUPKf8S7KYg4No/NGrHavkomljB+a98GUyKTMe1GjOHPmhd8T3QoWTAWPbvQ2eV3Ld
 D1HtbikX8cG1Ws2uTs6IfbDhldPnMvNYS8sAyw+HhD0nNJOSRJpF8BipKmQvNFqjjXkS
 9pOECntNvD8itxByuRh6+Z+CoP6fh9eB4taXrK990uU+Vgjei3K5uoJE33MakXUlkHJT
 WFyy6slKYGwxAPF2bNMusmbTv33ZC5iZq90anRHt7AoQleiwNtcSjiM0CPIiBHGWoseq
 MWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=h0/eXylGNAueAU7FrP3IwXCzMzPqW0qtEOPvWEn2U/M=;
 b=zS5GXC+qc+pjNjTjaTB9OUv9ZqhKqPtfvsGo+Eo2Okw/XrSemK+37RizhzEjHCa7p7
 x80ewGjRunXrzPQF3ywZ0+fO5BBQoQOp1IHpk1oyjlR70wZIvUmBoJ5P+TZglpPaP3vc
 UbVrlyM0gYeushEsneR67iKc3OnY6aHAaXg+tnrQLrF7VVa8kpO7OBGh4htMyndX89OG
 4mF+5IpKp6tP8rJL2UhviCN1RSu4ByY72VtDc/jA9aLy4svaurKJfOFWM/YPUk1eTnIi
 gJqRNKM2DM3LzvJ3DfoqjNrIQ8YsHm1v8sX4xkYB2J8jqwyDLLc39iljk1hNx7M3Yt3g
 aRFw==
X-Gm-Message-State: AOAM530tqpNmE6Nj5O/cwN7XZyyr2CgCZFG/3vnu4txisiCbjeg4LaSI
 zCsKOV+dKcXw92YU7XejhdEfpw==
X-Google-Smtp-Source: ABdhPJx78FuXlWndkKECQOsIhgGXq9UcykG/wSe+ro44JBVrYFG0rAyOoZd3XA5plb4FlldILbDgPA==
X-Received: by 2002:a63:7450:0:b0:3c6:234f:e70a with SMTP id
 e16-20020a637450000000b003c6234fe70amr16398793pgn.619.1652173934523; 
 Tue, 10 May 2022 02:12:14 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 ob12-20020a17090b390c00b001d95c09f877sm1289808pjb.35.2022.05.10.02.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 02:12:14 -0700 (PDT)
Date: Tue, 10 May 2022 14:42:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
Message-ID: <20220510091212.olrvvjlx4jtm7zw2@vireshk-i7>
References: <20220510090531.12438-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220510090531.12438-1-wanjiabing@vivo.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_021217_401977_BCE9B01F 
X-CRM114-Status: UNSURE (   9.37  )
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

On 10-05-22, 17:05, Wan Jiabing wrote:
> Fix following coccichek error:
> ./drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on line
> ./drivers/cpufreq/mediatek-cpufreq.c:208:2-8: preceding lock on line
> 
> mutex_lock is acquired but not released before return.
> Use 'goto out' to help releasing the mutex_lock.
> 
> Fixes: c210063b40ac ("cpufreq: mediatek: Add opp notification support")
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

You should have added the review tag you received.

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
