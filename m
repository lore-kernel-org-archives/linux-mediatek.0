Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A4FC4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 21:17:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EAD207F7
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 21:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EAD207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KRWgf+PIio80rz6XcXzQpSWuuteI3bz56tIWIEDB+Qk=; b=sKT55QJ4gtiHOv5XBAMO3cg4A
	ywuegePW3Vwd3p+vWaRVlRG9+kzf8XKQaCLZ0ZCwiMvDKBQl/9FI8kWf+FI6sLvB8ArFBoWyBVFL7
	Daqrjd8pJVs5WtqEOC68pS5Tu+RW0zMP1v9wmVJ/0prPYSkEa26KizPRog+Mf6XJz75SJu0w+PZPf
	vh3509/lqbU8zarILoq+Ve7lcmWFahRnKcA+fgeNgBp/i+Itvvx/otxAfKpHtgd9rlYHvk+ArpKfu
	fqqxAr+QdYUqSOrenLjPA8TrnhsZUehSIlNMy28IfXoiOptZE/ITnuk6xZE36xQNrnmDx3vkB/uqY
	g0/JW2h+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmNso-0004tX-Gz; Mon, 07 Dec 2020 21:17:22 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmNsj-0004qz-D2; Mon, 07 Dec 2020 21:17:18 +0000
Received: by mail-ot1-f66.google.com with SMTP id 11so13896045oty.9;
 Mon, 07 Dec 2020 13:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G1G6ObvJgDI0E7m4Cl1U1Ro4MDrbTLhzH3K0T2+ZbBs=;
 b=csjxRGiJUlM/EZ6R6cf9SFy2xTHmUS3vLXIpN1DnWnLoV/xgHkvrQf+yaK+qK9NuUy
 zQVhv7j6ch086dvkrG82f/5Qln8MIy/pibetH6U7qlJ8uGcPAev1IUwtyNtmULB8MN7S
 Nsx9HA7i8CFngz5X5KY6wE8xpy9x/+tRbqyVXrgj6uA/J71s7o98GU+u/qxkh7tgK1SF
 UTW2wG7gykusvaSrGs5jW4VpEwnSRZHxv+1/OV3WqVzTlk1bShfMgt50GqbHSDJX9mug
 E2HYegTvwfbSossa+3hS0J4LG4JSalthXcu0j225/f8WeMT+Ai6ZkzAxT/McYKer+YVR
 DFGQ==
X-Gm-Message-State: AOAM531RLgbpDNRhjRHWSIctf9vetKnNSiEzJmfcpdqhrOtBEgp4qad0
 GteEntgUhUrg9ac3LEzWfw==
X-Google-Smtp-Source: ABdhPJy/chd0MSu5WIDA3RVAbdxX9aM4h7hyWLwu1dkVGQ1ZVEXEos5cdWB3ekvdjyNJmXERqp4QUg==
X-Received: by 2002:a05:6830:4036:: with SMTP id
 i22mr2933425ots.127.1607375835756; 
 Mon, 07 Dec 2020 13:17:15 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k134sm3203551oib.51.2020.12.07.13.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:17:14 -0800 (PST)
Received: (nullmailer pid 840904 invoked by uid 1000);
 Mon, 07 Dec 2020 21:17:13 -0000
Date: Mon, 7 Dec 2020 15:17:13 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 04/11] dt-bindings: phy: convert phy-mtk-tphy.txt to
 YAML schema
Message-ID: <20201207211713.GA840844@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-4-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-4-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_161717_470307_309BD3C8 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
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

On Wed, 18 Nov 2020 16:21:19 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>   1. fix dt_binding_check error in example after add mtu3.yaml
>   Changes suggested by Rob:
>   2. fix wrong indentation
>   3. remove '|' due to no formatting to preserve
>   4. add a space after '#'
>   5. drop unused labels and status in examples
>   6. modify file mode
> 
> v2:
>   1. modify description and compatible
> ---
>  .../bindings/phy/mediatek,tphy.yaml           | 260 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
>  2 files changed, 260 insertions(+), 162 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
