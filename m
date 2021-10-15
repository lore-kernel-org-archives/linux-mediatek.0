Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342A5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 16:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01E0E61164
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 16:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01E0E61164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FYOqd1k/Y+swmsOSSoAkoDD7lM3qos0+WtviNNskEus=; b=NhdeRkhsBq0isJ2l+kX8GrogdQ
	MwgCnHOai3Bdr8XQd1WxWg1438cXldRp+6Zkk6EVgG4fyvJFxqSlonGYF5pxIqnJ0ZhtjYbOGurce
	0VGI4akZslvhHON3G5MvmaqUP/aJgGqt6AKuyiL+owfTWL7IcBYhQijW6tSNOpl9Rj1hKtOhmsL8I
	aNLTU1lB0PlITOBx7LAWBWl3Ey5uvPfvaIuiSNY4f7EpcnSahuj+Gm4PTLo09Vt+1Uc0oPMrCG5hh
	aLJCTfHLHLvNKEH67Xt4D4UbePvDvy90eIa4GXCreCdQtZAA0VXSVcih9wGgALJB7+tC6ZtgJak9h
	03uhe8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbPxV-0084v9-96; Fri, 15 Oct 2021 16:21:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbPx5-0084ip-Nh; Fri, 15 Oct 2021 16:21:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id EE3141F453E7
Subject: Re: [PATCH] arm64: defconfig: enable regulator to fix mt8173
 regression
To: Adrian Ratiu <adrian.ratiu@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 "kernelci@groups.io" <kernelci@groups.io>
References: <20211011125301.3440033-1-adrian.ratiu@collabora.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <d34874d6-b55c-546f-d9c8-651a98814815@collabora.com>
Date: Fri, 15 Oct 2021 17:20:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211011125301.3440033-1-adrian.ratiu@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_092059_956774_00BA1EEE 
X-CRM114-Status: GOOD (  16.28  )
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

On 11/10/2021 13:53, Adrian Ratiu wrote:
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

Tested-by: "kernelci.org bot" <bot@kernelci.org>


https://staging.kernelci.org/test/plan/id/616945b4043bf9aafba6c453/


Thanks,
Guillaume

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 156d96afbbfc..4901cc1213bb 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -616,6 +616,7 @@ CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_AXP20X=y
>  CONFIG_REGULATOR_BD718XX=y
>  CONFIG_REGULATOR_BD9571MWV=y
> +CONFIG_REGULATOR_DA9211=y
>  CONFIG_REGULATOR_FAN53555=y
>  CONFIG_REGULATOR_GPIO=y
>  CONFIG_REGULATOR_HI6421V530=y
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
