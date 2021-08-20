Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E25C4320E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 03:30:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0622E60FE8
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 03:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0622E60FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZPFY1Ffcw0d46lFHwGm63WW4fN3wTaaFNa7LT2f4B0=; b=hTSOCV0Fxz9Qwp
	uKECGBSXd1r/2pj0X2GbSimq76JKQlkGwQ0mfdhA0xMftjfJ5zfRt+N7iEYBcnTSPdaR2y0cflIXt
	EiS7QGjGJnVDaXnNQr2tRitkPE9jJ4NgmAXgspcLYb44n9BsbERcG326yFuoWi1LEivkBlPxcnBLY
	AQbn7vI/ctLohuZovLnbWiXl2+PCGcRM1oPtMwctscUu4/Q9tmFH58MhvHVYT+sgLD/ud3B64XSLV
	SkUWf94LPsv8sJ1z4tIG1SlMq9ZriJ/4ZlsBOrVYgFfKv1NpOpC78/lGSrzTeNZ6mPBHAEhxk6aV1
	NKDfnKTTzqSvGjdNDnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGvE9-00A0F9-FR; Fri, 20 Aug 2021 03:29:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGvDu-00A0AG-5b
 for linux-mediatek@lists.infradead.org; Fri, 20 Aug 2021 03:29:39 +0000
Received: by mail-pl1-x62b.google.com with SMTP id l11so5195606plk.6
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Aug 2021 20:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=m0sG6HNEqWhqC0CeVVryRPgZqvHD/ht80kWZ9SsRV5Q=;
 b=D00ouktdQh5MbXzxcNc6u9fD9+yFYjduyXj/ggJG2HjjkeiB6ybDKUgSwcv1gbKSpV
 jq1SU1lO9XHuwcb2aFzzAhIuPSUsiE70Bp74Qo4zTlUIRiGwsAujiFed2M5zKISDeD1v
 ci94pzNGtWzMuN5Cy32TGj85vvbN1bKIoruAhxen2YVEO7i3OZ7XJJ+B9CTcse9FyK+c
 DxiUqPuEjRZeQkoKziqQzf8K8hR5aAIh87qQ/k+WkAcc/tQk5/NO/g+tElhuscvLEmau
 UsYy+DVAEUeWW0d7QVPnfNe2u1Jnu5/K2XexzZdcJb5U2K18yHYnf+8Ne8nhCJHl3Yz1
 PITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m0sG6HNEqWhqC0CeVVryRPgZqvHD/ht80kWZ9SsRV5Q=;
 b=MyMdBnJ1haJ9SA8Wwccrprbzaioxl6e1Hyo+g1a88BjJr/8AtMfLN5u2NIB5/GofDh
 3trhPZZ2HCspa8mwSgdFiKUY5xJDwzDWDf3tZsn7Irwm4H5616RxfmhxJ4yvGf35TXcZ
 KYCuGlIEYofdpz7z+rjyjh/+lnIe9JFBwDo44xqbhhs22jXyuIzE2fYpRoiGNsAi5xN7
 w+n7R3jun/qEexBRubm4gTsui7X1LkuTwhpcD8iU0n3sDRiX+ErbiNeu1fwvmQKI+If9
 K5Z86PjpebH15kOnRM0t8e0rmUQEH6hrAb5XXW4UdKQaNzmHkAzEYrqBCG0Y+3XQWEy/
 H3Pw==
X-Gm-Message-State: AOAM533LkFK4ujGs54Q9Uj8Sg9ieRjma64fiyV3oWbBtqpFqEKDvdlSJ
 Hzr5r8j/Xdf2GPLfgh4i9t2ynQ==
X-Google-Smtp-Source: ABdhPJzsWONpn/nU+p39za84qQxpK6KZY9p6xu70i+SP/EhBA6Jmd3xqATtzwKo2xEmQ8jepckPaLA==
X-Received: by 2002:a17:90a:fb97:: with SMTP id
 cp23mr2346062pjb.93.1629430177117; 
 Thu, 19 Aug 2021 20:29:37 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:549a:ad5a:e5bd:8c8a])
 by smtp.gmail.com with ESMTPSA id l2sm4864369pfc.157.2021.08.19.20.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 20:29:36 -0700 (PDT)
Date: Fri, 20 Aug 2021 11:29:32 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 George Sun <george.sun@mediatek.com>
Subject: Re: [PATCH v5, 01/15] media: mtk-vcodec: Get numbers of register
 bases from DT
Message-ID: <YR8hnAiKHLpa1bri@google.com>
References: <20210811025801.21597-1-yunfei.dong@mediatek.com>
 <20210811025801.21597-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811025801.21597-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_202938_280380_9D74ED39 
X-CRM114-Status: UNSURE (   8.14  )
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

On Wed, Aug 11, 2021 at 10:57:47AM +0800, Yunfei Dong wrote:
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
