Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FCAC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPfy7n9mR46wKjmJcvpks6EyOh4h2lRJORXTzVKTX8M=; b=P2pf7O/R0kc/ns
	n9Mj6zFQlHNRPcwYOlcTcQ+ZIxuys2dTq4YWUZZhf8vaTF7AH23W1FniD0PSc42hADtLYRmD5pcxq
	Jozdw5p42hVyoe19unsUiowiBafCo7tP0DQlgtp7YLbvhvJLiJ7/TDcB/HUbibsc8oCWKjR8KATH6
	qnaAgIryYLOb4XqDcclxfj6XAcTOwKPVXJSZ56EO/+2rKTo4fn5d+POFG2GwXihuy4fZSkzqHRXlM
	zJqUDkngZXGgv8thAp8tFOwUCwjzymFjWOtCq6AEsdV/4+3yviyJUk/OMaslirp+0SCXwTaw4nMSg
	z51e1rHZnpqutqfEGefA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHtiz-001b6s-2x; Wed, 09 Feb 2022 20:38:01 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHtih-001azJ-HJ; Wed, 09 Feb 2022 20:37:44 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so3828175ooo.13; 
 Wed, 09 Feb 2022 12:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9vvNKi/Wm0VLtELILJszjggawGQx7UYnFBx5UN6T3jA=;
 b=fxy2Ty8iiHnoPHTqKRW8FG0t4K0O4jJzEUzgNTWqUlyl/fGlYKMwXbylo7hEaSKfPT
 AFUGbWOGPzbOVbH68IBDSIl1mohpn6ZhjDN+ik5QoqDpFtq7yNYfp5kyq8OJU0XyT1v9
 zM6wgE8vtTYEI6kn+6X5s24Knxtq5XEwDro2nVk6YvIFUYvYKX/+4OmN6ELga4mgVTEb
 PzOsHoHiu3Fh8GP6H2TRdjtg1PP3DsqHMWo8Mj5rGe+02RptjECXtrWlPkmKZnP6dop0
 X/vjTLHCLYiKEEfbaj514MuYxvdr7hbSs/Sc4RjrSAtt2ArqJmDZ40N5WMKDXdLDzUOA
 oFzw==
X-Gm-Message-State: AOAM531yEjisWus6NLjq79MHCqIm+S+swjvoCzA4tPfqoQ8gYjgOa17g
 cYy2CJfHFZ8fgfWovKiMEg==
X-Google-Smtp-Source: ABdhPJzDNBwd/NZ7M3FaqezQTKEcdU8xCVOg4y//z9QAs0xMXOadIO7noGIod4pEwfE0Iw17L6nY9w==
X-Received: by 2002:a05:6870:c7ae:: with SMTP id
 dy46mr1533523oab.309.1644439062215; 
 Wed, 09 Feb 2022 12:37:42 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c32sm7310728otu.15.2022.02.09.12.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:37:41 -0800 (PST)
Received: (nullmailer pid 863156 invoked by uid 1000);
 Wed, 09 Feb 2022 20:37:40 -0000
Date: Wed, 9 Feb 2022 14:37:40 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, srv_heupstream@mediatek.com, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Tomasz Figa <tfiga@google.com>, devicetree@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-mediatek@lists.infradead.org, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, 
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 Irui Wang <irui.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Fritz Koenig <frkoenig@chromium.org>, 
 George Sun <george.sun@mediatek.com>, Tzung-Bi Shih <tzungbi@chromium.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2, 3/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8195
Message-ID: <YgQmFEhdM20Zr9NJ@robh.at.kernel.org>
References: <20220128035440.24533-1-yunfei.dong@mediatek.com>
 <20220128035440.24533-4-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128035440.24533-4-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_123743_604313_79807347 
X-CRM114-Status: GOOD (  10.11  )
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

On Fri, 28 Jan 2022 11:54:36 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8195.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
