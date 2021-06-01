Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EB1C47080
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 03:54:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DDE60E08
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 03:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87DDE60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h4s2EukS5UyJzQtvUdNaPZeeftYpBXe1Tk+xMBNl1fM=; b=okQqk6GGIfVpQW
	jQecXRlTNMeiaS8/Vnw6X1tUqhjBUAZRnRuJyVRRrjrLmZCJiU2fpmo64u+ct91xKQyAis9pLUnWs
	Uu+JeuP5Hpas1ChlNLTNzMM2lp5dSn5tgJMf3EmBI0isP4nPfFY3x2X/MprborzDIZCjZhuIlfuoc
	bATkdTzkUTiavRs6DcJur4+KV2r/nYCdGHLx3GBiDKbv1OFn8QMptHB/EfHL2qW9SH1mYiWh1Dzq3
	gIbwC6uphjNrL9khBStc6JE7pM2ev7YQaUAhCDARsxUoeaKTcJ+SzBOywRwXgCOjlXgWfOnsYckOt
	nvviW9w4WdUwSAFHdRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnvTj-00ERzP-4O; Tue, 01 Jun 2021 03:54:07 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnvTg-00ERyq-39
 for linux-mediatek@lists.infradead.org; Tue, 01 Jun 2021 03:54:05 +0000
Received: by mail-lj1-x231.google.com with SMTP id e2so17357987ljk.4
 for <linux-mediatek@lists.infradead.org>; Mon, 31 May 2021 20:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2R7KcQTWK76MBD5e+3ASeCsQ2a/MyPuSvQ02swCwiLI=;
 b=lgAn6J222My+JXRfCSrHMFMYYKcQX6jWmUYmHaxzNLdcbKTOwVjaUPSNMh6fHQ892C
 1jWf83FA/Zw0Q37nKhftZIAxSrcXo/5ooZcjrQRVVzt8O6J0EXbWL4EVCg3ZrzRd4MyG
 +/aZCQ6KcWAcvpnDMRcSLlpZnY+wYfyuSdtkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2R7KcQTWK76MBD5e+3ASeCsQ2a/MyPuSvQ02swCwiLI=;
 b=nmZjIHkcorqdK681iYE9ExIJJC+YBMLk5grZEaJfALhxkH2z9KIbzQNA+zPQLwfDIM
 fh8hpUj4z84BWswKgTh+xLD5cNZdypXoaS30oF3zEANriut0hY2gSuHlyVGKsR269G+8
 +dyPQSDIDNTd/nODxuXI608M3GW1HrfYZDUu+N3Nh6euNUVhugE17YT7+Klp7TedJmHF
 Y0jSlX8Y5NoKnwwyg6SpqLphdg7suXpVBoZMuJ9J8lOET6aD2f6BkonXJtJQP5nofxKR
 WJ4SBmDejZ1Ghbi4AvJvasRlFAqVqtG7UYWI6vVlSzZZpPt/HFP4uErGpCQ4Fb2PvHJv
 tE0A==
X-Gm-Message-State: AOAM532itLveCFOp3NJwdMf5JWd1LHGraLaLiNV99kwT+hBT6VKxng9F
 A9O8F9JGEYqJ3gRuNp+4bVGC4Ph3w6yHkX4KCsEUbQ==
X-Google-Smtp-Source: ABdhPJyc5vZKRpWrASEV5Wynl7RGJwkd241oFVhSRgDJIJDqhECLAw5xVtnD/L4UwTCO000b6QHVXgYAQdDpx9bN2CA=
X-Received: by 2002:a2e:9e90:: with SMTP id f16mr19160824ljk.437.1622519641386; 
 Mon, 31 May 2021 20:54:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210601024408.24485-1-jianjun.wang@mediatek.com>
 <20210601024408.24485-2-jianjun.wang@mediatek.com>
In-Reply-To: <20210601024408.24485-2-jianjun.wang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 1 Jun 2021 11:53:50 +0800
Message-ID: <CAGXv+5G-8+ppafiUnqWm2UeiL+edHJ2zYZvU-S7mz_NdrM3YsA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: PCI: mediatek-gen3: Add support for
 MT8195
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Randy Wu <Randy.Wu@mediatek.com>, youlin.pei@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_205404_175259_864EF3BC 
X-CRM114-Status: GOOD (  18.79  )
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

Hi,

On Tue, Jun 1, 2021 at 10:50 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>
> MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.

Based on what I'm seeing internally, there seems to be some inconsistency
across the MediaTek platform on whether new compatible strings should be
introduced for "fully compatible" IP blocks.

If this hardware block in MT8195 is "the same" as the one in MT8192, do we
really need the new compatible string? Are there any concerns?


Thanks
ChenYu


> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index e7b1f9892da4..d5e4a3e63d97 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -48,7 +48,9 @@ allOf:
>
>  properties:
>    compatible:
> -    const: mediatek,mt8192-pcie
> +    oneOf:
> +      - const: mediatek,mt8192-pcie
> +      - const: mediatek,mt8195-pcie
>
>    reg:
>      maxItems: 1
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
