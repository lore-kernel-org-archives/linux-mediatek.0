Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727D9606A330
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=waPlrt/9;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Jchot9U+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zJAwjzj8A6UyZL9292pQYGGLxeGp4pMjNVMToHHKfLc=; b=waPlrt/9HpQxt+
	j7/P/oeAHYAHWOEfkhJu6/gbfVHU+sh19hd9DLd5oAtOp+jmPrK/jTEt9/BbHQw/52i6t4T/SnUtF
	qurpTEjJcB5vW+F8glClOHfSv/5R3/wbe6y60GfMr/3X8zMg8XSKfxjJUFUzItJ/+oOXcHwgs09T9
	PLGs7AV4cJ8RddlHrHdT7uEqRbdkErKkgggipRiqSQ2mSuU6Pa6CVZC75ZLZDtbnuIhtWYiYZD9Mb
	Y0ByYpRcHOk3eWAHwzuPpWqtFP6eEPZvSbt1CiyXUz3uaqH+9unWvKPaVg5Yeb7QVjPGPE/F6Ez/f
	Slc44wNKDBOcl+vZkClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHOH-00000005RoP-0OnN;
	Tue, 17 Nov 2026 11:30:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHOE-00000005RnG-2pVM;
	Tue, 17 Nov 2026 11:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794915016;
	bh=4rrJaKwJlg6MCmlVQX/KfOrKxAoT2XQ7pGHqjYwrJ6g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jchot9U+o4RxaCIJ27FWcHx524gFRsaWj1/nzyCl1f+pLc6+ayS+9z1bguMKusUOI
	 lLbstW+OBVMsvgsdJbgAkeOho4YQ4Sq9gAxWaRR1op/G3rhSHiif+KPlp9RLfFe2XV
	 byR5R47CF08xaTYCAZuA3BUVHXAfzC3pFjj3709ghVCFneMQsuZbXeRBfz0ubejYig
	 WMFGk4Tu4JccCLiAdjYbEzlR1ZCDb4mHCeeeEv3RNlEG/dX8Y3ODoJlPLTQkEDcg7s
	 WG/OTHaQub4ChOcGgTtM770xBZFFutX82kSISyfpW0yvAdIaL5++fnEYf5xx1mKD94
	 x7heECPfjn75Q==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3CFC17E00E8;
	Tue, 17 Nov 2026 12:30:15 +0100 (CET)
Message-ID: <fc0bb114-8781-43d2-bdfe-45135259a548@collabora.com>
Date: Tue, 17 Nov 2026 12:30:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
To: Ryan Brue <ryanbrue.dev@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rtc@vger.kernel.org
References: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_033018_896653_4E6603FD 
X-CRM114-Status: GOOD (  27.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/16/26 19:46, Ryan Brue wrote:
> The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
> the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
> and mainline never touches that bit, so the chip only works if the
> bootloader happened to turn the output on.
> 

Not just mt6397, but way more than that - upstream never touches this one
because the main targets have always been platforms both without any modem
and without any *tight* power optimization (historically, chromebooks, and
Genio IoT boards, where the first are equipped with big batteries, and the
latter is typically powered with an AC-DC brick until it gets thunderstruck).

Nice to see this getting upstreamed.

Both patches of this series are

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
> the vendor's LK, nothing sets it in the former - LK sets the bit at every
> boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
> Letting the RTC provide the output as a clock lets the chip's
> mmc-pwrseq-simple enable it. With the clock wired up both came up on that
> board in two boots out of two, and in none of three without it.
> 
> The driver registers the clock only when the RTC node has #clock-cells,
> so no existing board changes. The MT6323 shares the MT6397's driver data
> and gets it too; every MediaTek PMIC RTC whose registers I could read has
> F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
> shared driver data rather than read from a datasheet.
> 
> Lee has applied the binding to mfd [1], so v3 is the driver part only:
> patch 1 gives the existing write trigger member a name that says what it
> is, as Lee asked for the new one, and patch 2 adds the clock. Both are
> for rtc.
> 
> The board's devicetree that uses the clock is not upstream yet and follows
> separately.
> 
> This series was developed with the help of an LLM.
> 
> [1] https://lore.kernel.org/all/179459615032.87488.12726056214378307165.b4-ty@b4/
> 
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> ---
> Changes in v3:
> - rtc: name the new struct mtk_rtc_data member control_reg, rename wrtgr
>    to write_trigger_reg in a patch of its own, and the local con to
>    control (Lee)
> - dt-bindings: dropped, applied by Lee
> - rebased onto v7.4-rc2
> - Link to v2: https://lore.kernel.org/r/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com
> 
> Changes in v2:
> - rtc: check for #clock-cells before reading the driver data, which is
>    NULL when the PMIC has no RTC node, as on mt8173-evb (Sashiko)
> - dt-bindings: add Krzysztof's Reviewed-by
> - Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com
> 
> ---
> Ryan Brue (2):
>        rtc: mt6397: rename the write trigger register offset
>        rtc: mt6397: provide the 32 kHz output as a clock
> 
>   drivers/rtc/rtc-mt6397.c       | 95 ++++++++++++++++++++++++++++++++++++++++--
>   include/linux/mfd/mt6397/rtc.h |  8 +++-
>   2 files changed, 99 insertions(+), 4 deletions(-)
> ---
> base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
> 
> Best regards,


