Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33686C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4RnN8f28Wulk/jVyz2Pu0AFmL+DKXdhJpmQjHifCIuk=; b=zBw/gGUX+06HgXa0nxAXa8SLsh
	N05L0V8AgTC+ZkJJgZ6fXmvaqrmKZO/jaHbYR41j0RIv5B/HGnUHa5Lo6Zx4426pXG+m9PVcmSXFH
	iBBfl9rpmrhgRyN+8eJ+csHFQ1Q7QR5inqiwKp7ieDftNrNAPHp2EHdMAZs7OKNsiz0U7foFyKjgj
	+vJD0kQbI1yyWK944HOdjKQjzLcM/1bD8zg3/+Q/+meyA931EUBqUSR9R7oYDIOCsjt/Hz1SPVt/B
	V4EiMj2cFdE0J5zIrTAbwJhQy6/LXMKsOosjlnr9AgPxoZfewDiD4ljBOAGOLp8DWkmgZU7qwfImR
	WcZh8IkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66IM-0059vn-5h; Tue, 28 Jun 2022 08:10:02 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o66IJ-0059ud-Dh
	for linux-mediatek@lists.infradead.org; Tue, 28 Jun 2022 08:10:00 +0000
Received: by mail-pj1-x1030.google.com with SMTP id h9-20020a17090a648900b001ecb8596e43so11842670pjj.5
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jun 2022 01:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4RnN8f28Wulk/jVyz2Pu0AFmL+DKXdhJpmQjHifCIuk=;
        b=TtmePMQSWGcgrs/nnw3RcYmNr53evsSLpuxjQykQ5SfqpEh99Fa3BVmYjBrtYZzvE+
         nLgDpPDclC4BDYKmWcL5JnfSMvhOd2XMkCBobJRFN9cdkvvMK0VQHJhtHDQKquA0su04
         WrquO/3bgfDsPdzpvxpBQleO+50guMXUI6+mB3/wNhTnOdPjiiX6ZxeYjRvWx89Azu8W
         JbqdByzF4+jFr8rpzqulKfq3IGBxn4c5eFi11vxu1qx8utmgxXLiaw04dK4kRfNQXVKe
         Qk/VnzKC+3d53gNY9SPQwgx22v3n0hdGOKDYGxOh0agz3KTkNvNyGXNiqC9SpvCLv5w8
         JzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4RnN8f28Wulk/jVyz2Pu0AFmL+DKXdhJpmQjHifCIuk=;
        b=hy1RojfWcLFVdlJDLNqwYzUVAazBBm0qQ7THGMypuCw5IVeH36K9ofz3tVNaMCgUMJ
         NGuXcKoz+Adi27PK9QDjY2NWkqTvy+hrOK8bayrdmTOCJXyUhTrh/qQ04wGyxA1x8U7b
         S1z9wPZl839cqeiFxathO3/i+q9vcgos0tuvChHlXfX4qfUy8kPX3iuZizJqn/0CNzQU
         m9zO8l3BbAxK7ZMq7aju66ylBC7SNiRsiZOQYILIxWeTJtmaYgZw+Rb/nOCBX38Jbc40
         WOHXKlLPIR6BgFqfvO2T27jZGAqKZHe8hN8WP2s+ZDHrhEbRQ8adUD0TaxDHjoKgGNmg
         UOQw==
X-Gm-Message-State: AJIora/xhhAsjdroFcx3RN8JYN86peyOSiurbbXle3m/8SRkyXWN4mkR
	8gTG2HudNC4wnroVic7oW7+n7w==
X-Google-Smtp-Source: AGRyM1taEy9Zc+52VE5JMWnVI0vSslas0OOT9IG6YqrEq6+1e2igaSBqB/cyyIf6cJPCygAwUxwaig==
X-Received: by 2002:a17:902:ea02:b0:16a:4b1d:71d9 with SMTP id s2-20020a170902ea0200b0016a4b1d71d9mr2534420plg.52.1656403798143;
        Tue, 28 Jun 2022 01:09:58 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id a4-20020a62bd04000000b00525714c3e07sm8690147pff.48.2022.06.28.01.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 01:09:57 -0700 (PDT)
Date: Tue, 28 Jun 2022 13:39:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	rex-bc.chen@mediatek.com, jia-wei.chang@mediatek.com,
	angelogioacchino.delregno@collabora.com, khilman@baylibre.com
Subject: Re: [PATCH -next] cpufreq: mediatek: fix error return code in
 mtk_cpu_dvfs_info_init()
Message-ID: <20220628080955.rw7gb3rnmhl7qujw@vireshk-i7>
References: <20220517133450.2266243-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517133450.2266243-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_010959_511002_9ED981A9 
X-CRM114-Status: GOOD (  15.20  )
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

On 17-05-22, 21:34, Yang Yingliang wrote:
> If regulator_get_voltage() fails, it should return the error code in
> mtk_cpu_dvfs_info_init().
> 
> Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 37a1eb20f5ba..3a2be4552020 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -474,6 +474,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  	if (info->soc_data->ccifreq_supported) {
>  		info->vproc_on_boot = regulator_get_voltage(info->proc_reg);
>  		if (info->vproc_on_boot < 0) {
> +			ret = info->vproc_on_boot;
>  			dev_err(info->cpu_dev,
>  				"invalid Vproc value: %d\n", info->vproc_on_boot);
>  			goto out_disable_inter_clock;

Applied. Thanks.

-- 
viresh

