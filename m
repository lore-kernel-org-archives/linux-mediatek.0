Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE223C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dj1Hrp+7rHtQPhO/c2mcOx2GBmrFjLO+rxOoQ+7bZRc=; b=hi0Qp+UChLdTV5
	j7FzFFOIF30oL1AiV2ztq+H/23GmUuQpyZIn9qqY1ZDfYGOeWjZQDMpHSXQE5TOxt/Yp7IfCURhjr
	wHSMaofsG/m0LlUMe12frnL4xSyHIPaRdVFqMk6npnykUzw/jnk48eZuiEv1Wfq6RyJS6ipK6Ntm4
	30SptLCvyrbRtDvOhFuNkkgDD5G+K4yGD2UZ0kz9JcLR2nXcnn+Y4t71VWfT8BeYrOit9cvtAQvds
	2POlTMiarDs3YcWuBKRttcU5BRfV4xUris8RRKfDrUWpIrfYyyopcyqxSoCBj25cHCT/fgjnZ2XW5
	kDUi/lBxBQMn5pTQ8obw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbGV-0062mx-9T; Mon, 30 May 2022 09:00:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvbGI-0062kK-Kg; Mon, 30 May 2022 09:00:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id BA4C11F4263D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653901229;
	bh=oVWZjJhb7qhA9swQsNjKyIH4iNxQFAuTs6yfX8nGbjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BNLFSACyyunH5pzqLMctQd1Xk+suq1vnZWHFxZZmI/Im55ZJyLLoZa5/nJQPNth8z
	 kPxqSsHZx7TobCa+Rl3/7oOdCynLTJhFqMztuXuqvA9Pt5eyYsdejdB0U3mN9MXIvv
	 Y6IExcTX+/biME3rmT/0cVJmSoNn7MnM8kDZXzPCUifSA+obi6IiTidcUP5rH2rLmx
	 80VSRYqItBDC1baJ46hR0Pp4R0Ltq1edOOEo95nXr8AvciH9vfVVkX99nH4wiBEHdC
	 X7ohDHPmCDn4yx7P047gZHKqEGVyybixkFCdPnw3WSTbjhOg/3zVEs/+Uc2cbNUx3Z
	 TWFIjzCUUbtag==
Message-ID: <524f15ad-07d1-37e1-eebb-ae86d4ee1763@collabora.com>
Date: Mon, 30 May 2022 11:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/3] Input: mtk-pmic-keys - Transfer per-key bit in
 mtk_pmic_keys_regs
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
 <20220524093505.85438-2-angelogioacchino.delregno@collabora.com>
 <YpBiz7fGCgHaKqGs@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YpBiz7fGCgHaKqGs@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_020030_856626_5623A57F 
X-CRM114-Status: GOOD (  16.00  )
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

Il 27/05/22 07:34, Dmitry Torokhov ha scritto:
> On Tue, May 24, 2022 at 11:35:03AM +0200, AngeloGioacchino Del Regno wrote:
>> Place the key bit in struct mtk_pmic_keys_regs to enhance this
>> driver's flexibility, in preparation for adding support for more
>> PMICs.
>>
>> While at it, remove the definition of MTK_PMIC_RST_KEY_MASK as
>> we are now dynamically setting the keymask relatively to the keys
>> that are defined in the newly added rst_en_mask variable, on a
>> per-key basis.
>>
>> This commit brings no functional changes.
> 
> AngeloGioacchino,
> 
> Could you please tell me if these devices (currently supported by the
> driver) have 2 fully independent reset settings for HOME and PWR keys,
> or is there are actually 2 separate bits, one to enable/disable key
> reset, and another controlling what keys will cause the reset - only PWR
> or either PWR or HOME?
> 
> Thanks.
> 


Hello Dmitry,

there are two separate bits for the "Long Press Reset", you can achieve
reset with either holding the power button, volume up button (register
name is HOMEKEY because on very old devices this was a "home" button),
or both - for a certain amount of time.
If both {HOME,PWR}KEY_RST_EN bits are *not set*, the long press reset
PMIC trigger will be disabled.
Long-press time is controlled with the RST_DU register.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
