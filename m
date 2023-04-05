Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86921C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iOSArHk024MTuP20+LfK+TSvK8bw9LtXROoLVLejjk=; b=vo5HhOhwWCzLEfxzx09t7gBQi9
	pKIvLb+bJ5tgBbnKtPZ1rOonpEooGo7L0IlrEh09l/kTD7I9hOwGvb0PV+KdF7WlMggMpN8qmAr7A
	G5mYhT/96q59ONnZb4NUJbsOLSuLwIMGMJ7eymN/8k9/zdsFUtR+lk1FHiFqhjNKRkwiCemxfeQrJ
	4o8mYmrbTG8xqUcSidAShqeKyskvn+pYTAqeEQrCVcJ2EOGIX4ZbYSj5YGlKL59mnS0K7qEzJuNKe
	/zxDQJMfij028hQixxfhH5DE9iDI72ywtnS9Yt9TMNtnAFZEV33xMiC1YQSc/gHIhlAQBPe0izqNM
	Wc8LA5uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzq7-0041Ki-0m;
	Wed, 05 Apr 2023 09:54:03 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzq3-0041Hu-2X
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 09:54:01 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-545e907790fso550838587b3.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 02:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680688436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iOSArHk024MTuP20+LfK+TSvK8bw9LtXROoLVLejjk=;
        b=7Uhb3WdWDVsf6TYFe+umMn4wDTRYNHiTsp6yIjkcoLw1p1l29pM7WBJ+zVMXhUxiVO
         SQO/CIrJBNske5zK5KEWcDWbfCQyjxXDOYX11DjJMvBID3Ab9xoi8VxMKHrwUm/NFJUr
         Cw3fTVW7kcZOTsSzLVL7195o404s3Epv9UQC8tngCiX57FYxqsHOGZiSdWsT/n7dU2Fh
         XGTW1qow/H7Qj0A3OOtckT3HkZ5e5zB83WaZsle70oQvMQDlJLMrSQqfxN8ObRrkg4Dp
         wQXrSYee3501or48hdVKDtLOKW46fCozI31k7KRkKUnWbgvKRZmhOLctJhJ+yfXP8yw4
         RR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680688436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iOSArHk024MTuP20+LfK+TSvK8bw9LtXROoLVLejjk=;
        b=GP0/OdO0vc950ehaiBjz75/P1gdTun1s8U9Ai5nKKf4DJKNvGDL/GB9nDxKwj6UVuL
         A9dGDMEHE37LueOHY41SQXzlpYi1jayLbZL76LyeOUP62iDw/spT8WDpqdiRrE7A2f2n
         iQ2/8bQmeugSgwy3bL8cKvSPu2GLLziq+ZwfQz5xK/OAeoAn0ErHNhFwF+R071YwW+pv
         Yu2Up+KUE09Rvx7gDhgAFIzqFf4yf+5oGyo+VcT6Q3b5jq/nG3GVEz7RTVo21kYFiTB+
         45gc07jkh+Xh1aZf6rlc7etYY9vxMXhmy33di1fKp+SS7olu+qSL0l7wuYAIzdqL+H4o
         nFlA==
X-Gm-Message-State: AAQBX9d2mXstSCzT/7Av2mqZJmiDwMgYrQrkO8QbP2NrEQQRmrUDDuVk
	FMoYnJkNecbASlt7AwWAvcZjlhLgV3XfyISFW1ozCg==
X-Google-Smtp-Source: AKy350ajegbH1cuY0qZ0BH0n+8kNh3daZf3iUgBZUAQloEazK8c1dLkyVfoFXBAExarPcPJs42OwNyuAKjoJ5gK5rTA=
X-Received: by 2002:a81:ad0b:0:b0:545:3f42:2d97 with SMTP id
 l11-20020a81ad0b000000b005453f422d97mr3195246ywh.3.1680688436322; Wed, 05 Apr
 2023 02:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com> <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
In-Reply-To: <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 5 Apr 2023 11:53:45 +0200
Message-ID: <CAFGrd9pBdaHLGUZHkaz2_XKafyX=dxu9UckQxrphg52EG=A1SQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_025359_825058_92619148 
X-CRM114-Status: GOOD (  10.75  )
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

Ok, I will move the driver patch before the DTS patches in the next version=
.

Regards,
Alexandre


Le mer. 5 avr. 2023 =C3=A0 11:43, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> a =C3=A9crit :
>
> On 05/04/2023 10:06, Alexandre Mergnat wrote:
> > Add MT8365 SMI common support.
> >
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
>
> Why the driver patch is after DTS? Driver code cannot be mixed with the
> DTS on branches/repos, so such ordering suggest your patchset is not
> bisectable.
>
> Best regards,
> Krzysztof
>

