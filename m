Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B92C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 11:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXqYkUPvi88vYbk/UA5jhQdKMyF0ynvRGQZMKUplbV8=; b=AsfNHWDCns7RZyBWm5QRN9UjIT
	Q6PzMixM++dT6GrVE4pCcoKOMbbt2n0MrioXcno518OZ+FIksnk6R6lyXkbfKmfYi/nWzV90HBzSe
	t0d9OYV+E4kNN99ntTG4MeGd+lnS4KD9kl3qZlsJzlVe8GpIvo1QOR8P0ovQZTW7oE3DIBs1xXJKU
	AHGQT1mOsACBxFjk4jDP5WtmBA1nVlg5WSPyRZ5c4QTZAIEMj4GbaAXnpMXZ5Sgso8719/F9lypRG
	9Is0rBng9oyXoeZl1x9F5SRPO3jGjWUuOixMZ1xFv5uVAXqePh/leDIsbRYO/DxaoLLLjuf4zp/wb
	K1ct0kXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6t6q-00BAtq-RF; Mon, 10 Jan 2022 11:45:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6t61-00BAK7-U1; Mon, 10 Jan 2022 11:44:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1EC331F436F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641815056;
 bh=sVloC0dkqoMasFv1fJjOkQcxMXUqU480+H//BOCz3X0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=gM6CRcbhHFtc5HMOBQ5/CcpPa4EH3fQGSibLTqHMNkxNxLpQvmXB0fFppV7fZZtDo
 6FMDayfy9xdsTnLnFkjx2rvqAzif9y2iVKpvqPCoyGKIlv09LnpYWD4GXxMvsdVwmS
 L+WWUeyNJI46qvxMzvCHUWaF3P3Po8Pug6cgzAxuTRVmKYIVRZwQrhVuDaB+mamr/a
 6WZDQjT6UAnU4HNwFeMEafcUR+BTACjY9V55Jm0TSNw4WEn8aCSH4a9f4TUakQ4e+E
 g5EVhNBIPIzMvohnjhtRq2bapylkjzIdtUrvU8DekyP7h0B0Hx4SNZyEPirXY3EHoU
 nFwfwq/z2janw==
Subject: Re: [PATCH v2 4/5] iommu/mediatek: Add tlb_lock in tlb_flush_all
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, kernel@collabora.com,
 linux-media@vger.kernel.org, sebastian.reichel@collabora.com
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
 <20211208120744.2415-5-dafna.hirschfeld@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <283e584d-ab72-a3cb-f97e-71eeb16f7834@collabora.com>
Date: Mon, 10 Jan 2022 12:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208120744.2415-5-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_034418_172371_7D57B7F4 
X-CRM114-Status: GOOD (  10.13  )
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

Il 08/12/21 13:07, Dafna Hirschfeld ha scritto:
> From: Yong Wu <yong.wu@mediatek.com>
> 
> The tlb_flush_all touches the registers controlling tlb operations.
> Protect it with the tlb_lock spinlock.
> This also require the range_sync func to release that spinlock before
> calling tlb_flush_all.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [refactor commit log]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
