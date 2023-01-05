Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F258C4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 19:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bq6fbrm89Wj505hes5KkebMmopf15cqL74ic5xUS4cE=; b=iOiY+1YnGDzX3vTluhh8WASlvr
	3G7WjVK972V4eQZPVmsn7G0yZfk8xo+GHDwiyaUAVsy+PrEFGxDlvtWOw6zbFs/b1JCSVitP9xC2c
	7/hqMDGrh8NYOqGcCgCYNARW7ol8HTBwiFt9ZPYTvigkZ0anyi/uLScmIO2ivXZTuRy+AdU0O4bNB
	WrtS9dKiDMkNAxulFz8fcv6bRpG7RoNO8pJAsieOD26HFMLlJer6Xpn7tWYyD5riTQDds01NjeTTD
	89vCF/tpX8NHVzNUam5nD/7tff3y/xsIFXxwnderfL7dDS46rOb3iE12R+zqReE3Vx65YzB269YYh
	F89qo0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDW94-00EDEd-W0; Thu, 05 Jan 2023 19:43:23 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDM9v-009BoB-Hy
	for linux-mediatek@lists.infradead.org; Thu, 05 Jan 2023 09:03:37 +0000
Received: by mail-vs1-xe31.google.com with SMTP id s127so23495014vsb.5
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 01:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bq6fbrm89Wj505hes5KkebMmopf15cqL74ic5xUS4cE=;
        b=aPoc/z738CDp+KaBXVHqKE1NJZKoDra2i+6EHl9mUA3mxfsljgABCG68ysGZnNPiD8
         ycH86LyVMdaImb3lcVJBoy23vImWTnjOqVgv6yrVXbOBLEs+16ZtF6d4ejKLSE5dETlt
         CS423HZshmzYe4YKkxuw3y2g5Lu7dSiYSTVno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq6fbrm89Wj505hes5KkebMmopf15cqL74ic5xUS4cE=;
        b=d1HWw4ADa7kxDZ12cMjvJm90o6iEO3dwd5wiqxDao9lZYpvLOZC+Vo3YHdAMdYsYsX
         4BwhqIREJeQdPOOXPd/9finPRGl3i6vtRwhQs+v6B/Nt2bcF//7aDHGkeRPl1zhpzeqa
         yQs1sTTD3XBuMh9pkG/5wtUGdXK4DeVx4P5QAw0anKc5fuEM1TKXshleUol9iLtGNWMw
         W0umA4B0wbtJBTuYC6eW45YMoYVnLbo/NkwSF/pSSWWrgwg8C9KSSBByl9JcJ0VbPIIM
         +Dr38we+D5+0VLJsU0YhKKKKOOYWrcuwWuWeGx+GwbD2nOKkHBlLbrkuuuOYPRUvEUVS
         1YAA==
X-Gm-Message-State: AFqh2kpLglTqpNDk16AbdU5EySHn4KclEk2MtoQ2mQS1Q/B9STsGX/qi
	VJMK6vXi42CpXJrRpZ1W0T9QDth5cz/A51lacfsL1A==
X-Google-Smtp-Source: AMrXdXuwCTR2fGOnMCsRQriJ+OQnC29RZ3V9tgnKJfLzj3aPE/ztb1euD+ZmDTzJF3h82BlYIZgmzUbg8fFoBOfJikI=
X-Received: by 2002:a67:c514:0:b0:3ce:b8eb:717e with SMTP id
 e20-20020a67c514000000b003ceb8eb717emr491817vsk.26.1672909412991; Thu, 05 Jan
 2023 01:03:32 -0800 (PST)
MIME-Version: 1.0
References: <20230104083110.736377-1-wenst@chromium.org>
In-Reply-To: <20230104083110.736377-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Jan 2023 17:03:21 +0800
Message-ID: <CAGXv+5FSc4H5QtMTZP7jj+SjDcU2u024cPm9LEAdT3oUoBusNg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc/mtk_scp: Move clk ops outside send_lock
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_010335_821361_69D48865 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, Jan 4, 2023 at 4:31 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> Clocks are properly reference counted and do not need to be inside the
> lock range.
>
> Right now this triggers a false-positive lockdep warning on MT8192 based
> Chromebooks, through a combination of mtk-scp that has a cros-ec-rpmsg
> sub-device, the (actual) cros-ec I2C adapter registration, I2C client
> (not on cros-ec) probe doing i2c transfers and enabling clocks.
>
> This is a false positive because the cros-ec-rpmsg under mtk-scp does
> not have an I2C adapter, and also each I2C adapter and cros-ec instance
> have their own mutex.
>
> Move the clk operations outside of the send_lock range.

Well this managed to untangle the lockdep warning a bit, but it still
appears. I'll keep looking into it.

