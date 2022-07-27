Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EF7C19F2B
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 16:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUIs7DBnCsR9cP62lpQKrDWjtHiCWXhqawFuOwvIork=; b=2UxcT6fSAPmsfRxHa9Ml+jVf0E
	1dMV6Jeql4RbKjK7Ld/doLqYJA3YxVjDRIPCitKPR4He4f81tNJoWnqSbMrS4AVGevDK49E2yeJnW
	6PVDsct6WD0TkZU5pFSW+Vqu+ymTIKzT1ezyhZTbnIU40ZqF2X+Sl4GWKa4Orwkpu9nWd/a6qriQL
	/NW8uzkwc16gNXj4Tmxl1LjaeM/TRe9rCZQqoFa8l5WHuPnGfISHi5hViR1ShFDg6yZWbUuWqORvc
	VNwENpjHywAtqtIWcjdEI9q725kz99qUpZ9Vazyxk7CTV8zemauJTEmlcnJYVqxPPJ2Kp/cpPWtyy
	oQ9wN3zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGjTI-00FJ3S-PC; Wed, 27 Jul 2022 16:01:16 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGjT1-00FIvx-LS; Wed, 27 Jul 2022 16:01:00 +0000
Received: by mail-io1-f43.google.com with SMTP id 125so13867152iou.6;
        Wed, 27 Jul 2022 09:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kUIs7DBnCsR9cP62lpQKrDWjtHiCWXhqawFuOwvIork=;
        b=2lg52sl6iM++7En0aMYCdjouBhEoDOij6jlbyQO/1+68KZkvmZk6madWq0zgZOPvNI
         Uj191xWztfeXcpEfHyT4yaV1kD6pFOYkh5OfaVeQzW0An53c8mOl5/kNDmMokWPNWsaa
         vZH5ztja/mZOkyi9T+IxgIdEXQlFpZumRL1S/W5g1k5D2ommiixhBm4nFGgnMZ/UaYRi
         Ivhu1UAKBSVtPVVABps2oMqfq0yuQ9Du/9g3yLsT4e3nK6XqZdTBtUTyfgYCc3epHO1Z
         AK2j6OAsj8FM8JflNMQKlA5kOiHJ73L7myjRYkAy4EgRNYFCfiehXxi/jW9x8g3RyWX7
         B0Wg==
X-Gm-Message-State: AJIora+KBqGePZXkyXu4A3GmNzn1j4HqMQzH6cks7DofpgimDnKpvDPa
	AL2U6MIeoDlhH0ub9fm63Q==
X-Google-Smtp-Source: AGRyM1sWxuWqBZ+/pnkqKc4dOYIKgmM7u9Z/u1EpfWc5rboGgsQ69l5hTpQ6oZfVbOxSBQsTzRwDwQ==
X-Received: by 2002:a05:6638:d15:b0:341:610d:5472 with SMTP id q21-20020a0566380d1500b00341610d5472mr9165526jaj.188.1658937658422;
        Wed, 27 Jul 2022 09:00:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b8-20020a920b08000000b002dc06989d86sm7017921ilf.52.2022.07.27.09.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 09:00:58 -0700 (PDT)
Received: (nullmailer pid 2755041 invoked by uid 1000);
	Wed, 27 Jul 2022 16:00:55 -0000
Date: Wed, 27 Jul 2022 10:00:55 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, George Sun <george.sun@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, linux-kernel@vger.kernel.org, Nicolas Dufresne <nicolas@ndufresne.ca>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>
Subject: Re: [PATCH v2, 1/3] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8188
Message-ID: <20220727160055.GA2755004-robh@kernel.org>
References: <20220727023721.31945-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727023721.31945-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_090059_722517_572025C3 
X-CRM114-Status: GOOD (  10.13  )
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

On Wed, 27 Jul 2022 10:37:19 +0800, Yunfei Dong wrote:
> Add decoder document in dt-bindings yaml file for mt8188 platform.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

