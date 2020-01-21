Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674A6C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 10:10:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E46E20882
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 10:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qcyQFzsV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="iNHLk9So"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E46E20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3A2fRNyehqbhg1xTeZUtrhtFTKRoDgQG9aclSAbviLk=; b=qcyQFzsVshRmGZ
	C+oG+Cs26Ps8xKGj8NU6AblVi2fdPJnt8SNsDTUujvtaJnzmv9UXuPzOFFMjzh9SHYB+Ffr+nhOG4
	K60EYWBa/WnQQC4uiriHu7QcDAnsi/bUv1MRDhPkp2IlDOnLbMyce1qRjjvxPju3SiLpSYHdZ6n4k
	5z/QimX/IgSX0iai97951n0fDzlSXNQlEzhWVAQF6AWBSPw0eeE+90pSZXVcTEGzb8p0I8txN27Sg
	T0VXQGS9BO4ycHZDG3cnfAxNjz7E9nUXTE+wOb8/aOwGDl7xSpAC/bklGAHj+Zoi7WyYMCe/J9pdN
	7ZFSeGRBEvj4Ziq43ZOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itqUc-0004Z8-VD; Tue, 21 Jan 2020 10:10:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itqSy-00022I-NL
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 10:09:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id t2so2498690wrr.1
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Jan 2020 02:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8os47Jh+iH/mWhGJOKaN0Ikowvgw7Dsg6piAesimf+8=;
 b=iNHLk9Soh1BgMmomizmi4fIcor2oN/NsBEzYcXn39v8n4anlIoYM5pz+LSafgd8Spu
 f+S7jCQINFEBJ4GDG4xVgihL44c++E/0Tg7Shs1Ps4QiMQ+Do8ke4XZtb91mtCCPSb17
 8jgPfcy7ylRBXPBUjDLzy7qpdgFjobOdmL+AyehNXUbus45Wmkzcz9npQK6FoRh2lfld
 RgloPfjLJuxfGsc3KMrRsmMDzHu36mcWyIeIyYDOEtja0RuhZt+1QHUg64Sy4nQtummn
 SwblUn6R1sIWp1O85xu9BZGrKNkVu0yj2lUWmC2wFXq9newsw22roQLk7hwpoD5DrjFT
 RJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8os47Jh+iH/mWhGJOKaN0Ikowvgw7Dsg6piAesimf+8=;
 b=AoKf6dEKKhRUGlL7mrKee6uoAFRieP3IIN7PdImmF6woTpZZOua4qf3rgqSGe2b/Zk
 uN8hmIXUY9sq9hWZPpGG0bze2QB6DnSX87TE9xfW65cao/TomUN/fstH6JMts2SX8+XW
 yClENoSAiSBkwzP8ILxeagEWmMorD1e5CUuccSqJRoFexp7mIMr8IWlmQB3yw0auMJIK
 2jU/a7owR+ZFh9DgRrGvK8+718B3iNg86ltO7K1e+0sJ026j80Pj+Y4kSB08JA3k73bD
 hz50Sdo5YuMKok+u2lMXLUanwXesc9pZ6+G3N0X5pzcbrYNrRwCJIFNCEWBwlSiSYGSi
 MlaA==
X-Gm-Message-State: APjAAAUzUNrVQGBy+U3ld68snf/RmlvNBEMXlovf4Z0wvSaj/T2xkg08
 Ty3PkTJN48/wMs6SokKuH7ahlg==
X-Google-Smtp-Source: APXvYqzMOzjFtDVGl6edwO/7tSb9RrQo9+Hb9CFGAJn1i1sGI47f1x+xTj047nTS+b5NOSYS7F4xnw==
X-Received: by 2002:adf:fcc4:: with SMTP id f4mr4493720wrs.247.1579601338751; 
 Tue, 21 Jan 2020 02:08:58 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id u18sm51454016wrt.26.2020.01.21.02.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 02:08:58 -0800 (PST)
Date: Tue, 21 Jan 2020 10:08:54 +0000
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200121100854.GB157387@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <17b77e0c-9455-0479-d37b-c57717c784c7@arm.com>
 <20200120152804.GB164543@google.com>
 <453034e5-f7b9-20f7-4e26-5d0d7164edd1@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <453034e5-f7b9-20f7-4e26-5d0d7164edd1@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_020900_825863_E53109DE 
X-CRM114-Status: GOOD (  14.87  )
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
 linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de, daniel@ffwll.ch,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, patrick.bellasi@matbug.net, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Monday 20 Jan 2020 at 16:20:49 (+0000), Lukasz Luba wrote:
> On 1/20/20 3:28 PM, Quentin Perret wrote:
> > Agreed, this looks a bit confusing. It should be trivial to make
> > em_dev_get() (or whatever we end up calling it) work for CPUs too,
> > though. And we could always have a em_cpu_get(int cpu) API that is a
> > basically a wrapper around em_dev_get() for convenience.
> 
> The problem not only here is that we have a CPU index 'int cpu'
> and if we ask for device like:
> 
> struct device *dev = get_cpu_device(cpu);
> 
> It might be not the same device that was used during the
> registration, when we had i.e. 4 CPUs for the same policy:
>
> int cpu_id = cpumask_first(policy->cpus);
> struct device *cpu_dev = get_cpu_device(cpu_id);
> em_register_perf_domain(cpu_dev, nr_opp, &em_cb);
> 
> That's why the em_cpu_get() is different than em_get_pd(), mainly by:
> if (cpumask_test_cpu(cpu, em_span_cpus(em_pd)))
> 
> It won't be simple wrapper, let me think how it could be handled
> differently than it is now.

Right so I suppose the easiest solution would be to do the opposite of
my first suggestion. That is, make em_get_pd() call em_cpu_get() if the
device is a CPU device, or proceed to the PD list iteration for other
devices. And em_cpu_get() can remain as you originally suggested (that
is, iterate over the PDs and test the mask).

That should ensure em_get_pd() always works, em_cpu_get() is still there
handy for the scheduler and such, and the two EM lookup functions (for
CPUs or for devices) are kept cleanly separated.

Thoughts ?

Thanks,
Quentin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
