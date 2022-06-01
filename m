Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C64C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 20:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLC/bx/+DAWTu6vMHPeWuAFJmoHJUysAXNH1hAngVk0=; b=WTWs8A/R83RH9N
	rPCkasCH3jPP3L4iQwPerrEeCyVL6xcsd25QnW9W35zEleKubL7hJQAoxOnI7YzUy/edg5Se/Xnmw
	C8gBU9KS9pEbLoj27hS+K8xxZgUBTJQgvY8k32r2i23e39M4ETKa+3wL834+GNcQmnYZOScBJRigW
	yOfStZiftxy3I4lJjm7VwR7Vr5DyP/uXVkKEws+LisyvDCwn7iSaobQvLhfyN8EGm0wQWP6okOCuo
	Dqn62sgQMeuQ0g0+smohqUqwbcF9aBelogYuaQxyie96yEK/vkf+OlRNwCMmV6F1gDKIGOITj/XvJ
	wAN2R8PxRae9W3zG2arA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUY1-000ELf-LY; Wed, 01 Jun 2022 20:02:29 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUXz-000EKf-F4; Wed, 01 Jun 2022 20:02:28 +0000
Received: by mail-ot1-f49.google.com with SMTP id e11-20020a9d6e0b000000b0060afcbafa80so2005200otr.3;
        Wed, 01 Jun 2022 13:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FARR/+JDA3TOjsR9cI1PcwObDHIe0n2fcG4uD8FuHbA=;
        b=TZI1AGU24cXUwlnFUnJdTcPYZdQ39slTM9VvnyRe9kXfCF+dlzBxr0APPSIemSm153
         QGhQVu0Fcg3NHYo6WEn/+9L+RIJO7h32c5CrbHeQ1i9i4qhjs32uxYN0n+0wKgJ7akND
         mALQk4nRsi89wkXisepC+Nob6VgLcKdXNvUJ9T+qjFEKKhZcIcW6IHoJpt0Gmd6hBMHb
         jh71jun/DumQfu2WcY7ShswV13uZmybwG6LO4Tjb493nJ4+Hke5UQJzvFa7O8uTGHeJw
         SKYfQddxgg2RtE774Om/I3lTxI8eCjJXy8eS5XVcMQUpKRe+aZ2QGSsTcBmGJM0ythhP
         +6zQ==
X-Gm-Message-State: AOAM532s46zLiAfrHlbgtfBlgbR+jemtBkF8kSl8jd3ct3EsypcFAWZr
	fC+UZm6aLcf89donjveWLQ==
X-Google-Smtp-Source: ABdhPJwnPjn5idt9cnZlhcCc/FKbJJnAr8Saufr1/SL3DempIkGREfg8uqcEeSJtWvqQDbhLvv5ujQ==
X-Received: by 2002:a9d:6154:0:b0:60a:f566:a450 with SMTP id c20-20020a9d6154000000b0060af566a450mr673945otk.70.1654113744200;
        Wed, 01 Jun 2022 13:02:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w16-20020a4aded0000000b0035eb4e5a6c0sm1333894oou.22.2022.06.01.13.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:02:23 -0700 (PDT)
Received: (nullmailer pid 339590 invoked by uid 1000);
	Wed, 01 Jun 2022 20:02:22 -0000
Date: Wed, 1 Jun 2022 15:02:22 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, sboyd@kernel.org, linux-mediatek@lists.infradead.org, marijn.suijten@somainline.org, wenst@chromium.org, miles.chen@mediatek.com, tinghan.shen@mediatek.com, jason-jh.lin@mediatek.com, rex-bc.chen@mediatek.com, robh+dt@kernel.org, mturquette@baylibre.com, fparent@baylibre.com, ~postmarketos/upstreaming@lists.sr.ht, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, chun-jie.chen@mediatek.com, phone-devel@vger.kernel.org, sam.shih@mediatek.com, ck.hu@mediatek.com, martin.botka@somainline.org, ikjn@chromium.org, devicetree@vger.kernel.org, weiyi.lu@mediatek.com, paul.bouchara@somainline.org, p.zabel@pengutronix.de, y.oudjana@protonmail.com, bgolaszewski@baylibre.com, matthias.bgg@gmail.com, kernel@collabora.com, konrad.dybcio@somainline.org
Subject: Re: [PATCH v2 2/7] dt-bindings: clock: Add MediaTek Helio X10 MT6795
 clock bindings
Message-ID: <20220601200222.GA339557-robh@kernel.org>
References: <20220518111652.223727-1-angelogioacchino.delregno@collabora.com>
 <20220518111652.223727-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518111652.223727-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_130227_543847_1DE86071 
X-CRM114-Status: UNSURE (   9.51  )
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

On Wed, 18 May 2022 13:16:47 +0200, AngeloGioacchino Del Regno wrote:
> Add the bindings for MT6795's clock controller.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>  1 file changed, 275 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mt6795-clk.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
