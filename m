Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D67C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 04:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hzc2DHU2nXa3yiV9mMwKUPwKVgPRmW21x4yoJc20iDQ=; b=qZ+cZiR0yd9LhFFxRh23K/ptQs
	/cGaYgmm5O1XWCWM+2lLznLjaKzdZDHayFlAFSQSE0dIUYs0GC14BnLZb5VmxbvnpCK+xeejdRS/V
	4KO61wXK+7WoxQmxKvJCpWVlBdYPKJqqNwzCHWJz11OSNyYIzvLEVsS+c5SdjMLUVd/wnUnaZN0iF
	qtCvCpuisyXvTkbPzAcdTOYQBg1TcTg2QfwLAyAa1luz+zsXAbUSPYHcwUImdA0wZ172GCQk3Zzwg
	KC07wSf9ky1Fuxq2+XzC5t6Ipv6SPrMUuMZj667GTvpvW09btoq85G7X0UyknGmNZbyrPs4dSZi2Y
	vgMDFJ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB7Fi-005bBJ-I4; Fri, 30 Dec 2022 04:44:18 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB7FP-005b1Y-9v
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 04:44:00 +0000
Received: by mail-ua1-x931.google.com with SMTP id z3so4582640uao.9
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 20:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzc2DHU2nXa3yiV9mMwKUPwKVgPRmW21x4yoJc20iDQ=;
        b=O+5j9m2EbbdN1CTgzG9n6p7QaEu/2bzOyhgVdgBnfNFK3U7HDhsFqkDYWE4gR0f0bF
         hW+O7JWn6lS6NF4XGdWV+bp450v7+1oB7HtLLlJr1EgBX79cN+aov/EQWlyE+fSdDHQP
         62aGlzXzflNwo2OGQ77bdaJSsJ7a+AI48H8A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hzc2DHU2nXa3yiV9mMwKUPwKVgPRmW21x4yoJc20iDQ=;
        b=ipkcOXNJRda/Es7ONPC320hMQL9dHCzEo0rPGjvyJn6/kyH8O/f9C65IcOgAd2j0RU
         6uHlJxaGNjigNKUF6xidTgvqVBshEOj4HpxHnEGIxkBLVBorF3Q0t+061jgGPXDuhSzV
         wkvWonV5yfpgAcBl5y7PpuMwtUtE6ClVPwQmAAoZ50E2fYd78ZMr3cSLqf1yliyDqTpL
         vKhUVuWc2g4wx2EsAGsLIxpgeSZEBoF+PQeoQqduzVfwVQRKVAe8Y8Uw3PNtPFPnOSk/
         Qz98Dz9/Lf7A7JhGDeXDQVwAmjB9NAutwP1Na6Sk+xS6tPfjCUkoHWYGOSEj1mMnLZ9O
         U/DQ==
X-Gm-Message-State: AFqh2koF+QrKoFlK7aSFWejnuvoIEPXiRoBtaJTkFr5/g7BXJHLFeAGL
	WOHBKLIt80mG32fafCdD37m+H4y9TJW7QMpyfDeazQ==
X-Google-Smtp-Source: AMrXdXtiQs6PVwO0EZw+110kG9yVpobNEk4D1l2z90lqtFZxqIG86YeOf7CwLTDHKuMvSgSq/MqegjK/bf+r4H56iww=
X-Received: by 2002:a9f:386b:0:b0:419:1620:be75 with SMTP id
 q40-20020a9f386b000000b004191620be75mr2785460uad.78.1672375436164; Thu, 29
 Dec 2022 20:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Dec 2022 12:43:45 +0800
Message-ID: <CAGXv+5FPDxxSd54478+6t0r9P7ytFYn7u6H3ezi4jYU=0R2CpA@mail.gmail.com>
Subject: Re: [PATCH v2 06/23] clk: mediatek: clk-mux: Propagate struct device
 for mtk-mux
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, fparent@baylibre.com, 
	chun-jie.chen@mediatek.com, sam.shih@mediatek.com, y.oudjana@protonmail.com, 
	nfraprado@collabora.com, rex-bc.chen@mediatek.com, ryder.lee@kernel.org, 
	daniel@makrotopia.org, jose.exposito89@gmail.com, yangyingliang@huawei.com, 
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com, 
	ikjn@chromium.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_204359_434987_9D24168F 
X-CRM114-Status: UNSURE (   7.07  )
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

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like done for other clocks, propagate struct device for mtk mux clocks
> registered through clk-mux helpers to enable runtime pm support.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Same comment as the previous patches, could we move struct device
to the first parameter?

Otherwise this looks good to me.

ChenYu

