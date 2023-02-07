Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E02EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di8RlAFDXixiWPVVKjwmVmn+q3pmV1A/L5akLwyt7Nc=; b=lKrBKBKKSa4WdHeFJMkl4QPwY+
	ynIDHN5r0qlxkRUVUtn/2ouxCVHl2zSAm3tuY0hW2kdSFC6PClzE2J8iddOtW5m2bxwm7LYHxzydu
	kSMT/GgLva861eDZ52C3oJWuvsgPjZl5dNA/RXennIusjPBOSaLJ4Bd03hvnS/SF8gp1wu7NzLbjx
	B5pbUQZTDTYANRTlZXdUyumDuDJMc++NQIF3KLHrmEboVbJyloSfaYKaOz8NBEfr6Y4hol+PNXULS
	jwSJb5M8oDzgKndIPhUCGn8Bgl/4ZmPNkM7/DaCUykvOZ64+VDTFrPBrrLtCvGvltjRdDvB8oyi5u
	ANAMj/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPH8N-00AvDB-9R; Tue, 07 Feb 2023 06:07:15 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPH8K-00AvC4-JB
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 06:07:13 +0000
Received: by mail-vs1-xe34.google.com with SMTP id z22so1225631vsq.11
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 22:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Di8RlAFDXixiWPVVKjwmVmn+q3pmV1A/L5akLwyt7Nc=;
        b=L3HvVnbjZnijMz+CunEMzm/Ax4c+mMXjg3QtyAUys+a11FwAdOhoAPH6UfPlQgQIgh
         wpWsZQu3Bmn/ahQHtG4+RWaOXkKydro9IAQwKbNS2NVJxTus4x006vX3gxiqMtWQ7PQx
         FxaZM2NXbsla+cnc8M0ywf8TmQoaXN67AMlhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Di8RlAFDXixiWPVVKjwmVmn+q3pmV1A/L5akLwyt7Nc=;
        b=1SP6sCc0JcGpebH8gVy4JVN4GPAiLbJYf/ycNmS4GD57Uc+JDNukPZLlo3+alxCvfK
         K9u4MdpyUBr0FWaky7ibs13lDEeJhkDMy+APA5dsacZPzbKYV+pTa4Wyfctt05+2bgmf
         q5WHj5f5GTNlh8BM3edHchBVOBqlziN+rY8WEW/P2pH6qFF8n17RewDMq9ChMOCtlzaC
         Br9xFs0zMwpUrIUEQc9PTqDHLVg0ZLGZpdZmu7ZQ2OQANQWOzK3icQXuFDmf3w2u1A4b
         0dnLCraYizcy8kCThE7euzdxD9nLOzjhLyEcNw6k1qJCNH8sdrnyUTBA/JJwqkc/p1Rg
         /xgg==
X-Gm-Message-State: AO0yUKX/g32IOqufoI7k1IGrnffuKEfDjvNXhObXaAMWhYVkm7ByBiS2
	PcgolsLSoZib7s9dpvoHzIYhE9gB3M2SvXMh284e/Q==
X-Google-Smtp-Source: AK7set8CXMGyMBuUrs9+E2OARHA5fk6GumDiWDSvfiq0b4is11veuHt+ijbXPvTl5cbTV+LKFMCtwDYVY2nWTdkUzUc=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr445813vsa.65.1675750028448; Mon, 06 Feb
 2023 22:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 14:06:57 +0800
Message-ID: <CAGXv+5HWpE+N8aFQkFB73_-L+O8JQGDczra0Gkmx173tH0EBqA@mail.gmail.com>
Subject: Re: [PATCH v1 03/45] clk: mediatek: Migrate to mtk_clk_pdev_probe()
 for multimedia clocks
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_220712_692372_48EF2FCB 
X-CRM114-Status: UNSURE (   7.67  )
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Reduce duplication and simplify all MediaTek multimedia clock drivers
> by migrating away from defining custom probe functions for each driver
> and instead use mtk_clk_pdev_probe().
>
> While at it, also add a .remove() callback to all of the multimedia
> clock drivers where missing.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

