Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B56BC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 16:26:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A591208D5
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 16:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A591208D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v0dmRs1PwnyEE5upQqoumQC+qR+SV+VHZpyLxQDfvm0=; b=UF6vSRIvg41voWgDi+EXIZwIo
	X+kfLnzzSpwKGsoYAntfYJ+jR4iZQwVj3IH9pmxcoauztGtzUDTg85x4iCgkVUFSKeCpcZdPResMr
	hL+4BbP24ombSPZptG5Cynym07CCk1bmaFO3L1YlawUDvoT/5jU4KLWD+ADZRy7wxEzGR4bds9ikr
	OB27zUFDJ5KfGG5SE1Kkv+8Ct6MXAxgDNDmB2xYa1+UqJmEI7GSi9isevUgEd35HwuRDYxuHY4oC0
	KdMFl3tiYuPgdUu8s2PHTyhER6jyYDPHFSoTJd2CjusSTP9Ksz+NAVLwQxx/WY5kJ4EAtRCp0Ajom
	MeO4FAMDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw6CV-00018D-VT; Sun, 03 Jan 2021 16:25:52 +0000
Received: from mail-il1-f176.google.com ([209.85.166.176])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw6CR-00016S-1E; Sun, 03 Jan 2021 16:25:47 +0000
Received: by mail-il1-f176.google.com with SMTP id v3so23141894ilo.5;
 Sun, 03 Jan 2021 08:25:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SCk5sLHOYObN1LtflP+npLNY+fu1HwfMPc8N5vmi9Rc=;
 b=O5u6evwRUnOy3VqVaVv9e1nrbyiGzJFKJox4Gq1zlZBatlCX69f7nXySIN/Bb8VuUA
 eENF0m9PY4teAJ1U3CEvwq1hxHaNmm1Dhq3cz2w2F0QBNFYli7itNNdbhc2CpjmXeNMf
 E68b9+RfE6pTDyMHLvC+fPxx4OWOsUuwHTsJvijXCglG1KP+DcZWRK/4OFKK49GxumIt
 u7ZbyYSL8vYP5D75Whyxzlw1AYupxwZcub5q4IoiR3Q99OdS5rL37/OsZw/9QECa8DuJ
 sYyT1UYHLGi2MHjvZVbeKUsDXmhZFkjKKFwRifl7MA5ass3Bjm3RawvCmnbyoCJSePi9
 SMyg==
X-Gm-Message-State: AOAM533XH9j+Ikg2X3xoE3eRIOEkixyppMtxcn9dyO0J3XHU0kjojjxA
 uSRObFNLgnAxaol4V849Lg==
X-Google-Smtp-Source: ABdhPJyERsS1rlD8orinZwPIQuhBotgG7vJMD8pbQQHrpSYXEEw6RVmHks9o/qRqB9gl+m7ryPkrtQ==
X-Received: by 2002:a05:6e02:160e:: with SMTP id
 t14mr14633157ilu.148.1609691146243; 
 Sun, 03 Jan 2021 08:25:46 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h70sm40924928iof.31.2021.01.03.08.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 08:25:45 -0800 (PST)
Received: (nullmailer pid 3986255 invoked by uid 1000);
 Sun, 03 Jan 2021 16:25:40 -0000
Date: Sun, 3 Jan 2021 09:25:40 -0700
From: Rob Herring <robh@kernel.org>
To: Yz.Wu@mediatek.com
Subject: Re: [PATCH v3 1/2] dt-bindings: nvmem: mediatek: add support for
 MediaTek mt8192 SoC
Message-ID: <20210103162540.GA3983563@robh.at.kernel.org>
References: <20201221061018.18503-1-Yz.Wu@mediatek.com>
 <20201221061018.18503-2-Yz.Wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201221061018.18503-2-Yz.Wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_112547_099969_6E15FBA2 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: devicetree@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Seiya Wang <seiya.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 21, 2020 at 02:10:19PM +0800, Yz.Wu@mediatek.com wrote:
> From: Ryan Wu <Yz.Wu@mediatek.com>
> 
> This updates dt-binding documentation for MediaTek mt8192
> 
> Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
> ---
> This patch is based on v5.10-rc7.
> ---
>  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> index 0668c45a156d..e2f0c0f34d10 100644
> --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> @@ -7,6 +7,7 @@ Required properties:
>  	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
>  	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
>  	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> +	      "mediatek,mt8192-efuse" or "mediatek,efuse": for MT8192

No, "mediatek,efuse" by itself is only for MT8173.

>  - reg: Should contain registers location and length
>  
>  = Data cells =
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
