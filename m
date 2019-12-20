Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E15EC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 04:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0BE2465E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 04:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onB7oP++";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DlSUmhpw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E0BE2465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TIbalybUVUd4r6sQGgghm0komPebxGmv6I5MNUv1czs=; b=onB7oP++ad6Xm9
	mFw7UeH+kV3a1wJPM26p/EJ1Gllu6iw3tycfokCY1OQ9MhRWmu+FDKo8eG3Fh57MuWy6i+3vrqNL5
	qcIDHgDKL7EM5/78s5EaDBDH88rCv+ExWm/taWkbqfeCi/8if0Uawi1n5IwB2CtZk3HyHalq7Yh7F
	waFOkq8nEZYYThkPgi4C4SfN5uz30DBycjAXgJ0cqVSosV37cVkeHGY5MQFZAAOBdU5e5m8+yXv8Z
	1zvrJJ5MBT0HBvadMea4HZOauAUH10mcYS0wBzpzhYUOH4lL1tT+F91XA4kjQdRiJes9iJfCflMzL
	PPTDdfoDiqfUm3euuRgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii9dZ-0000Be-Pw; Fri, 20 Dec 2019 04:11:37 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii9dW-0000Aj-Mx
 for linux-mediatek@lists.infradead.org; Fri, 20 Dec 2019 04:11:36 +0000
Received: by mail-qk1-x742.google.com with SMTP id a203so6949129qkc.3
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Dec 2019 20:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QoYXPHnls44Z5wOYK4pAzny40P7lll1Gg/xWIt1DvMU=;
 b=DlSUmhpwxG7Zh4Vz6yQRkwgpLxVEgoqQNXDVLySEZ4pGT3rOCxuHgwmTzBDps/c0Pd
 oN3zqH3VECxhyYsLRqUehjcS0qR3gApcJlcIsbM5bcCsy3WnFq1EtAgQhVZk+iGMx/uQ
 gefmVJF9mXhFRiSssKsyEL6OsfPx7VUo/SaWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QoYXPHnls44Z5wOYK4pAzny40P7lll1Gg/xWIt1DvMU=;
 b=D6N/jN6x57nX/KEOZtmB/vqQz7iqUsWWNF+XXawW7/dDaKrKBjI+Q3kOPoaBVYGn6n
 8MLK9A9ywJDC988Wi6Yey8mzl0qXWKKl2nKRujvB8/2/7JkMOmJ1SpnEs4TFm1LyO9eD
 E3ThyC4MdNG11AingkcyR1mdtXjcg/1DguuTN2WHGmTx+azclf6yzhXeRYxdoFgkDWMf
 cuR6gHXlbdCmNkCX+txsJvBIT1mE/sTi5Bf7YnA578PMFBpZXLxrKDoOX3OJb28nmU94
 Bco39w3JNuAf7sQo9m+OObXA0hFpPeO49wyFiysa5Jink4VgoMTKpp6BgA+676YPb39Q
 H1BQ==
X-Gm-Message-State: APjAAAVRXejAlpI4k/rCF6gyqMI7PoGy6U/vBYJGAjw7O8vNzgSqkNcY
 wTWw787h9yC6DVrrt0I6zqGV/blP4HPcWJTz/DIxzRlIVEI=
X-Google-Smtp-Source: APXvYqx7ePPcrXRhTd+hI3MOAUTzjv0omBlqDcXJk45az0VL6N7HD4ZKjtGpVV03YNtBVxg4naVTAYbFS9HI6Bh262Q=
X-Received: by 2002:a37:6551:: with SMTP id z78mr12071941qkb.144.1576815093710; 
 Thu, 19 Dec 2019 20:11:33 -0800 (PST)
MIME-Version: 1.0
References: <1576813564-23927-1-git-send-email-weiyi.lu@mediatek.com>
 <1576813564-23927-6-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1576813564-23927-6-git-send-email-weiyi.lu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 20 Dec 2019 12:11:22 +0800
Message-ID: <CANMq1KBLuugcoWb1o=rUkBR7oY5Cf5rX=DCvpVP5D_6FJ8jipw@mail.gmail.com>
Subject: Re: [PATCH v11 05/10] soc: mediatek: Remove infracfg misc driver
 support
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_201134_773950_7CAC3A94 
X-CRM114-Status: GOOD (  11.36  )
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
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 20, 2019 at 11:46 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> In previous patches, we introduce scpsys-ext driver that covers
> the functions which infracfg misc driver provided.
> And then replace bus_prot_mask with bp_table of all compatibles.
> Now, we're going to remove infracfg misc drvier which is no longer
> being used.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/soc/mediatek/Kconfig          | 10 -----
>  drivers/soc/mediatek/Makefile         |  3 +-
>  drivers/soc/mediatek/mtk-infracfg.c   | 79 -----------------------------------
>  include/linux/soc/mediatek/infracfg.h | 39 -----------------
>  4 files changed, 1 insertion(+), 130 deletions(-)
>  delete mode 100644 drivers/soc/mediatek/mtk-infracfg.c
>  delete mode 100644 include/linux/soc/mediatek/infracfg.h
> [snip]
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> deleted file mode 100644
> index fd25f01..0000000
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __SOC_MEDIATEK_INFRACFG_H
> -#define __SOC_MEDIATEK_INFRACFG_H
> -
> -#define MT8173_TOP_AXI_PROT_EN_MCI_M2          BIT(0)
> -#define MT8173_TOP_AXI_PROT_EN_MM_M0           BIT(1)
> -#define MT8173_TOP_AXI_PROT_EN_MM_M1           BIT(2)
> -#define MT8173_TOP_AXI_PROT_EN_MMAPB_S         BIT(6)
> -#define MT8173_TOP_AXI_PROT_EN_L2C_M2          BIT(9)
> -#define MT8173_TOP_AXI_PROT_EN_L2SS_SMI                BIT(11)
> -#define MT8173_TOP_AXI_PROT_EN_L2SS_ADD                BIT(12)
> -#define MT8173_TOP_AXI_PROT_EN_CCI_M2          BIT(13)
> -#define MT8173_TOP_AXI_PROT_EN_MFG_S           BIT(14)
> -#define MT8173_TOP_AXI_PROT_EN_PERI_M0         BIT(15)
> -#define MT8173_TOP_AXI_PROT_EN_PERI_M1         BIT(16)
> -#define MT8173_TOP_AXI_PROT_EN_DEBUGSYS                BIT(17)
> -#define MT8173_TOP_AXI_PROT_EN_CQ_DMA          BIT(18)
> -#define MT8173_TOP_AXI_PROT_EN_GCPU            BIT(19)
> -#define MT8173_TOP_AXI_PROT_EN_IOMMU           BIT(20)
> -#define MT8173_TOP_AXI_PROT_EN_MFG_M0          BIT(21)
> -#define MT8173_TOP_AXI_PROT_EN_MFG_M1          BIT(22)
> -#define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT   BIT(23)
> -
> -#define MT2701_TOP_AXI_PROT_EN_MM_M0           BIT(1)
> -#define MT2701_TOP_AXI_PROT_EN_CONN_M          BIT(2)
> -#define MT2701_TOP_AXI_PROT_EN_CONN_S          BIT(8)
> -
> -#define MT7622_TOP_AXI_PROT_EN_ETHSYS          (BIT(3) | BIT(17))
> -#define MT7622_TOP_AXI_PROT_EN_HIF0            (BIT(24) | BIT(25))
> -#define MT7622_TOP_AXI_PROT_EN_HIF1            (BIT(26) | BIT(27) | \
> -                                                BIT(28))
> -#define MT7622_TOP_AXI_PROT_EN_WB              (BIT(2) | BIT(6) | \
> -                                                BIT(7) | BIT(8))

Err wait, don't you need these values in patch 04/10?

> -
> -int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
> -               bool reg_update);
> -int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> -               bool reg_update);
> -#endif /* __SOC_MEDIATEK_INFRACFG_H */
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
