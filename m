Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC696E7AD6E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Fi0GvVL1UlJlWvA6+wPBTvjnYAhizI6Olhrf8X5QnE=; b=NeAgMgjYPzfsHBNyMe5/ZlSR2I
	v+J88ftwnrdOsnhYNduRFqdKc8sn7RqxpOyhCjbN/Ku5tMZ4o3lFqxxI+24i8Inj579A8pGcmuVvJ
	CP7svFQUfbQgeAkXcZHhBEzNpQcIyC8cf7sYxsYAEZZfMSYvWdiI3ofJgALMAxCMmZe/Dpu6se1Du
	R6jRB2MavO2UPzxK4n+NNLwX5x8iuIQ3A2OEDZsTtkLJb358Qkh9oMUEprAKkJzYPOSU7+OpIDag3
	8tPUNpAWX+kJecxOa7474r9w090AOsHWO19ZsfZ9jwSmFypPYxMp+RWDc7w3YLOkJ3yUnnRdbLEXZ
	Kmj7ZPVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhCk-00Erur-1l;
	Tue, 03 Oct 2023 15:20:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnhCh-00ErtW-1n
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Oct 2023 15:20:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c5ff5f858dso8046425ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696346454; x=1696951254; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Fi0GvVL1UlJlWvA6+wPBTvjnYAhizI6Olhrf8X5QnE=;
        b=WTIb7gT0r/rqDfG4lRvl1YGxs5OotfmDP2GyQZEZJ5nKulD8eOiqNPtBp9v9UlcPZp
         iytKR5BzFbDGBFsL9SI8B0Ty/B6oX3GrD6JQKyZQuGSF9PMRtbuOEjsY44VgSdF6pzeB
         GWTf41GLjUFCBeik8YVZOgSahNWvzXr5cpDzd8WW1i9pztugkJaINxfEqL8J1EM9u3wp
         aIaBB1WyPjQIQVyIubOR08qy3oamXhSAgWzlqIBVM76aaKh9/SKQ9b5lQsbKLmwyfwsI
         qveW+ZA6y6c6GxCH6mXWykHOz7GF9E0/a/xolK7Pa6moBcirhVHyNlt1Uib2a5kbDVeM
         kjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696346454; x=1696951254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Fi0GvVL1UlJlWvA6+wPBTvjnYAhizI6Olhrf8X5QnE=;
        b=lSsxu9R9aRTImESET3HJq9CJBXMGP0G08AC3jaZ5OJBgZNJo5oAr0Myjuv0nD2gxqP
         /RtGPJvnb1UzmcniZBIZ7bWrcSnxM5UZYAiQebDVLZBNgmW+uRHXtlmRBxR4XqafGr2s
         Vneiptn4ywmxEKAe0WCN306bdkp+b96BYnJ0YQZwEHGAfG88KWEQs22UypAt5Ntg0H65
         Ju8C7YP4oqxLUke7y4BtYEwUsn/ZN2JjrOoSw7QfDGek+pfzY1n6spG7xl2f2NSKa2a7
         nOYF96J740sSNzHI3SSOPDu6MM0JgqNFvqcBhSbO12rtX4yWYs4kKBxCMVowh2fwGrK/
         U0wg==
X-Gm-Message-State: AOJu0Yx1Dy8AA1FvolMK+tkMXoRKhJbY2d9dCHnzDoEO6tv9IqSqf5Xv
	mIiJhtYBNAhd+jsOkZicAI1MWg==
X-Google-Smtp-Source: AGHT+IHbk4360AQXMEM8OHKJjDDmSkblY5FgQIBA5Fra9XDJdxKFPKgQIzSaAMDLRapNNLqBYtu7wQ==
X-Received: by 2002:a17:902:d512:b0:1c4:c5d:d7fa with SMTP id b18-20020a170902d51200b001c40c5dd7famr13112626plg.45.1696346454478;
        Tue, 03 Oct 2023 08:20:54 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9379:e1e1:dd3c:a271])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902d3c500b001c74df14e72sm1684106plb.212.2023.10.03.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 08:20:53 -0700 (PDT)
Date: Tue, 3 Oct 2023 09:20:51 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/5] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
Message-ID: <ZRwxUz+K1SwGVQU3@p14s>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
 <20231003-mediatek-fixes-v6-7-v1-1-dad7cd62a8ff@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-1-dad7cd62a8ff@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_082055_622045_55D432C3 
X-CRM114-Status: GOOD (  20.24  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Seiya Wang <seiya.wang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>, soc@kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Jieyy Yang <jieyy.yang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 03, 2023 at 01:13:43PM +0200, AngeloGioacchino Del Regno wrote:
> I am a top reviewer mainly for MediaTek SoC related patches in most
> subsystems and I've also been upstreaming both improvements, fixes
> and new drivers and devicetrees when required.
> 
> The MediaTek scene saw a generous increase in number of patches that
> are sent to the lists every week, increasing the amount of required
> efforts to maintain the MTK bits overall, and we will possibly see
> even more of that.
> 
> For this reason, and also because of suggestions and encouragement
> coming from the community, I'm stepping up to be a co-maintainer of
> MediaTek SoCs support.
> 
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Link: https://lore.kernel.org/r/20230929082009.71843-1-angelogioacchino.delregno@collabora.com
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..57f82fcea1e7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2327,7 +2327,7 @@ F:	drivers/rtc/rtc-mt7622.c
>  
>  ARM/Mediatek SoC support
>  M:	Matthias Brugger <matthias.bgg@gmail.com>
> -R:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> +M:	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  L:	linux-kernel@vger.kernel.org
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
> 
> -- 
> 2.42.0
> 
> 

