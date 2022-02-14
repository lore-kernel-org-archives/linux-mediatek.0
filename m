Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C4AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 12:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W349mrSZgZLQ4bruKHHsH/s5UxDxm4FdREp9mcdqT0k=; b=tSs5IH1lGEp3z1
	XyDlZBLMKYONFfM4txqHiJy1uUXsgEk4Re/KWNK+iFwUWnNawfja5exvSXfwuyopGg22EtbAx3dxW
	QePtKN7AqAqmYJkqm7wBWqUqLwCOXRNtWx9YKe/uwfFc5DimjXdCYAooxwjZ1MLYDNhBQ8o6TIsYE
	HaCCZrz1TmId0DjG4JugUMQUEa3sdoWwY6uOQ7ddJSuPPaYk93rajmrPq5dgl+sbTeulnCamoHk3P
	96DLcp0/HIOICoiU8JsPQgHj7Ze/IfopeeaVtSnmQk5u5Qzm2vathAXrOMP9MCf9DpfaSjWYRcZ5W
	QvlV1sBMOJPUOKYTFpIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJair-00FDo1-RQ; Mon, 14 Feb 2022 12:44:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJa0G-00EzCR-NH; Mon, 14 Feb 2022 11:58:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5E6861F438DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644839927;
 bh=8cN9fggBLeZHIC7ObN4/himXYzclTb/eCG6XMz5tAxs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oRgCnVqyp6odre1PtPBARC3do0X2Fjwi21iInARGcHlyCHIgLYYd44J375n6IkgxK
 4PixSUoSSuqqiaYI0Ph8Z53c07l3BUhsCvmYBo9PQYxLWShwzavYse184v8G/i2sjh
 /mOEnf9K0QKqVzgtLHlF7jF9IokVlmXQSOMUJfUeZel976Hhpvu7UGZHiupKshK7d5
 29Ui7JFNi21MU4ziijeGLqNKQJ/3w06tbFf1Z5Kd0HaWnbIW2u5IF43zRm/3ToCaoz
 o/4IWQO9bgOZ6BdESjR/OJCD2qa91mXZ6IwBO8f1ANMzO0HoWlcuvNGJRJZAoegzKb
 CgLntompS2AHQ==
Message-ID: <b22540e3-e8da-6878-64e3-04767c5327c2@collabora.com>
Date: Mon, 14 Feb 2022 12:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v9 1/1] i2c: mediatek: modify bus speed calculation formula
Content-Language: en-US
To: Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
 housong.zhang@mediatek.com, yuhan.wei@mediatek.com, ryan-jh.yu@mediatek.com,
 david-yh.chiu@mediatek.com
References: <1644400447-6215-1-git-send-email-kewei.xu@mediatek.com>
 <1644400447-6215-2-git-send-email-kewei.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1644400447-6215-2-git-send-email-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_035848_971390_99B42FED 
X-CRM114-Status: UNSURE (   9.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/02/22 10:54, Kewei Xu ha scritto:
> When clock-div is 0 or greater than 1, the bus speed
> calculated by the old speed calculation formula will be
> larger than the target speed. So we update the formula.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Change-Id: Ic0d9b8ab036bcf215d3a5066f2b91c7b8b128ba6

Please remove Change-Id tag, this is inappropriate and it's also irrelevant here.

After removing that tag:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 51 +++++++++++++++++++++++++++++++++--------
>   1 file changed, 41 insertions(+), 10 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
