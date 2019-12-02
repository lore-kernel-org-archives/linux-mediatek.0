Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686EDC432C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 09:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35D4E20833
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 09:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jhkurHCW";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="JlF4sKGz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="dGTJRBE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35D4E20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oDMCpPFiuGTKIvoqq0IGZSP/WrVirV2UeaPWkybEvwc=; b=jhkurHCWwPPVTj
	8NkKnnBqTiMjTMxpNQUOiytviUDmB/iX6JijeGWjPQYj0babws18VZ3KdQ3xUB+SqrmeO/cXsFGBv
	H/v+fNKHjq1f4dVo/ekEFGcMN64PceYYhUK3I24L1F1F9IIrwhW7CA6cUM00mC4GGo9v7TVMejm2j
	f6w4uMtqemSsM+xclXC7c2t4mK157X3m8t/q30j7edVZlzCzQ/YSer/214fKK9CcQqCCx+t+6taPo
	q3r/+4sT+bAIMHI6/3Boo1510Rz+8T/izVyGf4SVWk4qvzMMbpL8XHcSZvSaqwl94iUlRM0wcKtRs
	dZmCo7MtPEvHZrtQ/2bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibhxA-0007JF-JO; Mon, 02 Dec 2019 09:25:12 +0000
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibhx7-0006c4-48; Mon, 02 Dec 2019 09:25:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575278705;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:MIME-Version:Content-Type;
 bh=PsbuLqg3PnKHZC8fFLVJ8BSKlIh+aXX3eRcWBfbOHQk=;
 b=JlF4sKGzqfKyhUUPkMR9i8e8xkUE6AO3en95zysRt23Qqb645ZBLk9bJIuSBWcWS
 Ug84EuxiBWcMwXc7IIHhL3QlzgMyHKJJ0TRp69lORlJs1/ndebbJ4UGGl+ggM8wH91S
 enIFinMvcGH4b0K+6G7bEZcLOLCtZNhbnIYRLuWE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575278705;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:MIME-Version:Content-Type:Feedback-ID;
 bh=PsbuLqg3PnKHZC8fFLVJ8BSKlIh+aXX3eRcWBfbOHQk=;
 b=dGTJRBE49IOZbjfisuV7Y2WsSTNpz4KwJe73vr3ftf/Y9LYzpMZbReiIXvsveEZQ
 rRP4N7BI3XD2n6uVlqcNL+D0hidtt3fxblaBgLVMYCAPuHDWtt+ZfF2K0EUPiciBsaN
 djxXuzwCr931qx7xz08ssGiZ1S95wUq8dnFApMbQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F829C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Pablo Greco <pgreco@centosproject.org>
Subject: Re: [PATCH v1] mt76: mt7615: Fix build with older compilers
References: <20191201181716.61892-1-pgreco@centosproject.org>
Date: Mon, 2 Dec 2019 09:25:05 +0000
In-Reply-To: <20191201181716.61892-1-pgreco@centosproject.org> (Pablo Greco's
 message of "Sun, 1 Dec 2019 15:17:10 -0300")
Message-ID: <0101016ec5ed7c1c-0d86f585-372a-4b20-af6e-5b59e732b70c-000000@us-west-2.amazonses.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-SES-Outgoing: 2019.12.02-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_012509_194988_02B74BCC 
X-CRM114-Status: GOOD (  13.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Roy Luo <royluo@google.com>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Pablo Greco <pgreco@centosproject.org> writes:

> Some compilers (tested with 4.8.5 from CentOS 7) fail properly process
> FIELD_GET inside an inline function, which ends up in a BUILD_BUG_ON.
> Convert inline function to a macro.
>
> Fixes commit bf92e7685100 ("mt76: mt7615: add support for per-chain
> signal strength reporting")
> Reported in https://lkml.org/lkml/2019/9/21/146
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Pablo Greco <pgreco@centosproject.org>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> index c77adc5d2552..77e395ca2c6a 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
> @@ -13,10 +13,7 @@
>  #include "../dma.h"
>  #include "mac.h"
>  
> -static inline s8 to_rssi(u32 field, u32 rxv)
> -{
> -	return (FIELD_GET(field, rxv) - 220) / 2;
> -}
> +#define to_rssi(field, rxv)		((FIELD_GET(field, rxv) - 220) / 2)

What about u32_get_bits() instead of FIELD_GET(), would that work? I
guess chances for that is slim, but it's always a shame to convert a
function to a macro so we should try other methods first.

Or even better if we could fix FIELD_GET() to work with older compilers.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
