Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4389C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 11:10:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8783D60E75
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 11:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8783D60E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jz3ScxLxMMDmmpaX+oOaziqbzQu23lZYUWitzKVpkNE=; b=eRFRmjs/Ek3np7
	zd0fhdqAIvaihjpyX3SyPCNXleKAl6D7MB20+k3LLWNqIt+3mFJWbH3Jf38AJrLlbTtq0rrx8lJAq
	KtK3osUQ3CtLPm/gCMaTOdn732tVDr7TKZfF7smQNjdP+GBnjt9oETu6D3jJrfQ29Jn4ln/rL1ew9
	Mzvij2cz2qZAKDHL/A92jhxFKwXG04LhUamclWrNnBfnhwfirCDfzdcEPJwTGHJnSU/dA5KsxKUrV
	vD+4iFiAIypXs0OFNo0uC0z9U163YRFFM6r3HqKyQk0PYyPcsLnSN35fYPc0OpYV6mlX2NWRjjBS6
	25NRxeTiph/fTiCUpx7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6t4X-004Sxg-QG; Fri, 23 Jul 2021 11:10:29 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6t4V-004Swg-II; Fri, 23 Jul 2021 11:10:28 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 19-20020a9d08930000b02904b98d90c82cso1682497otf.5; 
 Fri, 23 Jul 2021 04:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ItsRsZ0+rGylQYA+RELfRwpVcM273u0/L6xue3YIFTA=;
 b=mgZxllDJunjoK3CtlARUlfLQNAlHIMceNdssna93H1gvGsVkjbKCjeXwfaKALFHizP
 +Y1XZcKvjH1iQnJ0/Ky5KHtTGpXSvz9a4yB31+JlI9uF3CHnUEVO1K2oEON+GxU4rCkI
 L0wstpPWTGcGN3ukpI4x1nmdMQaYvvW8wHQbsFxP47E/bxFXJ4AF5QvtFeKtSnuJBKfg
 MjUE2uePwDC+tZXum5IbjSHP8qOVpr5oXCFRJaxZXEyyxD8GK7q7EeAoC/fzug6goK73
 mGfo5Lz8KQNUMm3jwzRPh5K0HgVo8KfnWG58LKxGV0f2KFcDCBE0PMNzrJHv6r/LAKNh
 fCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ItsRsZ0+rGylQYA+RELfRwpVcM273u0/L6xue3YIFTA=;
 b=Kq3O3OZrVA5mgw47bAPWigVv1yLuXGyGSjCas3WlzCSvIuv3ZYP7B2Fx6FXX9DU52U
 TTMHpMQrwMgl/k55TLJzYijHxlCfHF3qaTrCB/dRYdBivpuGy79oudt9ltiaD1mZhm5D
 KL/ao2r0YP8IFVXhwe8MzTTjaiHtr7EQJ+CYS+mO+J4JJIPMT+XmvEfMQ6lwtdB/cb4r
 n0YgxkB8j5vrE4IR4D38SVFiklNhShiQPYvZayGhOmGVOjxvgj0Nl0/ahtUO9ZAzErpN
 7JS3ojGGnTVZC1TYKDTaho3HM23ryEZ0bFEZCtEx4wGUb0jvyriqp7/kylleurUfRLvX
 Lyyg==
X-Gm-Message-State: AOAM533sUzH95g3tBeEwBz7p7S7devb8CSWO3QEyz1LzmN7PPF2LKziQ
 aKZp4Gs0wAlO8+/i0mbbneIRvLyWk1M9GfX0YYk=
X-Google-Smtp-Source: ABdhPJyTbyPS7OPxgzkKeQ0xejJgwTXa3EwT7cNdLuCl25tp5G3mArCVKEQZIg8TwboZwxHRabaGbXKTcoVEzwUnzvo=
X-Received: by 2002:a9d:491:: with SMTP id 17mr2724546otm.184.1627038626371;
 Fri, 23 Jul 2021 04:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-5-nancy.lin@mediatek.com>
In-Reply-To: <20210722094551.15255-5-nancy.lin@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Fri, 23 Jul 2021 13:10:14 +0200
Message-ID: <CAFqH_50qC985oTcPWDLRJt6yVvwtHsizPOTnTMBh84m6Hy6hFQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] dt-bindings: reset: mt8195: Move reset
 controller constants into common location
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>,
 devicetree <devicetree@vger.kernel.org>, 
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_041027_666310_A27116C9 
X-CRM114-Status: GOOD (  16.79  )
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

Hi Nancy,

Thank you for your patch

Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de jul.
2021 a les 11:46:
>
> The DT binding includes for reset controllers are located in
> include/dt-bindings/reset/. Move the Mediatek reset constants in there.
>

I think that the patch that introduces mt8195-resets.h into the
reset-controller directory didn't land yet, please sync with the
author of that patch and just put it in the correct place the first
time.

Thanks,
  Enric

> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  include/dt-bindings/{reset-controller => reset}/mt8195-resets.h | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename include/dt-bindings/{reset-controller => reset}/mt8195-resets.h (100%)
>
> diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h b/include/dt-bindings/reset/mt8195-resets.h
> similarity index 100%
> rename from include/dt-bindings/reset-controller/mt8195-resets.h
> rename to include/dt-bindings/reset/mt8195-resets.h
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
