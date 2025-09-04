Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D97CA1002
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Sep 2025 04:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Npc2kRdoiAQT8Oq6xsDbKE8d7v4q00xjFvwRzwJUB5g=; b=q8c8r8P89Bp+ihfs0iMp37MRJ4
	iGRRDVRefBZLaYBNn8cMmzXOwVEk5wzk+Ideu1hBZ6MVhN23rVOHLhtkHber71OUPvzVO5N5u+K2D
	AciGHTXwKSLI5trMXdD5DEsaPB9ckjFANf9JFW7OWM3qDxdth0oFJEAXbUeA56Sv+igHwchB+rH5M
	nNx2s+Oip4aL+hpzBHVFC6goSjrTLlt4o2IolCV6ZhnooDCQNslx6Za7LyWpWv5lFWNrfKRy0VNsy
	PDPxMNZrUvhzR3j1YGdBqIJyKmKenuhSuhulqZKhR++TfU+WZ0EwjhjfAC5aEglWVkbh9eLZvXb5V
	ZHLSbBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1yy-0000000969q-0MFW;
	Thu, 04 Sep 2025 04:54:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu1wE-000000095FP-3pjj
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Sep 2025 04:51:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2445824dc27so6280385ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Sep 2025 21:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756961470; x=1757566270; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Npc2kRdoiAQT8Oq6xsDbKE8d7v4q00xjFvwRzwJUB5g=;
        b=H+BiOpmSzq7EiPFvxaAjaMhPUzfYzxW5ORNmhUQRzIarr/DJ+D7HpIhYQX8QKRdKyp
         6zaxclZbqJmY4uM2y/x5L7Q6PolIxgjKaNXflnwZL35vOTLewPQn+dh2TwjleL/g10tN
         OXm+F5Zj6qsNn4ZtRXWwtv9zhQqdF0HXoBsAjfhsnQowjJmA3R8DNY7fBuuYoVULwJUq
         LyBnxUzFy4VVJF542298dg3XiSOXUUtLiUxrKI7wRQUWAXFBTiHKPyqFferPzdr+Nuv2
         vsJM4wgHEDi9CUsi7DTM94NHOF9zU9OQoDR5/K7nLu/s9K9JAG8Wy0aIOZ/7Jl0fY9la
         njew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756961470; x=1757566270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Npc2kRdoiAQT8Oq6xsDbKE8d7v4q00xjFvwRzwJUB5g=;
        b=UzfhhUVK7hdTAHBr1QonGfwOf5UsyjTUgalAWgTJ8KndoufqE6nMvDYb1cmV2ks8GF
         uj+KQrzVszQ6ljeD6MAUpFUFjclZaEQwM+/AQDmxtgsKETiZMfHm1HVU6pF2RR4PYMCx
         jXVcT2/Lqn1qNJB2apzrQ4233IL9Dqoe3KDEc9LJC/YJv7zBYqhvhqjjSall/xlwe/BL
         GBc/PQcdtoHW8bFPaBmWP6Bi30lw9pfqLF8s6bBmZjIUlxqUxcN4cmVWNpGwsfOrmxSO
         uZmz1KcmqWpJ9mpvP0Kn/aNhaFF2DLUDIPWlxx6v4zM6R7SLawFs7GYWahAIINxRP13w
         XTCQ==
X-Forwarded-Encrypted: i=1; AJvYcCViPGNDDEbE2m7lnwpoCd1fJzbmMKTIbvJ5kxi1FUP9WhXgluqllOzI8nOPv48oEtZpKsaUAOefOjBxgfQVJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfLENGDu6S4qFmPgLNZku4/UwZHURJThUT8wkfOm9gQzh5Lmw2
	5EEfj3OgtBiwFtufRbIh+m2qe12JF4FPbB6XtsNpsEV/R3AmQFkm9l1Nh/aGMwNtsTk=
X-Gm-Gg: ASbGncs/boJakNEtOVYD07LcrNrOMjNcHbz8CP666/NWRsF6N9CcFCAETZwnpA0wlwF
	zAkCy7OsebJc2AGRJGeW4RUoB9/WQgzpcfxR1UQl9LgWGjw0xXAELgo2cJ7f9xbAAs4qS9eUqpr
	1MHcuDC2Bzui1nVVpBbh6jTeK8iQe8c5k8XUKerIazWsubFXWl+NRvRdbbZ/PA5HlTRSJ5Du3g2
	/267VKW3AuS7zYQrAvlb9oTw54R1ziturDEQ02Cl8zfRzx+x7pwo4xqIYMWUXKiZTqPTHR9aUI2
	Z34UFHfkK52diVbH9ix2khK+bNYXDSTE97MwcC/YqOyzc7SIoN3E5A040HfrhEphlUpK7kBBuyN
	vbzOTCqOuCHH+G/qCSLtclXh5BfDxFFjym/s=
X-Google-Smtp-Source: AGHT+IE8fhkKtW59L/QwQVMzIGYIlMT+Sa1j2ECntDz+uUUuSYYnswDb8stymALrifXH0JUgm5Q2WA==
X-Received: by 2002:a17:902:d501:b0:245:f1bb:9bf9 with SMTP id d9443c01a7336-24944870959mr275858785ad.12.1756961469626;
        Wed, 03 Sep 2025 21:51:09 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490648c89bsm177058085ad.109.2025.09.03.21.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 21:51:08 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:21:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:CPU FREQUENCY SCALING FRAMEWORK" <linux-pm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] cpufreq: mediatek: avoid redundant conditions
Message-ID: <20250904045107.rweiwjv3glbehuwb@vireshk-i7>
References: <20250903121228.385766-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903121228.385766-1-liaoyuanhong@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_215110_947013_2B5F9A62 
X-CRM114-Status: GOOD (  15.58  )
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

On 03-09-25, 20:12, Liao Yuanhong wrote:
> While 'if (i <= 0) ... else if (i > 0) ...' is technically equivalent to
> 'if (i <= 0) ... else ...', the latter is vastly easier to read because
> it avoids writing out a condition that is unnecessary. Let's drop such
> unnecessary conditions.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index fae062a6431f..00de1166188a 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -123,7 +123,7 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>  						      soc_data->sram_max_volt);
>  				return ret;
>  			}
> -		} else if (pre_vproc > new_vproc) {
> +		} else {
>  			vproc = max(new_vproc,
>  				    pre_vsram - soc_data->max_volt_shift);
>  			ret = regulator_set_voltage(proc_reg, vproc,

Applied. Thanks.

-- 
viresh

