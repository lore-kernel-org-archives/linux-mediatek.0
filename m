Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE3BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lN+Q7nM6/KgL9LKmJ5zQ2yEGLg6vRFer2YFr722zFIY=; b=39v0YxQwoYMFhOiFZBU0iVSfYj
	23U5Dm7/yBmIjQkvWNu7ui4Uk5CUHj2Vaebgcida9cb50IXDVcd8jiP/rOLhJzKmoefR65TSAC/SY
	IOdh6fEYpUp+XdMdornxmVJ4/X7Jizr+KmMu+QyRTSeEH4Xg890eo0CB/FMTe2Hes9bzcBONo0Lfx
	QH2V3+qqDHuNzGLOYOmjYuoaLvRrtDuENC6+HEMSyTU/vG/LRs68HVAf9zH9nrWCP2F3Efho55rPX
	cRIlZ29V25A9U3ujIHKVRoukGcwy5lsDBiSDBfkOpit+RwuxmslTRpEo5EUuGYx2EzARlQZwK/Lyn
	A/zAqckQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSb8e-009SYf-QI; Thu, 16 Feb 2023 10:05:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSb8P-009SQQ-3r; Thu, 16 Feb 2023 10:05:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1392666021A0;
	Thu, 16 Feb 2023 10:04:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676541897;
	bh=Vb8SaZM73jWuHJvZxkrtKegP9d55uT0IZ/zsS5ZMtJY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=i4mzY9hpGDSvNwDyRGvNXHlFtxM1Y4IQN1mBJrjkE+nJCZB0aIvLSf4n8/Za0y4gl
	 0rx9Gp1cT8A00TOyCbg8LmTaZ78xxPDThQYniFtfgGMvmfL7yQqW6hHwqdijiNOZGV
	 YnY7ESzPR9E2EMFM/3Cybflnu+Jzg8/yJEl/Qja7C1hMEaqe1A3RIyadgjnc/r4LZC
	 r3da7hxsbwEgr0/LPug4angA4QNsR3MSdLnVX4uvLYsPl1sTGy3i262l+LxxwZmCib
	 b5UbaopGi6JED4MrsRxKOpOB/7s8eNacbKwOuMHQyDQOgQZtE/KIQg4kczHd5AkA4G
	 QrqGdwgwYLZ3A==
Message-ID: <b260ad62-58a0-0945-483a-5a8d81ecf428@collabora.com>
Date: Thu, 16 Feb 2023 11:04:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH RESEND] dt-bindings: pwm: mediatek: add mediatek,mt7986
 compatible
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>
References: <Y+zfb2uQyKHng0kS@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y+zfb2uQyKHng0kS@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_020501_350491_FB8B03BC 
X-CRM114-Status: GOOD (  10.39  )
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

Il 15/02/23 14:34, Daniel Golle ha scritto:
> Since commit 241eab76657f ("pwm: mediatek: Add support for MT7986")
> support for the 2 PWM channels implemented in MediaTek MT7986 SoCs has
> been added. Also add the compatible string to dt-bindings now that
> they have been converted to YAML.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



