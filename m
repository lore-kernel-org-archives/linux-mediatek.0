Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B14C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 14:11:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3C96044F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 14:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C3C96044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifE7z80hTL8oHNov6Leu2h7A7DWqfVvegcHaa7KzTzE=; b=JoDR+JP0K0xwPz
	nHSDKfEAPg4LlMKjSeahkWDJBbCbA2BzM19quV/ZljXdhp9QQlSoOcchL5pKxtnpZHcxenkQVqPaV
	/+VzWEaQW/n2z6owrJC1TlHx7GX63NA7tgeQt1LKTXfJj0GzFJ1FavqRFE12aTHHju7Uazkrh5Ivu
	seqN9VRFQA47YclUIVX7mn/iO4MDB3JH9rJytfUZrFEYYnKll08INhssfSA1Y57PgZm7F4oNYR12u
	in7YYdmmB+9uZaVzU09iThvZj/lO5vX2/JMEchjoLXbaxHYwNNViQn8J7cyY4X0vJ5ADwa8OGwkfz
	qyMWg2GwdwU1E/9e6ltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGMHH-005p3S-Re; Wed, 18 Aug 2021 14:10:47 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMHF-005p2j-BY; Wed, 18 Aug 2021 14:10:46 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 n1-20020a9d1e810000b0290514da4485e4so3811821otn.4; 
 Wed, 18 Aug 2021 07:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tqED2XFSCgXLMT9RVvhfNyDjVv93a0+pc2IUiiIQXGw=;
 b=js9VFbdcp5+tXvkgoJQuKY0Z4wvO/DCnUw/YVCuVD5ikYE8in9m4iWCWrJ2yksTDfy
 65XYf0hD5gqa4VjnlV6H3RBk8trXWVZUbXVcAgUVockTxYd99l44/23x0af0NvP47Uq9
 tYt3DXVgfBqad6dYoNhL09ce+un0cNGjGfeQmW0nqoF3pTFiGBkmeRUSAD+bCAu/7f0Y
 p0PtZtMQzIwCa1taa1t4fBZ4zF4KMNXo+hLAhzRhGZjp77Ns8eu4DALsCpgpF1BCAgaN
 be3RLdBcRUjnA1T6x8SRyxNcLE8lA9czMOe2yF+i+zIxj8ucX4yczALN55BuTpWrNyV/
 B2zw==
X-Gm-Message-State: AOAM531Ed9G81KzGNiZZg8EVFuWZvM17h9V8W7VT9v4Dye0O0a8Dgisy
 Os8FxLEYswZbKVyiZBep1g==
X-Google-Smtp-Source: ABdhPJydLRhTyxC612CzNagoCp20Xdt7VcCSkeTxxqNVNohU7xCnXV+ABAwS/hFimq1cZBHDMGFuGQ==
X-Received: by 2002:aca:171a:: with SMTP id j26mr7075944oii.69.1629295844074; 
 Wed, 18 Aug 2021 07:10:44 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l8sm1070165oom.19.2021.08.18.07.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 07:10:43 -0700 (PDT)
Received: (nullmailer pid 2532627 invoked by uid 1000);
 Wed, 18 Aug 2021 14:10:42 -0000
Date: Wed, 18 Aug 2021 09:10:42 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>,
 linux-usb@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RESEND 1/9] dt-bindings: usb: mtk-xhci: add optional
 property to disable usb2 ports
Message-ID: <YR0U4irxNbITU2R5@robh.at.kernel.org>
References: <1629189389-18779-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629189389-18779-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_071045_440289_8C7B3194 
X-CRM114-Status: GOOD (  12.84  )
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

On Tue, 17 Aug 2021 16:36:21 +0800, Chunfeng Yun wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
