Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD8FC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 11:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65tS3EpTy8iyoVOOSQlc2BHOuVEBU4IbTJ9uN+SdWFk=; b=ekaSamsEDoNT/WJQvlxNQGd0Hv
	IKtFDQlOaYkO9rjsLHshv7HJIrn0naycAW9SByVcRZmYUmM82A3LM9fVjZessKWR/vewKOsM01sWV
	61ezPWjLLOPCAIuuEJ2ldbc4lKOBC4wHUfkxFl2CD7EVX5OptxtKhbGqQX+SVLM5WbmOAKeEZGH9g
	ADXtQTc3j9iwiVgb/v21HAuwWxDCh7xPEI0DsJbbo256J+7NKQQjP6ksgkZDPoBT7RohGdNuf90Fr
	y5KdD4zYYtS+cLZ9UKtKU1oO3SAKl8RaOIR3hFhCQRF8/AoXyXAW+L2f9F/0FXCmwRIMKq+6EnfqI
	4/QCQFkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU4Oe-003tag-0c; Mon, 20 Feb 2023 11:31:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU4OU-003tYK-2t; Mon, 20 Feb 2023 11:31:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C919660213E;
	Mon, 20 Feb 2023 11:31:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676892700;
	bh=AL50rqWOybi/12zAdjC8/O/AtkIbRn+Y7Je1otv+de0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Vjf96uhD/PC0Q1o2v23wqoR371kYSKeRxLnvlqcmVBKNpICJlgsTgkWdqrq8ABDrF
	 C2OT5Nmq143lN40hzaqXxrKs57SVWcOyyN/g4j31mCnZa73Xw88+xnp9UsZAFTzd1a
	 3x1fk1z6QuGGZZGA5vd7B07om0da3CKglDataoA4yOWlykUb4NW3whAbw3vcWcypDW
	 gb3/zjvEtYeoEnhm+RdBQ2Fby5XgHCAmf6qh3pkeBE6DRpjMv3JyPRtud94eo14pSy
	 qIzhzNT1W/ISHQ3qvvzHoxs09t6cch2jLqnVWQl0XKFrKmfcrG7JtW8gEyHtgEBR5Z
	 idatKfLSC3oDw==
Message-ID: <437c0c5c-9a71-253e-eb2d-39e167e35099@collabora.com>
Date: Mon, 20 Feb 2023 12:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] soc: mediatek: cmdq: Remove unused helper funciton
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230219233439.3157-1-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230219233439.3157-1-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_033142_283286_AB016665 
X-CRM114-Status: UNSURE (   8.59  )
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

Il 20/02/23 00:34, Chun-Kuang Hu ha scritto:
> cmdq_pkt_create(), cmdq_pkt_destroy(), and cmdq_pkt_flush_async()
> are not used by all client drivers (MediaTek drm driver and
> MediaTek mdp3 driver), so remove them.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

My next cleanup step would be to migrate both the MediaTek DRM driver
and MDP3 to use the common functions present in mtk-cmdq-helper.
Function mtk_drm_cmdq_pkt_create() is (almost) a clone of cmdq_pkt_create().

NACK.

Regards,
Angelo

