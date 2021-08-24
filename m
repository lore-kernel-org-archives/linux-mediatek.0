Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6733FC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 11:12:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 016E161357
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 11:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 016E161357
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRrWdQTKwl8ufnVveog21sdS37dMt+C8iE10qljYCZw=; b=GOBkAicEllhnk9
	ouVHBziOgMof61F3aV3djQQFh5MboxL5tSkw9mfUTmCkcVn4gZnnpCgc5F3Lcpi368qdj7Dft22t1
	Oa4AuQPaZfaQhDCnCiViJQIzLvFeLGtavBpnp2miJfwOff2GEiv0FR9pstacSoapt4+TduTCyNzNK
	Q+m2MGlNC6TyUYUjqvRJiNyCvJR3V0ej8J1JAdLMB5ZpL9orLtVdkgi+KwDfU/h0BqsgR7bXW2qIB
	c006+6QbiWgWmWyifG+o9EzQ3iiMLY/vaE/Nm2f08XTIwRPgN/RtpzuIcNRvOFpaRItRVsK9zJZFM
	FQ9Tnl4goEt2Fbe6UuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIULb-002jlm-2a; Tue, 24 Aug 2021 11:12:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIUD8-002fd6-HJ
 for linux-mediatek@lists.infradead.org; Tue, 24 Aug 2021 11:03:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a25so16784953ejv.6
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a2CBr8Y/Dow61CgVXEVrXJocGobHhog5GoqPqKXEIU0=;
 b=xLUhwRfV6ghCPJC9K9hAyn3lJmTZl/DPfNh7qdJTbfFUdd7Z43g9wfrtJ/V6wRdFrc
 UdhpDEjRz2b0DfILeEiM+bdHLCwuXcqg3tmMkKkZke6rhQ6REb0HoVzWjOMc89Lm9jC8
 VHyt2FAY/uGShYY8f2R+xP/K+v1cGW3RnX1ogPkVxHUObnE5nbw3dHb1RvvW+O2D7XsH
 Bfy5VC3eRBD+PmgLryCqdfLgN8cZv16LDuesONnf6cgyy9y0G6U76+HozeHu9e5ucHaa
 CIIyS0iopDqAtc6Dbgse7V6P7IXCenRKpL0AlhpCmjhcYBZpJFsqCoBkZfTww495S6uj
 5saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a2CBr8Y/Dow61CgVXEVrXJocGobHhog5GoqPqKXEIU0=;
 b=kghFHnQTAVlStAL7qIWpWIpufYfYkZePCne8T8P+tjKd+Sy316lxVgAgXL4q2o3KV+
 /4Gw3ELMQByuNGYQde2411DU/j+XhJ52UnrhLVuHFTzZhLLxqO/st4cx4dYvT4EIia/c
 p/MwWiYwjoOslPXM7sR/FuNDmkBGsRqHIzjJIT0z0HREGG6je8DXZHrVsMJacV39Z7Ms
 UB58gRNNO1tEblMmSE5JDIXfMijomMEQvSAbLb5zlHMi1Y27BGV1PrnSu5Kj2w3uDwMW
 Whh5h5rdjVaWV7Zrz+7fSz4xLNCuZ+SgSBY/iX234tpLuERBe48skQAGGikP8kceBn6l
 subw==
X-Gm-Message-State: AOAM531EyHCfNtl3hyGHh6EEuBaj5xahl9On7SCCFJL2ELBU0D4m4vln
 xM3yppBl11In2LaAgSCMMqliqE67UQs1wehMvaGJNQ==
X-Google-Smtp-Source: ABdhPJy4RlvmR3GM4zZQW53D/YonuubsjtWskr93uh0HMIKrEIy6PvPo+v9bss3hc/9UYs1ggviBpLB43fyvBWQVFR8=
X-Received: by 2002:a17:906:a0c9:: with SMTP id
 bh9mr8326387ejb.51.1629802986001; 
 Tue, 24 Aug 2021 04:03:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-2-irui.wang@mediatek.com>
In-Reply-To: <20210816105934.28265-2-irui.wang@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 24 Aug 2021 08:02:54 -0300
Message-ID: <CAAEAJfDoSW3F85bFKTRvvGZXTZbCBRpUwZzEyx3zhrA6psiZfA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 two venc cores
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Yong Wu <yong.wu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Fritz Koenig <frkoenig@chromium.org>, linux-media <linux-media@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_040318_687758_339F9A3E 
X-CRM114-Status: GOOD (  13.50  )
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

Hi Irui,

On Mon, 16 Aug 2021 at 08:00, Irui Wang <irui.wang@mediatek.com> wrote:
>
> Enable MT8195 two H.264 venc cores, updates vcodec binding document.
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index de961699ba0a..eb2e24c32426 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -11,6 +11,8 @@ Required properties:
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
>    "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
>    "mediatek,mt8195-vcodec-enc" for MT8195 encoder.
> +  "mediatek,mtk-venc-core0" for MT8195 avc core0 device.
> +  "mediatek,mtk-venc-core1" for MT8195 avc core1 device.

What is the difference between core0 and core1?

Thanks,
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
