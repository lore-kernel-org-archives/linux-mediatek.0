Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A76C433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:35:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FAF9206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:35:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QMmWXecA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUmgMVV+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FAF9206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8eVUwJ9t8FFOHbqfzWF7tZXdI3ynge+WQ8KecINIvww=; b=QMmWXecAteVj55wX2baUE74on
	3ZjOprVcLkyymWYi2eXM6nadZQ4SwkyB12fYa8P9V5At/WpihEOyO7t9p1xMWBXMjmyKYZOhYAiFK
	PiV8n7zKJ0eAehe8HuGymwGqIv4s9fqJVlFSNxZhWAxXRcaEDMukqyL89Nt1UJ6WiTCio/4aKjgZH
	Alr0VH26KgTDCWrP1w1UwUM7OiHav8wl7xPdExaObr5R/b6fxfdrRSexXIKXBweT2EF0r88X8sRdQ
	ibkB8n/iRuZr0ZxmZUEzOYIcduzP9sGDhr6jqXkHhMUEXn4MJp0GffC2g3goAC7ZeTHXwsOx0os5Z
	5psw7CuQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXcs-0008Fp-EA; Thu, 23 Jul 2020 09:34:54 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXco-0008E7-MO; Thu, 23 Jul 2020 09:34:51 +0000
Received: by mail-oi1-x241.google.com with SMTP id r8so4458935oij.5;
 Thu, 23 Jul 2020 02:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mUOZNRgi2WDMnJstl3822UZz6W+cTtqoXZUUjvczjxY=;
 b=GUmgMVV+0yJv2t6Z8/U6LiDv83RrL6WvPXQzaXMvqS8vXXLmonyC2f/sVYS5y3WgFS
 lu6rgCV0dSB57hhQ+zGsUtViwuNgLJ4Wm7qmLAjXmLIhYKs9InfY8Q9Mg0Z4buKJZJSH
 cnJDaPA48Vl9eEnM8CUeXSmvI0XU1x4mnwVY6JbJTdqm8hHXsl+0cSSgzHYC3UQRL7ek
 FGCLCU4pcz8f6uKd3GfUfubrL0znfhsRCvZCn+xxy/PGfjVBLt1c2u5H4VW4nwTojQti
 twT6bqpOGxsBkLp4efBZayJ0tWmfcim3ZSHR8XUttqsVtES8Gk6Km6KugjNGIC+F8vk6
 P6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mUOZNRgi2WDMnJstl3822UZz6W+cTtqoXZUUjvczjxY=;
 b=rZNUZ2L/28WuCaYfE0WKS+rKWbMzOVhrHRsifLoStw4l7KcQCyJxYM4U/bVoellsYJ
 KyWDDEdoshd+ci5gVhQv9HkcOsvKO3yKKj4yz/xj5043gN2kpWUGTy64DHTp10G6kS/s
 4oqJe7V1KwAyLoAUFwpX+vnhacxKz77ORSnLWwWoC4KMnvQ9UDilv34ukXfMknSQZGLU
 a3LcuWeI2rgUczZJbXQ/aXGwQhvM6Rk8rlQP/VTZmE4MNxVvnDs1ikyUHAdqvEwdDXfD
 iOsg4JSkqBk1Uh3vaZMKXZnM7XxmVpRCHev3HrWCybEJpjKjOayTpCLUDw7kPnKXcPPj
 6HJA==
X-Gm-Message-State: AOAM5321C9YSNuRx0/a1sK/zLkrW5+N/q5MOlaNVzkzmLO0UoZx+ORfF
 B0Qsxnv4++23NbcqxOeNzkm3i179Q/VdrUtwnUw=
X-Google-Smtp-Source: ABdhPJzgqe7CiGqbKBHmABe5mif7/AisJOSoULJ2y82Ij6b5HcCjs5bc/QhzNylG1ab4yxMZWRDIL9nHg85nK/H8kbk=
X-Received: by 2002:aca:ba45:: with SMTP id k66mr3149488oif.47.1595496887048; 
 Thu, 23 Jul 2020 02:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1595469798-3824-2-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 23 Jul 2020 11:34:35 +0200
Message-ID: <CAFqH_50=MkBLHJ23hJo--RG=4560ttOUOjHuEwpevghFZ59xQQ@mail.gmail.com>
Subject: Re: [v7,
 PATCH 1/7] drm/mediatek: move ddp component defint into mtk_mmsys.h
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_053450_754191_4430AFCE 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yongqian Niu,

Thank you for your patch

Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 23
de jul. 2020 a les 4:05:
>
> move ddp component defint into mtk_mmsys.h
>

There is a typo, should be "defines". But why you should move these
defines to mtk-mmsys?



> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 34 +----------------------------
>  drivers/soc/mediatek/mtk-mmsys.c            |  4 +---
>  include/linux/soc/mediatek/mtk-mmsys.h      | 33 ++++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index debe363..161201f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -7,6 +7,7 @@
>  #define MTK_DRM_DDP_COMP_H
>
>  #include <linux/io.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>
>  struct device;
>  struct device_node;
> @@ -35,39 +36,6 @@ enum mtk_ddp_comp_type {
>         MTK_DDP_COMP_TYPE_MAX,
>  };
>
> -enum mtk_ddp_comp_id {
> -       DDP_COMPONENT_AAL0,
> -       DDP_COMPONENT_AAL1,
> -       DDP_COMPONENT_BLS,
> -       DDP_COMPONENT_CCORR,
> -       DDP_COMPONENT_COLOR0,
> -       DDP_COMPONENT_COLOR1,
> -       DDP_COMPONENT_DITHER,
> -       DDP_COMPONENT_DPI0,
> -       DDP_COMPONENT_DPI1,
> -       DDP_COMPONENT_DSI0,
> -       DDP_COMPONENT_DSI1,
> -       DDP_COMPONENT_DSI2,
> -       DDP_COMPONENT_DSI3,
> -       DDP_COMPONENT_GAMMA,
> -       DDP_COMPONENT_OD0,
> -       DDP_COMPONENT_OD1,
> -       DDP_COMPONENT_OVL0,
> -       DDP_COMPONENT_OVL_2L0,
> -       DDP_COMPONENT_OVL_2L1,
> -       DDP_COMPONENT_OVL1,
> -       DDP_COMPONENT_PWM0,
> -       DDP_COMPONENT_PWM1,
> -       DDP_COMPONENT_PWM2,
> -       DDP_COMPONENT_RDMA0,
> -       DDP_COMPONENT_RDMA1,
> -       DDP_COMPONENT_RDMA2,
> -       DDP_COMPONENT_UFOE,
> -       DDP_COMPONENT_WDMA0,
> -       DDP_COMPONENT_WDMA1,
> -       DDP_COMPONENT_ID_MAX,
> -};
> -
>  struct mtk_ddp_comp;
>  struct cmdq_pkt;
>  struct mtk_ddp_comp_funcs {
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a55f255..36ad66b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -5,13 +5,11 @@
>   */
>
>  #include <linux/device.h>
> +#include <linux/io.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
> -
>  #define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
>  #define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
>  #define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 7bab5d9..2228bf6 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -9,6 +9,39 @@
>  enum mtk_ddp_comp_id;
>  struct device;
>
> +enum mtk_ddp_comp_id {
> +       DDP_COMPONENT_AAL0,
> +       DDP_COMPONENT_AAL1,
> +       DDP_COMPONENT_BLS,
> +       DDP_COMPONENT_CCORR,
> +       DDP_COMPONENT_COLOR0,
> +       DDP_COMPONENT_COLOR1,
> +       DDP_COMPONENT_DITHER,
> +       DDP_COMPONENT_DPI0,
> +       DDP_COMPONENT_DPI1,
> +       DDP_COMPONENT_DSI0,
> +       DDP_COMPONENT_DSI1,
> +       DDP_COMPONENT_DSI2,
> +       DDP_COMPONENT_DSI3,
> +       DDP_COMPONENT_GAMMA,
> +       DDP_COMPONENT_OD0,
> +       DDP_COMPONENT_OD1,
> +       DDP_COMPONENT_OVL0,
> +       DDP_COMPONENT_OVL_2L0,
> +       DDP_COMPONENT_OVL_2L1,
> +       DDP_COMPONENT_OVL1,
> +       DDP_COMPONENT_PWM0,
> +       DDP_COMPONENT_PWM1,
> +       DDP_COMPONENT_PWM2,
> +       DDP_COMPONENT_RDMA0,
> +       DDP_COMPONENT_RDMA1,
> +       DDP_COMPONENT_RDMA2,
> +       DDP_COMPONENT_UFOE,
> +       DDP_COMPONENT_WDMA0,
> +       DDP_COMPONENT_WDMA1,
> +       DDP_COMPONENT_ID_MAX,
> +};
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>                            enum mtk_ddp_comp_id cur,
>                            enum mtk_ddp_comp_id next);
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
