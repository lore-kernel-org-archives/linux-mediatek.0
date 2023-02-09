Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B1AC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 17:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSXbtWoaGGp/BTK6eNZyW7mgvCIslW3pWGgTjKzsKzo=; b=uR5+y9szGSYRec1Tss/RUMB4jG
	q6ODELVzNR+xQ4BKYajNPFSWq1vm3lOd4wN44u/l8GvQY44RNWGiR6K50d+Ctjo08iKt35882rdpX
	pw+nKPVyMKsVLU1cprAtHYcQDPZ7ymjBl90XqOlHMtifbkVp77o1zsP1814W6f1309CjaaYZLHfbL
	zGyUjweNXye1V343u6oL6l5pTRZU+opsUBGPt4n3oRuCNmFrz/Urd7rUBbBGgBCwL9uiLlp7TdqyL
	ze1ABZcNfe4E6js3xl/TomnK6UCFE1c2eqbkaGtc1NJAbAxyNvM1tWdk4aT6Pcyt5TuOJcSY2qBS2
	4qJ7s5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQB0b-002cbe-K1; Thu, 09 Feb 2023 17:46:57 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQB0Q-002cWg-BL; Thu, 09 Feb 2023 17:46:47 +0000
Received: by mail-oo1-f50.google.com with SMTP id w3-20020a4aa443000000b0051ac1e0f6b7so274751ool.11;
        Thu, 09 Feb 2023 09:46:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSXbtWoaGGp/BTK6eNZyW7mgvCIslW3pWGgTjKzsKzo=;
        b=lHWN8JQtuoi5Buh2fUEAszuJJOvKJGAYt+MRszbRWOyVC6hrrFaTErPoasN+7VgWnL
         TVr2Gjd/qspqN9djMk7RjSHE95hoPBviGjhHvsUJtAZJaM/DkIz49UUoJTf0qxeQkQCi
         ShQdTzlOPh9SL06kvjGuS2OZ+myTADktv6eSgyuiKIYpK7qLw44qkLAC5ZWV51eHCNRy
         cED+lhYKtBVTPRtSwgBzgVE+7ERkrOJzFKBqRK8yfoCwBpWWEWXcHC5CJfM+RuTxJeCL
         03iOuYuxcpnrbmcBMyL+Yom80+0psxZ/20nAEZm8bYyu9aHOwG242XJ1WLGFBDlekWg1
         GzTA==
X-Gm-Message-State: AO0yUKUnAzM/BRQS/eH9xiSPOeEx9Dm72YXTs7b7Uogf53s2j/2mYsJD
	WABEOGyOzG8Aah0tPQNTDA==
X-Google-Smtp-Source: AK7set/eXd6Yae5b5DJrkNsNG5JrvEE5wM9N1+YnsOlzDB7xG37bnt0BvLI1Wk6P5udfi3frUiEWpg==
X-Received: by 2002:a4a:a34a:0:b0:51a:c9a:ee78 with SMTP id u10-20020a4aa34a000000b0051a0c9aee78mr1295818ool.1.1675964805065;
        Thu, 09 Feb 2023 09:46:45 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p6-20020a4aac06000000b004f241603c49sm990419oon.20.2023.02.09.09.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 09:46:44 -0800 (PST)
Received: (nullmailer pid 557296 invoked by uid 1000);
	Thu, 09 Feb 2023 17:46:44 -0000
Date: Thu, 9 Feb 2023 11:46:44 -0600
From: Rob Herring <robh@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 01/16] dt-binding: mediatek: correct MDP3 node with
 generic names
Message-ID: <167596480328.557242.18288362631745115908.robh@kernel.org>
References: <20230208092209.19472-1-moudy.ho@mediatek.com>
 <20230208092209.19472-2-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208092209.19472-2-moudy.ho@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_094646_407730_5A738E0A 
X-CRM114-Status: GOOD (  10.22  )
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


On Wed, 08 Feb 2023 17:21:54 +0800, Moudy Ho wrote:
> The DMA-related nodes RDMA/WROT in MDP3 should be changed to generic names.
> In addition, fix improper space indent in example.
> 
> Fixes: 4ad7b39623ab ("media: dt-binding: mediatek: add bindings for MediaTek MDP3 components")
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 29 +++++++++++--------
>  .../bindings/media/mediatek,mdp3-wrot.yaml    | 23 +++++++++------
>  2 files changed, 31 insertions(+), 21 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


