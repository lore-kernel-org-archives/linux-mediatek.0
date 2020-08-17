Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C656DC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 21:53:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9349E2072E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 21:53:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0offOHuR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9349E2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/iQTje4xQ34YSHNkBseyVJ/jp63a0SmZWNoAu3DNyXk=; b=0offOHuR6yzX5RBfytteQPX7U
	twL87evHcAo144XzdJYYiQGVfdnWGNA/ZcjiUSM1EtR1eXs95pydgxUXna6OFiqH35yzFwE8lWiyT
	ztdC5536J26GG4cT/wkCHbNpMYB6SQZf7pV8gLk6fsR1x7UpHeMV7zyNFCfedoLzFMyNjkPDRlbGx
	30hBcsx5m90SKLYd+R2CTJQQfKriCrXgnYiHKk2s6VPNpp3DcaITdy3/Sw42SeOGPGcxuxSGfKKp/
	Fcl7RFMb6lF8UKail0yO9TTEjlHQNQLS5ddqSbrF/AE/NKMp6R6Xak+xt2w55KoojgSTC1apimwte
	6enMfd6RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7n4O-0002Mb-An; Mon, 17 Aug 2020 21:53:32 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7n4K-0002Lo-FY; Mon, 17 Aug 2020 21:53:29 +0000
Received: by mail-il1-f196.google.com with SMTP id q14so15867131ilj.8;
 Mon, 17 Aug 2020 14:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=K0MBZ3ff1Lrj093EuPk59+KL9AiNGoiCQzLPeqa9FjI=;
 b=PW29+TSnUHICT6RwY0oDX+evgNPoxNnxTSV6HbxNDbcFhHTZ5roK3mktlaxpeUcSfj
 LCOQG8LwvqJsM3/9G0zWDMsEY9okmyuPysuwswdclkFfpH3MnfyeK3tN4zslyWFaM7Ru
 3KcpvR2viaelNuNq6pnUKrxaE1Vw/a3XrX72lUCez5EifD+i8JcHZ5TmwqfhV7zA+3mM
 Exk6qo1C8lwgaLZRDdRSdnEMsTOQ3+4LNz6hjFdWXTGZbIE9QVsJ2pntK4p7183a0sb4
 kpM8YGRDWKFBT3oD29x0EKE78zaoaXKcmnIKW1N30PB6zSl5yGXiwHuDd3hHV26tRECH
 yU7Q==
X-Gm-Message-State: AOAM5312yKNo9PLiGKlCZmN12IIsxgMPAT9U9QDJZkJk6P/aOLtfWro3
 aImckUNOqikYsKTE+8qBsw==
X-Google-Smtp-Source: ABdhPJxdet1AhMrLuocVe04RePHBDGwtg0ouAbeoFlf73so3cW8xW9b09tjlxnoH1Zlf/p9lfYPpVQ==
X-Received: by 2002:a05:6e02:c2e:: with SMTP id
 q14mr15985757ilg.286.1597701207712; 
 Mon, 17 Aug 2020 14:53:27 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id q14sm9665388ioi.48.2020.08.17.14.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 14:53:27 -0700 (PDT)
Received: (nullmailer pid 1637578 invoked by uid 1000);
 Mon, 17 Aug 2020 21:53:24 -0000
Date: Mon, 17 Aug 2020 15:53:24 -0600
From: Rob Herring <robh@kernel.org>
To: Weiyi Lu <weiyi.lu@mediatek.com>
Subject: Re: [PATCH v17 05/12] dt-bindings: soc: Add MT8183 power dt-bindings
Message-ID: <20200817215324.GA1637549@bogus>
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
 <1596705715-15320-6-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1596705715-15320-6-git-send-email-weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_175328_538334_D51E06A1 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Enric Balletbo Serra <eballetbo@gmail.com>,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 06 Aug 2020 17:21:48 +0800, Weiyi Lu wrote:
> Add power dt-bindings of MT8183.
> Add an optional "mediatek,smi" property for phandle to smi-common
> node for power controller.
> Introduce properties for power domain sub nodes.
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/scpsys.txt    | 81 ++++++++++++++++++++--
>  include/dt-bindings/power/mt8183-power.h           | 26 +++++++
>  2 files changed, 102 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/power/mt8183-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
