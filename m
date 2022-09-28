Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4C1C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 08:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebAts2j9+Ro8lP/dzczEQrN4XVAeKns66KGgL5wiCOM=; b=fHOM9vhNWh/2z2C/Z6J9X2jKqB
	2mXHgUFwGKyoegfIz0HUaa4BQai7wKIRx4LqBc9S7FE+L1MJdp1MfcwKXWaIg3r88eOymQUd+Q4kX
	UhHH1xFK790JNcZNGeYFljcK8oZqIasEjYUmdzg6ZVwHIbsBMfSsdPyNyEE0rVMYMJ2nR34+bglFI
	d3WQiI9V+kOXiYwyUDchrx2vwuHmWLQTCnC+awcOvD7CD+dSEH1YPOeDcfcFb0sw+H/KyZxNzJ4tB
	ZOif7HcvKnetgbMI0CVKKDid1qahtFURnwkTTrhT5DZMLb3eZKBhOomvSXMHo7EPDHKjFLltRyvf7
	g8oRmTKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDm-00Epln-N0; Wed, 28 Sep 2022 08:15:10 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSDD-00Ep6T-BL; Wed, 28 Sep 2022 08:14:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FBC06602285;
	Wed, 28 Sep 2022 09:14:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664352874;
	bh=lRvLyIudWqsbybuuWakkg+Y6brs7AKx9jJ8bLhytdm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LnZyxilxcUzj9f1kwbBc+BOP0GE+WC5bxJCJraPlBRTg1aWBW4JB9SIWAwe/nvf1P
	 Yjjbs+VHLKEOOKW/9fRQM7NhR0v4lclHaokGnIlmnxbnMRvLWF40j33aJcdosqxDJq
	 3xlqIowBbpw6gh2nauYwLYPkakH/E2bkZnaW1x/aThtq2KHCYsr2QMQNg+Jy8WEXvn
	 O55GS6dY1IqIgUjXql7zRokjKv6scR4INvRn4N9njn8+g4FludkdePsO3rktjCeB63
	 Xk18IJOxOOcSj9JHf8Y34kTxoK1KrOcyDZic0q8C6DSkz8uxt6uethTrQoIHot/oPq
	 42AJD2NIidqyQ==
Message-ID: <ef3d8811-eea1-7bd2-2a4e-0ee468b0954f@collabora.com>
Date: Wed, 28 Sep 2022 10:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 5/6] drm/mediatek: add mediatek-drm of vdosys0 support
 for mt8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-6-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220927152704.12018-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_011435_546320_58EC3722 
X-CRM114-Status: UNSURE (   8.39  )
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

Il 27/09/22 17:27, Jason-JH.Lin ha scritto:
> Add driver data of mt8195 vdosys0 to mediatek-drm and the sub driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



