Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CD2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uelgrE8EauQdIXh/ylKCz6RPW7Tc7gGEKRvt53RHVTM=; b=CvZfYipIJt41bK
	me7NMDs/ojMVcH9jyo7Jfu6/U+VM8oWXYvoiLewjtrQNOvUjfPie65bOkiaZJmbTAjuyKs54lYNvG
	l5wBc5uWQW9R2WdvwrjYByyMnwlK0UHq1Y0/CNsL8jUphm3vJL2pfRnEbFEcd7E7caLOmOnNh81Kg
	IoUzkoZj6/669OJZi6aGSuoNG5N7rcybngLnRkQta46mk2F1X0ghk8egVLggvAYGwWfiL445vaAdB
	QxHHDfgu1/wTBeO8XM+4lcyfG/hoPKc3JV/YEAyKeWmJFpm7N7+vkFdrz9pdPe4p/5k0ptL8J8bTk
	9iJmn8WW+dQxrv0Xtplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk5Bb-007Uvx-PM; Thu, 28 Apr 2022 14:32:03 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk5BY-007Usu-Hb; Thu, 28 Apr 2022 14:32:01 +0000
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-d39f741ba0so5293162fac.13; 
 Thu, 28 Apr 2022 07:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EFB95ppsemYVokN3gYO95lpxo39WR8kyQdqON1ZHZnQ=;
 b=olvn4cYYHb7A3euI+M5S4TiAAHNPj4RW7+6gfgxA4TIb8Oxdfdt5t9A7CHfe7/orFT
 dylSbrpmRPtphL0XfjjgoWnaVcb/vmbIJO+K9vyN4JFThXyK008dSUiS5kSTdW7r+s57
 52s5Tvii6EINl2DlLkuRdjU3rPqXPIOz+xflUifjp9rE6/sk5bPjE7xb9DpgQ9ex5+mp
 GjFLJMJsTuTfllzU41S9kPMSBm669meLyEbJF4rhZXVDNtlEVrrZFqY/LIeY7uULy1UE
 ntwS2qQF2uVVO4hIi78wznxOat28L98FTFl4r3cMXq0xSfdvlR+7NZumHSX+LaYvIf34
 qsYA==
X-Gm-Message-State: AOAM531d/91ga06DhYSWz4Ik/tj13rOQbt8PJ4UJRMf/4U1AqgxoRFDu
 L53Dgz5xxz6xL3iUMMBA4w==
X-Google-Smtp-Source: ABdhPJw235998b030Ovpn3X4h/3URvpBnssiViFzusdjem+i4RpxdZR+j/0DQd7KDFfgjXtOmKRTVA==
X-Received: by 2002:a05:6871:809:b0:e9:1bc3:9c5c with SMTP id
 q9-20020a056871080900b000e91bc39c5cmr11214584oap.289.1651156318117; 
 Thu, 28 Apr 2022 07:31:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o64-20020acad743000000b002ef3b249b9esm63207oig.58.2022.04.28.07.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:31:57 -0700 (PDT)
Received: (nullmailer pid 2185535 invoked by uid 1000);
 Thu, 28 Apr 2022 14:31:56 -0000
Date: Thu, 28 Apr 2022 09:31:56 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, angelogioacchino.delregno@collabora.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [v4 18/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-rt1019-rt5682s document
Message-ID: <YmqlXNGAQLKb5LLO@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-19-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428093355.16172-19-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_073200_597100_38166334 
X-CRM114-Status: UNSURE (   9.17  )
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

On Thu, Apr 28, 2022 at 05:33:55PM +0800, Jiaxin Yu wrote:
> Add document for mt8186 board with mt6366, rt1019 and rt5682s.

Same comments apply to this patch too.

> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
