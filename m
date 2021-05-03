Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D650CC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 19:36:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 416D660FE3
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 19:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 416D660FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TwI9hkEJi/qVAkT33OrDsoCl26J9GUy0W5XL6luZSt0=; b=FT3EW/SX4tpjmRfGLvrAcXIXx
	dJq7wvRQL+Wr+ZvnE3T/iPuWV0JlDL+h62Z2QoBjWzsrUzZoLZP08i9kRDQpjuLMpSvAPPMFJoJK4
	gFW9JnjGAj8VNVz9LyXLuSTkkyPnsPZrelXWwZB0U8lVyWhqRUPfCxdPx63oEj78aI/tA7oJjic/p
	rFf0+suaNUZx1N+sPwfKHNb32w72IHJOLZfZbreB6AOSnuSMHCAEqhMp9DwWDa4lWIswv6m6L5m9b
	ChS7btZqYZ4ijGHU3zY7BQKFWdzUbDSwc9LxHE0X2nFrwObGtMxPLP6bIR/6sSM4DEgoT2+fisInG
	dbajVmsMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldeMC-00EjBs-NW; Mon, 03 May 2021 19:35:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldeMA-00EjBY-BO
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 19:35:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JBWBNxVimdXrI5+KU0cFX5vZU2z6L9qx8BxSHFKVFus=; b=OXZQ4I63oZ3zIWctvh0fbY50xi
 aeqbzQtXVugZUIZLF8nVVopfFq6iNkGmu1XUkXsXHZJC6yDV5z6E+Jf3ofItZeZ9lmHmCC4P7WLsr
 DpJsDHhUxgPJ3XAw09Fe35YyM563HpMeeKoJYkBjybO3QNSpZvuj21arVf+E6z4H7xjcw8IbZkNG8
 BZWonyo5bwxzYHYCql+zWcYeSSOJ2G3ptJSn3X1P7vKZBcDhNbZM82SaWxyLpx6R2Y8KWiXoDPiNE
 tiTA0QdL5DllLBS0O7nuOFAYD+UVeCK+EiaR9T3pahbso2mZRg+jfwxk2GOangV4AkytP4ivxveDZ
 yxRfRwRA==;
Received: from mail-oo1-f49.google.com ([209.85.161.49])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldeM6-003R5k-Oi
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 19:35:47 +0000
Received: by mail-oo1-f49.google.com with SMTP id
 u48-20020a4a97330000b02901fa060b8066so1492171ooi.8
 for <linux-mediatek@lists.infradead.org>; Mon, 03 May 2021 12:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JBWBNxVimdXrI5+KU0cFX5vZU2z6L9qx8BxSHFKVFus=;
 b=LPZQKwF/PFlUovswvTse5ZVnigJDJvR7//IxGWjtetyWxfnK4nmEHxxmkVPu9Kw/xD
 zEHy0CcpQiD+KquUoejD30i2eV1G9KSv3ulV8iEXhKNPwMAaXeMCl+4F0onEhvcCOg3L
 izm9PFCHQSefqd7wru+hkmpvKF3CmeBKU5xJi2383u2aUCzlrcQVk2AuEYES0OBnyWk2
 AjVCEhVQXpiayqVg66k200HlQCoq9w/t9BArHMV1WzzKyRykOvRhr0juZztEgs4adoMR
 GEkF7dado2XHaEQ6ERs9p7ywFuc4FSMb06mjxsPvmFS/yAoMhSjxvA8nJfH73XskllDv
 tcIA==
X-Gm-Message-State: AOAM5325IiT2WcauNqGvhDqxLpbZ1mbakKh2gchjUIiuUoKwWwGdPtxE
 dI4yXbiHND/wMPLh/Rs6rA==
X-Google-Smtp-Source: ABdhPJy/V6F3DccyF7xGWdj8eRMoURIuuJIGusacpBLZ1d5VgTJTuNBh1PnHECTqQEI5m6aTgsVEzA==
X-Received: by 2002:a4a:aa41:: with SMTP id y1mr15483387oom.52.1620070544325; 
 Mon, 03 May 2021 12:35:44 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a4sm188470oib.17.2021.05.03.12.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:35:43 -0700 (PDT)
Received: (nullmailer pid 2253889 invoked by uid 1000);
 Mon, 03 May 2021 19:35:41 -0000
Date: Mon, 3 May 2021 14:35:41 -0500
From: Rob Herring <robh@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Vladimir Oltean <olteanv@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, 
 Chuanhong Guo <gch981213@gmail.com>, linux-staging@lists.linux.dev, 
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 netdev@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 Weijie Gao <weijie.gao@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
Message-ID: <20210503193541.GA2253835@robh.at.kernel.org>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-4-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210429062130.29403-4-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_123546_825997_A756EBAB 
X-CRM114-Status: GOOD (  10.43  )
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

On Thu, 29 Apr 2021 14:21:29 +0800, DENG Qingfang wrote:
> Add device tree binding to support MT7530 interrupt controller.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
> RFC v4 -> PATCH v1:
> - No changes.
> 
>  Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
