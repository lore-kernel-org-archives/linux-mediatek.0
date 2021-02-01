Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D379C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 11:34:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6F5564DD9
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 11:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6F5564DD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=glPOs9fBdbvQajFK7buiuVWJwE5ThQBvQdkjF+ZzwL4=; b=BHVQCgGkyoV+ZcMdMIxOkRWMS
	DkqoRt/D+PZ5rMyw3/aOS037NZ+WZ1y0uhzwzf2PrTgeFUFcE7feWWAgORDfp1sQx74KTXF54ODDO
	irSq+OOIWJSGdAb+vFVs50vFNd/qSxPnSk/B/wz18ifJzwhLU0D1mBefITTiuzh6sR77z1mfKHUcj
	i3QyvgI1xlGMGKs7bN0po1EK2FapTfVtiPtoffa0wJ6hzefX6pT1gaUfjjadE9C3RnX90iO3zcKGn
	4T5OHn6alFTLheSHDdzaoNab1vWzPk714jyLkiU0QLp/LY8rCCyDb5oDTCM8LE0PXQtLLvI8ixDvs
	aCeNWnsXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6XTB-0001A0-U5; Mon, 01 Feb 2021 11:34:13 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6XT9-00019T-3B; Mon, 01 Feb 2021 11:34:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id m13so16191616wro.12;
 Mon, 01 Feb 2021 03:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZNr3sMKKnD+FnPD7K7m44WYel5d+QW2CiDuUnxj1K0=;
 b=pOgF7050DDMF+0ni2siGBRYu9wk/5bIonCV8Ux4PP0U3H035s88/lCu8cCr11nX6mT
 O0kHxaLea3EfF0CM50eJX3d9oM7F1TQisk8YbmApU78zbMm1tufyACMBtuEqJtHsTNK/
 ckyJ9ZRdVTS4+mogDT6AqR0d+8hfSkO4UruRULHFYvJ6B2JDSAaNzSs+jhphr2n7Bzq3
 UNsh9O2YePInbFYZq4mgWgQKxPm3rNYqbos4cE4spwJ8XqwMKUgbTWySLD1boEuSNk5F
 eRpnL0fEDsYCyFNS7ORO/wDK1Gt9UNtzdOqv050cvwehmWQ5ZDONUZLjA4aL5um4sXXk
 Dp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZNr3sMKKnD+FnPD7K7m44WYel5d+QW2CiDuUnxj1K0=;
 b=UeGfIzoV5c5JZ5KixDw66RDLfBr8qHSqlzfLH5jBXIOqHLXq/EQCHsvhkYxBcTFfBd
 KbQI7kTZ1N0q1glVkl0kr+3KcUhCgxnKXtSVeUFPlpJJdwc3c23vLhmnD5dxvvLbu3rz
 IQAAsJvJBwxkhTB5gSord598KdWeajeLXfcP8XD3mDewpWWi5T1eETepskx3iztnGI9U
 /qcgy/wM8pLSUIuo1tSyX+esQRIFc1t6ESznGMHzhMHVPGIzGhQV6xOOIzGpL2e48cJg
 p+bPyQ2Jbg48xk+LE+0rTwA8QyQhfs62dVfxLtu58TF3VEs0LA+XcI9Fvl9CmAZCoVmi
 DFMQ==
X-Gm-Message-State: AOAM531eSPKvhpQHGm6xaROOXLJZvOKovQ5yKQjIDr+HfPewfJF/seRO
 KiLHgdP6BJefJlADP1qNZns=
X-Google-Smtp-Source: ABdhPJw2S2gHxASL2Jaw8ZDxBzTE3cbM0wCuuk8Uefr0JFOky3ssVY2sOlUg5/XpIByXJQJXFq6mWA==
X-Received: by 2002:a05:6000:12c7:: with SMTP id
 l7mr17511316wrx.103.1612179249622; 
 Mon, 01 Feb 2021 03:34:09 -0800 (PST)
Received: from a-VirtualBox
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.gmail.com with ESMTPSA id 62sm21188427wmd.34.2021.02.01.03.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:34:09 -0800 (PST)
Date: Mon, 1 Feb 2021 16:34:04 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] soc: mediatek: pm-domains: Use correct mask for
 bus_prot_clr
Message-ID: <20210201163404.0429fe00@a-VirtualBox>
In-Reply-To: <e4961c5e-db52-148d-c414-25f16101fb3f@gmail.com>
References: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
 <20210201054542.1470695-2-Bilal.Wasim@imgtec.com>
 <e4961c5e-db52-148d-c414-25f16101fb3f@gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_063411_160035_3232C10A 
X-CRM114-Status: GOOD (  21.10  )
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
Cc: weiyi.lu@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 enric.balletbo@collabora.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 1 Feb 2021 09:59:47 +0100
Matthias Brugger <matthias.bgg@gmail.com> wrote:

> On 01/02/2021 06:45, Bilal Wasim wrote:
> > When "bus_prot_reg_update" is false, the driver should use
> > INFRA_TOPAXI_PROTECTEN for both setting and clearing the bus
> > protection. However, the driver does not use this mask for
> > clearing bus protection which causes failure when booting
> > the imgtec gpu.
> > 
> > Corrected and tested with mt8173 chromebook.
> > 
> > Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
> > ---
> >  drivers/soc/mediatek/mtk-pm-domains.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h
> > b/drivers/soc/mediatek/mtk-pm-domains.h index
> > 141dc76054e6..7454c0b4f768 100644 ---
> > a/drivers/soc/mediatek/mtk-pm-domains.h +++
> > b/drivers/soc/mediatek/mtk-pm-domains.h @@ -60,7 +60,7 @@
> >  #define BUS_PROT_UPDATE_TOPAXI(_mask)
> > 	\ BUS_PROT_UPDATE(_mask,				\
> >  				INFRA_TOPAXI_PROTECTEN,
> > 	\
> > -				INFRA_TOPAXI_PROTECTEN_CLR,
> > \
> > +				INFRA_TOPAXI_PROTECTEN,
> > 	\  
> 
> BUS_PROT_UPDATE sets bus_prot_reg_update to true, which contradicts
> what you say in the commit message.
> 
> Please clarify.
> 

Yes, that's a problem in the commit message - Will fix and send out a
v2.

Thanks,
Bilal

> Regards,
> Matthias
> 
> >  				INFRA_TOPAXI_PROTECTSTA1)
> >  
> >  struct scpsys_bus_prot_data {
> >   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
