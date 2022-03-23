Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCFBCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+aaeQteIK9ZuOwlZ73n5exH32sfQXZSRY4l1rEIkpJ4=; b=XEziwKHRQTY+0g
	ctTx+Ge99oPMOrOppzXR3LXjQ7q3XmNW6uYMuceKoUv9O7WK1utC/Bgmx991j2xkiuJc/lhooA9+E
	bBubf1wohUf8Ou5ybpBCRarOlCtPeVbqTt6l9w574jEaMTZeR2Zk/GAIjgoyKqo68CaNVdgpUtu5B
	WXTg8Z6e+lyduvVz9gnHJY5mtIZZ3HKKacJxlPyET1sJoNVDpBsr0yIlBjJckAbK0w3v6SjNDZ0Uc
	iD1l9uyu8Z2nmeFv6sX2VsG2B5M7A4BRnTS3MR00zgi3xbFVsVIZgBT+jmuASx4APJpCzrOu/fMQF
	I4VI1JA0O1mVm9GIYeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX672-00Edim-CT; Wed, 23 Mar 2022 18:53:40 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX66q-00Edgh-I5; Wed, 23 Mar 2022 18:53:29 +0000
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-d39f741ba0so2615814fac.13; 
 Wed, 23 Mar 2022 11:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R1GZjbdP4HW0QI4qXMYmlwaAcLv4Ffj0a/tHCi9+vpk=;
 b=EB6nO7I2KT93BFbq7pmNd/SirB7nhGSa5znKrpre2H4911Uv0sQVNMabZissAlcBUs
 gE5qXpG5yC/DEnIZi3uKom25TnfH3c4vxFnyO9qaTMH0CxY/IvaUtv3Hc9fbqlTH1+Go
 eo9ASIf8rncyaz0D4HeLuKTM/+rJZaFj2y/e/lCg/6CK9nVrEyeeHI6BdLLRgRveR8hI
 R/ZInuyfLnY32lg6SdxSXkoY2XOkWKiLj/diPLsIh3eb5a2qdLnmYnwIWAByEcSaOxKi
 26mcTmck0c7O51ehOinhjd2sm0rOCyMpu0LQLdVGHHaUjm2Yzkz4vQTOsl03IVFJA7+1
 YBXA==
X-Gm-Message-State: AOAM532GBRYJe4dndqgkAKAjtxO3vikfTTUeG+XVyc/FBbMdv4i/LXpT
 nEnrdKhewUVpWWWQ006cNQ==
X-Google-Smtp-Source: ABdhPJx6M40jr2JUgXyCZ3VQt0vR6pvpdOhQdzF8sAxQ3kx3PhG36yMGKu53XUo7jDiXv5MIVHT3kQ==
X-Received: by 2002:a05:6870:3294:b0:dd:b834:50d7 with SMTP id
 q20-20020a056870329400b000ddb83450d7mr5059098oac.279.1648061607630; 
 Wed, 23 Mar 2022 11:53:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z26-20020a9d62da000000b005b23f5488cdsm311698otk.52.2022.03.23.11.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 11:53:26 -0700 (PDT)
Received: (nullmailer pid 250878 invoked by uid 1000);
 Wed, 23 Mar 2022 18:53:25 -0000
Date: Wed, 23 Mar 2022 13:53:25 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: mt8192: Add
 mediatek,drive-strength-adv property
Message-ID: <Yjtspa6OGRpSKsvm@robh.at.kernel.org>
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-3-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315211936.442708-3-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_115328_618544_FBD5A12A 
X-CRM114-Status: GOOD (  10.54  )
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

On Tue, 15 Mar 2022 17:19:34 -0400, N=EDcolas F. R. A. Prado wrote:
> Add the mediatek,drive-strength-adv property to the pinctrl-mt8192
> dt-binding to allow further drive current adjustments for I2C nodes on
> MT8192. It is the same as in mt8183-pinctrl.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> =

>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> =


Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
