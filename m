Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06Bco6uw9EGg4i+7K0hUK4MXKQJ4zPo8Mll8YkJMjvg=; b=ttVUFdd5pYFzt91ih0Zwyk8rkB
	v/TyHqQHZ+uMbKadVnZlhzijCOsVeQcIQkI2YpmcHr7fSXwF4yJydPl1z5VU87lbtOPNDLBbk9EPv
	/WENaPbcz5HsNC8zfWLERiGYNazOxCP4C2xwVgUEYg2VIdxurA0q9X/bZa3llt0roy1h7XMFyWNmg
	hl9pzjWshTqLFHtomFd2+6gOLEZUy71GQUQSpOMMJscQPoIxWh8nnsMN7M+2r6LWR+o0ntSeP9NhE
	KdF2XSGaQCyEnwBwGZg32tj6fvJQCovyMzbVK/Sr2f16t6zzwpXp4X1Pt3kGrO0fkFrOlehafQu3k
	oQmWuETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6SzF-00AMpy-3G; Wed, 29 Jun 2022 08:23:49 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Sz3-00AMli-OJ; Wed, 29 Jun 2022 08:23:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9ADB066018F6;
	Wed, 29 Jun 2022 09:23:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656491016;
	bh=Tlj2vF7pAPWGRIwrz16g80+PcSeGWCYrUwBN2Zp9Gqg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FdcAaRzQZY9/TmuD5FpfBRWinXwWCHKIaEFfjzsgv0aXujyD0MAKsrlAn423LFy0/
	 MeZje1XipfLs3Wlm/Z8FQ8Z9y17k2yYHH+pxqjppBZ/cpWgfd6158UDN4LdaMP7ZU3
	 jKaSzJF1+FD7GTUy9S/ZgASDVdhDyFHLB0eLipISgn8XlVfu3x1nOiz/caleNXhnLi
	 Z4WaIk3y8TyEC+OfSsjTDlKnBEckwAysKgztjRX/Sn1/HsN51MYGL3B7lm1ROvo8ph
	 S8z73nEeVt0lEze3BLvOjGNhYFMMFPbe28VyUKNOdMgyggixXmkSetwv7qvjeob5a+
	 yrRiV6PiwQ4rQ==
Message-ID: <72d87ff5-4af2-c186-3112-bde153a6a4c5@collabora.com>
Date: Wed, 29 Jun 2022 10:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] regulator: mt6370: Use the correct header for
 platform_device_id
Content-Language: en-US
To: cy_huang <u0084500@gmail.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, chiaen_wu@richtek.com,
 alice_chen@richtek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ChiYuan Huang <cy_huang@richtek.com>
References: <1656466861-7737-1-git-send-email-u0084500@gmail.com>
 <1656466861-7737-2-git-send-email-u0084500@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1656466861-7737-2-git-send-email-u0084500@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_012337_974169_9EEE1AFE 
X-CRM114-Status: UNSURE (   8.08  )
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

Il 29/06/22 03:41, cy_huang ha scritto:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> 'platform_device_id' struct is defined in 'mod_devicetable.h'.
> Even 'of.h' also includes this header usage. The 'of.h' cannot be removed
> due to 'of_match_ptr' function.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


