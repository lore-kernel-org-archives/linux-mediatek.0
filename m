Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975B3C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:32:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D9661D01
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 07:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68D9661D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtAsVNmC7I34yk3Mpfkm4SVEjwIfSKGjwqF/6pbDVL4=; b=t+k3lXG7Io4AHE
	GNj31+Trk/9FDV3OaDqeoHLP+OrX+VX3KogWh5PNcnPPwRfeS9/B6CC/2iX68Bh18XCg4k/dPuUw5
	49biJyxBEAQsvWkXpKItXs3FxfMiU0xCDUFJViua3uAzkUxPhXrKfwp/NLbGSE7PYdsi7A6QbNE37
	tBJW0oNydFvRW8uRkEz/xx4358fW2t3mMCOG6cklEzae235w69JdTelQ/q6XohZqcSTpLd4dKBr3+
	wn/VTxUQxwgB4HSI99Pd9kNV+lv2MODyVVPxgxSXCeIjCA21fNawNE8xMg4ZhB9K5ZdUcvWeCu2C3
	oZ2EV6gnfGHL7IipK+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyUhm-00D4tF-6k; Wed, 30 Jun 2021 07:32:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyUh8-00D4OC-9c
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 07:31:39 +0000
Received: by mail-lf1-x129.google.com with SMTP id d16so3342052lfn.3
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lxYiu8p2N8GfVq4zjyFWRywFohMl9B93gUN+WOKNciM=;
 b=P3dnnE9etYGaSIabOdksbhak7yrNNEj7JkC2s9ceXmf359Lo+sLDn+MN5AaMIeP7nH
 uuFlGOlo+AL2gRFKJ2sRTPn6O3eDynC6a1yVJ32Vnr9A044z8C0sghr9j14oH/VWFeof
 tYfsqbi8erpR+0ZcEnIoOakG/5XanHNAsR8JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lxYiu8p2N8GfVq4zjyFWRywFohMl9B93gUN+WOKNciM=;
 b=ukMArQ8Q1hZc/8b3FlRQtMvDkENoOLa3smSY4HbrE5bgejlYwWGRj9VE00tdPpeWDY
 Pya+XMsfR4v9UeveNUONP/6kYiYabdA0cb+3LJo6QbqpDGD368Sv/GAcuzTRg2TsGgU+
 YPVIsA7m8KYTlXcLSS07R233fXF6ppVABvBntyCuDv+Vpe6wODKDdn3p3N1xgtrZTbfo
 wPTkBs7G2piYeP0z+Go/TFQIaP0tW8cVStQEL4+Wo8lyN7imsLcRShg0txVZOcDUpMQy
 Fg1xvGo18wgEN5lST+lWg41ALXzBD2sJ1/Wczp16PEFJWc5VipW6mXJjFCg3kd1hEYC0
 sTNA==
X-Gm-Message-State: AOAM53027bbjWoPmhLe5jvWOgI1Vja/Rt2TMbMv3Rc6dgjC+czUJEDMI
 BJCTbvA+pGQxY0IDEIAkjPv+32rHoQhJHchRzbRvPg==
X-Google-Smtp-Source: ABdhPJwtWq5t1qxUswjy8XnO5yHQyrzaf/PASJx0qZL1yG9gn+vAucP21N28ejrTjvh3GXcAhuzEvusugeGYSyVNteY=
X-Received: by 2002:a05:6512:63:: with SMTP id
 i3mr26374013lfo.587.1625038295495; 
 Wed, 30 Jun 2021 00:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-4-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-4-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Jun 2021 15:31:24 +0800
Message-ID: <CAGXv+5F2zTcqnjH2ud38vUD149KJtgxhPQME2Mk6-vGtQv+2YQ@mail.gmail.com>
Subject: Re: [PATCH 03/22] clk: mediatek: Fix corner case of tuner_en_reg
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_003138_374217_57A4C7D7 
X-CRM114-Status: GOOD (  10.12  )
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

On Thu, Jun 17, 2021 at 7:01 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> On MT8195, tuner_en_reg is moved to register offest 0x0.
> If we only judge by tuner_en_reg, it may lead to wrong address.
> Add tuner_en_bit to the check condition. And it has been confirmed,
> on all the MediaTek SoCs, bit0 of offset 0x0 is always occupied by
> clock square control.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Though you might want to consider converting these types of checks into feature
flags.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
