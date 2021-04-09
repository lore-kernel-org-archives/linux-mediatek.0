Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8AAC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 18:24:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C6E6115B
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 18:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C6E6115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y0WWCrgwe66nMMJAWhKccRrL0IZ89F2npb4wODAyyKg=; b=Lm/OJh7UBijcA6Btv+VFzTNS2
	UMPO9ZxdjkKotP3q8NqwuvSqirM1yFLVr3e+PDSX3X4hgZC20l4fnih8Uaw+ZIetJuY0B/cwt0kkA
	hWAQScv7hZAGn1Uz6uZrNw5BZq5NSCalLgsalm/klIwP1hm6jst/MjNhLXK4I2v0Lg+qGhtmYuDhW
	hrT23pX+i6n2nNkGXMdWPnUoHSQ6I5PbTP4l/rM4ALRKF6Hi8rmG+4o/otefoKhO/O4Xt4Fvk8kYq
	l2R+5zLCqt2T2MLDkULpB+wdMVp6lvMccsaYTtm+ZHVn/rWXItHo7kWspgedqaGcAF+uSEW8c1cmg
	lEELUCI3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUvnP-001K0w-Hi; Fri, 09 Apr 2021 18:23:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUvnD-001Jzb-Rl; Fri, 09 Apr 2021 18:23:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=d207QBVLXb7TnGS575+pzpbSUq1/8jioPIMHCrj9Isc=; b=jLKY2vodTIdHot2aogHGKsZ/45
 KoJfyAbC45eWOk67rC0voafctE+4R+ot1QCy9roc7lffgK1TLoChh/t/LeKWdHAQJWYYiW4jnej7e
 Tql5Zq8vutnjLtRG0vwPUdoBMOhrwg61LHJagrTobUnN9JMMrqo27Wr2x8ZyZWJ6TP/a1bNx6GFzr
 e0OzlDCPH45Hi4Kz3z9RJ/lrw9IwF/JscuOYPRNtFljdpY/TN/FlBHhzniUPE720K3DSn8JHv6D27
 n05ZIRaE0M6g3veJf4D37i25OhutnvTdBSb1tVhP0YGveefTtQdRi7gNh6q2CIpCL4t0dkSJaykGG
 Hgm/HQsg==;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUvnB-004j4j-G4; Fri, 09 Apr 2021 18:23:42 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso6569681otq.3; 
 Fri, 09 Apr 2021 11:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d207QBVLXb7TnGS575+pzpbSUq1/8jioPIMHCrj9Isc=;
 b=MRIjGEPU4jPvkHEcIvUGhJIuu8Sm8l87XD1x8tetuxCRspQNp7M0IMHJiJDM5UoHv7
 5wfQmhBk/rp98zxf+rLWz8x+0F4GyuOMcBYHi7dmHJRebkK4Qqqj9GmIMzR08801G0fS
 4o5RIRIuR+J95jhbY/wLWb7G9UtBn5InVsdQhWB8UqCr1arW7wswDvs4i2Zv112AOfgi
 YPoAHCXB0mDeQHZI+Jf0mYiRrForNkNvCTK1/HK8SrM/CD6bQ8uYnyRIrqYVR+FyETWW
 rFY1xAyhoX9ZkpLUlYnQuREgS1Vj9Nag+0a9edwIaLR/t9p15ageHMBnaGOhP+Hzm229
 JkLw==
X-Gm-Message-State: AOAM532H/am5RmSyqgsmUEdVMCetafiJEKt8vH7JGimJ2aMtjGTW3EnN
 Oeo+fzVJDyEW8BpYt9X0PJXIR/o0eQ==
X-Google-Smtp-Source: ABdhPJzRgWnpxCjum+zOKwCCVU1QTor6U2aI8C2aYZTN61R1qG4ctru1jV7yiE5oulHX5NC/Kkzkhg==
X-Received: by 2002:a05:6830:14d6:: with SMTP id
 t22mr146613otq.152.1617992620114; 
 Fri, 09 Apr 2021 11:23:40 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 128sm661264oog.37.2021.04.09.11.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 11:23:39 -0700 (PDT)
Received: (nullmailer pid 3913489 invoked by uid 1000);
 Fri, 09 Apr 2021 18:23:38 -0000
Date: Fri, 9 Apr 2021 13:23:38 -0500
From: Rob Herring <robh@kernel.org>
To: Flora Fu <flora.fu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
 Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/8] dt-bindings: apu: Add MT8192 APU power domain
Message-ID: <20210409182338.GA3895583@robh.at.kernel.org>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-4-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617766086-5502-4-git-send-email-flora.fu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_112341_553793_3D343448 
X-CRM114-Status: GOOD (  15.88  )
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

On Wed, Apr 07, 2021 at 11:28:01AM +0800, Flora Fu wrote:
> Create MT8192 APU power domain bindings.
> Add top power domain id.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>  include/dt-bindings/power/mt8192-apu-power.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 include/dt-bindings/power/mt8192-apu-power.h
> 
> diff --git a/include/dt-bindings/power/mt8192-apu-power.h b/include/dt-bindings/power/mt8192-apu-power.h
> new file mode 100644
> index 000000000000..b821bd4811a6
> --- /dev/null
> +++ b/include/dt-bindings/power/mt8192-apu-power.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_POWER_MT8192_APU_POWER_H
> +#define _DT_BINDINGS_POWER_MT8192_APU_POWER_H
> +
> +#define MT8192_POWER_DOMAIN_APUSYS_TOP	0

Really, you don't know what the other power domains are? Please make 
this as complete as possible. These headers create a merge mess.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
