Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC1FC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 04:27:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB59206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 04:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YsfzOzoJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JWGdadun"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB59206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rDdsyBzo1Of6RrA/rzKB6HhGtBgIptGt5t4Uz2kImYo=; b=YsfzOzoJu9fo9k7NE7Nd4i+xg
	PfmuhWQQ7uqdLEGPG51yjjSE5PLGF40E1qAQL1Zmiy6mEppQZBVjqDs8zJKrf++Evud5AjgtEJUup
	YD3M589geYMvsY1NU4sy4OYXTSomLp9GqKY0Lr1TqK/p/CeM/wtOQDhGsg/NUDx8gCEN6LNNblF2g
	4IWhck4qhOwLPigA7xHlTZ+dvukwtxkq6yuV4ijnxKyPTAhY0R68Oerq7+VRfZt/1R1XwzhHsTqah
	5llD6wtJ1eigbc8KWhsy64LLpnn3YmiqUpzMt6xiYGVtEjjC5/EskmMkPP5NthKX/eXU56Rn6SJI0
	slJjoKlmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB9VA-0006S8-SI; Thu, 27 Aug 2020 04:27:05 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB9V7-0006Qr-IF
 for linux-mediatek@lists.infradead.org; Thu, 27 Aug 2020 04:27:02 +0000
Received: by mail-pj1-x1041.google.com with SMTP id ds1so1961096pjb.1
 for <linux-mediatek@lists.infradead.org>; Wed, 26 Aug 2020 21:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bn7ZvG4ybcooDrNm25U4C10jlmrGjFdQ/FaC/rxAetw=;
 b=JWGdadunye66WMfXu1P4p7JU12j51p8o/dw5xBp05k4WBlQSeSFjHzokSYn55bVV3o
 J4tcFBW+K0k9bbB0ds4GyUbQ9KAjULJVcytETxzcrQeP3yifDm/M/suCNnYmsgY5Qzlv
 bYLOwZvhvgDdXRldn4DmRvNGzykpHvQF1muP3pcCByHjEYtEHbeJDDqUjNpus61Fowov
 JyoN9QhOtYitibsWLrqe+FQ9q4BVoMTkmiVKZ/RQ8BzwYqbwxbkzyx1YBIYj6oYH/uoi
 E6OZ9hPBdCD4DEyRV0Y3/EiRxpSeNBUdMXvmYIiHxOPHTWp3rcwr9/3wHDVTWkLGz5kb
 6DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bn7ZvG4ybcooDrNm25U4C10jlmrGjFdQ/FaC/rxAetw=;
 b=L4U8AepueVLCX5MDcCZI/OuOqXf3UuoYgbhhSu/PfMkZNKe29c1f8Z+TjmxIEjU7Xx
 Dd360aRRxkUI/TNQX0mE8caZvNp2wK0VI4cKBzMAkIAj6GK/NemlIvWlULhO/8+6cdK8
 ZvBHjFhh/HAjpehsm0KGqrhX2Kxry01ZQze7toTymWjSVgU3LbrRvt3hIyC/qleOY88p
 32IEnZ4ZNCLsubwk6QM9jwIAaLCzliKE3CABrjiggGle2R1CjDcXBmeXALucjeWQL2DM
 YYfFCwTlW0oWPv2BdtmLPED8/GEYFXTGXOPdiU1AC2l/h8ywZTe5426qyU4/syVu/Q61
 mRFQ==
X-Gm-Message-State: AOAM5335ZooqmCwUN6FF2yoG9/CWCTOycMgV/oFSoNq8GcLsDnW/LtcX
 xPlRhdz/DQIp8lSEffvBbPOGbA==
X-Google-Smtp-Source: ABdhPJynFu/KaCKX/yeZQJO1i0iZEbs8inUUMkKE06wJFLYUgtfBDrVZ4/4+/uHiY6WLXxuxzu5BQQ==
X-Received: by 2002:a17:90a:f593:: with SMTP id
 ct19mr9163811pjb.36.1598502416374; 
 Wed, 26 Aug 2020 21:26:56 -0700 (PDT)
Received: from localhost ([122.167.135.199])
 by smtp.gmail.com with ESMTPSA id nu14sm631975pjb.19.2020.08.26.21.26.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Aug 2020 21:26:55 -0700 (PDT)
Date: Thu, 27 Aug 2020 09:56:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v2 1/2] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20200827042653.5ttsxnjjhpslmrcv@vireshk-i7>
References: <1597302475-15484-1-git-send-email-hector.yuan@mediatek.com>
 <1597302475-15484-2-git-send-email-hector.yuan@mediatek.com>
 <20200824100619.o6uwnlsaxdgc3l7r@vireshk-i7>
 <1598446624.24220.10.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598446624.24220.10.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_002701_642384_6B82F228 
X-CRM114-Status: GOOD (  22.46  )
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
Cc: devicetree@vger.kernel.org, Anson Huang <Anson.Huang@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Olof Johansson <olof@lixom.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Li Yang <leoyang.li@nxp.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26-08-20, 20:57, Hector Yuan wrote:
> On Mon, 2020-08-24 at 15:36 +0530, Viresh Kumar wrote:
> > On 13-08-20, 15:07, Hector Yuan wrote:
> > >  CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM=m
> > >  CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
> > > +CONFIG_ARM_MEDIATEK_CPUFREQ_HW=m
> > 
> > What about a 'default m' in Kconfig itself ?
> > OK, will update in V3.

Hector, you need to remove (or not add) the right bracket (>) before the
beginning of your lines. This makes it incredibly difficult to read.

> > > +	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
> > > +		data = readl_relaxed(base + (i * LUT_ROW_SIZE));
> > > +		freq = FIELD_GET(LUT_FREQ, data) * 1000;
> > > +		volt = FIELD_GET(LUT_VOLT, data);
> > > +		if (freq != prev_freq) {
> > > +			table[i].frequency = freq;
> > > +			dev_pm_opp_add(cpu_dev, freq * 1000, volt);
> > 
> > Why are you adding OPPs here and rather why using OPP specific stuff
> > at all in the driver ?
> > yes, the opp information is read from CPU HW engine.Then add it to the CPU dev OPP one by one.  

I asked a different question, why are you adding OPPs ? You don't need the OPPs
at all in my opinion. You can just create the frequency table and that's it.

> > > +	for_each_possible_cpu(cpu) {
> > > +		cpu_np = of_cpu_device_node_get(cpu);
> > > +		if (!cpu_np)
> > > +			continue;
> > > +
> > > +		ret = of_parse_phandle_with_args(cpu_np, "mtk,freq-domain",
> > 
> > Where are bindings of this node and how does this look ?
> > Can refer to the same patch series, I split it to another patch.Each cpu will be group into one frequency domain for the CPU DVFS. 

That binding only defines "mediatek,cpufreq-hw" and not "mtk,freq-domain".

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
