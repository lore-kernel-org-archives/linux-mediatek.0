Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F6C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Nov 2022 11:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+k+N09V4JZxrBi/GrwAJhyQs/Tg0SW7nC4p0UdFG8w=; b=IIkcKBdKzAyEu8Hi3xkln9wrdC
	MwV+O8wqp5w0CpezgPYMzBlKlEqIcl106H5CgCvxa2HENvapyv9On0aaTlU9twDWK+pjpTdSgBeYj
	7MPtcRgvdAgypJsbpQWYQNWDhflWz14XCxHbIi9tgcym9jwsfQh8YhK02/MCUqoMuK6nyfQZsbggh
	M9uLQHb8zHdRT+YBEXeK22cFn1fwbKyblzSkrNXIttJzgLuTk6IjHFNHRYe/nbudl2GpBZUNWzdXL
	3rOtRllRjdsJDN94BkAs14yVQcrPC64zZz5eOregZz2fb6majkfu1NBRQ/1wh+XeOeLOh01Te6Bw3
	y5m2GlWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXhs-000PTF-Ve; Mon, 14 Nov 2022 11:32:52 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouXhc-000PLn-1R; Mon, 14 Nov 2022 11:32:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EFE45660231C;
	Mon, 14 Nov 2022 11:32:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668425554;
	bh=Seg+J/REXMKHgoEGjmRDEeF/wX05uAJ/2q6GwLx9/5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gq1gpDLBjMXZfYvpTd0gyUQfbajVu/iFeHkeX6M/FyrXIvYKdOs086toHnmY1QDUC
	 IoEjHd+Lc8GbngCu7gNgs+m3N9qbBSi3yu9jZJQHq4IjccSSNAld09GtyWjRnxPjce
	 SqD/2IJt6n7Fq9960THjFNITuJK5mvs7BhWGEDweEpABZBgNpw8gEp7B79G+rRpjn6
	 axHVSkWJOfxo+O1eEOghgrUotReG/aBdVhPte3KcdsPog2nOiP5WdimGv68VsojVQn
	 jq74Z8C3UnEm2L74Q/qI1aJ9LA8gZSCHe1dqh9OVNNVbz+Kj8+DyEM7THmXZrhVWv4
	 x56A0pUw/aqmQ==
Message-ID: <081238de-77cd-5d95-abba-8f2f3117506e@collabora.com>
Date: Mon, 14 Nov 2022 12:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2] spi: spi-mtk-nor: Optimize timeout for dma read
Content-Language: en-US
To: Bayi Cheng <bayi.cheng@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221114081327.25750-1-bayi.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221114081327.25750-1-bayi.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_033236_266181_31533984 
X-CRM114-Status: UNSURE (   9.60  )
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

Il 14/11/22 09:13, Bayi Cheng ha scritto:
> From: bayi cheng <bayi.cheng@mediatek.com>
> 
> The timeout value of the current dma read is unreasonable. For example,
> If the spi flash clock is 26Mhz, It will takes about 1.3ms to read a
> 4KB data in spi mode. But the actual measurement exceeds 50s when a
> dma read timeout is encountered.
> 
> In order to be more accurately, It is necessary to use usecs_to_jiffies,
> After modification, the measured timeout value is about 130ms.
> 
> Signed-off-by: bayi cheng <bayi.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



