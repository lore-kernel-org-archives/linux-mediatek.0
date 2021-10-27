Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A239C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 06:20:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF98460F0F
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 06:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF98460F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODYrxhomDE3+aZ9kBDPSec1WLsZ9u4w/XixAovHrMnw=; b=mNVqqZmhIMp7lv
	TwqLxQE642E+FxLKPP06PTHMmX+2/s5zrZ+ANIaZaOlhmGcWBMCeK2uGYHNxAvmdIeOgO7fSkJWCu
	g8iXVGWdFvU7Ja945mvzJtoN2fKJ+nDcbXF9briT+WY/ub+KjKYwwyXfMEEk8oFTle4wBxd4scHEP
	5pA3v74vjx/235rnFSTtIy6Gg3wR2V9MJXSqsqBc3bmjGu75m8wLcmDPpbNYhASDH2sdKMBUDSa2F
	tUofsYRDxDDwUjo/1ctggvygYDJtVDryhOX+uv1xJ5lXm0+/DVv7EeTGYAsCOi5c01AR82vZdWZ/i
	+jJsVekwT5oxk3bsjJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfcIc-0040j9-AJ; Wed, 27 Oct 2021 06:20:34 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfcIY-0040hu-IO
 for linux-mediatek@lists.infradead.org; Wed, 27 Oct 2021 06:20:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635315631; h=Content-Type: MIME-Version: Message-ID: Date:
 References: In-Reply-To: Subject: Cc: To: From: Sender;
 bh=ps8/xgtg5gAKrPPoVBISwY+vty6tFr8afONeYrw77Eg=;
 b=aQLeBpuGmBa7pjdJbZb/curl/Y4/4aiQn6U+EsSNGORPoL8O1A9VPP5+o86w0ns/iAernZ0Y
 nB70CMNrsEIGezZBpq4/3HJyGZJc7Gjs6McbJlA2V45UNrdXM8oVObkKFYQOw3vuQrCpYF0I
 EjwBpTaDubGa0RSEVXMbJuS2ezU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6178ef9abd6886bdf7ed9b1c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Oct 2021 06:20:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CB9FCC4361A; Wed, 27 Oct 2021 06:20:10 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 253AFC4338F;
 Wed, 27 Oct 2021 06:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 253AFC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 YN Chen <YN.Chen@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
 Leon Yen <Leon.Yen@mediatek.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mt76: mt7663s: fix link error with CONFIG_PM=n
In-Reply-To: <20211026083326.3421663-1-arnd@kernel.org> (Arnd Bergmann's
 message of "Tue, 26 Oct 2021 10:33:09 +0200")
References: <20211026083326.3421663-1-arnd@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 27 Oct 2021 09:20:03 +0300
Message-ID: <874k939egc.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_232032_061576_7285F916 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The generic register access functions are compiled conditionally,
> causing a link failure in some randconfig builds:
>
> ERROR: modpost: "mt76_connac_mcu_reg_wr" [drivers/net/wireless/mediatek/mt76/mt7615/mt7663s.ko] undefined!
> ERROR: modpost: "mt76_connac_mcu_reg_rr" [drivers/net/wireless/mediatek/mt76/mt7615/mt7663s.ko] undefined!
>
> Move them out of the #ifdef block.
>
> Fixes: 02fbf8199f6e ("mt76: mt7663s: rely on mcu reg access utility")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Felix already submitted an identical patch:

https://patchwork.kernel.org/project/linux-wireless/patch/20211023112407.26448-1-nbd@nbd.name/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
