Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96B2C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:26:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AECAA600D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AECAA600D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TJdzmS88t+Df36QKVJ/9lx/bQvxmQPOkRlymwzO23yU=; b=1SJcHh+JhAmXM+
	taNhZVQqBXAWCR8zBg6nRKNNm/v/INT3SVUVS8tmr0SJmWSXXVZaMSrRWpuZCH7gGX2mIx7d27yt5
	Jz2YEQ8TeB9sE/uFFv3jJaZ/f0K1J5IuZlwkiIBa7UUjNhG8VwgmXNhq++h6B7aboeB3GAkdS3Syb
	tVmtJXeuscbO1+MK/2anGmuFuEEvw7eFQsVWVWNpR9bej2N57YSkParWYLBSOw97i4sQFQU9PS3z/
	Flx3H4ytUKQtZ4RfOMqT2yUo55OgzWbSEFWqxMJoPCq9J1UazAaiQ9J5xsCYsow7EuMe4Q/3Ad/D1
	7WqjM0yPW6vMmrbJnWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lviHu-007gQ4-Nj; Tue, 22 Jun 2021 15:26:06 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lviHj-007gLO-LD
 for linux-mediatek@lists.infradead.org; Tue, 22 Jun 2021 15:26:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1624375563; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=akNWlPwh03z/InvAsg7qxy/PuXCRIaHlyb13A6Z2OdQ=;
 b=Gy/Dhfhw2nv5B3A8TxA5FxFjQwmYSR0KlMKuAA3H8CoJ5Vlh1/0yYLWCaXdHyQhGPLNvD/Qq
 rh4I+B/SAmHzP9xY1BwmN1nfT21qaRvLTnxiH+qjqgP4IFUAIL81P1UZ+8lBrxRMNfBBzoEM
 5MhUgst7KiIdgygXnwinPEEfI94=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60d200ea1200320241ef96fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 15:25:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C5793C43460; Tue, 22 Jun 2021 15:25:29 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5946BC433F1;
 Tue, 22 Jun 2021 15:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5946BC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] mt7601u: add USB device ID for some versions of XiaoDu
 WiFi Dongle.
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210618160840.305024-1-whistler@member.fsf.org>
References: <20210618160840.305024-1-whistler@member.fsf.org>
To: Wei Mingzhi <whistler@member.fsf.org>
Cc: kubakici@wp.pl, davem@davemloft.net, matthias.bgg@gmail.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Wei Mingzhi <whistler@member.fsf.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210622152529.C5793C43460@smtp.codeaurora.org>
Date: Tue, 22 Jun 2021 15:25:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_082603_618705_F85019F5 
X-CRM114-Status: UNSURE (   7.29  )
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

Wei Mingzhi <whistler@member.fsf.org> wrote:

> USB device ID of some versions of XiaoDu WiFi Dongle is 2955:1003
> instead of 2955:1001. Both are the same mt7601u hardware.
> 
> Signed-off-by: Wei Mingzhi <whistler@member.fsf.org>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

829eea7c94e0 mt7601u: add USB device ID for some versions of XiaoDu WiFi Dongle.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210618160840.305024-1-whistler@member.fsf.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
