Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E119C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pb1cxHs3wPEUp/MhTmYVTsTX3ZCauXBG8lqlhtY9HKI=; b=A0nreugmFOkN6A
	w9vH0XGNYJuAjD+D41nycBpufdjfY/n/4To41o9Tv3INh3K5KhlndbID0cxfBF/Xg5mOOU0MD/vGf
	d4C1N8eZsoYsAICVESDOn4W0/VppbkGDQiuKqj5Vr+Jfm3IyrSk9RSxhHTffKEBJ2d/IWTzXrvgcq
	0OgcXj57+OHH6CAmvAdgcUPZvhhiMlwk5L/fO2FXHQA3W95eQRxgx5LKYqDk1I0SL4Waw2A9S/u8C
	0xsKZn8yP1mQEZmbMPNRCX4vFAYLdQbCJvi6Ky75U/52Fi3pJHIwiOsDvNl/suPkFfazYX1qCA1eS
	9IGjosLGkVWZ0KKG9hGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdPm-005u4o-Eg; Fri, 25 Feb 2022 16:25:54 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdPX-005u0a-Jp; Fri, 25 Feb 2022 16:25:40 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 l25-20020a9d7a99000000b005af173a2875so3953569otn.2; 
 Fri, 25 Feb 2022 08:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8uwG0FXIRd57umSLyX8M5OYiYbBMIR95LygaqxBLElw=;
 b=qFy3IOXa68yT1gJtORshCFk7F7UvtbDGvUeYRNHZQzHPjJXvuZBenS34heBdyQfB8K
 WOa3QIdKCfrPAC7U5hSHjsfhcHQ8Z5pRrUkdkhx33fksHA8RbWdiaEO5j+z3FCr5OTi3
 tPAesobvbazbQZ3ew4JvAs2ErsQrJmlyAvyNC0qM6B8wnD/qaR2Fy/xmnba393+PqJV7
 nOtfYE/A0gsfIVyN/gD6jsrDBy4UVAVuppWvjT2xL06p1cYlTo+mrMQuLPuenIbFqe+J
 tWFOXJLn0DHkpgYEDiEi56QsCkVQUHtNaRusdqAZgMbkfPynWv2uS1jTQHginohsbzA1
 PNHg==
X-Gm-Message-State: AOAM5338yqiBEZE44wjEOJiJm0wTOvE9d3BaXw8Jg7ClWgbtwQ2ABY7E
 b3/QHX3kL+KPWZrFqJbGhAFKuC88Kg==
X-Google-Smtp-Source: ABdhPJwL2MGv3IXhqMemCxWtGXumSxgzeDQMt/Y3DnXiKFv0ruRLlIYvg5DRlMcB5n5XL4qkABZ40A==
X-Received: by 2002:a05:6830:2908:b0:5ad:1ed7:70ea with SMTP id
 z8-20020a056830290800b005ad1ed770eamr3109515otu.186.1645806338744; 
 Fri, 25 Feb 2022 08:25:38 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 100-20020a9d0eed000000b005af73c6f792sm1373289otj.6.2022.02.25.08.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:25:37 -0800 (PST)
Received: (nullmailer pid 1037975 invoked by uid 1000);
 Fri, 25 Feb 2022 16:25:36 -0000
Date: Fri, 25 Feb 2022 10:25:36 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, runyang.chen@mediatek.com,
 wim@linux-watchdog.org, linux@roeck-us.net, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [2/4] dt-bindings: reset: mt8186: add toprgu reset-controller
 header file
Message-ID: <YhkDAKC6HdnYPg/d@robh.at.kernel.org>
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
 <20220216014505.28428-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216014505.28428-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_082539_674727_7BB5F1E6 
X-CRM114-Status: UNSURE (   9.38  )
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

On Wed, 16 Feb 2022 09:45:03 +0800, Rex-BC Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add toprgu reset-controller header file for MT8186.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8186-resets.h | 33 +++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt8186-resets.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
