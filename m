Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D36CDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mq760T8ZQb51Kjh6L/3TumWk9QZMIZLJiTyTpaIx1OU=; b=g6h0bzvcTeVkc6QCmPLPUK5eVy
	9gBQUUazkMksniFQuCD+6D/rWR4zobDiJBmQ+RxsvKhwUaOp05OWb8bJXROk8qSkh5PsPtq4FrKUI
	a+qmqz5H9qfKgoYWirFUI1aq/Du6XYsZ6RgGxUVIYcYbn1av12OIKTKlh3r81aaoty2XBmLMT7Sqd
	Nv0eyRJ1WFvS7dBQEbSWO8wBSLYK+XdINQ8/yHjc4FzazGvE8/ZWMTt4H0jxqZkj+OMhuJ7cxwG1b
	5mRF/BnmZ8Ys55mWvQ7TTSKSoDDCoCRwk/vIROpAstPcbNQQjjvQ/D41evwvtNyiJN8rvEONNrDEP
	VqWSGDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqxa-006rHh-2k;
	Mon, 23 Oct 2023 09:10:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqxX-006rGh-2V;
	Mon, 23 Oct 2023 09:10:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 85ED466071F8;
	Mon, 23 Oct 2023 10:10:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698052250;
	bh=8SSRPDD/rI9f9UmV2sEinNETdurqi1qZJq4soIW88dA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iWSOlNSoKuvlmYYB4BVYaS85Z70Rh3VSe8E4r+uFawpyXQh5e0QqGbrz0TCJK0M6w
	 WNVhyUMFtnRX4fyiwp/pAY4Nf4Bh6Giodd854idOTHdeLh5cksRAnN3Jh79iGqZD4/
	 V1bivnZuPO9xYtUv/tF6wUStf/Uj7TbSd0hZTw3gNsvzQmXrHC9koxlK6kUnzvR0xR
	 vQv+5Wuk4I08myMwaH37dQC3xSqRtP9CNZ1+dUjgOA6hwZfBPCqOPmjuV8YWWfyiqb
	 tEih+HBTZmpVTIshJtP5EziO3dHC2YE1yenbm+K0MpVy1Newzs5POICY458AjNWVYK
	 GRO3yp4QjlKTg==
Message-ID: <5f9acc87-399f-48c2-82b3-ae17534e7c6e@collabora.com>
Date: Mon, 23 Oct 2023 11:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: Add MediaTek MT8188 dts and evaluation
 board and Makefile
Content-Language: en-US
To: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?=
 <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231023083839.24453-1-jason-ch.chen@mediatek.com>
 <20231023083839.24453-5-jason-ch.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023083839.24453-5-jason-ch.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_021051_949320_1AE54CFE 
X-CRM114-Status: UNSURE (   7.89  )
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

Il 23/10/23 10:38, Jason-ch Chen ha scritto:
> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
> 
> MT8188 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
> and 2 CA78 cores. MT8188 share many HW IP with MT65xx series.
> 
> We add basic chip support for MediaTek MT8188 on evaluation board.
> 
> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


