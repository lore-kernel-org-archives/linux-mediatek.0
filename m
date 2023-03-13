Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FE6C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3C/wkH7ESd94RfvwsnCDzP/6+undEjcQ2/u29JRJ484=; b=IqPkJQ5Ee8cUpBudLAWLOQjcUi
	EJiSvoz8ZRCE5lTA+CZ8X/1oxBeYVXXgnQ3BtQnljyPzbt3u4anQYVgh1mvQ2zZORnjpZVD0zyPSL
	YWl6mrtREJZWXYTH0nbp8kA62uQSWQmdVUj60BinWRsOZXPHSHc16AX9n+ZD9/xitVDnAXT4Z5D3/
	kdB/6yIbcOFJfDtv1p/3NIMjbYW+d/MfEY/QvEHqOyIN2YNf4anJCkoSEPXMD2m17E4sL+uNC2uPK
	kl8MIbkMddQvZPekMbvBK4C+eU9Ec6g7rAbIWGNn8970cRIyx1YASW9XwSHvC7E2xdQh6Ct9y1WHC
	BlydzYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdqC-004pqR-4s; Mon, 13 Mar 2023 08:47:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbdpy-004pkI-9i; Mon, 13 Mar 2023 08:47:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5F4426603088;
	Mon, 13 Mar 2023 08:47:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678697241;
	bh=eiYGAbLT7Zp6mAfdt2dB6CX8x+Pu+9PNn5yycWisyGI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=i3bpEtmtmzzJmpQtAVv3DD7uBk2oHu7frE/8YBIt0y/rgtFl/hCi9Jh1+hA07vWqu
	 WvE4wdjn5iwtX2p6c/9ufFUFIBQmw8tRwe+G/b+fg1GC9RYk6Wrgj6HQD4aFOjlHrZ
	 nTh+Np6W6Q02+Eo42n0nUTmbSBGVJOgSKR2U/XjVS0eouPibXurU+VZqFvyDungmFP
	 nz9i1YEcyErO8WiezxSAEKuMSM8ZH39yyuLVkP8riqALdNuC+docyQ/fnBPXhsUh4w
	 RJI/rYjUva3ERdXA32dY7t/wFDsBTajf8aTk4ij8G5zsV6QTB7vcEO0wec2EWFka0X
	 SQFineRDdXXkA==
Message-ID: <2dea693c-39f4-c226-4234-36f1bcb7c0ba@collabora.com>
Date: Mon, 13 Mar 2023 09:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/5] i2c: mt65xx: drop of_match_ptr for ID table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-i2c@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-actions@lists.infradead.org
References: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230311111658.251951-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_014722_521054_F93CF9BC 
X-CRM114-Status: UNSURE (   8.58  )
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

Il 11/03/23 12:16, Krzysztof Kozlowski ha scritto:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
> 
>    drivers/i2c/busses/i2c-mt65xx.c:514:34: error: ‘mtk_i2c_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



