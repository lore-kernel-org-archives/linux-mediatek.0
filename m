Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C5EC7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 07:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qjQBEfmXPqWDRFJp4LYlvSd8qRNzWf1l9WmcN5Styh0=; b=pCvwwJOcxBEaz++NyICYKsOPU9
	7t6Xb/6h0rKo+axuUXV7p6woMmX6NVHKE/1jVsoiHlRRalrwAO45rc0g8Za9kmzbpGV8h0imH+R1Q
	lMV9e1yD5vuQXeCiMUqpR3bLa8DM1cxCkqZ00sugBhrL0OM/RCwKSfDE1Ut4swAvALUgm05DYVAtS
	jBDHO6cdwBMvs/H85deqnSZ+A/9W6wR+8yjrfLtac2PB4tN0WShMtQXF8g0fo0vj08umRLCnkoT4l
	6DUFFi2l+5sC+7TfUyrh+PIV8DKk9wG3ezlEDLR7lLp3QDtt3I3YLvmXfkYmhqIAnhgZKNMfb/NR6
	Ixfbvt/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AAu-008Q8S-2i;
	Thu, 08 Jun 2023 07:35:16 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7AAr-008Q7O-1c;
	Thu, 08 Jun 2023 07:35:14 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 974AE6606F10;
	Thu,  8 Jun 2023 08:35:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686209712;
	bh=IyZaWaR9qhc4mrNBEFt94Tw+lZAMtm2D8C4nhenBrVE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qcr8LLU9FInLXhPCQsP6sKwvEnNtz71kQHPSgTUMxHNZtCCEDSTEHATm94pqY+P18
	 f1656ztRP8SoGzahCiGdcnSNCaeGS/lWO7PIVlx+dOUZWfKhgclKUmAjF8rt9428DJ
	 47uzdjxlnteSD9q+GSSTSrHzuh5gKOAxPvow+3x24wRg7KNtH+JYdZ28YynsgoyePB
	 YbfVDiMYru+brBs5Ab/s217evhAokViQFbFSacFLDnGiK7D/0X6jjDvQrvJL/5ht54
	 ygT4qf6nv0TDunChDSFQv6f6CooWot5YWP7VJEBL1YYI0JxshcXv4Glfip0wrYm+rj
	 C5b0odcUH8JOQ==
Message-ID: <11640ca2-a49f-49c9-ec94-d85e64c9ee87@collabora.com>
Date: Thu, 8 Jun 2023 09:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: mt8183: Add decoder
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Yunfei Dong <yunfei.dong@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230607205714.510012-1-nfraprado@collabora.com>
 <20230607205714.510012-6-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607205714.510012-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_003513_664575_B544E93C 
X-CRM114-Status: UNSURE (   7.78  )
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

Il 07/06/23 22:53, Nícolas F. R. A. Prado ha scritto:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Add node for the hardware decoder present on the MT8183 SoC.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Qianqian Yan <qianqian.yan@mediatek.com>
> Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



