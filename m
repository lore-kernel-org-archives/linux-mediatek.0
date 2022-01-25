Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B113C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YEhniKDFHr8xh/tPU88SJ2OIlVMLUrnDkvxtRedUJBQ=; b=u/l2nmD/3MJunC
	qnNdUxIE3ZDe2F4KSwx9bLvyBvhEFsueiqkj63CJln1e/AxJsENgb0qIhnotgNeqztsZhGF/t3U08
	dPHVvvAcbjpWOo42LUL+k3IXM9JJp7HeThXzHSgcmhwvWhjzTaEO528XxZnm/kSTl3Xg9Mym41Kbt
	CYXM0MuCiSFhTpNJKjwlegIlDjvRY4lVBfK0IyN/c8gcLqWeLT+/du9bmpwIUh17Tx6tHcPf13EQz
	v9OOSB41jWknH/Dub0ln+6eufnJIQqvhU8y1NAMRZ+EACD5TC63ZstEe4lTTBJF2FHeo8fSekWEx+
	oft6/2cMxgyX9yUQkyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIzZ-007QfY-1h; Tue, 25 Jan 2022 10:24:01 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCIzE-007QVi-A6
 for linux-mediatek@lists.infradead.org; Tue, 25 Jan 2022 10:23:41 +0000
Received: by mail-ed1-x531.google.com with SMTP id b13so62003217edn.0
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Jan 2022 02:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rLx/YZxDfavcDLwOxOrS4Rl7DmDxsfuNzODHqKOrfoo=;
 b=Cjqz4sGxayNEsd0GCR1jIVFD74VKC0x8YraruTsPgfOND0X2ETqMAY5JFiAndZytMK
 0vWmsJ53n+ZvUBJ3THnVnuegNLujOvRJ29cpo2wrGGfM8IQERsbvLPSZiYtebktMEAn5
 lP4jhdLT8I6R058mj/Du1FEwceKZtriaaoFWBjgHNetNGbwpeYOOaoejqlsvMPTluJ1s
 GXo99p08y6lcBEFNTXa1xW9tOutTgBKBPjtYtWR07W0Po1E6UtwB4+yK1qFE7VBu0zZb
 oeGW+7rDQoZJAaz1/vKmRlOwX/BY5VXWFd7/lA5BGJtxewlQ/lFI6jGJN8S3rK+UMm4E
 15FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rLx/YZxDfavcDLwOxOrS4Rl7DmDxsfuNzODHqKOrfoo=;
 b=o1KpJq0Av7RrxpFCbXQryFPCPOtTdKZ4TZ7LWeRn+Y1mXoYR7inQEQu6LzCtrdnTfF
 yRR0j8NyGcAoprOI/GYHVJWL7X4F8LxzHr06h+IALgkbjXockYZGKxwqFciKZzA8lWXB
 3Uwef5fRdD/UAL0QjydvqtQnTRmxxjbGHa0JzKZ5DXeDEO71FVVxFJg5gpk5KfeKIMYf
 8hRrp+FSQ6sEYGkKZCknH0VQwhb628lmDRtQ2ybiJ4G8i+zXp8h1Xvz5g8wU2dYTN8e5
 wThm+3Ku+L5/+LcnULbzi6xA3kXmWhRI7azcLtO1JVQmpGwBtKAIA0/GC8KCpFmCYLre
 gHvA==
X-Gm-Message-State: AOAM530jIUG65Ylz7f9f6yzSDF7SXMAdJmRYnv3WOIG/uGpm2nsCkgaj
 RgTQN7KPHkR0EzHO2C2eEO2gKRNr56i+AQwOm08xOw==
X-Google-Smtp-Source: ABdhPJzA60Ix8HB8puuXpcFij81WpZZ6sgSvskX6fLo4WF6+a1KQnXgq0MrdYEc7H/MvpVAOfZCSBG9y4O425dVnhbw=
X-Received: by 2002:a05:6402:1604:: with SMTP id
 f4mr19778138edv.352.1643106219001; 
 Tue, 25 Jan 2022 02:23:39 -0800 (PST)
MIME-Version: 1.0
References: <20220120070226.1492-1-biao.huang@mediatek.com>
 <20220120070226.1492-5-biao.huang@mediatek.com>
In-Reply-To: <20220120070226.1492-5-biao.huang@mediatek.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 25 Jan 2022 11:23:28 +0100
Message-ID: <CAMRc=MdVKdXcK0gdBSpaaSm5fx1o5Sy_0-JJBPK0=Xp7UmQnqQ@mail.gmail.com>
Subject: Re: [PATCH net-next v1 4/9] dt-bindings: net: mtk-star-emac: add
 support for MT8365
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
 Fabien Parent <fparent@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev <netdev@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, srv_heupstream@mediatek.com, 
 Macpaul Lin <macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_022340_376786_357E3FD9 
X-CRM114-Status: GOOD (  13.63  )
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

On Thu, Jan 20, 2022 at 8:02 AM Biao Huang <biao.huang@mediatek.com> wrote:
>
> Add binding document for Ethernet on MT8365.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/mediatek,star-emac.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
> index e6a5ff208253..87a8b25b03a6 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
> @@ -23,6 +23,7 @@ properties:
>        - mediatek,mt8516-eth
>        - mediatek,mt8518-eth
>        - mediatek,mt8175-eth
> +      - mediatek,mt8365-eth
>
>    reg:
>      maxItems: 1
> --
> 2.25.1
>

Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
