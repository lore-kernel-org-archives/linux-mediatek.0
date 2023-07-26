Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26564C41513
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 03:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+54frm2BF9b0x4h3VLTQtdsqR6hdRnwcDLw7C242SeA=; b=BUafl/xgfa+8qsj+tEGuW3x+QI
	xvKk8Fn4YAw2IwUdZlkHiFuSbypIF6oDB1Y03rYWd/QMcY18EK2mlwdVkgILqI78Oyp1K7XAlg7UO
	MYLIuVwcY/6cpQxhNaPofJnz7EEY00o1kUrxxScG6RA5TFEAACtNg7Tp+RjIwGAeuyoV0SA4byGBt
	n7KFHtMNi8SOJYFzpAwvuCzqGrsjUk+J9dCWDJS35/OjoxwmRXkoAGc7tYnaIArSoQXjUCu2K3+YW
	8xe2nzN0eNAgqRHzFUKwXE+pJEEiuyCE9Lo2PKe4X4r95aPSVfJHePuZZMfpBcJxpdiP9zxFdZ9ob
	BFi4Yc2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOV38-008ymE-00;
	Wed, 26 Jul 2023 03:18:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOV35-008ylf-1x
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 03:18:52 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bba04b9df3so22917485ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 20:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690341531; x=1690946331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+54frm2BF9b0x4h3VLTQtdsqR6hdRnwcDLw7C242SeA=;
        b=FGGVTLYwPeR+WMnjwMI4toEthyhRuGbvyo0laNbwGyrJG0Rpc76WpioCPzaTOgNkjp
         oBPVZE33eucPSlzkjVJSs/g06TVbmFgkVHZ+4PeLrOsjBfcdVDgjJsYrHrCIdd0iunPR
         gNSyLeJ2KuvmbCAQDbUxpamCavfrGexiS+w3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690341531; x=1690946331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+54frm2BF9b0x4h3VLTQtdsqR6hdRnwcDLw7C242SeA=;
        b=U9hM+iIfBSOkkYIP4fVhVjqna1kMDwaGCrUmpn2R93I3RBdR7NevQ0tFmvHUq9t8W6
         7bdqj4gSL5djmmsaVDvQ7hOkgH/EkSZ90riAAufe18puDTcLYBEb3+nkfSxcZIglPEDP
         LEsaHaB3PCuGWVoHlXAzABvyAbstiSNWVGQWTX5WuBXUtUNZfpgndlOEdJDh6/byYMfH
         hHfnebLsvMP1w66JiVarn21BSdeJbxbDlaEHN1RrJbrRwmggVNc3q92167F7G0N7DmV9
         /OoqIa164q36zrqlwJwDTsNPXCdxBmaCGGiqde4JcREneMeZO7gbfgaJe3nl1aKWkPER
         fBAQ==
X-Gm-Message-State: ABy/qLa/5N+q+Tjw+WPITLRfk3NAkQr71HAuLlStofFS5bFsKdSsvseE
	ZVhpE0UCMn2eU+IYT1XLS7K4WA==
X-Google-Smtp-Source: APBJJlGwD2Cnl6vJMPdr7RWlX1wYQngr8hUuDiRtzOr9laitJN5WR9+Qb8PAnqB/EQPwGUwUOj2fww==
X-Received: by 2002:a17:902:e744:b0:1b8:3e15:40e8 with SMTP id p4-20020a170902e74400b001b83e1540e8mr919513plf.56.1690341530878;
        Tue, 25 Jul 2023 20:18:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:a2a4:d590:6375:66ba])
        by smtp.gmail.com with ESMTPSA id p21-20020a170902ead500b001b8af7f632asm4039466pld.176.2023.07.25.20.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 20:18:50 -0700 (PDT)
Date: Wed, 26 Jul 2023 12:18:46 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Yang <andrew.yang@mediatek.com>
Cc: Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	wsd_upstream@mediatek.com, casper.li@mediatek.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] zsmalloc: Fix races between modifications of fullness
 and isolated
Message-ID: <20230726031846.GJ955071@google.com>
References: <20230721063705.11455-1-andrew.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721063705.11455-1-andrew.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_201851_686797_D5E84CAB 
X-CRM114-Status: GOOD (  12.99  )
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

On (23/07/21 14:37), Andrew Yang wrote:
> 
> Since fullness and isolated share the same unsigned int,
> modifications of them should be protected by the same lock.
> 
> Signed-off-by: Andrew Yang <andrew.yang@mediatek.com>
> Fixes: c4549b871102 ("zsmalloc: remove zspage isolation for migration")

Have you observed issues in real life? That commit is more than a year
and a half old, so I wonder.

> @@ -1858,8 +1860,8 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
>  	 * Since we complete the data copy and set up new zspage structure,
>  	 * it's okay to release the pool's lock.
>  	 */

This comment should be moved too, because this is not where we unlock the
pool anymore.

> -	spin_unlock(&pool->lock);
>  	dec_zspage_isolation(zspage);
> +	spin_unlock(&pool->lock);
>  	migrate_write_unlock(zspage);

