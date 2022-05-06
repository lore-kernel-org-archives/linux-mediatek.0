Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE6AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 03:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pbll5uvowZ/W4CoyNukinwAZ29qF6bcemeuiyyTEm90=; b=ui0D7u9LlhiDs6
	PY46Hbm35G8XWgt1J/qHzJfxcNx0vd7lPtUY4NymWFl5EFM4S/+Qqwo1OCTQzUPZqdMfFEg/DQdL0
	Qcc7hawMi/DEZXlSdLygEvgOOx5llkEbO9kfO0Roqr7AoSvEe3GbcA0GRz5G5FtBiFQd2Jt+/2EHo
	oOqUGBcFTdqcOoy/XF0oe4lJr1NQC2G2xquikUdzcbNllVTZyU6CUsa5LYoCFcjf+UGaWmWSiMV5t
	U03Hr+ZfBXE1UegKbzeAxjfTPALGA8mPOpJYFSX93QU98yIZ2Oxu5EjXSegB8hL5cKNB7UZHlKAR9
	iiM6STvCYA37Ade6fmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmoi3-0019w7-I6; Fri, 06 May 2022 03:32:51 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmohh-0019hB-3R
 for linux-mediatek@lists.infradead.org; Fri, 06 May 2022 03:32:33 +0000
Received: by mail-pj1-x102f.google.com with SMTP id r9so5908964pjo.5
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 20:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=asq1GsK2iP60zPURDoJiaqZrj1b/oRYrh2NIL66ASXY=;
 b=A5R+QgbkQY/b9pt/zpN4FQSLdc75DJtMIayyn5WIe1M8RAn5/H92sELF5NQSRbYwaP
 h0KnGXdji5cdjXEl9Yeo1eDyfPEoc99H3bfSd+F2l1ihlR0cRc7LocmA+Y34+hwQK+jD
 HS3mTrHBIyHs+ZjqKGJOW5PhD31HK0S5UWooJflZSS6AFdyPyOJBx6bB9btEWOO6itiy
 /vB8Ko49CwAQdUxK2/kXLOTaBNOg0l6Y2hRBXFaKs/NKtibrZF3z/ExqnnKwe4jXlAXX
 QAhuM9HqDlFQUeQX+3+N0zz9U6TNDtN5J8MmqWLNa7xUSBLFpBitD68Kx81P7nKR445K
 ETQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=asq1GsK2iP60zPURDoJiaqZrj1b/oRYrh2NIL66ASXY=;
 b=q/abqE5Vhz13EMOafT6/Td743HBFdcEOpASELH2lfdvWWko1ke146xhYuSBUUNdhpG
 LdoO+15urcVMo04hgEdnaDU+bJcni7Dli4W4g3guq6D1ZbngjaX4y6TCw8tDTJ1G4+nZ
 emYbRtRQNRwhRhvEeNMMpALEYM4NTeTMrX4mMePTIBa/idEVUDp2PTYtrvTZ/R0JYr03
 Bx6S2ixOp7of+rE925QEfomvgJYH2/udf0hdH598ewlk6yzZjtEpKFyYOHhq4di2KuBo
 e14ukxRcfWDGHm5iow4uBRW7UCaRQkWDmL7yh5G3ybXR4mdMqPr6xSS1CwKQ093qcGfD
 RHzQ==
X-Gm-Message-State: AOAM5311SJ0JEMRsL+AokM9Bl3tt50ecHZ+hqDy/kS+yRmI7mGYkpEui
 CCdpFDQpAzemY6Wvh7GeuwThVw==
X-Google-Smtp-Source: ABdhPJzUQR4zLt0S+U3opN35Ejwzugn4AwM70j+cIKNxj/BkVwRUQvHT3NOFZ9B0ZDH+yZ1YttAyDw==
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id
 n12-20020a170903110c00b0014d885905c8mr1578557plh.156.1651807947447; 
 Thu, 05 May 2022 20:32:27 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 s17-20020a170902c65100b0015e8d4eb2a3sm383395pls.237.2022.05.05.20.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 20:32:26 -0700 (PDT)
Date: Fri, 6 May 2022 09:02:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 jia-wei.chang@mediatek.com, roger.lu@mediatek.com,
 hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH v6 05/10] cpufreq: mediatek: Add opp notification support
Message-ID: <20220506033223.6ixlse3psixfeec7@vireshk-i7>
References: <20220505115226.20130-1-rex-bc.chen@mediatek.com>
 <20220505115226.20130-6-rex-bc.chen@mediatek.com>
 <89dc58a34ea080ca50a94187e24cabc22aba3304.camel@mediatek.com>
 <CAGXv+5EOdXFjwbtZWY4_KBdp6BaQdp389JqUS18ifAgdcQiAtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGXv+5EOdXFjwbtZWY4_KBdp6BaQdp389JqUS18ifAgdcQiAtQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_203229_198092_A5C1547E 
X-CRM114-Status: GOOD (  18.19  )
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

+Konstantin

On 06-05-22, 11:22, Chen-Yu Tsai wrote:
> On Fri, May 6, 2022 at 9:56 AM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
> >
> > On Thu, 2022-05-05 at 19:52 +0800, Rex-BC Chen wrote:
> > > From this opp notifier, cpufreq should listen to opp notification and
> > > do
> >
> > Hello Viresh,
> >
> > There is still ">" in this patch...
> > I think the root cause could be the "From" word in the beginning of
> > this message.
> > I will not use "From" in next version..
> 
> Could this be a bug in lore?
> 
> I'm not seeing this extra ">" in either the email in my inbox, viewed
> raw, nor the patch downloaded from patchwork [1].
> 
> 
> ChenYu
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220505115226.20130-6-rex-bc.chen@mediatek.com/mbox/

Interesting.

Konstantin, we are witnessing an additional ">" symbol in the first
line of the commit log for this particular patch for some reason.

https://lore.kernel.org/lkml/20220505115226.20130-6-rex-bc.chen@mediatek.com/raw

Any idea ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
