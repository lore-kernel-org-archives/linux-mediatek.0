Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5AEC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 06:18:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6156B61998
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 06:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6156B61998
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ycq9R4ypUGCq8ItxVuOb5fUKmYxFVQO3T5zHW3+whXI=; b=dsqiJ4T6IRE6xsln/JFc1P46E
	a+DhJfuisGDSi8PzY6dn50m6TaKE4jYf2NVXwI9qDjg57FTrhxtfYpf9J++MZ5BiX0tI452GKXkFL
	awgL97BpnvIWBH1YwiUx3iMbznGrDbJ1Q67jcUKiiA8lBq6bm3UQa7hQDbhv6Fn0Z6dmrT6TtXU40
	vIGXtQi34uPWq4GZua76YD5eiV/YPRIooBCtspQk6AdX4T1riL3XUef+GMgWF4VxlHatpVihYUdNo
	GX1STLP/UJyvseu52ihO0KE3fwg773Yqr14zaJHFcP3/wk6sjrFgiuvQAhCGQP3Oc35Hc/van+8En
	ujswco+Xg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRUAo-005bLx-V7; Wed, 31 Mar 2021 06:17:51 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRUAb-005bL0-FA
 for linux-mediatek@lists.infradead.org; Wed, 31 Mar 2021 06:17:39 +0000
Received: by mail-pg1-x529.google.com with SMTP id q10so2252929pgj.2
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Mar 2021 23:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0F12Kqjhl0+Wf+5+6nbUD2UhZbKGbE/zQkJq2rrwfrg=;
 b=ETKZ6m2dIhEdGl7lpyRoB2yUuf70I1IvaCTOjGvIMaaKvmtRKgBNwRrZiHlHFF9FLC
 5IC6C4vdPQfEv6N9iSc4Y/a+GHyAnDa/WQP8QCEuA2JeHJ0tCQd1PCs2hm37m3a83FdG
 lUJN2la5H5SNG9ca4n6Gvz2gWOCHTXI7Hqt1+547fOpkVLYFjK4s4Kab7qcoYbhdF8kt
 R/dbJehnFZVN2FS2VWRKYZ+5jEYXJif9lA1zRfNYdQQ/Db8fExQuFG8WIr7VffGYuHqL
 Gep9ggHp2FyYVKkJYhQjfi6+fmWJ3Q2h/mPQ9LOZPSrL7WZsQ/H4gU4xespePd5Be6Ke
 hjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0F12Kqjhl0+Wf+5+6nbUD2UhZbKGbE/zQkJq2rrwfrg=;
 b=hkTqXdrd3CpOlNnLwmpndtleiViex1qFLtNFoUGSfNAaCLk9YHcTlTNeLHUiUfDFLF
 swP8oBfMn9lrUxbmYUmUiEjI3kCh5ZmyUvD0XBJfdZbDA6UkyIBfsBhqPPUaHdiAm6iw
 EAw6OUredRNtBFW+RwMoW5H5QXSqJ0F0RRSdp+gIx2xmBozVWqahpUQKka+F9npAdvMc
 mThHLjcMGxzAv18ZcLs4JqnsPVu9ULLhHTrq4pWvPU1PqHEfAAAxikGVRZzTVPND6xli
 2YHxiok8tVo6Hiy7Qa4IKY7F7q9GD8a2O5gTmrIQeepxxGQHzmJvWYMIPcM01k/Ynjyl
 TIcg==
X-Gm-Message-State: AOAM532U4YkIGtw0jwtXLOxrofF8P3dbo2M77ifdrTvyCIc/qRPV+ebE
 PTQns8qpa/Re4Qzb9Pkhy5UXyQ==
X-Google-Smtp-Source: ABdhPJyUuKeYXCKEUA4NkOYUgk8Iyh6P7JgE4L/NH6X8jw8VdbsGYKbm85djXpBaeUhPOWcYBHroZA==
X-Received: by 2002:a63:1820:: with SMTP id y32mr1724701pgl.157.1617171454697; 
 Tue, 30 Mar 2021 23:17:34 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id d6sm902402pfn.197.2021.03.30.23.17.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Mar 2021 23:17:34 -0700 (PDT)
Date: Wed, 31 Mar 2021 11:47:32 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "andrew-sh.cheng" <andrew-sh.cheng@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH V8 2/8] cpufreq: mediatek: Enable clock and regulator
Message-ID: <20210331061732.c7rfrzehcqo62ndc@vireshk-i7>
References: <1616499241-4906-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1616499241-4906-3-git-send-email-andrew-sh.cheng@mediatek.com>
 <20210330043629.x62j2apv2nv4mw67@vireshk-i7>
 <1617168099.18405.8.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617168099.18405.8.camel@mtksdaap41>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_071737_757825_31A7D2A7 
X-CRM114-Status: GOOD (  14.10  )
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

On 31-03-21, 13:21, andrew-sh.cheng wrote:
> Hi Viresh,
> Yes.
> As you mentioned, it will be enable by OPP core.
> 
> Per discuss with hotplug owner and regulator owner,
> they suggest that "users should not suppose other module, will enable
> regulators for them".
> They suggest to add enable_regulator here.

Which is fine if the modules in question aren't closely related to each other,
but OPP core and cpufreq are too closely bound to each other. So much that the
cpufreq driver can depend on the OPP core for doing it.

Though I won't Nack a patch just for that, but it was just a suggestion.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
