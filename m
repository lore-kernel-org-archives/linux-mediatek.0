Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8AAC04A94
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 05:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UFdkTxk/r2phv46cParOTF4SmxA+o425ukdUTiBx2M=; b=Fyg5nGMo6jAwpxh89n/2UiLZ3S
	OPfnyIKdGmYd3JEP+lCaGZ3xWWzFCI5/ba39N1G8H3rrNPusiqp7ACnvApJg1sGl0NwMtfMNukeBY
	yrnPrGcRVdT8YLLXf9iFcp9LmGyGu8bhhlQCf+UBfG97a25UYhuBDU5pxwgtd0gpW/2fQAjSG4ceH
	OP8S9N+33kM7Hgh+mdyCp46SILfKK1yhqfoDrTdT492/D5TdFwEU17+wyFL/fNzY8CcByN/P3SXgW
	UHOlC5l2BJbEZKuRYMwdsOc1SJfUWT8EIqvO5TDYBxvG1Xsm2AT+kxnNFM7t1WIEuEbRo2FwxSAHd
	stH0CXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyTU-006bJM-1v;
	Thu, 10 Aug 2023 05:44:44 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyTS-006bIN-0J
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 05:44:43 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-583ae4818c8so6916387b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691646280; x=1692251080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UFdkTxk/r2phv46cParOTF4SmxA+o425ukdUTiBx2M=;
        b=VMuO/+DJDqUjpHShh0J4mlhWhdJDzZaNFkfcIMmUAJd3CmWizwRBLL2TYhhPTHhQ4+
         3Ot/zJq9lGGj55cFuTQK4o8DyNDdit7gqOmLaJgQKtJrhdFNcbRm8DYk6Gc9l78ToSyo
         tyRaclJMlo2ua0VHOHIHmxyQwunwqOJxbe1gs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691646280; x=1692251080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UFdkTxk/r2phv46cParOTF4SmxA+o425ukdUTiBx2M=;
        b=LaeYpNVjri386u19Agjjeoo7ncm5gwv18A81AzyvBjZdyERiW/nX7o8r3PR2ftEZU1
         m6M0w8ELx9s7RDDVJiaxiYpW2rAhyCT8vd/sPG0vIDZEx3MdCjU48aETN5ZeNxOa2ACK
         U3SxObAguk4csFJF0BbM9S1IttjQDWeLdPlm73YqSFvqxH3ZnhoF5MClDc6uGcxmSE2M
         KsOfti8OoEkxRBTfOneDpGkSFL8Z4YSLNPMVYhHFQcULL0V2cNAtrU/gYNRwzatO//Z9
         HRCBPnDlL6gKdz+EM+mkIU49NGwlSLQnoe6jURPYeCLXRwdT57h4R/5Fz1idYXoK87fo
         7WTg==
X-Gm-Message-State: AOJu0YximCScY8jAfsT8QMRFl0di+4pg88YX8CHyuoO73wHYrdeog4/I
	H7IhXTkWyUug/MK30863GMzepSi0XOAInPG48/A=
X-Google-Smtp-Source: AGHT+IG5ipmU7vyveuRu3Nn5UQv2jzHyOIKxf84rgWrQ2UNzhNnPyuBwH2XyoXlucEw/ysWAFtFA8A==
X-Received: by 2002:a81:4e93:0:b0:589:ad98:4108 with SMTP id c141-20020a814e93000000b00589ad984108mr1431125ywb.40.1691646280494;
        Wed, 09 Aug 2023 22:44:40 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id q3-20020a0dce03000000b00577269ba9e9sm170174ywd.86.2023.08.09.22.44.40
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 22:44:40 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-57026f4bccaso6940027b3.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Aug 2023 22:44:40 -0700 (PDT)
X-Received: by 2002:a6b:f00a:0:b0:780:ce72:ac55 with SMTP id
 w10-20020a6bf00a000000b00780ce72ac55mr2466455ioc.10.1691645851246; Wed, 09
 Aug 2023 22:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230809181525.7561-1-jason-jh.lin@mediatek.com> <20230809181525.7561-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20230809181525.7561-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 10 Aug 2023 13:36:55 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhi6Tk31a2wayVybcBdmE=wngawzoaz8B-4L9UXpqzD3Q@mail.gmail.com>
Message-ID: <CAC=S1nhi6Tk31a2wayVybcBdmE=wngawzoaz8B-4L9UXpqzD3Q@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] drm/mediatek: Fix using wrong drm private data to
 bind mediatek-drm
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eugen Hristev <eugen.hristev@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_224442_136779_2B1313EC 
X-CRM114-Status: GOOD (  10.21  )
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

On Thu, Aug 10, 2023 at 2:15=E2=80=AFAM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> According to mtk_drm_kms_init(), the all_drm_private array in each
> drm private data stores all drm private data in display path order.
>
> In mtk_drm_get_all_drm_priv(), each element in all_drm_priv should have o=
ne
> display path private data, such as:
> all_drm_priv[CRTC_MAIN] should only have main_path data
> all_drm_priv[CRTC_EXT] should only have ext_path data
> all_drm_priv[CRTC_THIRD] should only have third_path data
>
> So we need to add the length checking for each display path before
> assigning their drm private data into all_drm_priv array.
>
> Then the all_drm_private array in each drm private data needs to be
> assigned in their display path order.
>
> Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi =
mmsys support")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Tested-by: Fei Shao <fshao@chromium.org>

