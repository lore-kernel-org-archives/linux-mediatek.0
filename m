Return-Path: <SRS0=EyWE=O5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 19:04:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6EDD60F6E
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 19:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6EDD60F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKhGZ+fwv0r0Uj0m6Td13O0fgEk4W6Cik4SSO2ZtxLM=; b=aTLpBB9CtlnDzp
	ch1HOm23QpIByB6frXdAfEncEJq1WMT7Er1x3aa7D3LI/3IzJ/U/ftZTnY7u/fSDepSx/T3/ksRle
	Am1b/2Mrj3J8mf5cBX+DSK4/gfWF7VSsaz0xlVHukj9AbvXh3zmnfllS5LTZkkos8bb6dZ0tZgb3M
	1YWxl/U9sSOb/wILZNvogH0LOsGRFC0WM7WLcCuKyEpFF5ioR1P/X7fxabLLStlP9cn+ddUMeytro
	ZJJ98pxWsyyszQimKoiNTLPmQ6y0dykVH1emv4VfWNNC373ryZ96SWoU1xKEUBw+4XDMYyyB9UNCG
	dX4GaU4R22llWagnqZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZHdI-0061Pa-9u; Sat, 09 Oct 2021 19:03:44 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZHdF-0061PI-Ow
 for linux-mediatek@lists.infradead.org; Sat, 09 Oct 2021 19:03:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633806219; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=DEVHqhERMyF+yDvTD6c1J+XFH/EcPQz2B8BOjcV+97E=;
 b=GijrIyjuwCJ+e4dQ1bfyzVGY42I5mXWSAjJ9pGjuK9ngSkL38bXzngczTrX3XrbWy1kHcgGW
 SKTInbBE+xTgX5wsUqwnW85Ryj5ONXs0sZHdIG8/EKuaFT8zGzq9dnUaTvSaKYKaYtePsbyF
 89dO/VPwnaWF+gi8E2EdLaUwjTw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6161e78aab9da96e645e4cbc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Oct 2021 19:03:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A1FA7C43460; Sat,  9 Oct 2021 19:03:37 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F270C4338F;
 Sat,  9 Oct 2021 19:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6F270C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 4/8] mt76: mt7915: fix sta_rec_wtbl tag len
References: <20211001095355.10598-1-shayne.chen@mediatek.com>
 <20211001095355.10598-4-shayne.chen@mediatek.com>
Date: Sat, 09 Oct 2021 22:03:30 +0300
In-Reply-To: <20211001095355.10598-4-shayne.chen@mediatek.com> (Shayne Chen's
 message of "Fri, 1 Oct 2021 17:53:51 +0800")
Message-ID: <87y2722f7h.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_120341_920820_7936A4ED 
X-CRM114-Status: UNSURE (   8.16  )
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

Shayne Chen <shayne.chen@mediatek.com> writes:

> Fix tag len error for sta_rec_wtbl, which causes fw parsing error for
> the tags placed behind it.
>
> Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based
> chipsets")

Fixes tag must be in one line.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
