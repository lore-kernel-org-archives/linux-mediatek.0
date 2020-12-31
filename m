Return-Path: <SRS0=2t6o=GD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6658C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 01:22:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4A021973
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Dec 2020 01:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A4A021973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m5DFgWBllKEIX1yM/olqq+m3+gPV2LWRtNw2w9dbQ78=; b=WYWMMGIo7pLT2EsiX4jjP9Urv
	TLwad9FzKnjq1KiSbpUl2H/ppYKt2ND1PW7xnSSS1UXkEoG7jrAonYCx7ob3uHOHzec/AUYfLI9+J
	axpl7gpITyn3gBayBcHrUy42V/uQn4Wk8PNsyP3ilID2wHAJuZ2+O78vmHTKIz8O4hCZ8lOXIKg1g
	O5t8B1aStP7XHeBkfwFuid7drPUuK2wMUC2K/eArueewEucpNCi31Ht/HcLolx8xzcmPOjgXxMtzM
	TYhVKtAJtDVfTMcmU+jzJ6Z8pULM7OEZ2uFE0L5tjv2DZ/51fWk8kcExxCTn1XHN7lG1OYIcYkrpD
	q68TAcMAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kumfD-0006fD-Kh; Thu, 31 Dec 2020 01:22:04 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kumfA-0006eD-EU
 for linux-mediatek@lists.infradead.org; Thu, 31 Dec 2020 01:22:02 +0000
Received: by mail-vk1-xa30.google.com with SMTP id d23so4007500vkf.3
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Dec 2020 17:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mlkXVdHyhNYiM3/2KIoSx+pXpWswuzzhreZMYSFz1hg=;
 b=aSw3CQT470ayL+TnbFzQRX0vGsaH4OBvdT0aCNT/hv0Q0LYzrJAEp/0i0h4rq6QHCm
 dzxlpQgg5DpEIAjBM0GXaSkeYlsN/M4mJ+QpEfXKp78FlGQi9yUqYQUvfCmTCPWh3Ii1
 tkGilqkmBxvJr7CHDSTuYCXfdQq01lh+4XvVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mlkXVdHyhNYiM3/2KIoSx+pXpWswuzzhreZMYSFz1hg=;
 b=lXBupnSOoU3vxiiFK/S8dtDqjwm45eplX7Aqw1zt14OaQzb7S+q0GVJXYOXIZ/dXRW
 nx3BM7IRyYDFauqQjgHXh5b58TJQZSR+EWfLEG5HbpXezaQf15eZJN4AlYCxPGFoLBlB
 LsIo4YAMUy4LOz/tyQj9W/QAfjRtx7i/sHsI8y767GW3mir1B0BVQ3qHPyzDz30i8Mb+
 IfcFN8r8hNzCqh+dsb1nSgD9Vlt+S4wRWzp03WVHWke18okkY3ZWkclK9/VYBRhJ7dF0
 hbnSSITrAN7KxYQkPcOLkBhctjWE3yoO0d49kEY9DFx2JN50Lmdpp9drNSd0L9iGQiqX
 C9AA==
X-Gm-Message-State: AOAM53382JkMxdB9tltpj9tIIJQp3bTN83l9oRC3vztqsNSa4JQNWjNF
 cjkfXslThuaDicEMUtiM8eXZU3RxPJ2LgpwBGBmWzA==
X-Google-Smtp-Source: ABdhPJzsqmjkBTHv/QEJaRsP982zznC3i91xEDQ66j6o4sJOhmDOVgkibqYEzzhJFkf9EQK3O0f9MLJhli4TwA0xbb8=
X-Received: by 2002:a1f:9e83:: with SMTP id h125mr18571561vke.18.1609377715869; 
 Wed, 30 Dec 2020 17:21:55 -0800 (PST)
MIME-Version: 1.0
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609144630-14721-2-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 31 Dec 2020 09:21:45 +0800
Message-ID: <CANMq1KCRBz-rY6y3nHp8yh_QSohkmaYS=DqNDSPzvwmq-a09DQ@mail.gmail.com>
Subject: Re: [PATCH v3, 1/8] soc: mediatek: mmsys: create mmsys folder
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_202200_820300_B08A5FAA 
X-CRM114-Status: GOOD (  16.87  )
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
 Devicetree List <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 28, 2020 at 4:38 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> the mmsys will more and more complicated after support
> more and more SoCs, add an independent folder will be
> more clear
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/Makefile          |   2 +-
>  drivers/soc/mediatek/mmsys/Makefile    |   2 +
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 380 +++++++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 380 ---------------------------------

I wonder why this doesn't get detected as a rename?

>  4 files changed, 383 insertions(+), 381 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
>  create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
>  delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c
>
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 01f9f87..b5987ca 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -3,4 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
>  obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
>  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> -obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> +obj-$(CONFIG_MTK_MMSYS) += mmsys/
> diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> new file mode 100644
> index 0000000..5d976d7
> --- /dev/null
> +++ b/drivers/soc/mediatek/mmsys/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> \ No newline at end of file

Nit: newline at end of file please.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
