Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FCAC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:16:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B00321D7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z6TQF1Un";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WTIVIGAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B00321D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U7q6Jb8LS8Vj2PDwXm3ji2JtV5bbrjwgPYcAui789pc=; b=Z6TQF1UnZTbYVzd1pi0gkM3W+
	8z7aiAsqdYevVAgl50ng+BRVHpnkHHBUQIEafGBDLpvWFY/tQHrdnvtEDeNZldNISlJErTItGfLQp
	HValIBjiXLrlkgrirzO2UfAmfdMsyxvFmbHWGFfYJXI3TxUprI4Tfs5pCCNY+uzmYF65Y2r+AtkRz
	3Gu0h7Ne1jC4FmVQkFGODhI6hw8hWPYMwpRsfQQOjWV1R0d67woQ9L4voykMVtfz1BR4G7Ts+Y62o
	uJlVI5Tda9ZZ8RNMtGqSXjF56WSCcUDpWSQefcAnxkwqYBA8ygGhsFh/ScVBLQVJHlWBarHpT/DbF
	tBfv0eEgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLh2B-0002mA-6F; Fri, 25 Sep 2020 06:16:43 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLh1O-0002OX-O1
 for linux-mediatek@lists.infradead.org; Fri, 25 Sep 2020 06:15:58 +0000
Received: by mail-pg1-x543.google.com with SMTP id m34so1641904pgl.9
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 23:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sFDqhTWwq0aXbG+fWoeTT2wJdl6mRz17hLrTzSVAK+8=;
 b=WTIVIGAF8OuXN7pfm1xe0I3K+SU7Q8sUkg5Vex08vfqC+KKp92yK0Uxe3SaT97bMWi
 qvK6AHoegm7OPPTjLaJmZDHLHLjg0DplxVTXor8kynxX9WTzKdq/VXEOHA7dUW3hD3O9
 4ktDnP01VzHZslBWMpJlU5ef0raOz135iKFjEy/hrcfIrQ2rg0YqmkHPVHddlCe4zqsj
 1ukeQdXUTvcU8B1Wt/Ae7Svtaux4DpHl9gzQkQQmbplPJxeIjOTtFJmTDzwJ3CkKmSyZ
 5jzpWdI/OTghnqcxouBUNla4KuWi+GKh4t3M0Nf1F9ayUk3Zic5s0tk3xX+pVpG7H6qe
 3yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sFDqhTWwq0aXbG+fWoeTT2wJdl6mRz17hLrTzSVAK+8=;
 b=WsdoRUUQD3JEBgEZm4nOwTIovseRGdgOx79wswIMP9iE6ubQREj8mPltZxwWl9bYX7
 patPxvLsCBMks7EhlR6v1JhrVrDLkRUIq6/TagxGaXMeJEgbHhxGfhVkhubssddvaK/W
 zwOCtxJFtInaz0qoLg8bHkriShxnQ9U7r1YK54Xb2PlpnDuHZZ8zhtrZdy8SfXGDo33Z
 cW6Q058Wf+/2o+KhNd7nTMTRu5K1iSfHqHHnnaa8EEx2a8Xk03nJqQ0EZA54pGo9IFtI
 nKGEbRdEbkHSIcrjEqHa5w+Oagr9xcGOSiaD8xV+wao4EcAqbBqLRgKas8j1n55Tupx8
 epMQ==
X-Gm-Message-State: AOAM533ZbMENhY91aCzeKmu9ZJoT9AzqZMKLhWCMZ0GsavdsvpyMtQT/
 yB7+HIwkDE8wtoPzOibb/kodoA==
X-Google-Smtp-Source: ABdhPJwLTkRlOrK4LFHv28M0c20AUtX5UgY6Rg7+xHPiT/uw8gq2AOfK8YUc1BXr+ogR2OkzhZVJhw==
X-Received: by 2002:a62:7fcf:0:b029:151:15e0:ab82 with SMTP id
 a198-20020a627fcf0000b029015115e0ab82mr2726264pfd.80.1601014550164; 
 Thu, 24 Sep 2020 23:15:50 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id t3sm1001649pje.43.2020.09.24.23.15.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 23:15:49 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:45:43 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: cpufreq: add bindings for MediaTek
 cpufreq HW
Message-ID: <20200925061543.5hxs3ija2y53gzea@vireshk-i7>
References: <1599712262-8819-1-git-send-email-hector.yuan@mediatek.com>
 <1599712262-8819-3-git-send-email-hector.yuan@mediatek.com>
 <20200922202852.GA3134161@bogus>
 <1600866614.21446.18.camel@mtkswgap22>
 <1601000847.21446.34.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601000847.21446.34.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_021554_915567_62B47A81 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: Rob Herring <robh@kernel.org>, wsd_upstream@mediatek.com,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25-09-20, 10:27, Hector Yuan wrote:
> Hi, Viresh & Rob Sir:
> 
> I will change frequency domain to below and define it in cpufreq_hw
> schema rather than cpu node.
> 
> mediatek,freq-domain-0 = <&cpu0>, <&cpu1>;

I think it would be better to do it the standard way we have done it elsewhere.
i.e. follow Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.txt, that
is similar to what you did earlier.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
