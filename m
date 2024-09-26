Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AA6CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 08:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5LSVu8jRkEWvVZm3dz45JbpTEmlGY2VIHQReDIMSSw=; b=S4Y8vIsnni5n31cAY6QcY27Ffy
	DEtUo/ji0/mR4PXvNA1P1VVAbDSSA6iAZws/RcxAC0PFtpZWPNO54yCM2Keu9X3LCdpGgQPAuK6gx
	4XXKGm5FDeczTwzFm0aFPHPw5aVTQr/gjfnWlpGciWbMkokXF/V5XapXJLXm6dcYJfO6bd/kMxp0b
	srtksElZPJ4TwhWt8cv/1snr2VQZBRokIH4R3A/ecrPoYapRUvU+59l0PLS3h44nhgpPI19n9GQwV
	+hCKtHN5grAMywwdD8KVyo/LdfAMQfYaSafr2s9TB5R+emEgzcVCQRhaKFqUnm3TQYwo4PpfI3Neh
	r7qPzatA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjyl-00000007hWC-3jlh;
	Thu, 26 Sep 2024 08:36:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjwO-00000007h1Z-1Olg;
	Thu, 26 Sep 2024 08:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727339614;
	bh=S6mhnUAdxSZYqgIm5tzaZNXTWNywHxWkmZKl1Y251wQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FVPK6/49EBKk+3yP4S0pE4zTe+I2NrFliN+vD9UE6G8k35VBezqT2yNH39ohqblFj
	 gnqrV8CU9G5hRJT/pPDfRF8Gg6kMcuix5bvALohHmtWVelaYtokCHpA6TaFZEZFhxy
	 jp2Dk0jI24vfNwkQPgpwsl98UXJHBNUBoXB6IbHYxnLp/tIOQcUUdl81jCjkOKEct8
	 kuAxyl4Jt77NMA6+6fPRgvXZLH53TF3A5BN1UdG8JTp6lcxVtYVzczT/+icVgmvAFC
	 Brg6QMctLCYzDLxXT0LydXsa5Cj2qBbK9sC8WSel7BojnnDhRV6WwCbjKn5Y2uwU3t
	 yQlA2D/5KGS1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7D5E917E1060;
	Thu, 26 Sep 2024 10:33:34 +0200 (CEST)
Message-ID: <e3315457-a969-4890-807b-50a4bd02a333@collabora.com>
Date: Thu, 26 Sep 2024 10:33:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: mediatek: mt8188: Add missing dma-ranges
 to soc node
To: Fei Shao <fshao@chromium.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240925110044.3678055-1-fshao@chromium.org>
 <20240925110044.3678055-5-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925110044.3678055-5-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_013336_771733_0B7BE289 
X-CRM114-Status: UNSURE (   7.27  )
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

Il 25/09/24 12:57, Fei Shao ha scritto:
> Add the missing dma-ranges property to the soc node, similar to how it
> was done for MT8195 and MT8192.
> 
> This allows the entire 16GB of iova range to be used and enables
> multimedia processing usages, like vcodec and MIPI camera.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



