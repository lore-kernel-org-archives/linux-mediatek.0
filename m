Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA130C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbbhG0x/GmEMqsFPTNhHHd72R0EMBvUmg+t2tR9hUck=; b=QQsUO/TA6VXr1rscdfIJJIWmGC
	DEnojcmP8bBbaH9URFcvoooD5cbSWFSxD37kleeLYKuzMJahXWgU6H7jGiUCNDbx8f/jKqCYHVMo+
	yqHF4xHimntNKbWB3Ji1zT+l7JIBtw6rEVk9FE0hUNMAjG7oYNojLMWCjshYgPVSjjMsBDQTgwN+L
	kryiLZhOkUEGXuiKXJhovXhDl5FNqvTjIxw4OzRPPRw+6smzy19eh+fcSb7sqPZXXv3VnpDkcpkQp
	ZvJIqeU7NxVZTuayR83EoDo7DvRDUFzEjOJnAl77IuvwZlqrGWCP/dwUiY8q7E9ZGPx4aDbqipKKD
	dkaFUOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6Qi-0038IM-Gm; Mon, 25 Jul 2022 22:20:00 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6Qf-0038Gc-N1; Mon, 25 Jul 2022 22:19:58 +0000
Received: by mail-oi1-f174.google.com with SMTP id n133so5012501oib.0;
        Mon, 25 Jul 2022 15:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HbbhG0x/GmEMqsFPTNhHHd72R0EMBvUmg+t2tR9hUck=;
        b=cPpLa+5tWIpvYHMRAZn82KHPOAV+FuA7WBpCMF2nfoJ5rz/0B629E5wZLXwlrl4XWg
         NhkvhNaxx6/MtbLZ6cERO0wZ7V8zOqWnA0nTmVDz+7eS7yJjUgZ3daDWagMu6DydmuJ2
         EsaBegQT+n44EogZ886e8G9dlPrxzO5kZUI1QShgNKGEUTnh3V5TnUYWToODvh08DpCY
         75dzB5eJGXawG9/SVBYq9jW4IWqchOolYoZVl182CzG4SIRGpLJY7FUmkq0IoelJ9vfp
         slmLXDK2xsescE0mbYcpR1gde0UFAkwED3DVYOmgskyyAH19LmEOlDoMrLqybPovemOe
         4Keg==
X-Gm-Message-State: AJIora8yJhcR2XLSqUPrA+zy9eZ407LmSVQrNlzDQXSU0032c1rPBcmM
	oSwYuCEMb7Mn5FNFYcqekw==
X-Google-Smtp-Source: AGRyM1uuT1vQIr57VczZbMYqBCAWavAInhVTP1sLXmo5Mj9c6tQOoxLBzzgmuH+5owc4zloQm+1brQ==
X-Received: by 2002:a05:6808:654:b0:33a:66b8:a7ef with SMTP id z20-20020a056808065400b0033a66b8a7efmr6977756oih.108.1658787595756;
        Mon, 25 Jul 2022 15:19:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t21-20020a056870f21500b0010dc461410bsm4790197oao.38.2022.07.25.15.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:19:55 -0700 (PDT)
Received: (nullmailer pid 2844967 invoked by uid 1000);
	Mon, 25 Jul 2022 22:19:53 -0000
Date: Mon, 25 Jul 2022 16:19:53 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, Rob Herring <robh+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org, angelogioacchino.delregno@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>, Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Maoguang Meng <maoguang.meng@mediatek.com>, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com, Yunfei Dong <yunfei.dong@mediatek.com>, linux-arm-kernel@lists.infradead.org, Tiffany Lin <tiffany.lin@mediatek.com>
Subject: Re: [PATCH v2, 2/6] dt-bindings: media: mediatek: vcodec: Add
 encoder dt-bindings for mt8188
Message-ID: <20220725221953.GA2844911-robh@kernel.org>
References: <20220720085731.11011-1-irui.wang@mediatek.com>
 <20220720085731.11011-3-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720085731.11011-3-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_151957_767155_915F758E 
X-CRM114-Status: GOOD (  10.52  )
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

On Wed, 20 Jul 2022 16:57:27 +0800, Irui Wang wrote:
> Add encoder dt-bindings for mt8188.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

