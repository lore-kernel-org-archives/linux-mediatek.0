Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87BCC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 09:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAEAA601FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 09:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAEAA601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdUBSDm3OUt00pW092GeR9Sc+VTtAU1ZL8QRZPQMXQg=; b=zSbtTQKISGQ45f
	xUh9pFNq4UnsoyYnJ9d3rvUeqldZc0338u9djnULLyH0Q6z8Ye//otJghQ0c071ZKkY+GmGSyTSHZ
	b8MNPvJmpMYnnC0avftZXpGPf8U3MtAbgmndHwlGRsUpPeLzs/WsIAv2lcdKH2Zlha+ksDm5GAC+1
	nVKXCgVrH+CcXrAmkDZaTpgepLiwmrrTwNL4VdaOCTGsc9D9FyD+2U/S2Rxwt50UBwbFCiUUCYNBq
	yVIVgnl4rnn1BLNiAQ3Arlf8m7Z3PHrxlR9jPLDWcs9uxDbx7Gkbo5nR6HvSp+z8FGPbAuHCtWY11
	FxMKiDcqtzNl7tcYqdig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m92oU-003kOy-9f; Thu, 29 Jul 2021 09:58:50 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m92oB-003kG2-CF
 for linux-mediatek@lists.infradead.org; Thu, 29 Jul 2021 09:58:32 +0000
Received: by mail-lj1-x234.google.com with SMTP id b21so6749762ljo.13
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Jul 2021 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5KPMH+AygWZEXcn3xe7p9376dbY996l7aWe2Z4Eu6Fo=;
 b=hIThC7Wnj8zQqP1im1k2UypoMmNZ6oHXlheP9MP6Qi1qLa+9eoxUXi4Llr1q2Uaztq
 P4hAywuOyH1DuSWQJ7LiL/o9mnbWUoT3IzzJO77vYgh8hPY8qCcDZ80QbxqHYQ7gLyuq
 Cs+2bfpL4pbTwdW9hHQEZaXs2JNDsnGZXfaog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5KPMH+AygWZEXcn3xe7p9376dbY996l7aWe2Z4Eu6Fo=;
 b=AVwVRPbhaGKZrDSozWB2JdYGf0rGjLbGO3TvKFi2XcoXBFv1teKU9f5DCd4ize8dqK
 /NenS6yKQ65nqlOsPHg5pVG7HYOxzV5z509fq0hiAGn0QCHhK/TK3FW1LBZkvWGPevxz
 YxMKgui4Wenw79iRhCDZoNVxCv9/YsvcdzzlogSF9EsYitb8zZcxJrMDUfmLGmfjOD99
 ZBXuBnShU5RdHiOAypQYYVePe4WvKxr7FFBDxTd51+6CBJl5W3p9ZqvEWzGRcxoEk8hu
 U9jmiuc/lQzhLS2+HFwu2e09mXD48qOZaMI4XErPBQmlvjxNwhfbVLN+gWkg9RgVUCMd
 p3rg==
X-Gm-Message-State: AOAM531m7PJ/6N3kWAX8SmCmzo9+KuS/ir4mvKaOXCVUW5gAM0bPAH3F
 qic7sBk2UxccLwiKPeiibqAuAAQp2i70Ju3P8xY+Ng==
X-Google-Smtp-Source: ABdhPJwMxLLuvn7mala9hBDJn6qhU6W72vuZFml3Zm2YdFBSpUIQVM85iFq3c1hiUGEN8pVvVdMK/LRL7Cgcsacf3mo=
X-Received: by 2002:a2e:760d:: with SMTP id r13mr2454128ljc.437.1627552709362; 
 Thu, 29 Jul 2021 02:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210728040710.2891955-1-hsinyi@chromium.org>
In-Reply-To: <20210728040710.2891955-1-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Jul 2021 17:58:18 +0800
Message-ID: <CAGXv+5EVcSyfG1Fk6PZOnWUZo85brf_cneW7iob4Z5gnjFca7Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Eizan Miyamoto <eizan@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_025831_475316_3EBFBD4E 
X-CRM114-Status: GOOD (  10.88  )
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

On Wed, Jul 28, 2021 at 12:07 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> With commit 1796164fac7e ("dt-bindings: mmc: document alias support"),
> a way to specify fixed index numbers was provided. This patch use aliases
> to mmc nodes so the partition name for eMMC and SD card will be consistent
> across boots.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> v3->v4: change commit message based on review in v3.

Thanks for following up. My reviewed-by is still valid for both patches.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
