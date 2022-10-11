Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C280AC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/TK2NOsOoiVUOegiHQHb5uDNG286nxD4YuMyMKXFvo=; b=rZ9FPn9Sm6xwDXEBF7D9jdBXYl
	kXMHW+XcRsiQqskvbXLQZkjpn3i9Ncgf2sWgzmP6LLWzxpM0kCAZiPfa88zm6qVNXirM9Xshc04Sh
	oNSt42nv+wOvBdMd0MU7aekSl13+zO42bXS4rVao+X1WWjaMMb1fQgXoTfMbK04K2NW5tjt6IUgwZ
	lI7njAacJoU+COplO1jCOiH/Fg2qF0Cwu1gMIVnKfSpjqwHwPyjgby794CwSHxoxrZ31OnxF4BjeP
	hCFAXtMxZClEC0x0lIGQgKUyKIfGRHjg/eyEPdDixq/ionMdpflHRZN+qh2IDVs6MXaXj5WJGK9ET
	2K/E4C2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCCS-003xmq-RA; Tue, 11 Oct 2022 10:09:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiCCF-003xiB-O8; Tue, 11 Oct 2022 10:09:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5ED996601D9A;
	Tue, 11 Oct 2022 11:09:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665482950;
	bh=JeI47y8ScMzR6RotjVJBgIe2xqe2wODG4+KKgChMq/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DBGYlIEVMm7+XG1DkauerLN611kYQgytIsbVwoEFId5sjo7f0OlfvOgngr35DKoNc
	 DtEH7vx8a130Ar6FDCFfIQMsKQBpBvI7WjDwuBbh3Og/c6miCE+47g8/UkykZbwlSL
	 vdNr/rAXkbc5635P/a3k/92xC1cYsI0Vt27OYKzsQQ07BUYzHBP7kwHkXGSx2z/NW4
	 JDB0DBcG6KfAwi60saudrkozeFYEMTUaR8yi25g7a1UIIUWBJe0acVzyT/zZOTRdCO
	 vwgQ6IOT5qg7ytkjNZ0i8HWd8PwJGngPaa8EOauXyVJCIHMVHzIgbBXloqMAoX7QKC
	 /nHWkOeOa0maA==
Message-ID: <122a1376-4cd4-3ca2-d5e4-40c44186a3fb@collabora.com>
Date: Tue, 11 Oct 2022 12:09:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 5/7] soc: mediatek: mmsys: add config api for RSZ
 switching and DCM
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
References: <20221011070356.682-1-moudy.ho@mediatek.com>
 <20221011070356.682-6-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221011070356.682-6-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_030911_945449_0587425A 
X-CRM114-Status: UNSURE (   8.30  )
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

Il 11/10/22 09:03, Moudy Ho ha scritto:
> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Due to MT8195 HW design, some RSZs have additional settings that
> need to be configured in MMSYS.
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



