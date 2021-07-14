Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4A3C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:56:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7908561377
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7908561377
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjoL32egevRKb3yKA/yp76qXpZvc1Oi9uQv5xPOiHq4=; b=W3U0woAWkT+Bpz
	AJarYPdRmy/R1ek1X+oZj38nP4Y53fM44unbruGxo5D62eFLB9I+Zh9XFRz8Ev4k856IIqFRlPAQI
	35asn26Ycvg71pjJU0yGCcMhhm9UPnWReYqip6hqMXcSnAsOEwDpxD/f7zuxDHOVXB63r24KNpZ4C
	7Mpo4LeZShUqWP2ZA5GJrZ3R5q0Dq4oCzrvlUUDr3zecLwJOI69Fehvdjdp4iN1RTlN8MAtVdxmRv
	u9Z7GQh+9leJVRcDbUi+Ya+QwvizsR1FhCVFEYnqPZ+1W+xgYdEHC+9vxaBtAj2EZLXikfqJQybBE
	Hp/t3HbTAUvE7cjPUwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3ok8-00GTW2-F4; Wed, 14 Jul 2021 23:56:44 +0000
Received: from mail-io1-f44.google.com ([209.85.166.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3mOF-00FOgC-Ic; Wed, 14 Jul 2021 21:26:01 +0000
Received: by mail-io1-f44.google.com with SMTP id h6so3913772iok.6;
 Wed, 14 Jul 2021 14:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eB0JXlfGUoRcY25ZNZz1IiOfAvUxPS0GkG64oSP4tsY=;
 b=gexv/8LDSYFhDYnvJJCwF0MpWxxy2N/N/Um33UGfuHjMjYwkmXPVYa1isx4Ws+/hVn
 L2nTerCMhxmCQtKT2sXWXnnzDkBzl5ryLl7/XAAV+cqWd4JTsUrptKWys2jUfzrONruy
 SEsuEjz3LzQM6cZG6+JoBxlzlFdoBieO6cmeq8eKS87eoiUT7y31SMpqDNG/mejS2eZ2
 Ex4Syd/7Kqaz+2ZiCsnuxWqiy7HBSOL30ziUfw+zSh3t94T8pfFHSb4M52zmwlSgB0ep
 GJvYkpcZFf8SdKotXORN4c4rUJTv8ClY4mpWr9VCU1G4FmUF/l5oiMXHIrKfBjNo6My1
 1F8w==
X-Gm-Message-State: AOAM532SE5qeO7eVqqb/mY3Gk17N++t8p1zBIFo6h5/4UmtzTXcSmQJ1
 SHyW6ctX7+skY6ayIoKcag==
X-Google-Smtp-Source: ABdhPJwtENeG5pic57aS0ml8NPRUqqEOnxCFory6AMF/MV2f3K9FBEovaYpCw2SzI7OWEI8CQbrI2w==
X-Received: by 2002:a5e:a816:: with SMTP id c22mr128606ioa.94.1626297958643;
 Wed, 14 Jul 2021 14:25:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id l18sm896887ioc.13.2021.07.14.14.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 14:25:57 -0700 (PDT)
Received: (nullmailer pid 3554156 invoked by uid 1000);
 Wed, 14 Jul 2021 21:25:54 -0000
Date: Wed, 14 Jul 2021 15:25:54 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa <tfiga@google.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 srv_heupstream@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 VENC
Message-ID: <20210714212554.GA3554095@robh.at.kernel.org>
References: <20210630085247.27554-1-irui.wang@mediatek.com>
 <20210630085247.27554-3-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630085247.27554-3-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_142559_713476_F49A5FDC 
X-CRM114-Status: GOOD (  10.31  )
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

On Wed, 30 Jun 2021 16:52:46 +0800, Irui Wang wrote:
> Updates binding document for mt8192 encoder driver.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
