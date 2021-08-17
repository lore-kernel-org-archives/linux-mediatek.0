Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584BAC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177D160EB5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 177D160EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmGlyp8RWQ2JNSDlulzG0iY65XMyCTeiGZPwOZ8rhxk=; b=0hSZRjOrMMepgb
	7Dz+p3k1jUfc0S6OsPleDX915hWOF+Jlt1PV58dBVXrLX9bf5k9ZX3VX807CY8wXa6mBpzykxHSpV
	1RY/1Y9bmLQVjo+d1YLfPPZoFM10FPd3jNPY9suYnzbDE4XkMkXm+SRsZMZKEbxY4Ishzo0rB6zYu
	LKE1RT+zw71EIO8UmmnrO56AePczH6W2x59FwmCk4g20xAdtg4vWhLlT5SjAIVUNezQ9CNi/ZQSAM
	ShNXKu1A45D7n6wJ6nwpZR0UY+fjjXojjtmbP3l444f9f75QiYBiLWnE2EgTltkOAzxhQ0zdl4STc
	cPMa2y5vlFaOTncawv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtZF-001KHP-PZ; Tue, 17 Aug 2021 07:31:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFtZC-001KG2-QY
 for linux-mediatek@lists.infradead.org; Tue, 17 Aug 2021 07:31:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 q11-20020a7bce8b0000b02902e6880d0accso1194472wmj.0
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Aug 2021 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=A2+Lw6uRYk4QEZKbOu0vM7QAf5sH/o6K/BfCCdq3elY=;
 b=qSzoGmtukLgOoF65aePa+A5AChJnPJeVQBf/5shvBkcXdYkAcfouanKF5FhBS05sDv
 x6R4NOEDOziDXay+sg9+q47sBvZQbvKBn+pXqMCWaR6rGVJpjMRNWW0GxLJZVOYggw3h
 Sau+VXy54OojAAMFuSsAOVsqTQNu+P9jsid/1JE5YXQ38dXDpIR2Cs1EPe//gbFMoX2F
 VhN4rXLw/3q3uY6+roXduEE5aqhp212LnwWBUiLMviLACEv3PpSUxFbFeNv79Xz47Gql
 97PGkxZJKNTjJC/wP/hgdWHHdexsZM8zx9lueuMVMHM3p8PaTEYe5k8TsUCT6TfLY07f
 Itaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A2+Lw6uRYk4QEZKbOu0vM7QAf5sH/o6K/BfCCdq3elY=;
 b=bnT/JtajqyYWaTR0dPBFv00zWzsAjfRbnOeTmqR9PQ3NJexeWReq8wz3o/Z824/eQB
 6YWGoNE7+4pjt+Dbkrznb9TiqNzhCxwYqsa2TIM6WgRAud1u4BI1BPBQqVrqFtzk1WhL
 uxLCllQ2GjKJ/tMzaAvn+8L5ij+coNOMzsU1OLn002mf6l12qk+hmecTMZ3WCkG5ZNwG
 Jkf62Set+XxRubvNv8Ai3MBZT76HzJVjbfPDgzVn9Vwhim1/cg8hsHo+dBgtU8wD5Cck
 1BThkvxqotw5vPMC8MoHPjivSYe3Q0ZMRTl5inuO77MRGlYYgP19an4c+3HJ8qc5nwhK
 +HCQ==
X-Gm-Message-State: AOAM5332gQyvrYkXbyUBnfM0gChLpltJZ9NwpiqaA5mJR6KgUdW1xB/V
 xRIeDCAUNKPgw344C71TGdlraSxcoDFDIQ==
X-Google-Smtp-Source: ABdhPJxMIBUssTHuFg+f+xiecHohfOVUViphNPiVPc7ogcvHkzCpoXJ76sTreVditSxIWT9KFPqlDA==
X-Received: by 2002:a05:600c:4fc6:: with SMTP id
 o6mr1024050wmq.122.1629185481030; 
 Tue, 17 Aug 2021 00:31:21 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id p6sm1406274wrw.50.2021.08.17.00.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:31:20 -0700 (PDT)
Date: Tue, 17 Aug 2021 09:31:20 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20210817073120.fqa2wybvdgbn55a4@blmsp>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
 <YRraTWcY4yVuJANQ@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRraTWcY4yVuJANQ@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_003122_973602_66E16DAE 
X-CRM114-Status: GOOD (  24.84  )
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

Hi Sam,

On Mon, Aug 16, 2021 at 11:36:13PM +0200, Sam Ravnborg wrote:
> Hi Markus,
> 
> A few general things in the following. This is what I look for first in
> a bridge driver - and I had no time today to review the driver in full.
> Please address these, then cc: me on next revision where I hopefully
> have more time.

Thanks for taking the time and giving me the tips, will fix it and send
a new version.

Best,
Markus

> 
> 	Sam
> 
> > +static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
> > +                               enum drm_bridge_attach_flags flags)
> > +{
> > +       struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> > +       int ret;
> > +
> > +       mtk_dp_poweron(mtk_dp);
> > +
> > +       if (mtk_dp->next_bridge) {
> > +               ret = drm_bridge_attach(bridge->encoder, mtk_dp->next_bridge,
> > +                                       &mtk_dp->bridge, flags);
> > +               if (ret) {
> > +                       drm_warn(mtk_dp->drm_dev,
> > +                                "Failed to attach external bridge: %d\n", ret);
> > +                       return ret;
> > +               }
> > +       }
> > +
> > +       if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
> > +               drm_err(mtk_dp->drm_dev,
> > +                       "Fix bridge driver to make connector optional!");
> > +               return 0;
> > +       }
> 
> This driver is only used by mediatek, and I thought all of mediatek is
> converted so the display driver creates the connector.
> 
> It would be better to migrate mediatek over to always let the display
> driver create the connector and drop the connector support in this
> driver.
> 
> 
> > + struct drm_bridge_funcs mtk_dp_bridge_funcs = {
> > +	.attach = mtk_dp_bridge_attach,
> > +	.mode_fixup = mtk_dp_bridge_mode_fixup,
> > +	.disable = mtk_dp_bridge_disable,
> > +	.post_disable = mtk_dp_bridge_post_disable,
> > +	.mode_set = mtk_dp_bridge_mode_set,
> > +	.pre_enable = mtk_dp_bridge_pre_enable,
> > +	.enable = mtk_dp_bridge_enable,
> > +	.get_edid = mtk_get_edid,
> > +	.detect = mtk_dp_bdg_detect,
> > +};
> 
> 
> For new drivers please avoid the recently deprecated functions.
> 
> - Use the atomic versions of pre_enable, enable, disable and post_disable.
> 
> - Merge mode_set with atomic_enable - as there is no need for the mode_Set
>   operation.
> 
> - Use atomic_check in favour of mode_fixup, albeit the rules for
>   atomic_check is at best vauge at the moment.
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
