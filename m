Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB92EC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 03:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E2260F9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 03:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70E2260F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5wvkD3N0EEzVSt8u/7g8zxCJd69MJmbteUFIsGiLUY=; b=h5bxEySH4hLQ53
	mHt6/HQAH5E7grCVL4jGqW5ttFyQvTmWwxyY8C6gEQNDtm0q4KaRloPOIViACbNOQ3+Y+nfDfGtQ0
	4GKmQIg1O1F5joIGlCoYGEtqf4pUx4ush+EDrg/XZ6KmMeYbVFA+v9XZksbQkYHDULCsKX+rvkcpa
	3V4x7mLC/EAIODLpv2ob3td58oKV1I/PoW79+bE5y8NOlBbcuYnxfjWHEHvsnJtigZBsvpBiarM+q
	jDEdjHf4A/WDtcRaXM73nRE7xVOMwU3iGyCS5/hQbX4/bJQSfBa4vdaOvyLZbq+kkZhDhzP5K1zJN
	CplkrMJYXF5ANaTCjxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8abm-00GxF9-Hg; Wed, 28 Jul 2021 03:51:50 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8abj-00GxEC-S8
 for linux-mediatek@lists.infradead.org; Wed, 28 Jul 2021 03:51:49 +0000
Received: by mail-lj1-x231.google.com with SMTP id h9so1387910ljq.8
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 20:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dPiFfQJ2xtTLnyk6Fk4XG5GeGV4EVc1tB7y8d6OKc1k=;
 b=CMH3lDIxw0ApJq8MbTN7wpeHcbI0wKpG+rv+G9q7EMMsNfIYa7vfGBD/zFBcglKwY7
 0aikxbaN2vYUDBqiDcGTqfslu/fjCteLT40QMxNONyKvmnjjtnYJ+iXiMQobLSn0Oqgp
 qfveUsNA9LLalicPs0E33qz1lBrucqDUCI/OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dPiFfQJ2xtTLnyk6Fk4XG5GeGV4EVc1tB7y8d6OKc1k=;
 b=cczu+z8vEAjAwzPGkTuHz6ctZ8CD/Ll79krGko9IWznRUENDX5U+fgqc1RCe+uE5SJ
 I0Xbsn6efYWwGrnZCc1oY0JuYeMM9mzxhati1RJ9Su6TIUTr0VQZqTOoOAAfnGWoVI+j
 Zmvkh0Ns+MOGiAIq1pp624F+i5mdjRRvmp3Vr2b0R3wHooua3RGYSgIyerkMEOxaExPF
 8XJJiRBgRgkpNsDZyE7uIWtxGwuueRKOohRXBJCZ1AKWOVl81cJ+Rj0hI9m2AkXY3Mzi
 1jcwqpeHMLoY53Hxn3R4m/tLPZZ+qL+IE/eE2fYHRohMlQ3146PsZV0djmod6eJuyg8h
 BWCw==
X-Gm-Message-State: AOAM5318whhCcUQQkUaidVFm3a8qbTxrlNr+N62rFj7OftTIMDoT9y9E
 D4CAu+T8U7/seXHUkjVA+2up7g2u7KBRYAf0hm5H4Q==
X-Google-Smtp-Source: ABdhPJzLWnYQVyj6OrEVmREn7Y+WP6t6ZFo2i0yfvhdDJ2Xe5swRDPGFoXEtohPBSMwNRt/CiJ6vviRwAgzc+JKy/As=
X-Received: by 2002:a2e:9215:: with SMTP id k21mr18526007ljg.91.1627444305147; 
 Tue, 27 Jul 2021 20:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210727112208.2508675-1-hsinyi@chromium.org>
 <20210727112208.2508675-2-hsinyi@chromium.org>
In-Reply-To: <20210727112208.2508675-2-hsinyi@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Jul 2021 11:51:34 +0800
Message-ID: <CAGXv+5Hua63GZ839kQEscAXBeKPYTv_63E2pYNBw4jXz1B_PWA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mt8173: elm: Use aliases to mmc nodes
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Eizan Miyamoto <eizan@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_205147_968011_6A509C8A 
X-CRM114-Status: GOOD (  19.60  )
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

The subject for this patch wasn't tagged with v3. This might cause some
issues with scripted tooling.

On Tue, Jul 27, 2021 at 7:22 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree alias")
> allows the use of aliases to number SD/MMC slots. This patch use aliases
> to mmc nodes so the partition name for eMMC and SD card will be consistent
> across boots.

Device trees are supposed to be a description of the hardware and
therefore should be implementation agnostic. The commit logs should be
the same, unless the implementation details influenced the changes made.

The MMC binding change already specified that aliases provide a way to
assign fixed mmcN indices, so the log should reference the binding
change commit instead.

ChenYu

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> v2->v3: add more commit message.
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index 21452c51a20a8..d5a2cad39c9c7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -10,6 +10,12 @@
>  #include "mt8173.dtsi"
>
>  / {
> +       aliases {
> +               mmc0 = &mmc0;
> +               mmc1 = &mmc1;
> +               mmc2 = &mmc3;
> +       };
> +
>         memory@40000000 {
>                 device_type = "memory";
>                 reg = <0 0x40000000 0 0x80000000>;
> --
> 2.32.0.432.gabb21c7263-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
