Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1083C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 03:10:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBD0208B3
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 03:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EBD0208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n20xE4xzF6itLxD7q+f91nLQEU2wovqwy0lkWEf2IsY=; b=Fn7NjgxlKSvCOTduB3LUubvJP
	ZUr7SGupz4bNkUL1lZ5WLwr8h4Q0vdInjnYWaHlqkeT19l4eUG7LKY9nVkKTLCgXMwskw73xOuVa8
	fSH/7Bjw2yt38+kZ920LuuCehmtENd/xD7x1003QoFN5MZL27sW3pYgTsTn3HtQnaYxwxlvqP+kqq
	VJ3q4Sgwy0IGY26KsQtNUM9Pe0aRFPYqqrpwMLEYhoyvFIga9Vv83cp1YXjSPNKW+J0HQscKqfxar
	jwYzMWpoIaJpmsCR2IzXPgZg4eZ/XvuQRnuyADYpnwmIeBlVnVkac0txmd31PNWOU8zTEaZJ+L5w5
	b5bDpFclw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxi9r-0002r3-58; Fri, 08 Jan 2021 03:09:47 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxi9o-0002pf-0i; Fri, 08 Jan 2021 03:09:44 +0000
Received: by mail-il1-f176.google.com with SMTP id q5so8908015ilc.10;
 Thu, 07 Jan 2021 19:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LgCpZ89bhPoAzu1QaTKGtMiYIqqk0qB0oUZoQsv4bL8=;
 b=IwiPJ6CIMudxAtD5RRpDVswHMC2ORR2EjEUCsofVn9qlV257m47665UcDrAACTOQqO
 R0QfUW4Hy4BSafMQZdnLI0PyfbO6CUzX/wr7OaCNO0Ogngw1//uTKyFpMkHd9R+ogrBZ
 5ziQf1Tp327eXGdF+cW0nTqUQ9lUHkI8Q+C9PZP/iCdNrM1hTHLSLMXSf0Oa0dgbHFYd
 QtyBcT7qBqMGkiqlDbpJTggC5BwhDjjGLH7htmoOzbvPXOFlTxnxlE9gabr9NsuNWOG5
 //mnk20FuTgWDOEa3WV45dtcXmX/X682M81SeQCuwZvNffjJA1+F7QcvFbDtghMDAIc5
 3Bvg==
X-Gm-Message-State: AOAM532+eb5I3w3Cq7rVWf0hZcUDxYQ4oZD+lUiEtcgmV08crtspURPT
 AxYYVEiytBNlBNhEH1d7Ww==
X-Google-Smtp-Source: ABdhPJyTo5xe6pis2HLmGkd2WeF1mOCMYefIn8WWRVKOqqhyq9PW9kuxdyo1JzxthAcVJl7U/Jigqw==
X-Received: by 2002:a05:6e02:1b8a:: with SMTP id
 h10mr1970185ili.141.1610075380095; 
 Thu, 07 Jan 2021 19:09:40 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id x5sm5839653ilp.55.2021.01.07.19.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 19:09:38 -0800 (PST)
Received: (nullmailer pid 1805889 invoked by uid 1000);
 Fri, 08 Jan 2021 03:09:36 -0000
Date: Thu, 7 Jan 2021 20:09:36 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 10/11] dt-bindings: usb: convert mediatek, mtu3.txt to
 YAML schema
Message-ID: <20210108030936.GA1805818@robh.at.kernel.org>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-10-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-10-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_220944_086189_786AAB10 
X-CRM114-Status: GOOD (  14.88  )
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
Cc: devicetree@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 25 Dec 2020 15:52:57 +0800, Chunfeng Yun wrote:
> Convert mediatek,mtu3.txt to YAML schema mediatek,mtu3.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v5: changes suggested by Rob
>   1. remove unnecessary maxItems
>   2. define all phys supported
> 
> v4:
>   1. refer to usb-drd.yaml insstead of usb/generic.txt
>   the following ones suggested by Rob:
>   2. add the number of phys supported
>   3. fix indentation of wakeup
>   4. add examples for port and connector
> 
> v3:
>   1. fix yamllint warning
>   2. remove pinctrl* properties
>   3. remove unnecessary '|'
>   4. drop unused labels in example
> 
> v2: new patch
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.txt | 108 -------
>  .../bindings/usb/mediatek,mtu3.yaml           | 287 ++++++++++++++++++
>  2 files changed, 287 insertions(+), 108 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
