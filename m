Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122A6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 22:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvdTkDTD4sj8bWVGQetV76cBFWfCOzJwfH1ITvigwvA=; b=iDjr0OmYKaS3m0W7RyOAEOfTDX
	i0Y0pbBIuXNipPRFeh3JhO9Twx6EetXed4lCYIcYfTqaFDguE3VaOV4UQQs/BBZWLJA4SH5wyoKnl
	/4TrP+1O71kBlD4W3gW++ndBxQPxp/+qO/0j3R1ilY0TsFta7zOydDuMJawVqp4Tutb3FFXLxweeK
	io3ZKG5HQHvHKHMFTyGdEvLj8oxvPYrb9MkGoN5N2c8NTtSn2opX4Uw0JE6uUY3RtJd9NmSlNXxoc
	ahbAJR74MtrkiSbatPL+Izee2hggDesaL9poTYfnVchR7MWro8KBxjr9Nc/Qu7mrV4664zea+1M97
	67b46xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6e9-003JDE-To; Mon, 25 Jul 2022 22:33:53 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6dy-003J6n-3f; Mon, 25 Jul 2022 22:33:43 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-10d8880d055so16593432fac.8;
        Mon, 25 Jul 2022 15:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gvdTkDTD4sj8bWVGQetV76cBFWfCOzJwfH1ITvigwvA=;
        b=IVrwYcFQf/h3skAB2n7lx4cPw6RzFT8hOO/0vO+hRcxnkCu5eQCZYZELew4cZyLKqp
         A/ZEEvFOhAkL7kSjpV2UnDlNCWDMfhzhhGVMzdFA5EJ9QCBOAUCyv5o768HQl+apBQ0I
         uFOhn5RL/oZuQko9OHb8q6Z2bgtl+4QsWA24AN+yYiWi925em3dsFGIkFOtct9/urI9i
         xiMKzYUCS+GAEbPCCg5NJtc+Zcib9jh9EyXyXKky81qXPXFIAoVxHk9lmgvQjt4L7gu7
         nE12Hp/nTzKA8TnbFlrv1R70spg7pCx58yPEPe9pc03nbS0b+eWvtaH/6LIxAFB4MOKU
         rZhA==
X-Gm-Message-State: AJIora9/nitiuIbxRejO/oWJouhZa7s9mMXN4GwZsc+vT4diRupnPLtt
	Ae+PobC8HbERu78kplVlsg==
X-Google-Smtp-Source: AGRyM1tbsj9fm4f4/WGyJF9cPn1HRWe2ZRYNwHIHsRQgWeBpDUjhfCL2Lghhl6Ya6tUPbsw0GxZWVg==
X-Received: by 2002:a05:6870:e30e:b0:10d:c6b4:6396 with SMTP id z14-20020a056870e30e00b0010dc6b46396mr7738252oad.128.1658788418892;
        Mon, 25 Jul 2022 15:33:38 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c17-20020a9d67d1000000b00618fa37308csm5438157otn.35.2022.07.25.15.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:33:38 -0700 (PDT)
Received: (nullmailer pid 2867756 invoked by uid 1000);
	Mon, 25 Jul 2022 22:33:36 -0000
Date: Mon, 25 Jul 2022 16:33:36 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, nfraprado@collabora.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: mediatek: watchdog: Fix compatible
 fallbacks and example
Message-ID: <20220725223336.GA2867714-robh@kernel.org>
References: <20220721014845.19044-1-allen-kh.cheng@mediatek.com>
 <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_153342_164179_2087C40F 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, 21 Jul 2022 09:48:42 +0800, Allen-KH Cheng wrote:
> The watchdog timer of mt8186. mt8195 and mt7986 have their DT data.
> We should not use 'mediatek,mt6589-wdt' as fallback.
> 
> For mediatek,wdt example of mt8183, We remove mediatek,mt6589-wdt fallback.
> 
> Fixes:a45b408a020b("dt-bindings: watchdog: Add compatible for MediaTek MT8186")
> Fixes:b326f2c85f3d("dt-bindings: watchdog: Add compatible for Mediatek MT8195")
> Fixes:41e73feb1024("dt-bindings: watchdog: Add compatible for Mediatek MT7986")
> Fixes:f43f97a0fc0e("dt-bindings: mediatek: mt8183: Add #reset-cells")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

