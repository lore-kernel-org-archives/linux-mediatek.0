Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8260C77B7D
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 08:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixYXKW1weY/jUJPvVx8U//EdiWHPVdowgBi9Ge9YG8g=; b=oYz7DD7OT+OvYYJ1WyV5STTVYl
	9jffMRw5wqIPLgIxtlxhvBONB2rMq2sDoYvxA3KlbV/e8hO4gqMibYfS6YsKUoAMxB7ZPYdY48JMq
	CGiMzLj59s46H967MrNCxi7Af1/uzAm7sDW0f1j7l2HRxnUdZqwVXPrfILZ4pOMTR3EpdiEe4rtM9
	nLCa1PEQDABO1yTNuhiizjPr4sI3lOokV5EA5N2R7LNjKQ5Xydyz5dlOFGrshmoeYGVH1THaOn8Ry
	9Gxh4Kct+7uuOY9GqzdRs7CI3mzEZwBrblrhqOfHd/cFCB5DJDW3EBBeZkFNnp1hNio7zm03PAamO
	dQlLLBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1purGw-00A4YG-26;
	Fri, 05 May 2023 08:58:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1purGr-00A4XX-3D;
	Fri, 05 May 2023 08:58:35 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 69C326605707;
	Fri,  5 May 2023 09:58:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683277110;
	bh=vSczuqXRpd27PzucATAReL2YOYyw2x1YPKAjkBTjN64=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oaoXmrUzdzITM48AWpt/7Rw6iDm1F/bQqkqPra2cYr3ETQDKIbUYbfpGlqc1zTRMg
	 3Bh4vBXQSvmRwcOJi82tYqy1xa16Ngqim9nKWEe9ep2eezCctvEsIFGmabjboUavqy
	 hVMwLq+15Yt5jbySK8yduGPVkVg3JM6E/yYilQBz9si6ho+zakOAU5DHF83PDRuEax
	 Vkxb2x6sUP+mZm7vTkSf/VuQwLW1dbg+ri9yGk19GpV979TkVVoLwM3+iZWWHWpXQe
	 cuuiHVDup1QO/jZE8AhmUwc6gPWnMCa6x0UT5IHKGPNkbUyGWXgUq12yBfo9BrNmgz
	 DCQvp6pm6JueQ==
Message-ID: <d43816cf-06ff-f887-c4b0-9c3d68ba7d72@collabora.com>
Date: Fri, 5 May 2023 10:58:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 06/18] remoteproc: mtk_scp: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230504194453.1150368-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_015834_191242_FDBE9DDF 
X-CRM114-Status: GOOD (  11.86  )
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

Il 04/05/23 21:44, Uwe Kleine-König ha scritto:
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



