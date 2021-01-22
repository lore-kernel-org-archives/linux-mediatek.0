Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CD3C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 21:32:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F1523AF8
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 21:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F1523AF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6D3KbnldhtH25kpqYcGNTShONYkiRxUVA1JZcFp1XwI=; b=PnF4Kn1ZXW9qbadBULnDyKArl
	gwSHbNmk/T+A6hcVOsGIxckBm4jNZ5vZ1Pja56imeP8f92p1W9mE+fREyRisnbmR57B2fLYkW5OEx
	6LnYwSBBDtg0G2nVhUnsaKg1b4Ztgt1WHH2lCyetAe7l8u0cS9Q+u8U2rw0K6HYPFGoOHzdc7qbMY
	rAntBiLj1kdv2g1BN9nmPJgFxDI/x67wsOU/pUeXfSBRrgcSOgd//LYxBeMqlNkzSTi5Ea7L98Dd2
	mdk22FumkSShezepf5ql2VxVpJ862p/J3HPdbba/aar7Et8Iiev3s61/oG1+zW8NlE5xDereAMe7i
	uzFpffhCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3424-0004Gj-Hy; Fri, 22 Jan 2021 21:31:52 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3422-0004FM-Eh; Fri, 22 Jan 2021 21:31:51 +0000
Received: by mail-ed1-f45.google.com with SMTP id f1so8133867edr.12;
 Fri, 22 Jan 2021 13:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xKbz4bexTx7l/78Slh9DnlQKMn+C9Oab3FDAuPgpk2E=;
 b=Cmb/uFgLU7+F/l85Q8pIyEtn8SYIOedj0uC6pSN7rlWJfBqg5ytLRxIDHV2zzR2pCM
 DShqzxPuMVgPSCOzoqCufOfoQiOQPRAP/XXnif49PvQynyO5Pya8zah9gaMxw1Y+kNUl
 bURc/bDOvRsvvF0RM27e+umFKa7AfPMvYZAqPTBhff/8O2VrNWLoCV9sORFE/eLHE4Oy
 S9Z9NAIcQ3ohLY8pq+rD14T9hD/8qxvoUKf3irh+oSrhFzQ7rghDLDQHzhiMv3nbSA50
 0ZxRx/FZVm1Js+vAJ6Yv1PZjbbEmIHfeVBKb66nqcOMIZjLYFSy4kapTSmUNuf8/WFdc
 apHQ==
X-Gm-Message-State: AOAM531cqOFT2H9Le3D+QJk38JwECHGO6O42LxtRZqoVnrxriASweCH1
 cFyyA8azzxtPmASLtfmqX94=
X-Google-Smtp-Source: ABdhPJxXm/UbYQOfzbAmGUe58u7tjks2ZQmC4I68zUxUVhfyqoVwnv72PHYQdHbTCixwPsYtg2RNUA==
X-Received: by 2002:a50:934a:: with SMTP id n10mr4681152eda.26.1611351107962; 
 Fri, 22 Jan 2021 13:31:47 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id qh13sm5216877ejb.33.2021.01.22.13.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:31:47 -0800 (PST)
Date: Fri, 22 Jan 2021 22:31:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 1/3] memory: mtk-smi: Use platform_register_drivers
Message-ID: <20210122213145.ampvsg4egk7yiz55@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121062429.26504-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_163150_501529_8D50795F 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 21, 2021 at 02:24:27PM +0800, Yong Wu wrote:
> In this file, we have 2 drivers, smi-common and smi-larb.
> Use platform_register_drivers.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 25 ++++++-------------------
>  1 file changed, 6 insertions(+), 19 deletions(-)

Thanks, applied.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
