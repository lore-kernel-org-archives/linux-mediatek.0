Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDBCC6379F
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+hrs2lAK+lA6xPSkPZh7f/c9FRJJboss5C8HsTnhGs=; b=x0G3sipadL0dM+5EIERoP3qcJk
	K80oyumfHhD9/YEUiuPbaCul3fHbpRWm+WmXQg//MlirgAFV7GPQUpsfWQ6sENUhynlWjMAO7hYVL
	Pc8a9ZNIbjeVwBu5CQv670Ptr/XKPPp13UWBvFnGEKTpxFSf+0hg+/ERsfPST6B3gzI2SF0Vzj5VO
	QnjKSJ4ivSucm/0zgfoEnXLCfX/WfEoKC//cT5qX6njnuimCjqK173zuL8WO9NH0YzyBxe3xaKlAC
	yVDWSAUv1q0kXoaXrP10YiaUMELPVWcdh5bbOC36NcLFsfDGqdxm6uUdnFm0MwdncwwD77HfIfZ86
	FyFTGmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZ8V-008tF7-FW; Thu, 16 Feb 2023 07:56:59 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZ8L-008tC2-MN
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 07:56:50 +0000
Received: by mail-vk1-xa29.google.com with SMTP id f17so806337vkm.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 23:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+hrs2lAK+lA6xPSkPZh7f/c9FRJJboss5C8HsTnhGs=;
        b=VgoIMVhlFRtACzCN4hRa5+1Xi3pMJaBh96u+PgzGqHoDb9prJ0ayTGydLKG6Hm8wGY
         uMEFLNL07BW38H+oSAENCKGMlLRbEGukgcjjR0+ojtyIt9a5qEblrq1HAYdspZp1cQvH
         J67LUKdKoAl3g6dyDWhm4/20YnUKxGfw3l/Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+hrs2lAK+lA6xPSkPZh7f/c9FRJJboss5C8HsTnhGs=;
        b=qMpsGeRBm+d6nPD6PtgYsNqb+YMeebokeeT88w0H/27h89hWhzIzTVtTYbKZBTEWA4
         7YtJNlR5e/FfWkX5pZJ+lGMr/uUj+MYsmJEjzbpICauMtdArvTjj84leI/4pDH/xsAo9
         cMq/z5Nm0jjxKZPsDNpYCmGUfcnZKJSHVaT+esjuHris9pOM+T14HPjwXPEpQHY1OFeZ
         cnLDyVAWwLh5UsqHhLM1OEB81o/ccAmMyHLwx7hxoPueIT7Ua26Pg7VoleDn+kAeHmck
         OcWqPkKt1Xept1OPaWICNcaqASUr6gpBzYoC4yupvtJ9OZhGTqXr7IAeszge/HjVsFJM
         1Gsg==
X-Gm-Message-State: AO0yUKWbF49lHBPatE2UbsAC5kykEerCEJ0rjUFUOkz4MEYr4jckeZBP
	V4o/cDTA44Pb/V0r26AC6O+uHyNp9/m8vcK6XccAIg==
X-Google-Smtp-Source: AK7set8Eqn9R6ofXaO/748ltgZlu/6B9VwxQwEV+syUHvhvMASt7xjoJPSBrlG/SL+2wb0Fic8N+2YfU1QUTcbDeKso=
X-Received: by 2002:a1f:a447:0:b0:3e8:66ce:a639 with SMTP id
 n68-20020a1fa447000000b003e866cea639mr780867vke.2.1676534208435; Wed, 15 Feb
 2023 23:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-13-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 15:56:37 +0800
Message-ID: <CAGXv+5HDpAY1=s6966Dzv-d5Qp1XB7F-MkwR6QiHP+DWoznkXA@mail.gmail.com>
Subject: Re: [PATCH v2 12/47] clk: mediatek: mt8365: Join top_misc_mux_gates
 and top_misc_muxes arrays
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
X-CRM114-CacheID: sfid-20230215_235649_771708_05BF846C 
X-CRM114-Status: UNSURE (   8.20  )
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
> In preparation for migrating this driver to the simple probe mechanism,
> join the audio gates to the top_misc_mux_gates array of mtk_composite
> clocks in one top_misc_muxes array.
>
> While at it, since the `apll_i2s0_parents` array is for all i2s clocks,
> rename that to `apll_i2s_parents`.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

