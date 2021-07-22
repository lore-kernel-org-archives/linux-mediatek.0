Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682A8C6377B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 02:50:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ADEB6023F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 02:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2ADEB6023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kgr2gRQJ4YRPn4Jin4lGe0o/i2BUX5QyHDz1uL/rRsg=; b=ean/tPvBiQilfp
	XPtXwEh+eonfuu7U2ImvdQmqiPNMB4LydOJ9xqOY4UujfhL+Ubx5t9c1IJMbMMOL4OMluml9re9Px
	zeR4ccoF1kQKteqN/rS4jbI2D84h4NS0o7kUZOX8xUHjR8EX2SOmzPaM4KUn2cqAtOhNikHR/yCsc
	66HLJ/H1tL8lZs67EyF6vClIrT8xudmHwPvOAgXcZa5nFceV0nWc849xpQrsPhrweOPXpRwjXSnS7
	wZ2VjDf7WmNDzrfMEyn7oENIMzCCzGA9JBYzIr45cX744hSpRe5dWBaQHrMyKB0wASQ6uOAZ2oscU
	PbZk7SICtV97kgvkg9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6OnH-0003LI-PG; Thu, 22 Jul 2021 02:50:39 +0000
Received: from mail-io1-f49.google.com ([209.85.166.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6On3-0003I0-Gj; Thu, 22 Jul 2021 02:50:26 +0000
Received: by mail-io1-f49.google.com with SMTP id k11so4706143ioa.5;
 Wed, 21 Jul 2021 19:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ufJOt3s4xnD/zrL6wx1XOxKXgCd7sL0/12l79h4dyKQ=;
 b=ek75AsJNkTFxSoEzPO4D7EXOO+X9uOL4G6D+vN98x9WaoCvIuuUbf185A5AVJSpbXM
 02XxYs2QMHrh1TdxU9yUgnxhIlVU4tynxQKDcos2+gyZnLFF07UdlNMdDr7AlPbFQkV6
 Iexgqw/pZKP0gIZdCTBiqmyg/+xcZ4UGdSyR02iXuVHWzX61NoIkLRuxPU8Wt3L6lVDv
 vd6X40QPEsXnQy3GQa457rGR7GUqhrNQLcbrvtp4lo1aXw8McEBySNo99AurN53WX0hK
 CPOvjcJKP4Zd9vHGKvq/FAWkk6cgHgGeUYrrOQLwL54xUAMN+Z3oHFsyB1mn7/zXewgz
 d0+g==
X-Gm-Message-State: AOAM531IpWmRSqFd48afp5CXyBu1GJY7InWU0FRRGo0xzH9GU3V/jAi2
 gBEvKz/YTEAmkUOZZKUMxQ==
X-Google-Smtp-Source: ABdhPJyOeywBVnXkZ+x1O8LDM0zWz+/vkCtEewMhu1XJNVLdsdRM+UJVjTzN04GxJ5Mn128sIPTiJQ==
X-Received: by 2002:a5d:89d6:: with SMTP id a22mr6520811iot.178.1626922224652; 
 Wed, 21 Jul 2021 19:50:24 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id c16sm14583134ilo.72.2021.07.21.19.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:50:24 -0700 (PDT)
Received: (nullmailer pid 3202242 invoked by uid 1000);
 Thu, 22 Jul 2021 02:50:22 -0000
Date: Wed, 21 Jul 2021 20:50:22 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org, Yuwen Ng <yuwen.ng@mediatek.com>
Subject: Re: [PATCH v3 02/13] dt-bindings: usb: mtu3: add optional property
 to disable usb2 ports
Message-ID: <20210722025022.GA3202212@robh.at.kernel.org>
References: <1626340078-29111-1-git-send-email-chunfeng.yun@mediatek.com>
 <1626340078-29111-3-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626340078-29111-3-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_195025_601199_F7ED6AA6 
X-CRM114-Status: GOOD (  15.00  )
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

On Thu, 15 Jul 2021 17:07:47 +0800, Chunfeng Yun wrote:
> Add support to disable specific usb2 host ports, it's useful when
> a usb2 port is disabled on some platforms, but enabled on others for
> the same SoC, another case is that the different package may support
> different number of ports.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> Due to there is property 'mediatek,u3p-dis-msk', prefer to use
> a similar name for the similar opertions, not spell out 'mask'
> as suggested by Rob.
> 
> v2~3: no changes
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
