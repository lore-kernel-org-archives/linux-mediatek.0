Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B9EC2BA16
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 08:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962772078A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 08:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMUD6Q0C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YF7pfVtn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 962772078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjhA6J/Fb5sdSE2ePYnESB7b3SWssBv1XEbkZglCTNk=; b=gMUD6Q0Csty+Pw
	Gaid2/tDI5fYXlXewOS/6pfxhyiJaeZAG5xSQUNFGgJDNYLPvon9LcI959Mv0PCDMsM92G7+ZHA+/
	vKp+2LKZ70LpDxS/OsOsMmk27SrsrJJWWxGe++wF4Y7qREvyTGUs6jyUcsQDXOc+J5calpeFhrswg
	IzF6Mrk9JzU51B/fhJukdfSiemmVIKGZmcetM2toBOxi/XBsndtvQsQl/UCVHfNqJyL+fr8XklYGu
	V43962Wl7aymw/hGTWpu2ZFwVkKsw+HX19uji4hv+6xgHw7VjiWIATkLbW6a5WmlChz8nVfWaZNIG
	VCcUjO0/11NWJT2bhKWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLjc0-0000Ft-Rd; Tue, 07 Apr 2020 08:29:36 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLjbw-0000EU-Re
 for linux-mediatek@lists.infradead.org; Tue, 07 Apr 2020 08:29:35 +0000
Received: by mail-pj1-x1041.google.com with SMTP id nu11so434771pjb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Apr 2020 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4R/FPBL4dOo4mvZ9ReJ8CLxavGglB5XXnfcP3bpIQMU=;
 b=YF7pfVtnVNormD+6w1FhUmCCmIPX8WylGW+gMb6fcDVCwxbjNpGspR80BZhFu81/wC
 9mGnJKwUU3jjI6aV9mcWfz9QHoD3N9j+t3t7uW1fJfq3k9+V6vPBnljs+ugaNxvH2oM3
 4fBcqqWsKDX8Vg/5/IVAXwf+8dlGNtHJhTMLogSVr30vlUXOSwvnl5PxBYoUdlZqZHZz
 8hYl4Zqcu6CNjvxU0x9amIs54FLIYOip55tk5JBJ+2Pi1ijg3lhIm+XWqxUIXtIsl/Gu
 3Y8xRbNRGLHZTKZBmWLyUyWGcwSuRyW6xDHlEgTIVdhWpg0gMdR1bVdSlt0FgGwI1rX+
 myNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4R/FPBL4dOo4mvZ9ReJ8CLxavGglB5XXnfcP3bpIQMU=;
 b=SFABkLZjZ/obkYkig1cmDuJE6R6D5ApE3QPf+wnyPBxOLw8JqlsZgYd78AlQLjfHCe
 FDvDLiuseQjrYzh1fmjwpTRnneO5D0s8RTx8zsZcUr1GkcLeNhht8CYF2yHKr5v9qFsx
 c/UCf/WXLYCJJeKkt/VkFu3QNqz0xrIMbbsssK8K3FCZBLMcHGUrXtG89rs+mS9ccnHD
 MX5GB0v84e+cm8RsR0EIDf5KBsSS+PVMdXRCVHXaloYbrwh5dLHIO57yb7l2Z4D6axVS
 xpGp4qEkyO7MnEhu6sBQIPxE3nxc5kyvw7g0TtQBXPpLshQgO/MS/Yi05yc73zVti6nd
 gKZg==
X-Gm-Message-State: AGi0PuYiUFnqbiRli/LdqtMG9WdquR6adlDBSKldGcXkgxPCb7gAqw7r
 f3L8YG+I472zL+wYhvJW0OdOng==
X-Google-Smtp-Source: APiQypIcnVfCrjU/SQx6rFcAG9MOEb1k60YQzwaCjM39FmAU4PrzS6vHLapoN/BLX9AQQ8GBXTqLpw==
X-Received: by 2002:a17:902:b489:: with SMTP id
 y9mr1436701plr.144.1586248171653; 
 Tue, 07 Apr 2020 01:29:31 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id np4sm989176pjb.48.2020.04.07.01.29.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Apr 2020 01:29:30 -0700 (PDT)
Date: Tue, 7 Apr 2020 13:59:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "andrew-sh.cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [v5, PATCH 4/5] cpufreq: mediatek: add opp notification for SVS
 support
Message-ID: <20200407082928.lancywbqts5yg4ks@vireshk-i7>
References: <20191127083619.etocnhpyyut3hzwq@vireshk-i7>
 <1575874588.13494.4.camel@mtksdaap41>
 <20191210064319.f4ksrxozp3gv4xry@vireshk-i7>
 <1583827865.4840.1.camel@mtksdaap41>
 <20200311060616.62nh7sfwtjwvrjfr@vireshk-i7>
 <1584084154.7753.3.camel@mtksdaap41>
 <20200313091038.q7q7exiowoah4nk4@vireshk-i7>
 <1586164366.5015.6.camel@mtksdaap41>
 <20200406092945.d5thcd2h3bo7mn45@vireshk-i7>
 <1586242489.10019.1.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586242489.10019.1.camel@mtksdaap41>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_012933_426559_1B21A8C8 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fan Chen =?utf-8?B?KOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07-04-20, 14:54, andrew-sh.cheng wrote:
> On Mon, 2020-04-06 at 14:59 +0530, Viresh Kumar wrote:
> > On 06-04-20, 17:12, andrew-sh.cheng wrote:
> > > I will use regulator in the locked region.
> > > And regulator will use mutex_lock.
> > 
> > Yeah, you can't use spinlock here, use a mutex.
> > 
> Hi Viresh,
> 
> I am not familiar with read/write lock.
> Do you mean there is another read/write function, which is not
> read_lock()/write_lock(), using mutex but not spinlock?

Heh, I am asking you to use simple mutex here, leave the read/write
lock thing completely as it won't work here.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
