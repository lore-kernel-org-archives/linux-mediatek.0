Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8CF4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unH+pIqFm2zP3CnhR1M4NyhdY4/QteUZxW/ASj6mlL0=; b=svi9J11VH2ojAv
	dDaYoJGXmD+ldwNBD4JAyIdyqF8yTPzWg479PIh+CQJnongVDfp4JOI5wiCIOS3eOPwChu7ccr/KG
	RfhVsJrsJJJjfcbl6loWyK8I3yFiWWJ4C4ffzRJaBm+CXIdNhYlE6oEJeMGavOCuE8VQunoD/tlWX
	IrdMWeCEmMJ0mQD/D9O06wkrhDcrsbTx2YX4pg2eZwMttnVsn+E4UyAHJkfiUOwMl71d9dClrwdZE
	RGCsrXch4tHRdS/nVXycpAaunHTHGgmOyf0VLhKc0gnr+EXlth/tfmuBZOZNCCGHww17NcexPx6HC
	r2wTyudOcLAqfHjc85eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx3jN-00DBf7-Ug; Tue, 14 Dec 2021 09:04:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx3jK-00DBe4-FN
 for linux-mediatek@lists.infradead.org; Tue, 14 Dec 2021 09:04:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id u11so13103082plf.3
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Dec 2021 01:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BLtNJBPTKfFgEngscPwkP+dSPVASO8XmAtvek6gJJYY=;
 b=oWW67fTzZWSJL5R4BckddJiSCZc1V0b1qLTqxm9SooUgBeSwc6S6hcJOYY+CDpL6T6
 hWGAhpWOZ7WiRSXsF9XqqnNMyCLfuP3ky5z1O5ksg5D19rk/YN7Svh1QfVdQewvc9uve
 yOquUnCG6sk222o6CRpLOmlOfmdmO541bZnZD1RK2J1tZEinaIeL0/IdvGExfsmvX1RF
 TT7M6ONGo1hPzOntMTRRuEGyN0jxgFhmYoCx7PF7TgA3GkNXP+mQ48XAHRa7LEij/dEW
 6xaY627nOo4wnyAvUNRwGx0D4C9ISFYe9H//Ya5dZdg23yM6b0lfeCFOKixHiUdsfd3s
 Drvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BLtNJBPTKfFgEngscPwkP+dSPVASO8XmAtvek6gJJYY=;
 b=I/LvH67AW7FgnqIUfhTWRxKiACMZfAR4JXwz12wy2MySaBcnBzEvyRHOqkkfhhBc7+
 2GnF8QCbJvZdmqFpgMiSeznlVcVK3I4IFb4umip83XdcA02kizshM1olmzqCTLtZZqhb
 UIKI1AJK5RZtTEJgtbzJw7f+xwuwP781qHLn474yrRxjwUjz46qs2LKAQa30yiA1eRwC
 GhdqZtiRuMq7LucqmdsMyPHu0AiRrq6nldv6uIz/RusTckEsILJzgPuZIXQAaFdr3ymc
 t32iE2F816U3tKcARZLTiY0VRqDOnyUEw1TMAICOqzHUDfFou0N5xujCNECXSPZFs6dc
 qMkw==
X-Gm-Message-State: AOAM530dxVVniT5WYGdKnDAD1tz7/xFASWW3KfR9isoJ7r62W5slTFxy
 AmE3xXKd0ZuHMdM+7uLhr8qi7Q==
X-Google-Smtp-Source: ABdhPJx1RHm9shDo9AZkjS+O+13ZegDk2AOGlHxMzBO6fB4uLVCwKlFaa183sh0fIZEMuEgAOlS+1w==
X-Received: by 2002:a17:90a:ac0b:: with SMTP id
 o11mr4099843pjq.143.1639472651731; 
 Tue, 14 Dec 2021 01:04:11 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:16cc:acbf:e9c5:6393])
 by smtp.gmail.com with ESMTPSA id p2sm1782960pja.55.2021.12.14.01.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 01:04:11 -0800 (PST)
Date: Tue, 14 Dec 2021 17:04:08 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [SPAM][PATCH] iommu/mediatek: Validate number of phandles
 associated with "mediatek,larbs"
Message-ID: <YbheCEbOS48Owcht@google.com>
References: <20211210205704.1664928-1-linux@roeck-us.net>
 <ebf58066a131f92c68e83a1ef56b88f435fa0d08.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebf58066a131f92c68e83a1ef56b88f435fa0d08.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_010414_558610_14D2F91E 
X-CRM114-Status: GOOD (  29.54  )
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

On Tue, Dec 14, 2021 at 03:31:25PM +0800, Yong Wu wrote:
> On Fri, 2021-12-10 at 12:57 -0800, Guenter Roeck wrote:
> > Since commit baf94e6ebff9 ("iommu/mediatek: Add device link for smi-
> > common
> > and m4u"), the driver assumes that at least one phandle associated
> > with
> > "mediatek,larbs" exists. If that is not the case, for example if
> > reason
> > "mediatek,larbs" is provided as boolean property, the code will use
> > an
> > uninitialized pointer and may crash. To fix the problem, ensure that
> > the
> > number of phandles associated with "mediatek,larbs" is at least 1 and
> > bail out immediately if that is not the case.
> 
> From the dt-binding, "mediatek,larbs" always is a phandle-array. I 
> assumed the dts should conform to the dt-binding before. Then the
> problem is that if we should cover the case that someone abuses/attacks
> the dts. Could you help add more comment in the commit message?
> something like: this is for avoid abuse the dt-binding.

How could you make sure dts conform to dt-bindings in runtime?  Code shouldn't rely on the assumptions but try the best to prevent any abuse/misconfigured/malicious cases especially if the assumptions are controllable by other parties.

Taking this case as an example, of_count_phandle_with_args() could return 3 types of values.
1. Negative: an error, it is already handled in the original code.
2. Positive: normal case, it falls down to the rest of code.
3. Zero: it still falls down to the rest of code, however, some variables won't be filled.

The code should handle all of the above types.

> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 25b834104790..0bbe32d0a2a6 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -828,6 +828,8 @@ static int mtk_iommu_probe(struct platform_device
> > *pdev)
> >  					     "mediatek,larbs", NULL);
> >  	if (larb_nr < 0)
> >  		return larb_nr;
> > +	if (larb_nr == 0)
> > +		return -EINVAL;
> 
> Just assigning the larbnode to NULL may be simpler. In this case, it
> won't enter the loop below, and return 0 in the
> of_parse_phandle(larbnode, "mediatek,smi", 0).
> 
> -       struct device_node      *larbnode, *smicomm_node;
> +       struct device_node      *larbnode = NULL, *smicomm_node;

Setting larbnode to NULL doesn't make sense to me.  It wastes some more instructions.  If the code can exit earlier, why does it need to call another of_parse_phandle()?

Also, it adds another dependency between the code blocks.  What if someone move the code blocks without awareness of the dependency?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
