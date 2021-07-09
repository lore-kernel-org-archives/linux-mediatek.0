Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B1DC07E9B
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1EC61248
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 10:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB1EC61248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FxOzgZltIdPY8txp4G59XA/u/ZdsZzR92GaqhqBsNy4=; b=Q5xDXP0nvuOPU2
	gGb0DCogxIYpbg/hG/ZqrTkBphibb7GMOvfper0MSRcgO3dr1uLAIiJg+Ht+mRxdJV0LS5Xq6MnVy
	jQehy8ye6ZzIrQpV17ebgYG7ls2sYpEuw/arS+0zbN0hj1E4lyuH+TuPjtr7Mt+l45U0H23iNMKlK
	fU5L/oDYKiwo3tp2PGlNFE18DXLat+RcA0HwmHBZGehshZ2ksiS0X7fX/Bf7qCAycRd1r+2r0SCJm
	Avp1eLiI2QIUZDbuHzUQJoXMg3yJ9V9iUTbNAPHZWDZhbx27axaKPmoIUvcf/4qofivpzaJue2q/q
	bgTWiQ22xEei18wor3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1nib-001VNg-LO; Fri, 09 Jul 2021 10:26:49 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1niX-001VKg-UG
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 10:26:47 +0000
Received: by mail-ed1-x532.google.com with SMTP id w14so1423364edc.8
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 03:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EE3G7qk9YjV6WICjXG49f7wI9xsGOugrChSPRCk7KBY=;
 b=j6ueWrIhKJIqX+ueklioki6dIG0OTnmNayymWlaVcRO1HjVRRLInq8113rpC0VzsJE
 LJlOHhgMqrPL7AbRHbdrjOpH5SkezCozW4eeIWh4PO1FXTa5NEVaruBmAWnQGauz7eGj
 FQ2l2WvAoKeryPAxZP6iCnPC+YpHdEbovQavQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EE3G7qk9YjV6WICjXG49f7wI9xsGOugrChSPRCk7KBY=;
 b=Vy4oZaeGiWCRDh1jNB4hIuixmy3P97Lkzev+mvMCyQDTSn6lS0wQdYxD+FtmFBlgD0
 ufQXvbXKyY6Yft6nwhtSZWtY+zz054U7X3fAquCDjoSbkNhGJmBHkEFLOZVD7rvTMv7j
 Muph7CYa4YD4OgF/jluGBqZh4nPo6PFsqRGgA5q0b+RXBjmcS3/WfpJ4XmumtPwpD6up
 ShO0gHHqqjtog/QwY2grfbYMWqFIBrmz3Ni1M5AM+Xa6RT4u2OzuuTQKulSupFmPNvo3
 pig+GTOm7X5qDJUoJKehh1C7Axw6AVyDuDC9QgJfK26yaRdq+/6qIg+Kwb2jmmWZzQgp
 B5Qw==
X-Gm-Message-State: AOAM5328OYPcHpe0DxJwzlzqwkFdclTzzHLRcxoSLOMUBABEeFjsIk9D
 HKULH8haljC0aVlXBJuywxtTTm596N4AY0Au
X-Google-Smtp-Source: ABdhPJzfxZfSL0nulcH7jkLa5lodXfBGP+W/Ebt5T3lTnipwD9mvAtwv9IihIiUVgZ2Mpc+WuDkadQ==
X-Received: by 2002:a05:6402:7cc:: with SMTP id
 u12mr24176004edy.156.1625826404070; 
 Fri, 09 Jul 2021 03:26:44 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id f12sm2199934ejz.99.2021.07.09.03.26.43
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 03:26:43 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id i8so11435788wrp.12
 for <linux-mediatek@lists.infradead.org>; Fri, 09 Jul 2021 03:26:43 -0700 (PDT)
X-Received: by 2002:adf:f1c9:: with SMTP id z9mr12812492wro.159.1625826403104; 
 Fri, 09 Jul 2021 03:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 9 Jul 2021 19:26:31 +0900
X-Gmail-Original-Message-ID: <CAAFQd5D+Zwh6JxJqAbyLX9XeyFdnmjUgWTpFA6GvO2qNktOxBQ@mail.gmail.com>
Message-ID: <CAAFQd5D+Zwh6JxJqAbyLX9XeyFdnmjUgWTpFA6GvO2qNktOxBQ@mail.gmail.com>
Subject: Re: [PATCH v2,0/9] Support jpeg encode for MT8195
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Xia.Jiang@mediatek.com, 
 maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_032646_069790_B8CC0567 
X-CRM114-Status: GOOD (  17.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Kyrie,

On Wed, Jun 30, 2021 at 4:31 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
>
> add component framework to using multi-HW for MT8195 jpeg encode.
>
> kyrie.wu (9):
>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: Add MT8195 JPEG venc driver
>   media: mtk-jpegenc: remove redundant code of irq
>   media: mtk-jpegenc: Refactor jpeg clock interface
>   media: mtk-jpegenc: Generalize jpeg encode irq interfaces
>   media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
>   media: mtk-jpegenc: Use component framework to manage each hardware
>     information
>   media: mtk-jpegenc: Generalize jpegenc HW operations interfaces
>   media: mtk-jpegenc: Refactor jpegenc device run interface
>
>  .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 600 +++++++++++++++++----
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  69 ++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 208 +++++++
>  4 files changed, 786 insertions(+), 94 deletions(-)
>
> ---
> This patch dependents on "dt-bindings: mediatek: convert mtk jpeg decoder/encoder to yaml"[1]
>
> Please also accept this patch together with [1].
>
> [1]https://lore.kernel.org/patchwork/patch/1445298/

Thank you for the series. However, I gave reviewing it a try and
unfortunately had a very hard time following it, because of the way
the patches are organized. Please make sure to read and understand the
kernel patch submission guide[1], adjust the series appropriately and
send a new version which I'll review.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
