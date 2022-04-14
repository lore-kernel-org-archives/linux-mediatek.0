Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0491C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cokG+k70HD3nw5niphYMTnjG5SBENn/7YD1Urh+Czac=; b=WcKfaTcpWTnWr+
	iBIJgg/ChPWzCaaO8gFyPW4h3iejafMpVD4iyJkTQvYqJ7MrdfL+/A2N1HI7wSZgh5MgOj4pYnLl7
	QrZhXiflEINPZXMQ3qhtvBS+m+2SB+k6/vd2jID6pqgzH1J6kbF0l7mvvdPNtAAprBe2OXstP1UbI
	Skn1bG8DxTwzAg8EALcbDx8EXH4ugtmb/aLNtZoRHDPKoyW86aVLwnTOaoHIaZdX5yFOdBGSTa+Bw
	xjAua07eipVbcbzsUQWDQ1fe3CqnYp1tFmOKVN/KQvxHb6pRhJfXjMtPhorcLNBkAu4XsDSfbOU/T
	B854qzbqxWrbu68GXBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neyDv-005Pmy-G7; Thu, 14 Apr 2022 12:05:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neyAZ-005O1x-KD; Thu, 14 Apr 2022 12:01:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 857641F46212
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649937710;
 bh=hntinxdWLlrL2MROk7epPzvGxJX7H67N4tzPW+gYQl0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mv0MYWvdjdLKrGD1VZV7IR6HjKrbyOTQjAt2fyhRmkjFEAihBrH53L0WqwFARMOon
 U4cdhfFqIsJmCgLnACP+wozzR0bECnxuNso1XMJEFq1L3dhfD+T6AVKG+2cz4RkyT3
 jWy+oNWdkm1qC346EitXku2BiVXzsv2qoqfT/jOsiawieP4UitS2LXarPWgL76IZhV
 ObYiKHTQMhmn4gmCfCNqNXPth2+Sd7rht3dtaTVW7hnuiXNXiIdRjAMcmmBSkTSruI
 +842o5Vu+Kuk7oJxacUQ7ujRbWSuRzij13Dvy3i65x5PTN8nrjLs2nfkxO+8YrysKg
 Rh5tV5bVN4nmg==
Message-ID: <264463b6-c8cd-f106-7e53-b5b0ded07110@collabora.com>
Date: Thu, 14 Apr 2022 14:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] mt76: mt7915: make read-only array ppet16_ppet8_ru3_ru0
 static const
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220414095007.294746-1-colin.i.king@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220414095007.294746-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_050151_844768_F834D6A9 
X-CRM114-Status: UNSURE (   5.89  )
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

Il 14/04/22 11:50, Colin Ian King ha scritto:
> Don't populate the read-only array ppet16_ppet8_ru3_ru0 on the stack but
> instead make it static const. Also makes the object code a little smaller.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
