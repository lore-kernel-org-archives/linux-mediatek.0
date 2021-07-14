Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742EDC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 01:57:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B3F61380
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 01:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B3F61380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2gQrhBTdtYGGfgOKd/BVkJpS/rC2JTc566a40GfJWU=; b=UHMFuh03yYBXfi
	Y50TgiiGk7kw/lXyknKHeoDLT0w31Ptnrwgiw4TPmu1+LjXvbyCFPprqKBPk2bWxe1+L/hDWUFvId
	8vGnPHQC++D62rKvEVhmfzx0G+doiGwCKdhbtT6Esnu9wAgw+PhLJRBIJ2rpxLpRbIMaPUNwQ7i7e
	cj0z5ZtlOz6V4oh48JZxHyMzYtR16lGANLlZOuY4C2mreZIzxnZxd7D0PNMU+oulxYz7+yL+Tgu65
	P6kEXCW0ZO+MqHE7WcJ9pMzKwUhnKeuRkbhFnbgCNGuK4ZUNZ6Vel8CoqrObyL2MYuhZHkuHJ92Ox
	sQ5ox/I/cqXFeW6ACcAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3U8y-00BsAf-2V; Wed, 14 Jul 2021 01:57:00 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3U8v-00BsAJ-Ig; Wed, 14 Jul 2021 01:56:58 +0000
Received: by mail-il1-f179.google.com with SMTP id b14so10982ilf.7;
 Tue, 13 Jul 2021 18:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SzFlmTgHjr8nlAUno22TBO+Fp4BVkU4LSybrQMcw7J0=;
 b=J2EdYLTlobkh9D1kMBRKlKYI8CwWV6jg39bNGspSnKH5P72O5QIgPYNbkY8DNB11rB
 spFOCcRbJUVY4++BIpXuHbNZLsB8Diy2vZdpX0SJTJEcO2AMYyB0c4u8oA76EFtkbPAp
 /eZFWs3PMZV55b09Fkrl/PT1y7UfBR1smjYAqp2ndQP3KWdEQ/SH4PX6GVgLTAchvkTy
 H4FC2hTdYr4d1WZfAADubxEgTGx1CX8XioCx/X5HZi/6czWlxy+gYBKcnDuYCL4xE69F
 X2OROIsff1/Hy3jahl1eSSJ3xW5UT/XQkpWYi8Zscih0fFlLVQAbnM8sRLwwPYqWvAWL
 xC/w==
X-Gm-Message-State: AOAM530+aRMf2EvHuuq9iN8szrMs+vinbExDEVJglcWDhOOtye/1GcLS
 5MaJTZcOsxrmkZVpIi0rHg==
X-Google-Smtp-Source: ABdhPJxrLTEdobWW2KnlKwGJQE3g45G28/p/hH4Ow2vtL2GnCFPNNi8aepfdovJ3SfMCNM1HxKx4+w==
X-Received: by 2002:a05:6e02:114e:: with SMTP id
 o14mr1506070ill.301.1626227816751; 
 Tue, 13 Jul 2021 18:56:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id f7sm421300ilk.64.2021.07.13.18.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 18:56:56 -0700 (PDT)
Received: (nullmailer pid 1282996 invoked by uid 1000);
 Wed, 14 Jul 2021 01:56:53 -0000
Date: Tue, 13 Jul 2021 19:56:53 -0600
From: Rob Herring <robh@kernel.org>
To: Christine Zhu <Christine.Zhu@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com, linux@roeck-us.net, seiya.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [v5,1/3] dt-bindings: mediatek: mt8195: update mtk-wdt document
Message-ID: <20210714015653.GA1282938@robh.at.kernel.org>
References: <20210628113730.26107-1-Christine.Zhu@mediatek.com>
 <20210628113730.26107-2-Christine.Zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210628113730.26107-2-Christine.Zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_185657_661346_2BBBB18C 
X-CRM114-Status: UNSURE (   9.43  )
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

On Mon, 28 Jun 2021 19:37:29 +0800, Christine Zhu wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
> 
> Update mtk-wdt document for MT8195 platform.
> 
> Signed-off-by: Christine Zhu <Christine.Zhu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
