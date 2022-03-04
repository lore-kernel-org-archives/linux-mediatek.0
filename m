Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF862C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 15:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LXAtWVUb8EE9J2arI/hdJPW0byEPIh74hKk9YbcdEM=; b=b1FEnuDmEzzPYV
	Pfm/2r5PnPssA+ToLBVCr+YMuh39a68739m6KIt+gCG80l0YVKsgaOT4LrJLozXC//YUrvprF+87p
	FoRqXdtqUJPPYDthyanl4917iD2nrSbhlhYRM19ZgyqQp3hHqkfkCjzwkSnND9ogJ9VyhHyfATyAz
	EgbhCZsOLAZnqdj/o3ThBj1cAR82RBvzueYd6buPg6uffq3T3OFtrhRcRkMSPJsgsK/dLROCuy69e
	c0zy6SeDfcY9nDhLTO9kKMSzJLm8BACvfejryYVjIoYcqXfraKUIKiHSldWdDXwSDyXzz+lTCT1Dt
	ha2/616O+eXbdT2NnjEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQA4Q-00AoiS-JU; Fri, 04 Mar 2022 15:42:18 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ9zt-00Alhf-7P; Fri, 04 Mar 2022 15:37:44 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 j3-20020a9d7683000000b005aeed94f4e9so7732453otl.6; 
 Fri, 04 Mar 2022 07:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=r+7LdT2y9uXyeXQDCwlxps28MTYEq5fDPijsqcJwyto=;
 b=b/Jb9E5Ni3MeGOuB9cMoJdj+j93ZQBgtDultodAZHWwq7XPc+CwDbx7NlGZ3RqgLIz
 Pa1ieLdlX3LmLBKw4+PnYJUZUaytVmjNSjQJsB7+tItplPzTZF0wWE+pb8zy9idGtrLm
 pJ6JjFi9jf/DaaE3o0yQQjG4XhmEMGxMEe/OmtPVllb0z7SdXlkmEAma/fCQ0QtFHCX0
 ZqDMdLwGA4NDPlAEx2eEhNO5uPSP1ipn+NN/C4hRJcA62hEEP94QmfUSgeTnMPiklbKB
 h58W8mVA/rD0ifnOkBQwpDbGKs/GXAw0wxLyaiDp0ZUUm4a7X7gimjvv1BI9NQVCxNSb
 burw==
X-Gm-Message-State: AOAM532U4wEX2+ZL+KzHef91UM+kCPo2HJRZ1w2izORHFZ+/kjMbREBX
 GaCjz7+Nmu/S5A8QEcbrhw==
X-Google-Smtp-Source: ABdhPJyS8IcggXZIQLqNgBK43mnyO4KB0rLd++CNegRmXhAPHh2bGQ7UVv06ZazIdvDbkatuCV33kw==
X-Received: by 2002:a05:6830:33cf:b0:5af:4018:fc2a with SMTP id
 q15-20020a05683033cf00b005af4018fc2amr22847666ott.161.1646408255646; 
 Fri, 04 Mar 2022 07:37:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056830054d00b005a3cce351a1sm2577422otb.28.2022.03.04.07.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:37:34 -0800 (PST)
Received: (nullmailer pid 3984240 invoked by uid 1000);
 Fri, 04 Mar 2022 15:37:33 -0000
Date: Fri, 4 Mar 2022 09:37:33 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, matthias.bgg@gmail.com, alexandre.torgue@foss.st.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 jitao.shi@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, p.zabel@pengutronix.de,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 chunkuang.hu@kernel.org, krzysztof.kozlowski@canonical.com,
 devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com
Subject: Re: [PATCH 2/3] dt-bindings: display: mediatek,ovl: Fix 'iommu'
 required property typo
Message-ID: <YiIyPUGsH5bxapMS@robh.at.kernel.org>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_073737_327724_E1AA5AC5 
X-CRM114-Status: GOOD (  10.02  )
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

On Fri, 04 Mar 2022 10:54:57 +0100, AngeloGioacchino Del Regno wrote:
> The property is called 'iommus' and not 'iommu'. Fix this typo.
> 
> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
