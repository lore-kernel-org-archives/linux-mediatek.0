Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EB5C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:54:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B213D61449
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B213D61449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pLOkcaqSjgqGDT6H1mUCizOcX2SvER09yWKApaNz6HE=; b=mfOjBctRW47ab5O3eCbT0f1WZ
	GKbaf/PBvtXxvBlDBmCzjKvNKuAbQoSI9/SjRedZfM2YwW/TeWdDVYqhrypaSBYZj/5/7k1bvovYq
	5/NqbDnABjsuS+sACW0Qkf4c+VHoYJJ9d/vc+h2oWkSMZk0Y1iAqPbD1M6B+0xLlhDBNScmDPb1np
	u5FnJHsmtVlYreU/2iLV0uC0IrEOPX+q8L8Yupii4qRblA8zaswhijf1lV59jwj0IqDIbatnKXCoz
	sJfeWD7oGeKznwDaI+fkgNoS2AIUEuDbmsLP8sdZv+fQ0oNq9pjh+7mh7FmfapHHZjOQ1vXYnUFMS
	eY8lW4auQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcSf2-007rtD-9M; Fri, 30 Apr 2021 12:54:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSem-007rs6-Qh; Fri, 30 Apr 2021 12:54:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KuZTmw81itczinnfveg9NVcr98liz/QsB5owyxpu5+0=; b=DcF5rWdZUvq3O6Bqg4kPNmHEvv
 FDj0l5FNtWI1xyhG6hGHtEV76eCo7sK/QX6pmX671rPpP34mXYJRCi/+NlKwzhU5dlD2l67DkIy2O
 STbl8Ay6R/JWpRMqs0N8n+H59v3CkG95kP7AxxfLfGL0PkgVqkkp4JcHJMaCOCWob2+aRICfIbHDb
 Vzh1nRPADHIFizmESWstTiGaLbxKNPC1Q2eaKCEIKtyyjJoB6HfeTNWnO0rRwgEKDXT1AtnX4eFrn
 D9TPe6NvbeDCJ9m9noQZo4aKpNvL0k8vUrjSnxIADsFMYGjpmOgqhxd6GNI0BWPaBpnUK9Qk5FdNJ
 BfeSEVFg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSek-001Nxk-Dg; Fri, 30 Apr 2021 12:54:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EC66613CD;
 Fri, 30 Apr 2021 12:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619787245;
 bh=0iKvadesmEvFfj6X+zy2icbY3wPZ4V1ZhwlLc348ZpQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pqb0DWYa/KfLbhNyPj8vag80x5snUEaWO1N54mAW55iwnccAiseYMoGEeGms5U16O
 FdRoYqzwemZgqR03dVBW3fSHP/UNHXcZ2ueh7lJrjGyLLK02j/gIt3khCqQ9Zlyvdj
 6nuGYgvzVNnQeYgvOcN4dPyyM6xjqjLxFLMYwLW0=
Date: Fri, 30 Apr 2021 14:54:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org,
 Frank Wunderlich <frank-w@public-files.de>, Bin Liu <b-liu@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, David Miller <davem@davemloft.net>,
 DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH] musb: mediatek: rename driver
Message-ID: <YIv969BCnPgXzrcg@kroah.com>
References: <20210430124317.97376-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210430124317.97376-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_055406_522932_3F46C175 
X-CRM114-Status: UNSURE (   8.29  )
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

On Fri, Apr 30, 2021 at 02:43:17PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> currently unspecific mediatek.ko is built,
> change this by adding subsystem

I am sorry, I do not understand this changelog text.  What are you doing
here and why?

> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/usb/musb/Makefile                   | 2 +-
>  drivers/usb/musb/{mediatek.c => musb_mtk.c} | 0

Why rename this file, will that not break existing setups that expect
the module to be named this?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
