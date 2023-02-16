Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D663C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 10:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwzrytKcGK6J02tRdTcyqtWr69LMQ1V040meAEqQm/k=; b=HevGHgO3l+MnOtINhBz0UgA+jV
	p3mRIdCDxDtSlcnfiTARCGJMZCW0xss+PfDm73ETi7WjcVR+PS+aCzQjSYegRsEaM1n8eI3EvJNoB
	f3ij525tXG2qonMnQMpcjBfLwu1jm91W1+bzAz8rCc3pwfsg5wT8e2hMp+852BZjFl7JaOrmCpcIi
	kuc0B6RBxM4hNf/UYSUSCbi8MR9Ms94zNseB4qyk02AQQg+qk5LYo9Tbb/eVueLza+h+D3pifUEVz
	TtxjyGTohfClPuHvWxyMRb0dOaMSIqnZaHAzIzkolwSCBQ2vv7EJVY/T1YcOYYMh8uhrnaflHIPBN
	+/JdAphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbw7-009lOm-4y; Thu, 16 Feb 2023 10:56:23 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbve-009l8y-0S
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 10:55:55 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id m1so1486968vst.7
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 02:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zwzrytKcGK6J02tRdTcyqtWr69LMQ1V040meAEqQm/k=;
        b=FqZCf6BIpw8mQzSkpFjZJU+ChtW8JK4Q4m1K9wKTgdR6oqnvR084AUnCAual8LqGmt
         ojESksxzlOI7nXXoWAUvxR0mNEGpYu52c9hzYIFv5TLu6DN4PlAa0gs9OQMWGgj2XdEu
         8EPu1VNHlZ4tjLfAkdPbbId6oz2M9aYW/lGIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwzrytKcGK6J02tRdTcyqtWr69LMQ1V040meAEqQm/k=;
        b=jE1Zivo7h+eCIIYPaE87mXdI044H6GfU9qHuei8G3md8PMwSR9Q/Q92gpZDLJiTZtA
         x+IJ7agVz+dKDlkoSyAJ+0kVRQWzeuN6orwSVnwVgGfoi75/NudpGNehiOB8lezy8Qfn
         Zyk7D0SSMwo4wjJwWnRnZWI7KT/0fcbOkddkYStvR5E+TSH2WvQX+s9iJPEOLZs3vqXm
         aMYfZOuY4CKOg19MGJsoIcDIB0vYIUQFjZwU3LqfYLDiymxwltnlr1UYJr8XtJejNxDA
         h3DpJcs3KF+GWVK+z2ejpNAwKJJe3feQjfnLOUMtnj70uuUuDpEW8bqIhFoGVmO8HNdF
         aO7Q==
X-Gm-Message-State: AO0yUKWCjYN1bQUwWAUYmMd5RHuoB63FisL9QmfRopMee/YW3mA8kbPb
	KREJtgt5tkMnjQA1f0vWb2fD+PvfC4zAkVLBhMOFyQ==
X-Google-Smtp-Source: AK7set+wt7rp+1cILEpIFwYvVl4saH+TpOxvH8a7hVqFk6+SLeAtwsmJrkP7H1j1ZOkGe5o5irDI97UoijSEBGRRa70=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1013119vso.60.1676544946210; Thu, 16 Feb
 2023 02:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-26-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-26-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 18:55:34 +0800
Message-ID: <CAGXv+5GSTD+9_VwL+PniBGZ1gjt4TrNK3EOpjxeSFiMMmTjzbA@mail.gmail.com>
Subject: Re: [PATCH v2 25/47] clk: mediatek: mt7622: Convert to platform
 driver and simple probe
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
X-CRM114-CacheID: sfid-20230216_025554_158704_F6C50BA6 
X-CRM114-Status: UNSURE (   7.52  )
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
> Convert the MT7622 topckgen and pericfg clock drivers to platform
> drivers and use the simple probe mechanism. This also allows to
> build these clocks as modules.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

