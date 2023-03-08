Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A253C678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCrHtGbmJCKv3Di23qj+w9uSiDFBod+4MdcND44gbng=; b=0ZgKkR5tFb3xhB3f8QAU1a+kJ0
	tlIZzrfHInZwADfQetsZIxk4bsq1Br3Iz5DuRjZRp3XvBTFfU0oFUqo4icJcFGPktmaalYkPE4h7K
	i8KL309f75i2S66CoB8N52/8TOXFKltPlkAV7Vr+CpyEB/41YypwZzhMaEbHFMdrGVySi0pRKkxU7
	XaPmtpoja873YT/LKxSe8KqP6uu6ISKSUBx+Ktkhy0DeoiF7qGCMgZqoqUIxJQjLfwKJRNcuiHouN
	ADTwsAeVG25MA5Upeb4RTtCO4C9ExSeF8fZvCN9GGtAq7uMCASsP/SJNl3wci7douymEid3pAMgd0
	mZBAPIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa0yP-006lBs-VC; Wed, 08 Mar 2023 21:05:21 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa0yM-006lBB-GK; Wed, 08 Mar 2023 21:05:19 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1755e639b65so147498fac.3;
        Wed, 08 Mar 2023 13:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678309516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCrHtGbmJCKv3Di23qj+w9uSiDFBod+4MdcND44gbng=;
        b=SqrcwexfBVauV1kGvMVwgRbfwhDZwbhhV3KDGjZLRqxKkHSuHzks7r4mzs2b43w8iE
         Y5CStiKFtAJn0PjarT/ZpEwFnwKzmIYaaQnQMI8orDyohxkocnucOKqLRNPzhq1jUu9B
         Dl7UZ1zidgsw4cTO9MVG0fZYDFE79ayIjFuTpc7qE2jOlT4NmdJeCp/+X5EtUCgWhkJb
         vSRgtxLD99HjOE+k01rg5/XFT/fcpN391R/2oSAamK/zbpLC2/sxrv9UzClZg0sdIx18
         KyaFhjnSElFp6WCjdGauthXy3JvRThlLxLeaAj0czu+yvVjrK4Lk2C26sAiXwqAAtbbG
         bUvw==
X-Gm-Message-State: AO0yUKXDHUqRLV3YL6ubCIe4lzVG3PCKbowwN4Rcm2CJX21Ae9jCwPjC
	Y4j1RbT5m2dnyxrt7TYBERBuDek+8w==
X-Google-Smtp-Source: AK7set9/Ps1tTPEfBQh/bjTrnc2rNh9JcYy+t7gr1R/PqVzEvdsMO3AYJF6+ULl5+lHY9pOzR7oudA==
X-Received: by 2002:a05:6870:7011:b0:172:21eb:1c2d with SMTP id u17-20020a056870701100b0017221eb1c2dmr13152517oae.31.1678309516054;
        Wed, 08 Mar 2023 13:05:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n15-20020a4a848f000000b004f9cd1e42d3sm6490077oog.26.2023.03.08.13.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:05:15 -0800 (PST)
Received: (nullmailer pid 3796950 invoked by uid 1000);
	Wed, 08 Mar 2023 21:05:14 -0000
Date: Wed, 8 Mar 2023 15:05:14 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 09/20] dt-bindings: pinctrl: ralink: {mt7620,mt7621}:
 rename to mediatek
Message-ID: <20230308210514.GA3767521-robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-10-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303002850.51858-10-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_130518_565774_115CB7D0 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 03, 2023 at 03:28:38AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> This platform from Ralink was acquired by MediaTek in 2011. Then, MediaTek
> introduced these SoCs which utilise this platform. Rename the schemas to
> mediatek to address the incorrect naming.

I said we don't do renames due to acquistions, you said that wasn't the 
reason, but then that's your reasoning here.

To give you another example, *new* i.MX things are still called 
'fsl,imx...' and it has been how many years since merging with NXP?

Rob

