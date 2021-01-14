Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79399C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 19:11:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A40F23B3E
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 19:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A40F23B3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cnKiZbtC52WRjEIU1oDmxYYTdENJiMZLwvB0/5GUu50=; b=2DezR/kJDhPC6URRAbEaRuA+x
	LKd41EI4SdZc+tZGDLD6Ooh5fjypKFCIsGhEmlKmJiS63XLsPDPQbaPbXEhM7Rv70nbtpcUCag9dc
	s3DsJEhZFrqlMYeU8sPuHio7vOa3i9fxnWl3wrSEyW1ehUmgSJSFRQxp1eopmyZ84GFtV9M5m90v7
	LxuYEmqBKtCfiHdAQjMrILkCTvtOuzm0Qpa2g3f5wXTXswE4/9UeiMTAdn9xU9fk68m7QF1HY+5jD
	UtCyFaV7Fvxc7qEUjiVbJYd31LgwQN3SC5fLxAAp2p7yc5K4naSo/KWC8rqk20fz6MVpkyAc8A+fc
	Gz+UwqO7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l081s-00083l-75; Thu, 14 Jan 2021 19:11:32 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l081l-00080R-B9; Thu, 14 Jan 2021 19:11:26 +0000
Received: by mail-ot1-f44.google.com with SMTP id j12so6207942ota.7;
 Thu, 14 Jan 2021 11:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WJH+/RP8cD+cn+XHnaVewTvw/PKu6pAE6tZBSia24UE=;
 b=DiUHnTM2t0IuwQQ/uEsTidQAysJsUUeJNTwHwgJWOajwTV0NmVloWMWVMnAjGm1JlZ
 8/vMiVLTGoFrX1hXWsQOHbeCoAtDCvgE6M4xcIdido1i5xMl74/3sZY6gl5OVx1si0MZ
 jbNjbBMJSGxok9mNJjVWB5wa+XipSYV4YbaPQ7eX10FAeXA7aWO+7fAuwcu4yFNOL6b/
 PtJEw0GoGtmVdCk0gcjdG/vmrbKfSwMkqMcWBXBF/vWyUJG4J/W2QPN51mBfAPXbwYdX
 IT2jZo5AqFAJpWVYRWssL4q4LMCFIJQPfxeUCO65zkQJQgF2r+MmJzqcMYCgFJgsg6Kg
 5qfg==
X-Gm-Message-State: AOAM532eme/tdnOHJySEGZc+yKwDzgAj3nny3ejMEF1Io23I06oZ6nYt
 phQtgm081E1sPmoWgQIl1Q==
X-Google-Smtp-Source: ABdhPJyzqW5jSgIwdHBBZZDHiZ6CkCOObxHInv5OjKe74ArGH+HMT7Poink2jRgipIR7enRQx+r5Fw==
X-Received: by 2002:a9d:4c8b:: with SMTP id m11mr396885otf.319.1610651484287; 
 Thu, 14 Jan 2021 11:11:24 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v17sm1241102oou.41.2021.01.14.11.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 11:11:23 -0800 (PST)
Received: (nullmailer pid 3394232 invoked by uid 1000);
 Thu, 14 Jan 2021 19:11:22 -0000
Date: Thu, 14 Jan 2021 13:11:22 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v3, 01/15] dt-bindings: mediatek: add description for
 postmask
Message-ID: <20210114191122.GA3394181@robh.at.kernel.org>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_141125_397328_78C09C3E 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 11 Jan 2021 15:43:37 +0800, Yongqiang Niu wrote:
> add description for postmask
> postmask is used control round corner for display frame
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
