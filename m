Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912AEC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 20:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56FE561181
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 20:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56FE561181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/pjaJEaBnSmzOyrW40CHuZu4uCofrxTXZRkwm8U/VI=; b=Ocwm5+jN1aGfc4
	Jljg7q4oZKvwUVi4BLODaz74QcUqFhzGtQMa2j2mCPk2rrotcNvwtHMeKOhVLBQUzXXK2WEIeg1GX
	clZu6m/NVjnJt6XCEXeKn1VMoF1Py0CwhbKOVlnNTHzyHMPUO3NNGP3nbi35gzJ+teKkHrmwPozkH
	yu4AQZIOa8xP1J4QVY90M6SI3xYbL9gV581O426jyxdpQyBGN3rJknShPeC4GVINtcEXvf9fZZcJ1
	bTLktdEmqNF4ZhCqKDXdJE1zNMyDbH54GQk43WTns+R/flZh9IFkA0M0koqy4aCyDX++j9v2R9Itq
	hbO8zF4nsUDNGhxkie2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6bJ-00DVZX-Jk; Fri, 06 Aug 2021 20:37:53 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6b6-00DVXf-33; Fri, 06 Aug 2021 20:37:42 +0000
Received: by mail-io1-f45.google.com with SMTP id y1so13844904iod.10;
 Fri, 06 Aug 2021 13:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TVKXYieXCB1DKiHzXxHGsFLtK6oj4KnoWI2F5Iz4p4M=;
 b=bba40GXt2cxOZxpsrJXXw+PHiPgicFOH9EgQGgONMMHWJzXQx6BV8iwjhEVzdf8gsr
 64vC4ntoYtiPWRlrvAfMEgiBCIcsyAD29lzwZQPI1uHBn4XIckEIGAClLQs3L29kfqrz
 d85pob2n4GjSZ4gK+KhQTpfot0qiEj6pC3ALVjNM4iXPSKoO+fIV7DnbsD8WEkBVRSLo
 jEDNsJ824M63jywUqKZz1PoaQfr42SRkUECquTXO0lyRTNUkmwiKaKfpXOk89F0V9T2y
 uB3cHBAMnq9nHyQZFxzCVyMi5ZSrfiEiaIU8EAaKOxRHMWKtkmuG/3Xx2iMd+xewlKGy
 J87g==
X-Gm-Message-State: AOAM530DQitBK/nGwJ2izKeltdkmLVv5mk65wDB3xK2h8gUHmJAB+Qxc
 D7m50kWtF3NHdlE0VBwDdw==
X-Google-Smtp-Source: ABdhPJxZCOZE9OxcqkC1fCzq3EI+rcQGE5VzKj6Tdg7VFwKzvA8LJ/8AIBSVEFv+o1tKeKa0bdflOA==
X-Received: by 2002:a6b:db03:: with SMTP id t3mr684509ioc.3.1628282258694;
 Fri, 06 Aug 2021 13:37:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u6sm5050320ilk.36.2021.08.06.13.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:37:38 -0700 (PDT)
Received: (nullmailer pid 1753643 invoked by uid 1000);
 Fri, 06 Aug 2021 20:37:37 -0000
Date: Fri, 6 Aug 2021 14:37:37 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 01/11] dt-bindings: usb: mtk-xhci: add support property
 'tpl-support'
Message-ID: <YQ2dkcKiXxIHLCOT@robh.at.kernel.org>
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_133740_173729_A8E5A7F9 
X-CRM114-Status: GOOD (  15.16  )
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

On Fri, Jul 30, 2021 at 04:49:52PM +0800, Chunfeng Yun wrote:
> Add property 'tpl-support' to support targeted peripheral list
> for USB-IF Embedded Host Compliance Test

Given you have to configure the TPL somehow, how is this useful to be in 
DT? And no, that's not a suggestion to put all the TPL config into DT.

> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 240882b12565..49729aab6d1a 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -115,6 +115,8 @@ properties:
>  
>    usb2-lpm-disable: true
>  
> +  tpl-support: true
> +
>    imod-interval-ns:
>      description:
>        Interrupt moderation interval value, it is 8 times as much as that
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
