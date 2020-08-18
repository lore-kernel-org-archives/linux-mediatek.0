Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D6B1C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:44:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3D13207D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:44:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+s/DkBJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3D13207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=foO6kZYzrHnyw7s/lbBUCtsrC8iInDHxa/JQp2QPs0g=; b=G+s/DkBJxA+027eH25fP7096C
	dZY1WHgdkQ4DXe048VoTcxuQz5pSNFrZXZYPghIfPo+Fru/TdYSzFkmAv6h6yHrjRxyoHYXpHgXR0
	DbIIh3DW3B31ZfOeBs4fmULSTJT1EKKiuEOsFAnSqBQlJVr7MYAg4IDMvv8LFRKWgrz955KjHceVY
	JCKs5jvAc7mt4OYY1SoWEvxh5fIgDIEXGSyJhJUpsqkSYHYx1erAMpV5jvqWE5lMgz2SswPFBvNW7
	GQBSQGBoonJMjMROQcfKSp1T+PEueg58YMu7rfLf8oBQwA3ecObtbq4ADWTXC2uLRT+f7BeF0Fctt
	zhUahhhVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k84iL-00081M-Vt; Tue, 18 Aug 2020 16:43:58 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k84iH-0007wS-LQ; Tue, 18 Aug 2020 16:43:54 +0000
Received: by mail-io1-f66.google.com with SMTP id u126so21716384iod.12;
 Tue, 18 Aug 2020 09:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OdM+aoS31AuCOaARuG5YZn8l4KcZs8vVFfImA0Bqt/8=;
 b=CEgYjowVsN+MEqlNVkzxcPcRAYBFswcXE3xQmP6O5xq2EhBqNrFOvpRlH58IgPKAP+
 NcHfM/1k+tGrkzUrnsikRTvFOaBWYGH35JCgQsy84F+lQh/gV4BWfJMSp1xsm1IdaSlj
 kO8eVXzjLqOWm546IZUCPiNd82W8G9FfgxByynoVCPlW2qPIr0a0Fo7AKEvuyviqJwpy
 wT/fweLXNrfjb0qqrX2/WzDgcC/qqNjeDVPFFE6V2DTUjJgYmsjTiZ3fpNVG21R4aDNu
 1+3DMSb9cnQKDiBpHwaQ0r7wPcXju8ouR7rfpZkE27z5SyvpLCxTaUkEnywfPwKz8R5J
 M/LQ==
X-Gm-Message-State: AOAM532B+ROXRfU2VJZ84YKIfmlS2c2Ul58vX8DwX/YLQ6HIM/E5cEGR
 seC9bIA4IBptGNA55geZCg==
X-Google-Smtp-Source: ABdhPJxBrekQSgwi7+gaUnJW2v97uftSBy1VBEmFaxjhiZ1mSG5EcUFvPmIpvOf70V3hce6cNnsrDg==
X-Received: by 2002:a5d:9ac5:: with SMTP id x5mr17597820ion.111.1597769032003; 
 Tue, 18 Aug 2020 09:43:52 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id j10sm11949221ili.86.2020.08.18.09.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 09:43:51 -0700 (PDT)
Received: (nullmailer pid 3596901 invoked by uid 1000);
 Tue, 18 Aug 2020 16:43:50 -0000
Date: Tue, 18 Aug 2020 10:43:50 -0600
From: Rob Herring <robh@kernel.org>
To: EastL Lee <EastL.Lee@mediatek.com>
Subject: Re: [PATCH v7 1/4] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
Message-ID: <20200818164350.GA3596085@bogus>
References: <1597719834-6675-1-git-send-email-EastL.Lee@mediatek.com>
 <1597719834-6675-2-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597719834-6675-2-git-send-email-EastL.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_124353_727331_045E6BF3 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, cc.hwang@mediatek.com,
 wsd_upstream@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, vkoul@kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 18 Aug 2020 11:03:51 +0800, EastL Lee wrote:
> Document the devicetree bindings for MediaTek Command-Queue DMA controller
> which could be found on MT6779 SoC or other similar Mediatek SoCs.
> 
> Signed-off-by: EastL Lee <EastL.Lee@mediatek.com>
> ---
>  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 98 ++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dma/mtk-cqdma.example.dt.yaml: dma-controller@10212000: '#dma-cells', 'dma-channel-mask' do not match any of the regexes: 'pinctrl-[0-9]+'


See https://patchwork.ozlabs.org/patch/1346576

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
