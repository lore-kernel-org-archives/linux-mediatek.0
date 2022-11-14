Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904F2C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5K6A0L0JZNq3yAQww+MHHGsKakiDp2lvAtAckOC74SI=; b=kED9CqcNQL5aaZLsQsLZbS1XUT
	6kUuRcRlSCZRi0HGVI1oQpVqwrlMbmue7oKfNUlMzQNOh4RZsKPcicnJn30oiA5VBbtOoNblglGRL
	3KHeyWHYqufWi11b8xqz9n5ifTKhfeVXYzWMtWRVBeePI4gdr8ZcnGDmQqEaHUzbZqM02pv+DLPEd
	JzvfPglJcOs1Th6XoJbA3TBLSuvk00tgjBnmuDEuYn5G6FSmM4n9ZUQqmlO0q89KzrYRE++J+MpKi
	RLE0RnVcudnpfqHAxFof9knRwhCtixi3XH+ZFvdrF7SVGFGKEINBIpAK/xbGl2/4XkeduYXVDO1NE
	ogqZLg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXuk-000V8z-Cj; Mon, 14 Nov 2022 11:46:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXuY-000V29-5a; Mon, 14 Nov 2022 11:45:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 64D796600011;
	Mon, 14 Nov 2022 11:45:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668426356;
	bh=VIpcP8m4X82lXQoET76sr3P3jiNzV2en0eB+ullR1ts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n+fLC7P2I75e8nOalQ6pjVLSXAowKAJLdOtn7l3hhfN4WEiKWuwa8uuVEjgHagjLS
	 GpDzWHkwCSmbCkr34Rocvv5B7g9JvQ0rNp4uh9oPwdC6fFbm+r33ckFSOoIHB7c3fK
	 fjEPZX6qKTosqh+Ob/4zG3cteyfY3/iSdp+L/gpGymGJOEUWvXv/TFb198gxDtMM3B
	 ADcawvzFZ+96HHn+WkQX7xjep+wc/333EULQ9AD+ds1Yhx+iWWzLiDr9hbARVCPMX3
	 WrimRI3y6lp3p4bKLOtjSQKo3lL6TwHjX7UcESx5VoGPvfhfQ7MDe5g7ZGFCFcqZ8b
	 QY5xW83/k9jxw==
Message-ID: <d0287dba-39e4-f0a4-b28d-f1cc4d8ffec1@collabora.com>
Date: Mon, 14 Nov 2022 12:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 08/11] arm64: dts: mt7986: add mmc related device nodes
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
 <20221112091518.7846-9-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221112091518.7846-9-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_034558_370348_8FEB3AFE 
X-CRM114-Status: UNSURE (   8.25  )
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
> This patch adds mmc support for MT7986.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



