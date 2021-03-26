Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0020DC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:46:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C6161A3A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 01:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C6161A3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JYCEE0mopMDP/qxQ9O3O74iz4aLqFYMcZfQajV/Cqbw=; b=pAkxq7X2j9pqTtycp3u8mYPXW
	L5broATJbMvnVppxeTEp8LTNG2+5ZckVHcBqaQTGRAcg83eh7LyDU4GM3/43CIgAwoad+6o7rlrPO
	NSEEAppU3icMByYCHnKd66m1R0g2pGR/DG2et/Vo4D68CVX9/1w+KlEB30WVyhGPZdKamO2adRMIp
	rJyPrrXadBA/F3KJ/X4f94YoSof7A/Ii5DU7copEq4T6RlGlBqNbxnXgvTIuSMQxJMCW0HaojB4vR
	i9c0Z7O1qm2OguMEc094W3rdWO2qO6syY87woLgVFNrewbUCl04CXetAIbnFZ0lIS3o04e72NGUFR
	4Jqyjhwrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPbYj-002Vau-9w; Fri, 26 Mar 2021 01:46:45 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPbYc-002VZA-1e; Fri, 26 Mar 2021 01:46:39 +0000
Received: by mail-io1-f52.google.com with SMTP id b10so3895484iot.4;
 Thu, 25 Mar 2021 18:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nvithE7/FIorOvL9kBoun3Ntwce32avmj2Owugyp6qI=;
 b=ubVqYJfIjt704bzTISoxaicbY2jeGyH6igBDQgis1jj2iZ+fW8cCYhqze5/2mPXARq
 eD4Fgpx3PyQp5xJNO3Llxqm2a4M8wfLpLBlEk6YBrEJnDvF/k3GaZXsruYxcqme5Cq9F
 JL2AooA+ZyTApb7YFyi0rMbaX3z491BE6Wahjbexb6wzeiIs4VUxN9JmM2rpRXZjDhor
 3cHSysRBrHQqkzGz/epzw54baMuKyLNZk7vHqqpze1uPwSF4UbLEuUPu6qkD4Gjdca0e
 RhYQi0NsuJ972anGBIo+Ip95GBu/ojX/5BW8DmwwN+zNnRGzRYpbLBE9+J9ZMTz+5Ac/
 K+Mw==
X-Gm-Message-State: AOAM5333n6ZXbcGToBrfIglSZiyH8neIXvC+O24XPSaOK++bJDMJJVZx
 Wmdi8c7wSev/jipw5UauPA==
X-Google-Smtp-Source: ABdhPJyDWeoqK4Lz3I+ovulrBbiFBNy8x20L52/OCMJ3dD8MkbG7dI1iRyAnnxpnYS3fxan0WplBmg==
X-Received: by 2002:a6b:5818:: with SMTP id m24mr8253046iob.144.1616723197079; 
 Thu, 25 Mar 2021 18:46:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id q21sm3395845ioh.41.2021.03.25.18.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 18:46:36 -0700 (PDT)
Received: (nullmailer pid 2154786 invoked by uid 1000);
 Fri, 26 Mar 2021 01:46:35 -0000
Date: Thu, 25 Mar 2021 19:46:35 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Ben Ho <Ben.Ho@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-damu
Message-ID: <20210326014635.GA2154730@robh.at.kernel.org>
References: <20210319035245.2751911-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319035245.2751911-1-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_014638_274669_9981E8FA 
X-CRM114-Status: UNSURE (   9.62  )
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

On Fri, 19 Mar 2021 11:52:42 +0800, Hsin-Yi Wang wrote:
> mt8183-kukui-jacuzzi-damu board also known as ASUS Chromebook Flip CM3,
> using mediatek mt8183 SoC.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
