Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A452C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 04:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSjkijO5Zy4jC5pgMr0KgKfpMH1RooGu/uVDt0zSCW0=; b=gZA540I+gN1E03
	LP3wQC/8LT+uloWvIIbaHdk6eB0lndbg66XKRTunKHSlVaSJiFSjJKHtcwT9Pc7cMjp7NNPsP3SEX
	D7V2XaQU5ExGH6q9HhMuMCObGsO6JX2jlVJK17AjRJjYncNAvkjsmv2Ru7eKNlHRbbHdXA9J+OzCJ
	ygz9ETPFzEm0QU2A9BYx/te+5vnWscAcu8dVlTKoHRodkXjvYYtXfeuUVqW/PAowbR7wl+waWJlpU
	/3bMcqh2WCpUtoxS3bHDwwiu8eG76Pc+OgAQAWGMZabQ0WnMmJDoAly/H7gPhvdP3mVJJb1Z10D99
	QLghKL7tvuOeWpom5akA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmpIQ-001HXb-AY; Fri, 06 May 2022 04:10:26 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmpIG-001HT0-LN
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 04:10:18 +0000
Received: by mail-pf1-x42c.google.com with SMTP id j6so5270204pfe.13
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 21:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HWTXD5zHq3nd78I0G2fQMtnfTf3zPffmr3z3YODc2yE=;
 b=aR0VAQ9OF8rz6eQoqyBQTSUoRG1tLt8chlxZ7ClCT/tuhYEdA3a5Gh/iaELz13eEkr
 PBavQpH1sdaY3bEweCwZWdgIhFSfB/YYlZl2qjgtO7BExLo5nu/9IO+RhHqMhDE5ZdbH
 vvnGCIfOhBJph1IlZfdMCOgYrJnnX9v5wDmlHyplO/9ZLQp/NUkxuWjWri+UdXFGVuv9
 b2J8stRaPwjuTj3Y69zqMCHZghk1X5tLqyTi38zyJOz6TZ13XByZe4OeAPc7ZvszAuaz
 UKpY4h35iS/5mRA9+AdvBVAMTNYCrNCPDeawqkhL7M34fFcF+936qQ+ZqmBBCkGu4lQt
 5Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HWTXD5zHq3nd78I0G2fQMtnfTf3zPffmr3z3YODc2yE=;
 b=QXj8U9Shpdupz8/lktbzsY6yF5yvSo1vmX/4zveO9c17mrgktDrNnpwGutG3YRtCE0
 h4U+MwJ0mhbHUhh0wgWggmT/QG2hULXEDXRNbUNWUu5gZg2gKrEfiQttockBnF2VDLAB
 36l4C9xMT0Ghq8APZ4XMQ3whopCL9slEna6QAy/cZF87GgQSm9cI/blz0+Jr7SH7vgFg
 M2Ntt62rcDHWcPtufqzlhhGkFPGo1mw9Ak3+Zu2EsNuX14f9gwsaro60GvasuewEXLn9
 FVP/Jf7+oi1c6QTcDLL5Gq/2BQEdC+AC0jIbRo8ImBDQIWzIr2LN86VCNvBILwZUvnB3
 WoHw==
X-Gm-Message-State: AOAM532gkL75ghosUOQSo8Fi+hx0hub9oxu+suBsiBaCBrI9Lx2iE1Q0
 o84GDNSx5v4lsOtjO7+osM5h0A==
X-Google-Smtp-Source: ABdhPJyPhc9ZE92xdZuHazul24NTSEAlSyUkTK1yoU17JLWDhr1xi6vZM3E6tgyq2zn7V0wXzXZyrg==
X-Received: by 2002:a05:6a00:bd9:b0:50e:dad:b285 with SMTP id
 x25-20020a056a000bd900b0050e0dadb285mr1439657pfu.40.1651810213390; 
 Thu, 05 May 2022 21:10:13 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 iy11-20020a17090b16cb00b001dc37aef4ffsm2347771pjb.48.2022.05.05.21.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 21:10:12 -0700 (PDT)
Date: Fri, 6 May 2022 09:40:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 03/10] cpufreq: mediatek: Move voltage limits to
 platform data
Message-ID: <20220506041011.kbqawkzquyzo7yfq@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505115226.20130-4-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_211016_730543_FDD579F2 
X-CRM114-Status: UNSURE (   9.72  )
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

On 05-05-22, 19:52, Rex-BC Chen wrote:
> Voltages and shifts are defined as macros originally.
> There are different requirements of these values for each MediaTek SoCs.
> Therefore, we add the platform data and move these values into it.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 84 +++++++++++++++++++++---------
>  1 file changed, 58 insertions(+), 26 deletions(-)

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
