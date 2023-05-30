Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930C9C7EE31
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjT4ymbfynMZwPjElDXIh8tDHck3Y3T2x43f5f0m9Oc=; b=3290CRuJvChLGfw0V74fxPauV3
	zntm3lliZbmKGhnp3G7P+whKNlxebFYNp7+tCqWcNIWwa9jP3rMkMWS+z+9C03pJINdX5xbHhuynE
	/MBktw2DLyBsoKXbcXDL53bQieOFjDPy2caUdyK93d/HF4qaqLwodiD03gV0JiGBRqMz3FnXysY1d
	POTkGNKXwrpPzeH88/GaGxUo+50aVgdb80bTrCg7NeAKVJE6ZfxqSMxNlhFrWU0S+wcAlmpGFHc6m
	B1v5rWIbf1NIunYLRBXp2M2RQe/WEFK8fjHFF5+jegdcdSSXXmpiLRCrfQNbc569XA88EdrtMJQOt
	bvLzdfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vah-00D9Gt-39;
	Tue, 30 May 2023 09:24:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vae-00D9Eg-2F;
	Tue, 30 May 2023 09:24:30 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DEE066059A8;
	Tue, 30 May 2023 10:24:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685438664;
	bh=UxXpx3aCfdtvsZ7o/sxTS7TMZU8J1MoTtG1QqqDdXQo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lRx5ZsdzzjoqMAlmwmL59/ih5u1B5vJrqmwj2EkfEfk7AESduFUHr5PZBk4ELoQy0
	 M4wDaPFfP2IJX79OQ5hn/HHtz3YB/czhA2YsNpuHswYxQOeE9OVDnQ06sFLTLHzZxy
	 3F8sC5SCftMnd3TEsZBzBCgEoj3by6Jkc2HH0CIFUsPwKL6mA0fmqBZogWk674oZsm
	 gMncP6FO7llvCrTwnqn46tZMExUQwfcd0fwGcdpaJPpVdL5WdkLv9sJtkqhm8aARvk
	 Wv8gn4m/sUcZoYF6qdyJvL451lm7NPGtpPezHoRr9hSI/6OtuaZ1G+QuOywY8/p0dZ
	 i+//3DFuoQ2ZA==
Message-ID: <550e2571-97b9-48ec-db2e-63e553b05d1b@collabora.com>
Date: Tue, 30 May 2023 11:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] phy: mediatek: hdmi: mt8195: fix prediv bad upper limit
 test
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230529-hdmi_phy_fix-v1-1-bf65f53af533@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230529-hdmi_phy_fix-v1-1-bf65f53af533@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_022428_914443_34FF34A7 
X-CRM114-Status: UNSURE (   7.41  )
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

Il 30/05/23 10:43, Guillaume Ranquet ha scritto:
> The pll prediv calculus searchs for the smallest prediv that gets
> the ns_hdmipll_ck in the range of 5 GHz to 12 GHz.
> 
> A typo in the upper bound test was testing for 5Ghz to 1Ghz
> 
> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



