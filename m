Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB3DC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 10:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A7D601FD
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 10:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09A7D601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+khWs0+mbdxBjKn9bM5IXmhnyViwl51ggMo4pdOiPQ=; b=ui8qip8Ev6FY63
	N81I8eJpAsAJD7wVsD9UxCrO73nPGsurw8bIRtq9BLYLmn0LcYdbfTVn5TTSehF7wjDAg/3KHS5p9
	q1EWx3KBoBlM9238MUd2egX/Yl/d7K6EZvhTXG2HGBuwMeEf+ztgqmAgpScmIZhF+DLyqNmjGJ5YU
	qizD6t8269uIPfyo0vsc5bSjkNSiKInNZqqzMlPWQYKmDUmI+mEnSBTjUxQInQKKDWLkQwqgkriie
	zYb7iE+jBSMJcGuH/M6E5mDk4u6qpqQ0xsxB3NHQOkP5wbWheMTxwkXtQvdbN6ARWHP+m2bWt+OSP
	ZDG+Vp6Gs310oV5flGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDlEI-006ZWl-9P; Wed, 11 Aug 2021 10:12:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDlEF-006ZVD-Bs
 for linux-mediatek@lists.infradead.org; Wed, 11 Aug 2021 10:12:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 o1-20020a05600c5101b02902e676fe1f04so3462787wms.1
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Aug 2021 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=p5hWIHd43oZmZdmAe/Tgt2mQU61JUn32MeibY7PUSWQ=;
 b=E1WNTy4ZBaOXroPhEU16oAmoIb7TxHWc5vaO1clqHr5vgR4jZVhcU1nElSRfIMPsDQ
 /UNOosQE4tYr7JXG8D4EA2OmU8SOMOQrNCnAt/Fx6jWiTS1HPx41awL3B63/DdxaulvK
 pBj+l5XS/40ASUIdZ1z6PMtZuL0oH3Omu8WJwUou1ygTjkWHk/T3NESdtkuxBjHPL/+W
 AE6icFv17yVdjd4ED/b/bFgmOu6PEZfSTfE4At7H0YPs9lT47OGMCBH5MDq+58w7Yl0T
 tGTnUYD+DKPtEOCog6ax5XbBjg8gc/Dq7gZ+3PxTeyD9UGnnul7NgA2wP2jpLi/Vnn1b
 N4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=p5hWIHd43oZmZdmAe/Tgt2mQU61JUn32MeibY7PUSWQ=;
 b=D20lvHR5bnVbicCb7Fqx5gSGxU0YSQk5v7iqJiCkqEWYn97aaA3jg8hjHXYxMpUrB4
 5FPClnJjNzvdH6GBrL4TQ2hO0QjkJmj09d/X2EMNBE9/cKEO4LcuWHVoyrRAlZFH9vcg
 MJcXuVMe5K68s7FSi0zGg1khLEGY7XEjmYtdLsCESzwwM75xxXyW1SYR/nZOSm/yu1cr
 6X9ao7in+rYRm+FZPgMPf7xo2kXBTShRhgnF2WlCWLg33Yhh3owgTKkGdbal/BSxo1Rn
 12B2sus5NoSas3tQLw6L5UqYdIqG2pEfRh7yFvzQXi0lDEv/vp3v10elaCiO2+CfPJrb
 mloA==
X-Gm-Message-State: AOAM531yCO7Jl0PrGRNc0Caa1fOdUmjhI3SUvVUZMwUmMQQ3/db+dpIc
 Uwa5QCXY3x95u3n/O496W1smMQ==
X-Google-Smtp-Source: ABdhPJxx/8GKFZfYfxHB5UKxM22ERPUJVsGXmqlPMwwmbrYcLQCJo+fx5ibR5G/YN51tKO70Jg3Ugw==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr26867549wmc.26.1628676773827; 
 Wed, 11 Aug 2021 03:12:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:43fd:e634:73d9:e10e])
 by smtp.gmail.com with ESMTPSA id n10sm8172810wmq.3.2021.08.11.03.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:12:53 -0700 (PDT)
Date: Wed, 11 Aug 2021 11:12:47 +0100
From: Quentin Perret <qperret@google.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Message-ID: <YROin5WudmmEPard@google.com>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <20210811053406.jqwextgtnxhgsjd2@vireshk-i7>
 <YROc95YKA1Y/TfYI@google.com>
 <20210811095311.e6wnma2ubkqdtuic@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811095311.e6wnma2ubkqdtuic@vireshk-i7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_031255_485272_726696C6 
X-CRM114-Status: GOOD (  22.08  )
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

On Wednesday 11 Aug 2021 at 15:23:11 (+0530), Viresh Kumar wrote:
> On 11-08-21, 10:48, Quentin Perret wrote:
> > I think this should work, but perhaps will be a bit tricky for cpufreq
> > driver developers as they need to have a pretty good understanding of
> > the stack to know that they should do the registration from here and not
> > ->init() for instance. Suggested alternative: we introduce a ->register_em()
> > callback to cpufreq_driver, and turn dev_pm_opp_of_register_em() into a
> > valid handler for this callback. This should 'document' things a bit
> > better, avoid some of the problems your other series tried to achieve, and
> > allow us to call the EM registration in exactly the right place from
> > cpufreq core. On the plus side, we could easily make this work for e.g.
> > the SCMI driver which would only need to provide its own version of
> > ->register_em().
> > 
> > Thoughts?
> 
> I had exactly the same thing in mind, but was thinking of two
> callbacks, to register and unregister. But yeah, we aren't going to
> register for now at least :)

Ack, we probably want both once we unregister things.

> I wasn't sure if that should be done or not, since we also have
> ready() callback. So was reluctant to suggest it earlier. But that can
> work well as well.

I think using the ready() callback can work just fine as long as we
document clearly it is important to register the EM from there and not
anywhere else. The dedicated em_register() callback makes that a bit
clearer and should avoid a bit of boilerplate in the driver, but it's
not a big deal really, so I'm happy either way ;)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
