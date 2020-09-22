Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA608C2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 16:07:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80E7622206
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 16:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vk+zRzZ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80E7622206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=InuJWGWODv0oY+kpg9OrExIgY1kbDEGcteuUQc6NI08=; b=vk+zRzZ1Jt07kDp6w2WH9iC6K
	Au3NrfrHn3un5WlreqYvqu/eqon0jcjOrLx8KgWkb/BY+uFDcf2TQbttm3P97ybhZnCKfbOsxa3s4
	CZsNK11gyrJlADCebp98hwmnUqQOTiqrnuPFQpdoOi0h2p+dcM2uPc/BrJUgdM/HDynkwGcHTsnd3
	QzPL5JORpr7lvxAYtFBO7HcQ8eMjhbknOlxJcvBxrVd7LF5MFUPtCCEjtx5cFiVUY9eDhi3kVRIle
	/QCmo3rxpqoi44fCT+7zT3OsYEyWEIaVhXOXixsLuP+iV27Y21G6zg52RsoU/zlRbYJ9MS3n3DtS+
	J3GTFiS4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKkpA-0000ni-PL; Tue, 22 Sep 2020 16:07:26 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKkp7-0000mX-KQ; Tue, 22 Sep 2020 16:07:22 +0000
Received: by mail-io1-f66.google.com with SMTP id v8so13433424iom.6;
 Tue, 22 Sep 2020 09:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zF77TzjrjYmXHXCkSrv/gVnYfB2PIU90P8T+fzmt7Pk=;
 b=Wzdshz2pE57jwPBIoUY2H/sXAy9Xwj5vXhX6jZotuFNOOLv6y56Np7XlF1kXXvde6/
 MJvEWqBwb3OMc4v09vPbXC84pTo4Jc6fEV0fdVesx9An2vyenEWm+tN93IDJUd7LXlhg
 J2SC+Tq/ceJFQrZhhfPsu6+4vjlQYQC2djPH20afzIQomreThbap8XN+AWCTby6//dwN
 gu7w35QUhOVz7+/ypT4h/ThsDWz9p6dxaFJ5sXQhO4MmDhjWgEQTczg51dwsu1f+HNnC
 Phf6YntgMJNs9hbYx885V20hXkbsySNu1S/kXYk7MYcWjeel5BfLOMIf8ecfWXrbg4zW
 QmDg==
X-Gm-Message-State: AOAM533CzUw2tmSlX4ZxRg2Ygqdfc3M2WKQvdKaJdpQyr728iTy/iA9s
 lYxNivHZ1K1d5jC7nsHmug==
X-Google-Smtp-Source: ABdhPJzt0CvS500bgQNFVROZZ0PumLBOgLUdWUuWg7zB0QotcFRl7mSab3HVsaqhvkXOoytRw5oRZg==
X-Received: by 2002:a05:6602:2013:: with SMTP id
 y19mr3976939iod.148.1600790840376; 
 Tue, 22 Sep 2020 09:07:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 2sm5005397iow.4.2020.09.22.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 09:07:19 -0700 (PDT)
Received: (nullmailer pid 2773058 invoked by uid 1000);
 Tue, 22 Sep 2020 16:07:18 -0000
Date: Tue, 22 Sep 2020 10:07:18 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: convert phy-mtk-ufs.txt to YAML
 schema
Message-ID: <20200922160718.GA2772140@bogus>
References: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
 <006ecd5b88fd7d23a355f2522c37e745f72ac45a.1600760719.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <006ecd5b88fd7d23a355f2522c37e745f72ac45a.1600760719.git.chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_120721_733278_1F41B4C8 
X-CRM114-Status: GOOD (  12.38  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 22 Sep 2020 15:55:07 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../bindings/phy/mediatek,ufs-phy.yaml        | 64 +++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-ufs.txt   | 38 -----------
>  2 files changed, 64 insertions(+), 38 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.example.dt.yaml: example-0: ufs-phy@11fa0000:reg:0: [0, 301596672, 0, 49152] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1368813

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
