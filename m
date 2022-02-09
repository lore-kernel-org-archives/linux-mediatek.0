Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4013EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 20:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwgdJrQsEM++D6XbUZYJRSFut5WzNMp09XysHy5GAPo=; b=Xkm4VMR1Z39Loh
	h/kfqi8kXEu58q/jkNu9zNKfrqjE2PHzOrPdOQHKouwBEphnccQjiJqmzf1F6Z5FXc2C6x4GzCOhU
	+iPyTt83DTWHfPHxJwRkoWAox6KVuzRNFwTKu0h47NsalIIH5thjbmGVePzG8Ae3SSFbODc6/LjMh
	VvGitm0HSdGCXRnIiNRTnqoI+M3N+NxYgBzz096g6N9v/c4wrsi8Z5dfYogeiKgR2C8hyKpCrO3rh
	dIEHAVI5AIR1ZyM4EWhIuGYCAxtHFgzGYIKFQNlmgzIakHq6r0aeESBj5WeM94rxb04RK98nHOhIl
	sdk688x4w0QHWLreSRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHtpx-001cL9-4z; Wed, 09 Feb 2022 20:45:13 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHtpu-001cKj-Vt; Wed, 09 Feb 2022 20:45:12 +0000
Received: by mail-oo1-f51.google.com with SMTP id
 p190-20020a4a2fc7000000b0031820de484aso3868328oop.9; 
 Wed, 09 Feb 2022 12:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E6SXQI7BZ89wLWfBrUoQLVzH2X91u9h16GeWEE3Mi8M=;
 b=PFy4+X69zw+vWBvQCW7mmpkP1+0UbCCBhlaWrCtmSpC/8bdGsZGqoJkAnPcF5PQg5w
 wSH6ZL6wC3DXBZdJa6knJdX+A/wilxqi+5BRMtsSLXMqh0p/24cl0uea7cwJD5eZ4AdH
 K+7DLf68hEU8esbZ8tA9Ys6IvWhgy9KG0q1ePYZHthfvy+t7Ety2c8LPjRRvjqXabQOY
 RQY0mJI3wBzz3caMklSGodghuWOtszwbhDWjC2BsfntIhCK6udpgvRM0e5b8RByGvkqm
 5x7BC8lsM7NIStBou5/IoruIZG/iT/brhrVtleADhhJxwtjSpz1diwDcVBuNjaWpVhQ7
 tWVQ==
X-Gm-Message-State: AOAM530dXPCkeiHZoRCF4dAMMrPqBmod6zLaWIpfdu+dkfAFz7mYn2w8
 Kje2jJbhy/EQwZtnNeDGoA==
X-Google-Smtp-Source: ABdhPJy4AH9g61BJTuGzr3+4csdYvHWDckGJ/vzpMmnXYpOaTzvQOyhxZiJysr/kfvlf541SyS4xjA==
X-Received: by 2002:a05:6870:a583:: with SMTP id
 c3mr1477653oam.197.1644439510352; 
 Wed, 09 Feb 2022 12:45:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n47sm6957783ota.74.2022.02.09.12.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:45:09 -0800 (PST)
Received: (nullmailer pid 875372 invoked by uid 1000);
 Wed, 09 Feb 2022 20:45:08 -0000
Date: Wed, 9 Feb 2022 14:45:08 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: mtk-xhci: add support ip-sleep
 for mt8195
Message-ID: <YgQn1IXiHdTw0r19@robh.at.kernel.org>
References: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128062902.26273-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_124511_065564_20D3FCF7 
X-CRM114-Status: GOOD (  11.83  )
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

On Fri, 28 Jan 2022 14:28:59 +0800, Chunfeng Yun wrote:
> There are 4 USB controllers on MT8195, each controller's wakeup control is
> different, add some specific versions for them.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v2:
>   1. fix typo 'specific' suggested by Rob
>   2. add acked-by AngeloGioacchino
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
