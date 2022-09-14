Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C683C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFWM9xJDGT4Rok1gsNfMbL/VvApMW/v8QoJV95QdoOE=; b=X9/+eTVsLIB2HpmUVE7gpLp9n1
	dHRWF24O7DmJQRvWmZk8X/1cbt4+hs3Abprxt1c8rCa3a9TeXHuQlTvsS23pAt5/CTbtgWrQC50MP
	+RvYmXFBW+S8Xp/LptnEw77ypllMG5tgK+dhFr6kL+9jQpEyuTDlbHE9HQgqXlyvFNEEgpqAGDGqh
	cFfeEqcHq3E4KGAFpJnkNpsTblnL5OkE5ujTuWk0K5bgD6uZo7kcH2LqgwZws/LtV0p+N7Vb/Yf2T
	s73xfZeUJqRC/PONtW3MK4mONZ24Sf8zZoRgTI+I6+jOD+EmOmNgGg8Q02Wt23uS9fasQ61zNMhGU
	GFRucgrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTIA-00262h-7X; Wed, 14 Sep 2022 14:23:06 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTI7-0025uW-RC
	for linux-mediatek@lists.infradead.org; Wed, 14 Sep 2022 14:23:05 +0000
Received: by mail-ot1-f54.google.com with SMTP id ck2-20020a056830648200b0065603aef276so5004583otb.12
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Sep 2022 07:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=rFWM9xJDGT4Rok1gsNfMbL/VvApMW/v8QoJV95QdoOE=;
        b=q9Oeip2n1VDlePIYTSxoGk2TjAk+oYaXVirYRJ9BaxzH1/YpACQ1FQHnYj/H6mR8CG
         T4QstRIqMBVKQRKy5So+KPbTa16sKclwJ8nZp1NSrpDwn5Ky2idimFyCmpFW0BvLyueU
         4BtbPW4Q0MdKJjG/5cdwbALSJ54AqtdJx1mxfRelLiQsyUQknw37I2bhnTU1Z/IDcujy
         wA/WUViecrXgqe0N7mfknrXK7KpKKiB5cXh96qq7pCfmaMjUXfrNIKCkLLT1jbKOt2J+
         4V0ywjPDbWVh0yNjwHCrt4IiYrwOa5k1Kio5Ep0n5PamQPXk2/fbjquDzpAItz2yp2vj
         43yg==
X-Gm-Message-State: ACgBeo0rH1epDWe2uPaN+KfQKcHZYZBAlkwANYRwsDhMLDhVsmW4RKJB
	9gZIJdf1y8ZAnXDwmFaCjg==
X-Google-Smtp-Source: AA6agR5/Lw0KS2dspu14h4yOvBn3OtsrouCvmKRmWqehElS/IqQXm+K+23wFvn9TpuAw2tqKxhOjfQ==
X-Received: by 2002:a05:6830:1ca:b0:655:d22f:22a with SMTP id r10-20020a05683001ca00b00655d22f022amr7548293ota.326.1663165380380;
        Wed, 14 Sep 2022 07:23:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w15-20020a0568080d4f00b0032f0fd7e1f8sm6351804oik.39.2022.09.14.07.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:23:00 -0700 (PDT)
Received: (nullmailer pid 2148013 invoked by uid 1000);
	Wed, 14 Sep 2022 14:22:59 -0000
Date: Wed, 14 Sep 2022 09:22:59 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: lorenzo.bianconi@redhat.com, nbd@nbd.name, kuba@kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, netdev@vger.kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, davem@davemloft.net, pabeni@redhat.com, sujuan.chen@mediatek.com, daniel@makrotopia.org, sean.wang@mediatek.com, ryder.Lee@mediatek.com, Bo.Jiao@mediatek.com, evelyn.tsai@mediatek.com, edumazet@google.com, Mark-MC.Lee@mediatek.com
Subject: Re: [PATCH v2 net-next 02/11] dt-bindings: net: mediatek: add WED
 binding for MT7986 eth driver
Message-ID: <20220914142259.GA2147968-robh@kernel.org>
References: <cover.1663087836.git.lorenzo@kernel.org>
 <2d05849aa9fdb5d14897adc51fcd93ace27f610d.1663087836.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d05849aa9fdb5d14897adc51fcd93ace27f610d.1663087836.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_072303_912204_D0462686 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

On Tue, 13 Sep 2022 19:00:52 +0200, Lorenzo Bianconi wrote:
> Document the binding for the Wireless Ethernet Dispatch core on the
> MT7986 ethernet driver
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     |  1 +
>  .../mediatek/mediatek,mt7986-wed-pcie.yaml    | 43 +++++++++++++++++++
>  .../devicetree/bindings/net/mediatek,net.yaml | 27 ++++++++----
>  3 files changed, 62 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7986-wed-pcie.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

