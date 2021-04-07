Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A732CC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 14:28:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5526561260
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 14:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5526561260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFiu7+xylMEFgNdGMfppJVrSZOOyl028v8VtOZwND0k=; b=oBYDhN5gYbEA8wx5j00pwI7PC5
	ZIvcvqgAKZ0dq/TFmnuG9hlgrHFZwsZzAteh3KL0IeWjV9PwlOZbm2sg8oiu8Dt9/WOytA4OJdXrk
	0Y/sQf1+7Vsl5SanNwNMNO1HHNLKCgUl0yuAd339Hvecfw6/iCfP8YIGhJDYro4SHmCZ6Q8Br22+3
	CHfp8mMSrL9ZPSsxSpDXSw6+nSq0Ezq0VydwHRMQUREKDJZiV9Q8lZN3Pat6Z1bDpgE9/yHwMy58a
	3eRnh0HFJLwmC4ZRMV3UPNXq31U5sDqLEQNdrdD7z8w0ejWV/yYMmsd6TdNa7Mg0MAS/DDo6W/vw5
	P4aGWuKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU9AT-0058rX-FD; Wed, 07 Apr 2021 14:28:29 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU9AF-0058pG-Ig; Wed, 07 Apr 2021 14:28:17 +0000
Received: by mail-oi1-f171.google.com with SMTP id d12so18922768oiw.12;
 Wed, 07 Apr 2021 07:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=oUxybfgsa0jBAyR4P005wIPk9RSEkhGXSWLM7IOREgI=;
 b=GRUN9W7wjRvvid11iKOkDLiZyMd2cp/eAxzazfVS0+EowCcu18GDNXrr+U2J+N1Lil
 /R4D4Ui7nPMVIKfEh1QdihAmG+Zxympz8FRvi8Img1fkabH1J2+WsWNONJ5cWOeXLeJq
 HvrmOTUkITiUYd17pkkk4CzmtgRCPUOTTLgSOiEV8tWzBTb7fA/gCK+FlSPfKbmDBRJq
 7az0DQgrzPOvcA1JdeneTR7jNFjGCMlN65c4FCWUvucIjG/HFdgm760yTd2xzGVWeT0x
 v87MaJl/QKCBLsBaMGzqze7qvR3bVZvwwrK7cvPdBKSTkNNGCpBQPH3tvAl5sGZxujDR
 lnyg==
X-Gm-Message-State: AOAM532wqB50/I+72WrDS2mkrwAmIFf7lyVy5Agshu7pbaaKZC+fnDz5
 BR0fJL2PDNrxt3p3lmd60A==
X-Google-Smtp-Source: ABdhPJwbs7vhzPFfmzF6cXYQom7hIAFl/luDz3uevTicpkI3Lpn+qMolfXbgd74PF9sOhHfzv4kwgQ==
X-Received: by 2002:a05:6808:904:: with SMTP id w4mr2431870oih.1.1617805694429; 
 Wed, 07 Apr 2021 07:28:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r20sm5425207otd.26.2021.04.07.07.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 07:28:13 -0700 (PDT)
Received: (nullmailer pid 3696994 invoked by uid 1000);
 Wed, 07 Apr 2021 14:28:12 -0000
From: Rob Herring <robh@kernel.org>
To: Flora Fu <flora.fu@mediatek.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 Chiawen Lee <chiawen.lee@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mediatek@lists.infradead.org, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pi-Cheng Chen <pi-cheng.chen@mediatek.com>
In-Reply-To: <1617766086-5502-6-git-send-email-flora.fu@mediatek.com>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-6-git-send-email-flora.fu@mediatek.com>
Subject: Re: [PATCH 5/8] dt-bindings: soc: mediatek: apusys: Add new document
 for APU power domain
Date: Wed, 07 Apr 2021 09:28:12 -0500
Message-Id: <1617805692.253379.3696993.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_152815_690178_BAB0DDA7 
X-CRM114-Status: GOOD (  13.62  )
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

On Wed, 07 Apr 2021 11:28:03 +0800, Flora Fu wrote:
> Document the bindings for APU power domain on MediaTek SoC.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>  .../soc/mediatek/mediatek,apu-pm.yaml         | 146 ++++++++++++++++++
>  1 file changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.example.dts:19:18: fatal error: dt-bindings/clock/mt8192-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8192-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:377: Documentation/devicetree/bindings/soc/mediatek/mediatek,apu-pm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1463115

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
