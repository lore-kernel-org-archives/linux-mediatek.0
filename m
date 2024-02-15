Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928A5C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ErX067TYJKzZJp2I/jMfImtHSL+anDkxzXn7bEboCA=; b=EIzvWj7UkA4/vPwQlGW0s0bX67
	9DajXK9VNJ7GCj3klvFgVU4S3ZGNHX31fQkRDvE6ZM2pO4lJlzunNLpEdh5yfQxa1vVBXxlAa/zSP
	wYmWxKziAqR45rlmoCkP9VhBhK7R8Ah5Nr+ft3mGYKV4gNPXfmRPhKVgLZrHZZa+gsX4p6NMN8NkU
	qsBgMhzEyJZezdfbp3JBOjPtWYmrJEJePjNhFXQF8sO4GU58MLxWUD7wcp3pqe34A+0fIERSluUf3
	xPwUMlGw4MVYJn8uyQwEj2qBJkoDK9ueJW0+fiaVsr5U0HbS/JRAViSJhj7+RdlY9mAGQoZzY4+q0
	DKjcd5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAi-0000000FpEo-11WL;
	Thu, 15 Feb 2024 10:40:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAW-0000000Fp5B-2qSS;
	Thu, 15 Feb 2024 10:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707993639;
	bh=Z2I/2iS1wg6hKZc0HSZWdzEp3y5P2j0JmOn+KktqECE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=lLDSyuorzfgMILXk5YCfu2LUE2BOOMbM38F+LNMj0yCjj0cV3mtSUg9aKseaNlpA9
	 VFf5wAynXJKAD5JXp4NvZQyI3dOozcIdTskAgixzriXkcB9hikPUPhGZMjnh4ct1bB
	 c08IPM2vCJILsmzrfWzWaHkbJU0OQVScC0CoCt1zSM85IWtpvoxk5PyQ41LUiRVhpA
	 n6sra+3LWtPdiJWL2d1SwsZEWv7A7yzQrsBflzpCbjVVN0znHwqQeomvFITsaRWj9j
	 PEAUVv0LdiMDeDBBYEzb7yvh3+WDQNnGIVe35XYKE+N/ZtsPWBYGkQPn2rxWHmD5Zd
	 3+OzjmgGwSGig==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BA51C37820B1;
	Thu, 15 Feb 2024 10:40:38 +0000 (UTC)
Message-ID: <8f34e44c-48d7-43b4-ae6a-827d4e3fa122@collabora.com>
Date: Thu, 15 Feb 2024 11:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] drm/mediatek: Drop calling cmdq_pkt_finalize()
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
 <20240215004931.3808-6-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215004931.3808-6-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024040_921552_C51C3826 
X-CRM114-Status: UNSURE (   8.82  )
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

Il 15/02/24 01:49, Chun-Kuang Hu ha scritto:
> For some client driver, it want to reduce latency between excuting
> previous packet command and next packet command, so append jump
> command to the end of previous packet and the jump destination
> address is the start address of next packet command buffer. Before
> next packet exist, the previous packet has no information of where
> to jump to, so append nop command first. When next packet exist,
> change nop command to jump command. For mediatek drm driver, it
> never has next packet, so appending nop command is redundant.
> Because cmdq_pkt_finalize() would append nop command, so change
> calling cmdq_pkt_finalize() to cmdq_pkt_eoc() to prevent append
> redundant nop command.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Makes sense.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



