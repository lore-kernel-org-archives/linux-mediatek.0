Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9903BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 18:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovVOTavcze271rQQffKy0l3O1wReYoNEvAuynHSTaZ4=; b=WoVmjxrPHMwnER
	LG1PjFux8OGfEmI2HlnKuWR8KpOydb1q00ziuCj10zxHloYy0OMVDiskaxpzTS5XQVT3yHsEEuTtS
	mR0I1D4sH5fGshYvypWH3UjUplBLLu2RrD1gSwN8rJfvEB/tHdtVLcYUolv8S+X6xshPlTjiZdgFy
	EWbKi4e0SvULVe7u2pWWkDWRJHpDO9SZl5ZSUcbf/HA0CFRiCP92+Bi4A39X83FOg4vDLfxe2LRxZ
	nXH/dQZ1nIGEnb/ACyfXFIn+Hn19oFy8dk2HKMG8ULZ9uH+WpZWBQulpxIeva5AfvEUgkSgR5KGVL
	mE5c/dhvXhy+xRL5PpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX6CW-00Eeqs-Bk; Wed, 23 Mar 2022 18:59:20 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX6CU-00EeqG-0j; Wed, 23 Mar 2022 18:59:19 +0000
Received: by mail-oi1-f174.google.com with SMTP id e4so2607470oif.2;
 Wed, 23 Mar 2022 11:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=URlJ3E8xdDXj7dvw0DzJiLOBO/QAL/39or9/uTvUAn0=;
 b=sNYy71jhldX5UjSVT5vbHRKVtfWiyfX/HgkDoiw5gTHp0v5fVDp9/TclXf4rBXPVRc
 w1VVj8iuEeRHPJaTZJPPBOnDZe89Beq/9pAEOVJm+N2HXqqLetbb+TPatoYKJ1pkpk9r
 0F+HsM3gRunxKYBLvdXAecX7TzTw4Ic51KG2Kxru+LHOYhamMu4xx+BLrrWx4oHVC+OF
 hgoKH0dtRWOcDI1QlrdTVugGWacImn8IZST2/9gOYCbl5wvx4MmUmz4NWlfCZTs7NG0R
 5i2N4FCurkk5Z9YrdfMPvpwU99IjJzJ0ihQJceC1a9f0XgIwhXnYge3koi7r7+H4Barc
 CEdg==
X-Gm-Message-State: AOAM531K44ReXQS2sNuPkS3x5rSiMMxhcXqDdFszd3K9iBOaqUKcypUg
 eml9wwx4zBlMf43/fE3fGW9HRfQ+Zg==
X-Google-Smtp-Source: ABdhPJw4+Tq2t4g8zBMrR+Ku2UlqZCF8QO1eFhQoEn6G2CpRhH7aqluYozKt2G5xJeOuOB067OTvYQ==
X-Received: by 2002:a05:6870:316:b0:de:2141:932c with SMTP id
 m22-20020a056870031600b000de2141932cmr711855oaf.172.1648061500075; 
 Wed, 23 Mar 2022 11:51:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p22-20020a056870831600b000ccfbea4f23sm391083oae.33.2022.03.23.11.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 11:51:39 -0700 (PDT)
Received: (nullmailer pid 247860 invoked by uid 1000);
 Wed, 23 Mar 2022 18:51:38 -0000
Date: Wed, 23 Mar 2022 13:51:38 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: pinctrl: mt8192: Add wrapping node
 for pin configurations
Message-ID: <YjtsOs5ALNhbdUN+@robh.at.kernel.org>
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315211936.442708-2-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_115918_071100_A9E0641C 
X-CRM114-Status: GOOD (  14.60  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 15 Mar 2022 17:19:33 -0400, N=EDcolas F. R. A. Prado wrote:
> On mt8192, the pinctrl node has pinctrl groups to group pin
> configurations. Each pinctrl group contains one or more pinmux subnodes
> to list needed pins and their configurations. By supporting multiple
> subnodes, we can configure different pin characteristics
> (driving/pull-up/pull-down/etc.) in a pinctrl group.
> =

> Update the mt8192 pinctrl dt-binding to add the missing pinctrl group
> node that wraps the pinmux subnodes and update the example at the end.
> While at it, also remove the example embedded in the description since
> it is redundant to the already supplied example at the end.
> =

> This same change was done for mt8195 in commit 79dcd4e840cc ("dt-bindings:
> pinctrl: mt8195: add wrapping node of pin configurations").
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> =

> ---
> =

>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 92 ++++++++++---------
>  1 file changed, 47 insertions(+), 45 deletions(-)
> =


Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
