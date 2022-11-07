Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655F9C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 09:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNTEHDGcoCW0vnYyan3gxgu/i036zLEO8/0+2T2f3U0=; b=SToCTYIGUQvdGiSY7FMPy0In51
	Nm6+m5tysDveJWbAVSXD1qDezNzYUAOL11rV4/bWXB5ldfDceNcSiTF4lneZpEHCSje5ujvEJtUWK
	H9gEVCT2sNLsx4F5hsoQ3bVV+uSdmxdeDjEnE8pnLQKItc7gpmeKSgEoEVLg8sH2Ocs3lvPygemEH
	1o+FY4gFOakKFEmHBCVVGURlnbZVwdEzGLf2Oucw/cv5PIYjBXAFE4v+kCX4jR9pCB+BYhY3g/Sy+
	IThJrP8AyAlF6hnIbaeKrGqnV0PB3GSW+8yw2Umf4HkbZPQX4krpFYCfT8UZYNcySY25Vs8fyWsxZ
	fXHN0f9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryW5-00DMlD-1e; Mon, 07 Nov 2022 09:34:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryVN-00DMMI-IA; Mon, 07 Nov 2022 09:33:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 98A66660283A;
	Mon,  7 Nov 2022 09:33:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667813600;
	bh=pjpsnJPpTte2rNUw4NGLZ9QJmz6SwDTTFxwPIuFAewc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ld4CCBMDDxOWCm8wV3UTICUwYhPt5dAdKICpLeRymrc0JNcQJnYkx79v6tK12U3Vh
	 q/GCcstsaVj3SMcoube8WaO03bxnfSEaWRbKuTqvFGkscnkUU98BP3Qo7mAKXpb6gd
	 BMmm35GqvhKwpWDUr4BX9VjJxyBRzn8t0rZhboDwdb+HIu4dOieM9RQMx3CeReRsvP
	 EGa5nXZZwxH6GHg2Wh69oQfj63I4ChfD//t6OIufp+Fz5/DVM7CACB07loAfqk+zwV
	 DsivdlK0dYSSZzjxi4LNKx+NU7giYsd7M15tetM1NOT4rj0UxoJbE9CSVf6v0jIwsS
	 d/dqJxHVdOPEw==
Message-ID: <e5bf5a74-0578-1f57-e6d3-9a6ad67a9a5b@collabora.com>
Date: Mon, 7 Nov 2022 10:33:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 5/6] pinctrl: mediatek: extend pinctrl-moore to support
 new bias functions
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20221106080114.7426-1-linux@fw-web.de>
 <20221106080114.7426-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221106080114.7426-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_013321_767869_BD810304 
X-CRM114-Status: UNSURE (   9.55  )
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

Il 06/11/22 09:01, Frank Wunderlich ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> Commit fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
> introduced SoC specify 'pull_type' attribute to mtk_pinconf_bias_set_combo
> and mtk_pinconf_bias_get_combo, and make the functions able to support
> almost all Mediatek SoCs that use pinctrl-mtk-common-v2.c.
> 
> This patch enables pinctrl_moore to support these functions.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


