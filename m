Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFD7C83000
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 21:30:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B014C20787
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 21:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MzAJAfKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B014C20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1IX5fkphNFS1fRDaoFoIFnIBm/+QltzpuP8ubSInEQ=; b=MzAJAfKGPsZjii
	/p27K5cCZXlZ5czwz5FA8fgBUzCzyzoTGHQfBZH8ziT/O0NwTYRtEo9CAxj7iLYTK4jHPzZgowbYa
	DSsX/2/JGEvrXw5uZfrpyucnbeRMbUQNmciicJer8r7q5deD30D+BAdcQCsqKdfJfkZgYcD/ECVUY
	xI+WWS356jt0pB7DV+lMOn1dCSdYq525GuCsCV4Iz8PiTb2KKRqX4Q8vlX/vpff33Y459ipwRD1C4
	TATc+YAZw7CqhIvOixziXIkEacmmyecdfXmmRZYoWzFUWX/Am9Olx7Hd75NG9QgFDZylg/KR5PK7f
	EVwUr6dmOLICVh6/FL/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTuI5-0002K6-JG; Wed, 29 Apr 2020 21:30:49 +0000
Received: from mail-oo1-f67.google.com ([209.85.161.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTuHt-00029V-4E; Wed, 29 Apr 2020 21:30:38 +0000
Received: by mail-oo1-f67.google.com with SMTP id h23so772070oos.10;
 Wed, 29 Apr 2020 14:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sNKlT+9/zIdQsL5FmjDdatJ2sdOrBvQb7gIEQfxHgsc=;
 b=o4UuyZ5jtDI8QIyGsoAOPV3MITuXsoJjEE49bIOhctRz8hr15AE/JFJs9g2xHjPFxm
 e97pXaqrOrQ0SIumbvr1dOtMuhfOCRfUualdUj9mKV3z2oiiytM0mxhC8cu3URyeeRot
 9kHcYwcyChQ315uikAOgfQJLsKeulO2Ryx6FecQFyZQ708l+j/4lc0mXOOAHHXKK/aXz
 Cpa5x7UpasF8vfXyS3vkkgxX5fmCMYQHA0ke7Wq9PC8v6pLncSnhauyLJpocmrlwFLqX
 uyBuH/RzEJetJUf0M5basCPnFz3X4KTwI4PMlFKlSfE1p9BLZqzWBnkr6jh0LV1I+6b0
 wnzg==
X-Gm-Message-State: AGi0PuZvkCKMrh0EpOR0OMjuzEwgGfRZI0j2MOYjvjtRI5PNe4Hh2MFX
 4HXTNdguSsifcnc4Urws7Q==
X-Google-Smtp-Source: APiQypK+APtg89af1Xjg8bKvZAVWBN2auKSMy5LvFjCDfw9Xw+dgMjfH9LB7Dui73Y7zFNedvbVvyA==
X-Received: by 2002:a4a:e5c5:: with SMTP id r5mr88626oov.56.1588195836410;
 Wed, 29 Apr 2020 14:30:36 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t13sm684710otr.43.2020.04.29.14.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 14:30:35 -0700 (PDT)
Received: (nullmailer pid 31939 invoked by uid 1000);
 Wed, 29 Apr 2020 21:30:34 -0000
Date: Wed, 29 Apr 2020 16:30:34 -0500
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy-mtk-tphy: add the property about
 force_vbus
Message-ID: <20200429213034.GA29572@bogus>
References: <1587100986-3104-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1587100986-3104-1-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_143037_165756_1F39125E 
X-CRM114-Status: GOOD (  15.88  )
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
Cc: devicetree@vger.kernel.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.Guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 17, 2020 at 01:23:05PM +0800, Macpaul Lin wrote:
> For some platforms, they don't have vbus pin connection between usb's phy
> and mac. Hence we need to control force_vbus related registers to keep
> hardware works normal.
> This patch add the required bool property force_vbus.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> index dd75b676b71d..6b49b651becc 100644
> --- a/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> @@ -37,6 +37,9 @@ Optional properties (controller (parent) node):
>  		  calibrate
>   - mediatek,src-coef	: coefficient for slew rate calibrate, depends on
>  		  SoC process
> + - force_vbus	: if the platform has no vbus connection between phy and mac,

mediatek,force-vbus

This is board specific? If SoC specific, you should drop and imply this 
from the compatible string.

> +		  (force_vbus mode), then this property should be exist.
> +		  Otherwise not to add this property.
>  
>  Required properties (port (child) node):
>  - reg		: address and length of the register set for the port.
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
