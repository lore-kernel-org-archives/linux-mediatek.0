Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F62C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ydV/jxGkAonq8V6tVV/rYwMWOBDyQ4+vUqUvLNHZ6E=; b=11YZnJ3R8bNaVK
	m/MWMTkI3jeP6oHkhMiCsVMGKbg2wzbcQWBT6Yu/67AL8DZaGES+3UbBaadv+9+gCJbfYKXiTXpuz
	e0cKg5dt3MJ6MV348oIINPB1yRzcSL5Vr0uSnqiWDj0urvbQ0iXZ9IqjyTG8mGxWqJUM7P7NIXQbB
	hSsTP/sP36aDxHSTCrQ/xl2uX+Dlr0Se++Xf+ur0Z6Vmr0ORutUV+cF+yvGK9jWMNe7X9jUNGlju+
	QqhFnVYlE+8DMl5oB/q28Z5mMJyp0836znkFNtgwV+az4RYGWSSQTlzVF/XhvaAUIEgQ4+ofTiTMP
	eqxIw+E4G0LRs+gsMCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1non4l-0077cR-2Z; Wed, 11 May 2022 14:12:27 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1non4i-0077as-18; Wed, 11 May 2022 14:12:25 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-edf9ddb312so2937010fac.8; 
 Wed, 11 May 2022 07:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hVwIirk09yaLIn9W0AnvNQlwP2lkso9U6oZmurIZ4jo=;
 b=W6HuoWSEkumzWeRk44tSf6Dj0dfsgrSKLTmI2+os7RWEZw2dwW5y+r/RhEuzm6jDkL
 hjcfgEto5Ma6Gwl5FtAC4926HmlKPEQLZZttPW7nUL5466Kqdn+0AFlcjwxvjwzM+4zo
 5wO4HO8yEBhOZ5Mw5+HpU8wOZkfVCLXcjhlqhf6zx49Ldzg4P0rv5p2ZCbAduA65XCTL
 T4ZpMagxYifXM+o1OXu75HwVccLvSo2Ay+MmcSVJ1Nd/9m+9MDacNvqfgiwwCM45e0t9
 I9avbQvUAxb60PUN+HTEfmEuVsuzuDewZAKM6TZGkTjxnxyxLJe959S81EeHTcmQDLOG
 914w==
X-Gm-Message-State: AOAM530kcMkNQS+dQP+HuLuHnrZ9UNvB/L5u8suti1cuf8aIC1YC5F0U
 ut+D8OBtg9FTQ37BdTkkALjw3fnAWQ==
X-Google-Smtp-Source: ABdhPJxD+7w4jCYBXpntlQ05yu2K8ufID8l4SDZrOUeqpx/5VE6wlYHK5Le77K7bV0jyOCAjWZSOkw==
X-Received: by 2002:a05:6870:8888:b0:e9:a3eb:a52d with SMTP id
 m8-20020a056870888800b000e9a3eba52dmr2742881oam.181.1652278339038; 
 Wed, 11 May 2022 07:12:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bd28-20020a056870d79c00b000e686d1386fsm617236oab.9.2022.05.11.07.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:12:18 -0700 (PDT)
Received: (nullmailer pid 236095 invoked by uid 1000);
 Wed, 11 May 2022 14:12:17 -0000
Date: Wed, 11 May 2022 09:12:17 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: hsinyi@chromium.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 1/4] dt-bindings: timer: Add compatible for Mediatek
 MT8186
Message-ID: <20220511141217.GA236062-robh@kernel.org>
References: <20220510075233.5426-1-allen-kh.cheng@mediatek.com>
 <20220510075233.5426-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220510075233.5426-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_071224_098674_C9B00C49 
X-CRM114-Status: GOOD (  10.21  )
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

On Tue, 10 May 2022 15:52:30 +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This commit adds dt-binding documentation of timer for Mediatek MT8186 SoC
> Platform.
> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
