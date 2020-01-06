Return-Path: <SRS0=+t0h=23=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EFEC33C8C
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 21:57:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E0C207FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 21:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QVH36Smi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E0C207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HbKKQgOuwpzydZe2Hb9h0NPo1Zm+OO3lVxD8yXnH58=; b=QVH36SmiSguLYK
	QpqxRq3gqzXFmR4HMnJqzKNG88nYqPZEm9EQNHbwpilmDAidrnZkUPSIlWZdA3ZCa4QbIc4SeMN1p
	ytxC6+d2Yq4hqpAASK4BsZXg0nyAkT4RcDtWweFr0TjlhwbR+4y4REfRl0JCa+WJ/yrI3vhHLy3MD
	Cpg8t0mPQI3+OxP11hfnJ1VZHpR05xp4wEbdizYhUb6u74WP/h2Hr/H8UlxZbmih0pPz/axqDzOow
	8cQypCidPe3GUESRt9AZpaXwAEERJoXvHrKQBYh6ta8mbfZQRSLurj5s2w/+lR57/Yy3vvkGXzh14
	aM9TN3OgzmUYVvCTPyMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioaNi-0007ze-Dm; Mon, 06 Jan 2020 21:57:50 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioaNJ-0007Z1-4L
 for linux-mediatek@lists.infradead.org; Mon, 06 Jan 2020 21:57:26 +0000
Received: by mail-ot1-f65.google.com with SMTP id w21so65780185otj.7
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Jan 2020 13:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TkT8eaIKGqV3wsrlyewlpi+P3L8o3guOiv9YMvMP6U8=;
 b=dselZLK8cfNvEpBBt8cXSrguWOGgNVNAj06jGKHt6XKBnvuy7ZyVpZYz0lZB02iWcK
 LSeWogqNAATcNkQfK2Z+LSe98lfUd8ik/ylDqluI1HEIft/4dkOKHHqyE9a2i0s8Q4x7
 EnSan2IlwH7lq2rDhWtwQIup7tNGLEalx6W0iyfP0AmTcrzjg8NLrL49w+22MMwSAymA
 ZqEeNOf+OXUY4DUXkhEayeg+Pi0XXJjf4NVcec3ShlVo1D0sNpBiX8+qQZBOM4X+zx/O
 SCOp7BcYSXklmXrvHwEAv6RkF/MUu3Yv+IBkTlQ/e7RYFUNc3LurbYIl+NrN2Oy+xFyX
 4SxQ==
X-Gm-Message-State: APjAAAWRZsseyZ39KJnIRvRYHgIcwurTpqDs57n6jjkpox2uTer35DxW
 BM7cZ3MXwHhbCk0RkePe5i6OGQU=
X-Google-Smtp-Source: APXvYqw2bH65KczcRKw6CaCWI59Yj8k7Byrnh+JsH9KB6uAes+kULdPVtrGFe5Uwu9UGh5geUbwEnQ==
X-Received: by 2002:a9d:4796:: with SMTP id b22mr43018227otf.353.1578347843445; 
 Mon, 06 Jan 2020 13:57:23 -0800 (PST)
Received: from rob-hp-laptop (ip-70-5-121-225.ftwttx.spcsdns.net.
 [70.5.121.225])
 by smtp.gmail.com with ESMTPSA id w201sm21822480oif.29.2020.01.06.13.57.22
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 13:57:22 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219d8
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Mon, 06 Jan 2020 15:57:21 -0600
Date: Mon, 6 Jan 2020 15:57:21 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Message-ID: <20200106215721.GB31059@bogus>
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_135725_209398_863FB6E0 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 freddy.hsin@mediatek.com, linux-watchdog@vger.kernel.org, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 p.zabel@pengutronix.de, yingjoe.chen@mediatek.com, matthias.bgg@gmail.com,
 chang-an.chen@mediatek.com, wim@linux-watchdog.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 6 Jan 2020 11:11:35 +0800, Jiaxin Yu wrote:
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
