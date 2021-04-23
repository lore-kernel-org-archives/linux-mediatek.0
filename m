Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0386C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 17:40:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD376141C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 17:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD376141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nQd8DtMKWgi9L/LiSarjMhbuvlBP5i8GvhY/FjrRKkQ=; b=cDSwGD9SJPzOBtFiEko9UtcZG
	j09r5h8nQP8R2C22kA6UsvhbUtsvw3hIk7EpzGH6Gm8ivIMsNYzU1QHJNCdR+F8/IXfLqceap0/gx
	5Xa7N6mq0Cjfi3++HlTM6vj9CsXEpZsWiwxdG10jLoxz1ucDOqHtj01N5Y45eO0XKnPdRYu1i9RFn
	gtow7Z6v9gwboYOXYoeLMTj9DdblLDtSe///cVk0uYioAPq3+OC9hGL0n2LuOH+lM+1c2CvX7pmhD
	suotOWXPKcJvylDxKnR87dIpXL6jIUIJd6XfNfqqErXxQiG/JV6q5YW0D3PSkNZiZrXVvvQ244o3N
	CkUKpx3Uw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZzmM-00224k-CO; Fri, 23 Apr 2021 17:39:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZzm5-00222w-1i; Fri, 23 Apr 2021 17:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sGjhlhtLBObGLd+1LCyQnr489UoVKc66rsGAgizXgdA=; b=QPmhQJDbvsRHXK8HTM5FUA2Sny
 ZfOOTvlPkSt/zRJ86Qu1RvvUJhu6DO7keoDpSyHvbljwtOz2Evcgad11tWMwITLsfGqZ4jdAPl7Y2
 +9Aoqz6IJ9sU5wlzLvDoPYVwThRIRVhc1BnTa8gbWQlsXdy7LtWffiLcW+4K+Ncq7kDFA2nJQIwgL
 7pOZ9Jukrgi4NjtjRnSro2rnHtKa8D6LA6HFa+OSDDdshiAdhXSfmUMG0u0BI+sx+Ux563EKnp7Tk
 97PDD8gon1Timkst0V3DNqyFFOEtjVC1lmKEUNcep4MPlM1U+9gscWGiKZ51/a4Gm4kv5Ok4HyGra
 NUDywfMg==;
Received: from mail-oo1-f54.google.com ([209.85.161.54])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZzm2-00EbAW-P4; Fri, 23 Apr 2021 17:39:27 +0000
Received: by mail-oo1-f54.google.com with SMTP id
 i9-20020a4ad0890000b02901efee2118aaso3263636oor.7; 
 Fri, 23 Apr 2021 10:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sGjhlhtLBObGLd+1LCyQnr489UoVKc66rsGAgizXgdA=;
 b=dbzIwSwlgXsuGBB31OAMAHswU67stBfmnqJtRKJBHsY68f6CrVnci0vviENDvZukQY
 nWd9Gxfp0JX5Q18CQPrtL4eYPexV3djzITgLpv70RziDtunhMHG1m/XyWs1n6M8yaPqV
 KtHixVfJOOps5MELpscq15AifImx1HCyv3jsngLP6GEcLZ/b27+T574LfYP+UdgsCrmG
 CAOvCBynB5fEL2ZK0qlUwxcXC/MQM+DyCJGCILbka4r6jjTV1VN6xfC1X+uyZCVUR3KH
 TD+nNkUtgipgF5x9vQs5g5DWtiWZ59Mt4E6eAez3nq5tGIS8hChtNXcDWU5GDTXRMMUK
 UlGg==
X-Gm-Message-State: AOAM532AXeCZvwi3HBsOkk/xBxCBb27EgjVc5XMgCY0vNaIKURFOxjzq
 x0fXAT9YanyASOQ+JHgiuw==
X-Google-Smtp-Source: ABdhPJy5iKKa2NKC7L22NHljOcFkozW6mDcypQA5M62c2D/DIZ38rv/lwTl5CYBmNwkQRaOpZl+scQ==
X-Received: by 2002:a4a:d513:: with SMTP id m19mr3825953oos.92.1619199564685; 
 Fri, 23 Apr 2021 10:39:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e2sm1506515otk.70.2021.04.23.10.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 10:39:23 -0700 (PDT)
Received: (nullmailer pid 1308565 invoked by uid 1000);
 Fri, 23 Apr 2021 17:39:22 -0000
Date: Fri, 23 Apr 2021 12:39:22 -0500
From: Rob Herring <robh@kernel.org>
To: Wang Qing <wangqing@vivo.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH V7, RESEND 2/2] doc: mtk-wdt: support pre-timeout when
 the bark irq is available
Message-ID: <20210423173922.GA1308513@robh.at.kernel.org>
References: <1619148020-2236-1-git-send-email-wangqing@vivo.com>
 <1619148020-2236-3-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619148020-2236-3-git-send-email-wangqing@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_103926_830251_817C22F6 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

On Fri, 23 Apr 2021 11:20:20 +0800, Wang Qing wrote:
> Add description of pre-timeout in mtk-wdt.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
