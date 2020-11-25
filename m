Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B6AC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 02:43:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8242068D
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 02:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZGgltxAn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hdzdf2N1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A8242068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uUmh2L2SdioVytJr6kHria2GZ86ueOoskbajyZQF/HI=; b=ZGgltxAnfMP0DB1amPMaGP+Je
	us4Sxupzy89KmtuQFbFhTuZAoJi9f01mMN5/aSJVPRIj0Bq2ZMT+V0CPmEhefq0i6zroUSvbUXYTl
	cwBEx3orrfS/L5lvEsvonl4f/60V0w2jccBXb+HPj7I/0bZy3bGYKglFgZZWmAgXCWyGG87J/TvbQ
	Aq7cnOVUOR/9RJQ43IfwFWNAfdTtJB93X0ff9WAZNcJ6xcQO3dW21dWLfHmnOUjd2r1RRroEcNqwQ
	6FsXHIuNE3JW3/U0KrPx+aDDltnxic8Au6F4MAdl8bbmdNKgvOAD2GEUT0O/JfftD8obS/BZ80nqH
	vIxCdhZgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khkmY-0005Ki-CG; Wed, 25 Nov 2020 02:43:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khkmU-0005Ji-4K; Wed, 25 Nov 2020 02:43:43 +0000
X-UUID: ea10cb28d1d649c7bbdd6d663d6338db-20201124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=d3nr/xPB4/Ytmie+cSNJY9sU92H7/I+2d3g8d6Ae3Dw=; 
 b=hdzdf2N1UKhfpIXPW571fE+ZE//9Evis6CiDaxJgUPiMzjrsLzuMtFINiUrTY9QUDO76yXpEhdiy4C0VyAyvFHtr3DWvsza01ng2Ua33CGPVXfFSN03QF3Ox8Go45ksVec3KoJVFq8DfCVjx/vjEug67BxMfyqkOm5oCNTzeQNg=;
X-UUID: ea10cb28d1d649c7bbdd6d663d6338db-20201124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 334946230; Tue, 24 Nov 2020 18:43:29 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 18:33:31 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 25 Nov 2020 10:33:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Nov 2020 10:33:29 +0800
Message-ID: <1606271609.7284.2.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: mtu3: replace spin_lock_irqsave by spin_lock in
 hard IRQ
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Tian Tao <tiantao6@hisilicon.com>
Date: Wed, 25 Nov 2020 10:33:29 +0800
In-Reply-To: <1605515682-23771-1-git-send-email-tiantao6@hisilicon.com>
References: <1605515682-23771-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 38AEA4F68145BA0AE654977F218C7D5F37B2304FC5A015F89CA984A57FCCDBFB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_214342_410486_C7694338 
X-CRM114-Status: GOOD (  18.36  )
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
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tao,
On Mon, 2020-11-16 at 16:34 +0800, Tian Tao wrote:
> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/usb/mtu3/mtu3_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
> index b3b4599..a6d7684 100644
> --- a/drivers/usb/mtu3/mtu3_core.c
> +++ b/drivers/usb/mtu3/mtu3_core.c
> @@ -745,10 +745,9 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
>  static irqreturn_t mtu3_irq(int irq, void *data)
>  {
>  	struct mtu3 *mtu = (struct mtu3 *)data;
> -	unsigned long flags;
>  	u32 level1;
>  
> -	spin_lock_irqsave(&mtu->lock, flags);
> +	spin_lock(&mtu->lock);
Sorry for late reply, I prefer to leave the code unchanged.

Thanks

>  
>  	/* U3D_LV1ISR is RU */
>  	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
> @@ -769,7 +768,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
>  	if (level1 & QMU_INTR)
>  		mtu3_qmu_isr(mtu);
>  
> -	spin_unlock_irqrestore(&mtu->lock, flags);
> +	spin_unlock(&mtu->lock);
>  
>  	return IRQ_HANDLED;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
