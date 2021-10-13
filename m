Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7282EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 07:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A3F60E97
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 07:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39A3F60E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkiXo5GAoHh1jirHyGki6RIFMeFo+C38t0kaNqFN6wM=; b=qP9jYhPtx1CknS
	oHzQTwOs76hCRaHKAeGA+oogxsRWFaxYhEOddev0mx8L+/Qpn2GBHNgVvjBvsO/riyNld5ONoL7wX
	lDftg3OwQADNA4iYFq3GdGu17kCQCP+/iC1TgWQic9/phOMVUhGFDJWdZjLNU11gBkHwioxAW83hT
	2BMeZLSllwCeoZyftPXd3jWqy3hEEwQDRNKqnYQCAqAH6eaPBff1ivlpjHOwpKD35F+/uFb4JDoUd
	tjpx0khT62eRkVdfKA5iWeBl+fnbFFI3rAkOh+qqzyfLbwHqOX8eNlM9Am9FSfm3/rFcxlciLDqaa
	f48GCsry3GfKa74PlqoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYzh-00FRUa-Qe; Wed, 13 Oct 2021 07:48:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXaF-00F7aB-5S
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 06:17:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634105868; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=jY5uQapv7dUKYjqb7AO+EnSNhLB/zixLlogvRjSq578=;
 b=D91Khlc+lcG4UnjkteszTx5M7P3IZ7UMHHJodJnpSizF3Pw1kExGtx6flznvRa6jl1CeuN/f
 VUAt4nGzqPJ6ZrVTXD2eNq19CyPR5pQTg+gGaircnCYWl81KaDISgLC+qDwIuz7xXt7qNVay
 h+5aoTpmR1OU7nCWNmRI0FMkBc8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61667a02ff0285fb0aef5262 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 06:17:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6AED0C43460; Wed, 13 Oct 2021 06:17:38 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DFB2C4338F;
 Wed, 13 Oct 2021 06:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4DFB2C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] MAINTAINERS: mt76: update MTK folks
References: <5b452d209fb97be1a39a2d7775557bc8f43bd07c.1634104734.git.ryder.lee@mediatek.com>
Date: Wed, 13 Oct 2021 09:17:34 +0300
In-Reply-To: <5b452d209fb97be1a39a2d7775557bc8f43bd07c.1634104734.git.ryder.lee@mediatek.com>
 (Ryder Lee's message of "Wed, 13 Oct 2021 14:03:23 +0800")
Message-ID: <87y26xzbwh.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_231750_690806_3F02193D 
X-CRM114-Status: GOOD (  16.24  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> Update entries for MTK folks.
>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeb4c70b3d5b..6745119b70bb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11818,7 +11818,9 @@ F:	drivers/mmc/host/mtk-sd.c
>  MEDIATEK MT76 WIRELESS LAN DRIVER
>  M:	Felix Fietkau <nbd@nbd.name>
>  M:	Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
> -R:	Ryder Lee <ryder.lee@mediatek.com>
> +M:	Ryder Lee <ryder.lee@mediatek.com>
> +M:	Shayne Chen <shayne.chen@mediatek.com>
> +M:	Sean Wang <sean.wang@mediatek.com>

I don't really like of having five maintainers for a driver, that just
usually ends up that nobody takes responsibility. I would rather have
just one, or maybe two, maintainers and no more.

Reviewers are of course another matter, having more of them is just a
good thing.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
