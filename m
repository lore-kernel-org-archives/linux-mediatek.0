Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBDAC49EA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 19:26:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7549A610C7
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 19:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7549A610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d351elRKq2SDWH0KICVM/xshEKXY2g7GTWFbDLR12+8=; b=uwHXPehyQzVHoq
	03DsYmVhJrPm71TxTL7ELRwu8fUTxk/1a13jyVIPyjgXFTwodSUpr+kVRavClih0mVEaWgBovx0Pi
	YrFFXWN8gjgjrdpBy0/9o8VrULux/QcHrImZkcmBWPh9HFtcjDGnx9MWiJIDYVNQfHqrndRNDPZQK
	OcEbT7W1cN6IBQzP/wDeeyvYhk3dyEoDk8mqNyWZ9ZWs4IJ630EToZ+JyNV1MyFt/Lg+5oRD1dByo
	4YKwZGTA9xJx7PdICiaVVJ40HX0uG/X6zg/HWp1sevulGh++RIJa+udxyS13l9sGTYcewEmkqtREq
	gPC/i08hJjCtSEMfMkEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwUzK-00G21x-Sg; Thu, 24 Jun 2021 19:26:10 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwUz7-00G1ym-7p; Thu, 24 Jun 2021 19:25:58 +0000
Received: by mail-io1-f50.google.com with SMTP id v3so9608426ioq.9;
 Thu, 24 Jun 2021 12:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NoZyl7I2VPKHg0pgvo0YIUYxnuiUr9WM9SkizCiTx20=;
 b=XZTeBLCRxY8THgGv0AIZkoBalfvBB3aTY+TR9VyP9ZnMmPX/wEaP9geizcVrc3Jcyb
 /71Sz0E95kBB+kCRFbX4aRYIUDh5BBx2hlXNXNP99NylC+DgbsNUw9ImEp70FRYNeOkI
 bWIcqd0xSV9sH6h/ZnRqW81ewuyqwARSLFu1IcqDghZDMRez0BAyvp6Hv9nSre6gxcKM
 /ojgmYMjKkSsuk+rtR+VMhLHaS//JE8GgU2KhcVaqet3QIUEYwPROL6jCR/lCxtSDoJU
 +1M0GiifDkOGU8Ug19c76HHL0CkAGrRRwPRxk0x1mAa9MAPI2ghRFApNj81z/PtviT6f
 1StQ==
X-Gm-Message-State: AOAM5300xBKXlMC25OBkTsS/xiQB3xFEcKBzAD4skgwxHsdXg6zAJimR
 kdgrTQAC0URyP//4XkGyig==
X-Google-Smtp-Source: ABdhPJzKsufdMFQ+g2G0z/mqJGLryywRwswrkQweoArzJGVUVEOJFEtTLx5vrHidP41PyLW6PeLHgQ==
X-Received: by 2002:a02:1988:: with SMTP id b130mr6098925jab.44.1624562756222; 
 Thu, 24 Jun 2021 12:25:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id e14sm2243361ilc.47.2021.06.24.12.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 12:25:55 -0700 (PDT)
Received: (nullmailer pid 1845973 invoked by uid 1000);
 Thu, 24 Jun 2021 19:25:51 -0000
Date: Thu, 24 Jun 2021 13:25:51 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, maoguang.meng@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mediatek: convert mtk jpeg
 decoder/encoder to yaml
Message-ID: <20210624192551.GA1845918@robh.at.kernel.org>
References: <20210612031853.3115482-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210612031853.3115482-1-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_122557_345496_455D2151 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 12 Jun 2021 11:18:51 +0800, Hsin-Yi Wang wrote:
> Convert mediatek jpeg decoder and encoder bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.txt  | 38 --------
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 89 +++++++++++++++++++
>  .../bindings/media/mediatek-jpeg-encoder.txt  | 35 --------
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 80 +++++++++++++++++
>  4 files changed, 169 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
