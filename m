Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE9BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 10:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADzuzYOmqe8Yiid2jcoK2pob4gye8uK0hbv5APaOYe4=; b=jGghOhsREQa3eo
	JZTQGBLUi/X3R5yGe6C/m/sJXGB1YBHAJpUbAFv/pgDSmZkBfN6kcRUIRQmS86NI2aFWjSksqf6VU
	9E06KVV60QXQcgwIzYAKG0r/m5ekvxBwC6uAoN+d/CZklbVEbZkUg9bRGhLodWBsSDZXTYhQeZeXO
	dp4lKiPd7E79mUyXJ1zFGZypYvAC93GpQ6wFE1TopUNWlVoGUX8gdaUdzmaDJ6dbAk+CHd2aYDf3F
	Fvsaxjsz3Oz71BrhQ5qTZM4PtfIRRM2MbTJzQzJQZ8BU2KM6rLxiIJQLgp2J5cksJTjHMkBVuKf4X
	789zJmD413IIqRnIf6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nivXS-0092vc-N6; Mon, 25 Apr 2022 10:01:50 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nivWi-0092Z5-D8
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 10:01:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id n8so25934388plh.1
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 03:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PApZnh3qRXman8Ophw4OOA7A/2sG8ifMcY3MbuoLa18=;
 b=pcQbwIzZ8x74dXgdi7OBlsMWpxbq8EDM9028htUhVGWemcyFCvsSP1XLm4Wn9i+oum
 LYJgF3S0BjrgnyvGmCAXpd7yTc86lesWt8fXZETMqA4vNYgT4yopSZROF+Y5hTMHNUlO
 RpIVMVboBu8c4OUzgtL0HRmXSjqwwr/rek3H978V1531j83iVL3NH+6i0rqcIP3rvzrq
 LhvLHDu5PFV8vdQZ645/tcvXcnIKr/zZW69GPJfX4z4ZUTBu7pxPkJPog+0edRvuJDyh
 HJ9DzKY80rW+SPmGRxKuPilEu+gGfhj0caRZb+YfR/vWhRwZeNH/3OROVsQ1sUOwe2uS
 10rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PApZnh3qRXman8Ophw4OOA7A/2sG8ifMcY3MbuoLa18=;
 b=AMjPw1ADZDzdDZ0INVqpo0IVYfqoxZ4QDEse/uj24q77Z3xq3MYJ/KXTQeNl29mui3
 UB5mNafDJaz/F0RUKabCygRgIS8QS7jqKeo0Aign08CgrpziOb/zph0rwoCvwzO/h9ub
 t1GiLICZZLlDjmjV+0MU8gtq76cMgpd//aSkAtX9AdwMOrFOMiXh8kzxLrZ3oFWQ8+mS
 va2SUrLYxehQw/+mDVQK7LEe11UK8MfkZl3AWUht8jdyr8e1ocF5Ir6cH/I4pkQOGXFU
 nEr/7848bAFMDO/+lcj/WjdMhbRPrXXmtb9iL7GxswSMOaqZIGRcpuZbtzr5eneYEpjp
 Tx+Q==
X-Gm-Message-State: AOAM532a9KKO91WxvmTllEZcEnuHCjxt7fogRiiFCyvmfIpCl2NDJv19
 c/yrkjBV0HRdg6a3FV+b49I2dw==
X-Google-Smtp-Source: ABdhPJzQojLiY848HqAktLkmWjk+9Gu/+RD85Df6pBBCgMUEKyHRB6p3bOCBqDrMilhn2Wj8891rlw==
X-Received: by 2002:a17:902:b586:b0:159:684:c522 with SMTP id
 a6-20020a170902b58600b001590684c522mr17046705pls.39.1650880861518; 
 Mon, 25 Apr 2022 03:01:01 -0700 (PDT)
Received: from localhost ([122.171.250.232]) by smtp.gmail.com with ESMTPSA id
 bh3-20020a056a02020300b00378b62df320sm9207671pgb.73.2022.04.25.03.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 03:01:01 -0700 (PDT)
Date: Mon, 25 Apr 2022 15:30:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
Message-ID: <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_030105_352101_27078F03 
X-CRM114-Status: GOOD (  15.91  )
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

On 25-04-22, 17:34, Rex-BC Chen wrote:
> We found that the pulses of cpu voltage could be observed when
> frequency is fixed (scaling_max_freq == scaling_min_freq) if using
> cpufreq_generic_get as '.get' callback in MT8186.
> cpufreq framework will constantly (~ 1 sec) call 'update' if the policy

Which function gets called here in that case ? I would expect
cpufreq_driver_target() to not make a call to MTK driver in that case, after it
finds that new and old frequency are same (it will check the corresponding freq
from cpufreq table).

> frequency is NOT equal to hardware frequency in
> cpufreq_verify_current_freq.
> The problem is that there might be a tiny difference between the policy
> frequency and the hardware frequency even they are very close.
> e.g. policy frequency is 500,000,000 Hz however, hardware frequency is
> 499,999,726 Hz for MT8186 opp15.
> 
> To prevent the voltage pulses, we currently use the software cached
> values as you pointed out.
> I wonder is it possible to add a tolerence for checking difference
> between policy frequency and hardware frequency in cpufreq framework so
> that we can use cpufreq_generic_get as callback without pulse issue.
> Or any suggestion would be appreciated.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
