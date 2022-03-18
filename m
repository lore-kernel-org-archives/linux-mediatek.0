Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4742FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 11:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLVIFCVkW4YhVfQSyRBoGXdB1UR5FH3TOZi3zvunJJI=; b=0UWldxRz6ohpMv
	re1P06E7bSLN/AFtje+89jcEksJeQCbhlaWQBWADnmdtQ2q4Pmsb1IFl/SlV4trG4/zCh97hP8gvn
	WMOvAbea0T36r2qceFyQ8QD3MKcWcC4UfVX7muYaeuy800G9/6jToO2OGvsTkLAOZn/Ow0nX8LbII
	1cg0m2RHRzOhIz23Kze3tPoobjP0kPv9EHwXmmJYszqBKWx6aStP9cDTcUbhiEPT9loETVxMBc1Mn
	SrSHV8rcPmdWCIdlW+wnejWsMvjVzZlG+yZW98QDBkjGA93EOOe5m4A3DudEDkAh8sdXLnFckfZYq
	mM7eD3zrgM691tz7lyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVAvc-001RBF-R4; Fri, 18 Mar 2022 11:37:56 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVAvE-001R1A-M9; Fri, 18 Mar 2022 11:37:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 03A6A1F420EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647603451;
 bh=DUwF+4TszQDCNeDXlM+WluEPY94AYWvLFUDw8QuwfQg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e2oz9OXocQV79/AfrGxOzkoRbUznG1dof/wXLvHC1AfiKFDmr4MsShYDdKA9ZvB34
 vvfzVjTIiK6qrARQe+gyzQ3ZStFL3Etc7f8cWSosXcR6cGtYtF1SBAivHQ3BqIc3AN
 Gadotll2cJQyGu93vJR3WrzCcewVLamUp5NElChpNYVZvSXJQJqJbhwfCA2Vh7dZyn
 sxAiKS+NlPYiNx+yU1cu9Vl29BzqKIsUt6jw53RFU2GBXaQKkNh5UlhcUWF9VKgbJy
 OYdVq9gioWE/S8NIKPmBdHx65Z+u1pjpLeXqoh08oSMz21nxMjk0gU1of1FDfbcl8W
 I1Cyboi+vZE4Q==
Message-ID: <251d7e90-c20f-f870-85bd-97bdd55ac4e9@collabora.com>
Date: Fri, 18 Mar 2022 12:37:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 1/2] regulator: mt6366: Add support for MT6366 regulator
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, broonie@kernel.org,
 robh+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220317030402.24894-1-johnson.wang@mediatek.com>
 <20220317030402.24894-2-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220317030402.24894-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_043732_905198_49048194 
X-CRM114-Status: GOOD (  10.67  )
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

Il 17/03/22 04:04, Johnson Wang ha scritto:
> The MT6366 is a regulator found on boards based on MediaTek MT8186 and
> probably other SoCs. It is a so called pmic and connects as a slave to
> SoC using SPI, wrapped inside the pmic-wrapper.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   drivers/regulator/mt6358-regulator.c       | 213 ++++++++++++++++++++-
>   include/linux/regulator/mt6358-regulator.h |  45 +++++
>   2 files changed, 253 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
