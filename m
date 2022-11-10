Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C370C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 09:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjNL9lqZXPJsMPQomTJqwXWyRRHD78kK/jkrhktmSYk=; b=0Pb2/T9P2EqQTVs2XhTlnbNfp1
	lFXT687pXRmFdXu6Vs0AJsQy5pES37yOcg9k3MStGpCjonR07z7ZYqAthNLjjxqtBPr8iqjWIoHJY
	SIl0HQ+B/HCPTG4DrDBuybS/fokvRetfltOjQKlUA3LaewKTsOECwhBsC+j5Fz7TsPfLK39rpch9H
	ZuzrVOI46LLnWOWwSv7uXzy9paMTG2I9/CeN6paqN1Ih52daqf+r8zJiaUxgHIv3dfxCWk2Ekj9gx
	FfqLo3RN/nNAK/X5ARkuHfFFCI/3SHshQqJFgttNsA4+QNXusbbn53oqOZaPjHOYhRq0xmrM7jVXC
	eKc3xF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3SE-004QiG-Ke; Thu, 10 Nov 2022 09:02:34 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot3S0-004QW6-VM; Thu, 10 Nov 2022 09:02:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B994F6602A12;
	Thu, 10 Nov 2022 09:02:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668070937;
	bh=ePBS862hPs4yf5c+mZnYpufOgVKu6Ts7nvvHguuCxDM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ndhZA3GFoHwv/PZPwd8KVeA7WW4XwA3owaNqgfUSS5k8gi8uYtm3HqCD4OxboqsXX
	 M7ydc5tijTAdmT2wPBlctu4DVMkAi+FSa7hqAB38v8Nb4j+n8WJd2/UVZPMWAZDart
	 Ib04DdwnYrW25DYgOmtfEDAuCXTTEI5luzfH4N+1Sk7PfBZk4h+FQmWDhDsZdEVtNe
	 VaooFsD30z90PnLjQrSwmS8d819tbNhiXOD9qAgnna7SY4mBN2FL3sN7hby8fBxJ/N
	 9Ntcq6hJWRwpSRhA4bQejaM15hHwU6hGcJXcLDyLxaBYpUUsXjT9hjxtaWmxq7Io74
	 2/cOMXxqfMHZw==
Message-ID: <a430f1c9-0d25-5771-6a9f-23f47daa3759@collabora.com>
Date: Thu, 10 Nov 2022 10:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] mmc: mtk-sd: fix two spelling mistakes in comment
Content-Language: en-US
To: Yu Zhe <yuzhe@nfschina.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, matthias.bgg@gmail.com
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, liqiong@nfschina.com
References: <20221110072819.11530-1-yuzhe@nfschina.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221110072819.11530-1-yuzhe@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_010221_163744_94FB2BE4 
X-CRM114-Status: UNSURE (   6.57  )
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

Il 10/11/22 08:28, Yu Zhe ha scritto:
> spelling mistake fix : "alreay" -> "already"
> 		       "checksume" -> "checksum"
> 
> Signed-off-by: Yu Zhe <yuzhe@nfschina.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



