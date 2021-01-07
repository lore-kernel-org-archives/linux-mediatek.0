Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1575DC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 17:54:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8CB223403
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 17:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8CB223403
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HUXQFYc4a+XKtFbicPyD/LlwleG2G0WOJXRw71/Tjlg=; b=3kpgWBu6peKn4B0GLus0JbTOt
	D2fmR0/oK+cUQN7AOvw+yzdg5mCOyiEtucqR54lL5sXWih/OC+L8BDjWTiM8z1WeiHWn5J4kNkFka
	d1oUKlAihG6Kt1CNNS0FjWTUzvLWWAam0pmntyAD22UKTIy38fkvSAWQirEctyKUDsfeNHMoYF/aX
	3G9TpmXJ8XP80yoB4jI+cZO6yAscHPc0IXV1OKAEIO7xVpWj9M7TRjDQzhqY1/iPKuaRVfEikBmZR
	ghjmFyrzAVGTvnC89bnAlnohd+uNeGYFF43i6nbYEuQFXIA8i6a8E/UH03ck9THpKiFbIoMLfxlZX
	IDcnjdhtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxZUC-0000CJ-0W; Thu, 07 Jan 2021 17:54:12 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxZU9-0000Bc-Kc
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 17:54:11 +0000
Received: by mail-pg1-x530.google.com with SMTP id p18so5434147pgm.11
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 09:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IWDaWvFgIj6PDvmAQcUMKtpRMVpX3sfMWCsGoHCRRMU=;
 b=zQLv9ng9eOHhK1e/h86+a9yh/LgrUGqObWfOKQ/BUlm1mbjrcEhbhfEibCjnX29o1t
 ttatKOq6oj/9QocQzsB5mfszuFViFwv1Jntdk6CaNo8ow8jS7r4Ofts2jdkZlddlsw7m
 1XF3MEUE0pEOCFwYwfZtWgXTGprOvTMRP5yS+7qRfM9nRFqpQDVW5pdEQJOpvCJX7dBe
 pjlGfjFc7bBZfGXEZgJYiCER3PT7Y8UatpbnpcCqFTns9aP2AX+u5A0UdpC/i9SZ8k5W
 m8OaSYPivBJnZLVzEOY4Y0+VadcxU5qOtTUkAhGBsoILN+ZhHeBRFcJYVhKMmILkkCHk
 cvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IWDaWvFgIj6PDvmAQcUMKtpRMVpX3sfMWCsGoHCRRMU=;
 b=nkYRAfFLVeiWtyvR7oYq20/qQ5m0MQNwW1KIdKZ4dFLpT+UbrF9P9BPZwUjNVKxa0i
 SGgp1uT6Ur+gdomILnfho1mWx3iU2HtXyC4wUgExJmQgA5YBkqm2Nkfv7ZSKP8994z1a
 CjUnTzvBxVA7DqzCVJCK9sgFW86F19A74GCUAFeMVkojwrItlO5Xec5pRG13LuKTDcYi
 3XuD/th3klbAF9BEiYFZSLsiOeQRwh5yRmJKRRl5XwSSMRTMXQocb8PFGEFB1Tm3OOv6
 e8R4Rjo2dTSHskkjOtMlHCYdLHESh+gur/m3rfUwLsgsX1czJPTW2cDHb9yUOaAf0THG
 zrZQ==
X-Gm-Message-State: AOAM532WSsudDdymo4HCBF7NTRVodVWrZmvtYLGOq0Hou/g3vOOamf7Z
 ZyodChCD+k6HTmyY1e6ui7R5hA==
X-Google-Smtp-Source: ABdhPJxCfrjEXiW33j6eEsIDc7kOPI8fuEpZoFk+csDEAoECb4+ggDNJWA6uJddxVoP2HXVARmd61Q==
X-Received: by 2002:a62:fc4f:0:b029:19d:d060:27ca with SMTP id
 e76-20020a62fc4f0000b029019dd06027camr9499492pfh.66.1610042046636; 
 Thu, 07 Jan 2021 09:54:06 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id b12sm6364417pft.114.2021.01.07.09.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 09:54:05 -0800 (PST)
Date: Thu, 7 Jan 2021 10:54:04 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH 2/2] remoteproc/mediatek: support L1TCM
Message-ID: <20210107175404.GA33624@xps15>
References: <20201214050521.845396-1-tzungbi@google.com>
 <20201214050521.845396-3-tzungbi@google.com>
 <20210106231513.GC9149@xps15>
 <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+Px+wXEV9GDCMjR8inbQ89tNV9n7RedeAOGJL_yATmeCLjXJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_125410_027498_78C85044 
X-CRM114-Status: GOOD (  17.92  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 07, 2021 at 09:50:21AM +0800, Tzung-Bi Shih wrote:
> On Thu, Jan 7, 2021 at 7:15 AM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > >  static void mt8183_scp_stop(struct mtk_scp *scp)
> > >  {
> > >       /* Disable SCP watchdog */
> > > @@ -714,6 +749,19 @@ static int scp_probe(struct platform_device *pdev)
> > >               goto free_rproc;
> > >       }
> > >       scp->sram_size = resource_size(res);
> > > +     scp->sram_phys = res->start;
> > > +
> > > +     res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "l1tcm");
> > > +     if (res) {
> >
> > As far as I can tell the if() condition isn't needed since
> > platform_get_resource_byname() returns NULL on error and devm_ioremap_resource()
> > is capable of handling that condition.  As such the code to parse "l1tcm" can be
> > the same as what is done for "sram".
> 
> The "l1tcm" memory region is optional.  The if() condition is for: if
> DTS doesn't provide the memory region, kernel can skip the code block.
> 

Very well - thanks for the clarification.

> >
> > With the above:
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> > > +             scp->l1tcm_base = devm_ioremap_resource(dev, res);
> > > +             if (IS_ERR((__force void *)scp->l1tcm_base)) {
> > > +                     dev_err(dev, "Failed to parse and map l1tcm memory\n");
> > > +                     ret = PTR_ERR((__force void *)scp->l1tcm_base);
> > > +                     goto free_rproc;
> > > +             }
> > > +             scp->l1tcm_size = resource_size(res);
> > > +             scp->l1tcm_phys = res->start;
> > > +     }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
