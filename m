Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DC9ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 06:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ooqFofFtjRc/xnXUGoNOFwoqJs3pOUj2ZUdPYF6hHg=; b=yCCWvL6pm4qqmy345E/5tX3G1g
	kRyh+FsJP9QqvexKgZnt6XqfLnIIprZB8MRRQZdj7hMfK1qfbwLMGcpm/QED9uG2/ggdIyAAksKT8
	Vkkij3uHlnCmbBvS71Y695Qjs0TNDD6TxmEYSeVCkVUOb9hj27UU3XObFsjwkFrR3BXVs34dQBa1+
	PgbMrwyd8wyrtmAY5wECGpzltVhsBH6mEgiqdSpfV4iAREMaYHgYfk2rPOQiOd5BJCmkQ5LpkKy7w
	z1G0Ts5qPQ4kd2D9o5/wSX09QC4HSocHT1TJlchd7rLh4/DyaA8TBUy41/qnLQJv9u0+7XN23UWrp
	5bk3yvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYilE-002Hh2-Qw; Thu, 15 Sep 2022 06:54:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYikz-002HMN-LK; Thu, 15 Sep 2022 06:53:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 26F0A6601FC1;
	Thu, 15 Sep 2022 07:53:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663224831;
	bh=6Txn5ld1tzrx/X57koJu/K1mXgPUdkwF0i1XHNrA1gQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e8WvwMMrjKXPwdLdAjhOKDvsTih9xWtESCNoUcWtVg+mXFDDvL+AEDD0nfFO06Qt/
	 Nod8KqB3sCSIIa9tZqx9f1nXeWIAdSSL3M8mWmie3LJs/bMY9Uv2foY9tITP+vv/k3
	 u8irgrtUdZye8EN/tagemfqDKV+rDROqOWnaXYlfv9CdlJ5kTAy5KniPciyJ2B62Zt
	 LvoNBlrOBalU66W7TCVtPWByMZ/gO70zR+2VsDfKSghBj/Ingzrg+aT8b2VG+sWXLT
	 zaG9y5+nPeZJsal+YkFKRL9I+2//DEAE8baepUun4yWd0X6QA4omgkqmbCmuhSsD2Z
	 nkPtjp5w1z/yQ==
Message-ID: <0391732c-9ea7-19c8-0f06-4707611a5bf9@collabora.com>
Date: Thu, 15 Sep 2022 08:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [V14,0/15] Enable jpeg enc & dec multi-hardwares for MT8195
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, nicolas.dufresne@collabora.com,
 wenst@chromium.org, kyrie wu <kyrie.wu@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com
References: <20220915064337.2686-1-irui.wang@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915064337.2686-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_235353_939239_99715082 
X-CRM114-Status: GOOD (  13.72  )
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

Il 15/09/22 08:43, Irui Wang ha scritto:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> This series adds support for multi hardwares jpeg enc & dec,
> by first adding use of_platform_populate to manage each hardware
> information:interrupt, clock, register bases and power.
> Secondly add jpeg enc & dec work queue to deal with the encoding
> or decoding requests of multi-hardwares at the same time.
> Lastly, add output picture reorder function interface to
> eliminate the out of order images.
> 
> This series has been tested with MT8195 Gstreamer.
> Encoding and decoding worked for this chip.
> 

Hello Irui,

I may have lost some piece of conversation on v13, but as far as I can see,
both series, jpeg ENC+DEC were picked by Hans [1].

If you have further improvements to that, you should make new commits and
not a new version for the series. Please look at Hans' media tree at [1].

Regards,
Angelo

[1]: https://git.linuxtv.org/hverkuil/media_tree.git/log/?h=for-v6.1n



