Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CC0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 03:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6AjCpOuUVRNnUVLwQ0P+HbtabkkxgCNVJ11aphg7rt8=; b=HiNMRwaV/m4jf9
	aA4GEEmMz1pHDdxz+NdYgHXeAxo5eLohta+rJ7W0GRqLBY2qSIN9/aNTv2aQ/2GzjAxPTPEEEX/3N
	eXkGvW410TOKKA1fPr9xajMNID4JLwSlMtbJ73tS1IkeXiq1rCvYM38skBaoJ/g6ZXUziLmIORuZZ
	VgIJQ/PPuuoUxEGF4LWdXbcRgHdEaWMmdL4G8iHEjHKPO+A+jd21Xgk1jnVyJRfHnuM7HVu7LmHmm
	BIoH7BBQspYqqxQaOyVAasHtGIxCQNjt63eyMBgLQGlSgP64V5dkq4J6zvkwPjcOs+jPE0dlQWm/7
	VSzuIA5m78Ivzjnag4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njY5t-00H8Yy-65; Wed, 27 Apr 2022 03:11:57 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njY5i-00H8WI-G8
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 03:11:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id j8so440058pll.11
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 20:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QeLNBCirVB+9azObthHDc+zDjnH2MBnHQLYuB1xHpSg=;
 b=LauZkNXFuJxaHO6AZzzSQgT1RBnzkVe5AbyhIWjE+cpUPZuWrYw7k821kWGkOnIuE3
 m/JeFVATc5PxS0lQ887DbBw5TVS/eqya/BvOe3aA6XPgTag2bL9kb7jEf/kMG4bgT9+n
 nZ4Pz/7m5DTWrrhU+lVyo01hBxzoezE3kQRPJtik54IIGjq118i9mOUrWBOOqsEzyOMX
 ig2zp9I6b1JafAnW9a+BENcFZ4C2riyTniq/P446KJ60roW7SyNUDvtC1mYPejb7zbKT
 sT6Q5G19soERJMdKju6fH5HpCCcnGBh6ZC1knxH5n9BRqbbiYBU6dJDqTM/+fmMdDQwv
 rovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QeLNBCirVB+9azObthHDc+zDjnH2MBnHQLYuB1xHpSg=;
 b=eMI3+mFgvnHWaeXbDV9Hsd5rtmesgjWC5p3Zds6rgjXXqrHx991ACKOzJ3aIG3zE/m
 hZBnum/CUnymNRfgQbttpuhzkeSKD2BK7Y8uHRpwMYw9N3yNP13rlGbxuHyFCAB/j/zz
 79IX0U9XNZRqWhuwHvsCFCG54MiX5uBKFzLJ95t8+7YK0tnD8Y303b2NUcbkrMTU0FE9
 Tz/m8JVyAvDzdNvodwom7P/nUSYZ32gQoGav2oDrH3rT5+Tq7mKTPHLz4BYlG8tsdbGy
 dqYSMclt7+y8ky+dgyhf0gpvO5vFayFzy4EUF1unKkS+p5klG+Ezw4p5caSdIR1L85dG
 DuGQ==
X-Gm-Message-State: AOAM531LkKeloyR0E8vlGGB6pGMPLilHYexwTUsyA+w6S5G33FFRf59B
 30/8NMf7Wzy1MVOgmSdNppp/3w==
X-Google-Smtp-Source: ABdhPJzIzlWaNfocqWrXkXaX43UuhbhI/L6BzhFoDVBeU6ZHYI+09qW0rRQP2y7SIq2VIL6q5Hfmtw==
X-Received: by 2002:a17:90a:3486:b0:1d9:3abd:42ed with SMTP id
 p6-20020a17090a348600b001d93abd42edmr22017909pjb.32.1651029104494; 
 Tue, 26 Apr 2022 20:11:44 -0700 (PDT)
Received: from localhost ([122.177.141.190]) by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm16544735pfh.46.2022.04.26.20.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 20:11:43 -0700 (PDT)
Date: Wed, 27 Apr 2022 08:41:41 +0530
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
Message-ID: <20220427031141.or2owu5wrh2cadfo@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
 <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
 <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_201146_562571_9B886394 
X-CRM114-Status: GOOD (  13.48  )
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

On 26-04-22, 19:13, Rex-BC Chen wrote:
> We have a non-upstream driver which tries to get frequency by
> 'cpufreq_get'.

This is the right thing to do there.

> When we use that non-upstream driver, 'cpufreq_verify_current_freq'
> will be further invoked by 'cpufreq_get' and it would cause voltage
> pulse issue as I described previously.

I see this will eventually resolve to __cpufreq_driver_target(), which
should return without any frequency updates.

What do you mean by "voltage pulse" here? What actually happens which
you want to avoid.

> Therefore, we apply the solution in this series.

I won't call it a solution but a Bug as .get() is supposed to read
real freq of the hardware.

> Recently, we found that using 'cpufreq_generic_get' directly in our
> non-upstream driver can do the same thing without pulse issue.

That would be an abuse of the cpufreq_generic_get() API. It is ONLY
allowed to be used while setting .get callback in the driver.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
