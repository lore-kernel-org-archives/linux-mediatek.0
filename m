Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128D3C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 19:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F5061222
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 19:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3F5061222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=et53pjEhJ0balilMuKWs2OD/BSbmWhNk110x56ey2JA=; b=ZWw/DGgoXkP6aO
	UrhKOFzgJZkm83nLHYOcO7vZVibBnHA5LisTT1uObfcRwjVvHdr7zMYslviVeaPk/AL6fQ5WTMnCw
	IQkE4dE840Eo4FseRgbDrGSxYhW/7WZeuUFTrKfpRL37jop9PuLDXfbrrWs4hs5mFTaQXduBXYTj6
	KoSywoHwuK48F0AL1DHqSrE3x5zIKRhCmAqNJ6qagwHMFWvqQbgEGFkxzR4Y2gLIV911DdpX3qT8X
	QZ1RIATQxPPUV+3KaiJ1Pe1jU9zGi/tDvQSpBmu4TB7X4GWd8tj56VA5ijkjeK9FBFg66Eszs7rK9
	2toBWTqicChNiqx48B5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m31HC-008ENr-Nn; Mon, 12 Jul 2021 19:07:34 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m31Gx-008EIF-Vb; Mon, 12 Jul 2021 19:07:21 +0000
Received: by mail-io1-f42.google.com with SMTP id k11so24057023ioa.5;
 Mon, 12 Jul 2021 12:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VmcRJht2x/uN0knUjln6QgNgSrdkyqiua1j8QRrNut0=;
 b=H7KkEmBGmdNEvVbQJJkDIjiHeNu600UX3/+NJgIswIM2G4Bfhz7+IPSE3VnsaqnZiW
 VBp6BpYLfBeClbPLoTMcSFpjxGJJ94/8jXHCJhp/tAoHlmrGrBOTKL2NEumNu3cfkKgk
 TXcAL/EUsFR/Nx9cB/pCkPgCFQMwVXxLRtSJJVIaxpDk1BY4IrxOw+uTTG0HMaSja8On
 5VqUQ04gddaX/GaYiq7NSBewEVGXl4Mt74N3N+jNZmyBbxYRxXLeNnbtlB3iuvVdoRoQ
 i3pdjxx395oUzLGn6cvQO2qZI8x1diNo0FjeBAqrvDITh6GuquulrL5xKfgKXYxAJAEQ
 OueA==
X-Gm-Message-State: AOAM533P86qugbPRf+OpO0j2XPpUle27uCZWoHw0SCJqLO4wiGm+r3zZ
 SIUC8V0qQL0fwkabJ1dlUQ==
X-Google-Smtp-Source: ABdhPJwAC+XS9JfOz2h1JYILI1SxRdnRBCsJxMoNWOPCYSdzKKl0qZBUqROHqRvEsywCbKS7YHsZ3w==
X-Received: by 2002:a5e:8e44:: with SMTP id r4mr332283ioo.124.1626116838853;
 Mon, 12 Jul 2021 12:07:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id y22sm1553509ioy.50.2021.07.12.12.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 12:07:18 -0700 (PDT)
Received: (nullmailer pid 2310216 invoked by uid 1000);
 Mon, 12 Jul 2021 19:07:14 -0000
Date: Mon, 12 Jul 2021 13:07:14 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Felipe Balbi <balbi@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 01/13] dt-bindings: usb: mtu3: remove support VBUS
 detection of extcon
Message-ID: <20210712190714.GA2310182@robh.at.kernel.org>
References: <1624008558-16949-1-git-send-email-chunfeng.yun@mediatek.com>
 <1624008558-16949-2-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1624008558-16949-2-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_120720_066121_2534A589 
X-CRM114-Status: GOOD (  15.61  )
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

On Fri, 18 Jun 2021 17:29:06 +0800, Chunfeng Yun wrote:
> Due to no platforms use a multi-funtion pin to detect VBUS
> status until now when support dual role mode, prefer not to
> support it anymore;
> Another reason is that the controller doesn't support idle status,
> the dual role port works as device or as host, using an IDDIG pin
> is good enough, this will help to save another multi-function pin;
> And fix a typo of 'neede';
> Last modify example using VBUS to turn on/off device, for device
> only mode, the driver doesn't get extcon.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  .../bindings/usb/mediatek,mtu3.yaml           | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
