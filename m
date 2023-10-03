Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B999E7AD57
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGj3V/ppM44G2S70QqLMtLHtu1JfEd8Z4knKyIBhYDo=; b=RzeHpyONZBenCx
	ePtzNGmJvEzcfM/SA437VkFYjQ1iAfRN7jQpIOZd/XwtkYkQ9iJu9TK7nBfFiB3dxWQw2zgDleMrf
	1qxX8SbWcNqRMqMyRhHOeIFpZkwIpOD2SVSPzDv3B1isBXy3MxA1YimEpJxGUbow5IthQpWZe8hPT
	2fLXbawstAGSW+BtcrNHZCmQOfO+Z4NdmJ8fsQXFCOk/gpP2hfrWF4DH+dCgH01/3GbRh895+ms2F
	+NtBxrfQx6Gj2N5XcZbLN99CQeGW/9lNCgiaYvkxOSwgKkvQ50VEDorNcfZT3v8Uf2YJEj4aV0DW0
	q7C+3z0EYvYb38TT8F2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qngF7-00EmLD-2U;
	Tue, 03 Oct 2023 14:19:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qngF5-00EmK0-0i;
	Tue, 03 Oct 2023 14:19:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F247B6602173;
	Tue,  3 Oct 2023 15:19:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696342752;
	bh=q6jgdWgYtCodntH6FjQOzCy+S7+AILl2Cw4hES9RQ0U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FLO8B/Vwmx7echaV3lF2IjVCIDU1CjzmdAz0AeYvC5GpQUlZWjoT9bzbhHgOA9Hmy
	 52gumfRL635Rtvk2l7mifzo9xq0FnuQR8VLdEmuwvJwjYaiezAElUD7O0hU8TDCvP7
	 5tEoQsSlxjgUNP73jOAeHkmVf5hRTWJkcVmHBMhSj1gICpX498LMRH7k54U4NLYHDw
	 PZ+FYPbdhVrsJtlCueBp9T5BM9bUt8wRHylZCD/0TR2Vh6s3/FANL82tWfBKfWdS3r
	 OGiBsODXe1TyIuc1kMQuf+3mzEcfayhrxjuaNXHKMOrc1K/6h2cF+ZfmwxWJMRxsz8
	 uTx/2u0VwzO0A==
Message-ID: <80597973-3afa-1cba-be0a-3ff63b305f9d@collabora.com>
Date: Tue, 3 Oct 2023 16:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 0/5] MediaTek: Update MAINTAINERS and dts fixes for v6.7
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
 <ZRwM06dwpF/7wEs5@sashalap>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZRwM06dwpF/7wEs5@sashalap>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_071919_384869_870789F8 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, Seiya Wang <seiya.wang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Eugen Hristev <eugen.hristev@collabora.com>, soc@kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Jieyy Yang <jieyy.yang@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/10/23 14:45, Sasha Levin ha scritto:
> On Tue, Oct 03, 2023 at 01:13:42PM +0200, AngeloGioacchino Del Regno wrote:
>> Hello SoC maintainers,
>>
>> As suggested by Arnd in [1], I am sending an update to the MAINTAINERS
>> file, adding myself to the MediaTek SoC maintainers, and some urgent
>> bugfixes for MediaTek devicetrees.
> 
> Just curious: if it's urgent, and there are patches cc'ed to stable, why
> wait for 6.7 rather than one of the 6.6 -rc cycles?
> 

I may have misunderstood what Arnd said - in that case, I'm sorry.
As for the fixes, I would be happier if those could land in v6.6-rcX.

Regards,
Angelo

