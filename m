Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FA3C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C0A560527
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C0A560527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=csj6MPiYI2Bdp1V4CPfTTz6jnacCr6NQIj2iSTdkxpk=; b=rfG2Alu/WIS7P6
	IZYXULYTsxIFXlCZQEH+z9IIUbsHZlf9noevSnGZnMnFXhasn0Me0f/xuQOAYMr4ENbhkjSDeNldL
	2KpYBJVnlUS2TK/b81jkU0ETds6jdATNoKsBfje47cyWIH9CYPUpqUoSTx/Wtiy1h5o7a25Af92k8
	UIPJCKj4DuV4dfRQaSJwFTaCp9vNCo3naOSy7qpoNxWS4ESQKd+6wDswShW7WUoqQLQIC380ECLCk
	fEUvdzFIbRHBukm911KA2c0X+LHwmesUoJ5HASqYhnrhCRIHV6EHSSmLFj6YGEJKKqXB1wpO+jPVa
	QooCDCexYjyCMByAW73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAYF7-00GSyj-4W; Mon, 02 Aug 2021 13:44:33 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAYEn-00GSqF-KH; Mon, 02 Aug 2021 13:44:15 +0000
Received: by mail-ej1-x636.google.com with SMTP id nd39so30984934ejc.5;
 Mon, 02 Aug 2021 06:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zZ7rhldZ+cdc9EqfS9Eva0TvOjm8dfvenVKVtcg422Y=;
 b=IwbZ6B+pF47Xng1s78mPiBUYaQ5aBKg3wm/z8Zf+dRDnd9JHqCPeZeSzfgBLfgz3Pb
 kzwakyr7T0qbulvNT2eSNH0cuOZhn5PBMOTRHBas9FrrjhvKTAz868D/W8Ag3Toue/ku
 o6jkzQpVcaJW922zxSaKshF62ZnI7FfDbD4Q78D9w/PiMHRZHtdk1f0urAMDer7wxQYr
 pBn1MSW8X4mVo/0msyUj5KRWENimLDq9FJelqpMvGyyO4jz1HHrHKn6cZ9XMC/owXE6K
 WPXn2665pW5/qU+KKW/gVMGz12PC/DOytMgmM7lTJHIR6gCt+FoZ8HPe0aQXYlwXdqba
 l28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zZ7rhldZ+cdc9EqfS9Eva0TvOjm8dfvenVKVtcg422Y=;
 b=fyb175yCfD6KdS/LMYr+DViILWLXtRgqfIrcNMn3E6OxLE8QCVZVWYpl8IcGkYO3QT
 /kKB++PXCPMzTrP3iJFOD7e/oCWGiAuYF7CZVsr28xsEklAIwT4q/zuTjKng8f90c+0z
 gmKzm9EItP7YT6rnMRP57NI3z0GkBydtyz1Y0qwN3+sUNiTxsufMPDJ8QguiJSasZcyA
 zy6Tyl+94csFvhM79Zt83bLBzG3x21N3SHb5y7t2kdgw6wx1xYJFDM7mTxCL7DGbxAhz
 y6NGt4r0+L5H4uRj8/YS+oGq8YOeMCt2bcUDMtP3twZ/nvw9jZGHD8rOhBbfsbBuLrfH
 1UtA==
X-Gm-Message-State: AOAM5317kECDKewi/H9IHxpYBavwpI5/hOKLJTbneRlLS3gdmiXqz9k5
 Sfcx65aY31P1tDQ8IPZNWys=
X-Google-Smtp-Source: ABdhPJwts+YudSRSXy9pRi3a8kYt31p4mHowDXQpv05buLyULTEyz+FI7GaE1wMik/sIkdeWkeZIfQ==
X-Received: by 2002:a17:907:9d4:: with SMTP id
 bx20mr15480021ejc.123.1627911851716; 
 Mon, 02 Aug 2021 06:44:11 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id p23sm6267915edw.94.2021.08.02.06.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 06:44:11 -0700 (PDT)
Date: Mon, 2 Aug 2021 16:44:09 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 4/4] Revert "mt7530 mt7530_fdb_write only set
 ivl bit vid larger than 1"
Message-ID: <20210802134409.dro5zjp5ymocpglf@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-5-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731191023.1329446-5-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_064413_722745_FFE5D0D1 
X-CRM114-Status: GOOD (  17.04  )
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

On Sun, Aug 01, 2021 at 03:10:22AM +0800, DENG Qingfang wrote:
> This reverts commit 7e777021780e9c373fc0c04d40b8407ce8c3b5d5.
> 
> As independent VLAN learning is also used on VID 0 and 1, remove the
> special case.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
>  drivers/net/dsa/mt7530.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 38d6ce37d692..d72e04011cc5 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -366,8 +366,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
>  	int i;
>  
>  	reg[1] |= vid & CVID_MASK;
> -	if (vid > 1)
> -		reg[1] |= ATA2_IVL;
> +	reg[1] |= ATA2_IVL;
>  	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
>  	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
>  	/* STATIC_ENT indicate that entry is static wouldn't
> -- 
> 2.25.1
> 

Would you mind explaining what made VID 1 special in Eric's patch in the
first place?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
