Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841C5C636CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:57:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436F7613D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436F7613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsSIrySGO5CW+bq6ybHYduasj+zWFuIlGIPFptkV6/0=; b=EDVMxwRbk+NYWm
	3q1Ln25y/sCCbIcMi9GW/36h0bbIjTcPXa3pH1bdL6hWQGov9/n2LAC4YOt6yLFrpO3+edWValEud
	IYq49sT5r9vWvJaY4B9CKcCgjbg2sAZDTicoP/Ky+9yrK2A0HZgNCyWiZIKP+Q2h2O4X0IBXUcIlw
	E+r6WC/yduHaUSU0gVEyLGmGm3oQPI3V8NC5XZB1/QXQU4NGp0UxadkmlO8NjhtTGPJsKpqBRlfpr
	eKnKlf5UWUBfpRNkMgQyUie1pUX0lFvZI7Is2XOjSt/l9o+w0Ftos2TOGYGjzNbPPbpSEeJWHIBj0
	9Ubb1p4kf79lTFiLEXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4S5r-0050xM-CU; Fri, 16 Jul 2021 17:57:47 +0000
Received: from mail-il1-f177.google.com ([209.85.166.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4S5o-0050vz-G7; Fri, 16 Jul 2021 17:57:45 +0000
Received: by mail-il1-f177.google.com with SMTP id b14so9042199ilf.7;
 Fri, 16 Jul 2021 10:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w8fuSGIRi3aXlEM3SVAucMj5af3dyv+P+T2En9XIJ/Q=;
 b=fVShNMT1FLWXMNbGYvNPdpicB6EdasaslIi79VxwAD175pUf/P8jnz+Vj6d5jdkMV1
 ITiEfRCWNrcJd5rw4IVxb7s7uC775O3/AaQiMrY/EWc3Nv2V29NNdhyf0pM7ocl/Kwpf
 gc7J8aC3P1csH7Uwq4IJYRx0HLYITVNP7iNZ/9CU5KK2bg69MRlg96T2YCDx2tUF7CNQ
 mKPUL8DxTNPwXNA7AACkiRtCMz/zkesVwCamWZ3z16TSVSsKrBEVE9CQ1GmKb1R8H6iD
 Xa9bXTzR7LEfUPyaIyYJoWlggab57OuYrwbPegIYF8sLITex9FxIwkQqMQ672588eZX4
 euSA==
X-Gm-Message-State: AOAM531T3GPUC5C2xaXASkM8qH7S126GhOdgEvfyb+8m7cJkzrZ18RGX
 Vr3csg9qbE11krrTDRRbeA==
X-Google-Smtp-Source: ABdhPJyQIdi20njTUKaiJxZnh7giOjOgLu/NhcLv5arRjHxmE92fv5pbzvwQDvh+bspS2OoNhKaUVA==
X-Received: by 2002:a92:2805:: with SMTP id l5mr7276380ilf.242.1626458263554; 
 Fri, 16 Jul 2021 10:57:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id i3sm5220090ilr.56.2021.07.16.10.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 10:57:42 -0700 (PDT)
Received: (nullmailer pid 3678871 invoked by uid 1000);
 Fri, 16 Jul 2021 17:57:41 -0000
Date: Fri, 16 Jul 2021 11:57:41 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: hsinyi@chromium.org, drinkcat@chromium.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 eizan@chromium.org, linux-mediatek@lists.infradead.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, devicetree@vger.kernel.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/7] arm64: dts: mt8183: Add the mmsys reset bit to
 reset the dsi0
Message-ID: <20210716175741.GA3678812@robh.at.kernel.org>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.5.I933f1532d7a1b2910843a9644c86a7d94a4b44e1@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714121116.v2.5.I933f1532d7a1b2910843a9644c86a7d94a4b44e1@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_105744_585100_9A679651 
X-CRM114-Status: GOOD (  13.65  )
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

On Wed, 14 Jul 2021 12:11:39 +0200, Enric Balletbo i Serra wrote:
> Reset the DSI hardware is needed to prevent different settings between
> the bootloader and the kernel.
> 
> While here, also remove the undocumented and also not used
> 'mediatek,syscon-dsi' property.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi  | 3 ++-
>  include/dt-bindings/reset/mt8183-resets.h | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
