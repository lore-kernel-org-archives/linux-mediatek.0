Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C10FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 01:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4SP9tpB8u3kO1isPZGwTrWYPcWf3bbtp4MuB8QQ8s0=; b=r5LdYtN2Iq1ngT
	Ztop+G9i2Xs0NWrAyKLU2f0hoEyQCkjwgw3r87v5bs8j6bhqAFOrZO4w2V82WSp/E3XAW6J4mAvlK
	+iIXuYN3gYclYH+xo+5js3+vTD7Gcn/5aHCH4RxjXCbTLRzE3YF+j0NtRHtAkJuesfkRvbfgkf69r
	cWsrC/1ttKnKTS2llfq2KmpC26aa4oXL2uzp0mBupqRq8m3lKs7gKM3Pr6TDtcXVDjYV8Xib+Ye6a
	eJ6mhR0WtFg0ttCF/sxDkf2zOPMfoF5itPjMof09O4TB80+AuQHGkcOkG0jc4HNPwD/erNDm3BPmR
	QpP2UTDQ5A9BtV8OPOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXYpE-000p7K-TD; Fri, 25 Mar 2022 01:33:12 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXYp3-000p6Q-If; Fri, 25 Mar 2022 01:33:03 +0000
Received: by mail-oi1-f170.google.com with SMTP id v75so6772727oie.1;
 Thu, 24 Mar 2022 18:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NoOzwpyI1Ds0dVyme/fVuHLFCjknM/Qs7UeN2WmSfX4=;
 b=pZ8GQsgnNqMKGE3auj1IBqr3NRykpmNkOSv9N4zgQW1UFqmEDb4PPU+tteEGQkwH1d
 AyrapDv+gQACsuwpV7IIVe5RydOWBM0/LXL8CSh0HJCXbXMUN5U6Z/6zGPvy48jwkU6o
 nLHFuC2iZikmIqNZfBaoRoKsXo4c8VwG/zrfHj99r6CIsemR+/Y2xCk2z/Q5hjEO8Bz4
 Zt38qaeKA00/GoPw1Uw0Sv6XEFFs2nGK5XiK4H27B1KCSXQdB6w5HQQ7f/7kXjDMLSqV
 YS4uIwVkEmhDgbKy5e4rKPbJ1CpR9V5u6Dh/sH4d5O+xfcnDFPLAzInrZajAVl+Scm9R
 86PA==
X-Gm-Message-State: AOAM533YZBm44efjjo0NeD8Wcvp1C2tv8JbimE8c7WnHwXgsAP7aOjCX
 9E/J1sse1UeEUq209wymOA==
X-Google-Smtp-Source: ABdhPJwE5Pa4e88ba6g42QV2RJNfidI9/etVdqKq0RQlgzPN/XyPBceq2bvtCosS4jT+Pyn5feZyMw==
X-Received: by 2002:a05:6808:188a:b0:2da:5026:3663 with SMTP id
 bi10-20020a056808188a00b002da50263663mr4076928oib.79.1648171979571; 
 Thu, 24 Mar 2022 18:32:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w8-20020aca3008000000b002ef7e3ad3b8sm2089430oiw.29.2022.03.24.18.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 18:32:58 -0700 (PDT)
Received: (nullmailer pid 2946043 invoked by uid 1000);
 Fri, 25 Mar 2022 01:32:57 -0000
Date: Thu, 24 Mar 2022 20:32:57 -0500
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-kernel@vger.kernel.org,
 macpaul.lin@mediatek.com, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH net-next] dt-bindings: net: snps,dwmac: modify available
 values of PBL
Message-ID: <Yj0byY2NZ6gQ5CBw@robh.at.kernel.org>
References: <20220324012112.7016-1-biao.huang@mediatek.com>
 <20220324012112.7016-2-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324012112.7016-2-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_183301_634971_33D543F3 
X-CRM114-Status: GOOD (  11.30  )
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

On Thu, 24 Mar 2022 09:21:12 +0800, Biao Huang wrote:
> PBL can be any of the following values: 1, 2, 4, 8, 16 or 32
> according to the datasheet, so modify available values of PBL in
> snps,dwmac.yaml.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
