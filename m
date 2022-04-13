Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17ADC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 21:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6m5EJNTid7WvkHa/xCwR2+ilgn0XjQ0S6pd6gaKgIgY=; b=p7XaDCYCOpNlf0
	+LaSfvnfLTCl5cOMjKFytpc5wyhc6djXKhCNa88JSGFP1FmG9MjfU0oPvr9Fs8lplgNjqtCEJlUgX
	G56mfQgbloiDKtO51Fl0poI3wiqp1s0V+6HgzRUCqYXFEWn0M5XKOuQGJMhZv9z4PCgVFNTNMQTIz
	14j8Dm5y0U8Omn6hR/e10h49nGFSRGdof6AwJILJD3mXskKnjKQkb7y+dOLp72/dd2u7RzzZEDHS3
	I/AUKQtDRVUCiRjrqPVqBi+/skYUJn/xb57PxuHU8TlP2AlvAdfUeYW3rngtJWTeuMJwmJztRBks+
	PIwvLDLGyp13ZYaGNYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nekk2-002lFm-Lo; Wed, 13 Apr 2022 21:41:34 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nekjy-002lEt-RB
 for linux-mediatek@lists.infradead.org; Wed, 13 Apr 2022 21:41:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id ll10so3277889pjb.5
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Apr 2022 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=SfoDmkk530wshO3slXTZtiI0F2WjtIKkqUFd0Gpj3l0=;
 b=0Vl0rKzEHtcgIFrinPbJd5uJsmwc724wKh4qfOM8rKzFHmxW8UZoO6IAqF9wBLu34d
 pPV6iyo01K/E7H8ZiavcBMdqf0CRkaSQbhjSJJRj7Ts19En0qGBww8lWX29+l14gN6vW
 cksutE4ofHqbv6clurhG64VqK8dHsYYhdWqKAYrm8jRYX2VsBYzs30yXnjNIMTwMlYS+
 hwSbvSDSHZHpY7kWBKPzl46VqWuCg7TBzx/LxVGaeNYoHbskbjlOThWen3A3l3rAtrwe
 0m5tm6avY1ERvUDpkLksEEoZtmBtn/nxciulWQcxSbtGmXqeEnXFxVKDMtgcGSyHgqWh
 YNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=SfoDmkk530wshO3slXTZtiI0F2WjtIKkqUFd0Gpj3l0=;
 b=fm0UIvfCOnGXkV2y/4cb5Ne+drTT5bUneR8KyTLwW6PrSgmB3nngHbfgWGZ18x/Xfk
 UN9nBgUn5OHbS3DBko6OT+5+q0BFQ7O8Tf3nQ6QMvEtuJBd6rkchl9AENdchsEfJ1kG9
 QdhPjmjfgFeDZF52r88z+tqx33wKUVuk3Co6L4+Cm7qen6+AjecRvbST/LZoJyqK9fHy
 QW6USS0ghg2QYvcR5qGViKcA6m5cyWGUanrNuZIkGo3Zlc2GVP6gBPHggc1qsPZ3bBXe
 sDxRRJ1vUAbKxG8fHImuV0SP1rce18F+F/jk1WgBKOBLDR1QO/RKGHp698SKoYk6KM6f
 aT1w==
X-Gm-Message-State: AOAM530KoWcAQLH6TCfUGFVpKECSu0JwM0IXL5cZbNeM6xtxBpjkLfu5
 /k5TQcxMatFjLHJmQKkZ93paMypbCNrOkA==
X-Google-Smtp-Source: ABdhPJyGFmnzNC3pTBW2D7XaCwphac5mMo0z2X+wQ7DzCjDKA2ZH9jGplIWSOU9tVq6aTFlgaVJTCw==
X-Received: by 2002:a17:902:cec4:b0:158:5584:7c46 with SMTP id
 d4-20020a170902cec400b0015855847c46mr18784795plg.80.1649886088253; 
 Wed, 13 Apr 2022 14:41:28 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 j13-20020a17090a840d00b001ca89db9e6esm24311pjn.19.2022.04.13.14.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 14:41:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
In-Reply-To: <98957e61b040b6c5b6a6b39e6eb661e07e510277.camel@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-14-rex-bc.chen@mediatek.com>
 <7hfsmn5m9f.fsf@baylibre.com>
 <bc6dd020a1cc3f00f5be2bf2929046b9116bbeef.camel@mediatek.com>
 <7hwnfv4hfr.fsf@baylibre.com>
 <f00e3df2e270e5edc160f8ff1bd8c52a49bf71d5.camel@mediatek.com>
 <7h5yne3zlx.fsf@baylibre.com>
 <98957e61b040b6c5b6a6b39e6eb661e07e510277.camel@mediatek.com>
Date: Wed, 13 Apr 2022 14:41:27 -0700
Message-ID: <7hlew83blk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_144131_140486_1F7F8096 
X-CRM114-Status: GOOD (  18.23  )
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

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

[...]

> From the Chanwoo's devfreq passive govonor series, it's impossible to
> let cci devreq probed done before cpufreq because the passive govonor
> will search for cpufreq node and use it.
>
> Ref: function: cpufreq_passive_register_notifier()
>
> https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/?h=devfreq-testing&id=b670978ddc43eb0c60735c3af6e4a370603ab673

Well this is a problem, because CCI depends on CPUfreq, but CPUfreq
depends on CCI, so one of them has to load and then wait for the other.

> After I discuss with Angelo and Jia-wei, we think we are keeping the
> function in target_index and if the cci is not ready we will use the
> voltage which is set by bootloader to prevent high freqeuncy low
> voltage crash. And then we can keep seting the target frequency.
>
 > We assume the setting of bootloader is correct and we can do this.

I'm still not crazy about this because you're lying to the CPUfreq
framework.  It's requesting one OPP, but you're not setting that, you're
just keeping the bootloader frequency.

In my earlier reply, I gave two other options for handling this.

1) set a (temporary) constraint on the voltage regulator so that it
cannot change.

or more clean, IMO:

2) set a CPUfreq policy that restricts available OPPs to ones that will
not break CCI.

Either of these solutions allow you to load the CPUfreq driver early,
and then wait for the CCI driver to be ready before removing the
restrictions.

> For the SoCs that including ci hardware (8183 and 8186), we think it's
> not ok if we don't probe cci correctly.
> If we failed to get cci node, I think we sould return -ENODEV and the
> probe of cpufreq failed.
>
> What do you think the solution?

I think it would be better if CPUfreq probes sucessfully, but restricts
the OPPs available until CCI is ready.  If CCI fails to probe/load, you
still have a working CPUfreq driver, it just has a restricted set of
OPPs.

Kevin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
