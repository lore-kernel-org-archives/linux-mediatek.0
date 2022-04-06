Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC8AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNE0zOgxI4H8YBjTrkIpGz0UurC9T8EZUQCzPnby/58=; b=AMYYI3Yl0rbtGe
	+kqnq7mX0HIWlMfH1uDQZDj0Bmic3NIZT52ImTXhtY+wfKatEdTrY6tgAg/agCBqNzL02RQ4m1hKR
	P3wRXERc0qsF3U4IykJfkjwd+mkKQJlPEZDtQDmOJTHrqxEr2RO8/6gm2F7306/ZBksDxWOoiKwBH
	DniId+p7NbMIwYgbLNjEkNT2a7joqtg+ohiWttWaFczmixa3+Exq/7xsl98eS9FRcdnGmw5jDLkfW
	SCfIOg3QncIty3TxGNnueKmOmN2deodh9AJqI8fkC0I4edFZwPwtU/E9xzH193/CSqL3V2pYS4mfA
	joQS4vjfYVpYRblQ8Tgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc7Nh-006mEk-8o; Wed, 06 Apr 2022 15:15:37 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc7Ne-006mE1-Re; Wed, 06 Apr 2022 15:15:36 +0000
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so3222440fac.7; 
 Wed, 06 Apr 2022 08:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c+ED+sR+qRf0zwLS0gXqp8dJnXQFBqtZvdW8ue++BTs=;
 b=2AE0jhAUFmPZrHWOKCUvIQXHWRd7VY5PVl5bl7cAIMTRtveQ89Eh8CxCX+eUYZ6lo0
 02/Eex0VYFcrV1UjMRw8y77VTR9terRqS/plBewGb4W1VRx6gHhKWhuh5Gu5WcoSFmGF
 P6SPfw4dy0ursaJ21Z4UAqPBlGiMfoYLyKW/QLv7uCDIBDm2NC+Two6ZFtYE7WaLaJlM
 QBLQw5wi0vyuV0pxvCic4hnPrkS5OxU3TlH785+x+5fbRUm2iNWSBVdwqfsOrfDx2f0h
 ioWQ9NkQPoQbFmd/i0mSMSTJT6uOkhjeNufYLympSdetMdBW07PA2pRYGie63Ra/BJ4F
 fZUw==
X-Gm-Message-State: AOAM532/HoBJosQxt56jIJqOzv9fI6k2sVp7NqHDG9gLcjdrXhC8+v1Z
 NL/Wu10NLja8dbAoaU9TLw==
X-Google-Smtp-Source: ABdhPJzgBHcySaaFvNECTinQeNeU1dgeUNA45/xoDtws5ZDF6hnlDSoHsqpL6P19iakXO7w7cj/3fA==
X-Received: by 2002:a05:6870:e0d1:b0:e2:1c3b:cca2 with SMTP id
 a17-20020a056870e0d100b000e21c3bcca2mr4072699oab.163.1649258134207; 
 Wed, 06 Apr 2022 08:15:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e7-20020a9d2a87000000b005af548abe73sm7129649otb.4.2022.04.06.08.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 08:15:33 -0700 (PDT)
Received: (nullmailer pid 2263515 invoked by uid 1000);
 Wed, 06 Apr 2022 15:15:33 -0000
Date: Wed, 6 Apr 2022 10:15:33 -0500
From: Rob Herring <robh@kernel.org>
To: xinlei.lee@mediatek.com
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, airlied@linux.ie, p.zabel@pengutronix.de,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 daniel@ffwll.ch, robh+dt@kernel.org, rex-bc.chen@mediatek.com,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, chunkuang.hu@kernel.org,
 jitao.shi@mediatek.com
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8186
Message-ID: <Yk2ulZODO9cHRjN/@robh.at.kernel.org>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1648727917-3099-2-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_081534_930127_28CCB320 
X-CRM114-Status: UNSURE (   8.20  )
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

On Thu, 31 Mar 2022 19:58:36 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dpi for MediaTek MT8186 SoC.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
