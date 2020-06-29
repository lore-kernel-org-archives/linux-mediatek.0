Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22899C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 21:56:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8FCF2078D
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 21:56:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WTdOpu81"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8FCF2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9RjfwoMdLmEeo8a1SbXVi+it4T5LJATEWo47jrGiBC0=; b=WTdOpu81LQPy6ehmOKxz4FxI2
	C05o+SXdNcYH/Nt4aoqrgNHjtADF04ges0nX6BuyxGpB6I9dw19+uUwIEA2pcIK3bZAaX4OkLKY48
	LXOqEz0tYTDLChbKqIpBwuW9doK5Mjd47iEb2la0/e/sZ1PH+l/v+GrS5LKYtmDKjeDxbCI5fMrcv
	SstPw2YHdyc9EHKNnCz8aTGejAuMAo/Jh26Aphr9FVSXqi8A7qwsaCUDnr/qwaPv/gXjK/9amXraK
	YyHZJuTxjkslQlu05aauUBJRiAP8eJJGZH60oh5T3Gy/y6Qd07azY7UBUMSge865BvAWZ/jTSV70D
	2eaT40BxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq1l7-0004ja-S2; Mon, 29 Jun 2020 21:56:13 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq1l3-0004i5-E8; Mon, 29 Jun 2020 21:56:10 +0000
Received: by mail-io1-f67.google.com with SMTP id k23so18811974iom.10;
 Mon, 29 Jun 2020 14:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7BzdbzHdhO67Ygeg4vmtsn4XIT8EQ37NcHABkSdRi3E=;
 b=EC579ofh6mp+1mu220Je+wS/fRM4DkiaukxxemalO4aW1B0GsNpr8mL4nADhbPzuJz
 8vY0XOYJGnOFSqyNIebWvx6GvD58vYvy4Cadfdv/Cw7mhNjj2YiFCb+sUTHeNgY77LAN
 fe7PAVz4c8CcasDv6hbcOU9FULPW9IuANYV90ZFkJiCUFs0ahocBn1TRVGM5t63IyOUU
 7OaunszLkzvYEVRnDV3QRXj2ybuj6ReTvWT/8qj6qMy7Ks4bNksyBJiMQwPBkKTqafPP
 0NGZo3pHf+BGx/k9RY/2JUtsJhhdTvdIBXdsun2pI90aMhLubBGKlzv9j0vlbbzFirqd
 WPAQ==
X-Gm-Message-State: AOAM532JzY0EratF25pqqhSqM6bS3axB+a3iQ3Kd46KTohk51HMYDmPo
 TpGLvgn8+ZHSG4sYVOX+tw==
X-Google-Smtp-Source: ABdhPJwEvFQMnYXTu1dUlTrx8NG/GBWsngrOu89NxHz6Tg+mFbZeo4sGg728NSX2H2aFS2/qL1GcVQ==
X-Received: by 2002:a02:cf12:: with SMTP id q18mr13182774jar.3.1593467768763; 
 Mon, 29 Jun 2020 14:56:08 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
 by smtp.gmail.com with ESMTPSA id y5sm590604iov.3.2020.06.29.14.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 14:56:08 -0700 (PDT)
Received: (nullmailer pid 3001028 invoked by uid 1000);
 Mon, 29 Jun 2020 21:56:06 -0000
Date: Mon, 29 Jun 2020 15:56:06 -0600
From: Rob Herring <robh@kernel.org>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: devapc: add bindings for devapc-mt6873
Message-ID: <20200629215606.GA3000557@bogus>
References: <1592559720-8482-1-git-send-email-neal.liu@mediatek.com>
 <1592559720-8482-2-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592559720-8482-2-git-send-email-neal.liu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 19 Jun 2020 17:41:59 +0800, Neal Liu wrote:
> Add bindings for MT6873 devapc.
> 
> Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> ---
>  .../soc/mediatek/devapc/devapc-mt6873.yaml         |   61 ++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:0: [0, 270561280, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:1: [0, 271007744, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:2: [0, 271011840, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:3: [0, 285343744, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/mediatek/devapc/devapc-mt6873.example.dt.yaml: example-0: devapc@10207000:reg:4: [0, 270589952, 0, 4096] is too long


See https://patchwork.ozlabs.org/patch/1312741

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
