Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55745C4742C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:47:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC20C20B80
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R3vQe689"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC20C20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aOjUluTevph6RHx6Fo9pXAZWgw7BOo8kuqo4JrgIOzg=; b=R3vQe6894KLSf+0qxG6GMPs3G
	va/xhYYlV+yk+miVI3moW9T21wwaCZRMGcuJAMWjoGZinAoeXtX7fUphQ+atfJckOXjTfik27d7M5
	LYoil79pzEW6vroWBx+dZ1dPy47XOxK93tkOfuPs3ytYVF2C0trPLhR21RJ5V8Qr+3gU04VocGkGd
	ZVplYKf34a5ZktzpWW2lJ7Z1hVS16oYd5iIH627PcQwzc5ixJbvTC7fKLoSc2+/0VcFvsWb2s1TfD
	lB5gWOSClBWc9TeWuqKYOuXQGhGXDahPNhj0r9N8qy/d/Xi0h35Uw6CqZTi+DGxojQQcVxD1mf7XL
	TgXCQKAfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keib1-0007E8-IB; Mon, 16 Nov 2020 17:47:19 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiXV-00051Q-HQ; Mon, 16 Nov 2020 17:43:42 +0000
Received: by mail-ot1-f68.google.com with SMTP id j14so16844505ots.1;
 Mon, 16 Nov 2020 09:43:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bFSVgx8WStUFGQnq+FjDm6HcOkdzT+U43PMkQHH3/Aw=;
 b=YFZvDOV6YDvOYVtYmhomcLJhqZfE8qoEXBc6ujPwZqEvc14Ya2/ngmqftXNHw31lRa
 +cNVxc5FKnVaMdqAXK84NnGPhIG8jUcTTqKxPLaDRNxPCL5zZqhNRLimAGMKR+X9EFdo
 h/u7wAQHJtLzY3XFHuk0f7O7TB6u/eJTHKRnJecj9K3G0wWbxO7S617T6XNkN/yDPcBV
 gX6/x/CPw5gyCaC9oDxJvLF+G3hHrIPcdvgKTtdAhbXFou2iXSNrpNfQvpsPAEyg/zHs
 Eg+R+0/0TG7FLhMMhjTUpWAKqQpvGaFgy855UENxZsZtnzEBOC5PkD9KapDCftrK3AYE
 1cOg==
X-Gm-Message-State: AOAM531FMy7wOWGxS/yecYHlO5VswekcvTcJt1bnQ2Gw1eXZXtS+vqdL
 N9MWTv0A/QHGYFPiWM8dDQ==
X-Google-Smtp-Source: ABdhPJwh1KaqZEZLdQqP4EWjEctBZTixLBC9FyUTW+gl0aAyhKJKwMO7/5rESwI4HpgWTlAqXMMXlg==
X-Received: by 2002:a05:6830:1259:: with SMTP id
 s25mr332017otp.66.1605548617729; 
 Mon, 16 Nov 2020 09:43:37 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t5sm4921770oth.16.2020.11.16.09.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:43:37 -0800 (PST)
Received: (nullmailer pid 1861365 invoked by uid 1000);
 Mon, 16 Nov 2020 17:43:35 -0000
Date: Mon, 16 Nov 2020 11:43:35 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 01/24] dt-bindings: iommu: mediatek: Convert IOMMU to
 DT schema
Message-ID: <20201116174335.GA1861314@bogus>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_124341_695456_593AD04D 
X-CRM114-Status: GOOD (  12.26  )
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
Cc: anan.sun@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 youlin.pei@mediatek.com, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Evan Green <evgreen@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 20:38:15 +0800, Yong Wu wrote:
> Convert MediaTek IOMMU to DT schema.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.txt         | 105 -----------
>  .../bindings/iommu/mediatek,iommu.yaml        | 167 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 105 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
