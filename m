Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2384C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoCiYIeyEalPqnQyShutzx/Ogt9yQ8iWlYuMSr1HCSE=; b=G4Hb2aDhkEHFk4zs2q4auJ+lZr
	1PUBljornhrJngFW+R8DZ+kSpFmXiuXwdSjmxmfgooaSzi5knd8/Qbtb8dRwXqn3ymJprEODFTQId
	GSfBhi62T5d4L/IzzkKG4nYdLYWXw0j0Q28v7GG4IzDVovCF55JrcrddgZT6MGIe51X+/+SuyunKI
	AVAtso/E5CfXwuvRrgB0DORAjGbOC9sKEkuXUOq4lwWIOw7Xo89MTWs3pDLYVHhX5G2MB48b1i9YO
	+/mnb0RI/bv5/A+WwV7iXmREFhF0lANStrxuYxi1wKgY0PimwD2JThv9OI5UQ4VqOw6omkmc7mnMZ
	wKT+uHXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quu6e-007M7p-0w;
	Mon, 23 Oct 2023 12:32:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quu6b-007M6N-0f;
	Mon, 23 Oct 2023 12:32:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E3BC660576C;
	Mon, 23 Oct 2023 13:32:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698064341;
	bh=SIvq/58J/JQ/GQJV0oLXY3FnJr23e8bcn2ZfaD3CmaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O7yHD1EX1vypBDQI/NxDiFvuZ4e0IVQY3xEquFeKZIGxgYF+uug0FBoTm+nSzJy2f
	 FttANybDeMKWUPai5H0ahBwIMEbAHjFMuIR2wKeP/XA8qb4BmvFpRYp5O7j7LaDX0Q
	 FS7DNx37piD6OYxtS74fNFjjHuBisD9GyL9m4g6Slm/5mt1Z8z/ZFnBWrTCGwhtF8G
	 wCgc6GjrZoYnf/C9gChbxWqgZ/M2mZnIp89/cQ82NAcOUEeBgFVu8ROCMc3srcmTux
	 2MAoIsFz1O29WtZryapS8eY7aNyO1yjYOdIcwitsx5l04GKD0xybdpduL2L/PsMwPK
	 Bf869hp+djAbQ==
Message-ID: <304abe7d-ab05-4190-b6e5-563525cbb756@collabora.com>
Date: Mon, 23 Oct 2023 14:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Fix translation window
Content-Language: en-US
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jieyy.yang@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com, jian.yang@mediatek.com
References: <20231023081423.18559-1-jianjun.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023081423.18559-1-jianjun.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_053225_415550_10E900FE 
X-CRM114-Status: UNSURE (   9.30  )
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

Il 23/10/23 10:14, Jianjun Wang ha scritto:
> The size of translation table should be a power of 2, using fls()
> cannot get the proper value when the size is not a power of 2. For
> example, fls(0x3e00000) - 1 = 25, hence the PCIe translation window
> size will be set to 0x2000000 instead of the expected size 0x3e00000.
> 
> Fix translation window by splitting the MMIO space to multiple tables if
> its size is not a power of 2.
> 
> Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



