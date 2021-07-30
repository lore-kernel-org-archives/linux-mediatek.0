Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0815C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 09:33:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88555603E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 09:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88555603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObOa9kCYzKH6zvGDZCdRwY/UzZbGVOWLJoDWPZSwlXo=; b=Q9hjBuIanO/Hc9
	fNEWr+TPOlimpyj/AOc3ZOIAUNd7fvCXcJ16SRHOGT7bWdHsoXOGhWhrqG1/aUAlANQkPEwgGj2vd
	vNfupgZyKCSy7e2KgPkThZaxUV4csVGQq8IZogQIWcZnxd5LEGDYG9G0m5mK2jtt781/LYXwQM712
	uj5f9MGgBiOBmi/kUR7XvB1sp2gy9MF7KEx8m61uetkeBL9bQ4YcdV1CTDeSvPwWfwnmQPLbxSctg
	zRFIO7FvGBt2Xtq8BcFiGXEkTlSitU6hxhEZl/taxkeq25swL8bdLvyZc7tYQpBsKbzDE1Ksacer/
	betrv3pSt8Ohe80S0qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Ot9-007u9q-5h; Fri, 30 Jul 2021 09:33:07 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9OsL-007tqA-4p
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 09:32:19 +0000
Received: by mail-io1-xd2a.google.com with SMTP id h1so10644278iol.9
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 02:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UENAkyvXIftlcsdFlCx7zKVE+FxyVIbvdXexL7kT+QE=;
 b=Kj9ECAHYD/ijOc+AQmZERa4YCkM0N5gIPeIWfCnUyHR1t+9tBHkIlIgtQppwjeZEg+
 m+/Krzw/xOGSKDEPyWPrKdHqh+Rpm8rOgo6iDpbrT1oiqbWUuGSj6xibOJ2Veabnvecx
 xDxtKVUuWGlBTbXQHvyTbVRqXNfSjAD7c2Ob0wQTTdYb5eFIqW+Rw7L6ZTSj0gPHGRx6
 OkiRts6pTOHsu3rxnrxlf0Cpv3OwBN53ETx2xyuDFYHtQ1gL4sv0tp4f2NcVHIoU4NHC
 vTCMMr6CI9VEYJAW24EowB/UQn0I1CPwCVD64bhfsua21IJ+/98fgFjwuAtIZD8/iGrP
 diGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UENAkyvXIftlcsdFlCx7zKVE+FxyVIbvdXexL7kT+QE=;
 b=KBkVhorxoSzhh9aOn8YGuyTdc7VBA2QHygm6s/hjnmASZSvTec1nY6wVrovSvRbdLH
 smTkORzSeUzcDqBmqDP053kI59tqKqCSb4aOzsz5Es/SbEuKy3cOfPj4AFIR8TdU0hZ1
 kn7iEscKm7Nhs8iJ6aI/HgZPtRt7ikEY2dmK+zww/byY4CdhUE4SGPjsH7/SD0PcXLru
 ZJto1K426EinwknjtqVaFXkSZYU2gFzz5Vmtoymu2HtJ+OUc6GaUhN3enkJKQPfov5/6
 +y3YttiUzPYp5wFsOuMPAysrvJcK6Ro2POwKrfOZaQKmXqeAz+M+JsJGoHV4T09AeuoB
 bH6Q==
X-Gm-Message-State: AOAM531q2BhdcuaiiwcodaH71f7KNRh2y+oUF354pVAXhgPQHk3wfGeu
 PmO2gTHnIQMkc4HaQLmzVGIL+xLOyBwYXVn/4tgi5Q==
X-Google-Smtp-Source: ABdhPJyD5fhu1x1POggBPj9r5dqca/AUQYvuZYJIMAyvwmAD/h2B6cTR9Lr0qps5U3HnSkkqjCdA8z2hd4f997Fsgjs=
X-Received: by 2002:a5d:87d0:: with SMTP id q16mr486487ios.109.1627637535819; 
 Fri, 30 Jul 2021 02:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
 <20210727101051.24418-4-yunfei.dong@mediatek.com>
In-Reply-To: <20210727101051.24418-4-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 30 Jul 2021 17:32:05 +0800
Message-ID: <CA+Px+wVfaAZ-PmrDM2=jG6NqcLHnXhnQFPLtiX8oRLS+UuZXwA@mail.gmail.com>
Subject: Re: [PATCH v3, 03/15] media: mtk-vcodec: Refactor vcodec pm interface
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_023217_255148_FB0F0258 
X-CRM114-Status: UNSURE (   8.61  )
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

On Tue, Jul 27, 2021 at 06:10:39PM +0800, Yunfei Dong wrote:
> Using the needed param for pm init/release function and remove unused
> param mtkdev in 'struct mtk_vcodec_pm'.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
