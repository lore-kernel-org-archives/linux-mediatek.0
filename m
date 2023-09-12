Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D977CA0EF8
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 16:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACrvBDvBTo4I6m5T0VSG61KHXtQ1zZrQbGpWCeu383o=; b=WSRp/iT9S/fqP55kFGzyizFtvC
	KApz+o1hIy4r3KQBiVLxtKyqMsyEwdKyAYhTSOYdwISw2PSJFDn2LhRMFClNj4s1iLGofIVONVy8O
	F3sUXWxAjAyDG7JinlPUvzAyH3RU2DOAKtLkNY4smiDWN03dJsfRYFFx9TrSItj8aQ6IcQbXmBhtK
	XZoz/liH8879LNIlkkEkZheb48ktxUwJfBxtWeZykEdIDtwaSZszCx2fXs7+gUfv3qp3b71g0qrGY
	avtxcePKTYU0mPVwiGHKPA+7BQfHGSeuH+KYJ2+KhpbZb3edRbrJy9Dohzk6Js7jqGmO3DvTFJTEt
	/+Rb8EYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6hF-003sPD-0Y;
	Tue, 12 Sep 2023 16:57:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg6hC-003sOU-1t
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 16:57:03 +0000
Received: from [192.168.0.106] (unknown [186.235.7.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: koike)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AC1966071C9;
	Tue, 12 Sep 2023 17:56:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694537820;
	bh=HBRi9Hhlgh4EDnkDLig1ZLdAN0tTXejvnyzq+J8F68E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GTWXXG06C++Uo5WfJQzOUXkpnQStgPoetnWMMASam4EhpbXuwDH6Ku9xtwu0mpw1t
	 f5J4/pqRt9bIrBL4y2H/6DsAw74oUyqYTUKEM3JCfXMpTDk1oF2J91qHXGBA5U7r0V
	 9G0gugYAliu2T+QNNMeW/0+9ElxNLsNiKrBSWoo6iT5Q2N3s/qYYf2BDvH0pYLRRrb
	 5v9pLr0FyIGScMIJjbei3sZ4YjVbuoKLmTJ8e1zjBZRuzG1yZrbdKK4l34lGEZuI90
	 RWI8IlsOk1xk8FgN0eo3e27d4VrjdZfEsVhNVWtuHj77T9k0UY53s4E34RUqn1ZI9a
	 3uVlsBT+spg8A==
Message-ID: <3f1f1679-2d0a-d501-da9c-cb38088acef2@collabora.com>
Date: Tue, 12 Sep 2023 13:56:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 6/9] arm64: defconfig: Enable DA9211 regulator
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, angelogioacchino.delregno@collabora.com,
 emma@anholt.net, robclark@freedesktop.org, robdclark@google.com,
 anholt@google.com, robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mripard@kernel.org,
 dmitry.baryshkov@linaro.org, matthias.bgg@gmail.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-7-vignesh.raman@collabora.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230908152225.432139-7-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_095702_764022_BF265B14 
X-CRM114-Status: GOOD (  16.04  )
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



On 08/09/2023 12:22, Vignesh Raman wrote:
> Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
> Enabling CONFIG_REGULATOR_DA9211=y in drm-ci fixes the issue.
> 
> So enable it in the defconfig since kernel-ci also requires it.

tbh, =m doesn't solve for mesa-ci (since we don't use an initrd, not 
sure if it solves for kernel-ci.

> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.co
In any case:

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
> 
> v3:
>    - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
> 
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a25d783dfb95..ef22b532b63a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -711,6 +711,7 @@ CONFIG_REGULATOR_AXP20X=y
>   CONFIG_REGULATOR_BD718XX=y
>   CONFIG_REGULATOR_BD9571MWV=y
>   CONFIG_REGULATOR_CROS_EC=y
> +CONFIG_REGULATOR_DA9211=m

Question for the maintainers: would it be acceptable to make it a =y 
instead of =m here ? Since this is something required for booting.

Regards,
Helen

>   CONFIG_REGULATOR_FAN53555=y
>   CONFIG_REGULATOR_GPIO=y
>   CONFIG_REGULATOR_HI6421V530=y

