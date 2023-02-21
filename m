Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54039C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 04:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFPspBBy8xRufvz9CrVUPQBGieB+Oke55A7SPp7VcJM=; b=BEET0pjgiujP7JBMl1ZbOxbAPA
	gVFix4EVdp8hVcllnV6Qv+j88zZevGxMAYwEmC3nPJ7shFW5k9/Nbi8Cpr7/sJUS2ko+Sz4/50XMQ
	/i93iUteETnLvuZjw9kQy5B69ybw/EFx8mgcGk3FSBVr/bIm01skul+PC5TnaoZWulscondXyQI92
	ioaFgo/4DqU/SdLO1Plg5P52/bacti500XGIjK1Xa3BWD0YmW/eG4lr/LExE7x6rJdDpZyhUOn7EP
	UGpH3FmkfLUvSI6ksO//9QD/wnsGns6VrdfQ6FF+dAk/VmrvDN32TfbPpSnhTc2Y6fSFoLd+mGapy
	LCZy3o4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJtP-006ZaK-Io; Tue, 21 Feb 2023 04:04:39 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJtF-006ZWT-BQ
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 04:04:30 +0000
Received: by mail-vs1-xe35.google.com with SMTP id y8so2194050vsn.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 20:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676952266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GFPspBBy8xRufvz9CrVUPQBGieB+Oke55A7SPp7VcJM=;
        b=R5dfSm55zBS1tfl/U+ty43hb5qh/e8QSIHUYJq08Bvh2y7vb7a1Ab//RpRC8Bs/TI0
         6TQx07CRBlQ+YuqI2bdCR0+VTltSmArbpwH+x4ZDNSGynnZqKB4j7J/ynXHC82RxwKYv
         9NifwhJyspIjPHym9ORnrV0e5HPsxFjA7tYew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676952266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GFPspBBy8xRufvz9CrVUPQBGieB+Oke55A7SPp7VcJM=;
        b=lHcKcpRbcRD+t+MuGcK01KL1JNPEJ/DcXS3yVv7y/O7AGWxjKKmSYZwyWi4xaEE3nY
         +oTUo4gyxFSdZTIC+3DIxR1NVzIXgnO3YshBMRavuOfw8XzhIR0Cs3/U/bSppXgKjxzS
         MlP1AgxzIviEAsqdwdYy4GhuKWGScS40OUNx9RMXtpHK32hpA6blRrH07Fq3qd1QV8/9
         LLAvzwAqzkWNfP030ybuk6R0AEIDTVJVyIwcLS0yc+cDs1MYTPDLDE6f0bbaGbVxzaur
         QS3KPevah8H/bMM8Le9LDzU20QtHe9RcgD0l255l9ABeDOCKr2b54/ObEwEq3i3D0znk
         RvCA==
X-Gm-Message-State: AO0yUKWYhbx2py0/n8lLK6S817B796H5uVG3euhNfSSMPtixXzPqolHe
	L3W8/UfZMhMSRnyMnU/i+OLGhxU7/dpj7CxG4xFdFQ==
X-Google-Smtp-Source: AK7set9hjJHUXRV5a23fFX2CF7M2ZWALeU2SIlHI0oUS3F1iYlKirBG0RLvsqmYV+ZISRZOZozFJ+0+oYrW0V7+H900=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr836863vso.44.1676952266287; Mon, 20 Feb
 2023 20:04:26 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-56-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-56-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 12:04:15 +0800
Message-ID: <CAGXv+5EpnmBu8iAd9Ec0AAHvDUBRUUJx3uzv2MkaRLSRJfFD-w@mail.gmail.com>
Subject: Re: [PATCH v3 55/55] clk: mediatek: mt8135: Remove __initconst
 annotation from clock arrays
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
X-CRM114-CacheID: sfid-20230220_200429_394413_FCC177B8 
X-CRM114-Status: UNSURE (   9.58  )
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

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Being this a platform driver, these arrays are not only used during
> init anymore, but also during runtime: remove the __initconst annotation
> from all of them.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I think this should be squashed into the previous patch. Otherwise with just
that one, and with modules disabled, the driver would break if unbound
and rebound after late init, when the __initconst data has been dropped.

ChenYu

