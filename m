Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 147DAC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:58:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACAC86196D
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACAC86196D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=87Ic8+Yb3+KweGCJYOf/2mXyizEeR8LE8L1WwYSZ0C0=; b=US/taBWjtKir1bTNT+VUSSv/L
	7DGm+YlTE3gcPLkt+AmQY7jxHTuBTd1lZT/Vfu/IGO/GJ2WEnPkM+2wEoVOAjEqXLvRHcrFf5H8eM
	hFVhcEsXkB4eFUJ7cYqLC7HyTNjirBUF3j27xZtuU8FoN9f5w5Hod2M4JI93RqGimhuApuHXfXb9z
	L2lbrUrW8QMHwQxZ1qx6d+A/OI6w/SX8BvjPgAxgEOMYsWZjzxXMPp/G9aSb6RA1fUNfbNBpeYBus
	T1EOINWNSfx5XurqK1L1kNqyYTypmki+e5ZA/C1kegcxxByKdsbYWiqqhtbNuTtMka77u8MlXqR0h
	7VH0dWtEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQDCR-005NT8-7n; Sat, 27 Mar 2021 17:58:15 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQDCH-005NSW-FC; Sat, 27 Mar 2021 17:58:07 +0000
Received: by mail-oi1-f178.google.com with SMTP id i3so9081530oik.7;
 Sat, 27 Mar 2021 10:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ozKLLA7yDbkQCLx/+4eOXAPun75AO1oJzOLxqsjOT8w=;
 b=kZ85v9QONk4YuZVRfz5WHtlz9TMaPBBPBL8Z23Du7T/Dee1DXcXE1mVc8IZcC8EdLe
 qUdvrRzRqcha5fBUEBTrpO63NvruQqXaL26I1cfNYbVhHeZTvsG1z4cV+cefgvNE5BAu
 tpEsNxvES9xuVeKwuj55I32roqn/YBtgt9L6oTacTYu9ktKjg8aSCcGmTvf+rsF047YH
 4xyCGoYT2wPyF5YO8bR7RABHzYcoIViZsM5eMrl4XxtBeHwRnJ3T37DRoozKJIJbpcyA
 30Pt4hW4nWt76VlzxT8tM1x9VPFokZUl1gvjjvk1n63jybiOCto2HhVPncTLw4XRWEel
 rCwA==
X-Gm-Message-State: AOAM532KFtRGpFfL0aFJWDwz9dENTeMUpiGOgLyE1LAEXX2lcbAT81AN
 PTPekbrh2NzJ5UPW7nKqBviZnBbEPA==
X-Google-Smtp-Source: ABdhPJzOuiI/VGQJh5708waZStlsiXvecENnKkT1BGVJZ0ogVzpf8bB2aa4saHfW59f91pJI0RLowA==
X-Received: by 2002:aca:408a:: with SMTP id n132mr14082074oia.70.1616867884374; 
 Sat, 27 Mar 2021 10:58:04 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
 by smtp.gmail.com with ESMTPSA id u8sm2670285oot.24.2021.03.27.10.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 10:58:03 -0700 (PDT)
Received: (nullmailer pid 320909 invoked by uid 1000);
 Sat, 27 Mar 2021 17:57:59 -0000
Date: Sat, 27 Mar 2021 11:57:59 -0600
From: Rob Herring <robh@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 linux-arm-kernel@lists.infradead.org, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pm@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: mediatek: remove deprecated CLK_INFRA_CA57SEL
 for MT8173 SoC
Message-ID: <20210327175759.GA320861@robh.at.kernel.org>
References: <20210326031227.2357-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326031227.2357-1-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_175805_665779_0369F23F 
X-CRM114-Status: GOOD (  10.01  )
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

On Fri, 26 Mar 2021 11:12:26 +0800, Seiya Wang wrote:
> Remove CLK_INFRA_CA57SEL for MT8173 since it's no longer used.
> 
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8173-clk.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
