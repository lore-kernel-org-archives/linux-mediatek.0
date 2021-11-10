Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C912C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:30:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A1136115B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A1136115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUNFEopJXgK/HfISsYC8qyU/GIbuI8QYFURBv6cMNo0=; b=fgld9iVsWZPASD
	0Kvhjb8kwB0WZiQxzZTG9lK12GWFx4o2w0NQVoSnezPFqHMBln91NHIg4vyP4TCT/L8mYOUWDILQt
	G88rEg7wrTVNEfUAaU7G2Sc98Psj+Z0ddT4dsLhlqAJ0C4m6AWt0xwnjDlhyHamz1oMhZnnn+8DqA
	8dLuaTHxApu0NzWApbkMwi9yJMjsufWrWppnQrGLb8NJ/pJVEM73oC55MgLnaFoI3VoP8feUJ89Qp
	XcCFruBOU0TaIA3lEPDhj64nzmVFylLEAXBNbIkC0UDqkR3tRvvMjNjbVJDTzMOinKq6Q9ZKH/NDX
	evELmTwIt+Yh7yppa+Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkkrx-00572P-2j; Wed, 10 Nov 2021 10:30:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkkrh-0056w7-E6
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 10:30:03 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so1565032pjj.0
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gSFvUJLaZR+mAVPFBcPx1oudAViqkL4IwyGNB8LdK80=;
 b=eZ9Whpt501+2K7l26U4wtjldeo6V0MKg+IPh8nJFxzg+klzAvlhvUlX5uL9FGT/dEK
 ojkFp0NnQHczMBoADFUXVAU/qQyUOXo+5+KLWMv8gABEsMPWVDyurFkliVDOH9YEvoc9
 4QebnxuMUulAfKSS2P7FsdGLV2EGOTowxGCKkcDVKp76t0Hu0boOwos3GlvDg48jOxzC
 cbtKSl55U8seclKFJsrrZiKepcOuv2XvwmCmExMnFSekL4Ejhh0VN6fddzdRVLdxzJJC
 zEScDfB9Uwz7QGYIXR5l60zIehXlOZNSan/aU1SZpgLVK3zo/GK1e31s8jAjTxx449DX
 1XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSFvUJLaZR+mAVPFBcPx1oudAViqkL4IwyGNB8LdK80=;
 b=jjXBdSwLeNOjUXZay0awP7KzrvOTquWrzfPpqy0l3nwF2a0Oa2gq4jWZJUQRp46Jdn
 +QcADwEqmCR+SUviiskyS/OBPM2Wx80oQ7AAEDa201Vni8pYvrsrT94haVc2laExxOd8
 6WhHYxw+RO8SuvCcEX935pMU/zf1u+GuLrB7pDWP5bSKcxnamy4sXx4kPNBVyReArlMq
 Fn7ZS+3TRvnYLheAppeFvjxNM+fKuFXHen7WO8HqfdWIBQCLRQYd2pRXOdFo9z2xgCr0
 9smHKGZK4hrRCSovYXpj/nBel+PsV4Bak39rcDfqI3kje4DP+mitb1yGbSuftc8exNPf
 +/aA==
X-Gm-Message-State: AOAM531F9uXbfphIJjD6pbyxZ3qIibrO4MychTkm2kF0U5n9zz5MpHmo
 lkiz5TSqcs4jDqfhQomQhqfwuM/55jJb4QRDdEGtLg==
X-Google-Smtp-Source: ABdhPJx+7Gq0bm/h5nRmAWFRad83G/chU5WO/BoJHnti7WjK4AP/ZWkCcRzV6CRZ8T8FumyHzs27HMxGy7nk1YEJlzM=
X-Received: by 2002:a17:902:7289:b0:142:805f:e2c with SMTP id
 d9-20020a170902728900b00142805f0e2cmr14239605pll.42.1636540196956; Wed, 10
 Nov 2021 02:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-3-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-3-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:29:45 +0800
Message-ID: <CA+Px+wWNg060xNcBSnu696OHPcp5Mqy=ovbAW_dtBTnoVXLMmg@mail.gmail.com>
Subject: Re: [PATCH v9, 02/19] media: mtk-vcodec: Align vcodec wake up
 interrupt interface
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_023001_491618_022D65E0 
X-CRM114-Status: UNSURE (   6.60  )
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

On Tue, Nov 09, 2021 at 08:50:13PM +0800, Yunfei Dong wrote:
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

s/B/b/, the suggested tag name is "Reviewed-by"[1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
