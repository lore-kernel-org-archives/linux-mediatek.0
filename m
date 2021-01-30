Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC92C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 17:24:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC7A64E0F
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 17:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC7A64E0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQvlO39MWXBZ2O1orcOcqlPGdoDCb/lKg/m3dHWAPyc=; b=S2CY2wLk4hRafBYLeqLtPSDBrA
	eKTNdNSczbuwOrjxQ+Ekcor2KDyFQlFdtiEZfr9aV5+dGEpN9gCto5fFbIa9TIHUZU6CoVEKot5/v
	GZFLczwZTPThitvYbT/rqTngnsyuHDpfusebqDINDQN79OumtTe0EclQRYQ/SEe2V36fN2w4JidMH
	8wDzeByzpCvaEkFX4pz6ig8AeBxBIfyND4eq7/aoS23s2Jeilq/4b9ZEF7FmARaSuousxDfUGI7to
	Qou77wdMGVNv08J7e97dnOIpyOtZCi/ddjXcovxRZwNo0H4osXci2aGNR5vncrrZAWn+m8rq7rgld
	wSLOm7lg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5tyY-0005AU-SA; Sat, 30 Jan 2021 17:23:58 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5tyQ-00059g-Im; Sat, 30 Jan 2021 17:23:51 +0000
Received: by mail-ot1-f51.google.com with SMTP id d7so11942704otf.3;
 Sat, 30 Jan 2021 09:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=9UU0fPRjeLPZnus41uS3atTuyIZgZVJ3nKD7dA4ziy8=;
 b=ri4/wZNosV7HJ6fOCKVTEBxS+9tbsQpFBN/GWvyuKPJqr6anCR5pF3pW+v8YfLlY1l
 jCYse7uxYyIVpBWHTuygUvoy0fCusQzsfRjuZ5Vw6aatL5EeV7ag/eSo8b01I6WmLdQy
 k4RbYIeZJGPpa2+6nopldSZaD1g9Cc5T+baFLVs5zOSAvGx2pWZM7O9uqUksw01WDiYI
 mvtSL2LFNULkyjTvi+u+nJlbG9DgfDIaXdF7xekBytn4rLw+YuhhaduyT7gayTCgnb7E
 fHx5tm7QBKRjaJBENat0P/yEeiMxqYOkMxaQs/utE6tmLQ5hiDoXEc2n7F4YST78/qPn
 uqOA==
X-Gm-Message-State: AOAM531YOodyNl9YI8WZDklvP02Tb9QnN2nxxd4Ba8aHp9LXW6HSMquk
 3Pae0+gu57S5QU7uv4vookcx/5elYg==
X-Google-Smtp-Source: ABdhPJz9x2jS85HnLhL4DpdmLb2GJWo4CXvMaGkSiz0AtOqPIs9vaKayPjx3qX3R0yiVO24Y+b/j9w==
X-Received: by 2002:a9d:5909:: with SMTP id t9mr6041294oth.263.1612027429775; 
 Sat, 30 Jan 2021 09:23:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j1sm3167340oiw.50.2021.01.30.09.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 09:23:48 -0800 (PST)
Received: (nullmailer pid 1419428 invoked by uid 1000);
 Sat, 30 Jan 2021 17:23:40 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1611913781-23460-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH RESEND v5 4/8] dt-bindings: regulator: Add document for
 MT6359 regulator
Date: Sat, 30 Jan 2021 11:23:40 -0600
Message-Id: <1612027420.840636.1419427.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_122350_686801_D608AFE2 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com,
 Alessandro Zummo <a.zummo@towertech.it>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 29 Jan 2021 17:49:37 +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v4: fix yamllint errors in dt-binding document.
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

See https://patchwork.ozlabs.org/patch/1433233

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
