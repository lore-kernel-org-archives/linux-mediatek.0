Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B002C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42euZkX+yMf1C2mikEGS5vQfJkCO45VzoJtEXc76qU8=; b=w176dPi9CQCdX0V5ght6qA1cPn
	hLcTdFXdrpLuEFSDT4Zera8zfcjuEO8Z+iyApCL2kUDCaky6esu1IzZFA+RM0bHyExDyqDWOx73jP
	l+W43mT5LL33v7ftzCHCXO5bTxyay02vOQhoOsI3MdGeFLufMMgi1ZZuQDuINAwHxGRxn/2AgI32h
	tDYqAhOKreWRpAajrENqZz9ylvGl0vpbK4iapSYX3k8Ey0CghDMqUPK3OTBJYyuIk7d8Fu3dvC/wH
	+vxk7AefFB+KyGtw4nvh4EK9Lh6WMzCFs/0BuqZgETzMusKzr3aEcmrukqeuIyQsjGCUGRo66KFlK
	VPyuwc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUsE-001oxH-QB; Fri, 24 Feb 2023 10:00:18 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUrO-001oTj-8k
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:59:27 +0000
Received: by mail-vs1-xe36.google.com with SMTP id f31so20697724vsv.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=42euZkX+yMf1C2mikEGS5vQfJkCO45VzoJtEXc76qU8=;
        b=YDk/l6/cWNaLzmBC/rEm3rckPKaSfFVjK7ZEHaNF2aEFIGCflq9QvHAtARyHxjGiWj
         rLnE59Ec27M/E4ORE595hXMWP9gfnzyd6Xmp65sXYC9cnI+ElgNlMvZ2H7/cmjUauXLi
         etbLVWfm9ilu3S90SjGhXHS1lob0jk0ts2GM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42euZkX+yMf1C2mikEGS5vQfJkCO45VzoJtEXc76qU8=;
        b=oJWMf6sh2hUGJMrHR5I9mor2m2yws9Ba2R9l4Z9f/awKgEo8jAHIpwj+Zni+GosQRt
         33Ihs5Y+LEHBOq9rH89Y2Mbu1lrvwniOKdiroN5hdaPdurTVfuJkZHL5tels/EEKI5Y5
         oZmGLkBOpizvi/XaT+OZUxSnqUqu9hG/8DqQEo9yP9fy2P6RU8VeRKjyJGvy+7p91NnK
         j1AGYQHysBbaOxvLmC1sqlGN+6MkLedZbPM31iYfCoKyTTQC16Ul81AaEaCZ5R8i132H
         RYgxpQEi5w98P3vWlkKsmxxQC4zThTOX7T00RZjEsfZNCULuA6P7FIZGVl2NozsrpARz
         L2/w==
X-Gm-Message-State: AO0yUKVymwy2bp0qB4kv2lsZr5wTkfPnIfH55KpefaIdfCdEsea8yx+m
	HXssL8vmlFX8693Y4ifa0KQz8bGrh6sA3cnHwJvPeg==
X-Google-Smtp-Source: AK7set+FkBHS6/fPZFDwWjpron9ihs3X9c+RNxDyeF65c4FGJjvyTyfgFBTFlNHPzZ+exincltoTJKQUAr3TSuy6W60=
X-Received: by 2002:a67:c584:0:b0:41f:641c:f775 with SMTP id
 h4-20020a67c584000000b0041f641cf775mr318400vsk.3.1677232765147; Fri, 24 Feb
 2023 01:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-13-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:59:14 +0800
Message-ID: <CAGXv+5FTHJkAOtr1M3NK14UaFm-aKtnSomn+jVbWZP_h-Fz=cg@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] arm64: dts: mediatek: mt8192-asurada: Enable GPU
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015926_336627_30471F52 
X-CRM114-Status: UNSURE (   6.88  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>
> Enable the GPU with its power supplies described.
>
> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> [wenst@: patch split out from MT8192 GPU node patch]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> [Angelo: Minor commit title fix]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

