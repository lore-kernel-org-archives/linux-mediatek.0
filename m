Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10AD1C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 16:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C77CA61278
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 16:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C77CA61278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+IeTRdWLznPf+8ZGvNv3XzzYwIEPisPorJJz67ejlM=; b=dD+9BN0yY+150z
	MeIHEh9YZph3z4WhnGNdJpPxvAX+8UVPJ8cMkqsvQjqhkvDU4KTLqJrJ0oSkLCia4jKygg2qMFmYR
	/pdzgcSJ3vVZOtKPelOcQ7jpw9TsrVpEFJMRfcUXF0Q54At4GGgG9UZxHhvb69rIrT8DZvjZTYFXQ
	K3xlEGc3/xTELpTRgYTay56BmfxaOKrKWttnpdOC/Z9DzAtaE08Y6/tyIWy6Jg5EoB6xd2d7rwVsH
	RwbN/jx5f9dkFSOZnoeiIZZEfK59a5tQyulQOc2UQCzsw390rQPIc1q785Kcv2mpUAraPe3jqiwA1
	USFYOFjtgcTVuHx3OROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m44FC-001Lgb-Bf; Thu, 15 Jul 2021 16:29:50 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m44FA-001LfT-IC; Thu, 15 Jul 2021 16:29:49 +0000
Received: by mail-io1-f54.google.com with SMTP id z17so533773iog.12;
 Thu, 15 Jul 2021 09:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v1sGyty0gd4iWu3C0ErzREGdbTnaUB1Y47ERaQdKRHQ=;
 b=EXHkZ1PZeym0uxSCMCBIfSCEYxJ342IwlHzkVKu/E3BqEuN1Ps2bV5jD/XyR7on+TR
 t6FeekjNILYQTeEAY+iJeFxYnBmttME5JcASCtvsEMEAAXpE9YzAvepS05O1Rr59QHSi
 10hLYsVW4B58e4nX61iiULjWawnGhUdNiIAQ9WyD1rL7jr+hT2c7d0iai30tpJcO400u
 oHfj4L6tMHoUl6Ns/U9APfaA8iiDf5hy9im09Y7x3uJB1G3+LuI7Op/eEChi7wh0Nhk9
 kftIbZVnQTJAYD6X4wZxpklW7iFQGW5Js1gDTxBYAL2mXBb/oUawJkLg81fBRAi43y8V
 W3zQ==
X-Gm-Message-State: AOAM5319pYDxEsViBu0Ywwg4vauFxBQAIEqcn5ueY+mqH041xuYXmVjW
 Y/XqfkCmPju14f+IIgcUOw==
X-Google-Smtp-Source: ABdhPJw5QX6CywVdSfB1MVePX9dufRHI9Tmxd4hvIU019ILBXIrMdD0QbzQb2b6Pv64zSONFgSiIgQ==
X-Received: by 2002:a02:3b26:: with SMTP id c38mr4877816jaa.12.1626366587396; 
 Thu, 15 Jul 2021 09:29:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z12sm3427093iom.6.2021.07.15.09.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 09:29:46 -0700 (PDT)
Received: (nullmailer pid 1196299 invoked by uid 1000);
 Thu, 15 Jul 2021 16:29:42 -0000
Date: Thu, 15 Jul 2021 10:29:42 -0600
From: Rob Herring <robh@kernel.org>
To: YT Lee <yt.lee@mediatek.com>
Cc: louis.yu@mediatek.com, charles.yang@mediatek.com, eballetbo@gmail.com,
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
 xiaoqing.liu@mediatek.com, nm@ti.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, angus.lin@mediatek.com, robh+dt@kernel.org,
 roger.lu@mediatek.com, linux-pm@vger.kernel.org, sboyd@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, khilman@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@google.com,
 linux-arm-kernel@lists.infradead.org, linux@roeck-us.net,
 fan.chen@mediatek.com, srv_heupstream@mediatek.com
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mt8195 svs dt-bindings
Message-ID: <20210715162942.GA1196241@robh.at.kernel.org>
References: <20210713020552.18667-1-yt.lee@mediatek.com>
 <20210713020552.18667-2-yt.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210713020552.18667-2-yt.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_092948_647894_65528748 
X-CRM114-Status: UNSURE (   9.15  )
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

On Tue, 13 Jul 2021 10:05:51 +0800, YT Lee wrote:
> Add new binding documentation of the mt8195 svs.
> 
> Signed-off-by: YT Lee <yt.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
