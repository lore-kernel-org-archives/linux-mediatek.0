Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB4BC4452B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 20:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOPCrZROWsDyG1I/C6+7cS4PhF0GrOUguiAaKjDuy/g=; b=DETFbyUpA3l0jw7otjc449+eOp
	rUajs8IUhro46A0tx4AHhwTrRoFWovaZGaDnwx4DycOtNPuD6zN+tu2MQMj/2xEzl2D9qj7xlWydo
	dKhwaVdf4PTfqXaxPWAXiu3ZHA1IuFKB4PkAmjoOUjwyJXWHALQC0zGGylkvLYgTMpVwZOD0oEjVR
	gOI9oBB/Trq/gia7JA7PSAS9NmsnbCoh5dcsqjGxZS8e+9yAkiALyd5jRbnfhBTTeD9aYOb3UY0MD
	x7GtdFaJ0rZqSClyVpiCGiR2EFro3Nrg9GkUWIBk84WuLRzM1cD11i/A+orIrJw4E1pcK9ZDxDFIA
	KE9vrMwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGyg-0000000AMvI-3Lts;
	Tue, 21 Jul 2026 20:22:10 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGyd-0000000AMty-06Bo
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 20:22:09 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2097121e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jul 2026 13:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784665324; x=1785270124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pOPCrZROWsDyG1I/C6+7cS4PhF0GrOUguiAaKjDuy/g=;
        b=WRuN9JKTthlKTtrK0Et2gfnYhGEil0DEGkM4ng35RJkG56G+Kj4eEtUqidHRYqPoOM
         kIfXZHaMuwx8Vybb+gwI5pq+zECQVQ6zQ4vq4lYiYw+kzGKiHLMYN2n9/PGI8QHhCy86
         Q2aINBxORwOo/tBHXm6oV03YGncB2Um9kOmruHstn6XHp0/XsWhqElgXAtTODSwPTXJJ
         uAb7UJe3jqT025foI8Bo5Z/5CNJDijM6DHSxwNrVyjoQzuZGuaoaPxOglusr4rLlw8eM
         yaskExIR0R5YhjJyWXFB1/HGc81LQDqLvdct/cv73mkZSDnhpN8H36NxRx70ewkMmZzE
         O1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784665324; x=1785270124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pOPCrZROWsDyG1I/C6+7cS4PhF0GrOUguiAaKjDuy/g=;
        b=PoKqRQ296lf2jwlqmbpTfEzrRBHp9AMNWDJ9Fy+UG3juseZr3E0GkGb0wuqr65ybEL
         LZ4pJXBMbvQX97IgbJT5GvLR90iWu2F7rUNGTvYGMiEZSFhc7jjIqQTCePZzq7O3D7vR
         NWtOks5GZOz2MlPtnqxDK6D/x6XgSP6DHE9FkcVtmoXKwk+l3kjyUTw4i5OpAiQQABFn
         K4EWvSmvsz946HTxty6xv9h2lGpiTQxeikfx5Tdhdem+ShUEAxyKKimpzMl+6mHi0ObA
         M11kUpLyiKBwK5HztCUjYX8HZPzhYmMkjHDF3D/KAkKhr2xqcctBqWxkLJwGs8auyZsq
         sGHA==
X-Forwarded-Encrypted: i=1; AHgh+RrSVDJ9CGNnFu0oDvFhe7hFQud7hewE7qPEkW3DzpJc+xgKJvTg82lRt/JTkMnVGKmPfduxJwfV4HwLLBSz+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzguHe5/0RukUFbh9HT479jLAOh6EWGl/OLzoZjeAO+Y+LG1R0V
	VRdn35mdl7HHTw/Ld4lSLhogp6wIAusv4F7QaQ8lbIqtWUNtQWAfjLrm
X-Gm-Gg: AR+sD13OnVOhJsl5zWDdCj5aJp4vTZOdgJbsiV4vDU8ual0XaicV8SfWbJIU853KlPS
	81/vHFbcE19JB4KSAS9Lgb053lakikejggZbIUwy99pZ5p0z/adYpJikYTMuMoqFFdFg9o3sAiE
	Nngccl7i7dFqnLZCNpW1yt0nnv/8U5VnaWjSy23NzVTtezFTl++7+mnKGjw0Co8+bTtupJetejv
	dVhA6HQvSV0iyEwAM//gx5DaBlNPwkVIJirSNtTYDAA/e5+eF2mELSptWprIGY69f1Bd6GLhAam
	dD7aGCBJC38dT41ILITXiRcRDD9PDy7crDrA9CBtYT6FrlGVd7hbFQUB7tySoM+dSoY16OxbGtB
	FGbspiPky3dnwrPCHetyckgcmsDArLllXue8R+hQ65xT4EkaLTmiYYxEi/LPW1mi0oUiMztsAO3
	LwtkAGZUsg3jt1UvF0
X-Received: by 2002:a05:6512:3d03:b0:5b0:1852:936b with SMTP id 2adb3069b0e04-5b28fabeb58mr4630637e87.59.1784665324038;
        Tue, 21 Jul 2026 13:22:04 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30758sm99909e87.45.2026.07.21.13.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:22:03 -0700 (PDT)
Date: Tue, 21 Jul 2026 22:22:02 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv2 wireless] wifi: mt76: fix MAC address for non OF pcie
 cards
Message-ID: <al_SAwiLmgT6D_tS@soda.int.kasm.eu>
References: <20260706232857.807044-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706232857.807044-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_132207_082016_D703FB3D 
X-CRM114-Status: GOOD (  18.62  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 2026-07-06 16:28:57 -0700, Rosen Penev wrote:
> If seems the check for err is wrong as the proper macaddr gets written
> to from the EEPROM itself. Meaning checking err from of_get_mac_address is
> wrong as the proper macaddr has been written by this point.
> 
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/all/ajRmlyx_AEGybykL@soda.int.kasm.eu/
> Reported-by: Tobias Klausmann <klausman@schwarzvogel.de>
> Closes:
> https://lore.kernel.org/linux-wireless/30a90714-02d8-45f2-a7f1-4cfe0627d50b@skade.local/
> Fixes: 31ee1582717e ("wifi: mt76: fix of_get_mac_address error handling")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Tested-by: Tobias Klausmann <klausman@schwarzvogel.de>
> Tested-by: Klara Modin <klarasmodin@gmail.com>
> ---
>  v2: add extra tags and target wireless
>  drivers/net/wireless/mediatek/mt76/eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/eeprom.c b/drivers/net/wireless/mediatek/mt76/eeprom.c
> index b99d7452800f..afdb73661866 100644
> --- a/drivers/net/wireless/mediatek/mt76/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/eeprom.c
> @@ -181,7 +181,7 @@ mt76_eeprom_override(struct mt76_phy *phy)
>  	if (err == -EPROBE_DEFER)
>  		return err;
>  
> -	if (err) {
> +	if (!is_valid_ether_addr(phy->macaddr)) {
>  		eth_random_addr(phy->macaddr);
>  		dev_info(dev->dev,
>  			 "Invalid MAC address, using random address %pM\n",
> -- 
> 2.55.0
> 

Ping. No one seems to have picked this up yet, but I suppose it is
holiday season.

Regards,
Klara Modin

