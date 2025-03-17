Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1373C282EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Mar 2025 06:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/t696LxEbizTgZEO/Thjd7sK7TQiRojJYmJJpO8fsxc=; b=nCpQGYy+wmvjn8AbFaxFN09r3f
	J/kJPCqY/S8R3gXFLetUpDpWAYmq/hnuB2E6SRkjRSlDDGfQnhURbSAaU+YEXzYcY0ri6zexTqg4M
	2kD77/Ti7mEAhGdcX/Ih+7Fcaxxl3M2NuzzXgRVwVPUxHTvIWQDormbL/kfbWlq5y7V5Ox6vkyDrH
	pRcBCKkKZo1yp+0YCu6sC/0glwWCe6ltRJUaAqlnyCxYdccsAOA2hcFiJsG2uXsujusznnUA9JW75
	ZfGkTGYLTCg3nlfwvnz2Iu81+SvSVpGnbGNi1oJwuDebkHX+jclUoYNh4OChSPstr/FJL2RoXTOzw
	qG+ZOWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu3Yx-00000001KcD-41HN;
	Mon, 17 Mar 2025 06:02:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu3XG-00000001KIb-3vQn
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Mar 2025 06:01:16 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22401f4d35aso71113685ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Mar 2025 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742191273; x=1742796073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/t696LxEbizTgZEO/Thjd7sK7TQiRojJYmJJpO8fsxc=;
        b=Il7SAQwmqpRImaDeelC12vE2kKymb9ELxhc/FjHbhp2ATRDzts+N/sxoHZqUbQt5Ql
         RA2lykOzLbyC9sTmkqDjQ76k9I/5ce4a82ZBOn+lyYQ7dIhkjWkY/DHXP4mjDkRlSxjH
         Ce4xadvmYAn+vVQVopAhzioDjCenxj/ufx7NIGMrdtmogc0p0gwGOlRLSwQ6pnpiRji/
         qGZGgN6NS4n/2HzQm5AohOKhW4JId9bCedawyR5w9XfCiGEvNcERWLez+NDRL4AXq8QT
         chcBShk3BwajPiWYvAHqDXWqgU2Qhkr2sVTm/7etWhi179i8d6bmg9nvpMT1aFIU72JO
         1m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742191273; x=1742796073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/t696LxEbizTgZEO/Thjd7sK7TQiRojJYmJJpO8fsxc=;
        b=e8jgYvlLIHjGL4w7oDx+D/MAsOB3hO19brRbI7To8RtRnJQVyC+SzyTOD1eSybuPoB
         24f41KPyZWPuKpr93DcEy8KvvYd4l1oqXnNDIsOox0GlMMQJbzEENSiKFBcgl/h4oM/R
         PSKm3Yej/+waTwZK7R+RUcmNNwHRUQp80/Z/KHZXtEhcuc5ZPZwcuBELQJWAZCU4hEIV
         V8pj5GAO4kMDSyBgJEOmwGhA1l6AlU4oq/+lu3d5MAZn89Qkomrqxl5npySefK3aTSr+
         K7aoDTsSGDkj7ee2duHRsmp9Xjzieb5E2oxIRPCODvegOUoHCwlfDw09YXIQvtNCdG3f
         XlNg==
X-Forwarded-Encrypted: i=1; AJvYcCXeaKsm+UK83mao/4mFOsLJn2iAk6n7IRC3Y9xj2w3l8vn2rmt/40b+GETlxO7K/yYGn3iX0PBR7eNeW2Nc0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiTMl5/bCSmxZP1xD4lDEAjTcAdNt6H5tmGjPpjcZHY6+pLtjA
	Nzz9ZoUCQZGVcHrIsrxli1NEicqbsc2mW7csTRwwWPEm9ACc/+0D451tVyBvpdw=
X-Gm-Gg: ASbGncvRtdALZo8eEIeiMdrbFxNmg+ITAnkxFpNhXdgpCawyLcK1z6ZMAF2h9UuwsUV
	GBqT7p3+p/hQccZv/NX9lQQbs1uaopllJuLjzeyqAoAQTJ+zN/CVn9PffrUjZPBb9nHMH7sePqv
	G2YkgX6q40VCoGV/gC3MLzNNcirH1F801qsg9AOiwO4whbuQ2u1sn4/y3s/q5sdxbUxa+Vocldm
	GFrgTv07t2Q0oWibSgvWV3zOQjz/8tbu4aMpREHa2KUx9djnFrOjs0bYBTW1l6Tv7PV+JHU8wci
	rwLNCGJJpGotpKA7uzjvT+pjVb9qGfkofx8yVWYuOC1pMA==
X-Google-Smtp-Source: AGHT+IGZgTvwmbnlN60aL/w128MQKSBVf0ulmLghu2RqTVsFN9YIVHdgYTn08PK0fXwGZKBluWTVCg==
X-Received: by 2002:a17:902:e74c:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-225e0a40bb3mr160011395ad.12.1742191273540;
        Sun, 16 Mar 2025 23:01:13 -0700 (PDT)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbeb94sm66648165ad.199.2025.03.16.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 23:01:12 -0700 (PDT)
Date: Mon, 17 Mar 2025 11:31:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jacky Bai <ping.bai@nxp.com>
Cc: rafael@kernel.org, sudeep.holla@arm.com, ilia.lin@kernel.org,
	tiny.windzz@gmail.com, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3] cpufreq: Init cpufreq only for present CPUs
Message-ID: <20250317060110.tvjat7ugmaceayyk@vireshk-i7>
References: <20250313013928.529926-1-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313013928.529926-1-ping.bai@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_230115_010381_AF0F3B74 
X-CRM114-Status: GOOD (  12.57  )
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

On 13-03-25, 09:39, Jacky Bai wrote:
> for_each_possible_cpu() is currently used to initialize cpufreq.
> However, in cpu_dev_register_generic(), for_each_present_cpu()
> is used to register CPU devices which means the CPU devices are
> only registered for present CPUs and not all possible CPUs.
> 
> With nosmp or maxcpus=0, only the boot CPU is present, lead
> to the cpufreq probe failure or defer probe due to no cpu device
> available for not present CPUs.
> 
> Change for_each_possible_cpu() to for_each_present_cpu() in the
> above cpufreq drivers to ensure it only registers cpufreq for
> CPUs that are actually present.
> 
> Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DEVICES")
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v3 changes:
>   - refine the changlog to drop the changed driver list.

Applied. Thanks.

-- 
viresh

