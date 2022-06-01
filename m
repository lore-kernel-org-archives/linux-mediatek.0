Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3C3C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 20:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBft1RMaO36dT56rgI3cqw986pHigfBzspTeJXBN3Ng=; b=EKbU4Pt9OhC7Id
	W1191NWFqcstHWzWbMZOu2jhcw1sqEgscyGONdq8juvaDrxUA3G0yamxWXUQSQSK354AdUmkgPpgm
	/4au8OAviYm2OoAFPsVmZ6VEoIidWODf/5X7KnSNIow3+k99aXjAU0pXr8oKk7G6DcDQjnOMC/yNw
	nxuMVXqYnP0S/+gXpcBJa402ejvgj4mm1sngmsMzA7lMLio/4BGbKGWRAFScL9/rX5twgNuKjJi9m
	RIsto6k1WBV70unUW//7Ner27B8tzPimOS1R4LcrWXzYAS+Rhn5y0CM5Qcbvg52ioZrtC6TCEfb5U
	DsAziRt2/dCocHCtfeKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUZa-000EsY-0b; Wed, 01 Jun 2022 20:04:06 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwUZN-000Eo7-K3; Wed, 01 Jun 2022 20:03:54 +0000
Received: by mail-ot1-f46.google.com with SMTP id r3-20020a9d5cc3000000b0060ae1789875so1981614oti.13;
        Wed, 01 Jun 2022 13:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yJYEOamuUI8+hGxefhFmvlXiUIoxuSnHZm1hsc1vWFY=;
        b=MgToNTXp+76NgL83KdVpOya7zoPjtRcNgIzWDhKp9fYYlVaQwtZp7KJmIXcfxXx6ZX
         4/62PA6zZwEJzDR/0IJLrNUXakhUeKrjVIzhvVPgt7sIubvhLR6aC1OZGdduAsonXwP+
         oFbcs+oerO2wRBkKzlO2RS6arQ+cumaJ9Sih76C6Esnws8BR0mHlXMEy6BaaLvPC6Jj8
         61hzqfPtmzHc6O6bpnPYehN2wn/X8YbhJDN4AKgJ9Z7QlZ6Du/CLiRKMlp8ZaueMIVKi
         WIgyXIc0q0qIwDx+zrFCOPUHtZ2YeBeAiSUFL4u6Vsf9xPFbSVpgTzoKJ8AcBLnhN5jM
         ocDg==
X-Gm-Message-State: AOAM533xAszWPHuu0AA2b+kd2XZkKRBKbh3IEcYtwzkKqA6UMbV33waz
	7UiW8rZeq/N9duZ5SHL1HA==
X-Google-Smtp-Source: ABdhPJxaah9NBd3MkGoro16iedv6h3Eq2gaNVukZrkbQHdoOU5IuH/kCtMA2VHhv966s8GbqSpJkug==
X-Received: by 2002:a9d:12f6:0:b0:60a:e98d:cc7c with SMTP id g109-20020a9d12f6000000b0060ae98dcc7cmr653579otg.18.1654113831593;
        Wed, 01 Jun 2022 13:03:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 12-20020aca120c000000b00325cda1ffa5sm1290278ois.36.2022.06.01.13.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 13:03:51 -0700 (PDT)
Received: (nullmailer pid 342702 invoked by uid 1000);
	Wed, 01 Jun 2022 20:03:50 -0000
Date: Wed, 1 Jun 2022 15:03:50 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org, phone-devel@vger.kernel.org, devicetree@vger.kernel.org, martin.botka@somainline.org, tglx@linutronix.de, paul.bouchara@somainline.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, ~postmarketos/upstreaming@lists.sr.ht, daniel.lezcano@linaro.org, linux-mediatek@lists.infradead.org, marijn.suijten@somainline.org
Subject: Re: [PATCH v3 1/2] dt-bindings: timer: mediatek: Add CPUX System
 Timer and MT6795 compatible
Message-ID: <20220601200350.GA342663-robh@kernel.org>
References: <20220518112435.241116-1-angelogioacchino.delregno@collabora.com>
 <20220518112435.241116-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518112435.241116-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_130353_712554_C53D643C 
X-CRM114-Status: GOOD (  10.10  )
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

On Wed, 18 May 2022 13:24:34 +0200, AngeloGioacchino Del Regno wrote:
> Document the "CPUXGPT" CPU General Purpose Timer, used as ARM/ARM64
> System Timer on MediaTek platforms and add the MT6795 compatible for it.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/timer/mediatek,mtk-timer.txt          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
