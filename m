Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C60C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 22:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q6iNDbY6eucLcPlZoLKJcJ9YCaBJy/YONdkYlP7II9A=; b=sg9iMBkfad5z0V
	ti0fj7jCco1MjqJWej6+JUu0Od5zFR9ex1eveayKKJwdqrNJcLyFrZAL7sTJU9pHPeJ8Nqa3SPPl6
	s/H0tE9RobwMrQsUAYRxPx9TgLlYVMDoLZNSMcS0lQvSeIrdEjGMZZh6V/EwaUL+Sqc6tPuWTSJLi
	EACqBLdyon/oRXWsHhs1KjDs2zW1I7nCpiKNk8EfXk97tgpupDXWrBn9S98PXKxr0Tu1LpOLDZ5EZ
	cMmxePdhqr0EdOv+5egK9XhBHj2/VasVO01ewOVRWi8XebiVQAbzUQb4GODDspSP5bURDzOFeMqql
	uKQaj283m5VCU7YtEx2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSR1Q-00EAV7-EB; Thu, 10 Mar 2022 22:12:36 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSR1N-00EAUR-VV; Thu, 10 Mar 2022 22:12:35 +0000
Received: by mail-oi1-f170.google.com with SMTP id n7so7444831oif.5;
 Thu, 10 Mar 2022 14:12:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=omjoz0M9biHPr5EKrbgbc5QfautyWsC0HyZJaIjRDEg=;
 b=IZMStZR5jAV3k3D0rMjJBwqKYepOfurfxd+EUuucYjeK7WhvuxsfsyWn1R+Qe769QT
 37oMQnWTiNR/Ct4JDpMRC9NUHL2O0zv9jpySiRaxFEpwKktPe+eV59Ux+02fo38H2UmM
 ll5FXTvhzbSY2zUjVApammh0gi9CZVEAyAGdg6k6fhXkgmMLF8wad6vWXGxyPE+WO+az
 cHsvVR4bAEkfirK3BIxm1xhN0Cmv48qWRUUsIsWuPDCsA7cZvr0N3oenAI2U8OmnoqJN
 IyGm1P9Sc5iVOVFwqe4p+jyuS0ONRdElwQo/DiMqzx0Wsgy6SbPurC6Qep7BCNSMCYdm
 QsOw==
X-Gm-Message-State: AOAM5322Mn/xVOBSLkHtmCjR/v8czUmkcpqMJEl93P83c41Y4bnCigHE
 8HdVbUmun0ygCkkplJ3j6g==
X-Google-Smtp-Source: ABdhPJxHna6A8giuUalT7X77knNuIyLF0eFu5RYM8FUTp80V2T9F0GnnEXgbqAyoeBJg75biyF6+tw==
X-Received: by 2002:a05:6808:1528:b0:2da:7f1d:f847 with SMTP id
 u40-20020a056808152800b002da7f1df847mr1796358oiw.85.1646950353167; 
 Thu, 10 Mar 2022 14:12:33 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c14-20020a056870b28e00b000d7d5962242sm2821551oao.35.2022.03.10.14.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 14:12:32 -0800 (PST)
Received: (nullmailer pid 2175473 invoked by uid 1000);
 Thu, 10 Mar 2022 22:12:31 -0000
Date: Thu, 10 Mar 2022 16:12:31 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com, yc.hung@mediatek.com
Subject: Re: [PATCH 2/5] dt-bindings: mediatek: mt8195: add reset property
Message-ID: <Yip3z3XoarN8TeMn@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308072435.22460-3-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_141234_047094_4BD2307B 
X-CRM114-Status: UNSURE (   7.89  )
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

On Tue, Mar 08, 2022 at 03:24:32PM +0800, Trevor Wu wrote:
> Add required properties "resets" and "reset_names", which are used to
> specify audiosys hw reset for mt8195 afe driver.

The subject needs to be more specific and indicate this applies to ASoC 
and mt8195-afe-pcm. Try to write subjects that could only ever appear 
once as you can never make the same change twice.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
