Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05593C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBIoobefQADQsclEN/CiI/o38NY5xVzNTPNwIjfUXDo=; b=Mw3P2KmU0ysDkXfmgHkOYXPa4+
	hympoOR5rCjH0wOufPbbsKdbdUSq5D8gShhDBeQv4UXBJWRS86Uwion0obNzs7xo/y9YNTWBVUsot
	P0k4mQkJlvwoAN14+5LP2wqkhXDjzjY58l99QaVrf9xtnJxSwsuezwE2kvWrFgYJ+wi31TOaQp3Ed
	s2qUPJwhDVHaXqApTI2iMmxUBDCMmQE8XijuRKvz2QCW1W3bKdpZ9vzCEdZbRVzfqjkTfCqrvPAnI
	OJ60SikoShwzfOBRYu2j8nxz3jDlbQDAC6b2ynJajxrnMFosy77iTAenhJPYMVDCiG3x+TXDvx7Tj
	oz8RfoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL6i-0000000APpb-20qX;
	Mon, 29 Jul 2024 07:47:48 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL5n-0000000APWW-0LJi;
	Mon, 29 Jul 2024 07:46:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239209;
	bh=1LXsqzTga9W4w/wmKFvBRr8sGHy+KiZMbzrm21w6exw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=suYjNphfEbh4Zjwe0z6pP+/hXPD6caKMxdfxvy/aj6m0HkSMQ62ugyPdZEIYhT3Dm
	 p19WV44EKgQN84hWg2Tucbr3YcdpmwYgHKj7E7+mXudXsQt6e5xL/eE6gAvx5iCvMe
	 QQcRJFDYJoE8kDrKTelgiES2gSw0uqPV9uz9F3Cu8VSpdPB+yUZ9AjE2urVtHGb5EW
	 vUzZjvom2JVWEccYCUGLDWDFLJzFYiub1PVf/q6MWIZdy9SCMCIXvB7dHWrJcfzgh+
	 vcZg39qPsK9+nzd4KCxpMEKBaDhaKLU4+ecb+TY5Ep2KycAc4pIGb5Nr2/w0d2GCKf
	 jh7Bpe/nxZEfw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6C2E4378205C;
	Mon, 29 Jul 2024 07:46:48 +0000 (UTC)
Message-ID: <2f23eb6c-150c-4ad3-9518-fc66c9383d83@collabora.com>
Date: Mon, 29 Jul 2024 09:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: mt6765: Add missing PMIC clock
To: Arseniy Velikanov <me@adomerle.xyz>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, sean.wang@kernel.org,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, frank.li@vivo.com, jiasheng@iscas.ac.cn,
 mars.cheng@mediatek.com, owen.chen@mediatek.com, macpaul.lin@mediatek.com,
 zh.chen@mediatek.com, argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20240729073428.28983-1-me@adomerle.xyz>
 <20240729073428.28983-2-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-2-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_004651_283917_7045E126 
X-CRM114-Status: UNSURE (   8.69  )
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

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> Add PWRAP clock binding and shift the following ones
> 
> Fixes: eb7beb65ac30 ("clk: mediatek: add mt6765 clock IDs")
> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>

Hello,

sorry, this breaks ABI. Please put the new clock at the end of the list
instead of putting it at the beginning.

Also, since mt6765 has no devicetrees upstream, technically this SoC was never
used by anything... so you can (please) avoid putting Fixes tag for this one.

Thanks,
Angelo

> ---
>   include/dt-bindings/clock/mt6765-clk.h | 131 +++++++++++++------------
>   1 file changed, 66 insertions(+), 65 deletions(-)
> 


