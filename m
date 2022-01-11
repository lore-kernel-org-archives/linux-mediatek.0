Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BEFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UZrAavNXv+BAYtjyb/eQSTvwbGsQv6dQGOhpyEL09o=; b=mYB8AZKNAPeyrPWlyfIsV2sM1n
	d+lUQccICI/EZ9WcAObSerW+OwmzH8rvIkl6VXLMBUBBJdh3JEFlWq0QvYIML+/netJehQ0N7UYm4
	JqQ5iFdKVQqjwnwD1PXgBaUv/w9ZbY/BNH2gQZAxoFv8JbqEFHNMfpFUd5MGmJZ5Lo6KCa/FVFSp6
	6LXFqsOgLFml5FY4MYB+y3NysyOX9ZPB68cESNkD2F84KGwpXVrrZlXLwAbocXC1dqStz0/3Vq+/9
	c3FlnFZJnOzJA9KBinRivG3PVAFZZHKdK/Y3jEPHXT39sWArfP/ph1X9MNt5eLWfK/TAa8E33zvh6
	UkLimOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7HRk-00GS6A-CO; Tue, 11 Jan 2022 13:44:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7HQL-00GRA8-S8; Tue, 11 Jan 2022 13:42:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3BD3F1F43CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641908572;
 bh=uaxzh4zsAhZ1ewzMCAUwEtPans4AmfRV9oSlzLefnlk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=WmIB87G52wOngWT2q5aJGiFEWOTw4ESogbQhD2rSDu1s+BV5vsV9KWIl8kHT9nEvC
 VOeORansLXJq9bVeXwDUKG2fpo6CB3L4fVNYKpD5Lp3aSqrWvonklbtBPk+DyfQ0L1
 n59JxjUqvyOlnUnUcrExjPMBIrqHfKUXRATk+dM/VW3oEC39A4/jdA3l2dsDkj8og4
 lYdoMkJujjNr/YWdb/UFHlWn3FY6djNyjETl++sP9Iu6xt/Zaaga4TTYhmDUUIy64J
 y6IGTjoC8UIcOHgjzJgr7f8TkyHAS/tVWkfL59JPwZr4b/K5eCwU70FFW9ZTtbEwEu
 lgPOLrwkwhp6A==
Subject: Re: [PATCH 7/7] pinctrl: mediatek: paris: Support generic
 PIN_CONFIG_DRIVE_STRENGTH_UA
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8a5aba82-d9e3-25d8-f34e-7182586d8ce4@collabora.com>
Date: Tue, 11 Jan 2022 14:42:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111112244.1483783-8-wenst@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_054254_110974_9A7C5A6D 
X-CRM114-Status: GOOD (  18.28  )
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

Il 11/01/22 12:22, Chen-Yu Tsai ha scritto:
> Some of the MediaTek chips that utilize the Paris pinctrl driver library
> support a lower drive strength (<= 1mA) than the standard drive strength
> settings (2~16 mA) on certain pins. This was previously supported by the
> custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
> "mediatek,drive-strength-adv" device tree property.
> 
> The drive strength values for this hardware are 125, 250, 500, and 1000 mA,
> and can be readily described by the existing "drive-strength-microamp",
> which then gets parsed by the generic pinconf library into the parameter
> PIN_CONFIG_DRIVE_STRENGTH_UA.
> 
> Add support for PIN_CONFIG_DRIVE_STRENGTH_UA while keeping the old
> custom parameter around for backward compatibility.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> 
> The indentation in the switch/case blocks is getting somewhat out of
> control. I also have some cleanup changes to reverse the logic of the
> if/break statements. Not sure if it should be done before or after this
> patch though.

Hello Chen-Yu,



this commit is so nice that:

- My heart says that it's fine as it is, but

- My brain says that it makes a lot more sense if you push the cleanup

changes to reverse that logic before pushing this commit, as to reduce the

count of changed lines (hence, to reduce some noise)...



...so please, can you rebase this commit over the cleanups?



Thanks,

- Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
