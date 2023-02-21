Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C796BC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HqN3egQulWxDOUwNgXIKkCpD9Uq1nJcsXGny14J0gE=; b=SKoPKCqh5bhBEPe9s9DQuh+M3f
	sGhllPog8DbTROrsx70foxcQYrLP90oAF73xOymU3ED9SaeKzlvdr4e3EUhVlZClb5Mj+shAHpMmq
	2FDl9D5f+EmiY1A56p90fL1V43boIg27P/youvdXXRM9bRU5M2i8+42x25dq9XDfxHvm962Eotntg
	QgNQn84ac4/D0gRNm6IxGfRN8KLxcj7NdLGMsSyBheVQfszus2vAz6nDyPwR63NVSl62CjUqknSXb
	aXjIkhNRDlBMaGLEH+syKMFRk4SHuryNhsEA22WrsiBp+uAecn8Tt5vi+cQNs85Rfw5t/85tP+eaI
	wrRUefHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJjJ-006W70-C2; Tue, 21 Feb 2023 03:54:13 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJjG-006W5p-KT
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:54:12 +0000
Received: by mail-ua1-x936.google.com with SMTP id n4so56102ual.13
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HqN3egQulWxDOUwNgXIKkCpD9Uq1nJcsXGny14J0gE=;
        b=nz9jUt8OFkg3LTE5XyHfvNLcLPEcdH+d2oKGyNiF8DBCPym8hQLkx8EO+jIyirTxLb
         JQ/SnkiLoxAq6+NSOFkr77vfbqJtU3e7UoUJHdb9pYYS6sLnoaQfv78wz24lauqjgpDN
         vC6tBvAmTrWYgtJYP8ZcLof3pEFpu2eH34PBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HqN3egQulWxDOUwNgXIKkCpD9Uq1nJcsXGny14J0gE=;
        b=fddsrRMPJ45odS82B7OPujYl4UKBeMqxjLSgKtVE4odPamMf+8NOdEmuha0GWDTpFu
         lFMIhGanZmgIMBf75lsI2f77fDRQ9dl1Deop79uYhyHcvgFOMKM0lns57QYvVF3bglzJ
         TC1aVOwu47dzw8KoiaxeeVv7VbEFIec2KajHo/LEQy7FgITukn6epVU4MDJIZ3w9E5qz
         +EMiXmeB8p+9u3rbDuNZ2ATYvcSX7Wiqvaj/rqo++Dzxzdwrx4QlfRYO9OENOxDpwcJc
         XYuljSlhCBzeV8pXGOa4y+d60XnDNTUaUt0J9QVn6gVrh0Vlx9JnAfvFtnvIHJw0gTHA
         BOxg==
X-Gm-Message-State: AO0yUKUbwdeTt2c9NcuyE1M6WBMKMrR798GQ87QHYvN1o9Cczd42AaFt
	kIFWbolHwVK2pzEiih2OqYLFPzdljAM3Ej1h5EF/Gg==
X-Google-Smtp-Source: AK7set9VIEmauTPBD0SMjR0QxGvm+9nNLdQn9B6VZ+5eVqn4o4DG2LcQLdFEh2mEqFdkXQe+mLUs2kvbeIH7LU5AouI=
X-Received: by 2002:ab0:1014:0:b0:68b:90f4:1d8c with SMTP id
 f20-20020ab01014000000b0068b90f41d8cmr663799uab.1.1676951648551; Mon, 20 Feb
 2023 19:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-40-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-40-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:53:57 +0800
Message-ID: <CAGXv+5Eztv3RuXPXSYFd2qH_Wd18OcLNaqO+Lcp4hytjkBarfA@mail.gmail.com>
Subject: Re: [PATCH v3 39/55] clk: mediatek: Split MT8195 clock drivers and
 allow module build
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
X-CRM114-CacheID: sfid-20230220_195410_709673_E0114D45 
X-CRM114-Status: GOOD (  17.67  )
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
> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> option: there's no reason to do that, as it is totally unnecessary to
> build in all or none of them.
>
> Split them out: keep boot-critical clocks as bool and allow choosing
> non critical clocks as tristate.
>
> As a note, the dependencies of VDEC/VENCSYS and CAM/IMG/IPE/WPESYS
> are not for build-time but rather for runtime, as clocks registered
> by those have runtime dependencies on either or both VPP and IMGSYS.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig  | 100 ++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/Makefile |  20 ++++---
>  2 files changed, 113 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 45b7aea7648d..49919da2be26 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -692,6 +692,106 @@ config COMMON_CLK_MT8195
>          help
>            This driver supports MediaTek MT8195 clocks.
>
> +config COMMON_CLK_MT8195_APUSYS
> +       tristate "Clock driver for MediaTek MT8195 apusys"
> +       depends on COMMON_CLK_MT8195
> +       default COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 AI Processor Unit System clocks.
> +
> +config COMMON_CLK_MT8195_AUDSYS
> +       tristate "Clock driver for MediaTek MT8195 audsys"
> +       depends on COMMON_CLK_MT8195
> +       default COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 audsys clocks.
> +
> +config COMMON_CLK_MT8195_IMP_IIC_WRAP
> +       tristate "Clock driver for MediaTek MT8195 imp_iic_wrap"
> +       depends on COMMON_CLK_MT8195
> +       default COMMON_CLK_MT8195
> +       help
> +         This driver supports MediaTek MT8195 I2C/I3C clocks.
> +
> +config COMMON_CLK_MT8195_IPESYS
> +       tristate "Clock driver for MediaTek MT8195 ipesys"
> +       depends on COMMON_CLK_MT8195_IMGSYS

This should also be moved to just after IMGSYS.
This is the only one that is not ordered right, so after it is fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

