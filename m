Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123ADEB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 02:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPT7rgVOueA/vtWzJH+SEIhz2dNMOJZy5yAUufE6SRM=; b=Yj7mSE8tRgrXaPDGR++VIk18g5
	HO8DVNSGDrH7pTfGAJZHPJmjy2+IwehJkjGFPbrgyr2ONrZz+3j3DP52iZ9ZY9nkU897Gof266kGj
	1nYJI2nw827VFyGGVcD+vckitInFhbnlkFO/VV7uxLpthYELMQO075kQsLzh+GMHCuHsVVu8KQPgl
	OtWLLwMstss8oqYo7UV8Swe3I/KQOFdqjVwJ6iCHhYo44XFZTOh5oPof3okCuBUzq07Itk2knaHh4
	lheS07LV7y6I0O60/8x+EB9JleEWqnRP6k5F92wZSBrLaseKba47rgWtRCqPRudpxlxy84HneQVVJ
	aqdIkKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOUJQ-008vJj-0O;
	Wed, 26 Jul 2023 02:31:40 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOUJM-008vHy-19
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jul 2023 02:31:38 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686b9920362so641037b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Jul 2023 19:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690338689; x=1690943489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GPT7rgVOueA/vtWzJH+SEIhz2dNMOJZy5yAUufE6SRM=;
        b=UgZdpL68r9t5pAABfse/TTJsSZCOv4QCHuO+UpNLc2JIjwkZlAaG2LF0WxD2n0oJGw
         s6ZRGmOf0jc46JY6mGqz2vp+udgDBJpl17lS2Is89v9Pfo0DonU3ipUxPBTZOqtDxfno
         K/og2RtGTkQ8iLpLMZDsLHOeGyxVYslQTRUBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690338689; x=1690943489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPT7rgVOueA/vtWzJH+SEIhz2dNMOJZy5yAUufE6SRM=;
        b=HZ895+s4OD8/1M1Z85N8EgV6vWc+byLRtEXtXcgP9zTco8YPcrs0isQsjjhOpu8JJ0
         iJy3zw8Q/z/KUjpP/c8GoM5bbwoV8g17CYFcX1l3TOwS286ow7k1rx71JlTjIS+KZosi
         lVTN70BlZ5orRzkl72CuxJzMlwyG9iiPhgyY0aLp2DeAIGrNJI+A/w6+cAWEOI0t2U5r
         vGHIemiR+Bz+ZA0vHJLQz3ToYlQOk5wV5oP6arC2VAtMYLhFtK8US1EfUBE5Lj6bYvUA
         RebkH5mPD76x2dFXyd1oDuI8/2uAa4dvD/gDQmUWH6V1QMjD5q1MYrxjfCUIOE3yruBv
         3M6A==
X-Gm-Message-State: ABy/qLZSffPwf4MI4BGiFAqzfi3/I+Jcp1GNzUb4d5fyzMpaOyLw3nwP
	Y/VceSwF0L5n5cAuP7WSGezTjg==
X-Google-Smtp-Source: APBJJlH2AoOqIXtcjLvfyeaz76cmHZnd/fj7CnIcg6rsc3YAd6G84tjm9xlptvLlZqyVp4X4BgJmGw==
X-Received: by 2002:a05:6a00:17a9:b0:686:6fa8:2b0d with SMTP id s41-20020a056a0017a900b006866fa82b0dmr1180821pfg.4.1690338688739;
        Tue, 25 Jul 2023 19:31:28 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:a2a4:d590:6375:66ba])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7848b000000b00686bfbb7353sm325907pfn.184.2023.07.25.19.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 19:31:27 -0700 (PDT)
Date: Wed, 26 Jul 2023 11:31:22 +0900
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
Message-ID: <20230726023122.GH955071@google.com>
References: <20230721063705.11455-1-andrew.yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721063705.11455-1-andrew.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_193136_410687_0B9083E3 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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

Sorry, I don't think I follow. Can you please elaborate?
What is fullness in this context? What is the race condition
exactly? Can I please have something like

	CPU0		CPU1

	foo		bar

