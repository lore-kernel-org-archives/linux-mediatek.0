Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAA4C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 20:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C83C61181
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 20:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C83C61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZmYYJUM/Z08qZghFODxzRNhHsOFbJuBnhBCErGEHUc=; b=rbnV99A3Rvei/x
	49hHqtesaMVDrDng+lx914SOWNJkjzdOzMsWizYysxEQ30MS3ii0U038Pydr00H5KKrGMjoQUbyUb
	X0zsMX5BdfvmQOj5ZcK8mjxuFWtuhvbN8w/gdgzUg3RGOe7Of2BeclxdAKqP14ah+1N76Q3mgjxGF
	L2CUaZxTT0+k7tdVPUYG2Jvp/gXyH2u5GASAh3zNsMyf6FJH1Ezx/P/0rUPvIDQdZmcdhewxftIV3
	062n4UycEzNMq57ceuRcFukx8WU5YibTiQk+XSzbmoqHvbBqHJK14PjZTRJq3/uiZjWc2GAO5TDM/
	bNtY9igd9z60de4TSmeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6ej-00DW5L-9O; Fri, 06 Aug 2021 20:41:25 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6eX-00DW3r-Jx; Fri, 06 Aug 2021 20:41:14 +0000
Received: by mail-io1-f48.google.com with SMTP id h1so13817837iol.9;
 Fri, 06 Aug 2021 13:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UvvQPmrhuL4HtRndu0q71cWkxEo1zKJex15ocyueGJ0=;
 b=cc3kAzBB3Uz5U3MMmve5550juODgmtmaENZ8Q/oBsbfLdPqGMAGHd0ezrawh8pxntq
 DnlJVjOwbCOuyHrZjfvxTtv+egy1UwZaN5NXUXLGOj5TnokGPzFhytPovk32b8LPGVUs
 KQG9Gte1cBy2iZ7k/Bva0QPTVPf+QgxoLC3ggkQs20pofTPy7Tu1AOaPeV/Zz0AKtAo8
 5xbs/b7IoTfifKb7CexgAoT0ubAgNC+9m22xKlMa6BQcDD0s8W8MFSdYDXg+EVfMrcYa
 FNDndbirOYpUNlrOfK3Ay2Z0SIbKymldUBbd2T23ai1r5c1/B5dDO8jKBL8ry4SyOB24
 KaVQ==
X-Gm-Message-State: AOAM5303BZlzBs9Rr/ifpkQMjSVS+FxFTppVQ0X/0B41MnR75xRmeJaA
 ZGvNASLovb9EMipO73/wJA==
X-Google-Smtp-Source: ABdhPJwtqAZpNSn8OeittrKtjsRZ9QEoOqX40BY44WtTvTgx9ajtlTLzXu/rOuwjY4Jw3gN+OtbSow==
X-Received: by 2002:a92:cd41:: with SMTP id v1mr15140ilq.212.1628282472733;
 Fri, 06 Aug 2021 13:41:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id s8sm5415957ilt.1.2021.08.06.13.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 13:41:12 -0700 (PDT)
Received: (nullmailer pid 1759128 invoked by uid 1000);
 Fri, 06 Aug 2021 20:41:10 -0000
Date: Fri, 6 Aug 2021 14:41:10 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>
Subject: Re: [PATCH 02/11] dt-bindings: usb: mtk-xhci: add optional property
 to disable usb2 ports
Message-ID: <YQ2eZkqb++K3K5NN@robh.at.kernel.org>
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-2-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1627635002-24521-2-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_134113_698873_7B928E0D 
X-CRM114-Status: GOOD (  17.57  )
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

On Fri, Jul 30, 2021 at 04:49:53PM +0800, Chunfeng Yun wrote:
> Add support to disable specific usb2 host ports, it's useful when
> a usb2 port is disabled on some platforms, but enabled on others for
> the same SoC, another case is that the different package may support
> different number of ports.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> index 49729aab6d1a..61a0e550b5d6 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -154,6 +154,11 @@ properties:
>      description: The mask to disable u3ports, bit0 for u3port0,
>        bit1 for u3port1, ... etc
>  
> +  mediatek,u2p-dis-msk:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: The mask to disable u2ports, bit0 for u2port0,
> +      bit1 for u2port1, ... etc

You already have this property in the parent node, right? Why are we 
duplicating it in both places?

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
