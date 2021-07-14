Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50BEC47E5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 00:20:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD93C613CF
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 00:20:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD93C613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROWa7OWuvfDdJwgAs4uMwo8GHGSTX5LbHsxNs0c4CPs=; b=XEsCwIToxJBNuX
	fbLNHhHLBKxQaac3ruQypxGK/eS9+KyS2Ri/h6FmF61ozInJ8UHuAhelXMYTwNJaXCYFRzeU3qD4n
	LLiPKCzjVb9bH2vN4wwDUCh0eXjThQlL0o6PmGyslSy4vG4q4JjBckwkqNmntjbDVgq2M84eT6za8
	aofqXP/FVTkKy715XyTEaC93O1+KWsVunbNSX1VYe5dxI9mJnEHwmp2eaGhZMJ0COMDr1mB14xefX
	+q4egSAjsinC6ofECKsoPlEyzqhvLdvcylQB4LFodnZjdQ9NUByYHSx5zD6EYFS5Vu64JV1zTwqMc
	oswc3f/EaeP7Mu+T9j+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3p7K-00Gcz2-FK; Thu, 15 Jul 2021 00:20:42 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3o5Z-00GBrz-V7; Wed, 14 Jul 2021 23:14:51 +0000
Received: by mail-io1-f45.google.com with SMTP id k11so4220794ioa.5;
 Wed, 14 Jul 2021 16:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h/hZfjolUitLaX6oOb58ZptnZlkhBHCK2VKrJSQEjbo=;
 b=CIuUvSsHbLET0jcRabw2qNybbgtZ5JuQgC66CEwt2MVXHTq+RZKq9VgQnJ12xXV+Ki
 TpLaGxSpCtB1OAUqZGLBO525pJekVHa3EZqzdhhiCTKMkhA8d70QyHBQWHlmh3AeDqXG
 8LEE5g7I1L3/a6uG4dHw7SOGGt9Dl+md0KLy7pVtWdLnrPcnrBAhWrsDMcLv4bI99WE/
 oDc8u5ZTeUGf51QibwxJdDL3r51rjCVWORgUn6TOn0oU+sWgk1U6e03vbH6sJ1d/pQrl
 gfRwR2IKWJKiqEzOE3IUYYAIod4Q+YRL6xubhf3jiSt/8s4Bt0wSOzagZC92qJ3VqQSr
 89+A==
X-Gm-Message-State: AOAM532EZ8PgTP7Ve60+6Acj2A54IblvucktJ7efutV3DEkvtfRZNoxN
 UGMz2dS7vssGg1v9IlQ4dQ==
X-Google-Smtp-Source: ABdhPJzhyC/vwfS+dLQILbviGnVPtuNaPRZ64Q/MD49HkxGHbQAz6dJ82PvAkfxLh4oh7NRzSDlI+g==
X-Received: by 2002:a5e:df08:: with SMTP id f8mr421399ioq.172.1626304489102;
 Wed, 14 Jul 2021 16:14:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z11sm1969586ioh.14.2021.07.14.16.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 16:14:48 -0700 (PDT)
Received: (nullmailer pid 3721314 invoked by uid 1000);
 Wed, 14 Jul 2021 23:14:43 -0000
Date: Wed, 14 Jul 2021 17:14:43 -0600
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1, 12/14] dt-bindings: media: mtk-vcodec: Adds decoder
 dt-bindings for mt8192
Message-ID: <20210714231443.GA3720388@robh.at.kernel.org>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
 <20210707062157.21176-13-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707062157.21176-13-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_161450_090917_020E6D0E 
X-CRM114-Status: GOOD (  10.56  )
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

On Wed, Jul 07, 2021 at 02:21:55PM +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../media/mediatek-vcodec-comp-decoder.txt    | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt

Bindings are in schema format now.

Rob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
