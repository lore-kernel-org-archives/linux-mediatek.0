Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82B6C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDmsRcf3DM3rc/jKPxW/ywYCEY9oD1jUntWVvrR6gyI=; b=jrNKoKOhjzXpSXfvfsjjHzD7DO
	KSMlC1vvd5FlZl8GqG02/HvQrA1uF9W/f6va66/6nZu3G1sFFL7dIZaiQ+6Hx+csVVQXju8WWicMZ
	M/1XDhczrm/URTs/ScUS6KrQl3tD4jf9MCx1j3vNnTv2OQIGbIBX3r/3VyOG8PqiQWfNEpz0mO7N6
	BfsS6Fy52J7SM5jLudYjU4LO7BbZ6A4Y5gc7lzIUejjf6Ybisw2nQYcJ1yFrNIHgBoEjbNX5RAScP
	0t9VkMg/DiW82UdGDJ6Ien/ebBDhen3uSJXqHhnxz7OpPHxYp80UbeRuMMHBJyv2poYekkeBSAzlU
	43p1E5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5koE-008THS-Pv; Thu, 15 Dec 2022 09:45:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5ko0-008SxQ-7K; Thu, 15 Dec 2022 09:45:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 06F896602C09;
	Thu, 15 Dec 2022 09:45:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671097527;
	bh=x9trYPWhOA+FJ2w2sf3ZqR1+YmbQAS9aRfZ0UGY1uHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L8i9J/HfCLhRxHKrDT5j8YdjpghpX2SWE1vd+i9qpp036JRmuJhPcp4J4gs9jbfTC
	 3JKifqfji+FHiQgYQ1IhIcVdQYcbl6ZagCJBsoDNe07srrU1ZfxFxq881mIawsaAbF
	 XcqFS3a9b0gESSAtmIDjUSRjMoVj/7iyIv3uwyk+eiRyVWsipQxmmQgPUk8S62F/v+
	 RaZxWl+4StfCy/4U+JSVSI2/eIOKZqg4cfAF0h5dG1BsqvgBHXLUw0RIR6p6oeQZpr
	 bSDD9kxUqQarTSKLEj/cdMNGnZGzBVrsaxbjFrUxMURGQ5wMy79cu1yx6u9UZyY3a7
	 MouiD9fip+7fA==
Message-ID: <e265a659-c2a0-7736-ad9f-c6fe8fce5432@collabora.com>
Date: Thu, 15 Dec 2022 10:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: jpeg: refactor multi-hw judgement
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, nicolas.dufresne@collabora.com,
 kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
 maoguang.meng@mediatek.com
References: <20221215093026.12322-1-irui.wang@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221215093026.12322-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_014532_510375_7BFAD97C 
X-CRM114-Status: UNSURE (   8.19  )
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

Il 15/12/22 10:30, Irui Wang ha scritto:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> some chips have multi-hw, but others have only one,
> modify the condition of multi-hw judgement
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>

Agreed. But this needs a Fixes tag, please add the right one.

Regards,
Angelo



