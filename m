Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EA3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 23:45:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB2960EBB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 23:45:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAB2960EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIX5PVGq0x6TzyD7L4/hWSiBgk3SX5sXbVGpgytcydQ=; b=yG9yTOa2JjG4uS
	NSggyu6F1lraB6ejMZQfDRCvfn0QUaBXBXIWJ+AHQZUlS9y0BzOBnd6ORefz/Hd1XiVr6/OtqF6tt
	LqpLLo3ll5L8wRMMZUo2T7faL9g1QvGgUmQ2D9lrVBWxG4Xx5S3cFpiaO8gApBLcwr3lV09Kqdf95
	IkNAzG82x9LBRFGIsdQYeMO9vzAckJxO5y8izkhT/8PoPtfi9FXfqxmN2Zu8hN0WqcoETi4rEmvcS
	uX3dOGPpex8CSBM9/sc5sFaHmqBNHmQOeT+BEC4NWNG2YIpFQu+Q2+dfEDLYPlpBO1+M7NF7ovGbE
	hSkZtIAhnzAKmGz8f9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma4ya-00B0wI-F7; Mon, 11 Oct 2021 23:45:00 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma4yX-00B0ue-4s; Mon, 11 Oct 2021 23:44:58 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 s18-20020a0568301e1200b0054e77a16651so6942155otr.7; 
 Mon, 11 Oct 2021 16:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dq9+YkMx0GHCeJWvTqnKsmwOPTk7sjGTA6ATq7IokFA=;
 b=IDHapy8uufacRFp8g1ubIdDWN5zhrPKmcsIcB9KL7PAcHZfjkvasPZ3F1eGaPu7qYL
 NJGXqkeEkIBpyHhSHOEV/ShqqBJ1vf39qprq6W71MDbQoHfzONWeDi1Ok+guwoT6gHWK
 ZagsE0tDs37NgXc10B8Hvrjx7rLgEyXwPCuzXjUB73CiHzZ10XsYUIVRYD8Y2w7hdKph
 CHaw1Gv/pZ2eZgb7Ng+lMZwFSMch/e9ZksXRFg9c9KYmm1GBcrXpwWAK6U/FSi96kWWp
 a2elZPcYq0kgJhtlazGcs5XCsw58OUpsTjA3tZfaH+naJ9o0FhDfuSfZCAllyvZ1/nFn
 6IJA==
X-Gm-Message-State: AOAM530UCbw5IZxmL7Y6A+MhV8Y8oGJPDiE3VFqGn/hTyfAaA400nR70
 zcpiDT4l+uaAs/8zjfzfwQ==
X-Google-Smtp-Source: ABdhPJwdGAZLwdNaLgCvThYshN0fgEkSQ3hr7M+UCK9PDK4rr/2YteoPrw9SV/cr4euuY0pIsDg4ZQ==
X-Received: by 2002:a9d:7114:: with SMTP id n20mr14449501otj.25.1633995894622; 
 Mon, 11 Oct 2021 16:44:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id r4sm2060017oti.27.2021.10.11.16.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 16:44:53 -0700 (PDT)
Received: (nullmailer pid 1392392 invoked by uid 1000);
 Mon, 11 Oct 2021 23:44:53 -0000
Date: Mon, 11 Oct 2021 18:44:53 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: mediatek,dpintf: Add DP_INTF binding
Message-ID: <YWTMdewWCNCZy+UE@robh.at.kernel.org>
References: <20211011094624.3416029-1-msp@baylibre.com>
 <20211011094624.3416029-2-msp@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011094624.3416029-2-msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_164457_215390_9A895604 
X-CRM114-Status: GOOD (  13.79  )
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

On Mon, 11 Oct 2021 11:46:18 +0200, Markus Schneider-Pargmann wrote:
> DP_INTF is a similar functional block to mediatek,dpi but is different
> in that it serves the DisplayPort controller on mediatek SoCs and uses
> different clocks. Therefore this patch creates a new binding file for
> this functional block.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>     Changes v3 -> v4:
>     - Fixed clock names in the example as the clock patch series is merged into
>       next now
>     - Add missing ports decleration to the example
> 
>     Changes v1 -> v2:
>     - Move the devicetree binding from mediatek,dpi into its own binding file.
> 
>  .../display/mediatek/mediatek,dpintf.yaml     | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpintf.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
