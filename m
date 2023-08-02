Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F7CC00528
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GIOROGf7nsi06R9/Lt9IPJdN/Sz2xDv6zWdpHb4nuQ=; b=H9oSc92RIOaUI+eETxLEoUs30D
	akO6KHRarPR6M1i3WyEk7hqUIFMEoO91/3Udav4EZArf0GYqpgPyppzAvx74Bb2knGmxu6r+/PfEm
	79TusuZa0wdHy1Qi9KGJGTiVUi9q4pCuICtKmwxrkdCHcXybf/pzFYCaia17kvdOzH1DlKwSVBq7l
	FoioBWq5dH7e3C8rFkAgx8QAJ1VyMB3fUN2y5f8/pd0FnzpQkHCBQ4Y3U3h2y1YbUpCcTYfefiiiO
	BWfWPvj73NS7TIXw4JRBG4l7+2sxZTKyneoyPrslF9GarciJDgiJOSFPEN4vpYUeAZfNhlDkW37rR
	QJL3Zkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8hF-004YbJ-2o;
	Wed, 02 Aug 2023 10:03:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR8hC-004YaD-0V;
	Wed, 02 Aug 2023 10:03:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8F30F6607185;
	Wed,  2 Aug 2023 11:03:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690970581;
	bh=QNUoS1nkaqDteBmKu4yeaJCyte/W4BgCT/xXj6oe8+o=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=TgGj95aKjuqRnIkJVqPQSWhr/2CpazGKqCOROs2+oVooR+e0TBfKwBsKarzLtiwbZ
	 r/OQSVMbUT05fa4vzoNhxAZL5ayuCM1aB0yyAAg7OE7czHHeCxGllAPzkhZ1IPWVUS
	 yRQn9z8zbYryoKWHN5k+tgONyR2bOSgrJQgVGsRwNtefJ5X05La2JajAzt7nWR/z/C
	 aIZpKYdfj3CKjTHjCNlhQH/GGJ+YAGbMVIfb6UQ9uJ2Ws5BN0YIUCvBBClmQaazmOi
	 9Vc5cMFqMqFcy9tmsxsd1dbmBd9W0lsYid0D8Lxk8LBhJe6HEbjZElZy7gEjugRqet
	 GoHttZIOV4CHg==
Message-ID: <8c0db188-bc71-a5b6-956b-02d451dfa854@collabora.com>
Date: Wed, 2 Aug 2023 12:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] thermal: Clean up redundant dev_err_probe()
Content-Language: en-US
To: Chen Jiahao <chenjiahao16@huawei.com>, rafael@kernel.org,
 daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, bchihi@baylibre.com, wenst@chromium.org,
 robh@kernel.org, frank.li@vivo.com, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230802094527.988842-1-chenjiahao16@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230802094527.988842-1-chenjiahao16@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_030310_370791_313A9C8E 
X-CRM114-Status: UNSURE (   8.87  )
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

Il 02/08/23 11:45, Chen Jiahao ha scritto:
> Referring to platform_get_irq()'s definition, the return value has
> already been checked if ret < 0, and printed via dev_err_probe().
> Calling dev_err_probe() one more time outside platform_get_irq()
> is obviously redundant.
> 
> Removing dev_err_probe() outside platform_get_irq() to clean up
> above problem.
> 
> Signed-off-by: Chen Jiahao <chenjiahao16@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



