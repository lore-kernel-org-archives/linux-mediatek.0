Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE18C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41W5VzWd2BJ4pYM95Nv/iwTfFA10pa/oiekl8eXTFCE=; b=b2a/v+aTt/YMQWxdOyrRlJrjE7
	XP2LiSiJTmU40KPhGDuWgF0L3QI5RViM+LQ78yKu1vDb2wv5/ulxNPj5S9WRRNKBFyik9ifprGPUn
	FgBBqDVNEcXRgjPx0z4Uib8mcyJQMITdSXK9Xe9B0QZuiTn3uBbXYUFcJHK+slQnGxrw9mZRv31GH
	GdRkupOGQWcgYcK7D9c0ucqKOK7sstq5nOLdhn3V0a1UXwoyIo5woJ28k0M3j2axJG1NL39RtFHKh
	mlTxEL+JTGn9XJaOMyB5v51eP+hwLxQ0eumnAa8ZTlsoPS+TlzPeNCZab0XVP2zed3BW+T73mEZ8q
	nU10A9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4lo-009mE4-AC; Tue, 13 Sep 2022 12:12:04 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4ll-009lvB-QR
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 12:12:03 +0000
Received: by mail-ot1-f50.google.com with SMTP id d25-20020a9d72d9000000b00655d70a1aeaso4841741otk.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Sep 2022 05:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=41W5VzWd2BJ4pYM95Nv/iwTfFA10pa/oiekl8eXTFCE=;
        b=zXShDLWG0nPhFxnwYHKVJ2luyQxfQ/yI6Qi/4snVFcpPZzu0IxeT/0d6mIud5LFuiW
         FdXXD/ZAxhBVITg3Mf4b+E5k0ZToH2hnosewOzWjYMDRwYzWp+OFihkJpzOFCMuu+AGq
         vp82BNW6S2uCvTofbOni3647toILqzz7sOfeoNMGUTGnk65K47Q9UCSE3sYYqdD2qW5f
         /qe3u+VIdAb9vJvcP9lg8FfZWUxygrZR5bqCsdX67Yp4/M00Nh7gpiVnR+wTAILPYCIh
         8A2bDGuzZguEnY8gLrBplw2eP9igf41mZ7W+mq+ONqVthOnx3bVfza21Y/3JYGSincIU
         me4g==
X-Gm-Message-State: ACgBeo3q0gWohrAiWxUeftTbNy3rXBfAp3ccnW+srNKp9MiAafBbE6iF
	iFy+SnxW/GN7nC4d9sKYjQ==
X-Google-Smtp-Source: AA6agR5olqqnemXJKb4NVDNArMb8Qzu43Bm2sTV6dkFQdJgmVeomfNWX15dpS+Gj2nTgaj1HJbJcEA==
X-Received: by 2002:a9d:4592:0:b0:637:35cc:68e7 with SMTP id x18-20020a9d4592000000b0063735cc68e7mr12322595ote.355.1663071110513;
        Tue, 13 Sep 2022 05:11:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m189-20020aca58c6000000b003450abf4404sm5079304oib.21.2022.09.13.05.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:11:50 -0700 (PDT)
Received: (nullmailer pid 3413151 invoked by uid 1000);
	Tue, 13 Sep 2022 12:11:49 -0000
Date: Tue, 13 Sep 2022 07:11:49 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 02/12] dt-bindings: net: mediatek: add WED
 binding for MT7986 eth driver
Message-ID: <20220913121149.GB3397630-robh@kernel.org>
References: <cover.1662661555.git.lorenzo@kernel.org>
 <e8e2e1134fde632b7f6aaf9d96feab471385f84c.1662661555.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8e2e1134fde632b7f6aaf9d96feab471385f84c.1662661555.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_051201_876043_712C0C26 
X-CRM114-Status: GOOD (  13.13  )
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

On Thu, Sep 08, 2022 at 09:33:36PM +0200, Lorenzo Bianconi wrote:
> Document the binding for the Wireless Ethernet Dispatch core on the
> MT7986 ethernet driver
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index f5564ecddb62..0116f100ef19 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -238,6 +238,15 @@ allOf:
>            minItems: 2
>            maxItems: 2
>  
> +        mediatek,wed:
> +          $ref: /schemas/types.yaml#/definitions/phandle-array
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            maxItems: 1
> +          description:
> +            List of phandles to wireless ethernet dispatch nodes.

There's already a definition of this in the binding. Move it to the main 
section and put 'mediatek,wed: false' in if/then schemas for variants 
that don't have it.

Rob

