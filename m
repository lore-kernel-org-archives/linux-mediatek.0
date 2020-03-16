Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D46AC0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 11:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71986205ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 11:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nnBeJdu5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zem311Tm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71986205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJ/VLT4/TkdszU0w8r0GJ0WL/Mn4ODU33mxAx7Um08A=; b=nnBeJdu5qHMocn
	fbcimHz5VjEbJIUpwHXYsPFpUA+H3MhBwzRTXoiFqr85a7RUAqZNM1tT1j68ojxAwVj0KzCAm3oLb
	rDXb+yFTHR2ZcjzVVRRlq8Z1xO7vQx75buxui6A6DeywF17xoFRq4boz/QeLhdUnmqbpUfegDbQRJ
	v6h9ChTxnxngC63Lsh4cHMQ4og65y5OTkcsy/3xpNoeTlbdmEYLMFFth6lFxNuXORwSJCgvEmyFJ6
	5F6QMGvh+69earetT4U8s3WrFVxvAkON95xmvXytQ/KB7lHfBrfOl3mvcrd3kEy/tUBwA8RbRIYn5
	BwPId/FCbmOMGb2D1hcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDnVr-0005Re-Qt; Mon, 16 Mar 2020 11:02:27 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDnVo-0005Qy-El
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 11:02:26 +0000
Received: by mail-vs1-xe44.google.com with SMTP id x82so10908340vsc.12
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 04:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HYXCjPHfs8dDfhMy2nCW/5veOTWbVHj4w+BgbYglN9w=;
 b=Zem311Tm82+PW9OL0vHqTxopdfny3jc3ZE+5GcIB/k1E6y26PuHdotm31jnVEgAu2b
 yYWBSFnKG1yumWYVwPsTOthW1KXvZzj8qOFYZn8U/LSQPeQvBWgSEzaWyUl29RslaE22
 OoDm8bwT1CbaIQ4FEs8oahpIjPMC5ERkBHvsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HYXCjPHfs8dDfhMy2nCW/5veOTWbVHj4w+BgbYglN9w=;
 b=ppemIzLbp3xRCBHJNwrk+J1D4k1meT9bcyJcLCz3W/KybwnWarv0aHijbLIsRtxNGl
 UOA29bTKd3NevsbWK3wJKqrW8NY/VhRP0cjiOPxjpgtFF/rUWmgBGR+pnG81deNR9R6F
 44LeR3lPF9H429LnflkyjwceuY/BiUAIiiziGZe6C3+xm9Z5Y4Q6Ot1VSAx/4XLVgY2N
 yrF687rjyMrUc6D6ac/R8DvyLW0YNkFiJVFsiZoTjG2ZYrHaj1TWVHjaF5JiDR3CxHcB
 f1rbHDkTWypWc52louFU19jWzMRTmBrCOT5rEjo07a149BUzHZU6IYeZuNADp2Eq2Zrc
 GQMw==
X-Gm-Message-State: ANhLgQ3AYr8QEdga9nDTE8SfmY+T/EY7jfotYz3NS/dfDeM0m/lx4AFy
 LGV0FeoJQcKvctnotpRpRJyBogPwZomYaPuRT1e4rQ==
X-Google-Smtp-Source: ADFU+vslL7SUJTVlPVk2d8S7a0jEhOnlOTTT7KU8Dg+Uf7BqOBjcuL5F5OWDFxyBWnAFO5VFRqBRQWH6xWxqn5a3M3c=
X-Received: by 2002:a05:6102:392:: with SMTP id
 m18mr15598517vsq.79.1584356542437; 
 Mon, 16 Mar 2020 04:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <1584345050-3738-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1584345050-3738-1-git-send-email-hanks.chen@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 16 Mar 2020 19:02:11 +0800
Message-ID: <CANMq1KA1ngYhr7XO0k3xb0h7L-DX+TjiekvnGGOTRqz=BQPREA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: cpu: Add a support cpu type for
 cortex-a75
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_040224_519764_BC68EE48 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 16, 2020 at 3:51 PM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> Add arm cpu type cortex-a75.

Already in Rob's tree here:
https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=5c2614e995de07b41eb355155eb5e0e3d593718b

> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index c23c24f..51b75f7 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -128,6 +128,7 @@ properties:
>        - arm,cortex-a57
>        - arm,cortex-a72
>        - arm,cortex-a73
> +      - arm,cortex-a75
>        - arm,cortex-m0
>        - arm,cortex-m0+
>        - arm,cortex-m1
> --
> 1.7.9.5
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
