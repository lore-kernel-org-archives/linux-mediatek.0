Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D37C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:57:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 029F3613E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 029F3613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XZmJU+hok4uDX+7RVSNvgxy8sK65DbjBsPlewwwmtc=; b=MgYs5leyPo4IZe
	G59DlNCLHjBZvzyMsfHJyTu8vOCuFneH4OE078t6ElKrOHIWwI0xbHgcdIkBO8NsGlE/rqWdllxeQ
	YiWFyoye8L3oxD8u073wH4G/twyS4t5ruWbaHc0bzpZA190z3ZafsP1KSdKLIE4+0pvxHCmk5vkjV
	VYp5zzV7wU6QGjylrDF0MKVRuelkWLyQAqblLOYJUfirZG4GZ3rX9kfqSlO2OyL6X+nyQ7kpufPK4
	vPKqV+iw7y3J8sITuNgSOdNKQHchahfDbrvKXVNBrHGlxOJXTcowUTg+Fq9iJmjwPBzSQT/CDHOXu
	1LqZC4fb1x5mO4Ekkukg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4S53-0050g0-8X; Fri, 16 Jul 2021 17:56:57 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4S4n-0050a1-Vp; Fri, 16 Jul 2021 17:56:43 +0000
Received: by mail-io1-f42.google.com with SMTP id k11so11591593ioa.5;
 Fri, 16 Jul 2021 10:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kzjyBdk5+GE+lOrmE+ZJKGUST/qKGtHK5D4OJgw36OM=;
 b=cgjWaPIQVMCK723MM5w2BGBA4fehdnIcWIm04WLuJv4dSYciLRdPN2mLabA0ZJKaB8
 3xy3oR28z0P2Gw/7pmV+df7l1VBITbAzE9783B32KoeBCkusrPR3GPQ+I519jnW8bEjE
 tLvvhz7e1rGeVaQNnKK9c627XlsuG6qM+abgUI0Ffa5hI0cAYZ4/Azm+38jc5k/9uQ5y
 LZsakbL/tQ94GsvnU1B1UPTaCiWTn6BRn1MlH9/9txLsBKFcIQggUD/55+zBvcwJ4izA
 wM+Ph+FA147/+5ie9B0VEqxncUhaIEVp0H8hh0VKlhgPNKsQDzPW3LYLGOOQnHGQ0PmV
 yc7Q==
X-Gm-Message-State: AOAM530u/aweWZipHeU6Bl93PtuN0ZTnN20KNInSeBONFZ/EPwzplyvQ
 8U/4w+5AxrVV2HlPsHwQFQ==
X-Google-Smtp-Source: ABdhPJwb98hD16OtNkCJhXnRWD9ELz1QV/5BYG2cg+o0CJ25J2YF0h0pA0OxISNIzfbnHx2Bn+EU0Q==
X-Received: by 2002:a6b:b2d7:: with SMTP id b206mr8292605iof.155.1626458201175; 
 Fri, 16 Jul 2021 10:56:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r6sm5627844ioh.27.2021.07.16.10.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 10:56:40 -0700 (PDT)
Received: (nullmailer pid 3677111 invoked by uid 1000);
 Fri, 16 Jul 2021 17:56:37 -0000
Date: Fri, 16 Jul 2021 11:56:37 -0600
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 drinkcat@chromium.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com, chunkuang.hu@kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, hsinyi@chromium.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 eizan@chromium.org, jitao.shi@mediatek.com
Subject: Re: [PATCH v2 4/7] arm64: dts: mt8173: Add the mmsys reset bit to
 reset the dsi0
Message-ID: <20210716175637.GA3677053@robh.at.kernel.org>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
 <20210714121116.v2.4.I7bd7d9a8da5e2894711b700a1127e6902a2b2f1d@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210714121116.v2.4.I7bd7d9a8da5e2894711b700a1127e6902a2b2f1d@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_105642_073162_7BCF1F53 
X-CRM114-Status: GOOD (  11.81  )
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

On Wed, 14 Jul 2021 12:11:38 +0200, Enric Balletbo i Serra wrote:
> Reset the DSI hardware is needed to prevent different settings between
> the bootloader and the kernel.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> (no changes since v1)
> 
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi  | 2 ++
>  include/dt-bindings/reset/mt8173-resets.h | 2 ++
>  2 files changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
