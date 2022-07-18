Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A84C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zLLUegBxDWAte1hTOTANFDYbESxmCVny+/rHLtRC9I=; b=m0wfUONrSIsxJplSuSp+CAkBCf
	aRuE1yUJGK2k2OxG/AHtRI3Lq8hMzf3HgCuUrsOmvFxNSVtf2s44Mx6likWgPm/+YBOAtLZIpjKHy
	4l/bJYJD3pvfPIPFrySw73Ad2dDwPjkH7i2bNQ1WaOuRFTC1VXUNKQ6VUEapL0eD7u84ox3R4ZTuU
	nANC3wvERt02VDjqCSdaV2wjWtEYwhHaUWhWW+VCSrhX6Q98tXI724Et3W5oDcMDPOfDSMrIAx9V3
	UOaCMRPwCpO2ZZ/JqzNdiT5sBWJ8PJeRq24d3XCz2sIbcGuUzOqg4pWdupVgnhILUCD5q+txIIAmV
	xrOXTiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDR5c-00Du8J-7i; Mon, 18 Jul 2022 13:47:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDR5N-00DtyB-Rn; Mon, 18 Jul 2022 13:46:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BD5E366015A2;
	Mon, 18 Jul 2022 14:46:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658152014;
	bh=6W6w/V/cgC7i8dcLnR8Z1tgmXFyjXKpDCXUfV/w0+2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YdS48N30Hps+3LGmWFkFB4fikJKuoYdrzAvLVEHRxUquGqm4k68AP27mMCJczodZn
	 95tmpuqcvKk2A1IsrYE6RWCLUFY1TinpdHHaVZw+wAIHJVtdXZuyxI9YCLGpn3DRFa
	 88o1fY2ybN9Cdm580ibkNjVmZ/S6f/2kYcoAxQlDqTkdnB1qvZ57O9Mmq9Wcj6r0rq
	 glEgQdfah3YCTHCL5ZSvezg0GGQPI0sLy/J/I7gIyqB/VB5A+//JyKekUZ2z4xyQ8e
	 MLV03qDJ9AYwJhExZBjBmNiTs/6g8nvGZuWTmUaXCOzsZNUP+iyJVw8xVmaRyxkLrA
	 EQq/7RcQsY/Og==
Message-ID: <acfac038-3ac8-1748-1ffa-cb85771f2f6c@collabora.com>
Date: Mon, 18 Jul 2022 15:46:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8195: Use drive-strength-microamp
 in examples
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, nfraprado@collabora.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220715103029.204500-1-angelogioacchino.delregno@collabora.com>
 <CACRpkdYagmVAim68q=AOzrQfPw=fk5Q1z+B7X3nRDa-X4XukOw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CACRpkdYagmVAim68q=AOzrQfPw=fk5Q1z+B7X3nRDa-X4XukOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_064658_064153_B32B34D6 
X-CRM114-Status: UNSURE (   9.82  )
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

Il 18/07/22 15:35, Linus Walleij ha scritto:
> On Fri, Jul 15, 2022 at 12:30 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> 
>> The property mediatek,drive-strength-adv was deprecated: change the
>> example for i2c0-pins to use drive-strength-microamp.
>>
>> Fixes: b6d9af2c6b69 ("dt-bindings: pinctrl: mt8195: Add and use drive-strength-microamp")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> After finding this in my Inbox, drop my own uglyfix and apply this instead.
> 
> Yours,
> Linus Walleij

Thank you!

