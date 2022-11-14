Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45307C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LC4PplfttBicH4TQexg8x2p97qLK8pM2TSPv8JgWn4Q=; b=2EKIpOQV3ML0p9sQF9hq9mLN8z
	uJr+7kJp80lZGjqohWOXl3pOOVlboSU5AzqN0ykLOkasuZ+DbM+aiFqxAToELiZ35nHNm6aApqNr9
	xA7SxR4xHwqgnKJuNxfV/2qRNrCKeVC994yR03WJ17ebpOrjoMVbiKLJ7WGMWr2GEi8NVNhCBYJZo
	Ncwv6Sbotf7bFhqVRUiiB5FITm9VUWJz6PcazCygLFew8wsbFiWQkb908Kiw6N9Tt6w/gL/PXthBw
	LN8xAQxbzWCUKc8uXMry0ols1sFJ0mKfFcU5+n/ILlj5qCC/0i4mg/slwRNT+009MGltBNA7glQhd
	ttVj2mBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXwP-000WfL-Kk; Mon, 14 Nov 2022 11:47:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXui-000V7R-G0; Mon, 14 Nov 2022 11:46:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 20E0B660231C;
	Mon, 14 Nov 2022 11:46:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668426367;
	bh=xOxVF6bEDVVc0lqqZf5LHER6o8U+tIDudxbp4DKzDa4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ai723qjAtnVynMp5Y6gtTFzkd0rhcHHpf8WIQZpqBXdXo5aLgItuo/MBBA5av4sqs
	 j06knqS5mEbwsRC5kPSZ1QAwGVKy8Bf8iwAb6wHoSTkjIHj8eTlOr46X3NGprNbth2
	 L0VOgxpE3vANwMOVGsbhBaDRb1FpLsHrKE1Noo9MRrg9j6FMnZU61oksDxGmuHvOqw
	 UWvhlT7aXeyxJBWBv4OCmW61cY2frK0qi6jvxicO738g+6/UxKXEEY/Km1DPHAd2GF
	 R3WaSN5ox4P/kyuBomeI6i8j2Xrc3z5lBMTe0CGD7G3B4KJs/cToTNpD9JjW+seizv
	 bdjxjw+q/QAiA==
Message-ID: <23b9298e-5e53-122b-a1f1-e2f9af4f8e03@collabora.com>
Date: Mon, 14 Nov 2022 12:46:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 06/11] arm64: dts: mt7986: add spi related device nodes
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Bo Jiao <Bo.Jiao@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Sam Shih <sam.shih@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20221112091518.7846-1-linux@fw-web.de>
 <20221112091518.7846-7-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112091518.7846-7-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_034608_704031_E3EEC035 
X-CRM114-Status: UNSURE (   8.43  )
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

Il 12/11/22 10:15, Frank Wunderlich ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This patch adds spi support for MT7986.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


