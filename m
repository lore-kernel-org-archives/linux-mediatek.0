Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A6EC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:01:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6466560F0F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 15:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6466560F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hr1qGiWkT6NDX5vt5xqw2gz5cmGdg7uQERxvBopOZYE=; b=NgbiCIpfRdmJipoOpH4VaLaNPV
	QW/XD6OrVf5iuJzfGl4z91RWT1ZVFf946F8hTotrO54UTyJZj8tX6WZ7W4cpsi59Dw/fIodJTkq8A
	24ltVB5Y1dcLVdG8S3yZzTd9+Xwo+fW5PQpzHZnPrq/cJ/ND6SHeHzSWhsy+ISuY0kt5eKGwZTbdF
	lEicprgUqXFcS7B0A2N50ersKPz43M1kxecETkA1tHZENOmbdd+OeuzKktxrAUBkE3oN2dwr1XUmA
	z5ZzCEphBG4zXYz8WfEVocAkKbAF2bgEqzGWFCiHvz9yp/0bm7T+YNRWB4pAzR5ZB67P4Ogxu1uVZ
	LcL6EkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBIOl-006WFv-Av; Wed, 04 Aug 2021 15:01:35 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBIOQ-006WC7-BY; Wed, 04 Aug 2021 15:01:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id b128so1392479wmb.4;
 Wed, 04 Aug 2021 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GQYlKIfQGDZD7FjoDWhvgGxvqgy3lDL6xTNjgH07BzY=;
 b=VlQGEEEUxHdlEKHwFEl/LqPBI96Zk5RcZFcREolzaECkFymiY04eiDMv/K07o4c65e
 6pbpHwdHaBE6zEuxsxWDKWULyKmE3ob2eLFRPCvNZT++1I9aCC7lVMannu61bxB2Re52
 KB8B3XG10J5KqmK144Qeu2Sj2SCJQDhy093zRHwr95OBj3QTKjSXSMZ7SQo/5CdNq4Kg
 3/e7lrDsX24eU+nc8LTYe715HLfWJLl58MbJZGDuviX0ocim4PI4Rt89CEpiEjMNarGS
 5IJ5y2JbwKZO/3GkadcEKsogvYgmfEQETxmEkBHAgDsUQGdmasvUMZyWNWnqJo83llIo
 W76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GQYlKIfQGDZD7FjoDWhvgGxvqgy3lDL6xTNjgH07BzY=;
 b=izvfzb8/YbMmb/YN9vYkt2AhliSmVAc0wZ6Oa7lyUpSoYfpXU1iPGkAul58Ig5RM11
 TxsfARy/7rFr7isdP+I8rXVE4NGJCL5wSf+9nWVV6LxrHgFeO5xDbPovyzLb9lRon//x
 YaiebksYCjCXZwWXEvh9tgIs668V1Tu7dWJPwY/tcEcZILa5cIaDBUmO4VB4HIOT/2EI
 l1xszcgEq3nV7/Q2J8CzOTEc3TxUmVjnilEZyCoLWzjBsDHsGgLkg9EWWNZPdI7d/ofl
 CFYez8rCZ8/XSZ3jAomo5qDBq7J70gHp/1osmVsg1gyOdZ0Op02X09c4OnyjW+Hit8Qc
 0blw==
X-Gm-Message-State: AOAM531hFsTCVjb8AKS6VpHB8PtrWvf+hiBF3KbOsnMA7MO1EcNLZS3b
 IinKUiJvZNp0iWosRkdNmnE=
X-Google-Smtp-Source: ABdhPJxzfcsOveuM0G0E1e5sbC3j6IImykpjnYq9eMdoePCdanTPzPJYXQcYKmILkERsf0um35DdlQ==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr50842wmj.148.1628089270421;
 Wed, 04 Aug 2021 08:01:10 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id q9sm6223449wmj.2.2021.08.04.08.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:01:09 -0700 (PDT)
Subject: Re: [PATCH 0/2] Add MUSB for MT7623
To: Sungbo Eo <mans0n@gorani.run>, linux-mediatek@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210803151320.71531-1-mans0n@gorani.run>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <638a4526-2688-e7c6-c71e-0ebaaeb773b5@gmail.com>
Date: Wed, 4 Aug 2021 17:01:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210803151320.71531-1-mans0n@gorani.run>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_080114_456134_6832B1B4 
X-CRM114-Status: GOOD (  20.03  )
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

Hi Sungbo,

On 03/08/2021 17:13, Sungbo Eo wrote:
> These patches add support for the MUSB controller on Mediatek MT7623.
> Tested on Mercury RUSH-318AC Wi-Fi router.
> 

Nice to see you are working on Mediatek devices.
Are you planning to add the device tree for the router to the kernel? I'd be
happy to see them submitted.

Regards,
Matthias

> I got to know this from a BPI-R2 forum post [1], and managed to make it work on OpenWrt snapshot.
> I'd like to know if this also works on BPI-R2, I can happily share the details if needed.
> And I've just copy & pasted nodes from mt2701, please let me know if I missed some big differences between SoCs...
> 
> [1] http://forum.banana-pi.org/t/bpi-r2-otg-port/10551
> 
> Sungbo Eo (2):
>   dt-bindings: usb: mtk-musb: add MT7623 compatible
>   arm: dts: mt7623: add musb device nodes
> 
>  .../bindings/usb/mediatek,musb.yaml           |  1 +
>  arch/arm/boot/dts/mt7623.dtsi                 | 34 +++++++++++++++++++
>  arch/arm/boot/dts/mt7623a.dtsi                |  4 +++
>  3 files changed, 39 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
