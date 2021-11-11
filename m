Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2095F60FDA
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2095F60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vtJVwSLjPvs1I3iHmhkCruCD++jrP4fUPTTLjJ0WV0=; b=Iwhqk1mz5UDF6dpLSOtb1VfC+8
	/xvgxbh1FojsPWSmnCcmKBHIdWqUG3UVNrM/0WwE/k78X0PnSFG8pb90FdHXiR754rDYr9ZBiyZJc
	lXKYGNuN8RAXPJ6Rz5+TxNDCn59gC3jRNjS+2nuTP3rVu/THr5KTbaW9vuuu8BxyC1zdBG8U3DFAZ
	ceiyD2GR2p504gSjRGhSIJFC2ZlHI6L59w1kgUNb1J1uULImHNac6depqD0M5DmL332e3gP/LxOoH
	CYESgliC8Edif816BbpqwTYrm/poib+vAkWpMkypDHKDblhtXClJzu8b77vzK/XUUim5HDqjoXEFM
	9yXth3pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlAL1-0082uh-MP; Thu, 11 Nov 2021 13:41:59 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlAKj-0082oY-FR; Thu, 11 Nov 2021 13:41:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 21BC01F45C4A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636638099; bh=CHJDHhiAjdq3L1NauwCONE1XBN60xw/moDpKBFO9Dxw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=L9UMZXx8zbtGS9X/Im0l2+D9XOOvuHBhzVk09tPpvbMkqdxtPy9WYwmxG7BuJ8REw
 b2MrW2a/IZ8B46fb5VSAlCQfyJ39MI5brGxWrc+CWU2vQzKjX2DHab5QOUL+tjeCVv
 lc51RaT7Bz79Q2eRgbaf80NkVtf4mZTbjs29lvfMWJuwVEmYz4iFkwFQSlHGhp76mk
 UWckffRvR1upBhOlt//dMvm1QV9ljDZke7uiDJCzKwTI/8fVe43xn0FV3OZKAkN7qn
 2vfVnIhcB0k/pyl+mOUGE4nlDleWUGpzNy80RBZBTBqt3qzo/HZF8i46SIjskD6Oto
 6YSkobhbxS+Xw==
Subject: Re: [PATCH v2] memory: mtk-smi: Fix a null dereference for the ostd
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com, Ikjoon Jang <ikjn@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20211108082429.15080-1-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <1d72bac8-eb79-6f34-79ca-4c5c38d6d2bf@collabora.com>
Date: Thu, 11 Nov 2021 14:41:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211108082429.15080-1-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_054141_698589_4E342D39 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/11/21 09:24, Yong Wu ha scritto:
> We add the ostd setting for mt8195. It introduces a KE for the
> previous SoC which doesn't have ostd setting. This is the log:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000080
> ...
> pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
> lr : mtk_smi_larb_resume+0x54/0x98
> ...
> Call trace:
>   mtk_smi_larb_config_port_gen2_general+0x64/0x130
>   pm_generic_runtime_resume+0x2c/0x48
>   __genpd_runtime_resume+0x30/0xa8
>   genpd_runtime_resume+0x94/0x2c8
>   __rpm_callback+0x44/0x150
>   rpm_callback+0x6c/0x78
>   rpm_resume+0x310/0x558
>   __pm_runtime_resume+0x3c/0x88
> 
> In the code: larbostd = larb->larb_gen->ostd[larb->larbid],
> if "larb->larb_gen->ostd" is null, the "larbostd" is the offset(e.g.
> 0x80 above), it's also a valid value, then accessing "larbostd[i]" in the
> "for" loop will cause the KE above. To avoid this issue, initialize
> "larbostd" to NULL when the SoC doesn't have ostd setting.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> change note: Reword the commit message to show why it KE. and update the
> solution via initializing "larbostd" is NULL explicitly in the non-ostd
> case.
> ---
>   drivers/memory/mtk-smi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

This commit needs a Fixes tag. Please add the proper one.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
