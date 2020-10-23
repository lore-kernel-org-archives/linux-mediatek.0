Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D29C55179
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:28:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CBBF2192A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 09:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sG2H4UWU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f07s3VLB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CBBF2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KS5g+kCaBIPy/zdyXqT1SoMthfHVOW6ZltVQUeSRkUc=; b=sG2H4UWUskeOnM+NdqilvMhKo
	U5xFtKnvP/xMY8mmTFpWe36PY2w3R8boxPwBaQ3fOojikhEicd308CGuB/Co4v6YdGb1AsZ2XcxBP
	hSt3AGr6w/+e5IiTV4Ag9b/cFR+o/jDhfj7sZmKMoj2/cFctOvxfg18u4uqcL4IoPoALlQcb3Z5Hx
	llLlWL5ANyULoFFpsHgRRchgLJ2/PS4mSXtZk5g2cw7RmtEhD+fxPLaliqFHpXtJOnbvXyl/A2X+h
	LY+ljCyZ93DUfh/COlDFaxunqPP0u/LLumgiXpVXELMuazbC8FuQ6n+1mMFRpoXfFgJquEixkyXtu
	c+0+oCmWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVtMW-0001oF-9D; Fri, 23 Oct 2020 09:27:52 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVtM5-0001d9-7L
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 09:27:27 +0000
Received: by mail-pg1-x543.google.com with SMTP id h6so772007pgk.4
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ucv5oR6DPdGRMnKY0683TdGM4cbhJcd2cZfvbWq/+PU=;
 b=f07s3VLB2MfVm1O3IHZ0eF7bXrbz5q+OMq7d217XRq9up5bkItIWfl7qKlNY+ATmJV
 4DovSd07C399R6SJrO1As9FKrmDERtWx5kJxc8DRoMJ+mxRaMkW0AoM45IF+41hG3rZP
 dKa0tPDvPO/MDNOsapAIMlYh40B5L1H/RKp5Om7zDiBn5DSZptfMyMgU+QpFQlJQWdcI
 Ed+VZC14LdegGJtYX7zFcRF7qKq62X4xqR4cjPePX5kPPD2cbCZWFP3wspS1A/+71EnK
 HG8VbMzQxU33SMfkk4pL55/YNMbLTdglZWjpTUOU1ZN/ohpfdr4UeO2OzSJKxvXWhepm
 Dm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ucv5oR6DPdGRMnKY0683TdGM4cbhJcd2cZfvbWq/+PU=;
 b=YWYCTJQRhaYLttuWcK0ggz2zRA4XRy7OHuO5fJO1pV/IIwK5vGu0jTKDPl22OwwG7a
 Ml7AJtlfrlr0USZyFxHak/GvgLAknu8ZvnrHAFpn2IbXbE9J/5ByAZzjkx+tAM3uax//
 Au9R4fpcFKlnONJJehHinjQHgR5ZY2nolfw/nGoakQuKTnzv42VdGHM2CzRuYefwcdny
 UZfTlTKlzFXEsY1WcFpsM2IYBwF5tVt/3fDamhtLha8uO7z5CHQhcWFEMvYjmn0HEuIl
 sXQR3JsY+yDDj0qT8LpO1H5dKr/nypFLXRC7aVvXVimyy0+hvh8lXl03FRoNtJoC1TUX
 trKg==
X-Gm-Message-State: AOAM531temfQ7OROtQkiBQZSYPEQuEwlaWGocz72SoTaIwIEv37Zfj2p
 QuBILoah2/Pl4qGSmFCb1xIuNA==
X-Google-Smtp-Source: ABdhPJyuPfJLoxrZf/YA+PmXSKVSfNq2TGaMvcJ9QKvWEeZvn/5j5V974zQbFeFOsyw0rCEczr08RA==
X-Received: by 2002:a17:90a:f187:: with SMTP id
 bv7mr1555398pjb.198.1603445242886; 
 Fri, 23 Oct 2020 02:27:22 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id gx20sm1545390pjb.1.2020.10.23.02.27.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2020 02:27:22 -0700 (PDT)
Date: Fri, 23 Oct 2020 14:57:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Subject: Re: [PATCH v1] cpufreq: mediatek-hw: Add support for Mediatek
 cpufreq HW driver
Message-ID: <20201023092720.qpws5wivqb4u6fwl@vireshk-i7>
References: <1603441493-18554-1-git-send-email-hector.yuan@mediatek.com>
 <20201023082817.5vp4cvi2lmpaozcn@vireshk-i7>
 <1603444138.20224.19.camel@mtkswgap22>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603444138.20224.19.camel@mtkswgap22>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_052725_383505_E7081273 
X-CRM114-Status: GOOD (  26.09  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Florian Fainelli <f.fainelli@gmail.com>, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Dave Gerlach <d-gerlach@ti.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Amit Kucheria <amit.kucheria@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23-10-20, 17:08, Hector Yuan wrote:
> On Fri, 2020-10-23 at 13:58 +0530, Viresh Kumar wrote:
> > On 23-10-20, 16:24, Hector Yuan wrote:
> > > This patchset includes 6 patches and depends on the MT6779 DTS patch[1] submitted by Hanks Chen.
> > > The first 3 patches are for CPUFREQ HW driver and device tree binding, which are already sent before separately [2][3]. For binding part, I add a new patch to add property in cpu schema.
> > > Besides, we add three more patches including EM power table, SVS CPU initialize, and cooling device.
> > 
> > And even after so many versions of these you chose to name this V1. It
> > is very difficult for reviewers to find time to review your stuff, and
> > they expect some sort of summary from you on what exactly changed from
> > last version and you also need to name the current version currently.
> > 
> > This should have been V8 and you should have added a "V7->V8 diff:"
> > section here, naming all the changes you did. Please send that as
> > reply to this email, so I can see what really changed.
> > 
> Hi, Viresh
> 
> Sorry for your inconvenience.
> #1~#3 is for cpufreq driver we have reviewed and the bindings which
> separate freq domain to CPU schema.There is no change for the driver
> itself.
>   1. cpufreq: mediatek-hw: Add support for CPUFREQ HW
>   2. dt-bindings: arm: cpus: Document 'mtk,freq-domain' property
>   3. dt-bindings: cpufreq: add bindings for MediaTek cpufreq HW
> 
> #4~#6 is for other CPU features, i.e. SVS [1]
>   4. cpufreq: mediatek-hw: register EM power table
>   5. cpufreq: mediatek-hw: Add SVS CPU initialization
>   6. cpufreq: mediatek-hw: Add cooling dev flag
> 
> I supposed that it could be more clean to separate #4~#6 in another
> patchset.May I know is it okay to you? Or I should merge all of changes
> into v8 like you mentioned? Thank you.

Merge them all together and explain any special features (like SVS) in
the commit log. It will also help in future when people want to
understand your driver. Explain whatever is worth explaining there and
is not straight forward.

Thanks for the details.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
