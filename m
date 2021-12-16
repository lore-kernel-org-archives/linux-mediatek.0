Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F9FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ufFDUG922zRnDaHdh53x1qp5xM1fe/HnaP6N5IvUAho=; b=dPiHazbn7sE/0e
	tZ13gsj7D7HHszbqbaZ95ZJY/UEcucUEuIHeDb1UbZrkCV7ixOZOG7RXP7dZMHfykeg8/ciKNsETO
	PTNGLXE8jrZjlNf4Hw1fspWX0L7f+tClSC6vDHRbzZZVUS+3lSbooSRrA9/Lt88028L21DzMO8fj/
	g3gv2tkj0umA1darL61y4QrPciPntHzWUXZ5XsuZX1jFuc+pcwSitagxmWYgrGwGPWN+9U5cP/C0D
	XZy+SYwn41Uw2sfY2U++HkeIu+sVkgkq+lrxif+85VIzyuh3LcHN8MM6I/zdXf22SGz/QGfFCX3KZ
	yQKBJ3/Q9+2nbjHKIAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrJB-0060gA-VV; Thu, 16 Dec 2021 14:00:34 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxrBy-005y37-2o; Thu, 16 Dec 2021 13:53:07 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso29079991otj.1; 
 Thu, 16 Dec 2021 05:53:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=K3q3sT5gz9V74YhNPyceV1V6wk4tRvJfYiaAGVR5wDk=;
 b=TZXis9aYn77rFnP1R4yABRm1OXJ5XPKaZQSJZRMWpUygsi52+GPTus6wpm+SSx2j0h
 utVf9m6BJCCvstoNPUoy7VNJnhHywr8xXEJuEMxsHuiACkOAL4Av2a2ZSn8NirY8GF7D
 rfboOFBf7Rn3vAa8rUzj+1ICjkhCu2c15wXY4rwy0NPZs37fe7nO6ra0A638M82BWYYZ
 shmaqvrgGMfVN7clgUmjf5r47DILyXdy43YyOfYiD4Xx3bMRprU6vgsyrI+EJfYCG42Q
 ERlY5Zkgw14YGl9/rs2omo7Cj78/rLh+61VDIsnBg9h9jyE5BLcec5zEjIGVMpcWFjv/
 R2AA==
X-Gm-Message-State: AOAM533y1pQZ9SMtHeGt2JZFhqrUH3Rj3f+5+ggotuOLHkM70YniI9pS
 EIkz6J0gxT8vwLVNg+vJ2w==
X-Google-Smtp-Source: ABdhPJwzi2LUj+RCSn0XStSyJDnnJAJ+K5H1xEp0vB1nUSgaPfqCMGLhpagEgc0ZOqdMMiDluU4UEg==
X-Received: by 2002:a9d:461:: with SMTP id 88mr13058565otc.300.1639662785099; 
 Thu, 16 Dec 2021 05:53:05 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 52sm381367oth.52.2021.12.16.05.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:53:04 -0800 (PST)
Received: (nullmailer pid 4004876 invoked by uid 1000);
 Thu, 16 Dec 2021 13:53:02 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 davem@davemloft.net, linux-stm32@st-md-mailman.stormreply.com,
 angelogioacchino.delregno@collabora.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 netdev@vger.kernel.org, dkirjanov@suse.de, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211216055328.15953-7-biao.huang@mediatek.com>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-7-biao.huang@mediatek.com>
Subject: Re: [PATCH net-next v10 6/6] net: dt-bindings: dwmac: add support for
 mt8195
Date: Thu, 16 Dec 2021 07:53:02 -0600
Message-Id: <1639662782.987227.4004875.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_055306_158324_F00792D0 
X-CRM114-Status: GOOD (  11.86  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 16 Dec 2021 13:53:28 +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 29 ++++++++++++++++---
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: properties:clock-names: {'minItems': 5, 'maxItems': 6, 'items': [{'const': 'axi'}, {'const': 'apb'}, {'const': 'mac_main'}, {'const': 'ptp_ref'}, {'const': 'rmii_internal'}, {'const': 'mac_cg'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml: ignoring, error in schema: properties: clock-names
warning: no schema found in file: ./Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
Documentation/devicetree/bindings/net/mediatek-dwmac.example.dt.yaml:0:0: /example-0/ethernet@1101c000: failed to match any schema with compatible: ['mediatek,mt2712-gmac', 'snps,dwmac-4.20a']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1568902

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
