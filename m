Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00593EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 06:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUJlXfHGfo3x5z+xERqWOPEPG3lN8FOJE4GJzec3oY8=; b=Kiaitim5SNWS71o6N/x2Jwd3zR
	xAROpKxRmSwfYEbJyjwZFjeYezQSTP7BgwtR3ndRsOQA2YphAWWRJIYhT7nYz2mj2wLLVDBbVd5dv
	cRj6YWELiJxhrNvSzVlpVZdp3HNwBvALtZZ1yMM/vwuFaOT6lf8tost6AWUEjsFpsrETAOh8D9ipT
	RfzxG1/DNfouOzm1eUH7gRmBvCpnHJ/gRx08CgOXskPkLax63uXtLzz+M4Y+XMwiUkE3rXB0l5037
	hCwHM2v4XVoi+Hsq1Ad1kP3kpe5VtijjtDRnKimGFH30CCR6ILJswD5p9HiSXfAxxg2kW05Gt9a/v
	NohsbP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTh9-00Gitl-29;
	Wed, 12 Jul 2023 06:51:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTh6-00Gisx-1s;
	Wed, 12 Jul 2023 06:51:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C05B06607014;
	Wed, 12 Jul 2023 07:51:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689144682;
	bh=ZNA3nvg6eJG/Hc6v4LETHxYo8klNpKbEqdasNgN40TM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hz6WfZq/B8W0c8j7bRzhi/YwO458dsPEPQcPLnPptua6XcAvGvof5HL2dCZpCNb/z
	 TyFW3UHMcrrXyHj973nADh3nAilMZB0L2GeBWKu9bH8W/PqozAmSgNRgI3xIrgbo0K
	 JyzPTzteAlphuBJ4ev+XPXjYmC7E77A8gDNHgUbf/5voO3xx/d/2CWsmkc9lZQDR8T
	 kBoyC6Dq7XvkIxA/vBjh/bzThdghSKZOVBqTzBHbPGB/VfyIjRhEFKYamFVAknFjO4
	 VMlog89isIKrVpZ/4r40ceTosKKsvFqJ1FRcY5DXS6roseM0+yzBARj8aY2UQSLolG
	 A1h8L/Pn0jinw==
Message-ID: <212a4999-eacf-12d9-004c-e47f52022176@collabora.com>
Date: Wed, 12 Jul 2023 08:51:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Remove surplus dev_err()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, stanley.chu@mediatek.com
Cc: jejb@linux.ibm.com, martin.petersen@oracle.com, matthias.bgg@gmail.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Abaci Robot <abaci@linux.alibaba.com>
References: <20230712064832.44188-1-yang.lee@linux.alibaba.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230712064832.44188-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_235124_749104_0C2D3B95 
X-CRM114-Status: GOOD (  10.01  )
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

Il 12/07/23 08:48, Yang Li ha scritto:
> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from either the platform_get_irq()
> or platform_get_irq_byname() functions as both are going to display an
> appropriate error message in case of a failure.
> 
> ./drivers/ufs/host/ufs-mediatek.c:864:3-10: line 864 is redundant because platform_get_irq() already prints an error
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5846
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



