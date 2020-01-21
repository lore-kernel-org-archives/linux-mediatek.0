Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19757C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 09:32:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF36422522
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 09:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KqiYrgEQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="rtcJ+LQl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF36422522
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdxNuHbdB9DyV4UCjShjjn5mPK7KmFg1hcjXDnkt+bs=; b=KqiYrgEQUUr+Ao
	9od5shWQdblY2THGup3A8aPlwspLCn/8aRSdRYA+0A67BDhebTJzcTc0jOGUkLnRful6WMqHtnMTc
	RsKrhd4tGWetdUL2XVH6nqbHHWNo3qrPzePe1RI5VXB5O6tujiQIDRPtxnP/rK2YqlvLZwMubYaNP
	SPJ80H9tEI9xbyRDNEjYAHkHAmr1+2oR/j0LfLBB19CKYx10MO9GhroBjW54OK58xc7xTNtzHYpcd
	AZQAXaQoGERPLDV1xIuHSWXKWYnh4HU5pDvuZ/K7Qpl4h/0QAIhVzzlzTfyZFmVQ6YL6diovzOj6H
	h9s9asgX/uaa9R4D6VpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itptL-0007nq-Uq; Tue, 21 Jan 2020 09:32:11 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itptF-0007md-Vn
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 09:32:10 +0000
Received: by mail-wm1-x342.google.com with SMTP id p17so2192576wma.1
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Jan 2020 01:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=imtrsyE4PqkfOuBH2bEU5/ycShpe5DgMQpGEtomyMa0=;
 b=rtcJ+LQlDZ/dhGfo9Iu5OJd4+HKMy2yzD9iSGdalzOoIEncUjzsz5/aNNTd5RjsSc8
 zO8R7IWeVumQmIJtNgo4RVZt7gUhd5yZRRBQqVDryoKs8BU04+PpGfSZJNvnjsH/62yj
 utNq7GGLPGyTxTb1yb3mltp6nzJAjgAWU6qQKOTamwB12SgQZpUurDCVdShHDY4zSwRt
 27hnYDJCXhMMgdvO1mW+7T9xCr4uphzvbjrusTEF0ylfATpdKENfYomQu6F+lwzn6RUS
 UpDbh4WVRvpRmqp5fb/B2A+GM9Tidwg6k1/Hgf4wLH/tybPmLM/Hd8ve+be8A6ZldBH9
 pQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=imtrsyE4PqkfOuBH2bEU5/ycShpe5DgMQpGEtomyMa0=;
 b=oJ9XiuGHKczWl2jlZ8RNfPi+ljpuCE3c+C+UerKenwtsAW4dRBUC5piUDdCn9M23h8
 QHp2PDXIaBbah12Tr9cBIxVqqiwHJXJFvKImEhqauS9yzmgN4cZ/X2bfiykAXO48hYMa
 0DxqZy9dKBndS24FVBpy8Vo1GUHSA4Cee+gF7+KkX/n5locYwcRWgVKjMrz2dtyAHQSk
 VQyKPlmD3BQlG3nMCbKpzW03Y8O9jI+nNPIBbtOi4YA3BfLr0oVu0svuHJuBCelLDXBd
 uzgvJUVsZKmtedyJvf2ryxqKGKF1dsdUOwEBnW3yQ+HJ+r9N1jQvcOLjJOHVaxqLp1RD
 mqCQ==
X-Gm-Message-State: APjAAAXGVS/wMoqtACO2yEnaf3Ir9Y/QfPNFIgh3FwbUOVEg4oQCE70S
 B4i2gIANcBu+ls2z6HxTezmPzA==
X-Google-Smtp-Source: APXvYqxXLTNXCnqXFHWAqOhNn4BqFUdupPBlV6/fm+9Ho9HF0rYCv/gYw3ZqBCY91j9ikIx2kYRjiw==
X-Received: by 2002:a1c:a584:: with SMTP id o126mr3199652wme.163.1579599122625; 
 Tue, 21 Jan 2020 01:32:02 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id g7sm51210925wrq.21.2020.01.21.01.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 01:32:01 -0800 (PST)
Date: Tue, 21 Jan 2020 09:31:58 +0000
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200121093158.GA154455@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
 <20200120150918.GA164543@google.com>
 <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
 <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_013206_050429_7506ABF6 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Cc: nm@ti.com, juri.lelli@redhat.com, daniel.lezcano@linaro.org,
 peterz@infradead.org, viresh.kumar@linaro.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, Morten.Rasmussen@arm.com,
 robh@kernel.org, amit.kucheria@verdurent.com, vincent.guittot@linaro.org,
 khilman@kernel.org, agross@kernel.org, b.zolnierkie@samsung.com,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com,
 linux-imx@nxp.com, rui.zhang@intel.com, kernel-team@android.com,
 mgorman@suse.de, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Monday 20 Jan 2020 at 18:38:41 (+0000), Lukasz Luba wrote:
> I think we could avoid this additional argument 'cpumask'. I have
> checked the cpufreq_cpu_get function, which should do be good for this:
> 
> ---------->8-------------------------
> static int _get_sharing_cpus(struct device *cpu_dev, struct cpumask *span)
> {
>         struct cpufreq_policy *policy;
> 
>         policy = cpufreq_cpu_get(cpu_dev->id);
>         if (policy) {
>                 cpumask_copy(span, policy->cpus);

That should be with 'policy->related_cpus', but yes if the policy
cpumasks have been populated this approach is OK I think.

>                 cpufreq_cpu_put(policy);
>                 return 0;
>         } else {
>                 return -EINVAL;
>         }
> }
> --------------------------8<-------------------------------

Thanks,
Quentin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
