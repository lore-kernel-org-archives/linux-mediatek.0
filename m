Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08791C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLhfCJ8PekgBeiM3KU80x7Qwq344wsuKnT/r+LcG2GM=; b=nsiLFJAf3Vp1P4b+TFchnpZaqC
	zchQ5R7iLUAfZ3pfSUv5vwyiS8jCvAdtAR/1zjvczyVw4T8ruwQIkvMf6jQeuN8k5t9zQzTb5kYSQ
	di1SQcwnrfClrDy0hBABcRvZOD0BkzIFsGggF71dwhDPs7QurZ7LgAE3zc93cxjWoT+7cMDwbSw59
	slBs9W207JKZhveJu3Un1XDz888hMF6bRiwIjrKBBcCDj4vdMe6UnY79/CFZkNVq2McA5K6iNEwe2
	mqwPwo/BbIEU26GD2z/SdztP9ubKvkcZAvJVXv4k7v633DAYN1/4ZfntAfjs8i8u/EttYYZFZ1HXL
	mKJUnu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25uT-005o1X-53; Fri, 17 Jun 2022 06:56:49 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o25uQ-005o0X-U4
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 06:56:48 +0000
Received: by mail-ed1-x536.google.com with SMTP id c13so477010eds.10
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jun 2022 23:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sLhfCJ8PekgBeiM3KU80x7Qwq344wsuKnT/r+LcG2GM=;
        b=e7KAaUnuA0HYGg2Lg9mBPj3DrKLEvfZUjQBilNBT6iFsQwiChqYLbSFMpt1CZw49hu
         Uhh/Z4UzfmH1tgChFd4GYmJPuADEzaM36JeRF/stmNvDIRYGsPkJEfUx2gcYqjIzk+1Z
         4pTq/kEcbLMa+GGo+ioysby8f4NVMsOllC4QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sLhfCJ8PekgBeiM3KU80x7Qwq344wsuKnT/r+LcG2GM=;
        b=Yhkph6lY3EJjCrT/cCwt9Lv6TH+c7R9S1OrCQZMH0IKh0hnfA2IK3bIf79xThyfqSx
         BF66UsaxgkjIuV2P5ICsvAUpZAZx/RBuxpcriqSb+3aH4mhtxiEHuCPV6uRUev2+ZfUG
         We8sqP13ce97DXtvJcwxpgLmYfknHqCQx3XZJIi4IyFgD3QO/y3DaG3dQYeYRMF9HaER
         tuSeD0FiYvWuuDwRTNiuiGrzNAVIK3PutojdX2eNmJtMjWYCF8DCPbAfFuouRCKBPmCv
         6Oz+lB95djkY/sJSomTF1v6M/p7UAU8r0MNKsPWq82ZGRsn5mgsUk1o9w4HWFcDk0Fdf
         CJmA==
X-Gm-Message-State: AJIora8itYUkY6KiMFsj+pCMECLjHCDNI96c2GqSKNmJMwGFA4YutHpY
	kDurLjbb3woikyTHskE1RhhpoRi7rAaO5gf4oqouQw==
X-Google-Smtp-Source: AGRyM1tIbRFLJsIG8ha9JMgB0N9ZCD+AhfPO/Aq8IF+A20gJm7k5xF0so9i5AD1klMG7BMMrL3Xu6QF5ZW0ApN7BiWc=
X-Received: by 2002:a05:6402:6cc:b0:42d:bd2d:9f82 with SMTP id
 n12-20020a05640206cc00b0042dbd2d9f82mr10669676edy.59.1655449003429; Thu, 16
 Jun 2022 23:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220617032113.18576-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220617032113.18576-1-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jun 2022 14:56:32 +0800
Message-ID: <CAGXv+5EZ+Mu1481gM9h0kgqO3a0xFKP8drvGv7gRp6=3NU2oKA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix non subdev architecture open
 power fail
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomasz Figa <tfiga@google.com>, George Sun <george.sun@mediatek.com>, 
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_235647_026978_E75BB270 
X-CRM114-Status: UNSURE (   8.78  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 17, 2022 at 11:21 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> According to subdev_bitmap bit value to open hardware power, need to
> set subdev_bitmap value for non subdev architecture.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi hardware decode")

?

ChenYu

