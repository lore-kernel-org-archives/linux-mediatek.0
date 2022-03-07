Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF44C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 23:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1+y1P2k4cHeq5kIT4cy5Lw1TE2JXY+aBzauBhbw0zo=; b=D4r4JcLnnbOAPV
	I41RP2r1ohhKJeUqvrhssANBTE21xv7MjdjQw4Xlm9wUBzUCo+9qEr/5ZwcupEaAhlI3xKbtne2yS
	L/VDNPAiTgp930Kf1L68b4iAqbqJ1BFtxSTBWO+WXsBejWuV5YSp+tXg+xDBPD047DHy/VqCwsV+s
	XOAOdlOBctSgmXHdWDZo6P+d8fL8f24VMAdxEfG/ybUmHOuUQ45+N6mfXfIABrPTM9XE76hI3rGgC
	YyAw+5kmSU9LvJqIQq1k6g1q9PI4W4GcDjEIswpvw470wD7RDrj9S+3c6yqS8r9NvwtZqczGQo5Ug
	eWofZ7d3WfUjsY+slL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMUd-001ugx-JA; Mon, 07 Mar 2022 23:10:19 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMUL-001uYL-1J; Mon, 07 Mar 2022 23:10:02 +0000
Received: by mail-oi1-f180.google.com with SMTP id z7so17032951oid.4;
 Mon, 07 Mar 2022 15:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q7OFvF8QvoaAwEulLrSHTEQKk2lZLeNunlxUwtBXEpA=;
 b=02Xay7SQ2remK6r7gZqWqEKv1/Znrp0rynFoTNb/+N60SN4w9TOg3EKXA9HsC0ReVe
 WBVpvtcVFazND9aaZrWwDcU8N/XUomCIrX5q8SV7mU+5LfrcM0QLP8zsWy/lY8LKhWzf
 8weczycM+Rb7xi9hp2xduLwk7UMmpscO9FH0XCGkk2rS2RoH9YBGER0TmljqrBJxQXdh
 EjjcrRxY3lDeRkej2N0Ed1ro9w2a5ldwOAH7xmRcUqgyG+SSLYSCmzULYgU01RlQhKtx
 C5BIZv6ZmVA4AQoWHfRYRWMqwFOv6wwfC2wdSvMs5Kf/zrKFSD8aF2LeEFGMzCMGSNUz
 WQpg==
X-Gm-Message-State: AOAM530LR4EUguiuwkdrQCOdt2jL+f0gfPSqEEu0V7pFvazMYBQ15GZN
 e8VGoWrE3K8jyOFIT+v/woMrmcwl4Q==
X-Google-Smtp-Source: ABdhPJx2aqOgx0F/m/kAyOQe60oiTGlU3FIxlP1JXZH8Ai0hS+wkkij5tLqAORKcRorjaDKGXB3e3Q==
X-Received: by 2002:a05:6808:11ca:b0:2d4:6861:2a9e with SMTP id
 p10-20020a05680811ca00b002d468612a9emr894028oiv.114.1646694600159; 
 Mon, 07 Mar 2022 15:10:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dy38-20020a056870c7a600b000d9b7eef08csm5547213oab.39.2022.03.07.15.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:09:59 -0800 (PST)
Received: (nullmailer pid 3433840 invoked by uid 1000);
 Mon, 07 Mar 2022 23:09:58 -0000
Date: Mon, 7 Mar 2022 17:09:58 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, airlied@linux.ie, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@chromium.org,
 p.zabel@pengutronix.de, linux-mediatek@lists.infradead.org,
 jassisinghbrar@gmail.com, chunkuang.hu@kernel.org, yongqiang.niu@mediatek.com,
 fparent@baylibre.com
Subject: Re: [RESEND V6 4/5] dt-bindings: display: mediatek: add MT8186 SoC
 binding
Message-ID: <YiaQxto4fwmRDDPi@robh.at.kernel.org>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <20220303065725.23384-5-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303065725.23384-5-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_151001_106551_BDD3E158 
X-CRM114-Status: UNSURE (   8.99  )
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

On Thu, 03 Mar 2022 14:57:24 +0800, Rex-BC Chen wrote:
> Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MUTEX,
> OVL, POSTMASK and RDMA.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 ++++
>  .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 4 ++++
>  .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml  | 1 +
>  .../devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml | 4 ++++
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++++
>  .../bindings/display/mediatek/mediatek,postmask.yaml          | 4 ++++
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 1 +
>  10 files changed, 25 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
