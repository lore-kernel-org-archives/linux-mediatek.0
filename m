Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01194C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 23:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKDSIE2VT64xwxWu/wUBN47oKXd1j9u7+B9S2uSxM4I=; b=WawvQNB83UYVwM
	OYjWvYga+PdpSZZ7C8DLRDe2Anb0UmVoz/3CHs8qTV9Q3RG3n4VTrFhb7+yl9iQTj4TYICXQd2mLW
	KJQOeVb/bZc7tAznFRM6x4CHkGjZVnyrAV1UhhG9sj3KIFMqwY6cZau2KDoAn5S8VGQJgE/4M/srt
	DzJdPr8NU6btRMwH52M2tITCDbg520ZbsBICDE1awh2cNWp6T91aXaB0dQNlRbVvPr7zBvYcEbySM
	mXN7kNgBDqOcQr0R1w+F8H/NQ/av+4eNNr6y4dZejn4Z80RgMk7a0I9tztOET2SfDUML+FhYsxIkB
	7HvvbrMQsUA4As7zeaQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nem0f-0031wL-0p; Wed, 13 Apr 2022 23:02:49 +0000
Received: from mail-oa1-f53.google.com ([209.85.160.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nem0b-0031tm-Rw; Wed, 13 Apr 2022 23:02:47 +0000
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-e2afb80550so3613699fac.1; 
 Wed, 13 Apr 2022 16:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dGLCCj51MkIzf2vXEtRhMBdKTU97nBZt+VOtgE9+Gtk=;
 b=g1vmDK4axl58tqIX1ZAeQiMoF4pmUzc1/FmL08cOFxpTRSBO2hFoA0YXY205QZPkj9
 xDhzVpmhurGVJwsbREnHqNlra71M+5QQ7i/fWMGw3X51eVJvBOG2OFdjgXzICIk6TxiI
 YXH+GJkGPXOnGih9qczXpmwXt6mEKOvWXrrBPgGpj4e4aWxxyWdfDcXSjm647ntVfNzE
 mrs4HHoZxwnAcUn39i/DdlqKAc+q0ky7dVTjTH7D7Ze7ha2ynsLH1e4QLGYFX+jLSy1E
 yORJosMRQA6MzJPxDEFO2rd7aBcENVaD2RcPApwMqpoLkh1UMiNVqYD6Tm/Gar+y/0hR
 F5lw==
X-Gm-Message-State: AOAM533CRAzq5YhyKLUNTPVDkiJW+SBzmuoe2JxO7WZ2i+GX73qJJ5+O
 4jo115+qLVwxWJ0YKDsTDg==
X-Google-Smtp-Source: ABdhPJxs7Cpn96X2RQDhvRVBftdBJgNx8HGYgvUvc3HyiqWruHo7eL1oBmK4BQowGjBrYomgw4HTDg==
X-Received: by 2002:a05:6870:e893:b0:e2:ecbc:e581 with SMTP id
 q19-20020a056870e89300b000e2ecbce581mr189032oan.193.1649890964457; 
 Wed, 13 Apr 2022 16:02:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k22-20020a056870959600b000d277c48d18sm194761oao.3.2022.04.13.16.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 16:02:44 -0700 (PDT)
Received: (nullmailer pid 4101311 invoked by uid 1000);
 Wed, 13 Apr 2022 23:02:43 -0000
Date: Wed, 13 Apr 2022 18:02:43 -0500
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: p.zabel@pengutronix.de, airlied@linux.ie, yongqiang.niu@mediatek.com,
 nancy.lin@mediatek.com, krzk+dt@kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, jason-jh.lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, allen-kh.cheng@mediatek.com,
 chunkuang.hu@kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/3] dt-bindings: display: mediatek: Update disp_aal
 binding for MT8192 and MT8195
Message-ID: <YldWk9eTLbXBcbX+@robh.at.kernel.org>
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-4-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411035843.19847-4-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_160245_939034_0EDE9D99 
X-CRM114-Status: GOOD (  10.16  )
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

On Mon, 11 Apr 2022 11:58:43 +0800, Rex-BC Chen wrote:
> Disp_aal of MT8192 and MT8195 are fully compatible with disp_aal of
> MT8183. Therefore, we move the them to item "mediatek,mt8183-disp-aal".
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
