Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CE40C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 20:19:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F1AE64EDA
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 20:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F1AE64EDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0vkk/R4j4to9LWMwFvhLwiEZaeFEAziTlv68bw9Oq7s=; b=hoEHLAFzaJfOUIrN52M3/wafB
	USm+I8uR+6vhqXqie6AQwbAjXj8JpMxsZzXwDrATKwGZeKREKjnFFQEfOQCTZGBk/o1NtFlpSXCDK
	w7iYlCd31Ml6X8bNuGvWELxPI9aqv//1ab2a62is63+cYbeTSO1ThoCrKgIWuhtKcqI49WU47R7Jp
	GpfIuqCEyis9ju8WLk3a3Qpi3SulXR/1pQlpfEd7Y55kzWVCLxiXv2rsCsdTsG/di6RaYc+Zugsof
	os+gjhiYQvjWxO15V731J8xSrQpU25L8CJJZOxlygW/thoMSuHuZSxsXa2C3y4Hzj4IWXk+I+G1xO
	9T5HQ0PwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9vwz-000134-IX; Wed, 10 Feb 2021 20:19:01 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9vwx-00012Z-Mb; Wed, 10 Feb 2021 20:19:00 +0000
Received: by mail-oi1-f172.google.com with SMTP id r75so3482097oie.11;
 Wed, 10 Feb 2021 12:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1V8t5Prsyy8S7mj+k1iwfG7SFJZpLRdBoSrJSVmZLDo=;
 b=be+loU96chEXqrQSOM0+yWaf6c1X/dpIhFGg8fomUJ4T66AZB8TcLB3VPP9toVZBli
 SMnJxo4P2IF8JcE4eQZM3hHGFWeForBoBt08VTLf3dDZRTKOKGetEEgPwm3slVdpSO5V
 3MWgzcaDLntRko2pW2Y00/nSpZQyPMCOWIBt5vuAY2MaaueQp4UAu9vCSUuwLnI3uvxc
 hCGl0G2pP6s4VThxkCMSRdbAT9k4UueSdV1AmlrMp3tGcThnjWZBbBLSJwGGkKwJzh4X
 ENidrNnnUsWenJkBru24DJUkEhK+Yl9rX4zEWlXdtCjZupRlUG7RCpP3mplxMNQarVR8
 0JAQ==
X-Gm-Message-State: AOAM532GzRNRJ5TvxTriZeAMsWE2WGNPELBd0M5OymbM8EmETo7vFKXc
 9P/xCgpfUNPtYqfZ7v9YKg==
X-Google-Smtp-Source: ABdhPJyuS7VjbrxGJVv3iJ/xTI1HQADlXtLQ4n+iMb/j+EHT3Wlzn5vWyImtbs3aFTQgWbK0PwMUGw==
X-Received: by 2002:aca:c545:: with SMTP id v66mr532401oif.116.1612988338560; 
 Wed, 10 Feb 2021 12:18:58 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l133sm654257oia.37.2021.02.10.12.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 12:18:57 -0800 (PST)
Received: (nullmailer pid 2690216 invoked by uid 1000);
 Wed, 10 Feb 2021 20:18:56 -0000
Date: Wed, 10 Feb 2021 14:18:56 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek,dpi: add mt8192 to
 mediatek,dpi
Message-ID: <20210210201856.GA2690160@robh.at.kernel.org>
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208014221.196584-4-jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_151859_774363_DBA27FAE 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, airlied@linux.ie,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, shuijing.li@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 08 Feb 2021 09:42:21 +0800, Jitao Shi wrote:
> Add compatible "mediatek,mt8192-dpi" for the mt8192 dpi.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
