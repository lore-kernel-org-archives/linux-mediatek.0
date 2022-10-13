Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CD1C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 03:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km/x4dNbpSXiQbScfZULHzvpKPxUFqn2RX0kYro9dnY=; b=Y/DgtG1jsPNVBzOoq4AlITYy1o
	UavuEEGLrWF0ES1wnPinTqn4k8wh2BHgtZWnE3DJ7u+DKL2R60Z7hJRwHkZCcWZz76lCsaxn/ZRTj
	pYZ7ZSuQnaVlSLFnWwbabUgtWkLBtnPV2yYhGOChDMtRllE2yCKdg2guyTJmJ0by/NeUozHlmv2qW
	ajsfButfmcUmMsEQ32xLy7O4u6sLHoV/huTTo6yeXrB4iWbpLMT2rVZjrFQDOUfd5FasOeb3CL4gz
	N0ZUAZtCb4RN4ZDjMlhR/xK2KnOZoOveRh0sHGgFI87acNbcZ3kvMtXUPl/xde7XC/A48qGUuIoq1
	Mdu+FAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oip2N-00ATVd-Jz; Thu, 13 Oct 2022 03:37:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oip2K-00ATUa-VO
	for linux-mediatek@lists.infradead.org; Thu, 13 Oct 2022 03:37:34 +0000
Received: by mail-ed1-x529.google.com with SMTP id a67so866199edf.12
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Oct 2022 20:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=km/x4dNbpSXiQbScfZULHzvpKPxUFqn2RX0kYro9dnY=;
        b=G+ijyw+YElgHkz9u0HrJK28v0DxiI72ImZDb0r4hO9PN3coaRP2XfA8ZfAl/8ZZ4AL
         lsFDquibhSUs5NuGplp+wmb/kBY34E9kFVU5p56slsfiU9GVNRw6+OTBtW41bqNqypUY
         1ipXiOtH4yore9LZw99lbA0Zdwcsf7jyfjVvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=km/x4dNbpSXiQbScfZULHzvpKPxUFqn2RX0kYro9dnY=;
        b=WQzGl085QZurhorz9PxRU0anldK2IDqFqo511L4NoIwIzTSBTIot0opwnccLCigEZv
         CCX6myYc4TktC8aM5qiaTrn33YignmWnSCMyArqs/NNjtgp1+OF9GYVJKwO7By6l9tNP
         xQz4Cn1ejKtLQJUrpmYVW/xFdWaLWsVDuqzTz2txysqE/CgNgSk2fYYlCIdwDXilJKJu
         aGUxSs/SDd/RXipZp4G5TxH3WmOm3HYvwGguvEHKCNois0w7icRMlZ40kPFeu16yK+Uc
         uanbxe6Ekx3P/nz6WcMPxjgjsSqISXUrk5pPFrv4Ff/nvTQoNn46cZk8mnucSYIQawbG
         qaQg==
X-Gm-Message-State: ACrzQf0tBj19rp5KAeJisRwCNzPCHfnLtmiP9duwcKSqLbCJk32CL1xL
	iqeSlZIO7CLomd6Uk5elmu/gjdR0jGzUVnaZnb16UBNodVIhNw==
X-Google-Smtp-Source: AMsMyM5/cBj9U6Vdv/D7aVLYS1aJOy0vaa6E+V2MaYc8d7mEX7XjtYVDUAeN82NYnkMRxUFJGC4tqxwz5hhVNs84ZDM=
X-Received: by 2002:a05:6402:22ef:b0:458:bfe5:31a3 with SMTP id
 dn15-20020a05640222ef00b00458bfe531a3mr29802577edb.6.1665632247137; Wed, 12
 Oct 2022 20:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220729053254.220585-1-treapking@chromium.org> <9d1d8831-844f-f30f-6c8a-fac052f8699b@collabora.com>
In-Reply-To: <9d1d8831-844f-f30f-6c8a-fac052f8699b@collabora.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 13 Oct 2022 11:37:15 +0800
Message-ID: <CAEXTbpdE6JumX0ecP+LtDXnfR5E0VeaxU5N5_nVxVVNGRHATjQ@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: mt8173-elm: Switch to SMC watchdog
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Evan Benn <evanbenn@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Eizan Miyamoto <eizan@chromium.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_203733_038111_B6AB6824 
X-CRM114-Status: UNSURE (   7.81  )
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

Friendly ping on this patch.

On Fri, Jul 29, 2022 at 4:36 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/07/22 07:32, Pin-yen Lin ha scritto:
> > Switch to SMC watchdog because we need direct control of HW watchdog
> > registers from kernel. The corresponding firmware was uploaded in
> > https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

