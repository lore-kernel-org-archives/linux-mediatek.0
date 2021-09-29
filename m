Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 13:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 247B2613A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 13:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 247B2613A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u9zt6yPCph7cX+JPZZFTVnW2H7ZDND1AcpxfFRE71oE=; b=Ml3vDLdj2ZtzkQ
	LbXahOI12WF8PykZREHBGjzR4gnYOhOoG3LrhClV3tjy28hzIpOzEhOf36IYe25QZ4CFV74zCxvP9
	3o/fb3jYgsZP91ftZNUY8cTUE22ovQRUQyPCNwsLY8QbwjYVpgz7Jfh7tk1z3YtOgYs3SXwoYXjN/
	qQBTiOk1mpfU/1zCpkRn6/tTBLnYxuSn4EEoHtoRlXIoRwWHsr4D+KbpQ5fXeFR6snWR9omZYkeDn
	1b5qETqZ/A+QSjyn+85T25+3deQcqE8B+8mvj9P6zte5Vcs5nGlJVHshM3ZAw6ISgxLEzbFk9I6Th
	eKxEhRlzIn++zkI1XhQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVZv1-00BC1j-1W; Wed, 29 Sep 2021 13:46:43 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVZuo-00BBy5-DQ; Wed, 29 Sep 2021 13:46:31 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so2881336otb.10; 
 Wed, 29 Sep 2021 06:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=OCt6A/PQC+USQdnm5J8GnEXuMhJ+RqhU0u1UJM6OlKM=;
 b=nY5XTRBsA0eTkmv4rP6BDbw3qpN9dhA+atv/Dq5pI90BbuU0o1HqjR4UxAgWbdUQJm
 vK1pMR6KrvtXcrpVoumMgtPc1gN8zXmoQu1/2/2IH4RdooAqSfjiW3z8RVjU4KYa/rn3
 SnfoDTfwCfHTkLXr6PbhUiI1DQ1+imaJ0006gDs1MWgPB9ynHFl8Thz//XKkxkx9MdbZ
 yN32D8+CLXyYsHHheo6JWQXiRVbiaOunuxLNw89Mk6pjIwOSt/ck/0mm31KivCQeol99
 uII2UgPqNk9/zWakcFMCzHrAkNbv3/obZK2U6dYRlniU2T1b3M+8Ps/hxeucUMt+hB76
 mQVQ==
X-Gm-Message-State: AOAM5314VC+y077ZaZTYdeuMqOc0cCJhubrabHSHGeRRLTtpA2knrxCY
 I0RtEmlpZJRVlOr1iJrNRQ==
X-Google-Smtp-Source: ABdhPJz/BHhDl0VbMiUoiKubksea3lnYfFtqBu5/Mu6JI4wQMVxRosXYvYLsRHQDW2GiEYK59cdHBA==
X-Received: by 2002:a9d:6a4c:: with SMTP id h12mr81568otn.336.1632923189057;
 Wed, 29 Sep 2021 06:46:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o62sm459542ota.14.2021.09.29.06.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:46:28 -0700 (PDT)
Received: (nullmailer pid 3674449 invoked by uid 1000);
 Wed, 29 Sep 2021 13:46:25 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, p.zabel@pengutronix.de,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20210929094425.745-3-granquet@baylibre.com>
References: <20210929094425.745-1-granquet@baylibre.com>
 <20210929094425.745-3-granquet@baylibre.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Date: Wed, 29 Sep 2021 08:46:25 -0500
Message-Id: <1632923185.744834.3674448.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_064630_473074_43DE993A 
X-CRM114-Status: GOOD (  12.08  )
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

On Wed, 29 Sep 2021 11:44:23 +0200, Guillaume Ranquet wrote:
> Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 45 +++++++++
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 98 +++++++++++++++++++
>  2 files changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml: example-0: hdmi@1c300000:reg:0: [0, 472907776, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml: hdmi@1c300000: 'ddc-i2c-bus', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1534287

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
