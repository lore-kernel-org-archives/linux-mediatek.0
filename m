Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F071C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 14:01:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C73D239D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 14:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C73D239D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qsa9HJpgwWbTO9YzYwWLtgsiqct8cvT4SVmd3zAS8rw=; b=X5ggqqRh7VcAs9PbJEj/6Ko2mb
	c+IoL6OrioRzbajy8o+DeIK0ekFRZ8QAySs5pUuvlN6M+2mZJOlHeyGJlb6QBxnlJ2Yhkio5+7Wob
	NDS8Pn1IS9i4bzkjRJeTeUnc4JHZYozVnZh/Jn0yxkuv/T5QhkIVNukxkzWh2WBnfi6u57WfNVfyy
	1x6L1EllOBwx1Y/ppa6JM/afQQZyLbMEFD3XVm5MyqRnzLucP4opzQ67uSkeNS6uh92abj2oGWo/Y
	zdVOQp1RYnYu2gQeETu+aYIBJgAnpNaEeqsNB0ol83xc4RhFBh72OHFZpWn8GQobZn3sewIUDqZim
	sZYRyu8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2wzk-0002EK-AF; Fri, 22 Jan 2021 14:01:00 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2wzd-0002B7-3F; Fri, 22 Jan 2021 14:00:54 +0000
Received: by mail-oi1-f171.google.com with SMTP id x137so4810743oix.11;
 Fri, 22 Jan 2021 06:00:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=dWHYMhsbBCya9Qdx4kuDb6+Q8KDESyIDxpnUb1IE3G8=;
 b=nDJbwYNrHuOSWdq5eAxkmyBh+ekQK2q/Qd12JIxqFlxOtORpnnKJ6FpNv8eQreBciY
 agA1S5MFAM3RZ7bJv573U/IoW2J+ga7WVIzqGUnbh01yZd+0OW5CBqWeEBqQ797tMQDT
 rRsypEpbTiHjjLbJ2sRW8QzVXNPpkIG4ZhSe1fLG4Xv58BYmmsgNd0fbLz6doKlFrzLt
 aSc2c1fKbFnnZlr4wZIhFa53nTnRB2693JdLtatxhSA0EZuwJt9ecOa6uJ480I8ao3hV
 S+iG1SrsAssRP4AgsR3TJzsHRFN9vTeNF/SUvDiwDMtPNmfr7peJ2osewDHI2vMxjLQO
 CguA==
X-Gm-Message-State: AOAM531PhRoVB7o7nsxRS5NRtQtD5XQKBi0nNYC94P7rzMslEP/JiE5Z
 QwwdQCBKFhQemrHw4l1QqQ==
X-Google-Smtp-Source: ABdhPJzZkdXg2eoWptnZ2Xg5/rC8xOaItyP/a1+YMGrdrb0mEBnvTtXRONbqcY0mh/dFcKmD2ruD+Q==
X-Received: by 2002:a05:6808:25a:: with SMTP id
 m26mr3339144oie.179.1611324050767; 
 Fri, 22 Jan 2021 06:00:50 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d9sm1670049otb.65.2021.01.22.06.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 06:00:50 -0800 (PST)
Received: (nullmailer pid 674377 invoked by uid 1000);
 Fri, 22 Jan 2021 14:00:45 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1611314381-19517-5-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1611314381-19517-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611314381-19517-5-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v5 4/8] dt-bindings: regulator: Add document for MT6359
 regulator
Date: Fri, 22 Jan 2021 08:00:45 -0600
Message-Id: <1611324045.710845.674376.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_090053_141768_25EDB2D2 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Fei Shao <fshao@chromium.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Lee Jones <lee.jones@linaro.org>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 22 Jan 2021 19:19:37 +0800, Hsin-Hsiung Wang wrote:
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

See https://patchwork.ozlabs.org/patch/1430288

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
