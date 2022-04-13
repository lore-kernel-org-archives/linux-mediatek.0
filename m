Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78070C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 21:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxHNNYyeY2Bg3JBIVUvvESB6IfyVZK+cf1PuB6hJI9U=; b=T/MgiCZumoPRn4
	se0EepHZFqvam4aFJ+wZeUdoFjbT4ouiVpxm68VhEf8GR6m3sz7lX4zDiCOMCdKzR8H9ZQnwRiRXn
	w77UUtKSxfttMKGmENKRaBNq/hXKP5IREl5v/I/6RiZ42soB8rflgE/7Nj+snenUgrE/vh8JLTR5X
	c21RDaHq0xEjJHF3HMlnUZQ1OdqmuGdeT34Q1FttbaJwxUVVExdExa9jzwLMjjSl59N3Of7Xnt933
	MAZ33xL24tkXGWCP9wYrroAIwM4xzCngNcyq7U1vuyiVJUzeF2LT1QriQwUYHCrpoWe4BPcd8mfUk
	MpUEj3j8G08/mAqKu4Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nekQB-002io2-1Z; Wed, 13 Apr 2022 21:21:03 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nekQ8-002imw-JA; Wed, 13 Apr 2022 21:21:01 +0000
Received: by mail-oi1-f173.google.com with SMTP id a19so3426365oie.7;
 Wed, 13 Apr 2022 14:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7YzYdFiMLsDoyTU0PbwVa3WC4PKMjoqkq1VcU6L/mnM=;
 b=W3CG8DIH0hWLGZXkONNug7uvQ1UbCshrsrxskY3JfgA2eYK+qh8oT3d6oHx2cAeQ3l
 XhbD6ZKmYPQrRsH9EJArDaVPKAYjo43BJVW0U5nnOzvkjJ99/WB43HxPEVnbzb63FLrR
 1dffZ4WZL6ozyykyTU25ZSEBsV8Se3nSWJIocQimvTYum0NPeuJXYgSZlCohqbwpJ2Bf
 zfZdCYHq61419icpln87fDx4QsvD+cAWWraAcOD61dc5yaXHduqHkEy4RSejotJFLFOS
 324QarzRNVwwjbKTU/FAqC9gOEPYhtEbVzAFo/fK83yy1+XFqLHnBhWQ3E9i/zlK+HUP
 vF2Q==
X-Gm-Message-State: AOAM530yYk0e9lHYQ+CWTJcVlMjsa2pvLzMwlD3Bnb8WfG1SyXWYZDI1
 Or0lY2acbhCxWu9Oy9rzNQ==
X-Google-Smtp-Source: ABdhPJy4XCwE/l0IcNFu8QLwKB/o4da+J+bSKytm1PrKJqmc/W/35vPD+DdPKg9ewLQ9IkLcmNk+6A==
X-Received: by 2002:a05:6808:21a3:b0:2f9:a87d:53a6 with SMTP id
 be35-20020a05680821a300b002f9a87d53a6mr34405oib.85.1649884857359; 
 Wed, 13 Apr 2022 14:20:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j5-20020a4a9445000000b00329dab1a07fsm45143ooi.17.2022.04.13.14.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 14:20:57 -0700 (PDT)
Received: (nullmailer pid 3948819 invoked by uid 1000);
 Wed, 13 Apr 2022 21:20:56 -0000
Date: Wed, 13 Apr 2022 16:20:56 -0500
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, rex-bc.chen@mediatek.com, jitao.shi@mediatek.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, chunkuang.hu@kernel.org,
 airlied@linux.ie, linux-arm-kernel@lists.infradead.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4,2/3] dt-bindings: display: mediatek: dsi: Add
 compatible for MediaTek MT8186
Message-ID: <Ylc+uMqGS0w2T72w@robh.at.kernel.org>
References: <1649495514-25746-1-git-send-email-xinlei.lee@mediatek.com>
 <1649495514-25746-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1649495514-25746-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_142100_663590_A1F5ABCF 
X-CRM114-Status: UNSURE (   7.84  )
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

On Sat, 09 Apr 2022 17:11:53 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
