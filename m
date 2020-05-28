Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61BFC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 23:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B42802074B
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 23:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LLYYvHoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B42802074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2l+XSFplzO6deYB3kpWOEvoYMON+9kWTFmIbbQWX26I=; b=LLYYvHoXsKYS4t
	QfhDTzw0qX0mwTgY7PVxU+bNjrpFAaGvCdrkMOHUPd5hYwRrh5QWupCoLhh0f5SnQrglRZs8AUZht
	YrA223odPD6HP+o+GBwR+zB03bModqwMoRZ1ZYy0XLTtmbb26Zl/83Bd+C9/H+wCPKK0xLipGyuiB
	TiCddtHu9sDMtxfaMDFhVkmYxc0uKuZIU0MxfiqDBIbD8MYlkrbtGiySKaUUOgYHBW/GYjAtAxFwg
	0MnoBksfUQKOZHiOny42FFxrJAFYgXkpFH//f2hxfBOM903HpuKRSuiH1cD4/lndbSSxuWjXR9mk2
	QvvRzShQwqjJXqGIMCxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeS8M-0002cX-0i; Thu, 28 May 2020 23:40:22 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeS88-0000xC-1X; Thu, 28 May 2020 23:40:09 +0000
Received: by mail-io1-f65.google.com with SMTP id c8so416994iob.6;
 Thu, 28 May 2020 16:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i4Y4lPDTpEphgjWEfCEtO/CC6ipcnlKyUlBGCBDZA24=;
 b=C7exfhhFpkTi9olRDDK1xCu40ALwnlq7guEhu5G3X9R9iBqEEagWSKP917Bmwc067U
 ZOnGu5zwPQX6iBXV1xsy7crnvJ6h9CNq4rxMiqKl7cprqdqDaYVyyS5Nh8PtwgUkXej1
 q6kXuLBS78B94+1RjRnCBhv+ZAxvsfvdvMRdCjy4n6HCGV1vGwy0whu7vNCFBNG13T9g
 KIDMvUfi73dq0hw/LaCDWo52oD0W/WS5G5zgQO69kovmPlxx6VjxVKvzCZoAI67KLPPM
 RtRMiwCsfl1N9a1WZNqMnRYOKlBdsFtRUmy2fX8QDcACItIg2qzNsXI8RgoyJ0bIXHWm
 Ya7A==
X-Gm-Message-State: AOAM533tuBF5LySCU2QrNTw02L4qZapYyS5mXKH4FIXnEP/EdzpVX60t
 zsEsT+8vuRxpNvdFpULDLw==
X-Google-Smtp-Source: ABdhPJy8BW9eTIOl/ecKA/VdytHdPNFmsc9AalD1NorbWXq7ZqfpCfTOjU89LHuDt9aD//1FAEZypQ==
X-Received: by 2002:a6b:d311:: with SMTP id s17mr4429829iob.18.1590709206102; 
 Thu, 28 May 2020 16:40:06 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id i2sm3111578ion.35.2020.05.28.16.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 16:40:05 -0700 (PDT)
Received: (nullmailer pid 891407 invoked by uid 1000);
 Thu, 28 May 2020 23:40:04 -0000
Date: Thu, 28 May 2020 17:40:04 -0600
From: Rob Herring <robh@kernel.org>
To: matthias.bgg@kernel.org
Subject: Re: [PATCH] dt-bindings: dma: uart: mtk: fix example
Message-ID: <20200528234004.GA891377@bogus>
References: <20200523201530.18225-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200523201530.18225-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_164008_105079_238C6C4F 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 23 May 2020 22:15:30 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <mbrugger@suse.com>
> 
> The binding example is missing the fallback compatible.
> This is needed as the driver only matches against mt6577.
> 
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> ---
>  Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
