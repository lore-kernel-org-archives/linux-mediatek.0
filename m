Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633D3C76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7mHOFmc5l6uTKcJ8sUCzZsUCyEyugsZ+rVOQCpuawDk=; b=bxdeGpz//9Wq4SxFfNOlKGo233
	wlAlPYynxC+/Iw5yzzMzOZyeTVtJvYJ218DgH5adrCKCFFTLJqpzY9DeNZ9f/hmqr3mbkBNFzpqEz
	fakeZgjkMQdF/dVPruuikjszkMMHMNnT7+RdA7dnkjCkNCFPF7YCnkYTL9u+W7ZhGrBMijVorqXXk
	LbsE6+4HJPM8zj0juzOg1oQaGbBEgEQTBCgKAi2fRBsegI/NVLr7ThBZHpvrV7nu6H5upuLAYc1kY
	58mtACS0GddRgJtOToSsNp+pvXS0YMwi3fV9xYNvwOGMdWjXX1apqi6whtGkpltqVPvb9uCCpoFdS
	Kc20xWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJOE-00FIBP-2l;
	Mon, 03 Apr 2023 12:34:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJO8-00FI8c-32;
	Mon, 03 Apr 2023 12:34:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3F826602040;
	Mon,  3 Apr 2023 13:34:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680525259;
	bh=WZ+8Nx39Rp/m9vFoSmiThn76o4D764bCzW/1jzmyuvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DIvI2nubqGsWeQ47GMA0afQfPyuPAwb5067L1YPRl9AtFH9ORZ5F5GEy83pwqjUaU
	 RBZ7yjYjq8nTrYq1VuA3CjLxEQjmxObXDDZiewA3O+ZsIrE+LuYrb87V31fn6x1KaI
	 2bO3huqOAmO4zkYd+fridjwtNl5tZQ5IOPj6zbFuwuoLfMW4k5thoUna27QnndpF7j
	 peOxlwUzI9PuD05mNghoWFqP84d5jK2/WXOFBG3p73v8xqpxNDeLnZmeqq5iXvZHNX
	 3CTlnHSOwbvbQSMs/hx7sTbZleTk5ga/ZxAAmTWXA+AGL63LLiiw0k56p7Xm+H7XEj
	 YyCCACxeHEF5Q==
Message-ID: <0e3fb923-0e6c-d6a1-d14c-0a11fc580b1d@collabora.com>
Date: Mon, 3 Apr 2023 14:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/7] usb: mtu3: expose role-switch control to userspace
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
 <20230403025230.25035-5-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230403025230.25035-5-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_053421_107419_14557747 
X-CRM114-Status: UNSURE (   7.33  )
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

Il 03/04/23 04:52, Chunfeng Yun ha scritto:
> The allow_userspace_control flag enables manual role switch from userspace,
> turn this feature on like several other USB DRD controller drivers.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



