Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AAFC43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 19:51:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8526820658
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 19:51:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wy8Ngp1G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8526820658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TyBXIL1zTrjMZr5TFKciTurnBkPSjpJAuctROn52xNU=; b=wy8Ngp1G0KEWE+AoBaa8w/sHy
	yGf0pZRHWP0jkr2/nkHLdlz+h3Eev3xsGSu+KcGKZYVbEsPtynA7NjPquBA5Pe7fw70mfuf5D6T4V
	peJjS2/iP09nzmQS2FH6p9TZmDZU49SHtUeGNoekgn9iRdZa65WZA5kXp4SJhlSt/Usp+cq9Q6Hef
	tY6stuFQX5lUVxyK5KGeH8jfmbtUoG5YgUHz6vuMYIV8NJSmF0/Ho+s6PbsnmiWVeL2Fd/TJ8maP+
	RFbCApPr2yzXZBKRd/eCXtvT5eOhKct1F1RJau9VV/Wpuc/PWYMkqdN1jbkjENEHuP+Q2RXPRgE1q
	3n2+8EHrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFjdt-00060J-JD; Tue, 08 Sep 2020 19:51:01 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFjdm-0005xi-VF; Tue, 08 Sep 2020 19:50:55 +0000
Received: by mail-il1-f195.google.com with SMTP id t13so69632ile.9;
 Tue, 08 Sep 2020 12:50:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wYZEjLQwTXY96HNLGsdoKgvmcXxudxUg3/wdAMNlCKY=;
 b=Pg1jzJ9tx9lT34uGgmM57/eH33/wVv9rFL/YmLIDGTuBc0Ak6kJCjSawQI/FLg6y7F
 6q4t+jvIZiq+/iWNuAei3sHCARVMfdmp4Pb2s3EJl/w74nzuBdyu9BQClwev3M538KE2
 vEIpvB/QV5yxKH9gHKYVpiAveteAqruQ182KN+bTx6Ge5OSgBJ9LPiuNrVAeMrw4DXFp
 wlkNWnO+DvFw+lXi89iPhRIbuBWfmjGOiNmjAtDOnBz5uLMD0lUnsTAeQWPP3mbpGphY
 n5OV44EDu9s47M6lZGiai6F+cFvG2Le3Pq8Twhu5OiR1mtvhEtcRNUiqVDwsd1pcWQeE
 i77A==
X-Gm-Message-State: AOAM532BQGCzTyZt91ELvNto3Jqpfxog7qY0kPPRa5eq/n7ahTd9czMV
 5pTmMFdrhFfw/M3EoXoqvg==
X-Google-Smtp-Source: ABdhPJyOWElQls0b423Yc43EIQ2uJbnV85nXzCnrhQNpnp/WEIa0eqADRr+RFWsXeGWmMLnRWyzVbA==
X-Received: by 2002:a92:189:: with SMTP id 131mr425929ilb.40.1599594654188;
 Tue, 08 Sep 2020 12:50:54 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id q23sm156327iob.19.2020.09.08.12.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 12:50:53 -0700 (PDT)
Received: (nullmailer pid 795761 invoked by uid 1000);
 Tue, 08 Sep 2020 19:50:50 -0000
Date: Tue, 8 Sep 2020 13:50:50 -0600
From: Rob Herring <robh@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v1,1/3] dt-bindings: Add YAML schemas for Gen3 PCIe controller
Message-ID: <20200908195050.GA795070@bogus>
References: <20200907120852.12090-1-jianjun.wang@mediatek.com>
 <20200907120852.12090-2-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907120852.12090-2-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_155055_010895_AD08229F 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 07 Sep 2020 20:08:50 +0800, Jianjun Wang wrote:
> Add YAML schemas documentation for Gen3 PCIe controller on
> MediaTek SoCs.
> 
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.example.dts:55.56-59.19: Warning (pci_device_reg): /example-0/bus/pcie@11230000/legacy-interrupt-controller: missing PCI reg property


See https://patchwork.ozlabs.org/patch/1359119

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
