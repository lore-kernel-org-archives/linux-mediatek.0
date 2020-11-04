Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874FAC00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:32:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0801620729
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v9NLhC7G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fA+JUng9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0801620729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0+NkOjFAg8vD/J4nBRzdFSF1REB9HB4uI00dTnQmUcE=; b=v9NLhC7GDSIPsyQ7pSbSHCsOO
	K2B10mKchYQLCpUGGXysd+FwDJtIpo6VJpXvmGHOb50IfuiX4XI8BqLP5yo+iHTGFk0YpX8fTD8cb
	/X6uc4ppWvazY9DbFQH0s7R/0C1v5g0a2GSzzZaMJBW46QSdjduyJxhjNoN/PTTxqXHjDUJZQHRC8
	V34oVyuekF0wKKnp2QMLC6n7t/QsAG5njqdEK415zeobaZU/VG9DO63HaJLvClND1C5yksC7ohKMM
	szJE9F6hG6DT4eLSZHcSskjcltSw0iuMr6X2WEGGqaYtl9/HSH/BjlCgoiI1wDPEwQ92A6tNDeGkm
	RBWTOAToQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaWwK-0002DD-D9; Thu, 05 Nov 2020 04:32:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW6I-000145-Ga; Thu, 05 Nov 2020 03:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bsqnljYYWE1/ltBUbXEHDTzwBF2aGmIwEaiz3OENEGY=; b=fA+JUng9LHLz/NRMef3nJT0W/r
 GeyOTwkBLV8qF8CtSX8935jiiukjFM+U2OI/U0J1KeKchnPflZwq1V2bvyPuGYAejY9e5Z85xrRGe
 zhyQsQQ47IMEpJBKOo+HfaRZjCsLXmZN7cdfUTHnQtwmB1ynBUgyGKUENSpiWLzXTbEdMUKuWgIDs
 lRpjvZDhWeR71MvirnZmvg4r9iYHzz9IsYXJQSOmwDzv8i8be+Cpi7/7EiJNIfMH0vPBEGoBThAds
 k8nBZWcFlfrwMqiDqtE40/hI06aSMyEGCf+HjM9PtyV7UE0ojy4tr6VWtKx4wusz4/RullXcP30G4
 6lwSzKPA==;
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaRRD-0000BV-JA; Wed, 04 Nov 2020 22:39:33 +0000
Received: by mail-oi1-f195.google.com with SMTP id t16so6593747oie.11;
 Wed, 04 Nov 2020 14:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bsqnljYYWE1/ltBUbXEHDTzwBF2aGmIwEaiz3OENEGY=;
 b=JkhQjZg92ocpSe2ojPIpFonP9i/pqhkEDgr/50VhbmjJaXqpGCr+u8kAn+nAWxlqn1
 n2lSMPQGelrv43WuMG1jCBGLEs8dU2rcgEzDyTv1XMapDv8PoEh6xG82FgEzMB2ZEoiL
 SU5QmkG+r237SZvEMChdokqa8S2Qk0EaX4Zvg8MbwPn1W3aApCY3thrnin0z53F1DqtX
 8N2F5ugFDiuk5TLqiU/Vkr2S3M54p034EZQFTtjIOBzNLuZL/NXACfyQeTeQB4PsfqIf
 nZJAQaZC7z3wX35q7KHbsvpITdE86VBPF/oSmEfqZjvveB0M/UWPc5622ksvQAUiW2Wv
 vNfA==
X-Gm-Message-State: AOAM531XMs9uK2iA4l8ZH8/v1TIO8RTECVd6yp9eYkJ2arYYiJB0Am0x
 vnUMNjOrxFstxisic1H4MA==
X-Google-Smtp-Source: ABdhPJypEFa58WXrfW91mJuemRTt3L2mShRt4pLpp+QEwsSfI2kknkg7HTzTjj9ChwihNYFdu8X4jg==
X-Received: by 2002:aca:fc02:: with SMTP id a2mr27503oii.90.1604529568215;
 Wed, 04 Nov 2020 14:39:28 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z19sm261558otm.58.2020.11.04.14.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:39:27 -0800 (PST)
Received: (nullmailer pid 55216 invoked by uid 1000);
 Wed, 04 Nov 2020 22:39:26 -0000
Date: Wed, 4 Nov 2020 16:39:26 -0600
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: mediatek,mtk-xhci: add keep-clock-on
Message-ID: <20201104223926.GA54259@bogus>
References: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_223931_831301_EC138124 
X-CRM114-Status: GOOD (  17.54  )
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
Cc: devicetree@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-mediatek@lists.infradead.org, Ainge Hsu <ainge.hsu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Macpaul Lin <macpaul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Nov 02, 2020 at 03:18:48PM +0800, Macpaul Lin wrote:
> Option "mediatek,keep-clock-on" means to keep clock on during system
> suspend and resume. Some platform will flush register settings if clock has
> been disabled when system is suspended. Set this option to avoid clock off.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index ea696c8..a956dde 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -104,6 +104,12 @@ properties:
>      description: enable USB remote wakeup, see power/wakeup-source.txt
>      type: boolean
>  
> +  mediatek,keep-clock-on:
> +    description: |
> +      Keep clock on during system suspend and resume. Some platform will flush
> +      register settings if clock has been disabled when system is suspended.
> +    type: boolean
> +

This should be implied by the compatible string.

>    mediatek,syscon-wakeup:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
> @@ -175,6 +181,7 @@ examples:
>          imod-interval-ns = <10000>;
>          mediatek,syscon-wakeup = <&pericfg 0x400 1>;
>          wakeup-source;
> +        mediatek,keep-clock-on;
>          usb3-lpm-capable;
>      };
>  ...
> -- 
> 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
