Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB1FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vrfrx7uaZBn1tjIniUqWBs522/wJIZca1ekXZTwNMDY=; b=dLVxSV7nsxsNQ3
	Wqv+MVQRffoWt4h7EReR5O55BH5jUdXY5yUUqyquRLZTr68LIUZOgH/vELR9F+8nBYr9SZOz5jvvE
	p+MsCt5ynzWarc8QINTTDjnKYVAUSr5dEaAUSDdavDw1U+D5ysgsVE3UJqjWjk97t4SoBp5Oe+P++
	iJwpcSkbQO4IRZWGflCKWcJlLJq2rHKa8LVhgvsIINoI46qGrZp9jCiCVegvsVHL3OYZb3w0DNaE7
	VqkSYNyHGsyCR2OzqYRpopLfXDsMxi2bwM0hYHYWDq2jMB/5vNCXgul2XFIarZCrIozEUmrESjJPy
	3b6RjXqT80WMDGcJukrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdQo-005uT8-OK; Fri, 25 Feb 2022 16:26:58 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdQV-005uLw-VE; Fri, 25 Feb 2022 16:26:41 +0000
Received: by mail-oo1-f53.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so6862838ooi.2; 
 Fri, 25 Feb 2022 08:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X+JqfUsqraXHT66jiXxwdmiSs8aXoZzc7qj34oZ5zw0=;
 b=v7bSjDRih3IRFywaCqDpH2x0iWRNoDtdbvBgeBOogx8I47dq718A7vxF3i6uVq1hUp
 MCRZKT+DtI0RRWhQluM8R4aiCMeoMje/tnXXC0K6fMuNM4UKWC4DAqoYXm+9ywR7tvvO
 lSNRdYUBo8ivAdbGBixlDXSvREy2/RCoPYtGVXh9yfTRsM2Vq3NRzCIshLQ0TidXPSRL
 Ex7Q2vsfnifubBTZazRBBXp7anW+p/5ZUXmmagmkNv1QS2A7JW5hPvo5JCm6eC+TBaz/
 upSXJ0Ddu//LSED7AmBS4LKUrSiOnS3vTOUBMzKZ41EKhA/Mcv/b/zVqMXrGwxj1nogi
 oDNw==
X-Gm-Message-State: AOAM530TSKYlF6hQhpX+ud0XqNKDZRdwB6ntfM2PF43gnWj/4k0cCIF/
 ULFJscl4dw/fra6rZOE5+w==
X-Google-Smtp-Source: ABdhPJw/vcrFI/CjF4cimyIVyp6KlPE/kC0dGCY0QDWKVaSEMQmUHALL39y0AM6WyQ4p/4kwWTKUHQ==
X-Received: by 2002:a05:6870:88b:b0:d6:eac9:56d9 with SMTP id
 fx11-20020a056870088b00b000d6eac956d9mr1000147oab.56.1645806399005; 
 Fri, 25 Feb 2022 08:26:39 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 f8-20020a4ab648000000b0031d1cf9aef6sm789502ooo.48.2022.02.25.08.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:26:38 -0800 (PST)
Received: (nullmailer pid 1039466 invoked by uid 1000);
 Fri, 25 Feb 2022 16:26:37 -0000
Date: Fri, 25 Feb 2022 10:26:37 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, runyang.chen@mediatek.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [3/4] dt-bindings: reset: mt8186: add DSI reset bit for MMSYS
Message-ID: <YhkDPe3KuaRW6b2Y@robh.at.kernel.org>
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
 <20220216014505.28428-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216014505.28428-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_082640_044127_47390244 
X-CRM114-Status: GOOD (  15.01  )
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

On Wed, Feb 16, 2022 at 09:45:04AM +0800, Rex-BC Chen wrote:
> Add DSI software reset bit which is controlled by MMSYS for MT8186.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8186-resets.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mt8186-resets.h b/include/dt-bindings/reset/mt8186-resets.h
> index 36e5764e2e6c..5f850370c42c 100644
> --- a/include/dt-bindings/reset/mt8186-resets.h
> +++ b/include/dt-bindings/reset/mt8186-resets.h
> @@ -30,4 +30,7 @@
>  #define MT8186_TOPRGU_IMG2_SW_RST				22
>  #define MT8186_TOPRGU_SW_RST_NUM				23
>  
> +/* MMSYS resets */
> +#define MT8186_MMSYS_SW0_RST_B_DISP_DSI0			19

This can just be squashed into the previous patch.

> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8186 */
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
