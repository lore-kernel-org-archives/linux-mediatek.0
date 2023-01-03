Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CFCC4708E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 22:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+Xe0vjRIB+tXNWYrD7r+kxJuDx4Qm4ZhI1U9RMGc6g=; b=1dh8Yc98emNwhylGu4wXDAGuFk
	HVH75LONrfA5PyXg+O9oD3fv5yYp41DELW6F/Ttiz4d/HF9qqNbtJy9bRTfdnfWEVmiXzu9hqrpGj
	pruOdtCZYdoep5xdLdgR+weDMOst3pZjdDJy4OIPMDcHC8Y+u72n9q1rDz+aVOkSh4Up+Thcz18HZ
	HGU4jqr3nrEazFtHOr0ti+pI4xIbj/sdsVBby8CHT29N5NXZZFyvDeE12ZnX9bpHt37PiSV48wICp
	OUBfNxevHHfEfC2WQUWhELxdkSUl+62gRZLh6DXKI5VVBnzgnTEmCYLP9z/sGH4ddzVU0ZIlk+HqJ
	cF9U9BhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCpjX-005PDY-NI; Tue, 03 Jan 2023 22:26:11 +0000
Received: from mail-il1-f179.google.com ([209.85.166.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCpix-005P5A-PM; Tue, 03 Jan 2023 22:25:37 +0000
Received: by mail-il1-f179.google.com with SMTP id z10so10464466ilq.8;
        Tue, 03 Jan 2023 14:25:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+Xe0vjRIB+tXNWYrD7r+kxJuDx4Qm4ZhI1U9RMGc6g=;
        b=Z0YUGu18yIWcINt+nV+0/5ea95U0fR4Ns3WjwHOD18J0XJ5lktW76H9CCb+TSG5LWz
         6z/kTD2JyoDIGd/lkFsLsT6VGJHS53zurJ+Nw2vuBNsCG1apsU79jL8UdZhz4rZpiGq8
         jd795Uj8EU/DZKiVfsj5sqFjwTYPcWTBwp6DdCt1ObyQMCnNF5/kAtiCFaiD8U87DNVy
         DO3HrQQ4O2bRj8mdM2iscb3nwUSHy9kdt3yWvF97I9e0eK/0pTgKOvw1crrW9gWa3LfX
         jyRrP559U+iXULiAkSvSlWdITOEk9KXllBINH+cp9RQaHpGZPJBUg3xJyJKddFeDQxPK
         mMmQ==
X-Gm-Message-State: AFqh2krE2qMc0xLsTaZ8Add3BXvYgVuTRKcn+Sh+Mxhx/T+FJ6bzJZDu
	mXcrhk8WBycJx1kIwzLZew==
X-Google-Smtp-Source: AMrXdXtnDeSVLLYObmQVFo0GZQVAk8nlVnFvvHtFCPyeXzbb0QNA46iGUJ7FoNUjhvOtZYYpIaXapg==
X-Received: by 2002:a05:6e02:214e:b0:302:db15:3981 with SMTP id d14-20020a056e02214e00b00302db153981mr38775478ilv.27.1672784734197;
        Tue, 03 Jan 2023 14:25:34 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id z22-20020a05663822b600b0038a382d84c5sm10567133jas.64.2023.01.03.14.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 14:25:33 -0800 (PST)
Received: (nullmailer pid 4158431 invoked by uid 1000);
	Tue, 03 Jan 2023 22:25:31 -0000
Date: Tue, 3 Jan 2023 16:25:31 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Marek Vasut <marex@denx.de>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	=?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Jakub Kicinski <kuba@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org, 
	George McCollister <george.mccollister@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Kurt Kanzenbach <kurt@linutronix.de>
Subject: Re: [PATCH v6 net-next 01/10] dt-bindings: dsa: sync with maintainers
Message-ID: <167278470815.4157827.15557237476346780909.robh@kernel.org>
References: <20230103051401.2265961-1-colin.foster@in-advantage.com>
 <20230103051401.2265961-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103051401.2265961-2-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_142535_877538_0319EB5F 
X-CRM114-Status: GOOD (  15.05  )
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


On Mon, 02 Jan 2023 21:13:52 -0800, Colin Foster wrote:
> The MAINTAINERS file has Andrew Lunn, Florian Fainelli, and Vladimir Oltean
> listed as the maintainers for generic dsa bindings. Update dsa.yaml and
> dsa-port.yaml accordingly.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
> 
> v5 -> v6
>   * No change
> 
> v5
>   * New patch
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa-port.yaml | 2 +-
>  Documentation/devicetree/bindings/net/dsa/dsa.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Rob Herring <robh@kernel.org>



