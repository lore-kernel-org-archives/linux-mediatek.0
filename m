Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DAAC636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgjdmMw404e96eCGT0CwRLnwbGzyDOlmcdjqegZU+w4=; b=kNEs9LRKWO4wwvia5ZunkoAqqj
	Nhk3w/Ir1SJLcZsefy6OyrdDa3bvtHJUroD4tYh09HvwHgHM44IUxQtfjrYA8NCzMVcvwu76jBEAw
	lt/thRXWA+CJ7ftQ8g9D7beNwnWwS50ZwCUicH8mcJQK0KoO+2Z3mkBcyGVxb0L1srjI5qdXUeKVH
	+RQPgt8CSmohC6/lmQY06XbWY71uOrCcv+2gVl9JnAeRABSAANrfmS8nzxcm/FlGUdLk5eQBXsq7I
	aMt2m3ErSVuC7EwVXYHpL9pQJKjPqqJVPP/gVateeQzrwmgUHHB7tqHyMEzr4/C/tepqvBySGs6KC
	jYKh8LIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYif-008oEE-6Z; Thu, 16 Feb 2023 07:30:17 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSYid-008oCt-Cz
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 07:30:16 +0000
Received: by mail-vs1-xe31.google.com with SMTP id s23so1052742vsj.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 23:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zgjdmMw404e96eCGT0CwRLnwbGzyDOlmcdjqegZU+w4=;
        b=U29za6dP4nZim4LX73LJtepxSFecuP04iFHVMGXIIuisBRRZ7kL0/VWKWH1sCfZ9HT
         HK5v10fiBN7n7KMtRCCc8Cj48nNuRpvwJY0qGcaH1Yuwlc+2qRCXLLeC0x1ru68PZr7d
         /PiCpCIHgxgl/sd0GSozR6wEbSm0s1TjHb7ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgjdmMw404e96eCGT0CwRLnwbGzyDOlmcdjqegZU+w4=;
        b=6Ze64nLU3+bxq6GqcT464MrdROI8WWL5VnOHdqHvP/T7C19KgBR9klZfYdZbIyS/LV
         wHmszHsLRmS5o+RbSQSneJiMuX3nU8el99OxyI2TB5KMBEutoB+QKedjVRc42NzD0zZM
         sTEYdPJ3hKT+pkbJ7Ucwf1NcMg9HvNZSdCIijeYgMmbWO2t8LNqF5V8Mo+xcfA4C56cW
         fQunAOMjfBR8gk+HVGgcHRzaq5tuPw0P3lDbyt8EMrSSPffcR8ktdDAi2OJ7Yw9FWaWC
         h93wfbVlxU9vgysEtWyppIl9OV2+H6fJ973N1nbuKYH9mv0MvU6qs9yiEorzn98KKml1
         VXZg==
X-Gm-Message-State: AO0yUKU6WLu1sBGtybHxdSKCtrvMcjQh/lVL0nbu/Hrdrcg0TAWKgBJS
	RvJA+rB0aXAKogQ+w/lnT2j5z5rbtH2FzZ4fN/46mw==
X-Google-Smtp-Source: AK7set+jJ/AVTqSNvsg91s9wgAmlKRg3temVxbwWlpvNRXd5CctR0P9VX7JvIhJNWWy7kb2HaRpKDPvC64m+RlpI6bs=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr931199vso.60.1676532612556; Wed, 15 Feb
 2023 23:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 15:30:01 +0800
Message-ID: <CAGXv+5F8OQX1WTDVLtLL3s_5ztVDO1hmzNN4uySsut74jbyoww@mail.gmail.com>
Subject: Re: [PATCH v2 08/47] clk: mediatek: mt2712: Move apmixedsys clock
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
X-CRM114-CacheID: sfid-20230215_233015_486223_E9480F06 
X-CRM114-Status: UNSURE (   8.84  )
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

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The only clock driver that does not support mtk_clk_simple_probe() is
> apmixedsys: in preparation for enabling module build of non-critical
> mt2712 clocks, move this to its own file.
> While at it, also fix some indentation issues in the PLLs table.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

