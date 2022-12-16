Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D87DC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHIWomkgsUT+TpJ4x1tyGIxow8khMH93HmYXTdPG+WE=; b=sNs9jHa368RMJ/cT8P/keO9Qsr
	WtlUe5NwgnO55/wMrIrm3qUROXZd5CJfgWSyy9bSDw/gX2PlGezGxo/Nt/glR5UMtRzTg57o5t3SP
	rokGO97DbpaDAVwmAfdQUaagaPQQ86gsbUuBef9hqGTq3TSOBfJE4iUQKtT11yknPuv9HlttDsxok
	OEziY+mw/NgZj64a9pcvnQVayQ4CKgbnapuhzF4mwHdQBqIbEU5Qie6KSlcoRljwgJpRf5xL2bmgu
	NTTi0jP4dAk/CHUmeSrSrCntfHZ+kjcAq6oUn5cxc6PaA59pvqXHcoZUegvWEw0c54fN6E3tMq2S8
	k2Rh/5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p699C-00EcnJ-IB; Fri, 16 Dec 2022 11:45:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p698s-00Ecca-SN; Fri, 16 Dec 2022 11:44:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 56FE76602B74;
	Fri, 16 Dec 2022 11:44:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671191075;
	bh=9FOgDd4/w3LhYrSJSsSEQkEg36NGnFoRWb8raYMxkxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kFvnqfl/trkDOD8bSFrxnsNwnzOLuBdFRsET4yLC1IqQHBW5bJ5lv8sgG4Z11yuQC
	 ceeT1hFjwROZFO0OpHU+bYYJBtzYcSM7zbC5NBjQTCm7fdBNoRx9AHLVppgBAqBlVk
	 CEB9g+B5qa6gMFhb0hbNhYhA4E0y458z9w+MouUKzo6zu7wfWD+l2FB/V0KGAspg9X
	 b72nQQaFJLLQ/Y6mLzTiNwuSMceSNlf3gdToQ6ayrxUkOnAUXQxh4Fy7Rz2Zwu1JqU
	 G/7gdNzji/KMmYWhznDQ2ip/6sA46MsbI/wZR6z/RfZAqp6+fWA/ioiZWBYfcdXYa0
	 pnhZC4Cn7YIzQ==
Message-ID: <64296af0-e2b9-6f39-7dbc-6e0120f96fe2@collabora.com>
Date: Fri, 16 Dec 2022 12:44:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: next/master bisection: baseline.login on mt8173-elm-hana
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 kernelci-results@groups.io, bot@kernelci.org
Cc: gtucker@collabora.com, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 mingyuan.ma@mediatek.com, libo.kang@mediatek.com, chengci.xu@mediatek.com,
 yf.wang@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>
References: <6391e1c4.170a0220.b562d.3c9c@mx.google.com>
 <Y5HrIhEfuEgGKuMB@sirena.org.uk>
 <ff000931-ce9e-f413-1540-ca2edf393362@gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ff000931-ce9e-f413-1540-ca2edf393362@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_034443_183703_293D6774 
X-CRM114-Status: UNSURE (   9.97  )
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

Il 16/12/22 12:42, Matthias Brugger ha scritto:
> Yong, Angelo, can you have a look?
> 
> If not I'd propose to drop the series for now until we understand what is going wrong.
> 
> Regards,
> Matthias
> 

It's fixed already, and picked upstream [1]... that was happening on more than
just MT8173! :-)

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/iommu/mtk_iommu.c?h=next-20221216&id=462e768b55a2331324ff72e74706261134369826

Cheers,
Angelo

