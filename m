Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0F6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 10:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GKtQk5fxs0AAQ27/UkGOiAL6NgnMfsd8EpuNVBXL3o=; b=0ZNE9OiBSvnnYRSRgMCaqW7856
	Pad/IkyVgZEwuu2HIxb1Rz5aZVty/98NmWke0E3JoI7KuPzo37+URID8t8LGR+8xRdiTV6luk87Wa
	AtIztUFuCiXnJF0hxwBY+QOb/YsbHerBi9zYoSLGKeSNe5MKv/ZxHVCM3vx100ndTkFWl3PrGV/8l
	QArq4Xkyg/5/xnb//Mq4LFGVhf8xba2VGGOuR1RWJc8jjGiwZQI9T2byYf16kptWaHQj/x3RSgFxl
	XAxJPMNSRHMaOlirSX3Nfami+V4gKIOczSW/75LmU+88YBOIfq0HvqHa0Jn9Ts8TlFIyXxnxPnudf
	eHVqRlBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovymV-003QCB-Vb; Fri, 18 Nov 2022 10:39:35 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovymT-003QAv-Gc
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 10:39:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BA4BC6601639;
	Fri, 18 Nov 2022 10:39:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668767972;
	bh=oFMDujIPAAMn77bKnuEJQwag89/0lNbWafcLhGJMaPA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=EEaC1m8BCzNf+WdXitUzWOZsPzcnRQZgLQU/YwjNXOzyq81lL1Y5lVwAtsVFddlSp
	 CwlhWiCGOFy6iLxLTtji5A/PUf/4lO5aChkkQHwEe6REqyb8P61gpDfhL2sBsTLFTG
	 mq01vaqsyS+PWjL9wKHlkjAzfj+AH3rekouO31/8w90+apC/Tk9TWRHV9j3W+nzlnP
	 6rIP4jDx9iyRyh2+O3/q9J9OgPTv6wMkbA/TONS+ub9h62dL1ZL2JAw9G8w/50vgJd
	 khlVbfdDhXaNDtOpx3euAaLEavf7pOYSAJmWVJkZA8oRqV7a6R7dqC4DbN+wEvQWni
	 JeU0X/ICqUkhA==
Message-ID: <1d695cb4-2e29-b957-00cc-c0c39a47ff30@collabora.com>
Date: Fri, 18 Nov 2022 11:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: Modify the return value
Content-Language: en-US
To: Chanwoo Lee <cw9316.lee@samsung.com>, stanley.chu@mediatek.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com, matthias.bgg@gmail.com,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <CGME20221118045326epcas1p408c9e16a58201043c9eb3c99110fab0c@epcas1p4.samsung.com>
 <20221118045242.2770-1-cw9316.lee@samsung.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221118045242.2770-1-cw9316.lee@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_023933_711416_3EC37EAC 
X-CRM114-Status: UNSURE (   7.03  )
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

Il 18/11/22 05:52, Chanwoo Lee ha scritto:
> From: ChanWoo Lee <cw9316.lee@samsung.com>
> 
> Change the same as the other code to return bool type.
>    91: 	return !!(host->caps & UFS_MTK_CAP_BOOST_CRYPT_ENGINE);
>    98: 	return !!(host->caps & UFS_MTK_CAP_VA09_PWR_CTRL);
>    105:	return !!(host->caps & UFS_MTK_CAP_BROKEN_VCC);
> 
> Signed-off-by: ChanWoo Lee <cw9316.lee@samsung.com>
> Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




