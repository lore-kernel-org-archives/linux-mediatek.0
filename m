Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE89C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ROWfJQEi2AARMGI87YbtJ6GuVIyt5dfxWoQvxSEaHY=; b=w//sEpTdIrBjHe
	sU1E4bIA5epozyezlL8R1u6u2Qciv5FoBhVTf/KBzfiVPAycnt2nDo0ofP8tNh4sOoJl2LzbzH7On
	zp7AAF8zKLuDBAppWPhPB93svhP7hY05yAQdXp4OZubGIJLitJJ8cNK1vJCghlVpCr7Yid06ZTECa
	iNfvKO2ZEuxGdz9OQd9yf6BW+en2JZvB4YF05CfMbiE8A7wo0Sd6cP3mBnxUDR+3jhGHkLnh2Vss3
	VpALox5F9785FQx0U7RAYbhn/CImnfInecEEQkE7X2YJJ2lb2AnbNSWCrBBSriQH5mJzHpXsTMWzq
	yP5DYYrLFQ1SKASZSz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nShXu-00HCiu-C4; Fri, 11 Mar 2022 15:51:14 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nShXb-00HCZ2-Us; Fri, 11 Mar 2022 15:50:57 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so10915192ooa.10; 
 Fri, 11 Mar 2022 07:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YxoZwXk5JXeLrOiq7bY7pTDwkNHArk5BUIDnHUOp3fI=;
 b=QPmCVwKjnbVINZ5qDU8oiy32CsEd55viw80NC5oJUor0NBoS3szCInV2Le29DdR4Zx
 0RXOWf8XV5tVmtkP8rcje4CLWOlWckA/W5bwsvBrb3p6HmerZRkGPo9ebAd5pDOVo43I
 vMrxh1/5bmGpCULZ9CBmQty3S5zON37hwozANxlx+OPUMAF17NBj2/xK0Yh+x8KtJKgH
 +FERhZOQGXcEtgNf405kX1i/C/sennXa4LdcvusUU7Cmh/GAKX8CcxFnzKAab2xDLFxg
 QnkC9XwYZweFXHSecurhGuO/kM/eKgGoN3S7Ctvg4tkslTkh3w7Kz1bL1bsJRWx+5nTX
 Q9lg==
X-Gm-Message-State: AOAM5327iZFmiQNv8mtB8YYwvhE5POjqTz/rTaHGJISQnUhCVKw+BSm4
 Ug9mixngWgKGqAL11m8y9w==
X-Google-Smtp-Source: ABdhPJwTNhTLkhpo9jtKQvQYWXEtv5T34b0UK/llvnOM7PooDJmEUR4392gY6ZLXZe41uYkJ8Pb+sQ==
X-Received: by 2002:a05:6870:4149:b0:da:5e34:9448 with SMTP id
 r9-20020a056870414900b000da5e349448mr11505061oad.112.1647013855095; 
 Fri, 11 Mar 2022 07:50:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n11-20020a9d710b000000b005af4ceeaac1sm3727274otj.37.2022.03.11.07.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 07:50:54 -0800 (PST)
Received: (nullmailer pid 3867362 invoked by uid 1000);
 Fri, 11 Mar 2022 15:50:52 -0000
Date: Fri, 11 Mar 2022 09:50:52 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: hsinyi@chromium.org, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: timer: Add compatible for Mediatek
 MT8186
Message-ID: <Yitv3IUpCzp1/eGX@robh.at.kernel.org>
References: <20220311130732.22706-1-allen-kh.cheng@mediatek.com>
 <20220311130732.22706-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311130732.22706-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_075056_014742_04269EDD 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, 11 Mar 2022 21:07:29 +0800, Allen-KH Cheng wrote:
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
