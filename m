Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B470EC77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ATht8q/CS7yxKYxJHjIaLdg/Mk6t9WcQns9JFqiJGcE=; b=Y7ZJssmtIdiHdTU/91cF0ruvhK
	QKnaBTXL9RQ6MVVtufsTVwskWKnSqlxaPySP4G7fmLBo2wc9P74tAA8Zw4ij0G0YcOdiQHSMr0Uim
	7n/WrPdRea7l3HdBzPFz1emw/2HRD+Htz2AIkUBkK6qFVyq0V7744ca15OXjM1lt2TKn3M1oPDUXH
	vY/otNmfC8P6yipzU+s44LEbzClnyfAkymUuff2H34C1x+kmcmpYlbToMuITzM5Vxgd5ul0dnNZiX
	zDU8cXocngfStfh103ApQ6rxzLDhrnGUfSf3nP7fzqvJwK4mgYsXCWulUrmW0jwJ9uO370etN3nD6
	eHvpgQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppbrT-0092dX-2x;
	Thu, 20 Apr 2023 21:30:39 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppbrP-0092bq-2x;
	Thu, 20 Apr 2023 21:30:37 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6a5ebf9f432so1133775a34.3;
        Thu, 20 Apr 2023 14:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682026231; x=1684618231;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATht8q/CS7yxKYxJHjIaLdg/Mk6t9WcQns9JFqiJGcE=;
        b=hGnKC/N0mVzlmfUjmPSaXY8sQRVGQj0ARdExGgIP/KHkDFYuNBzgd+mqL8O+P6+TDO
         RRptuBlmToVlftb/sj1j2n7aPRMPniR2KDoI7TGU1IMfUys06NDwEaj7Q2JqwRkOLM/d
         bjO0TqfqUP4YorkOxM4p0W8VFejr3rWV2gau0M28KB1xlXZFPgch1MYEjRkEKWf0AO+U
         wsRSsWwaVA/tOBTW5P6t26XJWyJwGYNLeCiIEs9o1imaKATnmD7PCtjPdxjhhs+7mJtZ
         utt43a4mkKvqUV6TZVdASmsVRrqXxEMQkBQZ6poKe3lRPy1HowRq8ett+X32/lJmAtqk
         /Fkw==
X-Gm-Message-State: AAQBX9fXbNQlj4eXyHRHzUvM98kuctKaZpvc1M8GAaU1q2y0ujcRbPb0
	ljMaIsNxnLRWFeRsTMB83w==
X-Google-Smtp-Source: AKy350Zu5SKq+FOHsTX+3TUAClUUFnxjs2jKsT+5gqD0b3RPFo5nJwJzjk37cWGrIjq8JLZNK2lcWQ==
X-Received: by 2002:a9d:77cc:0:b0:6a4:3c4d:8eaf with SMTP id w12-20020a9d77cc000000b006a43c4d8eafmr1315601otl.35.1682026231426;
        Thu, 20 Apr 2023 14:30:31 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y7-20020a056830208700b0069fa776d3c2sm1150266otq.18.2023.04.20.14.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 14:30:30 -0700 (PDT)
Received: (nullmailer pid 3586692 invoked by uid 1000);
	Thu, 20 Apr 2023 21:30:29 -0000
Date: Thu, 20 Apr 2023 16:30:29 -0500
From: Rob Herring <robh@kernel.org>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: rng: Drop unneeded quotes
Message-ID: <20230420213029.GA3518858-robh@kernel.org>
References: <20230327170153.4105594-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327170153.4105594-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_143035_948760_6416BDDB 
X-CRM114-Status: GOOD (  10.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 27, 2023 at 12:01:53PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/rng/amlogic,meson-rng.yaml | 4 ++--
>  Documentation/devicetree/bindings/rng/brcm,iproc-rng200.yaml | 4 ++--
>  Documentation/devicetree/bindings/rng/mtk-rng.yaml           | 4 ++--
>  Documentation/devicetree/bindings/rng/ti,keystone-rng.yaml   | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)

Applied, thanks!

