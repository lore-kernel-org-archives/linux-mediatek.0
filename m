Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EED8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VB/ZymSE/LCRSNlWyDP/Gd9pYKtZxKUd46cc1YrQuK4=; b=o/jH1HwTYkMK8M
	vawQx24KMSeP+xf9580Z8XGb91/pvn8REPod/KJNm3JzXtH6hZhc/aJLV50XLmt6NvaoaAFXWP/0A
	W02WwAUzgRH6WplyKcF6Trehe5VYimG0oz5X3OBemGfDcAvDLjbBimyxFvxmMUvuIxO7JpAPngcCk
	NHcx327dC+HiV0c7f8V/r7COKYfdFIRhO1HSOC/lDICID+dEpy7qiz4z0ECuiuRSzcDDilJFob1W6
	OD9waExUIjPQx3+FBMF0q2QMQIA/SuEkCpoUnO0v5o3gJc93j7iY+ZCwPxCABPHyiBXuRoZHluLBZ
	eeU5CFn8ULdQ1PZ2SUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUkQr-00F8VT-P6; Thu, 17 Mar 2022 07:20:25 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUkQk-00F8QG-At
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 07:20:19 +0000
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0E8DE3F60F
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Mar 2022 07:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647501611;
 bh=RoUeA1wG24c/Crhww+WUj9NHBvCMvLhd7U/GxxINFtE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Q9AR34otYJHEPf3xISUocxfiZKdZUsQvf6CMNhJ1xpPWZsfW9rDDNq7Fl0Qp23vBq
 +ailvCP88Sm4MqiwkSEFpRA/vq4oCxarOPPdXmqkFFA7VXeltkRVGW+G/60kiIgtNB
 ShyJW4N3u2dastEasdNcXb4vGSQ/HEZRmYsmgBCA/Og2YqjArX5ztqTlE23bF2VtDF
 s+5l+AJtPMYU5ypUYEmfbHE8/xN+s/2FFd9BYFC1+j0N5O2DeTLCrt+ApfhATTwq0Y
 hucsr5kX0lEyNOtD7seW/Si0DJ+DaqQuceyqd2e5GbXPkbGC7P3CXkTlrw3NF6CoyI
 XXK1iddTp2hfw==
Received: by mail-wm1-f71.google.com with SMTP id
 o19-20020a05600c379300b0038c7117460dso1248607wmr.6
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Mar 2022 00:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RoUeA1wG24c/Crhww+WUj9NHBvCMvLhd7U/GxxINFtE=;
 b=DXOcvujKT0KL0gBI1XWntyO6D0abikZB3QTIhP6GCCq5WGDqCP1ONjuw7O93t8xjft
 W3+mr9GSSXwVyQFb3ubas49aZyqJektAvu9LyQtHmfdw7IOY/zqahue+uZalbtYsSVLE
 1qeEZwKhjkmWlbsbJBXYRNr/LRnefvkWbvPt598Y8SDbqtBXUKckXfZTFIYI3YUeflPQ
 6/1aK3Vfp5LhdqeaKORw/M9uOkIR1TAX6SFRHbPyxN+RoHnTVY/5OkeghvZpYw7Gd/hK
 RFHE4oQY7wyAGWKdXwo5AHAT9BHqvBZyhkvU12yQ/SUstuY4IrKd+krb970Na7V0wKF0
 8Buw==
X-Gm-Message-State: AOAM530xfokZCES619uQWsAy69NULnHwDaEiFb10fsIDRrqkpI6OuFAC
 s3K5PdYDX9ChsUDBgAR+WR+8LydkdelQiVZW+HxRnbQCtZ+Cf4Ytt8tzT1+A0rXNCPQ5FHG136C
 WNXy896Hda60hy+85YOtZqnpW9LguOrF19BeXbcCEV6LxifF/Sg==
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr2757875wrv.653.1647501609566; 
 Thu, 17 Mar 2022 00:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHbCVoeUsHyZ8wNSet5MR49AAhKrHaURXBuhyPImzMsALzcMVNd+fUfq5fTlEsXD2dGW/xxQ==
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr2757858wrv.653.1647501609413; 
 Thu, 17 Mar 2022 00:20:09 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 p4-20020a05600c358400b00389f61bce7csm5108647wmq.32.2022.03.17.00.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 00:20:08 -0700 (PDT)
Message-ID: <e4c85b2d-8546-1740-9f83-d4cf985949d1@canonical.com>
Date: Thu, 17 Mar 2022 08:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V9 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 jassisinghbrar@gmail.com, fparent@baylibre.com, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220317051831.7107-1-rex-bc.chen@mediatek.com>
 <20220317051831.7107-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220317051831.7107-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_002018_519025_929CE999 
X-CRM114-Status: GOOD (  10.19  )
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

On 17/03/2022 06:18, Rex-BC Chen wrote:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
