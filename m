Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3ED1C433E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 17:19:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873B922574
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 17:19:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2SKK8niq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 873B922574
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3W17CTK0NdivrL3BbGnrTgeELxZwnzR7d6DeYtLUMN4=; b=2SKK8niqgnJE0tRP0NSzE14rs
	DdQM+dHunvejpGqljxLrlacpb06mhvtB0GLOGuCl/J0jIJUgqV6MKBqOPGPBj21fhkA3zUIRLEEZk
	Qx1gF+32m6MUiO8W3f631dXq9e9UClGie7HbrjTj4jesXB1WEovXKMk4yLlsO0t/UWJ83krwQ4YzF
	OVIW5DO4Cr2bUEeu3nxItI9MqWb5Vv87JQ7/lf6upqwVqh5FfOZ8/sewSAFKKm2QepOk76nDM6+/v
	XZV2A6H5dLyA3psjewbOFMlIeaBIa4TDxtG2J2UkdfzODm9do9FMSeTe3os3q11PQpQ1eIhtT72bH
	0S88JJEpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvOah-0006Xb-Lf; Tue, 14 Jul 2020 17:19:39 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvOaf-0006Wi-BK; Tue, 14 Jul 2020 17:19:38 +0000
Received: by mail-io1-f67.google.com with SMTP id v6so18128830iob.4;
 Tue, 14 Jul 2020 10:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zi/Jq7DBazT7PKPowTAfmfi9qVl4RbGq0AWblTBzN5w=;
 b=KLcgkJ1gdK6OfeLtAVf1ebb2CrfS5Eimcq2fpuF5h0AhTlUJnW7KLkS63JFZoI6dh+
 k6NLlaWCXyuFi+dBWt3H6tyKexPED2inO2E5jWfmJIcEThniU063FHik4mhj8ykUdJdf
 WTRfP8nxiKs5fMSA3pV90E18O+Vxu0ZtrxCXzAHRNeaDEWuxVgqQePBL86Mc5OdKT4Kp
 gSDfLFudFOIRaeZ+CxluV5nIzkNaaVZDutZRfEQqkbSfkFzDSL/mmsydas3g2FW2aNjx
 BJrqNg2YYaXNV0EPM8dHK9p6CTnF/7Uif6Q5V2Fzw/EqW4VjccTh3lqgqqlh3GF2LqEp
 RsaQ==
X-Gm-Message-State: AOAM530QBf92hXlUZnKwmqDwqPlS75x9lcKJyzcXG1BbZvdUZd7oNNbv
 +sAbA4KF7Cue4nyZ+di/2w==
X-Google-Smtp-Source: ABdhPJyKq2MmJTjJW8+ZieKuXTdPtT8A+LvD3KRPJ1H57ivL83rZePTd7osq3UoXSLgBgZ9DYBjV8Q==
X-Received: by 2002:a5e:9b08:: with SMTP id j8mr4309335iok.116.1594747172300; 
 Tue, 14 Jul 2020 10:19:32 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s17sm9571499ioj.10.2020.07.14.10.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 10:19:31 -0700 (PDT)
Received: (nullmailer pid 2557105 invoked by uid 1000);
 Tue, 14 Jul 2020 17:19:30 -0000
Date: Tue, 14 Jul 2020 11:19:30 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH 1/6] dt bindings: remoteproc: Add bindings for MT8183 APU
Message-ID: <20200714171930.GA2551057@bogus>
References: <20200713132927.24925-1-abailon@baylibre.com>
 <20200713132927.24925-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200713132927.24925-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_131937_490348_AF4A403B 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 15:29:22 +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml: properties:pinctrl-names:maxItems: False schema does not allow 2
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml: ignoring, error in schema: properties: pinctrl-names: maxItems
warning: no schema found in file: ./Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml: ignoring, error in schema: properties: pinctrl-names: maxItems
warning: no schema found in file: ./Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1328008

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
