Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4552FC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pjv5DvvHKgNv44RP3scipYFC30LsYX86inZMPm5h5k=; b=xCSu0+yCu3a6LvDQhs9Q/7sqou
	SEnqXM5PvnMqPN7vN+miia8MyV5oY3SBjqH0kp7KlOwOSg5uST5+kPyj7u8fDTw6U0JhLGp6TCSCa
	YGjInL/j+zXsC/HhNKAqxlGRmHjALPpKcCfigWXO8mQL5DjJBxUp3OaMWCCPK4fBcuOM0xcy9OUFe
	LDbiSwLPZBsI1mE+Yy+yMl0+3Wyme12PM2ZAFJWdXheTTTtwCh+kGPnVmvmeStbPscyucMm/KZNcZ
	OzOsF4WAdRuQtxRUlbyckx14D/cgE+fkD7JFhbsVDHyMSAGLN7QMlvKhvpfZWuIN5v/XgWbrVkTQA
	/3XlKvTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KWk-008Ri2-12;
	Wed, 29 Nov 2023 13:22:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8KWg-008Rgg-1c;
	Wed, 29 Nov 2023 13:22:51 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 081D36602F2A;
	Wed, 29 Nov 2023 13:22:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701264166;
	bh=2GwNXRIpt+9q9FvXsEbR7BizaftPW2Q0mUCzKHvVuxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X5iBr2YaGQBHXYx+uhtK/eSaiK4+k+UUTVp+Po5fljskLOnTwdBpT3Wt0tFm71D6l
	 j7O3mutf2CTJ+XcySQlQyUQqoPdCRrKaV6sS03OGY5clikYvsITTxPItBcNj4M/ovv
	 nIFLZz0qmwie614SrWyTscWHK/6yX3JkJDHKU6JyXt8mn8Pt7Ta5OyC8cLu2wac9Lp
	 EwkUo/SY1e8mtfVVGe0Xxx2g5rIqymN/lKnLmJ2IsQ5cQSQrB6vbG4ye4AC7m9a/ii
	 YsUQ1Uykyoq/JAzCSUl4oClYQTslJAF5Ub4635WJPkvVGaG2gqeNiGQNrPEq80VGkI
	 tPvfBRbi+hsSA==
Message-ID: <c9881e63-a52a-4d14-895e-9a14d31004e3@collabora.com>
Date: Wed, 29 Nov 2023 14:22:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: mediatek: mt8186: Increase CCI
 frequency
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230914121035.17320-1-chun-jen.tseng@mediatek.com>
 <20230914121035.17320-2-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230914121035.17320-2-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_052250_701356_3C2D2236 
X-CRM114-Status: UNSURE (   9.63  )
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

Il 14/09/23 14:10, Mark Tseng ha scritto:
> The original CCI OPP table's lowest frequency 500 MHz is too low and causes
> system stalls. Increase the frequency range to 1.05 GHz ~ 1.4 GHz and adjust
> the OPPs accordingly.
> 
> Fixes: 32dfbc03fc26 ("arm64: dts: mediatek: mt8186: Add CCI node and CCI OPP table")
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>

You ignored my comment [1] on the v1 of this patch.

Besides, I think that you should at least keep the 500MHz frequency for a
sleep-only/idle OPP to save power.

It would also be helpful to understand why you chose this new frequency range,
so if you can, please put some numbers in the commit description, showing the
stall in terms of requested BW vs actual BW (as I'd imagine that a 2x increase
in CCI frequency means that we need *twice* the bandwidth compared to what we
have for the workloads that are stalling the system).

[1]: https://lore.kernel.org/all/799325f5-29b5-f0c0-16ea-d47c06830ed3@collabora.com/

Regards,
Angelo

