Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E4FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRkd+w4xO/p7iDOeBl/Lutq4dXklS0xpcKWq4MXi50U=; b=WEHHj9nWlBaF4+
	3dOakIJFo64MzfIIPCHTsWviRK+WZqwj2cKZldSMNo2DGKnczkBtlc83W3cNY5y7JGoJhqBMgsF/h
	wL/DFHBoBMysEYHDdU1lnMaBnB8lXGCV8pyqMXNPy2OkbwJHVzeM61qbIIhaV8IdDbe4Cg9SQKiXO
	2Dtg06mPSAhuYvD8CrXoZLrQ+Czo7U60yLplIs5My0bDUpTWD/Dzh49n+XQLdVnvLAWNP841U5s9U
	N9ZPWBefqPe5oQa0AbtNZHsiXKyTyNDgtLrcG52lT2vCt5wTUeyYuUWaYhrqxhaiQR6uog9q7Pt9t
	MeJ1eCziNj3O55oUbhAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxAKU-00EmtN-4u; Tue, 14 Dec 2021 16:07:02 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxAKQ-00Emrv-RZ; Tue, 14 Dec 2021 16:07:00 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so21339289otl.3; 
 Tue, 14 Dec 2021 08:06:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CWeglYX86Kh/jx6qsj0rbVo/zA4v+6dDtBcJ8ZfP9I8=;
 b=zCZEvktOWTCfimNqLWQ9mVwh/FtAn2LsunQiQn/XwRkpnbJrJQFoa1yg5aoBxnYvq5
 nN7iZWkoWOxXvNLdK75TxSevU6+ASEiRcPKFdm0zjdNr1H3IiQUv/HpEA2b4+ukt0qnw
 ZY657lmDb6e+HNjI8IMinl3ROURgz7VjoyBfS3gSI6yW3wXBWA+zIZbZbOaSoA5Uicdb
 TWHU55V1unHzI6H4DPHb4McB3c14DJ84hYd0/vFwamBzc2TWZvypEKCLcNaqoT2RdkOz
 L5bJR7UoW0XJhXnKZ8UhA45y6zdk9AoRoM5iodpR1OMaP3pEVuHyyFf3FWU9mV7dHxru
 nHtA==
X-Gm-Message-State: AOAM532FTwA4rJfcS3HWS2qpzi0EyQEJ46DhDThixUGuVI8Od46Ce5LE
 TZk+Pq7jnC3jzjKbfP4y6Q==
X-Google-Smtp-Source: ABdhPJzkIOmtEo5hn0+hMuoG7HvhDOIIqOzzWYSglSMtBtWvqRjpOAt28cIAYU9DiODBsaihaQ23kw==
X-Received: by 2002:a9d:5190:: with SMTP id y16mr5121669otg.364.1639498017370; 
 Tue, 14 Dec 2021 08:06:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j5sm48247oou.23.2021.12.14.08.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 08:06:56 -0800 (PST)
Received: (nullmailer pid 3472932 invoked by uid 1000);
 Tue, 14 Dec 2021 16:06:55 -0000
Date: Tue, 14 Dec 2021 10:06:55 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Fritz Koenig <frkoenig@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Tomasz Figa <tfiga@google.com>, devicetree@vger.kernel.org, 
 Steve Cho <stevecho@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v13, 15/19] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
Message-ID: <YbjBHwMXFwi/Sds4@robh.at.kernel.org>
References: <20211213084141.13363-1-yunfei.dong@mediatek.com>
 <20211213084141.13363-16-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211213084141.13363-16-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_080658_917437_D572B409 
X-CRM114-Status: GOOD (  10.75  )
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

On Mon, 13 Dec 2021 16:41:37 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> Fix comments from rob.
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 265 ++++++++++++++++++
>  1 file changed, 265 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
