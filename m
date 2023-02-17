Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C3BC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcW8AG2TyLkBNE4Hu3VEFQ3wFgGW5n9M9IjZpHAujXM=; b=OZwb1Apden9I8pi/Y7qb3hUCxy
	YIwwIs7k7rvSHEUc1rS5CqTDjRbNOspJN5NFm93E6TUWEzvad3iB+O1aMpY5o5zKpuV+Kc/6ZMCyL
	AsXXL4O+FDfMFzH/9cMkIx4XOYODbeDNnosBq927R1mWLanqpt0byEOQlWpLXx1H+tAaAs7eQqPkD
	ZYJ8M5sUD4ATKh37ITstJ4jyGZpc6QS01KvzmP2zJTqoMUlGU9mj6Huc/YxgVN3rEB5rTGGKL5HCr
	B5c50u04fKO4Exdifp1QfSyUu0xjurZFpGR2LIItdPSI7cjVZ4f+UOSHnZc0T+zGO3YPTktXhJehy
	nAK+QfMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvhe-00DC8f-IT; Fri, 17 Feb 2023 08:02:46 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvhP-00DC1J-BW
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 08:02:32 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id k6so4772288vsk.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Feb 2023 00:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VcW8AG2TyLkBNE4Hu3VEFQ3wFgGW5n9M9IjZpHAujXM=;
        b=Ufr+SXBAXOeAF3Pfn6zF2CYkJbX5X9kEu0PnrJRw8Vz/YhPa9j9LzIw7wkJKS/xlFO
         U1PkKAWNRZDY6MEPwPjsaaYl27rcXPLkGE3MrQOMc18aB6Gr0nb8DyDprYWppiz56arD
         QEvvMi1JOOjHdf9OnoaOuKHCCUy5aFDgXhTL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcW8AG2TyLkBNE4Hu3VEFQ3wFgGW5n9M9IjZpHAujXM=;
        b=i6GGShe+iVaR0o6Kwfobof/5gWHIKZOzMxQoUSRGcG/lPK7EohsuFbc2eLPzlIShWu
         +Lj/E0xNd3QY339QOV2OYWMfwTkVaaj3Fm79Bz+ip0SdWtw959Op11z/AeUHSf4iBglF
         xRBy1Vwec82zoJbfHUE7xpHHF4dQGgMu84dXkX4YICLQLEEkLL5cfPmC6G97P3lLZty5
         HMdGkNtpbz0cYa0DmGJi0Dcd3SI6C+9HbCqYQAK9qTC+k9x7PML9mKAdlobRidfAwu/v
         dtcMk3BtsXt+3XVnOcP5b3e+Xu0FC3Npz0llqY1nVwM+h0RMHK7+I5BjECad79MKZs+0
         5vjw==
X-Gm-Message-State: AO0yUKVflMh58mAlRaqP8vy06ABdDRZ+7gwh1eQmDuboo+ErvG2hXwp+
	h+GGl0Msgyo9HJte18rcO8kaEP16aphdzuZjSHlW7g==
X-Google-Smtp-Source: AK7set/dcXJQTdYoBFqpLsFuJwG80t02UFy21lpWoaeP0BlAHVzzkYwngm6oaJzSjA7yR666ENfUJS7byME7bnLyZw8=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1614101vso.60.1676620946419; Fri, 17 Feb
 2023 00:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-46-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-46-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 16:02:15 +0800
Message-ID: <CAGXv+5E+mkxNDc8kV+DwKVjmmF65555Pogh1OauwwKKqbrBz7A@mail.gmail.com>
Subject: Re: [PATCH v2 45/47] clk: mediatek: mt8192: Move apmixedsys clock
 driver to its own file
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_000231_445167_AD1C86A1 
X-CRM114-Status: GOOD (  12.44  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This is the last man standing in clk-mt8192.c that won't allow us to
> use the module_platform_driver() macro, and for *no* good reason.
> Move it to clk-mt8192-apmixedsys.c and while at it, also add a
> .remove() callback for it.
>
> Also, since the need for "clk-mt8192-simple" and "clk-mt8192" was
> just due to them being in the same file and probing different clocks,
> and since now there's just one platform_driver struct per file, it
> seemed natural to rename the `-simple` variant to just "clk-mt8192".

All the above combined, I think this patch is doing a bit too much, but
splitting it probably doesn't make much sense either :/

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

So a weak

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

in case anyone objects.

