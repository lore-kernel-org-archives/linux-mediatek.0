Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2C9C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:07:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C73207CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:07:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ii8qp+/q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jBBi7vxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47C73207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YMvwYudVR95ZN/05lnJ1K5jG/jrISs8+u4UZSHz5KIQ=; b=ii8qp+/qr8QKMBQJIN4jDl2Fb
	R3TepYDhVdkn1hGD3FyuaXkpUlINK8SSBpOWvxsB8qsMOLtTVMKOEVeGbG6sKdz6h/lDKqTDv3MyX
	oqO7BUMKvWh4J/EL0+namxTV8DtS8kueEmMkFclT6IyJYKJixTHjcwSLOpwIbaOIOz0jhlHQMS7WU
	rrDhAO2ZUGPu4d8FaAXKuagJxPO6OT4afvkKqKyeywbz6SWqDzU16ps5YYiyPeQqqNwkjMMa3Yxtf
	jKIpMhqV4jhI6htXnx5HXVHPhDQIwt2kmSp0RW0X9nv2YtIhEIfLVwEHXK2Xp4y55mkaPu2MtIwBt
	xjP9KRXDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqrR4-0003vY-KI; Thu, 02 Jul 2020 05:06:58 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqrR1-0003tu-He
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 05:06:56 +0000
Received: by mail-io1-xd44.google.com with SMTP id i4so27493171iov.11
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 22:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZHlP2C5MB7l2fajuE903TxpGs1g7Wi3a1RfzRhYtEuI=;
 b=jBBi7vxBC7RWTmctSA+IZrsShvsX9YysgBXFu9liiBn5bj5H4DblMpwMy2YadSfPFl
 27ip1UPrOFS9Dpdns45mVs/5kPh3b8IlLIUfnssW3G5Ks6JWsc5wtSHd/isr9dL5FFq8
 oFsHpI6HSDLCllKy8uXK6HXTV4OgWkwftxEgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZHlP2C5MB7l2fajuE903TxpGs1g7Wi3a1RfzRhYtEuI=;
 b=TqsEDsrME5uh754AIXn1yIZFTyltlTvV6AAUzkqVK/Kqyc3IoAM5uw8+dRhEuKWZqs
 u59kRYI1egsHr37VXs+bhwQto8/PKoW+JaG17s1nbHujKg9ZJxxxINSWoTzj8D1KatKf
 HDgyvvMTdBC05N41hlJtKJEPRqGTqhyhePZG/H+4pXwoVN4nF+pKWbNXquCnPPna8r4P
 Ez+uQMbW3VdY5/WIxB84mI84ztbhWftRm6CbPopfb5QQOVW2GGhwA33+kUZf3JB1scGX
 HiCubr/9+PTqnpINB697suZmUI/cVFXM8wirQetBq7SQEFixgu5CAtWhrrsrUbuhY6zi
 jmoQ==
X-Gm-Message-State: AOAM532QlJh5VCK7hkSefe9xi+JwVTaFelwb4Frps56kCNRqf35B/O3V
 zBT7+IkbP20EEJhNVcm+WI8qTC42cz9raEdMBZLPUg==
X-Google-Smtp-Source: ABdhPJzThdIk4eeEV5zJzUTuMvga/K6xZM+uqxGNHJG9uByFPu83fN1aHPWab8+wAEhw33YzK0OQTyMPmNMCIqMkpqc=
X-Received: by 2002:a5d:8f01:: with SMTP id f1mr5811436iof.20.1593666413937;
 Wed, 01 Jul 2020 22:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101757.101775-1-enric.balletbo@collabora.com>
 <20200625101757.101775-5-enric.balletbo@collabora.com>
In-Reply-To: <20200625101757.101775-5-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 Jul 2020 13:06:28 +0800
Message-ID: <CAJMQK-gs7+PxJmYYayLD+uo6wter7D=BU+-Zi4sEDiokohHQqg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] arm64: dts: mt8183: Fix unit name warnings
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_010655_608939_4BDE1B05 
X-CRM114-Status: GOOD (  14.33  )
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
> Remove the unit address from the DT nodes that doesn't have a reg
> property. This fixes the following unit name warnings:
>
>   Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@0: node has a unit name, but no reg or ranges property
>   Warning (unit_address_vs_reg): /cpus/idle-states/cluster-sleep@1: node has a unit name, but no reg or ranges property
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
> Changes in v2:
> - Replace cluster-sleepX for cluster-sleep-x (Matthias Brugger)
>
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 00137ec61164d..6c00ffa275202 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -168,7 +168,7 @@ CPU_SLEEP: cpu-sleep {
>                                 min-residency-us = <800>;
>                         };
>
> -                       CLUSTER_SLEEP0: cluster-sleep@0 {
> +                       CLUSTER_SLEEP0: cluster-sleep-0 {
>                                 compatible = "arm,idle-state";
>                                 local-timer-stop;
>                                 arm,psci-suspend-param = <0x01010001>;
> @@ -176,7 +176,7 @@ CLUSTER_SLEEP0: cluster-sleep@0 {
>                                 exit-latency-us = <400>;
>                                 min-residency-us = <1000>;
>                         };
> -                       CLUSTER_SLEEP1: cluster-sleep@1 {
> +                       CLUSTER_SLEEP1: cluster-sleep-1 {
>                                 compatible = "arm,idle-state";
>                                 local-timer-stop;
>                                 arm,psci-suspend-param = <0x01010001>;
> --
> 2.27.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
