Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B47AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 14:38:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC49610E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 14:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CC49610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0m88dhXjGDVTqhsC7HkgFqrAimvcf7w7Uvp7P4p4qt0=; b=Qw04tLlgpleU4SnWm8fGItQ1by
	Vt5hbC9ViBHjzlI4Z7vbpaKlz3/KDs2yt4xos/TYslxLOUGauZ5GlbTJ9HTwsF/CJZ26YVBi+lrf3
	x3L0V0is1L5UDAtCb1MSSq58ci3612t0KYdbBy70p5pqMpmKcHjH1hxv9ubdS2B8Y5JouhHbjqS8x
	1kejcLC7n/g/PnbDQlE351NtVuSt4DDwDTcMBGN5JYN5Taq/9TXx6vr++fNo6OmpEcOYdEvB4xL4n
	xyd9nU8rjfXVwHFeWrUthhD7NZRtx2figTtqx4jbGZRXgGo9E42YkKE/ZLjxAVLj1wgcSExP83Ybl
	T4uzuYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcqGH-001Ydp-Iw; Tue, 19 Oct 2021 14:38:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcqG4-001Ybc-CL; Tue, 19 Oct 2021 14:38:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CA94A1F43B5F
Subject: Re: [PATCH] arm64: defconfig: enable regulator to fix mt8173
 regression
To: Adrian Ratiu <adrian.ratiu@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 "kernelci.org bot" <bot@kernelci.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>
References: <20211011125301.3440033-1-adrian.ratiu@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <bd29b949-0ec1-704f-73de-c36b5120b445@collabora.com>
Date: Tue, 19 Oct 2021 16:38:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011125301.3440033-1-adrian.ratiu@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_073828_609189_C4A73FD9 
X-CRM114-Status: GOOD (  26.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 11/10/21 14:53, Adrian Ratiu ha scritto:
> A regression was introduced on some mediatek boards starting with
> v5.15-rc1 in commit 109fd20601e2b ("arm64: dts: mediatek: mt8173:
> Add domain supply for mfg_async") which effectively changed the
> regulator from the always-on dummy to DA9211 without explicitely
> enabling it, causing failures like the these caught by KernelCI
> on Hana Chromebooks [1]:
> 
> mtk-power-controller 10006000.syscon:power-controller: supply domain not found, using dummy regulator
> mtu3 11271000.usb: supply vbus not found, using dummy regulator
> xhci-mtk 11270000.usb: supply vbus not found, using dummy regulator
> 
> There might be another bug linking these power domains in the
> mediatek PM driver, but that is a separate issue wich needs
> addressing, for now just fix the obvious regression due to the
> new regulator requirement.
> 
> [1] https://github.com/kernelci/kernelci-project/issues/66
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Cc: Guillaume Tucker <guillaume.tucker@collabora.com>
> Suggested-by: Enric Balletbo Serra <eballetbo@gmail.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 156d96afbbfc..4901cc1213bb 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -616,6 +616,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>   CONFIG_REGULATOR_AXP20X=y
>   CONFIG_REGULATOR_BD718XX=y
>   CONFIG_REGULATOR_BD9571MWV=y
> +CONFIG_REGULATOR_DA9211=y
>   CONFIG_REGULATOR_FAN53555=y
>   CONFIG_REGULATOR_GPIO=y
>   CONFIG_REGULATOR_HI6421V530=y
> 

Hello,

I've been able to get a working Hana boot, with USB probed as early as possible, as
well solving that KernelCI failure (as now also the usb network works fine again).

My proposal here, for which I have a patch that's almost ready, would be to enable
this regulator driver as a module instead (since Hana is the only device that's
using it), avoiding to increase the kernel image size for everyone.


Before pointing out my solution, let's first point out what's going on:

In mt8173.dtsi, we have a power-controller node (mediatek,mt8173-power-controller),
under which all of the SoC's power domain nodes are defined. In this node, we have
both SCPD_DOMAIN_SUPPLY domains and "regular" ones.

The difference between SCPD domains and the others is that the first ones require a
parent regulator, while the latter don't (power is supplied from some .. internal
supply? - either way, no parent vreg necessary/declared).
As a note, for now, the only two MediaTek SoCs that have a SCPD supply are MT8173
and MT8183... and nothing else, as the others, including the newer ones seem to
have no such supplies (the only newer one upstream is MT8192 and has none).


My solution was to split the power-controller node in two:
1. spm: power-controller@0 - contains all of the non-SCPD power domains
2. spm_scpd: power-controller@1 - contains the SCPD power domains.

This made me able to get a full boot without usb/usb-eth issues while enabling this
regulator as a module; this also requires us to change the
mediatek,power-controller.yaml binding to allow multiple instances of that driver,
which is anyway already permitted by the mtk-pm-domains driver itself.


Hence, this question comes up: how should we proceed? should we...
a. enable this regulator driver as module and split the power-controller in two; or
b. keep this commit enabling this driver built-in and still split the
    power-controller nodes; or
c. just enable this driver as built-in and not care about declaring two power
    controller nodes?

Can you please give us an advice?

Thank you,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
