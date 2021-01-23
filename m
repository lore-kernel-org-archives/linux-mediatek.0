Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56698C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 18:21:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 959B922D50
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 18:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 959B922D50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RTDYZfPZBed0pFv+g17tboq9NeP/M5QWZ+GsJPpNVqY=; b=pBaMRCBuUaHkEy5XnuBWeG0VW
	dmfTyP13JgJtp76MTUinGGE0wbBN3tDR8g01dQo5XHaweyRaUcEu2wtYvwpySQZQJF6jsfXLgDG5X
	4FiA9kwOxd9QZ5DFeJZYmokn51SJQie0hLUoir37LJsNlCE/Nef1iBHeanLUMlFzE1Qgc80RLViEh
	lML3U4rdjMwhv/zS72f9axG+IdH/i5hL1tyckkq/+U6eKhFITYCeww9OCIfR1J3pJs8OU5RpQzAad
	zkKNLRDKtL4rpGy2rnxTCIjZCz2wr30NAIypV4ijoBbveuXS4p/t45MUlKwptAECO8iFcR1D1YzN0
	0TE6NbcVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3NXR-0003L3-VN; Sat, 23 Jan 2021 18:21:34 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3NXQ-0003K8-1F; Sat, 23 Jan 2021 18:21:32 +0000
Received: by mail-oi1-x22e.google.com with SMTP id w8so10060957oie.2;
 Sat, 23 Jan 2021 10:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o1+l2WKjyhScHlobbmNQ1HDWRupu0a6RVtPaX1gSBpg=;
 b=IfmEv41K+pi+CNr+TFYMIP5c1eBl6UT4z4hLUTnjb/GVVONj/KLgzrUEoVIU8IuetP
 h6oimYL3XgcypPBRiIoqZvdlAHfXklESQBfgQH2L5ca/eQbpjGOzh8amtaqaBr0t7MUQ
 6ixB8LUXID2xZACWmMt7Zu3WULJ1lZWMY3bI/JxoH/uo06O1VfTNdcKfwZy0WUCwVdbl
 sDe9bk6MqGbE0vGUa295Pcog/SQ8Ot0VhYBHa83LSCEjjhkZzhrvK7aKKvowxgCJjWmV
 GMZhovc5uAj1vSXyFjYfGYa3k7cVTP6yN0a1OgAfRkfw2haknrm+EpLvdkZkKmf9a8A3
 NuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=o1+l2WKjyhScHlobbmNQ1HDWRupu0a6RVtPaX1gSBpg=;
 b=X4qMsZXvQh5wUccKR4QjpSpZ1JhKv4CH+lgPwv4WU2ENllyVBMc180wktt76vGIPuT
 8b3BAATJe23AYVVpYMq4yElw6MsTGRuHj29oQpnrdhln75f+/p4CcaiTdAErmIVA6nAc
 sBJ9waw8eaoOsO35QQvYGR7U0PSZAF8/vyIB0MSu2gPBcoB/qOCaEyQef4Ugj/gvsWIM
 MW6ANTmAPw0cs+Pp+sZTP35bV0PZd0QpR7np+GFq8n3NPrp0QGPI8MNmRoSrWnH+n3Ej
 LLF+L+Z7Vo4R+YGrIudlk+3QE6FHqWHgjODNUwGq7zgMqlTNFknW8SuGlBjSSoWunBob
 yyKA==
X-Gm-Message-State: AOAM532BcwHYA6Qx0b/a3O+dO7iJXyTSGLScXrW0G8RK0ITc4xO/ob3H
 3f0EGPQk/8jjG370BWaixRE=
X-Google-Smtp-Source: ABdhPJzw8ZOextXm1YqCpQ+WwltMu8MNbaK9AYoUy78SsHB3yI8dVebPuHxvjgXUxyKhNeyveX7+Ng==
X-Received: by 2002:aca:ded4:: with SMTP id v203mr6782580oig.148.1611426088150; 
 Sat, 23 Jan 2021 10:21:28 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id j17sm2420316otj.52.2021.01.23.10.21.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 23 Jan 2021 10:21:27 -0800 (PST)
Date: Sat, 23 Jan 2021 10:21:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
Message-ID: <20210123182126.GA59405@roeck-us.net>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
 <20201014131936.20584-3-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014131936.20584-3-crystal.guo@mediatek.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_132132_097960_9C063F3E 
X-CRM114-Status: GOOD (  14.19  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 09:19:34PM +0800, Crystal Guo wrote:
> update mtk-wdt document for MT8192 platform
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 45eedc2c3141..e36ba60de829 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -12,6 +12,7 @@ Required properties:
>  	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>  	"mediatek,mt8183-wdt": for MT8183
>  	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> +	"mediatek,mt8192-wdt": for MT8192
>  
>  - reg : Specifies base physical address and size of the registers.
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
