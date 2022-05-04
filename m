Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2708C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 20:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwtiQSBGDCKgPpXZmKmdLl7wSYQ9MTdd3VacFCcvgPs=; b=r9HpQ5/Iu+jLDB
	E9tRpTVLSSpTmwgmF+6QAXk00O9df+Eywa+ISmXiyBsCl4N3FKZ28V8j3/nfoWzGf9hZs/XHoBRTx
	h201oXh8iM44QUjiYKKYfaIPvMN0nF7FNc4+Q7FIsnS0zrBLcll5UqZF44xWwnil/tUZFHyPA1aFe
	N7SWSwfnlNGXrcrmJ1ntII265VrIfZVV26GYA/O6OKGJL7wdvP57Bn8KYsYihmd3IuLv2qwQuiW9P
	MxzViQfs31LRO8nbwDCqyGMoIQqLdMUCvcyxldcNDiBWNHyngHcUTqSdLgYc3YDQEbpmCwu2Dishf
	uhbIH0FQBgHPMfL1iTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLjo-00Cb3K-Hm; Wed, 04 May 2022 20:36:44 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLjW-00Cas5-Uo; Wed, 04 May 2022 20:36:28 +0000
Received: by mail-oi1-f175.google.com with SMTP id r8so2379624oib.5;
 Wed, 04 May 2022 13:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=a+rDeQbRoNWpsCJ5GSOxdZJdeB0rbOuF0Fqaf+ynwHQ=;
 b=0oCUN7yuHkg8VsBsFmml9NJvB2JjKBu244INXcUQCiKMq4M1PlppKvRhjsFIhn/iSN
 MX+RmIoguTsXIK6Jz7dhMhxd0/R2cDSV5X3PjgzCY5Tju42YCesG6uxnqnmK1MIQbgP/
 2q6kfRTHzZe9juU/13aAJzQc1nLzgvv06oOqZSB9XW9bMxkTW0IFGLs8JIKIsO7CM9kk
 bFNdc7kq7odyU0v2ziqz1vSCdTQWPoNhS9Gd1g07O6iIF+I9HyuFUzYKUg8qdyB+GQEC
 20CrTAdFsVEaA55TS5QXMB6//3jFWF6n2DQ57Pqvzfiub90xZas7oHVBChXDNmZaeoMN
 f/Ug==
X-Gm-Message-State: AOAM533BnZRLENlTpzcVXw0AF+GzLIPTD1qedStX3oXuHHVOMXnCCuzi
 MRJa/IixwCVn599v0d+aFA==
X-Google-Smtp-Source: ABdhPJwq8I7lPc9yVfmwk94hDaWO5KRPEC6aW2xVAAkXg9GPwtParUvYL1QsoU/8Bqov8n+SdNPpqQ==
X-Received: by 2002:a05:6808:21a6:b0:326:54ae:8d1f with SMTP id
 be38-20020a05680821a600b0032654ae8d1fmr690049oib.210.1651696584585; 
 Wed, 04 May 2022 13:36:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 95-20020a9d0668000000b0060626a8e5a4sm3047394otn.74.2022.05.04.13.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:36:24 -0700 (PDT)
Received: (nullmailer pid 2183622 invoked by uid 1000);
 Wed, 04 May 2022 20:36:23 -0000
Date: Wed, 4 May 2022 15:36:23 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] dt-bindings: regulator: mt6315: Enforce
 regulator-compatible, not name
Message-ID: <YnLjx72gEGD8FSBM@robh.at.kernel.org>
References: <20220429201325.2205799-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429201325.2205799-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133627_035747_C2B3B580 
X-CRM114-Status: GOOD (  12.35  )
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

On Fri, 29 Apr 2022 16:13:24 -0400, N=EDcolas F. R. A. Prado wrote:
> The MT6315 PMIC dt-binding should enforce that one of the valid
> regulator-compatible is set in each regulator node. However it was
> mistakenly matching against regulator-name instead.
> =

> Fix the typo. This not only fixes the compatible verification, but also
> lifts the regulator-name restriction, so that more meaningful names can
> be set for each platform.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> =

> ---
> =

>  .../devicetree/bindings/regulator/mt6315-regulator.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
