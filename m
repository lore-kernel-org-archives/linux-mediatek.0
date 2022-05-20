Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF5C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EqTHuFFiJw/sO1CsL/sZK09u4KYGhRWs+dp/j9tbpU=; b=q8QuCsD56Tr+8v
	Uxtlq7AAxoWj3YDk8sim1q/BySDvFL6mNz74hIjUEEd2aYdwHnjSp/W5TDpTkJ6qwz5BQPLE10VAd
	rNmjewm3s02FJOwJGV+Re+0NGhNz6q8M9G+G45topxVHUE0YkGDk05jx+uVAXIce3icgb6usMcWh+
	1F+4rhyRgf0KdqAbklbn7/gg2a5Ija7obfo5iLb+PWQnwpwNbolg/ypQmXNpSMBhrSEI+vRCXCuhy
	iLB70suvyG0TeTP/Dlbt61U7OkjLTWI0fxy0KUOYEgJwVGu/YdEMEfBHaV4Gz8OJSXDKX5CBbt3Ag
	Rb0QhSla317W/PrXkZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrySD-00BPQC-3c; Fri, 20 May 2022 08:57:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nryS0-00BPL6-Eh; Fri, 20 May 2022 08:57:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1AE511F4611B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653037055;
 bh=bqpd3VkSlKvqr9XIfRMDAcgIUFokqBJv8l2n4vWSWT4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oes80px/qqzIMK0FO5G0U7jtE5bl4FwQ6jiWSQlnTGHzjRtgtyBCtxrFiRmUJTiy0
 fUzI/Nd7mKddu6jnQQlCmGQUnr+TZ/Kq8c4Bgt/lgwL6PitEi1MFmRNLM+mic5nLa9
 kHckyLkTOMWY73pLzAICer2+G89R3OMSWvcJPdacto4PKuGegoXo5r+pIX9IEZE2rT
 wVWqLeesySlIKiO5uuLJLkHwM+Ph6W5Celhy9g36+5wWZsMLevsx2uM7RYs82xh6HR
 qP1Wdcl2NdMbXy4bsHFnTd9ifbMDmuQrM6Wh2L5LrP8bgghcjh2+UNGR3ehjumbshE
 Sq2z5/hFCjtPA==
Message-ID: <a3ebc189-de28-3991-0cd9-1b1cb44f78b7@collabora.com>
Date: Fri, 20 May 2022 10:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v9 2/2] phy: mediatek: Add PCIe PHY driver
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wei-Shun Chang <weishunc@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, rex-bc.chen@mediatek.com,
 randy.wu@mediatek.com, jieyy.yang@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20220520064920.27313-1-jianjun.wang@mediatek.com>
 <20220520064920.27313-3-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220520064920.27313-3-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_015736_671564_257DCFB4 
X-CRM114-Status: UNSURE (   6.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/05/22 08:49, Jianjun Wang ha scritto:
> Add PCIe GEN3 PHY driver support on MediaTek chipsets.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
