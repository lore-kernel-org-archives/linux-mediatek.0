Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 19:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=En3JumnoIg/02kyqAqF2r7CkxydqxXta6wc65F9fFCk=; b=W47g2wwtRxmBkf
	zUeGaM2V9xI4Udt+W9OSArij25sRTKaElw3UOND6xyivkz5eU+JIUML6rXlqGcx0+saQZoVjjbqLe
	SbvgZalo+YgVEKaaL0/9LAWCx8NJyWS8U9xkgNVOBzL4YBpCmZj+OQLplQc9DwBjbqb1ZWE7pSz3z
	F20OIEndrzUfEQzlkEmj2kU9osbOH4E6WxO5FR6hc122cEqPdAt/4EOYXHDb2sDIwPaiaEhiImuQm
	MFk0MciU59V6jq+ToxdLdYJSOIM9fd2L+ZkNq9QxUfPU0IXlX4zqJWCrJqm+ACZbGTf+OU7NHnJsC
	uniWHhjUISvnqhGwzA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHsEU-001IeW-8u; Wed, 09 Feb 2022 19:02:26 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHs9v-001GWc-GW
 for linux-mediatek@lists.infradead.org; Wed, 09 Feb 2022 18:57:44 +0000
Received: by mail-oi1-f171.google.com with SMTP id x193so3541129oix.0
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Feb 2022 10:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H7xdyU3dNzn1aGQxkPyHJk9OkHfZ1q05CNcab6XbAM8=;
 b=v2Hoz00oO2zJPL/yeSKv4yS7ulMoBqB4EEfba19oXnXg80CRVcLZZVDxgiXRJ+xefV
 3cN/BSzlWGa5YtKGQj4mhS5ZZrV8OV60Azni1dYQ3EZVSFQp1a1UpyTpxNxCw15/L9g/
 JXdb8oMDHrO5OR3UTOt3aE3aUU2OCmwF0az4ABPtOUf5mkBT+ffo9cDzAbGMCx2Go2TF
 24ktPEWJKxt5QgUUREbRwYty91iTt+HQDyIIfo+c/I2j+eniQvPK6kSb3eEsFX36kd6s
 SzDyjIjFGwzc5ag6an8RWVsBMv4iGh0wwUGvOtW9zLKt4lKaqDOznj7C8IE/8RNZSuB5
 bOMw==
X-Gm-Message-State: AOAM531I1LIa7d4B6M29AZcHHzcH/dGaROpHcMcfBNxbKiE5QsAJWWGe
 SorJnvQunkLaQI+AdH6eU3PaFXCKnA==
X-Google-Smtp-Source: ABdhPJxP//1aGuFFY9vxv6CdY8xqk4XXBhD/YeyBeYu20dO0Ofj+I1tSvsI8ELVBjnh9kya5nvPUDA==
X-Received: by 2002:a05:6808:1989:: with SMTP id
 bj9mr2018511oib.28.1644433062105; 
 Wed, 09 Feb 2022 10:57:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 21sm6898916otj.71.2022.02.09.10.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 10:57:41 -0800 (PST)
Received: (nullmailer pid 691757 invoked by uid 1000);
 Wed, 09 Feb 2022 18:57:40 -0000
Date: Wed, 9 Feb 2022 12:57:40 -0600
From: Rob Herring <robh@kernel.org>
To: Bo Jiao <bo.jiao@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Sujuan Chen <sujuan.chen@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Xing Song <xing.song@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: net: wireless: mt76: document
 bindings for MT7986
Message-ID: <YgQOpOnYJyHaQtV8@robh.at.kernel.org>
References: <cover.1644386694.git.Bo.Jiao@mediatek.com>
 <08ef978845036560bb08b72e948e42f858e087d3.1644386694.git.Bo.Jiao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08ef978845036560bb08b72e948e42f858e087d3.1644386694.git.Bo.Jiao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_105743_584253_1D7ACBA7 
X-CRM114-Status: GOOD (  10.89  )
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

On Wed, 09 Feb 2022 14:11:55 +0800, Bo Jiao wrote:
> From: Peter Chiu <chui-hao.chiu@mediatek.com>
> 
> Add an entry for MT7986 SoC.
> 
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> Cc: devicetree@vger.kernel.org
> ---
> v3:
>  - fix yamllint warnings and errors
>  - add 'minItems: 1' to keep 1 reg entry being valid
> v4:
>  - add description for property reg items
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 33 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
