Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216E5C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+nVRzE5F6H7ljQN+KdyMO4WxMW2YocCFtKBQnB2nvM=; b=0IezNN2qCe/6RJ
	oNnUDpP0BuJ++135XxO4knCH2qTzprSO1I8mMAlVm89pas/IA+681mgYBPZChhdJYzyZNs0Z8Xyt8
	ygBj6FnYg6isNUzCfXD0JwDQtW4lSLvpJ0sn9BLHuL37uN8lMTI1SLdl58B3SBGT8MX33CFAJ4Qdp
	D7kGqaqmc4/vy1dmc59pVCwAaY7pxP6azOPk66jA52gorUS/AMQmDvMptvtM6Qty4sY3CA6hdIB3u
	0HrPVJLPTb9G/ceQK30Mmbe1WHNnC+HQy8YNMINckLhk61je6GWwDThN3DZs2c/U7FUgAZoxNmxvW
	CpntP0YOf1QBNPWu492Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwm6G-003bwl-3Y; Thu, 02 Jun 2022 14:47:00 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwm64-003bu0-Oz; Thu, 02 Jun 2022 14:46:49 +0000
Received: by mail-oi1-f170.google.com with SMTP id l84so6764318oif.10;
        Thu, 02 Jun 2022 07:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9OqbyLMTa5EEL6RxtyCIR/NHZfXvXp6qSuYlVj8gFdA=;
        b=yZdNotf7rhcFHlKNPq9BlWGn8qYCmfeZsBoY3kolFyllCECNnpaOU9zunlB+6TSrKO
         2QugjYaN/i4f6yTKm/PM/rwRD8J71eRq3wQ43p44NFwSaROMjnHxhqjRxdHFyau0xxF3
         p28qcoikS5n/DRRtFlG9KB/8t4V7ABEDWGW27h/zAVz26ZVDME/NwB+mZjT/8/0pTFVb
         R3K2ISyLNbv4OraL40Wd3LkaKGtMfZBk2hvpuC7fjqwmctIIUjlPsGEv8zT2K5xYTU42
         Hza7dlPdxye23GJoQ1zasQmwsHgM+ZSsoVm+v4IBYRjcuX8S/tstFSB6M5nH+P4puYKY
         WQjw==
X-Gm-Message-State: AOAM531gfqFzApDIfU5MIrKupY57EBpLA+jNVtQIpTDbGKMW+UN1eOnH
	kTRMjV6T9nL1XQBc/JMUow==
X-Google-Smtp-Source: ABdhPJy6omKqs5U1K2FahbzcdCjnEXHb8La5WghrtetpNPL23YoGja2J0Zasvgq2RMqS0e/WWXxC6g==
X-Received: by 2002:a05:6808:20aa:b0:32b:a632:fb5e with SMTP id s42-20020a05680820aa00b0032ba632fb5emr2855961oiw.264.1654181206717;
        Thu, 02 Jun 2022 07:46:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y12-20020a544d8c000000b00325cda1ffbasm2338898oix.57.2022.06.02.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 07:46:46 -0700 (PDT)
Received: (nullmailer pid 2291389 invoked by uid 1000);
	Thu, 02 Jun 2022 14:46:45 -0000
Date: Thu, 2 Jun 2022 09:46:45 -0500
From: Rob Herring <robh@kernel.org>
To: Axe Yang <axe.yang@mediatek.com>
Cc: devicetree@vger.kernel.org, Eric Biggers <ebiggers@google.com>, Kiwoong Kim <kwmad.kim@samsung.com>, linux-mmc@vger.kernel.org, Chaotian Jing <chaotian.jing@mediatek.com>, Lucas Stach <dev@lynxeye.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Yue Hu <huyue2@yulong.com>, Stephen Boyd <swboyd@chromium.org>, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Adrian Hunter <adrian.hunter@intel.com>, Satya Tangirala <satyat@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Tian Tao <tiantao6@hisilicon.com>, Andrew Jeffery <andrew@aj.id.au>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [RESEND v12 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Message-ID: <20220602144645.GA2291328-robh@kernel.org>
References: <20220525015140.384-1-axe.yang@mediatek.com>
 <20220525015140.384-2-axe.yang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220525015140.384-2-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_074648_848004_AB386A48 
X-CRM114-Status: GOOD (  10.90  )
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

On Wed, 25 May 2022 09:51:38 +0800, Axe Yang wrote:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 50 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
