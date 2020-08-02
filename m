Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737DAC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 15:12:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 408E920759
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 15:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J3R4PB94";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="AJvz/eM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 408E920759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cicr1aT2bjw7G2oxM98BtnoOQ32KAT2xzZELPbWu3fI=; b=J3R4PB94dj0LUH6LI/F41LgC3
	xIQYUtVaBd+K9piDYlQUzDcyOuvXotmdbpTMp0vgNh8Z4Gr+t0JN3xBMMyv9qPRxcuzzY2JvkQG7p
	h0lwWkS5sIbQquo2JMd3pTOPAk1z0wEtzsfb9sgiPSiKJFAbHQxuDZCCDrgndDs7IhrWAnf5wsAKz
	4POr+8LU7FaUAuRQrKwcmlmzV1c2GOwLTDX9NS9CBM/dVcwBkTWA3gnKQ80DBYz81OqzmmQnPPeku
	Qwx0DHiIqU0WX8wdggjHciYFMQ87hGKL5w7hpe5HnSZdPreqrG+pRkDQvvkbLDuY+cp1CgPBE0M5T
	rVq17x6/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2FeY-000363-Q2; Sun, 02 Aug 2020 15:11:58 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2FeU-00034t-TW
 for linux-mediatek@lists.infradead.org; Sun, 02 Aug 2020 15:11:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596381113; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=d3a5n4iRdThXJWDctbyZ9DWtTKYv5w4Rf8p1Jxgt3ac=;
 b=AJvz/eM7Qbpnq16nWFJUKQekV3c2uw1SWaljD9HY9WWvhvXDrC7aG0f17LHLQeRb9ooDQ7fD
 yDpw+ZT4O36ZbLw/J+3r2UnA4XSJkEI5ZUg4BzVQUr2HVZMUBbS22S3NhtasxlhDcxYnWfx8
 MDn0XXPo7/FrZLa51obolZz0dIs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-east-1.postgun.com with SMTP id
 5f26d7b8f89b692ba234f03c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 02 Aug 2020 15:11:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 92C01C433C6; Sun,  2 Aug 2020 15:11:51 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C3DBEC433C9;
 Sun,  2 Aug 2020 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C3DBEC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] mt7601u: add missing release on skb in
 mt7601u_mcu_msg_send
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200718052630.11032-1-navid.emamdoost@gmail.com>
References: <20200718052630.11032-1-navid.emamdoost@gmail.com>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200802151151.92C01C433C6@smtp.codeaurora.org>
Date: Sun,  2 Aug 2020 15:11:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_111155_004701_C719400F 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
Cc: Jakub Kicinski <kubakici@wp.pl>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, emamd001@umn.edu,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Navid Emamdoost <navid.emamdoost@gmail.com> wrote:

> In the implementation of mt7601u_mcu_msg_send(), skb is supposed to be
> consumed on all execution paths. Release skb before returning if
> test_bit() fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

880e21490be6 mt7601u: add missing release on skb in mt7601u_mcu_msg_send

-- 
https://patchwork.kernel.org/patch/11671657/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
