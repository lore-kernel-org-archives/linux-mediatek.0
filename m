Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E033C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 06:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYCBrgiptcIccQaoR1yFr00IgFPMzrEIhu4IjEnhkgg=; b=BgtYtyIyaObdlU6Nbvo/uD4B7f
	STGCEY5nKKNUd0F80fU+oNRtLVLooEwuBEPP2FBBmCgWJ1mg6jUeKbrqeEh71xgynIKxiB5krLYGN
	x5aNehcG3AUS4zrCqwcv0rLkm4XF0v4jHSFSnAFrmL6N2bST2BzkPisYZs7Ogq/Iyeik0r2a5M9LX
	5YZnVgS5Sm2NCGdl3GkcuodYzah1vrSh+rtnTvsTZdvy44/kvNAu9AGBHwhvegVHxOj9/7FQDQ0PB
	ml5jIzD7E8JA+8u7fj8hi6voia1HkD4kBPJVdC5zCGODcYgamBsO61FFb5X/0x+/hqs9Cv2g0zrBC
	+pqP+CKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPH1H-00AuJ3-Vg; Tue, 07 Feb 2023 05:59:55 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPH1E-00AuHb-46
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 05:59:53 +0000
Received: by mail-vs1-xe33.google.com with SMTP id d66so15114406vsd.9
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 21:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYCBrgiptcIccQaoR1yFr00IgFPMzrEIhu4IjEnhkgg=;
        b=LlHXujmHCp9zs7IKT97LWrboG47EwQubQ7sfNVf5qAHR7BJ6WLHnXHsdYtwz5X0L7g
         JKjtaDMFiTLvm8F3kXA94FuvEwMrHWfDOvPBUchFS9xIqdKB3B9J2ioNQmzUkTsGCk6w
         UX9ughR6BhREXrhALLqD84j/T4ipl5ae+JCng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYCBrgiptcIccQaoR1yFr00IgFPMzrEIhu4IjEnhkgg=;
        b=vSAH+rxAUqaW767Avqel21cGbCj8egpg05YwPK7MMYrjT30duZw7dxRN3+iOCt2mKV
         TlU9W77ffuoGjELNQIl/Cq4PP5Nu2rMCNGv9hUe840tpxe6LBw0un932RreiYIGnhuYj
         f0qTB6OPTUiI58pKAB0C4Ij+o+3yluI/LHTDjFuVyNwsmnchs9fmDpRWE90fRGkqqQzO
         UYlUS4e/QXkJYunIfembCJbmD0YeTirWpRbU3KahJQUAdMWo4bIvVTZ8wOq4isHfvZFQ
         eIG8VDztltogYiNpxzrB5FriYXQbaHxbZYNohSbzW/gL7niRBXf6xIrAb53g9tu5pOEj
         6pMw==
X-Gm-Message-State: AO0yUKVJ28CPbllp2FmdWlb8uWqIwiLL7OGSUsP4KrUH0GbOQGrndv9a
	MMXQfEo45T3LkEJ++vzFRzganFT7Ya7h/1thKwSMYg==
X-Google-Smtp-Source: AK7set/0KGVG7XttQqf4/FRIWSRB4YO2NnGxWgc+i+WRT7rd5XTR77t3wZBV9Di5qnEkjLhLnkylNIoCRLfCU28oxWw=
X-Received: by 2002:a67:1904:0:b0:3e8:d5a8:3fbe with SMTP id
 4-20020a671904000000b003e8d5a83fbemr441325vsz.9.1675749590556; Mon, 06 Feb
 2023 21:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Feb 2023 13:59:39 +0800
Message-ID: <CAGXv+5F3QqtjJ9n+OE0p+xT78Kau_KQ=dsU4=K3AEzCv_AEv7g@mail.gmail.com>
Subject: Re: [PATCH v1 02/45] clk: mediatek: clk-mtk: Introduce clk_mtk_pdev_{probe,remove}()
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
X-CRM114-CacheID: sfid-20230206_215952_199424_FBB9B7F7 
X-CRM114-Status: GOOD (  11.81  )
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
> Introduce functions clk_mtk_pdev_probe() and clk_mtk_pdev_remove():
> these will be useful to commonize the probe and remove handlers for
> multimedia (clk-mtxxxx-mm) drivers as these are registered by the
> mtk-mmsys driver instead of having their own devicetree compatible.
>
> In order to do this, the main logic of clk_mtk_simple{probe,remove}()
> was moved to new static __clk_mtk_simple_{probe,remove}() functions
> that take as parameter a pointer to struct device_node because when
> registering the clocks from mtk-mmsys we want to pass a pointer to
> the clock driver's parent (which is, obviously, mtk-mmsys) struct
> device_node instead.
>
> As for the clock driver's platform data: for the devicetree case, we
> keep using the standard match_data mechanism, else we retrieve it
> from an id_table.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

