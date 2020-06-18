Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EED0C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 16:44:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9889208D5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 16:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Joe4jgk2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9889208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlrwR+uzpscOG/M1JWmJJbR2K5Fsmz59BTXu8wDup8I=; b=Joe4jgk2fwnttx
	XIBfQrjas29rnfbhtF/Hvp2YOhwuYSG5QWyJ8EYg8NZGb4/5sYX+HIjODdk7x2ZAmFQcFYJtZ9dK8
	hGNVQBFZbNQPDEXZxgGvnYJwcvpuqd2QJ90l8jEywh9cvB7Ft80MdgkhllXz2KZXIiKdn85VeWaj8
	ZwdRdWhHXuiS12ul+8NpAba58xxIc8kIUvag0/z8KSs9HPFSkLTxb2bI2UOJtrAspxUqaKcG4q6ps
	pwM+oEER7qP4kP13fJqq+14qq6IOshSGp0+A6MEayiUGQ8R4lysc/5A4+9tEEgnNHqfpMIPgNxrbG
	ff1/z2pFGLFRjn3dz5JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlxeZ-0007ZU-Kj; Thu, 18 Jun 2020 16:44:39 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlxeW-0007Yo-Rz; Thu, 18 Jun 2020 16:44:38 +0000
Received: by mail-io1-f65.google.com with SMTP id y5so7722511iob.12;
 Thu, 18 Jun 2020 09:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=P6K0NMCQ9QdVvPAqikzClu5E67Y9Qrb4CGCZ1kreB7k=;
 b=iX38A++5ozrmsFKCBndHlODsmOPtf7exfH6IcUFpccPJqZ6K7rNoY6196uHgkI0AHd
 OB+rMycun0k5xz981HqyrolWNPIF0ZuxJgEaouTXorAMfnN7qhntmQas/2OmkZYmdHVK
 SU50WzbzrRsXuYu+9LRLwExG8A//CbmOMPiCXFqUiE+rSlydFIWU1r5W1S5O7AZxvzLs
 sbB26NKLhiKXx8pVgdHRZkCKiEhX0h8pBxePP829SfVxEwuqIqPC50VGYdCnTMSFyY84
 gBCwh9c8vxakbVIqhv0JrJfcH4yKoPjs713Cq8beUCEeOm5mlMgsrl5zVricCnjo+RUp
 N4OA==
X-Gm-Message-State: AOAM530LLolCbCRdVeOvxeyFY8zxBzAsAEHJuo22QKwRyg/yz27nqHN4
 hFTB1lsM3ifJ7QZL9qVPAA==
X-Google-Smtp-Source: ABdhPJwkW4ZsJ4bdYKr0qKa9ryOy5g+2hE48HtjOUzrbj3WgzjP+FDJi5kL2BbFKLOci4Y0m6ArWyw==
X-Received: by 2002:a5d:858a:: with SMTP id f10mr6056867ioj.184.1592498674934; 
 Thu, 18 Jun 2020 09:44:34 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id g21sm1969126ioc.14.2020.06.18.09.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 09:44:34 -0700 (PDT)
Received: (nullmailer pid 504576 invoked by uid 1000);
 Thu, 18 Jun 2020 16:44:31 -0000
Date: Thu, 18 Jun 2020 10:44:31 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 13/29] dt: fix broken links due to txt->yaml renames
Message-ID: <20200618164431.GA504444@bogus>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e4a7f0b7efcc8109c8a41a2e13c8adde4d9c6b9.1592203542.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_094436_905359_B0CF21C3 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: alsa-devel@alsa-project.org,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>,
 Jakub Kicinski <kuba@kernel.org>, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, netdev@vger.kernel.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 15 Jun 2020 08:46:52 +0200, Mauro Carvalho Chehab wrote:
> There are some new broken doc links due to yaml renames
> at DT. Developers should really run:
> 
> 	./scripts/documentation-file-ref-check
> 
> in order to solve those issues while submitting patches.
> This tool can even fix most of the issues with:
> 
> 	./scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/sii902x.txt  | 2 +-
>  .../devicetree/bindings/display/rockchip/rockchip-drm.yaml    | 2 +-
>  Documentation/devicetree/bindings/net/mediatek-bluetooth.txt  | 2 +-
>  Documentation/devicetree/bindings/sound/audio-graph-card.txt  | 2 +-
>  Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt  | 2 +-
>  Documentation/mips/ingenic-tcu.rst                            | 2 +-
>  MAINTAINERS                                                   | 4 ++--
>  7 files changed, 8 insertions(+), 8 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
