Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD49C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6fO6PJSgF7qkqXLHAAVDIwUbaGbV1UTQvVg8sSQrsFM=; b=Xc/ibankexTki4YgpMV5JP4gNk
	JddBQtrU4l9s8HC1muAOZUkzWHbVxrBikmmNmRR0r8JadP8Da0FuVaxFEIpe9i/l7JBAFsc/NX15h
	/nWVloZL+C5/EsGwnvwWPeIOLH5B0AM/We7odctcC9jTPWpxLb/ktB+MG/sgt+9WlNjDQ8/hoZd+R
	FUOvORIF+Jf0wbhh8C8pVy1fPFkuB1/BYLN84x75nRFZ95pUEFjT3DbqoVoTg26sLnkg3KsXWon9f
	cWhcL3Rbjnb+rbgGJbycV0EX0UCSX3OlJn/f25C16PmEKmkZgahfyav/bCG69HsaoBRL8gxiWPFMb
	flnXZiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWrT-00H0n1-KN; Thu, 03 Nov 2022 09:50:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqWrI-00H0ko-7R; Thu, 03 Nov 2022 09:50:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 30DF56602910;
	Thu,  3 Nov 2022 09:49:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667468998;
	bh=4CpuV+XdMGlw8IhY60YU6dU/4TY7hgL/Dy2jeBCaZis=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NO+0Sni1GND37CMVheasUORCY5dOko3seUNX6BnzeVMjaaCQPvGQVAuaxg7fJ/HpD
	 t/sZhatvKR7Ny+tcUfNxdJswJQJ3CNb+d2zGnkFH+XI+9VdXV3ftkfAOkZaU/21G8x
	 v3wTS0lrLw0bNbxMfr3yRfR1WXLSHYQK8GBfcKZQW6O+FCs4KW44H2WN1Rpt4lcOIY
	 CLZRCrfjcnQk9rUHv/K1mVjf3fRNJ2SLaL3lDZAWRD1zZ9rLyR/lHIAEJ/OAxIJ/9W
	 qVBgV0++lH8h0DGSk45FOO9CEXacxc2dAYPXzN/pYDPFpRS1hMPdNKgeKqizB+dzmb
	 hnVx3c2dlebgA==
Message-ID: <e219b620-a119-74ba-34d7-e678a08b83df@collabora.com>
Date: Thu, 3 Nov 2022 10:49:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 4/5] arm64: dts: mediatek: asurada: Enable audio
 support
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221102190611.283546-1-nfraprado@collabora.com>
 <20221102190611.283546-5-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221102190611.283546-5-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_025000_430534_AFB27BFF 
X-CRM114-Status: GOOD (  10.67  )
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

Il 02/11/22 20:06, Nícolas F. R. A. Prado ha scritto:
> Enable audio support for the Asurada platform. This consists of the
> machine sound card, the rt1015p codec for the speakers, the rt5682 codec
> for the headset, and the dmic codec for the internal microphone.
> 
> Newer revisions of spherion and hayato use the rt5682s codec for the
> headset instead, so the codecs and card compatible are added through
> separate dtsi files to prepare for that.
> 
> HDMI audio support is left out for now since the DisplayPort chip
> required isn't enabled yet.
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



