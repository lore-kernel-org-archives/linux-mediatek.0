Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52909CE7B1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 19:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiM835Qdr8r3YY1MsttP3YD4WAnIIepGWpUnlhXauk8=; b=A2vh8o4F8YNNusnz3qDiNr7/KR
	TETnXNPOJ00CcMbuN3EMUaIpJj8DpeLWCwJBKr2exRjY8MHGkmTfkhxH9B8A+PXCiFiuACwBNREDU
	DuB5hetqAZZjyJf+VvgjjObILXo9CspsQw0t+Oi2VueYoySQRzbk/ZD2N2MfstZcvT0FSmq/ZkQ+T
	L5vvjEOMWwJHtFyAcWjkSJ2b9TSoBxE8L89ZQvn1P0h/nRDZWfGWwSLxkknK5QWNYyTePvPjZfvkj
	SU4PqIdBn1iZwo7yoO148VeX+Fl7kWDl8iydz3UEl7g7GiRtg5gTytgZz6Uu8v0LafoE5jJQ6haUQ
	9lXKd2rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlwjP-006a85-1I;
	Thu, 28 Sep 2023 19:31:27 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlwjM-006a71-2B
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Sep 2023 19:31:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c736b00639so9345015ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Sep 2023 12:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695929480; x=1696534280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yiM835Qdr8r3YY1MsttP3YD4WAnIIepGWpUnlhXauk8=;
        b=j5m6bc3TmEJp4z/7kijpO2a79dJh48D1Kp1LGksQiKoiN5xSf2UJVSZVAcgl27u8jc
         IXHIZ0EPL65qvZ1uzjsVa5ZJtunTdIWPBpHka2NTeDaWa8N2rLe4K/7cwVvj1VDQpYFV
         G8o3u02c1PtIzmCWo+fZ8oolK806VSzI2oCDLi8OWKkAPOf7fNGSD4DQYlFGcISOFgyP
         iIqjyphiXQxzFdyOIa2atVwuRAW+chThz0R/gY9mKCZ0xPI/HHQmuAMK9WBIFEgUJl+W
         2ctgzIdFvajAuv27DBDPZlxlLdRCo5eS4JTtHKNMc/q9y+fi7XnhgmbBYsK5GnZm6INi
         aWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695929480; x=1696534280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiM835Qdr8r3YY1MsttP3YD4WAnIIepGWpUnlhXauk8=;
        b=OZzGlL+BCLcFh0U0DUh9b2zRZ3Ghy8CodEnxy0iZozunKRw3AwMSS/ZT+1+OPraNG9
         2pOdLMJYOQDYCuCaCOAtOZPZkAdGYb+aP37VFYr2VbAhw957Fq5fi+FV+spXn+sW398D
         WMg28UXAOXWT5FpPFT9YRjObe8A9fISkHHdO+4J8xkvK0UV7yXVgS1COdx1VnongJUwK
         6EruUG7S9T6+HSC0LrZFDDNEtiRSRCT2Qy+GUZf7pvbn26oihCLOim9dH7RuxrScQCla
         Gzx6sFXqFOBAAUBW5n6Dd76nLP/I2Eoa0PMapaXc3jEQiYGVTxVaPlhNFntT9FaQGV9x
         9Xcg==
X-Gm-Message-State: AOJu0YxcacUyMvd47DEPPO29oXiE/h3oUaA174IeGUfXzakfd0k0iME+
	k69jGok4XpQKPXDeo58vq7hsiHqpKwv0ZA716Bw=
X-Google-Smtp-Source: AGHT+IE95MGmqksj4rnPsJlhQcIbTza6nvpDZ3jVQORmb3wxwujuxwIunVo313zxNSIjjCOnvIToSQ==
X-Received: by 2002:a17:902:8649:b0:1c3:1f0c:fb82 with SMTP id y9-20020a170902864900b001c31f0cfb82mr1816980plt.41.1695929480038;
        Thu, 28 Sep 2023 12:31:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:46f7:63a8:c7b8:44bb])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902c1c400b001bf8779e051sm7236931plc.289.2023.09.28.12.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 12:31:19 -0700 (PDT)
Date: Thu, 28 Sep 2023 13:31:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: remoteproc: mtk,scp: Add missing
 additionalProperties on child node schemas
Message-ID: <ZRXUhSqHPt9R5Zd8@p14s>
References: <20230926164513.101958-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926164513.101958-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_123124_727922_9630321F 
X-CRM114-Status: GOOD (  17.63  )
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

Hi Rob,

On Tue, Sep 26, 2023 at 11:45:08AM -0500, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index 895415772d1d..24422fd56e83 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -91,6 +91,7 @@ allOf:
>  
>  additionalProperties:
>    type: object
> +  additionalProperties: false

Things have changed in the remoteproc tree [1] and this patch doesn't apply.
Please see if it is still needed.

Thanks,
Mathieu

[1]. https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml?h=rproc-next#n80

>    description:
>      Subnodes of the SCP represent rpmsg devices. The names of the devices
>      are not important. The properties of these nodes are defined by the
> -- 
> 2.40.1
> 

