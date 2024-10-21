Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA63D15D86
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 12:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5YOO+U0FmtMIgtvvTsnJje2fpWUEcQSnO+Py3gbpo4=; b=j0G1sjDuGS92FnRxZ8rsM3OvPY
	Q8+xWbD+7s3MrmaGHgo4uZUOpECuLhelL+BM3hT2F6L1VpVfQ+QDVh2O4vgXG2wYoBH1Qcoqp7FnQ
	G4lu30JFQdBEwbAZVsWYe2DzRSF0Nkex3fE/Zn2jgFkD8g4CDVP4vERksnf6w6O1Wm1Vl+TQIesmi
	0t07jCURhVCmDkQ2lb1mHmHqORfxMhZjfcmDdI57Gyv6lpg5uBSURDpi0StgPc28zmT9EjZr4heIS
	5JUCVmxxpfulmtQKmp0WqAsUzw8yQywrcVp7PISW6RIqNTk+aOhdf37ZetunE4m3LjkIoZWrxQ0Tg
	hQdiSu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rUn-00000007Eob-2KLW;
	Mon, 21 Oct 2024 12:26:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rLr-00000007CGu-1WOZ;
	Mon, 21 Oct 2024 12:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729513053;
	bh=Q6FrehBPezcu/K5sUqprTUnBKcG9qqOb9+zf/UbhhmU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CVz+U6Haz1KNYI1ov1vdgJxaxNy5YKnGl42KGAvRrcSYHqEik+wwwwP+NVCw7k82/
	 D7AcF0QnMkE40Q1z6Mz26Y1S6AiT/259ZNmFE508JOqWe0UDGnDCvi+nClUzlSjo6K
	 7WtmXi9yVIjWqYJejSwogfRQ+aAO5lw3quhYR00Qh8S5uM+lnpZ/tBLQjnntZ6fmZd
	 JwGE+imTI1Bqz4WOkdODhPc0ZqNCSBnjI9rIaOGNC5SIGf+glHwzZq51fJKzjpT+IS
	 vB1FPqHdrnlu3fKfnlLEHghRq2BAFxh6OSbSs6KbeHdzVc1gTJjdSMjJyG1uzs9o62
	 J4+nWJx3cL/pg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81A9517E11FA;
	Mon, 21 Oct 2024 14:17:32 +0200 (CEST)
Message-ID: <219f2873-2ae0-437d-83de-ca7fb8d2751a@collabora.com>
Date: Mon, 21 Oct 2024 14:17:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 ethernet
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Jianguo Zhang <jianguo.zhang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Hsuan-Yu Lin <shane.lin@canonical.com>, Pablo Sun <pablo.sun@mediatek.com>,
 fanyi zhang <fanyi.zhang@mediatek.com>
References: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
 <20241018-genio700-eth-v2-2-f3c73b85507b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018-genio700-eth-v2-2-f3c73b85507b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_051735_597800_5C26C527 
X-CRM114-Status: UNSURE (   8.56  )
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

Il 18/10/24 17:19, Nícolas F. R. A. Prado ha scritto:
> Enable ethernet on the Genio 700 EVK board. It has been tested to work
> with speeds up to 1000Mbps.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Hsuan-Yu Lin <shane.lin@canonical.com>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: fanyi zhang <fanyi.zhang@mediatek.com>
> [Cleaned up to pass dtbs_check, follow DTS style guidelines, and split
> between mt8188 and genio700 commits, and addressed further feedback from
> the mailing list]
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



