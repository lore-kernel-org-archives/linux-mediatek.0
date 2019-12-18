Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F0DC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 18:15:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E7C218AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 18:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hSvXBqi2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E7C218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hq/gjXuSw2AJxd74DaL1IcQTSRdUflKwIocHwg6+CRs=; b=hSvXBqi2gfhj96
	W+eUn0H4rlEm1oaZYplNcO42pwjlAv0fFdO9yuzKwaOrBjQ0Za6AwNJuigreB3jOdLrUbWqZA02Ml
	60cFt8s7LotmpRc5KimfM6d7ct1uUIcasFEOUIaKaXJrrZ9KqLtyDzR/BvWQgVte4mDd2SQz1QBBc
	yauUmwIfeFLnmz2ivlwXevZBdDfpuykZBAl2vILjqxmBFxmZRJ1Ztq9PflKVzvOrqbumtAjDeqhFo
	swiqhxnkDiPHjgW47wUHZp+M0rGuU5SBpNi0YVIt6yl/eczHsE0C6X6bHE7JrdV2uqRs109r/DBIK
	RCN/cWoMkfdC1m2ZQK6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihdqu-0003QX-6G; Wed, 18 Dec 2019 18:15:16 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihdqj-000256-1Z; Wed, 18 Dec 2019 18:15:06 +0000
Received: by mail-ot1-f65.google.com with SMTP id 77so3551585oty.6;
 Wed, 18 Dec 2019 10:14:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Joaw7/XAOOveu1GS58tOvSo24yLU2Vq2eez0hj0oxxI=;
 b=tbgEX/xvcJmNoTJ1zvTvUCsgxSvGSvpxaj6cIZRnNABug459DFSDIDAj4Mu6UDtDX3
 7QkQfi8Oq2b36zpG0eiDlareSaWMbiFF1DKqpfx6TXhNzTcgpnaktqDte6SwwTKeULzx
 r9jcujnLuYSDyEMUD1Tt0VEs3BVonZpp8bEr5XC2/9X2xkz/teWxPDZPa1n7ph33ZZco
 cVxa1XYXZGiSCTn2Pv814KKlXNLgqLoicySwkK2rBQJAXjB+ibwjbfWrj5S1AMUvruFH
 FGE0vRJw9DV6DrDRNmRiSqtvn63DQ+RScPH/bXZ7+Dt/yc5yQjkFoHL9IQtDTAQZ039q
 B+nA==
X-Gm-Message-State: APjAAAU1ntn/D6cmVKMKrIuhEt3lzVleaQLWwisdAnvDbYyiFCkU+gQI
 JweyyMKopT5+GunppLvk2g==
X-Google-Smtp-Source: APXvYqyoQd/upD6YD3POKyWidARuJplw8nUXBR63avEydvr3JAGmT9UWeuqxABxXovlfVreAUCvwWA==
X-Received: by 2002:a9d:5e9a:: with SMTP id f26mr3967611otl.307.1576692895673; 
 Wed, 18 Dec 2019 10:14:55 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t196sm802325oie.11.2019.12.18.10.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 10:14:55 -0800 (PST)
Date: Wed, 18 Dec 2019 12:14:54 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
Message-ID: <20191218181454.GA15293@bogus>
References: <1576081356-18298-1-git-send-email-jiaxin.yu@mediatek.com>
 <1576081356-18298-2-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576081356-18298-2-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_101505_100860_2C32A92A 
X-CRM114-Status: UNSURE (   9.26  )
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
 linux-watchdog@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, yingjoe.chen@mediatek.com,
 wim@linux-watchdog.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 12 Dec 2019 00:22:35 +0800, Jiaxin Yu wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add #reset-cells property and update example
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
>  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
>  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
>  3 files changed, 46 insertions(+), 3 deletions(-)
>  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
