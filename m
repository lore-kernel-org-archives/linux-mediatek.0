Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB74C54FCB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 16:48:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCBD20706
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 16:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P0Z2XSAH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BZAU2ZE5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCBD20706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9JIhqA1S8WCea8pCSffbpIWzIjPqE6+q9/XEe64ssM=; b=P0Z2XSAH2pW1JY
	tIIYLSEY5ETbm8mmFKLEEZRpsSOcP8L+p8MZGkhtQfvtheDTpGNkQ6XAXR3i+mbshS4+d6CAws0Pw
	gG1u5sy+KPdS2IUzdL9SezwC1NLvEWUf6t8ur+W7liEg4hGmWbP4rVOgD73DgnvJ2TGfSb2Pye/z9
	lho1xLmAl7yHSo+esDauF7qibQ00dWDS/4bXhe6u3I2ZC0L52NMPy+PNW58w7gC5gglqVvQ/liIgE
	9Fd5Y4OpjsdIAW6m9GXRwRz9urF/ZV/+qcAuQcQahQWlftHbYhPQyuDwtTXFkjPeOheWOsCW1s+Qn
	S1ZDiXckq7b6y8jaGxLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRf1F-0007CN-Vo; Thu, 23 Apr 2020 16:48:09 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRf1D-0007Ax-2E
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 16:48:08 +0000
Received: by mail-wm1-x342.google.com with SMTP id u127so7298490wmg.1
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2020 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oeW7DpwK6OFjCBKNQLrqnMbfGJLDE0OYjEBqgEog0ow=;
 b=BZAU2ZE5Ne/lQJ9uzrq8Y6uSMWk2RcQiCd+b+CVY3yzxGoOUoDmU1pFRzaKcLc3JOA
 hb9PbGSk3EG61c2VuKMh6n9nVdeCeKdREDewxGx/cfMu7d/fdgQ5NJjOQfO8cyEYmuWy
 Ck60HvH+uctNWqEGuN32PGsDQZnbPrP5HSsiWC+kJeuFNkdgdMmQ3iqrZGNADnBi2Mo8
 MfqCco6iumadOLg9jIS/GhZufVO/mUhu+P3cgkrAhO/w96tB6Yvmf7fIEbLSelHxAs4q
 RM24gcZ/PnV/LQr9mWTKhfYKOuDyTFtT3m0wjORsqAndwMtN7yTnUaW/M18X37gEhghl
 oEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oeW7DpwK6OFjCBKNQLrqnMbfGJLDE0OYjEBqgEog0ow=;
 b=Zav2CsP3pu/Ki/dLzYv2He/PScQlFeFGEBpoXbSArmQMqxPXiBF+wkgj3UEzYExhKV
 9CZmtAB908EonQmuNNi+nFmB7lTcnrt7HMsiDuGN3MVJr9S0vDcOgdHOXzw7RHwDKMhs
 Vp8FlsUgv18NkP95+lnyZDZ9bS9FMEm85irYSYAqxPrdj03K61RUjzuTgQh5zal7T0rS
 B95etkD+M1RemBjAaaWLnTfoG584kpWdF3pwdfd3TAZUCYjosfQiPHQA6EPfsCRvgvvi
 RED4HYTIA0F9CuXYBlpsW9apCejFXL7wCpWVTS9JsXaIaqqkO6cRDICFkYJZLjweWoj0
 racA==
X-Gm-Message-State: AGi0Pub7Goq95AW0slGa9gsGuAdJVTKJfgvqrrV/1+r00TjlTNBqH3US
 cDaSJ47Lp9JyDYfsFQ0UWhzfwg==
X-Google-Smtp-Source: APiQypL1N3VJZzRRWP+PtS/fdnZb1T66+D/zjqtbVIUR8pO7XtbEvjwXmID9KnBgg0fgEaDYfwzw+Q==
X-Received: by 2002:a1c:ac44:: with SMTP id v65mr5176929wme.33.1587660485234; 
 Thu, 23 Apr 2020 09:48:05 -0700 (PDT)
Received: from linaro.org ([37.167.216.250])
 by smtp.gmail.com with ESMTPSA id a20sm4857880wra.26.2020.04.23.09.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 09:48:04 -0700 (PDT)
Date: Thu, 23 Apr 2020 18:47:59 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v6 08/10] OPP: refactor dev_pm_opp_of_register_em() and
 update related drivers
Message-ID: <20200423164759.GF65632@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-9-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-9-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_094807_138468_ADF17FAF 
X-CRM114-Status: UNSURE (   6.35  )
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, festevam@gmail.com, mka@chromium.org,
 robh@kernel.org, amit.kucheria@verdurent.com, lorenzo.pieralisi@arm.com,
 vincent.guittot@linaro.org, khilman@kernel.org, agross@kernel.org,
 b.zolnierkie@samsung.com, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 10, 2020 at 09:42:08AM +0100, Lukasz Luba wrote:
> The Energy Model framework supports not only CPU devices. Drop the CPU
> specific interface with cpumask and add struct device. Add also a return
> value, user might use it. This new interface provides easy way to create
> a simple Energy Model, which then might be used by e.g. thermal subsystem.
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
