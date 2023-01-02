Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348CAC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeYRTLIAL0yaO7JMKoEbmYC6hAgTvkclSWRDpaCf/d4=; b=ziRMi+c/SDr0GGm9XRllBFQhBX
	f1NTKK1Wj5yN420dF1AhXU4aNUOKUgd++4zvfNUNbB06yc+wwZRuj5u58Y1Ad9zM9vPCg7skXxKEo
	8H1l3spORYr5Z+w/UP/FiGlSDy7Zzn2Fo7m4UJ86eabrJeIs+HlC+qgs+45afyM+fBtUeR+d+NyKf
	UEbA8rhhwXMkDN4mUVXQoERUKyRd4HWtMzVjeSqmICT5J4+Evc8OXsv7monVseP1s9703YAYtthaz
	xYFW3zKb7qwB6H2c5jaAy/ssUPHvQTRTJIzdZKqSWZxneD/j++jN47dnnmAwR+ezR5mXCGNJlKLPU
	Y1CfWbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCLyC-00BpF2-IK; Mon, 02 Jan 2023 14:39:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCLxn-00Bp79-8T
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 14:38:56 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DAA666602CC0;
	Mon,  2 Jan 2023 14:38:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672670333;
	bh=pMikB19yU/UkbJaEJvuwA2/p/HZ5W0dUSLFKBbmG/KQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GA6FK+qq3fPjz49b+fv5tPL850lBxjApPmX60wxhXnTH+cdFc/UqYV+GoJM4bcUwT
	 wbC5zpPXs2+QolnGWHWy6cwEjXzJOPM30YXdjC5/lIgsd9qs5MSsVVdmKwAL+GP20B
	 WmibGu50UsqKuby5qjHIW5qcQlPeNvIaHKRg+Fps/4xoxhc8XrnYxYH5Gl8afbfbmx
	 zl/bQuH+vV2N2H1dbdqlQ7LZmIbtloe5t6lh66mY/DHbLWghM4xRjJarkLix6EAez8
	 QY5HL3dpTDZd0KLPZTFvZXMyhHAyyfUsVTvadPhwDF7UP90SSAxl7h3wAzE2AsXSzP
	 rTT54lTsZqt8Q==
Message-ID: <0c47a386-49b6-2fa3-3169-33b04e0b2cda@collabora.com>
Date: Mon, 2 Jan 2023 15:38:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] wifi: mt76: mt7915: remove BW80+80 support
Content-Language: en-US
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Money Wang <Money.Wang@mediatek.com>
References: <20221229021131.9361-1-MeiChia.Chiu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221229021131.9361-1-MeiChia.Chiu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_063855_523614_429057FA 
X-CRM114-Status: UNSURE (   6.09  )
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

Il 29/12/22 03:11, MeiChia Chiu ha scritto:
> mt7915 doesn't support bw80+80.
> 
> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Money Wang<Money.Wang@mediatek.com>
> Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>

On AW7915-NP1 mPCIe:
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



