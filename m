Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0ACBE7D26E
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeTyxYCQYChYnnbDlD75iM3dl+MlAjVASHMBn6Q9X5E=; b=HlKFEuiubKAvg4ysa0qcn+3CwU
	t71TKQ7x0X2WpkBOwQMiWNoZuuju5g2j4KL+siZi08qEIS5hhrJFspRCvqlKj3xJYvbdNrRGy35JB
	7tphVRFLUj3xGoYT9f+YbrHrTKNeArlCMZz5V7HXwpOwWa1mvJCuUr4N3rMIs3+fppbzlV6Z0+vW8
	kW/HgU0M8dkqfyo1v8RzNotrG5ITZUIgZHqSZQLcNE5ylU3Uu6dvlQyv1MICw9EW2+QlMOVvihzgI
	S+VEj1n/z6fiUVMIX+bAuh5MfE/d8P80lk21hAq+y/xV3dAZiKO2mo1arZFWUH/qO3DsyZek4uXfK
	WfXg9xrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4Id-00Fxfi-1u;
	Tue, 26 Sep 2023 09:24:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql4IQ-00FxcA-2z;
	Tue, 26 Sep 2023 09:24:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 658506607314;
	Tue, 26 Sep 2023 10:23:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695720237;
	bh=ssfuBNR2PiLxi4TiFV2ZqSR5SVdNJLkRo9oKlebvEQw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cW7c5jDhuls+mD3trL29q7HBQecBadZb/c5mpADXdcWpqI8ThH4gxcTynR9pfijsn
	 k8uzNX3PnxUosg3jnhKiIeavFp0n0rvvh5cbh1hOV4LQKjSphvtWRXE4hth75i/BHD
	 0SM54hofqzMoZ+qawxCSI8q7r+B6oRWSCwQOcnJiDUAEcX4abp7AL/8J1qYXJ2mg9q
	 aL2KIZnALoJcI+CU8KwJRUVGSNCLd+BgsjlR9U2d6/vT3PpzPI2RexgfVNu/SnZJ9I
	 inQkm1TB+za1aXFbUlggJRz1b7uU7I0/Sh27IDbfAm8tPy3/CK9uo33J5PgN33w8Iw
	 8zoZS46BiX1fw==
Message-ID: <76a36e77-ac58-c156-131c-0c471565502a@collabora.com>
Date: Tue, 26 Sep 2023 11:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 14/40] soc/mediatek: mtk-devapc: Convert to platform
 remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <20230925095532.1984344-15-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230925095532.1984344-15-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_022359_091002_611B68AD 
X-CRM114-Status: GOOD (  13.00  )
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

Il 25/09/23 11:55, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



