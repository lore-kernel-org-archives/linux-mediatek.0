Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48189C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESXjylJriheQcxq1lhPV27UMC/ifDFLO7PJ+zllpUWQ=; b=lRjNFaFudREGGq
	7THonwafjfNHyS93bCUBoSfDRKzOsBZSP0LYym2uotAp/YPCf/BMK2P3mwCD9skphPdXMH2hSbuVF
	maahvhmJxvgq1LJpr2B23FZIWiMgKEnmSQHGdabfcjIMU1XqHZj/sXgk4aULBqnAARDdP7CK+Hk91
	ZpF28crijFHshB7/kYCx8GwySxVnBokQSFJBYiupi5LvsqdfUeeBsFnTVkzaMIIqqw06TiFAdUjc0
	a8sGAJ/6nitra2WsfMuAc8p/k0Skj/GZ+FsncG9SeQAsOt4AENLKlHbhESZKWu1WerT1mDf9z2Gqn
	0dB3l0ZUpSfYZ2noh2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk2di-006aWh-Ou; Thu, 28 Apr 2022 11:48:54 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk2dZ-006aT6-7T
 for linux-mediatek@lists.infradead.org; Thu, 28 Apr 2022 11:48:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id o69so2714812pjo.3
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lKWQTGV4dh9PrDo1ht1APvD79N4/klGUKA1N6RBf/GQ=;
 b=G3X+tE3No3MGFynBoTKdGdMfqY90HrjssPASkzvSVM3xa3pYXi6L5rl4CkSVGOR+z+
 ro3lt+PwqdLf+fM7ZKxmcThJNKbQML0/enxTqS50zC4K2hTQcvOt5pxHARNiLVnp9go6
 bL9CKShiWf9WpdXYz4FEgwYeQuM3jLB5igxWwvUMTRop1jMp7JKES0USBPgplpvHCD5B
 WKJZlv0BZVL/6km57R0RivFmVwL+azaU9mWB+VXd92FVWxDUu4qoQzjXk+Kn6xj2ujXS
 fktKKtimTGWrvth41l0ji77mmg+KgJDLWuaxWxQGc1mNEKUqApeJtr8jCBy1bqKY6L1k
 Injw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lKWQTGV4dh9PrDo1ht1APvD79N4/klGUKA1N6RBf/GQ=;
 b=Lh15JgDc9w9d8vENHpDeWRneUirYRjQDrb59vV53aNyAFEO0YTkWkgRayoRnBF34kf
 avqhehRGYDDzd1NdXjANmAw9evcjXKn1puMT8omoYDgVfs6JkBqr4DXPkjxTDIs6+WGE
 gCxLw+Lf8ABgkUKGsEuXCco8kCpnLss+kC0HeovqoMxnCyUTfyuhKKh6fwddvpQcDm7N
 bch1T7+2mtMvlXN82cBQWjse6AEUAyv8Sx29VEMdxk4MluoYJJmYWKFAvJaU289tFg9z
 jLBLXODaLxRMyFjqNB6yZ2LpqtBKvijRMFRDhoX/qvtfmk2yHKvyagYbBJxT0vNXw35c
 jfvA==
X-Gm-Message-State: AOAM531aSPqyeZVByo0jlmdIqf+JZ+C5PqY7fj4PkwgsaNJpqSUHmeXI
 8whs9hg/55g6YdTLOAz5hH7bUw==
X-Google-Smtp-Source: ABdhPJwfNlUrhObS4CNeZo5g5yFfXpFAPhyzjjlLtni25rafO48eOSIBrFIVd2rGxVJZL+uDhGhNbQ==
X-Received: by 2002:a17:90b:3442:b0:1d9:8af8:2913 with SMTP id
 lj2-20020a17090b344200b001d98af82913mr20231216pjb.199.1651146518157; 
 Thu, 28 Apr 2022 04:48:38 -0700 (PDT)
Received: from localhost ([122.162.207.161]) by smtp.gmail.com with ESMTPSA id
 k21-20020a63d855000000b003c14af5063fsm2654765pgj.87.2022.04.28.04.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 04:48:37 -0700 (PDT)
Date: Thu, 28 Apr 2022 17:18:35 +0530
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
Message-ID: <20220428114835.3ktimyz2tzzqdcbg@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-8-rex-bc.chen@mediatek.com>
 <20220425053548.72w2jh2g6lpzgz6g@vireshk-i7>
 <64c690e8edf493ec0a4a14e0fdaad2d8e88e6da7.camel@mediatek.com>
 <20220425100058.4kbvmpi63ygni6k5@vireshk-i7>
 <078b1f9b39690da98cbd3c4528ba28374a097083.camel@mediatek.com>
 <20220427031141.or2owu5wrh2cadfo@vireshk-i7>
 <346736a339bed576817179ded3795d61f71fa06a.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <346736a339bed576817179ded3795d61f71fa06a.camel@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_044845_320515_C58844B7 
X-CRM114-Status: GOOD (  22.28  )
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

On 28-04-22, 19:16, Rex-BC Chen wrote:
> Yes, the call stack will eventually go to __cpufreq_driver_target.
> However, we can observe the mismatch between target_freq and policy-cur 
> with a tiny difference.
> e.g.
> [ 553.065356] cpufreq: target for CPU 0: 500000 kHz, relation 0,
> requested 500000 kHz
> [ 553.066366] cpufreq: target_freq/policy->cur: 500000/499999 kHz

So you are trying to set the frequency to 500 MHz now, but policy->cur says it
is 499 MHz.

> We check the assignment of policy->cur could be either from
> cpufreq_driver->get_intermediate or from cpufreq_driver->get.

policy->cur is set only at two places, in your case:
- CPUFREQ_POSTCHANGE
- cpufreq_online()

From what I understand, it is possible that cpufreq_online() is setting your
frequency to 499999 (once at boot), but as soon as a frequency change has
happened after that, policy->cur should be set to 500 MHz and you should see
this problem only once.

From CPUFREQ_POSTCHANGE notifier, we always set policy->cur from the table
itself, which should be 500000 MHz.

I wonder how you see policy->cur to be 499999 here. Does this happen only once ?
Or repeatedly ?

> But it is strange to have the frequency value like 499999 kHz.
> Is the result of tiny frequency difference expected from your point of
> view?

Clock driver can give this value, that is fine.

> > What do you mean by "voltage pulse" here? What actually happens which
> > you want to avoid.
> > 
> 
> When cpufreq is fixed to lowest opp, "voltage pulse" is a quick voltage
> rising and falling phenomenon which can be observed if 'cpufreq_get' is
> invoked.

Do check if the call is reaching your driver's ->target_index(), it should be
which it should not, ideally.

> Thank you for sharing the correct information.
> Is it possible to get frequency (API) a simple way, like get current
> opp frequency?

Lets dig/debug a bit further and fix this if a real problem exists.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
