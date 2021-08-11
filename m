Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF0DC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:57:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 553E260200
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 09:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 553E260200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=va1Ey5BwOgi1ChIvzMLVkQp/bBvLZh160UIgHDJBMcc=; b=TbLClUCiCHrnET
	BEq+YytWDvGv0riYZFM/7L0pDcOvl3TBu6Xvb23YQZ2/qO4eXbDvZS/pyuCBnGSvrNwE9sem+J+6n
	nDtdO/WmbP0E6bzrWNNwAPkb75xD5ikqLZg3Eyj6BiqxbuMEUuGJCO+PeY7Lmep6Wxi47CxypX9TE
	KnwyErodfRP5lEGzDiHyVnsnF2JunoKMWPDd3qRNe+B0qkKAWiHx66mBRy21YXOvWLYQ+0x7uzr2B
	kDA+JgwHu/uf9Bt8Tgyc2HAqYO3nVENuIzSvAHWcCWjKT0S5QvGf0jxtsflTc50xQj4favOjLU6zN
	vimqLLYd619mp6XqJTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkzC-006TIg-Qa; Wed, 11 Aug 2021 09:57:22 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDkvD-006Rg9-Bd
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 09:53:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 m24-20020a17090a7f98b0290178b1a81700so3827041pjl.4
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yN5JGDsQRbqNYGictWkZk65RsQg7qzCYVO5IdGVoaBw=;
 b=jT8c08ChLL2mhNYjWrg2WH961eloGTK7WLroKUhk1+HDo/YM/IS+TatyC2cp810l+O
 0u+8hzUlKaym9ME0OwoavnqJUGcIpn88I9Idf/kYyhFAPk5xIPMh48wpBIaOaPTqX5MT
 msjuGgIKwByuZEB0CZDR5/aAcaTDR9tglGCbejFiC2kY8d111jY2EPLGmKXc4WUWKR0t
 ysxJyCokcS3h6WUhFWZ0rWGAEJhcRcycvyjSkN5g/Lmv3DabzrTvvVprW5nF4pR4KPqc
 UF9FYUExy1pzZr79hfcb9pGPg00cGCsbPNciGT1qL5RE0uAZl2NDYcH5zFa0dU2bnHxL
 nVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yN5JGDsQRbqNYGictWkZk65RsQg7qzCYVO5IdGVoaBw=;
 b=nknEIFHIotqIQI+FqYmk2RiqURn45Vb8LajG8ILeYuEm54rChWYEERBe4BoO2iY5qX
 WyaP0qIinmLqcIrmP34zMDtUG/YD6URcJljt/UVzFC2KzwQxsBMJFD/W2kAMRVv83N2W
 Zo2oifXC4P/POlzAvENU3uNipBZ5rLwR2PA+OUMDvcTjt4mG1Uc/mDm2r1XW/DfpsyJg
 DC2HaWoUtvJCmjPNDqOyst07BxeurWPpRnr9YoZV1slxTxhnj+sDo9h2akKsdGdSBXXE
 rU/EsF7CscQ2OSAbir60I5oYGXKoINPsJw+Pqy9dSHeQUsvbcYhFwkybj9d1jKt7plsf
 tjuQ==
X-Gm-Message-State: AOAM531mSnAFZJz+4aIDYFwPK1NlAyoP+snl5+H4VZnQjdyUrJoN7KFi
 iA66cDPOPnZf1uJm5I3se28NNg==
X-Google-Smtp-Source: ABdhPJyq2OUPvDwt1HcJwEVMav+d2aFK2NfnnSvBGT0D8jiXAM3hY/HQnrCiTJv6msGhlEIvfUuJ9A==
X-Received: by 2002:a63:4710:: with SMTP id u16mr307872pga.232.1628675594245; 
 Wed, 11 Aug 2021 02:53:14 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id y23sm29928446pgf.38.2021.08.11.02.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 02:53:13 -0700 (PDT)
Date: Wed, 11 Aug 2021 15:23:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Quentin Perret <qperret@google.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
 Vincent Guittot <vincent.guittot@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <20210811095311.e6wnma2ubkqdtuic@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
 <YROc95YKA1Y/TfYI@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YROc95YKA1Y/TfYI@google.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_025315_458025_1E84620A 
X-CRM114-Status: GOOD (  16.12  )
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

On 11-08-21, 10:48, Quentin Perret wrote:
> I think this should work, but perhaps will be a bit tricky for cpufreq
> driver developers as they need to have a pretty good understanding of
> the stack to know that they should do the registration from here and not
> ->init() for instance. Suggested alternative: we introduce a ->register_em()
> callback to cpufreq_driver, and turn dev_pm_opp_of_register_em() into a
> valid handler for this callback. This should 'document' things a bit
> better, avoid some of the problems your other series tried to achieve, and
> allow us to call the EM registration in exactly the right place from
> cpufreq core. On the plus side, we could easily make this work for e.g.
> the SCMI driver which would only need to provide its own version of
> ->register_em().
> 
> Thoughts?

I had exactly the same thing in mind, but was thinking of two
callbacks, to register and unregister. But yeah, we aren't going to
register for now at least :)

I wasn't sure if that should be done or not, since we also have
ready() callback. So was reluctant to suggest it earlier. But that can
work well as well.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
