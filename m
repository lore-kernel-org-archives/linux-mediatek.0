Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49437C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:06:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16544207E8
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:06:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uuoH1Mxd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YiIFU9Ez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16544207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pgbrtSvYDCzBeaevHvIsp3g7ZBjWk4b8X4hRV+qw6l0=; b=uuoH1MxdVB5nTu1EGpVwnBuE1
	b6anPgj2ZNOYE+WLTiH3VyJVyvBEriRLFEKSh2MslcwfvH43qCS19I5l65Updz/J/TCwmd2CQaM88
	YwurltcHPS99YxC0gOjk+SkRDXRz45mXK6aAbGvr2n6b4EYGqDmFQJFqgCM4p+CC6oPSIEVzBYZaB
	NDesKmdir6HvtfpuWBmMiOnF/xc4/H3kCfN4TvnAjYTG4i/EMxf2W1dWtEBcDn36lhvzlIIcBBZbY
	iXYEzLXvMSla28gPhfsi1MGTLmA9oM6LvD7aBgw2rWXr9YIa2h9DKDrjZM7NSc1hch358KCxoPIvc
	AWov1SpDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqrQg-0003ps-9L; Thu, 02 Jul 2020 05:06:34 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqrQd-0003p5-EB
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 05:06:32 +0000
Received: by mail-io1-xd41.google.com with SMTP id v6so13853409iob.4
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 22:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DZ47ETVXzGHp5M4VIrOqjcpx5J2EPuzka+sNTw7UoLE=;
 b=YiIFU9EzsHxMnSPRgJV+5hXTLBAIc4uJVIDYOxP1TgNAasD7ugmfudln9uslpxSqCo
 bI8Be59+9bB0NM83obWqjiLQ/dztYsTfJyOFRHR/WaoV9SaJJQLAXLMvfyFi1iSbGqjf
 tdiBbpWUqegEUpnwwR4dfHXAoBWk/tnXgKw6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DZ47ETVXzGHp5M4VIrOqjcpx5J2EPuzka+sNTw7UoLE=;
 b=KRsQ/HzZcVKaUR8vO33HiCQ2Huqiy9FU6lZoSwwsGGkL5S2GoDnEcY797dKdbuKhtS
 6140VuOlD+PAaSzPAM5XFPt0vRIvvji363TiBa0ZdYlUvJPUG2gOLvcorevCSOeRR5pW
 51/wbEMFcL8ogYfqYoGLvrHyG2WDRrVOuRSXPYapZTIlF70C4Goy1JP3pqos7Vb7Xfa9
 hZZiHFkO0LXum2ak5fwhFgH78skf3vMSlrtiVqx8Bi+XA+O4EsSnMMkeEL7/TxEQhQeA
 +P4WRNJEc0Bw4Mt9p0TaEKKO8W9mQipXuiKFd7h2UMveEqMydSVII8fA9ExDwMp5lPKG
 53/A==
X-Gm-Message-State: AOAM533nOk8M5AXFAfp0awTM25WxlhuCWZMetNQw3cZVRpTJjTbgr3PY
 eSIw3Kle/Wf6keByCdGZegdmTL1R5MldnD+7/eqP9A==
X-Google-Smtp-Source: ABdhPJzXw2DJHMGPSNP3awNApXu2clvWat6Vu+oQBLrbrBdFY9gePO9d3eY2YBFghqwYnLGIJTWjaNOpeeVxcJb0HU4=
X-Received: by 2002:a05:6602:148d:: with SMTP id
 a13mr5868932iow.44.1593666389992; 
 Wed, 01 Jul 2020 22:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101757.101775-1-enric.balletbo@collabora.com>
 <20200625101757.101775-4-enric.balletbo@collabora.com>
In-Reply-To: <20200625101757.101775-4-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 Jul 2020 13:06:04 +0800
Message-ID: <CAJMQK-iJsoZ-beetO58-d2tit0Oq22SGnBKuPY0jSfbtJVFLeQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: mt8183: Add MediaTek's peripheral
 configuration controller
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_010631_505657_F72B622D 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: erwanaliasr1@gmail.com, Nicolas Boichat <drinkcat@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 25, 2020 at 6:18 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> The MediaTek's peripheral configuration controller is present on the
> MT8183 SoC. Add the node for that controller.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
> Changes in v2: None
>
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 1e03c849dc5d6..00137ec61164d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -285,6 +285,12 @@ infracfg: syscon@10001000 {
>                         #reset-cells = <1>;
>                 };
>
> +               pericfg: syscon@10003000 {
> +                       compatible = "mediatek,mt8183-pericfg", "syscon";
> +                       reg = <0 0x10003000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
>                 pio: pinctrl@10005000 {
>                         compatible = "mediatek,mt8183-pinctrl";
>                         reg = <0 0x10005000 0 0x1000>,
> --
> 2.27.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
