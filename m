Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD67C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 17:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5FaEIShu0HZd44DzCqaf2oP0IbymxRrKYuI1TYAWF5w=; b=wVDKYVp59HX1aD
	JOzNP2geOz0q5Qutb+61rLqzgAN3gHuCvZaNNRt+OqPckjlgLOM03YEs0WbRJIfgcXLDaK2S9+Qee
	iAszZHwQXIrPL2W0cE3m3EYKVj1qx1giAfv4sD6I6fdtNInsfAcXWABAiFfriJKJ/bKhoxUmjwhr3
	P3TVjMpwwmj9byRQc77hLznOqemQ5+z7jq0H4Nf1p2EaON3uOQvrlOFKJyl7PvstqmdJxwG6jCOji
	ha6DNabh/PUokD5flAYFVzVolL1FmLNB9EVLvNQ50/RyfNCPHSdjuqF1XvhkmPEdnu5xV4uKfVtke
	NWS69Ie0U/3LXryfeTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4V4-00EN8B-6B; Wed, 23 Mar 2022 17:10:22 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4Ul-00EN4D-Jw; Wed, 23 Mar 2022 17:10:04 +0000
Received: by mail-oi1-f178.google.com with SMTP id w127so2254437oig.10;
 Wed, 23 Mar 2022 10:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7hKrd5H7B7WvqIMdiaPvuwOv1aT0mWRSH/OSMprLgR4=;
 b=FEc3vSHipyecaVgkYLmzAOb0H9EM4zzfUQBV/Pr8+/1fiJLyoO1uNrFIYRyd6x3Xwd
 cSRpZFdK3thWwq96/on0quOjOeuN9DGuEprEEXvltJAmEdfIrcVg9hqbm1se0FR7lrMg
 XaPqgWPuQumP7gKWIkHbOigeqma5hDTMKnk6ZZDIY8teyIkZdXLOe3sHUNbspJLhU22c
 B4cMWffZAK6bINQWJ7F8YlbORoX/BHKP9zbEsNv3jCxb+0BiP2JDvk+BXxngnkBoOiAE
 ShuGx4DpGcVP1+CEd+ofBalDziCS9tszieg5TeNFoSgzkc3/nrbAkB96vB2FzT0eiItn
 3Zlg==
X-Gm-Message-State: AOAM533ngc1zFi2WLc9Y7uPfFwgKBM5CEGivKq+G9KNaguLwJrCSxpDf
 cVxoU8xlG2+E9BgKVPaCNw==
X-Google-Smtp-Source: ABdhPJx8jPlgF405kvPPYl2lYEG107noZH9leUHMGog8OncHx0ZtDujB9+uS/h2L5Tca9Pa2VoBzyg==
X-Received: by 2002:a54:400c:0:b0:2ef:8951:a271 with SMTP id
 x12-20020a54400c000000b002ef8951a271mr535618oie.267.1648055401409; 
 Wed, 23 Mar 2022 10:10:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 11-20020a05687013cb00b000dd9b5dd71csm184164oat.56.2022.03.23.10.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:10:00 -0700 (PDT)
Received: (nullmailer pid 94890 invoked by uid 1000);
 Wed, 23 Mar 2022 17:09:59 -0000
Date: Wed, 23 Mar 2022 12:09:59 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: aaronyu@google.com, trevor.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, broonie@kernel.org, tzungbi@google.com,
 devicetree@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 matthias.bgg@gmail.com, julianbraha@gmail.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [v3 02/19] dt-bindings: mediatek: mt6358: add new compatible for
 using mt6366
Message-ID: <YjtUZ0gbt/KZ4WKH@robh.at.kernel.org>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220313151023.21229-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_101003_709676_32C479B3 
X-CRM114-Status: UNSURE (   8.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 13 Mar 2022 23:10:06 +0800, Jiaxin Yu wrote:
> Add new compatible string "mediatek,mt6366-sound" for using mt6366.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/sound/mt6358.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
