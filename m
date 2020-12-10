Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF44BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 19:14:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C7F23440
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 19:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C7F23440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IvoFmY+5e43EV3CnUHIb75JuH15wHTWlwgiA+u1sIYY=; b=oKTAYfEGk+YrujN+K5rg8z2Vi
	+49ZxEOgTdLdUhz9L/KFH4el7oEPEZzCestzEKbSqsiM91lTUzJOILjx65LliucbobSHOFTKyOUpF
	zkzSqYfuDMNEtyRk8v8cYCQBlvkDTbEcjXVuY9D46e6ZKSjjaHAar838uxr3jyexjoIhS6uA8h1yu
	NgRZo+3s0jGVoImV3QWp5at+9eiLFRnK7CgjgArow/+cJWuZEJl82QyXhvtNRVkgSaFIihwfwTjCF
	9wLHNodx7syW0iKfLI/2C1ILYQ7uugEBvQMmWGubeQUclIZEVoCykneRlXhE4Hy7yrmBzYZkWX0b1
	J/jdpWspA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knRNx-0005eq-9m; Thu, 10 Dec 2020 19:13:53 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knRNv-0005dc-6j
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 19:13:52 +0000
Received: by mail-ot1-x32a.google.com with SMTP id f16so5929208otl.11
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 11:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rV+7QbIpoEHyV1QEHhNp3YtVSX1/V3k8/A1NIhk+ID4=;
 b=SebKKM2A6F1mWz9TyAm2rHniatujs6WnYYjDJT1UEfD57Pv4fvPFZd4VfAbXFLbjj7
 BTAXrBWyVydj+7toBtnKqAAXg/gL78KVEb4UgwUvpGPFL+WjJ3Et3+Djo7xXIVwGGzoJ
 Q3XQy1sAtSn9NpGQH1v8J23IxreP9D98pikJ48dAVf4Jin/xOL6cJiSHdHrTsChGMzm8
 pYtMoz3kY1ktY5TFKiIB4/uckenADHq+3/zgm6+Q5S8U5cV/Ece/iEzXkXLMGGNBiCgI
 xQv9hDzOQCNMd+lAbmAXqa1u7P9ZCX2/2ev57nsK+Yh4bBWoZvyeuyKhcplBEahH7WMt
 1/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rV+7QbIpoEHyV1QEHhNp3YtVSX1/V3k8/A1NIhk+ID4=;
 b=Y+BZbDLTVllnAij7qToV7sDsg2/VLFoaGVHBOLRCLLZ2eQVoyL2ctSsXmfoZ+nmGyR
 6+oL/LqRh6QD60a4FC98zLFW1Zw0MXVCdu4wGktI6WjqQX9AM0yT7TLvKpywAbPBhWrY
 Mv3utb+oqxlA2z1U73BNuoo8V8b4qOANu7+IIeHv3VrWKUh35lB9lqronrEeSk4Vr5mO
 RkxSiX5aobicAbf4M38ktzYSK8F8qp1vgmc0k0jChLAbuXOY9oxS7PXnui3mioBNNjSc
 F/VdI3CD8e3e1LT4iUHWWQPS1qn4nRMB4RFo8wStQ1mw2OLZpxauzeN3CAYSLusFZ5Nv
 Eo6g==
X-Gm-Message-State: AOAM533XCqGs5MjUT/p4LPSAz/tIuFP/jMV6PMi7ZDUPatW6mS+ZUrWY
 xOH3TBSRCfxPMwcWq/Z3EjWT6Q==
X-Google-Smtp-Source: ABdhPJyNR5NlijxCxWh1GOoMaQStn0ETWQLD0me+RpD+TTHMBngQj/gW1GRC2Gjq6CqVLzH4bZEBfw==
X-Received: by 2002:a9d:5b4:: with SMTP id 49mr6984843otd.136.1607627623808;
 Thu, 10 Dec 2020 11:13:43 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id v13sm1197641oic.17.2020.12.10.11.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:13:42 -0800 (PST)
Date: Thu, 10 Dec 2020 13:13:40 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] remoteproc/mediatek: change MT8192 CFG register base
Message-ID: <X9JzZKtgGYELamYe@builder.lan>
References: <20201210054109.587795-1-tzungbi@google.com>
 <X9JUmRarnxPaXtrZ@builder.lan>
 <CA+Px+wUqWh+_B6rQ1kyZRALF9r-HE8ZWpgt0c9B6doxRXLZ+9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Px+wUqWh+_B6rQ1kyZRALF9r-HE8ZWpgt0c9B6doxRXLZ+9g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_141351_287356_44E0E61A 
X-CRM114-Status: GOOD (  15.00  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu 10 Dec 11:09 CST 2020, Tzung-Bi Shih wrote:

> On Fri, Dec 11, 2020 at 1:02 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 09 Dec 23:41 CST 2020, Tzung-Bi Shih wrote:
> >
> > > The correct MT8192 CFG register base is 0x20000 off.  Changes the
> > > registers accordingly.
> > >
> > > Fixes: fd0b6c1ff85a ("remoteproc/mediatek: Add support for mt8192 SCP")
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> >
> > I presume there's an associated DT change with this?
> >
> > I'm okay with taking this, but would like to have Matthias ack on the
> > fact that we're breaking backwards compatibility with older DTS.
> >
> > (Or I could ack this and Matthias can take it together with the DT
> > change, to reduce the breakage gap in the git history?)
> 
> Yes, it has associated DT changes.  But the board "MT8192 SCP" is
> still under development, the DTS part hasn't been sent to upstream
> yet.
> 
> Thus, it won't break anyone else.

Then I don't mind merging this, will include it in v5.11.

Thank you,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
