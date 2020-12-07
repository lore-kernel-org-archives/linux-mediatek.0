Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA5CC4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 17:04:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EF023358
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 17:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48EF023358
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xmqi+/3G6u5B+0KDmaOpxRhaXC+F0LwiZgQ3BSCUFuE=; b=j9zjjXDN6kf9j1uXZwjqwHvHm
	SoZ8PCDYz7LxH+tf5v25F3ZHBgMEW5m7qcLknrI+Ipqpm+BPo/qVozuxr4p5dtpJyJDXBN8gFHIt2
	q8tEmCVLjP+Y5fz1csXsJEtcJDR3/AZ6AMox2tKlO467HoJiPmslAehHA7o8fu9usHOn3W8EE1nuw
	5sbiaht8i9v/QSIFxNe+nAEIvzE55G0JwO9aLvt0cy+nI530aFEefMzo085wqghDqm1g+kqpDyo04
	uEEBHarhC3iY3Nc9skOC4hDBALertd+XzIcbIWewO85vsLDGNSGMsn/PsZ2g8BI8wu5/+D/7fCOdz
	9BA5bqgtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmJvZ-0007C8-Lw; Mon, 07 Dec 2020 17:03:57 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJvX-0007Bc-UM; Mon, 07 Dec 2020 17:03:56 +0000
Received: by mail-oi1-f194.google.com with SMTP id l207so13232565oib.4;
 Mon, 07 Dec 2020 09:03:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=19119qT55jo1E4qrWnIhabF5L38EkieKkqJe7d3pVh4=;
 b=LbDon9MrZWuYWfTkBZeUzRXz3am71q8VoNolUhOgcxnGA1TTEY/fLOuDsTMu8pHVEB
 CYsGPPxaumir1yMan7NKTVFz43y5EJYz1/NaNO/MeoNjWwoIc5aU2UBoJLxKNrBOYzYb
 ONrMjczT4aTo/ROMkkrGanTOdV5sKWBpWUMYaAZBY3KaKzfsQt7wTx16uf8qVfpL89Ru
 g6ICdHCvz/BMjWWTb7QzdCVTX6IMdMmytB6Udu+clkg+tZlx1BYPVXbuQFblHeLdewLT
 AUZmexJpGjZ9b0jOdLQHBSOPdu4cFhIVagZXHLqn/UIPY903fn9FSRtUiChNqpU8sd6C
 6Ysg==
X-Gm-Message-State: AOAM5324y7oj8/kaV5EvW2eQglpr7ADoLZujGsRJoQ285FRmWNrVKpUI
 mRtgZxo+JTwlldXdmevFD2T3alOt4A==
X-Google-Smtp-Source: ABdhPJyBNmiiAD7WrCmET03nS+b6iaipwxbjuAnKKBQf6mUm+C30OUOrc++vnzrLL/+G5RhWs05D6Q==
X-Received: by 2002:aca:5711:: with SMTP id l17mr6127842oib.53.1607360635005; 
 Mon, 07 Dec 2020 09:03:55 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m81sm3037226oib.37.2020.12.07.09.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 09:03:54 -0800 (PST)
Received: (nullmailer pid 439974 invoked by uid 1000);
 Mon, 07 Dec 2020 17:03:52 -0000
Date: Mon, 7 Dec 2020 11:03:52 -0600
From: Rob Herring <robh@kernel.org>
To: Michael Kao <michael.kao@mediatek.com>
Subject: Re: [PATCH 3/3] dt-bindings: thermal: Add binding document for
 mt6873 thermal controller
Message-ID: <20201207170352.GA439416@robh.at.kernel.org>
References: <20201207063127.28051-1-michael.kao@mediatek.com>
 <20201207063127.28051-4-michael.kao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207063127.28051-4-michael.kao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_120356_008388_BFFE6085 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Eduardo Valentin <edubezval@gmail.com>, ethan.chang@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 07 Dec 2020 14:31:27 +0800, Michael Kao wrote:
> This patch adds binding document for mt6873 thermal controller.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> ---
>  .../thermal/mediatek-thermal-lvts.yaml        | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.example.dts:21:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   21 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1411898

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
