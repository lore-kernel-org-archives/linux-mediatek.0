Return-Path: <SRS0=AjBH=3J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1D6C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 15:09:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 823A72070C
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jan 2020 15:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T3f/oiv6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="qg1ZLvvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 823A72070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofbzHJxiJEf5Kwlw2F9i3YBk5TJEwNa2IT6/gkUbOWw=; b=T3f/oiv6PrHjZS
	wB70XZzpjJTv2r3ikO8rj0E9A84v+IYc+n53NUX6OsT2RdvXaumCn0usvttfgx0JC4zeUmbv625Y2
	lA5qOl12uwXWynTXtvWnLEf3wq++W+3xizK38wIZbZmBIJLqulmvauPcHQPqCdY4NHK9UA8m5BAaf
	YlVS26+aBB9EXNu7+6vAxx5PUub/i86jLEgQL3m6Yhq5XdP+f36Syj2ispIMFfqQG2SttScN4nv9l
	Efa9iXa1e2jFFLsuf0uziQo+POCGy3S8x2sSfTQx/ZAAFbfFtrCt1o4UgATRC+ASoa1kyKhJzAhLZ
	DKmRXjZ2qczBhXEpMPeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itYgJ-0005ih-Jk; Mon, 20 Jan 2020 15:09:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itYgA-0005hO-PA
 for linux-mediatek@lists.infradead.org; Mon, 20 Jan 2020 15:09:32 +0000
Received: by mail-wm1-x341.google.com with SMTP id a5so14858161wmb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Jan 2020 07:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ByBSacKRJKuzSIYiOQyT8J9CJv5HzmRfCVnRBxTEqEo=;
 b=qg1ZLvviVZfjbWUxveYlY31YKSPtpCoqGvUCxFFFmuSNhzrZG+8/JTUBew4MqF1QwT
 ZkjTqLHsvs275UZGLdOmP854e8vkiW0i8IheAE92enwVx5dgNXUWibw7xuJsq5IzFhhk
 pKzY/RUwbanMSqGLmJ0vUxWmHzbBOZqzoxp9yT0uRtho17C6I5oH1xMf+pTIjzSN3MZY
 H8HxiblWXheI6D/R+4rBvbQG0cc5g6adqj0TwfF4L2cC1eWieAELuSXvre7Nin13453w
 MgPO0mLx6I2rhlnxlc70+w5Qw7/m8lq2IEay5qYyHSQ30y8iTLRUAkWggiNl+AA9LLR9
 CgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ByBSacKRJKuzSIYiOQyT8J9CJv5HzmRfCVnRBxTEqEo=;
 b=Nz9ohC7YH+3DBzVMd0mx/FVPfco2cfeSDuMuO5VjwCVnRT7wKoJOuYzFNF2zsj3VQi
 cMsfig9XpYVZWLolCTXEYRQO5a2JY0x5PXHBQNH7ytEEDpcMUXdhkdgin7XQDOs+dxMu
 p1BHFWJNfdvnN/jVfSxiluTy8pidAriv1yV291CzFexV6YSBGgq/CZ2GDodQzjcOGOhY
 5XwMg8Xg363W/Fo4ktOJlT4zZg3secAe68Oatj8tgwalQ2RGRNT2hzpRd5IoIMSX0a6n
 rB1nDFg65JGmHnPx8GdISe4EjmPGtIrDg1RCzvPolQQV3TbxWbR0+UiOFgIQEioFBSjT
 vdGw==
X-Gm-Message-State: APjAAAWpxOlZETY2zDQRgPq8gO6MDXzdvshdoaaY6PEPUsGYAYMRyGG9
 sP2vFjLfTZYSkR5UD7NDYQa54A==
X-Google-Smtp-Source: APXvYqyH6QMzJgz4YZQ39CG1D478e9/BsTiziBKmrfafEV/iedUuTR3YTBW7pk8iuudU9KBXYjMY8g==
X-Received: by 2002:a05:600c:21da:: with SMTP id
 x26mr19321181wmj.4.1579532962450; 
 Mon, 20 Jan 2020 07:09:22 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id a5sm23285242wmb.37.2020.01.20.07.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 07:09:21 -0800 (PST)
Date: Mon, 20 Jan 2020 15:09:18 +0000
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200120150918.GA164543@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_070926_841225_7BA25855 
X-CRM114-Status: GOOD (  11.49  )
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
 Chris.Redpath@arm.com, linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie, javi.merino@arm.com,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, shawnguo@kernel.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 sudeep.holla@arm.com, ionela.voinescu@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hey Lukasz,

On Monday 20 Jan 2020 at 14:52:07 (+0000), Lukasz Luba wrote:
> On 1/17/20 10:54 AM, Quentin Perret wrote:
> > Suggested alternative: have two registration functions like so:
> > 
> > 	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
> > 			       struct em_data_callback *cb);
> > 	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
> > 			       struct em_data_callback *cb);
> 
> Interesting, in the internal review Dietmar asked me to remove these two
> functions. I had the same idea, which would simplify a bit the
> registration and it does not need to check the dev->bus if it is CPU.
> 
> Unfortunately, we would need also two function in drivers/opp/of.c:
> dev_pm_opp_of_register_cpu_em(policy->cpus);
> and
> dev_pm_opp_of_register_dev_em(dev);
> 
> Thus, I have created only one registration function, which you can see
> in this patch set.

Right, I can see how having a unified API would be appealing, but the
OPP dependency is a nono, so we'll need to work around one way or
another.

FWIW, I don't think having separate APIs for CPUs and other devices is
that bad given that we already have entirely different frameworks to
drive their respective frequencies. And the _cpu variants are basically
just wrappers around the _dev ones, so not too bad either IMO :).

Thanks,
Quentin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
