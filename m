Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5D0C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 08:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uC41WYPN8xpOOPLn9zsciAVNF5nyeZXYeYRRJgVrd70=; b=qfL9Fh3aB/gdET
	2ZMFu+0iW0VMMMhkd/gAKVSckiBpD2Cmr5lsiPh8j9cJ/MgScTben1ODrKMQ0UunlSmlUEX0sQsDO
	mh0u3i022s751qcVoBZB46oBQOLUAO1rSg+mh36dFwcfhLVHQjm5mpKkEM1SS+ll0sJmhsc0cLRAR
	4cmWgT3wo1Z6BzS6rQsZqaeSeRkNvAiCa1nZv75XUU3rBndwJFAJdn0hBaYvzKWlq+0+923CNiTCN
	EvxX0GerP/1VzUT0bA/j4TUawPB/DrZBLwCDCAdUuEeJP/yOnZqqdXxwqOHBVPNH379PLfJgiQg6s
	HdCXupfS+6+pPuCAABaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noLa3-000hko-Ns; Tue, 10 May 2022 08:50:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noLa1-000hkK-62
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 08:50:54 +0000
Received: by mail-pj1-x102c.google.com with SMTP id e24so15314760pjt.2
 for <linux-mediatek@lists.infradead.org>; Tue, 10 May 2022 01:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=23XI7omNPu4Ww2mwP5OeT/CtOKTWQPLI279EMdZEl8I=;
 b=pAkf0vZXQUl7z39Mvm0va/etmp8fu6PH9u8QnPryN0wiLXCnJABlTzMSyA1vX3ufsd
 1NwpI4qHxfOjcijIcVJhXTnUyNexYug0j+ElYm4cIsoghJ+NFodEYzmqMIg0iwGq2sOh
 IYMUG6mCbzmWSWr8F3zuIh+27WF/B7hQV9+aanx16CvGGbq1sbVmxt2FWWKhkPyBRTMV
 OOSaopJdw6cqzqBOvlc8kWKvGJgjUxBC0+BdcA1Brs2jH982g/uKojUD9UdUhgYG6592
 aS6U2Mze/PcfS32raLNpyKL1T3xq+CMGvh8nDeryMuuriTKiCsqcFlW2+78zx13+QcCl
 baYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=23XI7omNPu4Ww2mwP5OeT/CtOKTWQPLI279EMdZEl8I=;
 b=4eHky9mPm5zSZKdL9cQHi3J8sSWjXjQFH9XQ5LwfjVxQSP65AFDFf98PwlC22UEUni
 S3TmCe/yfQbdd//sCZWbgMyNbXGoNWJExNS2KeXyuT44R2qQlLNi1hOsSfFu6/KnxmZM
 PaArY1vO0Ksr7ygcmdOi4PcEchdgKrIwP/a51+KTjlQGZ11hV0G2GL7txzHARq5QlX0h
 ryCSDt4FbFwlrhH+9i6a9CIs0jBzinervw+AcGCn2+8rCO4Hu3ZlS1s8D0UR5DuoIcfB
 boiAA+ZAu830o942WYtAb5foisoBumLtD1OzYBEaFrPN/mWAjt7Ju0zgoBB0bY21nbHe
 3xBA==
X-Gm-Message-State: AOAM532BbdebXBflUJoVuzb3Ty8MnnPq36uaDHjv35fy6uD6TzObR2Wk
 cgpGmGb/wvBRF+o2LbhPt3TnFQ==
X-Google-Smtp-Source: ABdhPJwXvUI+FMSIeZJnNlTMMqe93GAbMnaxp4pldVeXwi/DjAEPWwiYdnWfkXRdlr5EKGrPbXGY8Q==
X-Received: by 2002:a17:902:8501:b0:15f:173:40e1 with SMTP id
 bj1-20020a170902850100b0015f017340e1mr12562515plb.74.1652172652504; 
 Tue, 10 May 2022 01:50:52 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 q65-20020a17090a4fc700b001daac75511esm1230698pjh.51.2022.05.10.01.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 01:50:52 -0700 (PDT)
Date: Tue, 10 May 2022 14:20:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jiabing Wan <wanjiabing@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>,
 Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
Message-ID: <20220510085050.tza6rjvdkjsrhrjv@vireshk-i7>
References: <20220510080136.11950-1-wanjiabing@vivo.com>
 <20220510081232.4u25qgryszzqblho@vireshk-i7>
 <61a4b23f-9740-6fb4-abd0-640d3353e788@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61a4b23f-9740-6fb4-abd0-640d3353e788@vivo.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_015053_331993_58AF3AF9 
X-CRM114-Status: GOOD (  15.44  )
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

On 10-05-22, 16:26, Jiabing Wan wrote:
> Hi, Viresh Kumar
> 
> On 2022/5/10 16:12, Viresh Kumar wrote:
> > On 10-05-22, 16:01, Wan Jiabing wrote:
> > > Fix following coccichek error:
> > > ./drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on line
> > > ./drivers/cpufreq/mediatek-cpufreq.c:208:2-8: preceding lock on line
> > > 
> > > mutex_lock is acquired but not released before return.
> > > Use 'goto out' to help releasing the mutex_lock.
> > > 
> > > Fixes: c210063b40ac ("cupful: mediatek: Add opp notification support")
> > cupful ??
> 
> Sorry for the typo...

Did you write this line by hand or generate it with Git ? There shouldn't be a
typo here.

> By the way, is this patch correct?
> 
> I am not sure whether it should return with the mutex_lock.
> But IMO, it should release the lock before return.

Yes, we need to release the lock.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
