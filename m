Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE27C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tW6JjqCexHeLV3FDA1aQzJRveyrnhDHI571GK+lzR5Y=; b=sYPzG/Z6BxQftq
	yca4KJVXNqfWwMMvMOK2BiMLWjRF3sXHQoRriXwQt2+xqFgEEmwozGIhAd6pVL1EAcAjM1VRbOVPU
	w1X0JjxhLcnBLn40NXkfo86k79WxbrUr+Op5g0z2DUpzG8lyria9OzdCCYfZf8Q27ONY4wB/IOvFt
	Eg+GJnLFcGmdZaP1lIo3cbjqf73mR/NUnpnxZi459FafatrLXv9Ajl2hG0Oeu9fl5/K+SbqxB+Srb
	LoEtbaRNltlgacAijv/+g0DYC6JG6kqwtiZj153oAinStHj+ud0bmXgAxgJE3/LmGz9BKNEKFvJ0i
	UWRV6SHSeP9mX4nF4V1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdUc-005vdV-Du; Fri, 25 Feb 2022 16:30:54 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdUE-005vUr-7z; Fri, 25 Feb 2022 16:30:31 +0000
Received: by mail-oo1-f50.google.com with SMTP id
 y15-20020a4a650f000000b0031c19e9fe9dso6791772ooc.12; 
 Fri, 25 Feb 2022 08:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1wkrFjytm/bfyZ688DRYD5WIyjqQECAVw3q7pHsvHsw=;
 b=Cs7TGBvA5Wf/iP67nKoQCuKYAuAmMYYoeEJO/H67xXd9bXdDR1hZH73I0KeKT9bAgy
 +zHta0xvS/l4RcI1gLBDNjRoiUiytV0ppkIw7vn/RZkw9QFVoSwGkThTN9IWKt8FMSE/
 paWdKuN8F2P39eFwhmkn8J9KRjo/1wI3rKkyyFH/MR3mRcQ3jc37HlELPyQC1D/m1psr
 /HZxvE0lo0ZNemdgnWPEn6UJUWkcFvYF4szbg1FHHu7J7i0CKDOXU7qVAZAJpZPnXTmU
 rQPcSmtsGi7pozpH9zgzHSYhF289m6iGTd5birrZ3GlkjJ4oH2Yr3R72ddvUIPNfM0BU
 iswA==
X-Gm-Message-State: AOAM533lJ6p8qTziYxBjalRWSb2cnodtLjkdvVZUnsy6aCvEOqWOt/Wq
 L3VqHgQfmIbrn9A9v8R4ZQ==
X-Google-Smtp-Source: ABdhPJxHnQhONryFwpvuU3O9cL+TRRiq/RY06mE2+ZgOVfuaaBUkDTiEOsd6KQFZQO00sR87pj5RBQ==
X-Received: by 2002:a05:6870:a552:b0:b5:6c53:b96b with SMTP id
 p18-20020a056870a55200b000b56c53b96bmr1705102oal.124.1645806629409; 
 Fri, 25 Feb 2022 08:30:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 l20-20020a056820031400b0031cf5913126sm1241648ooe.36.2022.02.25.08.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:30:28 -0800 (PST)
Received: (nullmailer pid 1045540 invoked by uid 1000);
 Fri, 25 Feb 2022 16:30:26 -0000
Date: Fri, 25 Feb 2022 10:30:26 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Fritz Koenig <frkoenig@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Alexandre Courbot <acourbot@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Irui Wang <irui.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 srv_heupstream@mediatek.com, George Sun <george.sun@mediatek.com>, 
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org, 
 Tomasz Figa <tfiga@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3, 1/7] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for lat soc
Message-ID: <YhkEIr/Jlky+5CZY@robh.at.kernel.org>
References: <20220217075758.11369-1-yunfei.dong@mediatek.com>
 <20220217075758.11369-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217075758.11369-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_083030_316219_EFCE7C57 
X-CRM114-Status: UNSURE (   9.86  )
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

On Thu, 17 Feb 2022 15:57:52 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for compatible "mediatek,mtk-vcodec-lat-soc".
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek,vcodec-subdev-decoder.yaml | 51 +++++++++++++------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
