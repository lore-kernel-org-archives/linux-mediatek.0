Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A1CC43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 07:22:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 757F220717
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 07:22:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tveEwJ5j";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NdwBkCpb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 757F220717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCD7EDva+xvulTbxJlEcFbESTUOlRsvmmy9+Aq54NEo=; b=tveEwJ5jUDE10D
	YboxdGb5zI2zuzu3gvU5/ndDTfrAZCcQ1S8BKNhkR/+EUKR/ngvsWRuycOpn6R/Zbb4ApkCrLtmyN
	8n90jqTz8I6PWJm2jdMd7RBSz7x54ZaZMJ11iukS72Vi8S3DGYTY7KfrWDmzlqmYZavUupcIH596G
	VDcgeIVBDRUwOMzG7VQnE//SPW1o6dS9jRVKC177Ht5b3HvCcNXY9rpJgpW+nn27jg6A4lIc/TUpR
	5odiSIexXI15GOsHOGStiqGhb538uPOpNjqKOSX9BiAgE9U3Ml4Y8ot1Ku/B/e48r5I5B484k3f94
	lbRspaJHEJjlSGLHW72g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igkhs-0004gM-Fx; Mon, 16 Dec 2019 07:22:16 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igkhp-0004ed-2U
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 07:22:14 +0000
Received: by mail-qv1-xf41.google.com with SMTP id p2so2321407qvo.10
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Dec 2019 23:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QLwYMou2QNNU+Bbtah+RA9oMWQD3BzPPJMlbiXBB1/I=;
 b=NdwBkCpbFJPMTNXk1ad0cpoBUAQZkJQHe3BmSg/COwJPa4xK4FCqULVmhzW+w0p9QV
 WfA/rygfsNE9cJTi/rTiHAYH1q7LZBaiqM4NOW+fQnEh1X69F9UITrKFWqL1qvBRxMsO
 7H5ksoQkI9T9j2yk7ASRdZGIp+SDj+Kyj9kSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QLwYMou2QNNU+Bbtah+RA9oMWQD3BzPPJMlbiXBB1/I=;
 b=dIWh3wDWR+7IIvwG0M2wV1aRNZr3W7OmbeRoq+zmCoBMj4ry79BkK23yk8RdQX3Pgo
 86Ez6mhfaTsS5CfsThmBgfKTVE+KW5EntYX832llCQB0Ne/TcWJpCCWlRYAm4wo15/W6
 kmnX3fbiesRPHRzW6Go9QDC2Q/9hJd0aoxxNQqcPEIQQr6glUavxriV6HT062S8sdejS
 7Gl9J9QbH5IV7BczsTjuA4SvWnYBedxyHeJrV7d8QUSdGnp7St/hLAWXF2qo4/VpIaWa
 8KFdo/n2G8+2Fq7tLfO62rOZRefZw9FnjNEOxT9mn2No4W1T+HB3U1NRwspFZlahXTNd
 6r+w==
X-Gm-Message-State: APjAAAVxYY6jFpQLxh/OYOi1d0xP6I+U0unJHyhfLidxUcuzXFYJ96rp
 S8ic4lBXNgHTc7hefDRNbT9alxr7VNJP2eLZvTxWsg==
X-Google-Smtp-Source: APXvYqzFEIcrFrTNSr7HVqHHexEeQiAhr3dYzHFBq8Zo3RyDvXHnBPRwSaHHZt0irz/WjMERV0dX2mrxOBMgRWyFvzA=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr25457091qvn.6.1576480928001;
 Sun, 15 Dec 2019 23:22:08 -0800 (PST)
MIME-Version: 1.0
References: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
 <1575960413-6900-5-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1575960413-6900-5-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 16 Dec 2019 15:21:57 +0800
Message-ID: <CANMq1KA4KL=ZpU=cQtw3LV79DKRdG3Eb16og6vU1SdsnnL=0CA@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] soc: mediatek: Add multiple step bus protection
 control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_232213_143946_812269A5 
X-CRM114-Status: GOOD (  18.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 2:47 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> Both MT8183 & MT6765 have more control steps of bus protection
> than previous project. And there add more bus protection registers
> reside at infracfg & smi-common. Also add new APIs for multiple
> step bus protection control with more customized arguments.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/Makefile           |  2 +-
>  drivers/soc/mediatek/mtk-scpsys-ext.c   | 99 +++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-scpsys.c       | 39 +++++++++----
>  include/linux/soc/mediatek/scpsys-ext.h | 39 +++++++++++++
>  4 files changed, 168 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mtk-scpsys-ext.c
>  create mode 100644 include/linux/soc/mediatek/scpsys-ext.h
>
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index b017330..b442be9 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> -obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> +obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o mtk-scpsys-ext.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> diff --git a/drivers/soc/mediatek/mtk-scpsys-ext.c b/drivers/soc/mediatek/mtk-scpsys-ext.c
> new file mode 100644
> index 0000000..4f1adda
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-scpsys-ext.c
> @@ -0,0 +1,99 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + * Author: Owen Chen <Owen.Chen@mediatek.com>
> + */
> +#include <linux/ktime.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/soc/mediatek/scpsys-ext.h>
> +
> +#define MTK_POLL_DELAY_US   10
> +#define MTK_POLL_TIMEOUT    USEC_PER_SEC
> +
> +static int set_bus_protection(struct regmap *map, u32 mask, u32 ack_mask,
> +               u32 reg_set, u32 reg_sta, u32 reg_en)
> +{
> +       u32 val;
> +
> +       if (reg_set)
> +               regmap_write(map, reg_set, mask);
> +       else
> +               regmap_update_bits(map, reg_en, mask, mask);

At least for 8183, we never seen to use the reg_set case, can we
simplify this function?

> +
> +       return regmap_read_poll_timeout(map, reg_sta,
> +                       val, (val & ack_mask) == ack_mask,
> +                       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);

From 8183, I see that you have either:
 1. mask == ack_mask
 2. ack_mask == 0 (essentially this skips this test)

Would it be simpler to just skip this test if reg_sta == 0, and always
assume mask == ack_mask otherwise?

e.g.
if (reg_sta == 0)
   return 0;

return regmap_read_poll_timeout(map, reg_sta,
                       val, (val & mask) == mask,
                       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);

> +}
> +
> [snip]
> +
> +int mtk_scpsys_ext_set_bus_protection(const struct bus_prot *bp_table,
> +       struct regmap *infracfg, struct regmap *smi_common)
> +{
> +       int i;
> +
> +       for (i = 0; i < MAX_STEPS; i++) {
> +               struct regmap *map = NULL;
> +               int ret;
> +
> +               if (bp_table[i].type == INVALID_TYPE)
> +                       continue;

break? (but yes the one below in mtk_scpsys_ext_clear_bus_protection
has to be continue).

> +               else if (bp_table[i].type == IFR_TYPE)
> +                       map = infracfg;
> +               else if (bp_table[i].type == SMI_TYPE)
> +                       map = smi_common;
> +
> +               ret = set_bus_protection(map,
> +                               bp_table[i].mask, bp_table[i].mask,
> +                               bp_table[i].set_ofs, bp_table[i].sta_ofs,
> +                               bp_table[i].en_ofs);
> +
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +int mtk_scpsys_ext_clear_bus_protection(const struct bus_prot *bp_table,
> +       struct regmap *infracfg, struct regmap *smi_common)
> +{
> +       int i;
> +
> +       for (i = MAX_STEPS - 1; i >= 0; i--) {
> +               struct regmap *map = NULL;
> +               int ret;
> +
> +               if (bp_table[i].type == INVALID_TYPE)
> +                       continue;
> +               else if (bp_table[i].type == IFR_TYPE)
> +                       map = infracfg;
> +               else if (bp_table[i].type == SMI_TYPE)
> +                       map = smi_common;
> +
> +               ret = clear_bus_protection(map,
> +                               bp_table[i].mask, bp_table[i].clr_ack_mask,
> +                               bp_table[i].clr_ofs, bp_table[i].sta_ofs,
> +                               bp_table[i].en_ofs);
> +
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index 915d635..466bb749 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -12,6 +12,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/soc/mediatek/infracfg.h>
> +#include <linux/soc/mediatek/scpsys-ext.h>
>
>  #include <dt-bindings/power/mt2701-power.h>
>  #include <dt-bindings/power/mt2712-power.h>
> @@ -120,6 +121,7 @@ enum clk_id {
>   * @basic_clk_id: provide the same purpose with field "clk_id"
>   *                by declaring basic clock prefix name rather than clk_id.
>   * @caps: The flag for active wake-up action.
> + * @bp_table: The mask table for multiple step bus protection.
>   */
>  struct scp_domain_data {
>         const char *name;
> @@ -131,6 +133,7 @@ struct scp_domain_data {
>         enum clk_id clk_id[MAX_CLKS];
>         const char *basic_clk_id[MAX_CLKS];
>         u8 caps;
> +       struct bus_prot bp_table[MAX_STEPS];

As with the previous patch, I'm not a big fan of having 2 approaches
for something similar (bus_prot_mask vs bp_table), can we define a
simple macro for this?
e.g.:
.bp_table = BUS_PROT_SINGLE(mask)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
