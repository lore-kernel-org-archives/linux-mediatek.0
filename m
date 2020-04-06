Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FCAC2BA19
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:30:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8304F2051A
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 09:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PdWlhIqW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lA2dD1pU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8304F2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z115YnfhatZdJHHoCWhc6FmRvxh55W+urx/YhFi4ODo=; b=PdWlhIqW6LWPwI
	hS51Tpfu7x4BVCv3aDoEThteYo9AnnArlaWkIV2yZuHhvZO39lBHWplwoDYmO0/MhbJ1RvsiOBaSz
	bul3AprrMwzf+bDEYbVMGbGYAPoIcjdyjBReDiS5+f3mltT0LLUG6xsjZSQfieSbIovGjTHiK7liY
	2+GhpoaZ2CnJ2HkopI0XAAcAJJTOIg1tFI6GNlRAy49hT8JnhFiDGIi/eqsPihJ8zw3OgRQxEZhpO
	+5ggwDkvBJE3ptNRRfZBemV3+vhycFcra5q2RBBHaWDatGLdQRov8+NfPsIp61/ha/hCg0+IffMiA
	Qb0zL/FesvQ6GWbKXXsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLO4s-0002Oe-Iq; Mon, 06 Apr 2020 09:29:58 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLO4j-0002FN-7Z
 for linux-mediatek@lists.infradead.org; Mon, 06 Apr 2020 09:29:50 +0000
Received: by mail-pl1-x644.google.com with SMTP id e1so5680032plt.9
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Apr 2020 02:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZCzHwl/tdcpxDCvekc0v2ATl1ivxbmKIM4V06jUFE4o=;
 b=lA2dD1pU3P/Ty4DeO3ShHycc7coGr4rgguYE94pdUYB0rQeBI4R+O+XPILIDswxwUZ
 8/0N/Nf87j7tRNEWERwPiO+a8fKnsi9Y6Ftu3dVR3xICxGhLDWb+KGsFDsQaBOcgI3tr
 jSqz9jjdv+rGEp7nNDmxgLrZQKooGMiHIMJTMjPW9qY6OwddYlWPTFKeb8bg7qZU3AwG
 qBX3zWIimob9XlsraxiQ+pWhNKsyugcy2Q068sezTmHZQY54B4p2jq0lnirIIi91YGmo
 NGF9j8S2DD7riX6aAyxCPnvM0QyW2GEyt48nwV9aXfhYqowCQbI+nfwwy4PbTMDIoY32
 YE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZCzHwl/tdcpxDCvekc0v2ATl1ivxbmKIM4V06jUFE4o=;
 b=HIxhj1vRvjQmgIg0wenNvCXl6fw0otWKXrTLV5XGYvEereuMlr+SY4sQKwf5Yyn9vI
 NL/499L3IARb5CgiUVhC9y9fH/9rxRWcyb47X3NGK2HdaKxm47jHoQubXS1yUX+4tWoW
 z29j2QwrWYd/LSXadt5Mx3biJIN9Odkz/yV5bhfJnyN2JroG7tNC1i0e8b9gooYswSJ8
 bCftbw7UI933uh1DDkh8ilqN1RjG2oguK9SQSkVnzdxpezF9Z3TFySMoeNcWpBg/QyP0
 ZK+DW6O/u1XBR3T8/n7Uy4oPRrdWgDGONW+3zyIynXrR34cHlusE3hV82kZAbxIYWtjD
 EDCg==
X-Gm-Message-State: AGi0PuYGFQ5OcFwdojsT4G/5MeTDvpqQOWRhkNF/SRfeFfPxQWAo8xEn
 sMh8VA4xw5ffYH4eS8VOZ4B9hg==
X-Google-Smtp-Source: APiQypJ1tW013VPp2UhXvt/1Bxz5iwbypmAuTEFj+PUd/NiBUPS+9Nx3CgJdVnertByvQXbdXVoStw==
X-Received: by 2002:a17:902:b593:: with SMTP id
 a19mr19581254pls.92.1586165388661; 
 Mon, 06 Apr 2020 02:29:48 -0700 (PDT)
Received: from localhost ([122.171.118.46])
 by smtp.gmail.com with ESMTPSA id c128sm11053782pfa.11.2020.04.06.02.29.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 02:29:47 -0700 (PDT)
Date: Mon, 6 Apr 2020 14:59:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "andrew-sh.cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [v5, PATCH 4/5] cpufreq: mediatek: add opp notification for SVS
 support
Message-ID: <20200406092945.d5thcd2h3bo7mn45@vireshk-i7>
References: <1574769046-28449-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1574769046-28449-5-git-send-email-andrew-sh.cheng@mediatek.com>
 <20191127083619.etocnhpyyut3hzwq@vireshk-i7>
 <1575874588.13494.4.camel@mtksdaap41>
 <20191210064319.f4ksrxozp3gv4xry@vireshk-i7>
 <1583827865.4840.1.camel@mtksdaap41>
 <20200311060616.62nh7sfwtjwvrjfr@vireshk-i7>
 <1584084154.7753.3.camel@mtksdaap41>
 <20200313091038.q7q7exiowoah4nk4@vireshk-i7>
 <1586164366.5015.6.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586164366.5015.6.camel@mtksdaap41>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200406_022949_286856_1C90267E 
X-CRM114-Status: UNSURE (   7.31  )
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

On 06-04-20, 17:12, andrew-sh.cheng wrote:
> I will use regulator in the locked region.
> And regulator will use mutex_lock.

Yeah, you can't use spinlock here, use a mutex.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
