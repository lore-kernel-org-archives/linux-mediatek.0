Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F77C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 05:54:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3641F60C51
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 05:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3641F60C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:
	MIME-Version:References:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cLjwK28ZldKadCFQ4NsNtEOAHG2qLI1ws8xlnvBigU8=; b=E8F3/mjK+1mr7nrJ2kTrl8kJH1
	eL7KN8CODuIjWqxf74UYxf97gU0UgwMVq4uLzl3Z4a3giD0bsYIH8vpmy88cDKzUYiEuTt5n8Obj3
	agOV7Juw7xQAgzK43RAvpq3raigaLfZFxXq1uPeFZC5ztzuF5Dr+1/I0ufX69bXL5dX51WQgKpIP8
	DEHb5QIWHxCjCza46lPWYar6lgTqraB0qykiw8K8xT9U0dKq296eCpxpAtzBTbf2w5RqHa56wz8Wt
	KX5lD1InGTaV0VoULq/5Wfwn/BobraKlmjSwxkSRcfwfszhp8v/7WceQ5nkLmNrBkCUhOcDOTEhoN
	8aCuTmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8yzr-003B4r-SO; Thu, 29 Jul 2021 05:54:19 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8yze-003B3Y-JC; Thu, 29 Jul 2021 05:54:07 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout2.routing.net (Postfix) with ESMTP id D25AD5FA4D;
 Thu, 29 Jul 2021 05:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1627538044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVlxDO10y/7Na3xuH5jj4ZdMVQFeOoVyuZjIQ6RviyU=;
 b=Uq1sKiNjQJ0Zm+dOb18ivYGNCHTeMkuK7PpObxwKV/2oWFOlKyIKfQcCaDmo53VZyAFv/I
 UNXYwyw1iWllc7hzvApDMnXNPS6gO8p/37Sij0PbV4uvnsJkPYVIrq9p8bNW0mzdHhaLca
 mVnHVi/0XGal+BIVCfAUJwxGXLjM5ac=
Received: from [IPv6:2a01:598:a001:9235:1:2:c0e0:123a] (unknown
 [IPv6:2a01:598:a001:9235:1:2:c0e0:123a])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 0D6968001F;
 Thu, 29 Jul 2021 05:54:03 +0000 (UTC)
Date: Thu, 29 Jul 2021 07:53:58 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJMQK-gQeMidjBZ1E=ReMmffC5G8oiFawB4Ey1PNb2ZWXw_1Bg@mail.gmail.com>
References: <20210727174025.10552-1-linux@fw-web.de>
 <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
 <97C4FA94-B28A-4F0E-9CD3-4E33B01BA353@fw-web.de>
 <CAJMQK-gQeMidjBZ1E=ReMmffC5G8oiFawB4Ey1PNb2ZWXw_1Bg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] soc: mmsys: mediatek: add mask to mmsys routes
To: Hsin-Yi Wang <hsinyi@chromium.org>
CC: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
From: Frank Wunderlich <linux@fw-web.de>
Message-ID: <6BFE13A3-6A42-455E-BDF7-CD285CC6C66D@fw-web.de>
X-Mail-ID: 35ad2a0b-3622-4f69-b59c-67b9f9caa6aa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_225406_827555_703E9BBB 
X-CRM114-Status: GOOD (  10.07  )
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

Am 29. Juli 2021 07:47:03 MESZ schrieb Hsin-Yi Wang <hsinyi@chromium.org>:
>On Thu, Jul 29, 2021 at 1:40 PM Frank Wunderlich <linux@fw-web.de>
>wrote:
>>
>
>>
> struct mtk_mmsys_routes {
>         u32 from_comp;
>         u32 to_comp;
>         u32 addr;
> +       u32 mask;
>         u32 val;
>  };
>mask is not the last element, and mmsys_mt8183_routing_table = {
>  {
>    DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
>    MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L
>  }
>...
>so the mask and val will be wrong. CK, do you know what mask we should
>set for mt8183? Or can we just set a dummy 0 mask.

Ahhh...mt8183 has own mmsys-table and
i had only changed the default one,so
value is now missing because value is now the mask. I have used same order as
CK to avoid confusion and make it easier
to review.
Afaik you could use same value as value to reset same bits...did this in default routing table too.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
