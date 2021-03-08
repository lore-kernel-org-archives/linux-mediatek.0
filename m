Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CC3C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 18:39:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1151065224
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 18:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1151065224
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lmTjjhhYYop+jm6UODrnWpsaVmOxB9g/6nz72kbux/M=; b=TkYXhZeY7l6vbNeJLhaIWF20G
	D56lopzrTCoX2GyQl1Zr8kECjXSVaRp6BCcKVIVgLSDeoHSaEe/KsKxAPsRWH/lNJ/iV16JvWeVu1
	TVlPO1rs03RYn3bHbcLAJoHFfOSfCcR5yiNGcf6Y0zJ9HtmQ0/a8gtKy8RgQdFsVa10JEjd/+Kf3J
	u6y1aH6o5ncMRPeaRyPUcSDN7NV6WPSKvAV8Y5lnNWLRpvo0wYPq8hjCgyX7LmyJA5oJsEaRru6/k
	pigExpDudD/YqDfExhmpGS7tkavVC12rKYK06AyWCb2chskIkn9FpzPHOQn/iA9f9mdUExyvJRm2n
	+PsghvIMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJKmV-001mrL-C4; Mon, 08 Mar 2021 18:39:03 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJKmL-001mlZ-N4; Mon, 08 Mar 2021 18:38:55 +0000
Received: by mail-io1-f42.google.com with SMTP id o11so11080543iob.1;
 Mon, 08 Mar 2021 10:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vzkfcBGh7P+3bfy1FsKTmuA9EtwsLrw7/lKLRVRQBX0=;
 b=GSKqmcWTFs0U49n+JC//7aBgqoIQRFJoEQ9ZXBMQc9cWRHnA6eXiJ3XgBAIPTImcTy
 SWuTN82GgZh5v74f67oWIwgJ1RuIkS5BzAKNkeWBRLFg5Hqs4192tv3M+zvOf71zHIQZ
 2ul4vMN7SwJHuOtc936z4NKsaZSsAH+zcY4s/DxYjGZzAx8KO85Md7BizI0vNQ0KNyeM
 22KzyT2UiiAFquaS7wMxZajJkDLTO8/s7XsgI/npL/WxeJ8EGpGPdowQ/XzwcBEUWtSb
 mCaQGhmKnQhFP9rB3Ypzz7odZa7MAqPkGXg47JHh6/fpv5Aj18QsQlh58WSRA5SLWOUm
 mnbw==
X-Gm-Message-State: AOAM533koj9k+VfNbxWKgCbmN0BSwQzxwPB2JOjgSgi7/Wi3YMx8kI6P
 Fjx2LUWsmrqiecrwaQ8hGw==
X-Google-Smtp-Source: ABdhPJwmF14ikEMZXnQAtX0RfcialPVky2Q8Ob0oT7+HCxv+jgTqMb2EH4jQceofAvOrGqFFocgcEA==
X-Received: by 2002:a05:6638:1648:: with SMTP id
 a8mr24511056jat.25.1615228730570; 
 Mon, 08 Mar 2021 10:38:50 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f9sm6241138ilu.36.2021.03.08.10.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 10:38:49 -0800 (PST)
Received: (nullmailer pid 2760823 invoked by uid 1000);
 Mon, 08 Mar 2021 18:38:47 -0000
Date: Mon, 8 Mar 2021 11:38:47 -0700
From: Rob Herring <robh@kernel.org>
To: Henry Chen <henryc.chen@mediatek.com>
Cc: James Liao <jamesjj.liao@mediatek.com>, Stephen Boyd <swboyd@chromium.org>,
 Arvin Wang <arvin.wang@mediatek.com>, Georgi Djakov <georgi.djakov@linaro.org>,
 linux-pm@vger.kernel.org, Ryan Case <ryandcase@chromium.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 linux-kernel@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH V9 01/12] dt-bindings: soc: Add dvfsrc driver bindings
Message-ID: <20210308183847.GA2760789@robh.at.kernel.org>
References: <1614656863-8530-1-git-send-email-henryc.chen@mediatek.com>
 <1614656863-8530-2-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614656863-8530-2-git-send-email-henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_183853_888925_18B54FC9 
X-CRM114-Status: GOOD (  10.50  )
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

On Tue, 02 Mar 2021 11:47:32 +0800, Henry Chen wrote:
> Document the binding for enabling dvfsrc on MediaTek SoC.
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 67 ++++++++++++++++++++++
>  include/dt-bindings/interconnect/mtk,mt8183-emi.h  | 21 +++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
>  create mode 100644 include/dt-bindings/interconnect/mtk,mt8183-emi.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
