Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03973C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gklS3FAiP8CjmVjxSYJByCBxxX2M8eLNPi6SGKg0SSU=; b=CYm7Y3wgDqSWM6UAdTBh2dpdMY
	WzJxyD0gnrwfXJkDjDT5AriiJTsfhJVpgkaXQ4FwUlesdTYbabftDEmh/US9ofcyHJgR/2ORwWOk0
	5KX6yhN8HkDTaOpfgVgAXNY3EWlAE/dnMUILdMp0Y3AG+Nxb1E+LHubqoeezcuq8zaGtztXBXR7gP
	nuBKpNi2cJ5NyOO7uDL9dk303jC+4KoXtXp8TTwPY5HVa9gzunZIlMKD3FCAqYfb37A3OQ1/cOWLO
	OhUTJ6hd2W25NCs5evNqLEKwXXzteFE9QCwwWQ+2Hvg8bO+kGPdV9DZPge3OwRfPapR/KOjFwQ3ZM
	lDWrw0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQNoe-004bx9-Jp; Fri, 10 Feb 2023 07:27:28 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQNoU-004buW-3L; Fri, 10 Feb 2023 07:27:19 +0000
Received: by mail-ej1-x630.google.com with SMTP id hx15so13363113ejc.11;
        Thu, 09 Feb 2023 23:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gklS3FAiP8CjmVjxSYJByCBxxX2M8eLNPi6SGKg0SSU=;
        b=LP3fB0sauO/2tmXyRx85cBUpb6irgkVj5mLS6jLKWiSk2ijBn3h476Y6cPPmen71vX
         sleFX7p1axeIlv5Q201fJy4FPuxsTA6z4zGwcnMHrWQCTqg96ECmIZrapmGYMUiIbTsg
         b/az1LvPqX3Xef3uubTKxQPda6krQZ+a5xi4aWrdVZQQpRBjeuCSW0enPCVgZkdaO/7Q
         W/+niQL6R0Ep4itcHj32QTrXV2p1/LGD3iFSezkPkPvhJtn8nNmnz8nEmWnGKX05VWNW
         rTdm8YwYy+zKzk3TPLdTBO0JYi0XUHggOy4dv7bAEPfaC9evPxRTCe9bK05EA5KCh3P0
         4New==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gklS3FAiP8CjmVjxSYJByCBxxX2M8eLNPi6SGKg0SSU=;
        b=YwStL7FspplSJSJz8ABusYQVtSqeRZ38SoabexFieY6+KOWw+SpLueTOIYFJMQBAsB
         HIxk9ZUeTcd4+H+x8CiL8qZiJBaE1YCmromncJlCPdklROnse9vzJ0DIl9iXXesBFn3T
         54GMTYY/9wRehsqhvze325EtJoU2/B77Y0wnQ2r2xeACDs8vgL1uT7QUkKx4sKJOa6Ry
         q2gai9VMseF2Afm1UHD7cIvdA/Qa7QFWbqbcC1METiLMqNkY5NeEAL+9vAm4Pi8CeGVI
         kmywsd1YERWY7NeurMrNMZtxPsCt97D23eqh5Aq9QJjkWKHci+MUpu0powAthlNjrJCb
         YoHA==
X-Gm-Message-State: AO0yUKUzJf15fSAZCXnanA2/3mHjPcXuDzUCT4CKPFXIt8xOTplsHg+0
	KperT/HCO+6fkLhpQRW6ql4=
X-Google-Smtp-Source: AK7set9ItifQev8+p52y0b5h6z/ngAGGDwVCaKSgu4+C6cUktAAmwUb53s5HzuzYJZGsMdxceXgSPw==
X-Received: by 2002:a17:907:3ea2:b0:8aa:a802:adcd with SMTP id hs34-20020a1709073ea200b008aaa802adcdmr17054242ejc.30.1676014033423;
        Thu, 09 Feb 2023 23:27:13 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-57-202.cust.vodafonedsl.it. [188.217.57.202])
        by smtp.gmail.com with ESMTPSA id k6-20020a1709065fc600b0081bfc79beaesm1972542ejv.75.2023.02.09.23.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 23:27:12 -0800 (PST)
Date: Fri, 10 Feb 2023 08:27:07 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] media: mediatek: vcodec: Force capture queue format to
 MM21
Message-ID: <Y+Xxy49JcqXlKADI@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20230209074025.1816-1-yunfei.dong@mediatek.com>
 <Y+S1cA4PXT1MVJm8@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <28f167b7-c468-8752-29d1-2a122e8142dd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28f167b7-c468-8752-29d1-2a122e8142dd@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_232718_159820_131616A5 
X-CRM114-Status: GOOD (  19.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Angelo,

On Thu, Feb 09, 2023 at 01:56:45PM +0100, AngeloGioacchino Del Regno wrote:
> Il 09/02/23 09:57, Tommaso Merciai ha scritto:
> > Hi Yunfei Dong,
> > 
> > On Thu, Feb 09, 2023 at 03:40:25PM +0800, Yunfei Dong wrote:
> > > In order to conver the format of capture queue from mediatek MM21 to
> > > standard yuv420 with Libyuv, need to force capture queue format to
> > > MM21 for Libyuv can't covert mediatek MT21 format.
> > 
> > Sorry, just some clarifications on my side, just to understand :)
> > The problem is that libyuv can't convert mm21 format into yuv420
> > than you need to use mm21 (forcing this).
> > Did I understand correctly?
> > 
> 
> vcodec can output either MM21 or MT21C; libyuv can't handle the MT21C format,
> at least for now, hence he is forcing vcodec to always give MM21 for things
> to actually work... at a later time, I hope and suppose that this driver will
> change to not force anything anymore.

Thanks for the explanation!

Regards,
Tommaso

> 
> > Thanks in advance,
> > Tommaso
> > 
> 
> Yunfei, since this is required to get "basic" functionality, this commit needs
> a Fixes tag: can you please add the right one?
> 
> Thanks!
> Angelo
> 
> 

