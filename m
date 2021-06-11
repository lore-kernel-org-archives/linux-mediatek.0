Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF31C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 13:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A11961357
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 13:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A11961357
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+xYEp0FZ9e3rgsLuPSbm8/JDTbpfiOeVLresoVa+A5s=; b=gpk9ysoHfl94MNY0i0W/86EO8c
	3+thTduDbNryAI9NFnARqXEQAUfJQQzpuzECIwkGBzt0U1QXb9DAX52OPe8NfHfEpyUn6N8EpG7oJ
	uGoonDB21UclNfoE0gdy9Xlnh42T6fQt2Hbfs+bl4EJgoMW02+Qa0bBMJ98I35r7qVV/ZyT0yLzWG
	FPF+KTHoDHQcB8TOPIB02wrQedWtWrs6mtjtwwVQvI5iQ83RmJWxrTNY197CyAKVNfbIDfQ117qz3
	KiV6xplu/OK3IiOE3fa5c3uSGNUHc0Fm8+NAHGJjLUMrIJ4P8t8Lbv5vnNVIuiwYDH/gsHEXCTmLz
	Gqy47dyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrhVX-005RRW-Fd; Fri, 11 Jun 2021 13:47:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrhVU-005RPo-67; Fri, 11 Jun 2021 13:47:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so5441208wms.3; 
 Fri, 11 Jun 2021 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=73CyQddFjXeyq3KLs0vmikz1AYd/seTWj9eRVSGOW1U=;
 b=jzLyoN/KkjTThG6bLNAg+/k0lmoOx9xjP+/VMtG7CGQOS89k0uP/vWxgDXoZQIB4p8
 YLzAUMIAOsxpZQaa3NWjBADC5OCsxm7Gl8AGFsvMRzCN3FDDm/f7pMW4lqIRhxYvywU0
 cZlHSZP31v/uMF/EIAt+GumjA6W0JoTUT54PPl3GI/WV7Y+OHd0T+ONBKAMwzlGiXAuT
 UeSH5oXuhVft61NUFIC7mWW21wKcHFMBjAkK7+xiO25uCy0H8ATn3z5buEAK5dL28L0U
 GHHHsd0bmjZbTwBAsFrQJnwOilkZ5iQ77M1EEzlMvQUIzdD3NhfTFYcHcfXRNAoSiJ9r
 kSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=73CyQddFjXeyq3KLs0vmikz1AYd/seTWj9eRVSGOW1U=;
 b=ZK+Tjf/mzf83QsQlfUMd7CCGmEQmn6rKKgDK0ShTHOmeCB7IYtfNnsDHgLiUnOKDxH
 JI9WD8NST/DwaweLH856igi7EgNWUsJLSleqYZ/KD8iqoa8rWt3tOhm3dU+ifMpVHgzt
 FKEAlXDr5+ScOMVHQQXtN9/bMlpFuhYxP9VYpdnoi7Y2sjrv+6co4Sn3FH0zB91mwN52
 btHW8seELWltVNbaMUnPAawmtGYwAi3pAPNs2bLrq70ZJu693dFyUK403vwNF4n7VRLL
 CBfSCsbAQuQIB2tKZOE/m4fsniwGcPZ9W8rSMikfY3XiYOrHjh0HiTBUrBoofqk8YbBZ
 Lf3A==
X-Gm-Message-State: AOAM532nziFV/SGjNq0YA5wt3pkgszLArCyjbGEPqyopL7FqIAswlDc6
 brI3CMaS0aEfx6n0g0/AR/k=
X-Google-Smtp-Source: ABdhPJwpq2Yeiy/iQrYQe033avggot+eV2WT1p/iVOHuNKV/PwV32Zh/FfzWYziG/2sltaCxGIo/Vg==
X-Received: by 2002:a7b:ce13:: with SMTP id m19mr4165326wmc.159.1623419250311; 
 Fri, 11 Jun 2021 06:47:30 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id v132sm13686127wmb.14.2021.06.11.06.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 06:47:29 -0700 (PDT)
Subject: Re: [PATCH v4 2/3] dt-bindings: mediatek: Add mediatek, mt8183-jpgenc
 compatible
To: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
References: <20210611112009.2955944-1-hsinyi@chromium.org>
 <20210611112009.2955944-2-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9b8cb121-e7a1-8f1d-c591-d42a113415f8@gmail.com>
Date: Fri, 11 Jun 2021 15:47:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210611112009.2955944-2-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_064732_278778_03E2E3A3 
X-CRM114-Status: GOOD (  14.23  )
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



On 11/06/2021 13:20, Hsin-Yi Wang wrote:
> Add mediatek,mt8183-jpgenc compatible to binding document.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index 28f26e79fcb3a..e4e791d76cdaa 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -17,6 +17,7 @@ properties:
>      items:
>        - enum:
>            - mediatek,mt2701-jpgenc
> +          - mediatek,mt8183-jpgenc
>        - const: mediatek,mtk-jpgenc
>    reg:
>      maxItems: 1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
