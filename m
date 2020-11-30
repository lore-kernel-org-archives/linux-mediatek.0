Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20160C64E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 16:33:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8E8E2065C
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 16:33:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u22+TKEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8E8E2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c+/+UTKhLMJBt3foD1MQoAPzc8CZYswQaU5HrOmPoiM=; b=u22+TKEemT5A6CSw6o2MTFzSp
	JrfgL5xMzXYlSZtc/TdMQIO29NJFFOhFuvfO75hyQNwow4ILNZkCMiCrYqtYBtY4YbCjxMtc8UC4t
	sAirTPc/SgQO1cWtdtgU62I7WxDCkaiDYrIFgwbzBNlPVtXX87lOLjZMe5Jqd7lnmn642H6RQQmbN
	ReRhM1gJ6oY1VxLBaqruVSrCSSZid9Er7qhTUOJd74JdacpKHaOf2RQH8nehjcQSV2S7HSZojd23T
	kCSCH0MsouZzIPf1m5Tf1gNv+hmI3itCd3LSTujk5PmVZnyovCnfWBhg+LLJkp3UMj+VwxelsxC7R
	VNCsOlMPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjm7B-0002oq-JM; Mon, 30 Nov 2020 16:33:25 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjm77-0002ne-4W; Mon, 30 Nov 2020 16:33:22 +0000
Received: by mail-il1-f195.google.com with SMTP id y9so11879804ilb.0;
 Mon, 30 Nov 2020 08:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZBBwW3NkUSuFPPRYNjLGyBC//UcL1yNtoBYCa8FcsK4=;
 b=L9OLap9piTBpURXK5Z6qoul3097PWNvVflh7QoJme3Gu9fibI7i69C3r3W+ZfRBf2X
 0uMKTX2S1UP4KYqvjYiIc44qXLx4/pv45FLIxqvG11XuzRFuLrlOHYJO+P99xWTwndfP
 gLuAS0Io1j1zSBwyOO6GHc2fRYmbDSPcnHOzgHXCRFWxAMj7zS2tmOhCzutw2XaAIhu6
 oinwC9AzYpZ5M+KCY1779Ppe8e7QKuL8ptk8/yddBQ9lHwjmzSjmWrKcrfpOJlmkumAL
 RosUpqpEislza8UruMwEnUihWoH0brxbDQkK58+A7bAdm32JuXSAZ/9IIjhv8rp4COQw
 DvgA==
X-Gm-Message-State: AOAM533r9TbbAUs5HotjKm1X3axP6BrfgGQCvsQgvVkvWRuWxrA/9MeU
 LbWtB1Vix/3IXIPQ0IeI5qH0FFCSlA==
X-Google-Smtp-Source: ABdhPJwo98x9fcLfGsa/fOEkRiiTPfg0HG5OZjgyT5/bJuvDcYPknYRrLNe/75450Ba2DHlYQ7En3w==
X-Received: by 2002:a92:444e:: with SMTP id a14mr2066584ilm.129.1606753998497; 
 Mon, 30 Nov 2020 08:33:18 -0800 (PST)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c8sm8427863ioq.40.2020.11.30.08.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 08:33:17 -0800 (PST)
Received: (nullmailer pid 2583689 invoked by uid 1000);
 Mon, 30 Nov 2020 16:33:14 -0000
Date: Mon, 30 Nov 2020 09:33:14 -0700
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 3/8] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20201130163314.GA2583085@robh.at.kernel.org>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1606103290-15034-4-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606103290-15034-4-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_113321_195933_393DED35 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 23 Nov 2020 11:48:05 +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6359-regulator.yaml  | 145 ++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml


See https://patchwork.ozlabs.org/patch/1404625

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
