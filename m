Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1929BC32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AqvEKFBn8bWhlugeF6G1nYUIkuGEZA4eSNJNEqXddg=; b=ENEr3e3QDxDJ2c3ih1pM3dXqbD
	+bCkgrhz4DBmQvxFguDvtH1eFJbhluIUMzqlF34VVOUY+xjQID/zyeSJ5POe3SWkGmXisHpjoFsyr
	3svEfZAGDgKY+UmpWI7WPOxS+snJrukn/Xn01E59On0FhqgurC8CBOueUX+Lci7EP6r1t4QC2pLSb
	3dCiMYHQjrIzV2pvAW69JhhzGEJFJAoAwErrOczV1cv7K/UMqRgNr+kpOFzWL6Cij1I9+JYQWTdsL
	DR/lM9M8sJLZKWVKxLsbPfRKDY3xp6g/ZOd4kRDKAN+4gzp321q+WY9TwJdRcN/A1Dam3cjlqqQR7
	JV/YnfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjOs-0037vu-Gk; Mon, 26 Sep 2022 08:23:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocjOc-0037nA-VW; Mon, 26 Sep 2022 08:23:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 94AA6660205E;
	Mon, 26 Sep 2022 09:23:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664180596;
	bh=MVT8E7UNgtdLeSEcxLBqZl3/eB+Gxp6/SNtim0tCYuY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lyh2zHvduqXNETNEkVDmrUWukno+cOit+7kVC5NFYqxwbXLtvFuG6tOJL3hrtjZP2
	 P0CjpFbZYS5+6Cbg5pk+IzmzqLBIIZpBxrjZTn+gctvuYzfIPnLKN1133FJv/sTNPr
	 55GlxNqPjtlD776T+OiVb2K0kRcF3r6ihtouKOuxTyagiKLnS2aOENmY7EbDrEmqLl
	 K4804CXvLI77afKIOEN+D186vR5EmziHVpZf4xqaflpGdunvygOeZx/XzenMeewvWJ
	 NlA75F+8+Uq5nIdaP1zJPAtHeyN3iiPqmXOT2snBeWfdKvbY+1wHMUI0rObuha4UIA
	 mc/sz+7Jer6KA==
Message-ID: <c9b2eed6-7f4f-ba37-8f21-6d6e18107287@collabora.com>
Date: Mon, 26 Sep 2022 10:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] firmware: mediatek: Use dev_err_probe() to simplify code
To: Yuan Can <yuancan@huawei.com>, matthias.bgg@gmail.com,
 broonie@kernel.org, tinghan.shen@mediatek.com, tzungbi@google.com,
 yc.hung@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220924024359.26949-1-yuancan@huawei.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220924024359.26949-1-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_012323_254059_51102678 
X-CRM114-Status: UNSURE (   8.02  )
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

Il 24/09/22 04:43, Yuan Can ha scritto:
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


