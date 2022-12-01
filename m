Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F87C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+w2xjkAkAwueTKsnPAAzjGgOfM9pbBn6HnDyrivJKM=; b=KpDfZ+mCzgEguiyyzn5XqEQ4eA
	0CBA5zAZFJO3hoDYmHtLhNsMNBna4vLTahJjOKk9YOAISB9OTw87GloUx47mRI3TrpzO+BHAZHF+u
	gUa6ckwhAb0afGkzguyalG6nqyaEg+RpFdrNnhh1NZIEsamYqDaDhy3R/q9x0ixeQBuTpRuEIh8JW
	ChuJb+cLoQNDRPy2FjCaO3fPHvh7z93oyxVnzW1f1SghsMTYRfJVKsmGVibQhDphZPv95PRbxst9Y
	9enUAUZcwVg17xpksLjfNu+/JO+bsl4mST1DYsVKQn57EdfFNRgRAWj2u+rfDPXoU9YTH4r7cVPf6
	xzt+9afQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fF2-0061di-Ix; Thu, 01 Dec 2022 08:48:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fE5-0061BZ-2L; Thu, 01 Dec 2022 08:47:27 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4525E6602A81;
	Thu,  1 Dec 2022 08:47:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669884434;
	bh=TB5bLrpKXkDRMFvWFAAHuFF1CR0GtLXdKBtS2KeNsgk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=WdKKvLiDbZ5CL/lgLFU5onzxpqdklw229IC7HfGsRNaIQ6uOgX6IONurkSzOCHoeK
	 rxUavI8ph2aaXDzEWpIr4mJab/E/hBwRm8WEBNHpZ+0vYt5SNgZi3LUwWle7DQLtC8
	 QXCsnqZ3SE56b4IImBdljrDWT6pkObBJZtXL+OJP85fN4D2ILKsC2BpHBtMkMLviQ4
	 xvqa242prCZd7fSPGXwgqRuA5yr07wTVV1aTnyKwu3y1bmzqKz3FvRMVaZFCG89ADq
	 E8DS+tzoUVUs33qPwjWYstxgSzBR11dfF0h7mins8qs1Wi/IuZz16wbBrhZ0/waAud
	 pTjMmWysnytMw==
Message-ID: <eee83c7f-441d-997c-de6b-56ea351f70cd@collabora.com>
Date: Thu, 1 Dec 2022 09:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3] mailbox: mtk-cmdq: Do not request irq until we are
 ready
To: Ricardo Ribalda <ribalda@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20221125-mtk-mailbox-v3-0-c4b635052b65@chromium.org>
Content-Language: en-US
In-Reply-To: <20221125-mtk-mailbox-v3-0-c4b635052b65@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_004726_066332_4E09B14E 
X-CRM114-Status: UNSURE (   6.75  )
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

Il 30/11/22 13:58, Ricardo Ribalda ha scritto:
> If the system comes from kexec() the peripheral might trigger an IRQ
> befoe we are ready for it. Triggering a crash due to an access to
> invalid memory.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



