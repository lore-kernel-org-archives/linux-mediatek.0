Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93960C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 20:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Igzpe2dfFh072dG7M9af7EwnEZkHHQlF9Pf46jZtejY=; b=HuFPnfpRix4AP9XIN8pOW2OzEG
	WW/FJ6u9A8u/bJ84//C9jE+EZ4msLd0hgsUIRobgff2ZDz0oYV9ihzXwnsh0dPScK2xwxNwMKMYvN
	h9AwfLsC4DKPhHf7fg9z/10R1eXz1y+g+HmZHGEVSsZ0aDCGlzx7xU+dKN3/hvDfcZFeWxSz4fuvu
	wCETjDIAvJsUspBixscvGwiLbEnkDN7V0jfynpts7mCHinE9Tt/zoc8KcJNOwHAiaOodxX0ME7B5D
	v4OynkCBJ3FQ5uVlreEknbPIE0oi9Sheg4067G63WX14aj8vfc79JMb+cr5XMnE7jUiG27/5YLu+7
	A3QbhjzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3V7-006tra-ET; Tue, 16 Aug 2022 20:49:25 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO3Uw-006tnq-RR; Tue, 16 Aug 2022 20:49:16 +0000
Received: by mail-io1-f43.google.com with SMTP id r141so5657375iod.4;
        Tue, 16 Aug 2022 13:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=Igzpe2dfFh072dG7M9af7EwnEZkHHQlF9Pf46jZtejY=;
        b=OyAMnkPiQtLbasVRQdDh6P73FdL2u8xPm3D/1+ttER4Hr556JEqoCU12vFBpNzjooJ
         RMT5mF0AygsMeb21QY+Pu2lnEDp2lrFheAL5USdXOx6qUpdbRoZmbQ2cOehXFYTwEYTD
         6R1uQSAyH6TXi+TTETPNUmcxm26a24rqSWi2MAL0onDeKfgdo0zozLGcDkgRaKJ3HtsT
         R8tQOCDOI1GwiFY8zRkwPKJCLr6ggrFiVwafsgsiiguXc1U3SlY7gv+M6RCpdvmWmE95
         e/l2qo7wCaM5kpHFdKMGlBF1HpdlSibCvdlZM4vmvGS3DTQanF98vfJv64/TqTAZGrrc
         BXiQ==
X-Gm-Message-State: ACgBeo3WzaPgdbh4eL2p3qcgPz1YBbwkYqEf0Yy3ZLZpAdPNskKB7vt0
	TEqFwdFLkX9HmbufZj56xg==
X-Google-Smtp-Source: AA6agR4JUMnAxe73i4k/USANa7oT8A2bvPIyHs4SYiN3MfNVQoRaN9YqHKUNH74CBK0dcaCnelKJeg==
X-Received: by 2002:a5d:94d6:0:b0:67c:55f9:f355 with SMTP id y22-20020a5d94d6000000b0067c55f9f355mr9749658ior.133.1660682952543;
        Tue, 16 Aug 2022 13:49:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z25-20020a056602081900b00688b30a7812sm1312208iow.42.2022.08.16.13.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:49:12 -0700 (PDT)
Received: (nullmailer pid 2709183 invoked by uid 1000);
	Tue, 16 Aug 2022 20:49:08 -0000
Date: Tue, 16 Aug 2022 14:49:08 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: net: dsa: mediatek,mt7530: make
 trivial changes
Message-ID: <20220816204908.GA2709132-robh@kernel.org>
References: <20220813154415.349091-1-arinc.unal@arinc9.com>
 <20220813154415.349091-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220813154415.349091-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_134914_926247_5A4B601C 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, linux-kernel@vger.kernel.org, =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 13 Aug 2022 18:44:09 +0300, Arınç ÜNAL wrote:
> Make trivial changes on the binding.
> 
> - Update title to include MT7531 switch.
> - Add me as a maintainer. List maintainers in alphabetical order by first
> name.
> - Add description to compatible strings.
> - Stretch descriptions up to the 80 character limit.
> - Remove quotes from $ref: "dsa.yaml#".
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 36 ++++++++++++-------
>  1 file changed, 24 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

