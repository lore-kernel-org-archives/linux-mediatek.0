Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B90C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWsS6VrN8ySvuBV6GQUKkwQ2qXSEm7hsFx9afoFJDWA=; b=sSOEAqvQ21iEZLe94yAusTjZgw
	6AJdkK7emwNF7yQrTAgNRO1iZ7yhKfkLT+KLv2q7n8Azx43t6y6NqCDth4SoEKk05JjgoNPI1ZOOi
	ph6A6yPx1vpcS7MuPcw1UwQR3S406/kkbpC7dCq0XQTQrYtYQ4IIUGmlioXiMOa0xEwpJKy+RozV8
	dCnisgqp3VTKyK7BQidsDqikX0iaLn1RQ70zmlmxPjreNjVKD2qGGHbmFqTR9HkZC2Qi0EkDq0o4N
	PnIwFjY/1sHK3406TgayYYy+q/N9FxwwhJsVh8lo8o+R20UUxIPJB4TFkDwyou0eZvF2QDnOmAUrV
	yw6ED69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kC8-00CqAu-2Q;
	Wed, 24 May 2023 08:50:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1jDU-00Cf8F-2J;
	Wed, 24 May 2023 07:47:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CAFB0635D7;
	Wed, 24 May 2023 07:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2144C433EF;
	Wed, 24 May 2023 07:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684914446;
	bh=KhQ0blVR5cXlzUR6vdxYF+zuuLth0MWzdADoCBQqa44=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pLpUbESyZfGpmf0GKjmrfiv0HHs77Na8zqN6Wm0A4OWoRIqWT/PyZufb9YZz4NZWC
	 Ak2xLnl8NWJfwuYnjB8LEZBwoCQw16eHDK1JYar9J+uOnj3AoTwLrZalzcX7Vfj/Sp
	 8aRkeCka6sTbv9VltyPUCMqe6jrev4TDqj1FLNzLThHZZyawLZJbU4rVjakc3TR5Bo
	 6S4U+EXpcQbuvBM8Xehrfa8zzvdAQhrGijsGP2zEYHbTcOsWUt/0BOK6Foz9RkShS6
	 WmcvuYcrck/2xnpHctbegwgKwNi+n0peoHIi/UNq+8g6zb3udU5seVDMXa9wW3UtMh
	 qOR899x8zbmzg==
From: Kalle Valo <kvalo@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jakub Kicinski <kuba@kernel.org>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Paolo Abeni <pabeni@redhat.com>,  Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt7601u: update firmware path
References: <fefcbf36f13873ae0d97438a0156b87e7e1ae64e.1684191377.git.daniel@makrotopia.org>
	<87o7mkn91f.fsf@kernel.org>
Date: Wed, 24 May 2023 10:47:21 +0300
In-Reply-To: <87o7mkn91f.fsf@kernel.org> (Kalle Valo's message of "Tue, 16 May
	2023 08:24:12 +0300")
Message-ID: <87ttw2kw6u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_004728_799087_38E4ABA0 
X-CRM114-Status: GOOD (  17.93  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Daniel Golle <daniel@makrotopia.org> writes:
>
>> mt7601u.bin was moved to mediatek/ folder in linux-wireless via commit
>> 8451c2b1 ("mt76xx: Move the old Mediatek WiFi firmware to mediatek")
>> and linux-firmware release 20230515.
>
> Why was it moved?

Here's the link to the commit in linux-firmware:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=8451c2b1d529dc1a49328ac9235d3cf5bb8a8fcb

It would be good to include that in the commit log. Unfortunately the
linux-firmware commit doesn't explain why the change is made, oh well.

>> --- a/drivers/net/wireless/mediatek/mt7601u/usb.h
>> +++ b/drivers/net/wireless/mediatek/mt7601u/usb.h
>> @@ -8,7 +8,7 @@
>>  
>>  #include "mt7601u.h"
>>  
>> -#define MT7601U_FIRMWARE	"mt7601u.bin"
>> +#define MT7601U_FIRMWARE	"mediatek/mt7601u.bin"
>
> How do we handle backwards compatibility? We have a rule that old
> userspace needs to work with new kernel and this change breaks that.

Luckily the linux-firmware commit added symlinks so that won't break the
backward compatibility. But I think in the driver we still need to
support both the old and new location for several years. So the driver
should first try the new location, next the old location and only after
that fail.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

