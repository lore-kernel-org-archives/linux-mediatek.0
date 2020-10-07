Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5360FC4363D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 13:50:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA303206F0
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 13:50:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+CJiUAo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA303206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ws0jOuuKrFzWCJevhwb/+9Mma3VcagLBFPepDPEqYO4=; b=W+CJiUAoPdA6wVCdEn+FrprNn
	B7+gK8XUsRfmeyXr60HaT+diAiD64yLRW4HKvGgJHmJbB8Me1WqikudyRtpJlJOg5IT9X6mac/LSs
	CeWHh3DhsPR35tKF2OyZPhw+wBFZ/hD1JkDoXVtTebHref7WTAtHFRBAipafDfdE53eofar2RgjIE
	5mXiEfShG5YwuoS6fbRX3uuKRirneo5qXGdJ8jhFN6y7uzKkeG+9Av55qy14KHyIZb4L+GQHRwZXk
	TL2dsZ+sjd4nsuoY4Qx5GNisGS9AoFbZM6CCk2i5hfB6BUaRonIyLXItHAwFxBYaZ6GoOEAWv21MM
	mTiRmYCEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ9qB-0007Qf-0P; Wed, 07 Oct 2020 13:50:47 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ9q6-0007PI-Ui; Wed, 07 Oct 2020 13:50:44 +0000
Received: by mail-oi1-f194.google.com with SMTP id l85so2442884oih.10;
 Wed, 07 Oct 2020 06:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tHjfssJN4xtGC2v26gavuA3JBazoT19809Dqj28cIXc=;
 b=YUR2NZqWRkUj54nVuovz7HWKAcblQBSry4U1mPEu6JQJ4lv85nEENFIkvUzK3XLJsL
 SAWsxS2OgWBF16rX8ZuB0EZBEO9IOaMuTV64DAwlAsJLcJaSAMb1z/9DFP09aaqeljRd
 b0CGTxcgXD2vOU7/ECme/uZGWeHMIsF7fUaw3WWYNgY62ZSWaS68ZLGNlJHx90qDPXyW
 u3lCraLVvkzaAlDlqjK59IxfOxmWqZhz9+BlZM4EZ+Wh7PdC9YvbcH76N8uQltdXOVUA
 9WxQAGp15hO2+4f9bspykKztl1bh+02OyXL1KedDsfF0wYTbtGFk1f9wfl8v5alPDWUN
 18Lw==
X-Gm-Message-State: AOAM530JbW7VNwa0HV4Sy0tPVpnuFmr3nXB9eBWVFaYogsQXGYt09EMD
 gfy8kUaGnqS0QOWgjlqGgw==
X-Google-Smtp-Source: ABdhPJwItZ2iHWEIWP2OBnOgPnQrGMhJQqTy5o/IN8sbPTbtIrR7N7hUK9M/gtjrMkQrM7fyqIDCTg==
X-Received: by 2002:aca:53d7:: with SMTP id h206mr1990127oib.113.1602078641716; 
 Wed, 07 Oct 2020 06:50:41 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h3sm2260548oom.18.2020.10.07.06.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 06:50:40 -0700 (PDT)
Received: (nullmailer pid 123982 invoked by uid 1000);
 Wed, 07 Oct 2020 13:50:39 -0000
Date: Wed, 7 Oct 2020 08:50:39 -0500
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201007135039.GA123258@bogus>
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1602034966-3524-2-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_095043_002607_F7644842 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, dmurphy@ti.com,
 Wilma.Wu@mediatek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 matthias.bgg@gmail.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 07 Oct 2020 09:42:45 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.example.dt.yaml: led-controller: led@0:color:0:0: 9 is greater than the maximum of 8
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/leds/leds-mt6360.yaml


See https://patchwork.ozlabs.org/patch/1377747

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
