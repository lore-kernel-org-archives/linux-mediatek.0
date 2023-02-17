Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1D6C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G77BTcHhRQ4+lEDvCbYMyefKE9aJZN3Px+TFcwY1b+Q=; b=3yzUqaM3GjI42iucgbDEb6C99Q
	nx7zRpcremAz0Xj5PhFNmSuP4gmKw3hnHPtli0N2HbVPyQ5084ZuPiu+X33vQDQJNWVONgotNBm7H
	Ut0Q85W1ef8afLf0rzu64QomGw1i9xsey52H3g4GAqT0k2/AUwMJRmeS29LAti6bHnjmH3cJs4g3I
	iNo16yV3MLJgs3xEZCHMpLPczxqZNC9sW+VA6uw/QBrUJ3kHZD2VqfIcHz06CQt6WSyTuLMuRScin
	3pvszqTxEDHWCCE/pRmXLdLuWyZp6GwP31tadX/YaXmJIe/5C84Yy1NHbuRu9psbZ8HHzuL+Z5t70
	QtTBanbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs9B-00CbAr-Ry; Fri, 17 Feb 2023 04:14:57 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs7M-00Ca9j-Fb
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:13:05 +0000
Received: by mail-vs1-xe35.google.com with SMTP id j40so2303645vsv.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G77BTcHhRQ4+lEDvCbYMyefKE9aJZN3Px+TFcwY1b+Q=;
        b=GmE7DywGVi2M05n5axYkyIEpPCl1yojCDqSZmlOqptPf+FIFQ9rwtUdwxWVNS6H77u
         dzfEzQL86KPfQAtyLi/gV4sE56JKW+aO2yoEXsGyFC4VUrzAGcNoyEcYPTAmtBaVHk/X
         UvraMVqeQKqeM42juOuw7oD2urjx3xzrmHMFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G77BTcHhRQ4+lEDvCbYMyefKE9aJZN3Px+TFcwY1b+Q=;
        b=C0TJ8HVLiMumc2HICmtbaDNX7K/+sSi2gsqBNbn3J9np8PkjnPL0dVARznofmXU1Wr
         aY+2X4dQPSgAZG/9Pk7JSncMRGgA1+VR5m5Btkd/yVgU/7bIYOrva1jW0blMww1yL9LM
         RVZaAkI+gFdx3oFT2tIeX8ayo7V88YWKt9ztRfvpFyhT69F6W+KAU2De0DRjZNi85gUv
         kJdZX71hlWKoQtGdkYp5nXI33mx7qCa28uwN+6w+yvRjo8lXlYcvc2R+tOeD6cbI4DyF
         SgSWOdThAnZxCz9Z3n172TjWFrysPLZoNh/309/cr3o9l+3mxNy+1ibRJASC2IUkG//O
         PQ0g==
X-Gm-Message-State: AO0yUKXaBbxv4YkdZpuCCdjUHM3D+2avmlIfw6Hn2UBAOfIX+6Nk+1xb
	TzQ6NqEwJ7L5wpLPuLHEyQ3xMYxazqlbjT5Gzu0gDw==
X-Google-Smtp-Source: AK7set8uu4LzlZOAeWltZx2kP6ZaURwx0xlX/YzXa4JbBvWynMHCgpza3Ox/yPiXCrWVfH0XBgVzD7yS+XwLI5tG3Os=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1525580vso.60.1676607182607; Thu, 16 Feb
 2023 20:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-34-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:12:51 +0800
Message-ID: <CAGXv+5GYnxxT+Z7mCYD6eJYvFT-J-uKEa8MOiZT5VRCDw-GsjQ@mail.gmail.com>
Subject: Re: [PATCH v2 33/47] clk: mediatek: mt8186-mcu: Migrate to common
 probe mechanism
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
X-CRM114-CacheID: sfid-20230216_201304_540355_FCA1F63F 
X-CRM114-Status: UNSURE (   6.02  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert MT8186 MCUSYS clocks to the common mtk_clk_simple_probe().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

