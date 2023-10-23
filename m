Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4EECDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gLtT3OGHQNy4t1l9kfVNGgnAkgPU++xDd8dzeZ+gbt8=; b=a+mEiorMpRhAMgyv8hLfzhXmY6
	yMGgIWpko+y5E0vTjuzkr8lgcaoPv+BHdtS16/F31tNg4VB4dEcQX8qZNh2jgYQmQbs0AmiiDQToK
	HYj5xuOt1MOR4d8El2yaPzzSHTXGafpbZbn+xq9e5xop4fHfkh9RWE0IB4v7H24EiJomUzky0dy6m
	qOq2NDlo9Mz7/su81g5xV9znmhVZGoOwaqryMLdpAuoMBSJRS4wxlqDxLvm0+SQOeUeca5sHGiPEb
	P01SoeAp8Vdisoqm09SXL4URNsvlS6b8t/6Wi653Q/QHK7Vh4vJJ2rrmbqrTBxxq4TD01OzNm3X9f
	ZrCrzJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qura2-006vaK-1F;
	Mon, 23 Oct 2023 09:50:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurZr-006vVt-07;
	Mon, 23 Oct 2023 09:50:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BAC4D6606F51;
	Mon, 23 Oct 2023 10:50:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698054625;
	bh=jGS4wjjKQT+jnkpy/yvPYn70Z9+yx4rAHIJ/2NeAlz4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Aqh47hyd/S0BF0/zcRu4GCSeAePAoEpctZeh9g60YdqSt63KwdcI0vNUEtGmjzazQ
	 oIBC4wFm4988DN9q9cf8o5ml5uVfkS1ygKLhO1Rti2q7UkCIF896zt7Attj6dwsdaG
	 eS9QE6BFDNKFczC5BD0sXUq7IWeC/ikLLnZtRQWURAjN889N73j8DYNGKctgKA/HTY
	 6RAvQMtlO3quQWOcCoGG0IwTwaGMN6xtsAtycrDHotzUxV8k3h588A9159nzBWLya1
	 LiNRRRK8YkzgVgrYbNnB2NGw+eL3dTsXWr4Q94FNwu8cqDzqgLzm8SB/q+rH6bvlmG
	 q5uPF/OWocVsw==
Message-ID: <e7668af8-f2b4-479b-80a3-2677d180e641@collabora.com>
Date: Mon, 23 Oct 2023 11:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] soc: mailbox: Add cmdq_pkt_finalize_loop to
 support looping cmd with irq
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
 <20231023043751.17114-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023043751.17114-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025027_202895_10A2BE2B 
X-CRM114-Status: GOOD (  14.33  )
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

Il 23/10/23 06:37, Jason-JH.Lin ha scritto:
> Add cmdq_pkt_finalize_loop to CMDQ driver.
> 
> cmdq_pkt_finalize_loop appends end of command(EOC) instruction and
> jump to start of command buffer instruction to make the command
> buffer loopable.
> 
> GCE irq occurs when GCE executes to the EOC instruction.
> CMDQ client can use a loop flag to mark the CMDQ packet as looping
> packet. If the CMDQ packet is a loopping packet, GCE irq handler
> won't delete the CMDQ task and disable the GCE thread.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c       | 11 +++++++++++
>   drivers/soc/mediatek/mtk-cmdq-helper.c   | 23 +++++++++++++++++++++++
>   include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>   include/linux/soc/mediatek/mtk-cmdq.h    |  8 ++++++++
>   4 files changed, 43 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 4d62b07c1411..56fe01cd9731 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c

It's true that without the changes in soc/mediatek this is not doing anything, but
mailbox/mtk-cmdq-mailbox.c goes through a different maintainer...

Please split the changes to drivers/mailbox/mtk-cmdq-mailbox.c and its header to a
different commit.

Hint:
1. soc: mediatek: cmdq: Add cmdq_pkt_finalize_loop for looping cmd with irq
2. mailbox: mtk-cmdq: Support GCE loop packets in interrupt handler

Thanks,
Angelo


