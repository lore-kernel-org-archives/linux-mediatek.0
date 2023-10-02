Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107FFE784B3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+P9I70OlQ74J5NKeXniy3p1igl8SMScrQCCw+zBU9w=; b=n82KmnmKxZF4zngQ1eBiFFsWIV
	oUdWLropdHjx9E58wGvtR35DF1BbLolnSJq5QtgVVecwtjYF1tq6YVaoKud4dA221lEL+OeDSvjgt
	tWm0Z21QQxsvAB19Bu64UF4raJIjXlikTYCHtsNm7INMX4+l/oYW+xXpEifngI2O0FkReCO3lvzHx
	edXN4bxX53zJH3c/Ml5d2+h9Pr9Zysy5ujsdxaixMCbf4Z+ER6HRhiOIOTQ5T6cmHqJc6e8jGSHN8
	fOXtqYwhu3XUgKYVRlyF5YEbEk8HnXvZ03igdVxN1EzykEn2Z/kAbjvnZqkNFFjgMlxbbqvXGvnv5
	1DKlCKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGU5-00CUTi-37;
	Mon, 02 Oct 2023 10:49:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGU1-00CUQz-0u;
	Mon, 02 Oct 2023 10:49:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 313CA66071CC;
	Mon,  2 Oct 2023 11:48:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696243739;
	bh=hkakGZzKrpBqJ8bu7p4aKSPk0uLiJp0RehNVXs696g4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UmcPn0VrD2YQUTYngDvWbvJ0+GnRHxdihiWKcu5Af4zRUeESUQSVHd0uiKEMNsdTy
	 JNTt/asH5FnWqP5eiMz1+xVzqZVS1nnFJ1at/u8LuCdQMkcAsB+l/pYVwjYMdmujhr
	 9LGrkpnY2sUopQ2lYhtFLoAcq2d1R0QKhdXAYoykhXiTWG10bHwTdTACyXkGhadZXD
	 4NPoRiRT5UnIozSxG0ZeXQI9/6oli5yVt+25KKlwOQN28FiabJHE3se63Fsv2LIAKA
	 EJqy0uYYWSMmQsH0Ow2kvmVYKW8S6BF+4xrHHbqVAxq+UjQ9LVt68pb7kWz0Fzm25H
	 WWBak1t9gXPGg==
Message-ID: <d63f9b4e-6f73-625d-1d5d-1dfa631ebd6c@collabora.com>
Date: Mon, 2 Oct 2023 12:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] media: mediatek: vcodec: Fix encoder access NULL
 pointer
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Maoguang Meng <maoguang.meng@mediatek.com>
References: <20230926101909.15030-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230926101909.15030-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_034901_445600_913873AB 
X-CRM114-Status: UNSURE (   9.01  )
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

Il 26/09/23 12:19, Irui Wang ha scritto:
> Need to set the private data with encoder device, or will access
> NULL pointer in encoder handler.
> 
> Fixes: 1972e32431ed ("media: mediatek: vcodec: Fix possible invalid memory access for encoder")
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


