Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC871C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rgoJ1VpZuIZCsfLrEKDQChHDoYiSTxUZF+HpVPb2hno=; b=t2r2CwcDTY2zzuiIEyXN/zoDrX
	tP5oyUtONCB9Af83HNSlnVZSVEIPhAQhMxv9umVTmm8tSwJrKceDjwQa0oCJV9e85qys7XpF22fie
	lMgcMBmXSn4q19rNP3yx19hYUl3N6NrOOTRArWQa0CFS/aEeXHgupx/UFEOHN+p/SxJIZfzsu5wsz
	t8yNiqoITmI+x/YtQiOgN6JFoOUD+xeesy1SKlBXa6iAPuHAfYeZiSqA3iZ6CsmuDMzDgn/j5R0ls
	OtUfGT6uGs6ks2foWGX3TifKzkRPVev0XrfrJzh1OVG+dvXsGYeHk3GzueE8u8EuADdBaQA9qIqSh
	V9iYYZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVqre-00000009KqC-2Z1Y;
	Mon, 22 Jul 2024 11:05:58 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVqrb-00000009Kos-1a4O
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 11:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721646351;
	bh=rauISwWqe6NRv/aDtwraK5xUFBcodPwNCI+Gmaz8FR4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ylLgCoR+RRwDqWSVmbD6fllbe9r2zpHr0braZNkJJ4L/GBoyWRY8VVR/IjJhoHR5l
	 OO4aGFLndZoE3i28i8ysIqAxd4Ov1cXx80tGoUtiDbJlq+ylml2F80sRWStyn0fO+Y
	 FT5WbQlIZA15GWGjfGNOzwu9PydGIOhai2JewWvq4Fosw1ONmjh8anbrC9zitlOfHJ
	 Lz0OA66WeReUhsyQpbB3mIJqXOJD6MRCHyR90c6VgfC67qQ75SNBMq5amnx7/8NSCt
	 YEL6ECw7co7dpKBvKSipqVFHIREmF+/ZxTP4T6i6UdPXwV4qfrnXO3oVIF8ZX4orBE
	 HV3J8rk7j9ZjQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D0F1537808FA;
	Mon, 22 Jul 2024 11:05:50 +0000 (UTC)
Message-ID: <487dda47-ee5e-4835-ba63-05c0ce7ac6fc@collabora.com>
Date: Mon, 22 Jul 2024 13:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Bluetooth: btmtk: remove #ifdef around declarations
To: Arnd Bergmann <arnd@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chris Lu <chris.lu@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@mediatek.com>,
 Jing Cai <jing.cai@mediatek.com>, Takashi Iwai <tiwai@suse.de>,
 Peter Tsao <peter.tsao@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240722092735.1109925-1-arnd@kernel.org>
 <20240722092735.1109925-2-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240722092735.1109925-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_040555_757252_EE24070C 
X-CRM114-Status: UNSURE (   8.33  )
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

Il 22/07/24 11:27, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The caller of these functions in btusb.c is guarded with an
> if(IS_ENABLED()) style check, so dead code is left out, but the
> declarations are still needed at compile time:
> 
> drivers/bluetooth/btusb.c: In function 'btusb_mtk_reset':
> drivers/bluetooth/btusb.c:2705:15: error: implicit declaration of function 'btmtk_usb_subsys_reset' [-Wimplicit-function-declaration]
>   2705 |         err = btmtk_usb_subsys_reset(hdev, btmtk_data->dev_id);
>        |               ^~~~~~~~~~~~~~~~~~~~~~
> drivers/bluetooth/btusb.c: In function 'btusb_send_frame_mtk':
> drivers/bluetooth/btusb.c:2720:23: error: implicit declaration of function 'alloc_mtk_intr_urb' [-Wimplicit-function-declaration]
>   2720 |                 urb = alloc_mtk_intr_urb(hdev, skb, btusb_tx_complete);
>        |                       ^~~~~~~~~~~~~~~~~~
> drivers/bluetooth/btusb.c:2720:21: error: assignment to 'struct urb *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>   2720 |                 urb = alloc_mtk_intr_urb(hdev, skb, btusb_tx_complete);
>        |                     ^
> 
> Fixes: 52828ea60dfd ("Bluetooth: btmtk: Fix btmtk.c undefined reference build error")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



