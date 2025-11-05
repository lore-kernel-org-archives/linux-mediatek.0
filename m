Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62783CCFA05
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 12:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pa2IyR9lRbG117au2YCWdDVsyJ0VUsBuHf2u47D1XU=; b=IE9Z45SlL8mxyfNaTisJarlF/E
	Y+iVRBH+TXOpyIsYo2H79x2rx2Og476bvJH3x6ADeUWUqqfzDjnQMIFaVqs4LUKvREOHjkOB92GPm
	rcbu7VtdjJo0+GNDCUzQWsyb5kTLVKGHOtvtnPoCKAvXg5tF5Er9x8N27aKQfmisWxSKpkD4dfS7b
	0qNytk6jBX7TV4B1vG5YPm3IjWsAis3E2FrtaF45vOo9mAkW1hOss1QUtfRKya5R5uiZQzITsxB8N
	BKx6vqx1IUAe1EOkzWZ4ntfnPHCvJkb3zJkI4Am4Kwr1Jbpw6MrYCLE5hy52Um44RFhGSz5yMW1rp
	mEk/X8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcEF-0000000DZvH-0uxf;
	Wed, 05 Nov 2025 12:03:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGcEB-0000000DZup-3X4X
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 12:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762344179;
	bh=VH8kFpYQXA1fGs+8Mo/2XoNZGmo3cXN3/bCZcEbEn70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dc+xUQe662d/9bzPFMsoLPnBDXpEk42TFjAFfwGLuAGlI3WdMbvacN2RBIeut5Hp2
	 LQ5klxK3tm9O1mGc0Un6cPrikB1tj13pS8xG5j/csZhedUAh18oH6B8Xh4yyzK4wfx
	 Ggdu0ewKxhaCWKleULH3Hz1kRtrjPoyMPFrpz9NIQvCHaWvko8iC2jadr7Y3+K3S8w
	 kETRevfiMg7f6MPFB69XJiwC1Lr7XJggher5O1tMEMC8nhf3+vSXsgtrCdNTHaESoY
	 SGKJ2TfngCPIIFTcaYv0F2qbBjdrNFlkc34EclWbMdrri3C5Oyc0kP3mq5Y955L1Gj
	 ffpFNZ4Z/Y6dQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 72A9717E013C;
	Wed,  5 Nov 2025 13:02:59 +0100 (CET)
Message-ID: <493c50d5-7f6b-4013-91dc-83481f9fbdba@collabora.com>
Date: Wed, 5 Nov 2025 13:02:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux
 on i2c2)
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "Frank Wunderlich (linux)" <linux@fw-web.de>
Cc: matthias.bgg@kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Qii Wang <qii.wang@mediatek.com>, Wojciech Siudy <wojciech.siudy@nokia.com>,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 daniel@makrotopia.org
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de> <aQdSVcazPQl-shR6@shikoro>
 <1144f62ad9886fed60620bce0bbed7ee@fw-web.de> <aQfgEuelvU-8_2rh@shikoro>
 <aQs6O75BqOERMzPJ@ninjato>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aQs6O75BqOERMzPJ@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_040304_084011_EF6B08EE 
X-CRM114-Status: UNSURE (   8.51  )
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

Il 05/11/25 12:51, Wolfram Sang ha scritto:
> 
>>> Maybe this option should be enabled by default or when the i2c-mux is
>>> selected?
>>
>> That's what we were discussing. At least a warning will now get printed
>> to the logs when booting suggesting the above solution.
> 
> FYI, all the commits leading to this breakage are reverted now. Sorry
> for your troubles!
> 


Wow I replied to a very old email in the topic; Good (but not great) to know that
the issue was not in MediaTek specific drivers and nice to see that it's all been
resolved.

Cheers,
Angelo

