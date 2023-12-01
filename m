Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C87C10F04
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 09:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB4cpVNwa83HdzY/7lWTMte8u5QXM18ZLDXr9wiMpjk=; b=YMXU3RNzW8GbitmMxZW3TvZu6f
	K0gDgmuSlXJO8uq3uiXREdw3oq6Jzmat8l8JkMPlzAWSAOdqDaXYiRVcw+SdUbETrzrTS0sJevRND
	9pYiZAj086wQcUz/sp1GB6N2poo1/XF60DA0W8ZDPnqZknGDtCp/mWdiYsLnx5Ox+n32PRxvbroMV
	FkhdizSx2HzOkmCS9gWSk++c0KM9nCy/bJDH0oK+g8Soq9WH9QombT5X2FD5Nq2MuYDQ6opFLGR8s
	PwCMREjrRrj+CsVzVI0Y4C33D26OzRJzKepP2l+VRt/o+Z5dOOHsSeE9csK0eK1VWOMRo1cNkIbIu
	G/neP8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zRf-00D3Bo-0X;
	Fri, 01 Dec 2023 09:04:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zRb-00D3A9-3D;
	Fri, 01 Dec 2023 09:04:21 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 20B256607394;
	Fri,  1 Dec 2023 09:04:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701421458;
	bh=nhnagN3QIK0LAGvvUn9dHDUJw+tv00vp1WX6wnM/hOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XEVG0CeSaqmj/V7PPVVh4yxVBrmnGN3m+w6BT1A+DSca6cl1o97zAdvOTJ9gp46E0
	 cX+Y6jm4mBmgY+eq3q/cPVpqiEx35E6jEzhEr5KqlrU+jaZ+Tn1Sp5evm2jSq42N5R
	 E77xxnafw6hEGmWbqVjXBbb5QN5vPY1AGcOmIQZBz6euZvS3N3IKLo3S3MncP1qxYX
	 yaJEvVLJP3l2cEwgBCEihflRNzTrs46/v+wxNgfHNxD7uv/MOmv2QzwPAFq3UqGFoc
	 QMHPFLmRNlmgz3vfJ0DRi5awn3EA12AJPkE9xF+i1BJGff4XI/AfkJTwrfH9TQhpMC
	 fA0GNCKkLXSHA==
Message-ID: <22cc8650-a24e-43c6-bf7a-700becc93a1d@collabora.com>
Date: Fri, 1 Dec 2023 10:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: mt8183: kukui-jacuzzi: Drop bogus anx7625
 panel_flag property
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231130074032.913511-1-wenst@chromium.org>
 <20231130074032.913511-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231130074032.913511-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_010420_159305_3BB7AEDE 
X-CRM114-Status: UNSURE (   9.28  )
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

Il 30/11/23 08:40, Chen-Yu Tsai ha scritto:
> The panel_flag property was used in ChromeOS's downstream kernel. It was
> used to signal whether the downstream device was a fixed panel or
> a connector for an external display.
> 
> This property was dropped in favor of standard OF graph descrptions of
> downstream display panels and bridges.
> 
> Drop the property from the device tree file.
> 
> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



