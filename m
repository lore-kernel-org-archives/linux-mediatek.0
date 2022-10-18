Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B39C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Oct 2022 09:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQBkHoM+9stpbfc07Sf7C2iMi2dKdp2h6d3KI9FuXbU=; b=ynCbaqiBYpEVjE3ttf7kgfqfpU
	2oHJZott+bBIeCPEkTnLI6McTKb9IYqrWi8AkFfIhdY3zW1aE5bB+oPuBiQ43P2fPVwxl6uZb6P6v
	iO7yqOR5fq84MVywqocqs4Qj8t7gAplqXM5VSJLvyz3pxvaBXoJHVLuu1vkHqWuhKt8kUC3f5mCHS
	PKAv5Gezyco5Fqd8K3ixjzbmZwuTvPmyxGLgk/IEUJQdjyEPMeAX3mMEhF6Y3UjP7wxDmViwiH9FF
	0ADfLR2RA+ZD9W8rvaXr2mciTeg0SNFU2gDGOZiaMqoXzejI7RYV/AI6d+OTOfdTvXWS+Uus7l3Jo
	mV2cVAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjFG-005GiW-Oy; Tue, 18 Oct 2022 09:50:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjF6-005GBA-65; Tue, 18 Oct 2022 09:50:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E41846602334;
	Tue, 18 Oct 2022 10:50:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666086630;
	bh=HfceC2aAwhgWtVVcIcG4NNLS5294fMdqXNStPSlbxDo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RmxVfyxpOundxTRNDFpEJpaJSfO6XVh046emRYMEp/ytLA0guvbX8cXguC/jnRt+D
	 IivPzC2SQlsUQorWcCdNL/xrwC0IG6g1BTMX2/wpOo0vJS4kOy5USqnnP20QOQ98YI
	 EBf1/WatdRvRojOE4YzjC12SWNelM6Pvm0og/mEV8lQrRv11Oohqi3amLiHe1L9OVl
	 3YMK7tbTk4N/akX0eHOGtV2ZmnHq5Rn/uu17aro73Rn6ktZ7xdu1pnahbem+KF9P4h
	 H3vXYlu09s3LZg0wZhkmr1gF5IgPcstsvQs4mAyau21E6RWMaojzUgmdGnlIZPKAVT
	 MGGe2qfFSxGZg==
Message-ID: <438bf06d-c4f4-74b2-8903-e89dc52196a7@collabora.com>
Date: Tue, 18 Oct 2022 11:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] mmc: mtk-sd: add Inline Crypto Engine support
Content-Language: en-US
To: Mengqi Zhang <mengqi.zhang@mediatek.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221017142007.5408-1-mengqi.zhang@mediatek.com>
 <20221017142007.5408-2-mengqi.zhang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221017142007.5408-2-mengqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025036_478237_919A37ED 
X-CRM114-Status: UNSURE (   7.92  )
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

Il 17/10/22 16:20, Mengqi Zhang ha scritto:
> add crypto clock control and ungate it before CQHCI init.
> 
> Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>

Hello Mengqi,
I'm a bit surprised that enabling ICE only requires enabling a clock as
on downstream code I see some SMC calls to MTK_SIP_KERNEL_HW_FDE_MSDC_CTL.

Can you please explain why SMC calls are not needed here?

Thanks,
Angelo


