Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81710C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 14:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irEOFWbrrcF/LJlkUrrNYFXsiQIR7AGg9iFqBzm3OAs=; b=rZdh2NFqxO86Em
	aBvxjMZXOWNZ+0ODYo7lZcNptvArug8ROv0HHlpxl6SObGjLHJkypK4RG4dwMzS2m36NQaK2Oytbc
	/hRMn6NWELqVcR/jfZqK/chmc+EKPJAI5MBNAF8WjpgJAnshrUAX1snkstyJZDiLUZHMhl8Xotita
	Px5jd9TYPgyUzAPmc2QPNczovdMDkXQMvQK7WajPNejLaWyVTiWioNbXXtS7yyvu3IYPixz+KHpeo
	eon8bFT5kPrkW54QbdQQZLuv0K711g4o/uQ5waqYxlKYNtL2e4k66AnaYodOYH2inSehtYa6scOzy
	hohT42DUi3hgD147LckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX1Xs-00Dp5H-L5; Wed, 23 Mar 2022 14:01:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX1Xc-00Doyg-57; Wed, 23 Mar 2022 14:00:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 827E6616C3;
 Wed, 23 Mar 2022 14:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D75BC36AE2;
 Wed, 23 Mar 2022 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648044043;
 bh=0iSclD+CWJo049DAjnNmpJPmyTaLxoM33bJuF/qUYIU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jZ+K6QtSrHhnIoImw542na484JXIO49e49FdbBKfgDnU5cncgJ2q8UUGU82ue/Xbi
 KAB+CmdOZ1X58l9kDuVnAV9HtUnKQWpMdvJdL4MVp26ta3q7x+dYSIxNv75EuUBIfF
 cVZxZT/djEZBclgGulDEdZz5nxnPV0ScYwTcKmYB5egJ+ACg2iQobgStpUYixiggOT
 /bqOkJBeAEEnn1gxH8JkMFC+PaRxdRLS/mjB5t3vsKKtQ8rNQIeiiA8hyUCDzA8Z5H
 R3KyQFS7jNouiuGR3lC1pit1u7VdnnNzQ9MzIylbB/nKj2JazUYeCK28O2WomIamp9
 m0qjKUg8PACOg==
Received: by mail-ej1-f47.google.com with SMTP id j15so3006205eje.9;
 Wed, 23 Mar 2022 07:00:43 -0700 (PDT)
X-Gm-Message-State: AOAM533AtnI13RZYJ59t8uTr63INrhDn1PhbLvnm0i8R6KcfdKdUOlzX
 rDDMF309VgBRo9kfQny3pv/AfgAAqNauo8KvAg==
X-Google-Smtp-Source: ABdhPJzJCX1fd6x6XUQvELujRx+GXFcimDLm2YbxSHA7op+nKKjo5EIzA07JjYkwARfwQ/qJhXNGyMd50X5K9s9lP8M=
X-Received: by 2002:a17:907:1c1b:b0:6e0:6618:8ac with SMTP id
 nc27-20020a1709071c1b00b006e0661808acmr109252ejc.82.1648044041365; Wed, 23
 Mar 2022 07:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220314075713.29140-1-biao.huang@mediatek.com>
 <20220314075713.29140-6-biao.huang@mediatek.com>
In-Reply-To: <20220314075713.29140-6-biao.huang@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 23 Mar 2022 09:00:29 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+6XKvS5RcE6j9vRd3JL-Wbi-O6BrcoGQ5xV0Q2ZG8EMw@mail.gmail.com>
Message-ID: <CAL_Jsq+6XKvS5RcE6j9vRd3JL-Wbi-O6BrcoGQ5xV0Q2ZG8EMw@mail.gmail.com>
Subject: Re: [PATCH net-next v13 5/7] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
To: Biao Huang <biao.huang@mediatek.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev <netdev@vger.kernel.org>, 
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, dkirjanov@suse.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_070048_318628_5C37AE9B 
X-CRM114-Status: GOOD (  15.01  )
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

On Mon, Mar 14, 2022 at 2:57 AM Biao Huang <biao.huang@mediatek.com> wrote:
>
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> And there are some changes in .yaml than .txt, others almost keep the same:
>   1. compatible "const: snps,dwmac-4.20".
>   2. delete "snps,reset-active-low;" in example, since driver remove this
>      property long ago.
>   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
>   4. the example is for rgmii interface, keep related properties only.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 155 ++++++++++++++++++
>  2 files changed, 155 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

Now failing in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb:
ethernet@1101c000: snps,txpbl:0:0: 1 is not one of [2, 4, 8]
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb:
ethernet@1101c000: snps,rxpbl:0:0: 1 is not one of [2, 4, 8]
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml


Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
