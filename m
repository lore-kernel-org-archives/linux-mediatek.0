Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBB4C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:28:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E64B60F22
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E64B60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=piSvFuTCk0O2R1EGFQ3i43LQmvHvslg3n5sW8uBl2R0=; b=DXN7Nt50fpT7jKfq8j0d5fjPs9
	Zhs0zbCY677dXJPW63+0+I3Sb5FDtKQd6clJm3z8eDuX+j3kPTnVhtHALYYG0cjHAdEv9q4jTk4/s
	lM3Ha5oomekhaUboMazazULLoeKeGwarhACRiRrO1gO4FmOEYc1PRkYKU8gaMklOKC8t9yzDGYbFF
	GVu4spOLtGnRNql17n1AK/ERXAqLolhllUvLY+7uXBOCUTMdjGqJokxYT120JA+hsJAdzFfYJhSud
	Wy6klqFbl704am3y+VA0VLq/9+z+CIT4geb9c6zUuAI3YcBbn+3KrtClBoKWNp5dCeNAP6B4QNcn2
	ij6DUCFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xqA-00Ak2p-OM; Mon, 26 Jul 2021 10:28:06 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xpx-00Ak0H-PM
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 10:27:55 +0000
Received: by mail-io1-xd35.google.com with SMTP id u15so11016445iol.13
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VeuFNMGt7cc+sZnYCAlbQ9kgqLoyYbbqOv5SFUOzDKo=;
 b=G21T1rtYhky71jyUfOulUpdgSuti6vwyrimYkS6dw1KD08oPgwiQts13EPEVF2+cC6
 eaJIUg1zzDe2KJ1HoO8WUrvZ93ylRuoqAZ/G2PEXJhbIv5KaTj8u7PpmkMi7eeuTS2cp
 8L9hIzcKOS8hxm1+SCwNcPtWzY0dg9Z3dYPPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VeuFNMGt7cc+sZnYCAlbQ9kgqLoyYbbqOv5SFUOzDKo=;
 b=VKhNEtyQNEMDv8H+cDDUH+LIxJjglpHwSx/TPcOTHuqrkqjiDvOM0iDYgsxrdQIsEP
 UPsARpWQ2fCM/meBlFNU15TkuN21L03/oXo4coskc8WLAaBYga/EmKLhWkFCsgAop+dK
 qTL3du3W5nCDwmW3oabVlXFCBzVrj9q2j2/zgcVFEQWLyQkBh2SUkqGfBuCPcH8ds4LG
 mPS7TRpWhNZVHW8Il3NT5JlX0/ECFrSavZDKLv3ksEhNa+QNTyby2DbnPZQBIr9hW+d2
 DsPuiFWWuxRb6VUJqRZ9wJheiFnEOOy4oQq8gksg7j+UeRPVi63741dvw4A1F6v5CWWF
 43+A==
X-Gm-Message-State: AOAM532jxPHyEFYcugtdQIPVdBFsUHAwsRsyiCprsTtljCQkINXgRiWS
 clpIIeU/tDe1TmUdFmTyKgp6KpFsAy0zs6QTQMbtIw==
X-Google-Smtp-Source: ABdhPJw0FFNi2dYJU/QGrd2nQkNz4DDpGuCZzOaQzymzxGB/MC3mqsj+3ZXduw3IG4+Mj9fckr7GEr/dpzA7gMfHPHk=
X-Received: by 2002:a05:6602:2d10:: with SMTP id
 c16mr14344754iow.40.1627295272543; 
 Mon, 26 Jul 2021 03:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210622030741.2120393-1-hsinyi@chromium.org>
In-Reply-To: <20210622030741.2120393-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 26 Jul 2021 18:27:26 +0800
Message-ID: <CAJMQK-hiDDH1ypoDcQYEQZ0Vq3X-mTfZbF7qfRbGtD2zBH=oxw@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 1/2] arm64: dts: mt8183: add mediatek, gce-events
 in mutex
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Jassi Brar <jaswinder.singh@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_032753_850938_035D85E5 
X-CRM114-Status: GOOD (  14.94  )
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

On Tue, Jun 22, 2021 at 11:07 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> mediatek,gce-events is read by mutex node.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Gentle ping on this series. thanks

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b6b77a3..cf22d71161e58 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1250,6 +1250,8 @@ mutex: mutex@14016000 {
>                         reg = <0 0x14016000 0 0x1000>;
>                         interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
> +                       mediatek,gce-events = <CMDQ_EVENT_MUTEX_STREAM_DONE0>,
> +                                             <CMDQ_EVENT_MUTEX_STREAM_DONE1>;
>                 };
>
>                 larb0: larb@14017000 {
> --
> 2.32.0.288.g62a8d224e6-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
