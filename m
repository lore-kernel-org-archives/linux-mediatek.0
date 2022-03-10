Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4D0C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6rJ4UDaMRYi/RvG3HFrjN6bt15LQNH4Ov/IpS0f6H0=; b=FHU2YSri9koKYn
	MNilOqYExPCk+rqjpiwUUCuebTYffgA5eXPhAspzi0M1WGYxMrC9TU1xOcg4AX4xy8BBDd7IxdtOn
	9YY9z9+kH1Q8NSNjip83HG+IJWj8qtxpV9uXLjpjnv5jDFTZ59zrwcO27xSLaDYXYvlmyn5BJTDfP
	/fKwfd9DyvLDDpKpIDG3USKlMi42tc3TSPUOjZuO0phW+V/1ByVMLKFl4hpi6lK2RMz6+L54YkDvp
	7jwepEhNk+W9yaEUjAwvUae6/y3D+jtrI5GgApyQzQgVShbTwi9c3vc8gEc2RhZy9iuOEQc1rJa6o
	6vSKktIUYY5rJFfrfsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSSKX-00EK75-DT; Thu, 10 Mar 2022 23:36:25 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSSKI-00EK1z-1Z; Thu, 10 Mar 2022 23:36:12 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 x26-20020a4a621a000000b00320d7d4af22so8707897ooc.4; 
 Thu, 10 Mar 2022 15:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PN2mbzwXUHAto8HEAzTj4rJG8ZQQNjc7Bn/bempRCVw=;
 b=7ka6dru1DwIczm5lPdiktlW9Stsa56GO/XU3YjR2NMnPpVTXxtJrweve6Rm9i9kq5X
 7jwL+OeLhb1TVk8Dxh07sVDPplvJo79kRQDTysE1po1kMpEtyQPuW2eT1l5yUDpfcvGC
 GnNMlf85z4cRQ1/Bd+dtVawlgCtgf8idwbD36rnQ3YlJD/G8RVQHc0MpSEk8izL0RCPx
 ByFy05j9pMNLogvrXc2LUi592MJaMJizE19RTJhbDF3aMN/jADRkVXTQCfmLNrNFsvgF
 +YCN3PZGHlYDi340DcFVDPVZrKIIatai8YPq5bQ3sp8oLVSRc8AnScA5bYk4OB2n65GH
 amKQ==
X-Gm-Message-State: AOAM530DjYhBGCt3dDElQMDRMxm6Gx+WUbsVB3uonpbQ2N39fO1IAifl
 vDeb56zjQCmxI3nGD18Ijg==
X-Google-Smtp-Source: ABdhPJy3WyBuiJCTvq7ROLUbeX9qqGYkbaV0JeTVbnxhQPBonkoYgM8I+g7Jc0luE+fcUw2ZTX8vyQ==
X-Received: by 2002:a05:6871:7a8:b0:c5:a1b3:43eb with SMTP id
 o40-20020a05687107a800b000c5a1b343ebmr4189847oap.103.1646955368603; 
 Thu, 10 Mar 2022 15:36:08 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 36-20020a9d0ba7000000b005ad59f1f783sm3112902oth.3.2022.03.10.15.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 15:36:08 -0800 (PST)
Received: (nullmailer pid 2331942 invoked by uid 1000);
 Thu, 10 Mar 2022 23:36:06 -0000
Date: Thu, 10 Mar 2022 17:36:06 -0600
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: aaronyu@google.com, tzungbi@google.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 trevor.wu@mediatek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linmq006@gmail.com, broonie@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org
Subject: Re: [v2 1/2] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 for using rt1015p and rt5682
Message-ID: <YiqLZiRO4K4fbSNt@robh.at.kernel.org>
References: <20220310153707.29722-1-jiaxin.yu@mediatek.com>
 <20220310153707.29722-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220310153707.29722-2-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_153610_125107_AE5D22CB 
X-CRM114-Status: UNSURE (   9.58  )
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

On Thu, 10 Mar 2022 23:37:06 +0800, Jiaxin Yu wrote:
> Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machines
> with rt1015p and rt5682s.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
