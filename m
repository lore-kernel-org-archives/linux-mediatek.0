Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B96C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:55:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71DBA64DE7
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 17:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71DBA64DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBs8Xn+m9ub8YanYpXgPLN76CXIG/BHe9dLKA02STXM=; b=E/45tAi+8lay8dhqTOLLiLU4qK
	2Wk+jijIINrJiuqyzEn9NPmLRbWvZMEl5CHyEOCxH5Km3yHVB+HzYo8An5qcMTJQ547qBspcxbxb8
	hOIgucehHBlQJ+8Wa/5Be8+9HkfFm5k9l83szE4vlAByGczhbApMHa2LVMvFthL7ufZ4/B8y/kczG
	mxuoK2MLxKzEjsqxiLF/o/BD6gcsfmArlLZmXXltdeckJpO8K4kmv3T88RmD0Dq+er7mj4Op8aXz+
	XUcwB9qpK1Ze3NkSqWi5j8/2PxU9yhrsbS1NuwEtLC0UWOebs6qrlZ3Lw4ERGhOd01VSiSh+5kfDQ
	ArrcBUAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMDug-001Tud-1t; Tue, 16 Mar 2021 17:55:26 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMDtZ-001TU7-L1; Tue, 16 Mar 2021 17:54:22 +0000
Received: by mail-io1-f48.google.com with SMTP id o11so38200497iob.1;
 Tue, 16 Mar 2021 10:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=dLqrm0/ef81kahZ3V++ylIOaNZ5Ioc1N/ut1Pv4L6zY=;
 b=LgBoTK/T0e6oeR1uwWkdY9elqYEMEQ8ulCI0KL4ew/V0YqST26rOMhyQWwtX6JBuzS
 DH1DCjY5baACwC3F4LpeaCx5xxkkiL1ExbgvJJ4wwV3X3QTMwzO9jDBdqzcGaCOrvsQB
 pd8rVnWr3niMm/gZSrecLNwUVSTEL+thDIOBGgppn1df8XRqh0uY18NzyV7wpAx8rA/e
 yuIVTnEnSGivn7Cw8slh3bZyecDXE8IjGEEwl7n5Leyr1oDlNRtadvD3ik83XG+qiN4S
 zGADiEHww4W3TDKGRNbDmD0C7rARlBMrfhtnx7M/hcB/7fhOrQJJtaGKRZWK/apck2Yy
 M/2w==
X-Gm-Message-State: AOAM533H4V467N/JyyCbNtE590q48ZnYR+uVfimQzLQeX+2tix01jXep
 dLH3mjmV03p/yQmTxEKbwg==
X-Google-Smtp-Source: ABdhPJz58cXYFwH0LvTilPm7qZ6a5slbFtu1/fj+K0w3XsAGD6iFn2JuuIuNrYcXaGUAcy56rJF8Dg==
X-Received: by 2002:a6b:da0f:: with SMTP id x15mr4245698iob.181.1615917256171; 
 Tue, 16 Mar 2021 10:54:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k4sm8804062ion.29.2021.03.16.10.54.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:54:15 -0700 (PDT)
Received: (nullmailer pid 3326123 invoked by uid 1000);
 Tue, 16 Mar 2021 17:54:09 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 Fei Shao <fshao@chromium.org>, linux-rtc@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 Alessandro Zummo <a.zummo@towertech.it>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, Ran Bi <ran.bi@mediatek.com>
In-Reply-To: <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1615829757-3223-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v6 4/8] dt-bindings: regulator: Add document for MT6359
 regulator
Date: Tue, 16 Mar 2021 11:54:09 -0600
Message-Id: <1615917249.235463.3326122.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_175418_394635_48FD0AB1 
X-CRM114-Status: GOOD (  13.07  )
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

On Tue, 16 Mar 2021 01:35:53 +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v5:
> - no change.
> ---
>  .../bindings/regulator/mt6359-regulator.yaml  | 169 ++++++++++++++++++
>  1 file changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/ti,palmas-gpadc.example.dt.yaml: pmic: 'adc', 'compatible' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/motorola,cpcap-adc.example.dt.yaml: pmic: '#address-cells', '#size-cells', 'adc' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/sprd,sc2720-adc.example.dt.yaml: pmic: '#address-cells', '#size-cells', 'adc@480' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/iio/adc/qcom,pm8018-adc.example.dt.yaml: pmic: '#address-cells', '#size-cells', 'adc@197' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml

See https://patchwork.ozlabs.org/patch/1453404

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
