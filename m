Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7490DFA373E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 09:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUgqaVgGBJUAIWPP0Zx8Hu0KAVGa990bcDf02Jl5Sx4=; b=085hNFqCLoWUwkWvIuhR3/wKAg
	ceGAwophi5J85PARciIWmqXt4bin52bDFmQ/kkkbnkQUWgK/fT/ke1QgSWvhupE84sF5PAvz2giiN
	IunwUYY4KJeX2UBQ/hAMvxd3eXvZnkUkN2vRbCLqV+Uhgtdr3TmERk28YpbzZhKcs7PLBzgkraGCX
	u6Ljfo5zyKw+A/8Rl1yp475fafmLa46WkO22KfPiWx3qFCOkrcIv2xdiRGSp/oqMVaVSXDlA/XS9Q
	gO5vQ5ieBohDMPQgnsA3HqNOhrYlx8FMi0RrlLid5JQzJio9YDlGAxIOV5+2fjtdbdEHaPwYEPVmR
	2WFs7hWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onGd4-004ewg-Mo; Tue, 25 Oct 2022 09:53:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onGcm-004etC-4U; Tue, 25 Oct 2022 09:53:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B92A5660239C;
	Tue, 25 Oct 2022 10:53:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666691605;
	bh=7sqWmlrQ0eJozSQq6glqhBf0BoFUn4lafxzq4xWkqCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BvwZaP3mClff5CQ8gv7AHVuMSW738U7Wv1esLQ5GFtk5hijaoBWAxbLdGKYxSlxLe
	 9Yqk7F56MckdgQVReydedmjjdbm61FP93GyqhzgBm915wP87IOeegeEkcHeKYuRbF0
	 OZz3fr9LBOvFhrrFy0N83w9/2UayfTTT7kHCO0n9bG/1i6NqmDb5/uNwz4YiPkX1na
	 BEDIHHYdA9EFC+ha03d4Dqgvy8r7AonurlLpc0s8YGlta3jISPVATO6KVTQ0SyesBZ
	 QJJ/KQooeXKA3lTSnQ4TzKmqP7ikkRWem/aE5lRrcG/YuRNdTjy/Jsu32L9CWzBXRW
	 jGOk6nHInqKuQ==
Message-ID: <8e7c2a65-0be2-fdb9-6824-87d8e83e8a5d@collabora.com>
Date: Tue, 25 Oct 2022 11:53:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 2/3] soc: mediatek: pwrap: add support for sys & tmr
 clocks
To: Fadwa CHIBY <fchiby@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 "Zhiyong . Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, Sen Chu <sen.chu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221024131544.31219-1-fchiby@baylibre.com>
 <20221024131544.31219-3-fchiby@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024131544.31219-3-fchiby@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_025332_358525_8ACDCB58 
X-CRM114-Status: UNSURE (   8.96  )
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

Il 24/10/22 15:15, Fadwa CHIBY ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> MT8365 requires an extra 2 clocks to be enabled to behave correctly.
> Add support these 2 clocks, they are made optional since they seem to
> be present only on MT8365.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Fadwa CHIBY <fchiby@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



