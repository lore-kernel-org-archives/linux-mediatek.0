Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC20C4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 15:49:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F481206D9
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 15:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="anmElANB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F481206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aAP5qqcLPN7EfpbjYWXZwcplT3oufBGQMGcoytiG4Ug=; b=anmElANBJb7Qw5fyWy/Zr1MSC
	Mzv6IOKOB+wUKgpDe6ryHT+4PS18RbW9mPKdh6y27+y/MacSVyXsP4d1UhpSZVdyHqtmknNqwyvsP
	jJG/nwOmG3jqCK+6Oz7P/s9R4rD/XOBwBpbIVafYj4jQj1T5madDbQtSVcxzc6nRt5kAjD+cqW7fE
	NzjNBq6OO+YUdxgf59nrYvKrNnWrRyC5FH2DIDkgNs0qtlyn8D8tUerolI60bkBISPOzC6PzC9gug
	JE0TiKNqDDt6UqT1sR8hE0ASORWSTi2xDEbsF/seUeVyoVirHRf3tff/cnObzRfx5irivYtdvphF0
	Yoy9oODMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNHs3-0005vU-Rn; Tue, 29 Sep 2020 15:48:52 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNHs1-0005uf-0N; Tue, 29 Sep 2020 15:48:49 +0000
Received: by mail-oi1-f174.google.com with SMTP id m7so5990800oie.0;
 Tue, 29 Sep 2020 08:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JVFwpNrq1SIlzGPYHpvVMOxGitI2JeKtHPxEZUWE+YU=;
 b=JQ250/hn2BbxYRR20w99L7jS4Uhrip46EaaQPtae8TagDd4+gj/VvFXh7z2PxnM968
 NsekeXYxRWtmCHUYjgOHPpNH2fEWPHzrh0R7sbr83MTBwr+trTVwqaRYksxuu9uJj2S4
 UjzwDLD9Fa84qFEDS8Pl2zbw505MZCpY5BtQGeBzyi68xbironlpvFI3uUMq0qKETrXN
 OQUyYVMTCk7zwNeD6ZY59afLfuWAsuZsq4Jbu2bmZFKIBR7LdbtMAPh9ku9nBJ/dVwmq
 LsZ1DTvYDOMNpiwZb2DC0C8UpQtsrii324jORBSY+ulecXt86atr049XBRioFiHfuAdW
 HnAg==
X-Gm-Message-State: AOAM532VLGGuoiHt8UaPCuwNlYzb0aWgtE/ByVqgkGvB5QSRki45SIj4
 l0wueeT92Y4A1Woq4AwGEw==
X-Google-Smtp-Source: ABdhPJzSNzJP5DPJRFA+qMMldts+IB6wvoeLlHF6lW8kriWq9WfG35nyDzUE8rvIg+GDmnAEqgPUug==
X-Received: by 2002:aca:d549:: with SMTP id m70mr2987760oig.49.1601394527334; 
 Tue, 29 Sep 2020 08:48:47 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e22sm1140797oib.18.2020.09.29.08.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 08:48:46 -0700 (PDT)
Received: (nullmailer pid 662454 invoked by uid 1000);
 Tue, 29 Sep 2020 15:48:45 -0000
Date: Tue, 29 Sep 2020 10:48:45 -0500
From: Rob Herring <robh@kernel.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [v5, 1/3] dt-binding: reset-controller: mediatek: add YAML schemas
Message-ID: <20200929154845.GA662033@bogus>
References: <20200929134642.26561-1-crystal.guo@mediatek.com>
 <20200929134642.26561-2-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929134642.26561-2-crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_114849_063315_92CAB819 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, stanley.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 29 Sep 2020 21:46:40 +0800, Crystal Guo wrote:
> Add a YAML documentation for Mediatek, which uses ti reset-controller
> driver directly. The TI reset controller provides a common reset management,
> and is suitable for Mediatek SoCs.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> ---
>  .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.example.dt.yaml: example-0: infracfg@10001000:reg:0: [0, 268439552, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1373428

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
