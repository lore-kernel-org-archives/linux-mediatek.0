Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F485C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:38:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B8521527
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 08:38:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QihW100T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZh++Pak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B8521527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/yOQzVLSAkjIZoqKV/oW7yjaPuxgpTfsBMaTmAe0UhU=; b=QihW100T9r2WbfNcd9ril6u0O
	lPfGXsuULyv2UPHnhG7ZFGFfRYiV8Y5wLQNOZvERuXpOCTmh4JCvOLUHGneABrIZBd6C755NJkTFt
	yVbQAcdEmTQ0I4Z/7gx6J7mtelfopGMsr8en08kACBVcaPq48Yl4X71nyXEcttuHbyqATXZGQTyuq
	Y2r+IJ78h2gK7lYa2dBmPZP4eXPfN+5yGWQWimkmorzUH0KDFM2zR7U5a/Kc5gLvvPw/l7fVIkQy2
	Xy0EHU+3oDTpYSpCN8bx1idAoLsmbS586OEZzpJomxXr1ACdDUuQVFs8pE5vq3CQsBx9U1RXrnpS9
	3FDWLUBvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVsaI-0002pJ-Sy; Fri, 23 Oct 2020 08:38:03 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVsaE-0002nK-1S
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 08:37:58 +0000
Received: by mail-pg1-x544.google.com with SMTP id n16so645838pgv.13
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 01:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Va8ts6a4Am407gshGkf677mIZGRewAIXYF9e6UNiPl8=;
 b=qZh++PakWDfWQaCPx4PHufb8MscJWFMsERaUAmsnmx5/i0aQAt6Ax9EpCQgK72uNJI
 bOYCzGhW6fWDIHmEYxxjTPGsUk4lypFdANrpHVO28k3V+m/zxTWAsro6g1gBlfFbi7+B
 QmWfgHkBMTXbQcs16d8Mn7jZIdYL1ZuGi1s+4PdYr/Ufxn73fw44wdPAMA9ZSM+7dF18
 cKHUKW6UomOwHzJOFUEBgHwe+UqfJe9ImDQGYW20rflFNFZMoSn+dEk8x1PF13wN0h38
 1skEBLQU7Xx7YIXW4sAOw8bOfHLQQFUS9OJyplUGM5vW6rSJCaKb4d3TASSD6m+qtzJ+
 PWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Va8ts6a4Am407gshGkf677mIZGRewAIXYF9e6UNiPl8=;
 b=eZWFU8EXulebRpz5hgCQ6iyJ3a6K0jEevxzbqBg6J3mm7e2YMP3pbnFJ2PyEfUFjfa
 Ru08GukL2xs9yO8GYFKW7KRhu7BkwSL7vph5zH5qPSv9H7ripZBl2rBS+ICs13yFePyQ
 DMmLCVVNouxwxa44KobCiYXlwAHp5W8mKE73rOEnyI8aiCbwoXTigtLlga1zRpmVEIty
 qw7lhv9UlhYoASGBtH+m+dIMfJ4zanp9/ZBvKcinzXM9NncXz99OG25wpyNv85sSlz5b
 SWEur2MUdIG5dQlyFPh6Rs07P/NH1ijv3wD1gjVWIuuQEw7SiyYVqD8iGpbeMkXIt4dC
 6OaQ==
X-Gm-Message-State: AOAM530w20gA+CEC6KcZQcJ2u9ecKSmZA5xnbLBK1v5tqpH94JJqyFLq
 QgP/4svPXaGpEFu+YDQi3Ceo8A==
X-Google-Smtp-Source: ABdhPJzvwM7agBM8o5iD2nhR22zj6lxjJQ41h59XnY+6Mh7VdeZdilMlX2MulKBFEniL7EkdoXa8pg==
X-Received: by 2002:a17:90a:6ba7:: with SMTP id
 w36mr1300199pjj.12.1603442275873; 
 Fri, 23 Oct 2020 01:37:55 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id w17sm1302824pjq.42.2020.10.23.01.37.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 01:37:54 -0700 (PDT)
Date: Fri, 23 Oct 2020 14:07:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1 5/6] cpufreq: mediatek-hw: Add SVS CPU initialization
Message-ID: <20201023083752.bvs4oabbsdzlnnip@vireshk-i7>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <1603441493-18554-6-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603441493-18554-6-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_043758_101286_98560E23 
X-CRM114-Status: GOOD (  10.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dave Gerlach <d-gerlach@ti.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23-10-20, 16:24, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Use pm_qos to block cpu-idle state for SVS initializing.
> CPUs must be in power on state when doing SVS.
> Add polling ack while coufreq hw is ready.(SVS init done)

Why is this required ?

And when you send the next version, please send a single patch for the
cpufreq-driver by merging all of these together.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
