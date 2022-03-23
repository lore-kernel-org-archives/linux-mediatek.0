Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD7EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 18:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IV+94u3zcsWOg+2/JdY4EdBZjm5k9v7m+zMydbrwcCM=; b=GvGAEDWBkAt5L7
	UfvivYQAI7+5npFeRDPe2Z7KZUSL+s9pRG7HNjPDujuZfxWbOzzrzVCtvja/mng24eXsva+61uPI7
	LWiSBofZ/a1WVjHKBysQw5npInbXZ4cGKusxX/6ihMS4/GiVUlbx4bN+s2ZwrUSULFmZZ0xQDtInX
	6eWRcsR4PE3YcK+ZrIaIanFuqQ9s2YB7y1iW2eMCE913XYDyYW+oroyoR1+frtzZm3A+sBKpzr3BA
	cMzbL+S3CqRerm3sUBEMfUP8HzVvbyYMKPOg+3xYfAIswXrmGCGs/zzXUJleWTXR4E5FSqcpqEyyX
	thEv5bcw5AZXZ6M+6lUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX67Z-00EdrL-1r; Wed, 23 Mar 2022 18:54:13 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX67W-00Edph-3l; Wed, 23 Mar 2022 18:54:11 +0000
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-d4164acd34so2647079fac.4; 
 Wed, 23 Mar 2022 11:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cWHIqUb2GLClWkPw5kQ250/Lh0uWw4ugg2e9CkpD9ng=;
 b=eYSPisFJUhVZcAfhqDKnfdAN2qZJsPSU9RriRmqGPhFGnHsmmcsEWCYKqs43OzzU2Y
 1GV/xCdvJ3pXZt+OaXZQy+lrvPGSvrFJ3ryEBg+sWXZPJ5iLORIjXvvDRXlsdsBR8aqQ
 F+c8I4oxtVR1uaryycdMH32N25DLhBNHRiZf48yjJJQLhzHTJMFYB/GW6boVYURGGb1q
 RAUdLrGO8xy4H/THcFk2hzmyv4EDaSiSk8OWESiIV0biWCIgK61C3O5xUfTElGjrq2A+
 Jeawan5D+5qbQZ7dkhjy+FhWNWDYVmEnL2iwyt5Y8Q3HmvQIZ2WQxCA2MH36YWMqQyPl
 MybQ==
X-Gm-Message-State: AOAM530vj226NyToXhE+xMQCvoVtSVv4PQ8O0kIJ/YQ8OpwRf+TiGDkY
 2FwN4s0LqUEayMY8y+ScyQ==
X-Google-Smtp-Source: ABdhPJwb31fwcGvR7p9nqoczWVgSbjevAuJ03XKtuwAPPvfJWOWi+SoELyx+qTikU4J6+3nz2lWBqA==
X-Received: by 2002:a05:6871:5cf:b0:de:3ca3:26a0 with SMTP id
 v15-20020a05687105cf00b000de3ca326a0mr704806oan.136.1648061648208; 
 Wed, 23 Mar 2022 11:54:08 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x6-20020a9d6d86000000b005cdb017ddcfsm333780otp.41.2022.03.23.11.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 11:54:07 -0700 (PDT)
Received: (nullmailer pid 252266 invoked by uid 1000);
 Wed, 23 Mar 2022 18:54:06 -0000
Date: Wed, 23 Mar 2022 13:54:06 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 4/4] dt-bindings: pinctrl: mt8192: Add gpio-line-names
 property
Message-ID: <YjtszlCtzG+XCzBj@robh.at.kernel.org>
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-5-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315211936.442708-5-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_115410_179902_D1A5E549 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 15 Mar 2022 17:19:36 -0400, N=EDcolas F. R. A. Prado wrote:
> Add the gpio-line-names optional property to the pinctrl-mt8192 binding
> to prevent dt_binding_check warnings when it is present in the pinctrl
> node in the Devicetree.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> =

>  Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
