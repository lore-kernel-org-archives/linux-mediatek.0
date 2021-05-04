Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D8B2C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:48:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386BA61186
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 14:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 386BA61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8bf3iYpxmpq/8bekfhtxlNnoVhOrl5SHMbAvnaGUAb4=; b=PAWk7JjFe4tIdjVEjdft6uTWw
	VTYbKWKraVDynfb/Nmfa5sxg6X64hKtmqnu8cTb/b7bsARIUF9D+3W7MvtGVTbmuec3D5IfUEtT/5
	JG2FjXWvWp9qNKtSaMFNXnrLjbSGD0jBi+5YIoCyeBHtg87QNSyN1nhFRVg4n4TfaH4SO0U0kXQdX
	Q3MDt7kA0UtJLdeRL2Mih45USRyKt4dsN6ou1DpuP87H615dLwED1yNNnkE0h+u9CatDJzYg8yCTw
	y4riJ2SePDy6MvKiFeWfKbnzfCxQ4HyRsIFdUuzER8pNNNjPUzY5R5S/zLkaBjVOgongaAPTNlBir
	7KRV12/tQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldwLi-00GNzj-3b; Tue, 04 May 2021 14:48:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldwLg-00GNzZ-4f
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 14:48:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=bSJNWoPTxsmjw9lgwCAD+AS0aeK+yfFlLEQuCSSvXnQ=; b=MARwtg4vBkIWnHDbhCuKWjEI1V
 XxCep3puY8g3XkmTpJ0H9dftSGA0tND3aT6aceCnkAXUdoThqiHXmvT8lRbrZGksATT53V8sKsIyJ
 aIFc1HLO5K8bFdXkNEVDmWsWRl2XDfZ76MstV5tmDYwNxtgPm4/Y2Jipb16UigV5HyNfgdjbWazoS
 2ES+AQQxvPuggAnTVM5NRBeD0GxgXpnrDq04JqgMbpdgwCYmRIm8EA2cyvDXwNHOt3ZDIZspz+UvB
 X5H9l7irpBvA+hSUNLW+k3Pc0bYu7F5CLRac0B1U0iESaZIPPuS2ShG2zG9G/lXKRHJv6DkzBH7aO
 dfDHU/rg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldwLd-0042x3-O8
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 14:48:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3831E61186
 for <linux-mediatek@lists.infradead.org>; Tue,  4 May 2021 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620139709;
 bh=bSJNWoPTxsmjw9lgwCAD+AS0aeK+yfFlLEQuCSSvXnQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NzdVl1vE/HpTNbvRa+04w8VtolgUimmr0osBl+n8x5D8Y4ujpeOeofDBS6nB0uz3r
 K34SZzHcYShda3uAJZhQ5mRKKYxACPdQgh3fX9S/AvZhqY+rRyvcSE9U9mpgM8yBoc
 1qkXPBibcPsHxqmuJOVU/tPGzkNBsMjq5EZZ+WEZNAO3w4O7b3xxYCOp+jVV0W8gJm
 wKSC//OV80HwQAwzU5ac4hjHCDwCLPR6OZzksW/7g//0vTWAzeTEg+/HGyrr0Q388M
 9rmqNyGBWPv1qG1SbavfsqJWJThNd6e5zqeH3AVxCTEe1+6gcqyc3MTviacEwwTj7c
 4fEnzC231ZJ/g==
Received: by mail-qt1-f175.google.com with SMTP id f15so6462991qtv.5
 for <linux-mediatek@lists.infradead.org>; Tue, 04 May 2021 07:48:29 -0700 (PDT)
X-Gm-Message-State: AOAM532LW6cEH/MIWHCNJAe+ylUYMesYnm3aG/jfli+2yVEfoKMzeN8f
 5eBoeKWQcarbeZsIjy/uAb2PXSymE848wy7+Pw==
X-Google-Smtp-Source: ABdhPJx5atFlFwZpc+7ej9uT8D56VLMBLPhSM6lU+FgDf8UJdvAVnLaysl19h3fODAoht/lkSZv/rL3FKvgD/I3SVDk=
X-Received: by 2002:ac8:5d52:: with SMTP id g18mr23270245qtx.380.1620139708372; 
 Tue, 04 May 2021 07:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-9-acourbot@chromium.org>
 <CAPBb6MWhP+uJSHzMHuH93fxgFosw=FPUoHOLuDX1ZYGunWX11g@mail.gmail.com>
In-Reply-To: <CAPBb6MWhP+uJSHzMHuH93fxgFosw=FPUoHOLuDX1ZYGunWX11g@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 4 May 2021 09:48:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL5ZZvq48c-3Dw70N8cqH1wNC-N9muAX41oD6OQ4E+Uig@mail.gmail.com>
Message-ID: <CAL_JsqL5ZZvq48c-3Dw70N8cqH1wNC-N9muAX41oD6OQ4E+Uig@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] dt-bindings: media: document mediatek,
 mt8183-vcodec-dec
To: Alexandre Courbot <acourbot@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_074829_830357_DBA0FBC3 
X-CRM114-Status: UNSURE (   9.89  )
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

On Tue, May 4, 2021 at 7:56 AM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> Hi Rob,
>
> On Tue, Apr 27, 2021 at 8:16 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > MT8183's decoder is instantiated similarly to MT8173's.
>
> Gentle ping on this, could we get your Acked-by for this minor change?

First, please don't ping for replies during the merge window. Second,
if you want to be sure of getting a response, you have to CC the DT
list and then you can check PW and see where you are in my queue[1].
Third, my ack really isn't needed on a simple compatible string
addition.

In any case,

Acked-by: Rob Herring <robh@kernel.org>

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
