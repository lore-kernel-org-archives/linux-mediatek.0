Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3866C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 15:08:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3484B6193F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 15:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3484B6193F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G026zowhqG9ryumwdxJrD0iQLN2miIEOWXwQI7LwsoU=; b=UHrpqI9ktlomIHjIG47cFG76+
	514YWt7bu2MH16kMW/68irZ7fC48uJWPvOzonGSjL9KWHj3UCtLJpOowGHVsPObrH/plAZJ/V1IvD
	4TC3hJy19VA8DKEwhCfs7hRUmh2WZpINdG64vtOonm1TlQs1ZLmiVZ8L9BVjbkdym+3r14gRQnsZ8
	HEhtL4D+pQfbi3PGklMDFLuM5IbyRfbnNGhx5J3MViz58qRaJan5TqLttpXiptiO+85bPbsmSO1Gt
	AhRM4xp7LDbqK5vrTOwa94ZUymNHmjmfwlWeBY81Mzq5UHXnbV2dQ9Ljkw8hP4/24EMivUfSDbrV2
	lwHsS8BfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQAXh-005Cnv-Up; Sat, 27 Mar 2021 15:08:02 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQAXe-005CnZ-6w; Sat, 27 Mar 2021 15:08:00 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso8101282otp.0; 
 Sat, 27 Mar 2021 08:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cp8tBSKG37JlbRUd0S+dl47e82ISyzxt5fUuG3wWWmo=;
 b=Scp45yZLPdKR7X5MlDp/he6iAolZJvxh+OlUH9Aposa0O0B35GP7xGp4FFHqcAmu4e
 tofZyxyr4BseoezkBfsj7KgOVIkzlZNX8iFFqZVEZsZ8E1ZrFpiZw3TP44IQivZxgzNL
 3Wz3fUhWY5nU6td2P+j1AesFqKrG1ps6bOU5W0UQzsiNeqKXV6FXDqKJzYUSERJdX/AI
 fFn+1TKR5CvNAK0vlQc8gp1kqjcGvmON2oKlcceTA9UMtJ7ob8nHNSJbZ9K40arBkJhx
 5qydspbjnITGOUfk04i8Qdcezm+P7mzy+Yloh23iPvoG24Nfmo8AJNxFFeZRoRpxDr0w
 PCZg==
X-Gm-Message-State: AOAM530b4qb9lahYR0ntyzPX1GGdYH7KGXJuLUEWEBFu1wDBdlLhNa13
 iYfc5OW3q1AdB6yBw9fBzg==
X-Google-Smtp-Source: ABdhPJz07TTqTTNWOb3R6lCjghgigOMcf9QXbp9+pHnVlNG73xMxqKiYNmPDO7OowO4jO4ZUAzlghA==
X-Received: by 2002:a9d:4c0a:: with SMTP id l10mr16126579otf.136.1616857676218; 
 Sat, 27 Mar 2021 08:07:56 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.102.185])
 by smtp.gmail.com with ESMTPSA id f29sm2958729ots.22.2021.03.27.08.07.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 08:07:55 -0700 (PDT)
Received: (nullmailer pid 121627 invoked by uid 1000);
 Sat, 27 Mar 2021 15:07:50 -0000
Date: Sat, 27 Mar 2021 09:07:50 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tomasz Figa <tfiga@google.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, yong.wu@mediatek.com,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4, 1/3] dt-bindings: media: mtk-vcodec: Separating mtk
 vcodec encoder node
Message-ID: <20210327150750.GA121510@robh.at.kernel.org>
References: <20210325122625.15100-1-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325122625.15100-1-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_150758_528929_C41D4334 
X-CRM114-Status: GOOD (  14.80  )
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

On Thu, 25 Mar 2021 20:26:23 +0800, Irui Wang wrote:
> Updates binding document since the avc and vp8 hardware encoder in
> MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
> "mediatek,mt8173-vcodec-enc-vp8" and "mediatek,mt8173-vcodec-enc".
> 
> This patch is not a compatible change, but we must do this modifaction
> because MediaTek IOMMU add the device_link between the smi-larb
> device and venc_device, if the venc device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> There is a bit of backward compatibility for avc encoder, the avc
> encoder device node still has compatible "mediatek,mt8173-vcodec-enc".
> 
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek-vcodec.txt        | 55 ++++++++++---------
>  1 file changed, 29 insertions(+), 26 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
