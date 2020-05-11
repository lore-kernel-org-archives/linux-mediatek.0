Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8AC5C54E4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 13:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DBCB20820
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 13:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UL7JR3kG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="m0ElpsF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DBCB20820
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zf5M2uudSCnjzysbQPY58n7LnD9H/3CFefgyVjaKynw=; b=UL7JR3kGoIpyvA
	vNCRWHrxKwmIfbEXR6E66LiuUVa8FKWYR+PjjzoW7vwtWdLG8ikqXgY80+Av8sz5TVzBcigPKlkB3
	iQHq5dusA1V+N5siV4hRTd97JpPSNmoGrWxWnLU9anbDdVMhyZW04NP1/VMpESE1e7VdATUZXz+PD
	a7gHzUnFjdxk4Jmyke33a1I2f86wrsen5HLAsElLyBfyDyNC+DbZdu6xmFGPa4yDdg3r+E3Gsxe1e
	Zug79E42PKUNesnwKjgIBSubpZ6wGfPCcd9wwAAlAmfZxDOsQT6g+kPc+BdFKXSGN3Pn80Y9nr4b2
	tARYF/Fjb2QvszP3+kFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY8jn-0002A7-LM; Mon, 11 May 2020 13:44:55 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY8jf-00021h-R7
 for linux-mediatek@lists.infradead.org; Mon, 11 May 2020 13:44:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id k1so11046700wrx.4
 for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2020 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hpFE9CUsmF5QuTw9fCnRsO/HIcrfLKfZVWo5gx0AO38=;
 b=m0ElpsF0pRp5TglEUDXatsddqa+Pb36Mj0Ppynh2iPIzzZz0EgUlzEtzkWyZeAg3vB
 uBs8o5cgAfl1IJaebtKgziRr73o57iHO5kRqVLTfaRC9X/zbKfqE0X7WUY3tyIHVtzsE
 vFx9MY8AD+wURjQHSKOL4msglFChmdK1OF0GOTXEyOPCB+/qCeUlNUl3WRSD8mjpJY46
 hSQALRhOTEhqYS5oyb8QdeT0A4PD7fA1adHgJP7v3DqW9SxYfGkzAgGWjuOFXLrwzjzb
 N6qFsfSm3T/OSIzW2mqIAKD2F9YJwb6IdZnQgigtlyOUiCH7V2syhUCmrF3QsgphlAHW
 IDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hpFE9CUsmF5QuTw9fCnRsO/HIcrfLKfZVWo5gx0AO38=;
 b=HAO8TBe6ASNWuQyjAVndD5jlqH2LnC0LxsC/m9j3wrruPdDtcOmGOpwA+YizdK/Mop
 Ox9mJIL2HJGtUBh8NTPkorLs6bqEM3JwhHRVhJskGKaB1aznOUHIfofBu6Cezp50+tEH
 DYhZBUYCjBvpy/dfQmtJ8FOcFigSSn2NYzdCJHZUN0llNPya8VxEpyfL4I1FRDbLMuHo
 56WigfkVIdyxbpoNeKPU1nr7Fy2lSPLZn05dZK6wRfETpD1MJOYf7jMzdUrRt8q4j2WT
 yx0NwDc0XVfYLGLuefA2SrlgZ/xZpbj9tH3HhGdqJNZpmvddVJrX/FvxGIknkit4eA+N
 DEhQ==
X-Gm-Message-State: AGi0PuZR1Ova0SQRFgNA6L9iDoI4cPfQFGrbj6pBhohZpa/e4+M6Xpi5
 Euj88ARg5SlUIwMmGNXtht8kTg==
X-Google-Smtp-Source: APiQypLqeWUYDX3crs5ryt2QKIDbqRz/76rh57q7pYtJbxnpgj5n76IycVeDM/ojI700iAgxeVhE4Q==
X-Received: by 2002:adf:e28c:: with SMTP id v12mr21053389wri.157.1589204686152; 
 Mon, 11 May 2020 06:44:46 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
 by smtp.gmail.com with ESMTPSA id a15sm18111170wrw.56.2020.05.11.06.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 06:44:45 -0700 (PDT)
Date: Mon, 11 May 2020 14:44:41 +0100
From: Quentin Perret <qperret@google.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v7 05/15] PM / EM: remove em_register_perf_domain
Message-ID: <20200511134441.GB29112@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-6-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-6-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_064447_873467_30D2D1BC 
X-CRM114-Status: UNSURE (   7.64  )
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
 daniel.lezcano@linaro.org, steven.price@arm.com, cw00.choi@samsung.com,
 mingo@redhat.com, linux-imx@nxp.com, rui.zhang@intel.com, mgorman@suse.de,
 orjan.eide@arm.com, daniel@ffwll.ch, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, sboyd@kernel.org, rdunlap@infradead.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Monday 11 May 2020 at 12:19:02 (+0100), Lukasz Luba wrote:
> Remove old function em_register_perf_domain which is no longer needed.
> There is em_dev_register_perf_domain that covers old use cases and new as
> well.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

So, as mentioned in patch 03, I think this one could be squashed. But in
any case:

Acked-by: Quentin Perret <qperret@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
