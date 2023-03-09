Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E650C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 11:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSQgkLdXUSQAm8boB8blQYDzq9z9kqgWy2HsszYGSMM=; b=e1IzhKUdnneGgcaf7wLxCIq2Z6
	HhRDtfcGtQ+XAMXd9mYvQWJPA+1z8JfxGlVOvlQy4asoQdhT8eHkloW6fsQx2J3oP2Cc+hM7aSgeR
	Z73SjUxDcbrkDs+A3Y66cDLNfJlfm4JRmWN8Pm70HGM7dul652U1gJj8JU4Tsgq1n4UNbLJk/UXWk
	Ma0BMaa+YZviZo/JegcAez751aTv9e1qhnyeOQ6ficPskAaId5rtv0d2lJkdnNozM4zxeILECxOK9
	EswdNMfywUJtOU07GZR7kvybnMr5GRgxDyjAPqjrOxpaGXvpLnOkNoQ9JUobUj82PSzA4zJwA09vD
	nfpWotIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paEMz-009Sai-3o; Thu, 09 Mar 2023 11:23:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paE1c-009I8x-KS; Thu, 09 Mar 2023 11:01:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05F3D66015B7;
	Thu,  9 Mar 2023 11:01:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678359691;
	bh=a2meVte7p6Cv8h2xVIKUhZLH2w5dCdYS15EgMnOqgvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B0ukaLUoSvKBu6ZuvYIbBB5XKskdl4LS1iBVTa7/YV1F31Q6n69cC+1WSB+Ogw2QW
	 /ZBchPff6t81EgIkB5FVmo4YUu5qBh2L9kEGblsGs9niX+nImCSwtQz0u/J2IvnzFE
	 m1lITlDzal/YdJTsB2s2Sak5n6M6YfZtdKPUWBfyGJuIykG0T4+yIWK2vABnulK50q
	 zu7zcfE6CIQmTtEO+PF9ianDDOFuQiwobHSg/zUnUlToyHI22vO+lz527XoOk8L+hQ
	 MIhzJzMWbjYU4r54qJOv8/ggQxho1fBUL01QFb+1Kro2weOuTFmq7J2QczTg5uVDv8
	 Gd4/VmYm11CTg==
Message-ID: <61c022c5-2324-f5d1-8e16-7cb218a841cc@collabora.com>
Date: Thu, 9 Mar 2023 12:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] spi: mt65xx: Convert to platform remove callback
 returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230309094704.2568531-1-u.kleine-koenig@pengutronix.de>
 <20230309094704.2568531-3-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230309094704.2568531-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_030132_848983_0EEBF77F 
X-CRM114-Status: GOOD (  12.83  )
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

Il 09/03/23 10:47, Uwe Kleine-König ha scritto:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



