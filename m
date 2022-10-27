Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958CFC67871
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU7i/6xsGaiAmJ8tYKwTGzX9Ry2qNfnJGXkMtBObWP0=; b=1lbtYpWX0qJrE5QWR31hatSiCG
	dQNBR8bhSXHbNzjuyZMWkV/8S8e7m9kfE0g9cD/anPKSU+wtsWcqSrNWaF4YCUXiwhs8lPzaQwEwq
	yE6Gyr0GqRaS7riQ88pP6dRAhErUB5KujS5vCI5xvsEeVZokc72oVgY/toswQposQ7Dr/cIF5i1Tp
	Z0nkjQwP8hO+F2MEuMLX35gIEvBwlSTjdpnF2Ut+9HT+B+9jJtnoQrlvR7CtKB46n1miJtA+9nBE7
	OHXqchVRvd6HwLs7c4t/EWUgHkOPM5R9R8JcmYY91JDfgaWhkofE7Ws7LNmvBYnL4yeyfOSo7F0wG
	UF4aS8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onyh8-00CUJE-EU; Thu, 27 Oct 2022 08:56:58 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onygw-00CUFd-Vn; Thu, 27 Oct 2022 08:56:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 43D8366028C5;
	Thu, 27 Oct 2022 09:56:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666861004;
	bh=a6cv56mnR0Rt8cN4YKAatcPuhZ/rCh1tcmynK4XFuOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BBuplJME/3Ry9esnd85HoFScshBaCRJ3gPCteMWzG5cHItSysPoYVvyTxm/ztzz5j
	 Wds+Y58IPW17ZCZgy6GmiEDamt2BzaHBGx2IEK478u4jtpMgG43BrFEauMA3tZu/Ei
	 DRA6ATGcfILQBfMyhPLBO+eqQ/oCMQlyXVlJuuPdtSv0E4KUqqIi2g/PPXIMYya+KH
	 k/7XwwTo/ojIVEYTJwoy+rCxNBRR35O5RNtlPrGiheqky5MKtOIUm3eq4VBfdn/FMA
	 gvw8IUQvmPi7ryZ5tZiY6MxinnS1cDRqmMG6e3fpPs5cpv4qIiP0jjxIODZL/4HFXH
	 raqDX+y8f9VSg==
Message-ID: <54b9bf61-3db0-c2ca-9c30-f2434573be29@collabora.com>
Date: Thu, 27 Oct 2022 10:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] dma-buf: cma_heap: Fix typo in comment
Content-Language: en-US
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: yj.chiang@mediatek.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221027072642.23787-1-mark-pk.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_015647_261030_D812BF69 
X-CRM114-Status: UNSURE (   5.79  )
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

Il 27/10/22 09:26, Mark-PK Tsai ha scritto:
> Fix typo in comment.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



