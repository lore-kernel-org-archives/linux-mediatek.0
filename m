Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C03C25B67
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLeBMVTdfRYKCu2dQk33/4cDCKj+jJy8KLOl0wkqOUs=; b=qBhgRZVzVOaL08oxiwvC1iBBOe
	M5LqzErAg8jwLhucsnCtk6dCo+641mEXryBXQqDyQ0Kh7NupSjyveAOzamU0D0vZC77s8xWMwyozU
	y1DuCqHoCc+dnM9OdjLnPM3RcTzJ4SJ4RqGlevADGzWAMwT/4sigqavY+qmJ3l22V4FeopcwPl0Ns
	2FMqerfnOOIbg8UcEn3V/kHVy61zD2UZSRLnALzTt5hT96CyI9RSldqLTXmPv48wk29s7w647rqWb
	mFRRY52mZa/qGANE+6tNrCoz7eZCoP0E86FaC1fFcNhSa7L+X+bf2c5zxwqwd6fue4Kg0e3ZlaLxL
	TbVVHrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHQA-00FosN-2r;
	Fri, 27 Oct 2023 07:38:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHQ8-00Fori-1O;
	Fri, 27 Oct 2023 07:38:17 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 67CBB66071F1;
	Fri, 27 Oct 2023 08:38:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698392295;
	bh=DgGVTQwYOc05LF24B2QUXGjysUMWiF3TtI2Qs0YjFcM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZR2Nz6hAxxu5Uas63sbIOcAedRm15V5Ue5AhV/eMbTiZgYMuGl7uaoIKHGb3b+TyV
	 jwAfSU8Y+UMkC3//ul0nwDj8t4uvFVFM63yxlSJ4r4Zk5zfPgGhLD311HiW4LXHGSt
	 YHTQH8yP/7BxrjJt9Lfs/QcS1Gh76U/BhBJerMujrr+kIDciFmPanYCk22oIs63hgU
	 7R2wDoMabRKC8iakEvxaQxYndaJU2gxZO1koMNwaJiAZiFrHLlVIHUSUGiFkyQqO5A
	 OMTIm/mFTAkapGQ8W2V1/Xi5euAV4M3mXQ3hgcB4M8V0uxy+/vSIYB7H6QOIvIlxvp
	 GHwTX/1kRN6VA==
Message-ID: <6f3c15ae-49b8-4cf6-a4d4-601cf2e079ee@collabora.com>
Date: Fri, 27 Oct 2023 09:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] dt-bindings: arm64: mediatek: Add
 mt8183-kukui-jacuzzi-pico
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231026191343.3345279-1-hsinyi@chromium.org>
 <20231026191343.3345279-7-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231026191343.3345279-7-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_003816_598084_56F2AC77 
X-CRM114-Status: UNSURE (   5.98  )
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

Il 26/10/23 21:09, Hsin-Yi Wang ha scritto:
> Add pico (sku1) and pico6 (sku2).
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


