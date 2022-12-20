Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2B2C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 10:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuW2hqnb0a8CBcwNOcOFhUaWNdojMmGntpas0oOENBo=; b=ZiDXR+WxGbo2frhaLDRShFWhFa
	IvJlihTvUraPY6nJggD6/mrvUOo3Aojlx807a+vYxXbqD+kiDv/Lhdr9/ySPsHe7QFEnBAHl9E3yi
	C1ccImhKrbALGhHMqaBls/aTikKi06Yh118246RvaWevw6rw4GFJjCmIUJ+13Csx9voMbyeS/P3o6
	fvZI3miK/t47KZl/EfOoRDIe5QVf7Ek5PX7rH4XCZX/dJY7vhN2dUTFR4NziRA075nwsmSdCjpeul
	5yw4TQuwmDSKovba4iPDZeROdRUfB4fW9gDnYKySINi3fBEEoUcuacdJ7jbnVplZ9DYDv0PEFGpo/
	+u2JpeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZaT-00DBw8-TQ; Tue, 20 Dec 2022 10:11:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZJN-00D4fz-1D; Tue, 20 Dec 2022 09:53:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 491B86602CA7;
	Tue, 20 Dec 2022 09:53:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671530003;
	bh=X8hoapwEZc1dILsvgDGhhrYGjmxD0yFjqNZhtHPWXbc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YshjUpDyd0n3ET7nt4g7lY+C2qk+DkgXH4Tofsze0DDRRH8KZHTymjBrrHSPtahvt
	 l9qbNMqSRjnHe+kEVgmGgJk+C2auUC94u9skCcKQm9H/wVe2Fsp7XDw4VaiVagD6CG
	 CWB+YgiT5IqFN6aZbkDBJW4K+w5kbLoRxeZeWGLrnwpWWpuwpmv1oqjuWbM9VKeV1/
	 I1Zrbf0sRT2gzodU9Jg5DLe6BZqUP50bYMLrIYAAaw67Y5OJpx5sgnD5MzBg5RcqZg
	 GkvNe4KF21BviH+YmZCckqaZh7KuOWcHa46AOKXRwc9xv9dJaVwSnxidba2JcqnFBt
	 VKPW9TYBNXTuA==
Message-ID: <4c198fb0-48a7-2e4d-3363-7eac47a0d5a7@collabora.com>
Date: Tue, 20 Dec 2022 10:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [V2] media: jpeg: Fix multi-hw judgement
Content-Language: en-US
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
References: <20221216035247.18816-1-irui.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221216035247.18816-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_015325_384066_EEE4377F 
X-CRM114-Status: UNSURE (   7.53  )
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

Il 16/12/22 04:52, Irui Wang ha scritto:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> some chips have multi-hw, but others have only one,
> modify the condition of multi-hw judgement
> 
> Fixs: 934e8bccac95 ("mtk-jpegenc: support jpegenc multi-hardware")

Typo. s/Fixs/Fixes/g

Fix that, please.

Regards,
Angelo


