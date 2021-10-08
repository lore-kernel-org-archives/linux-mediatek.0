Return-Path: <SRS0=sTTz=O4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1595CC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 11:37:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C606260F3A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Oct 2021 11:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C606260F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6nqh2yFCRmwzxLSUvMnUecueI+OX3lSrAo3Ky4157E=; b=g1dgTfyoV7Y6g4
	jMppIOPlI4qOBIkFGP5vH9WGnjDu1sWTLPwSn5xstcPjblDWfuA1ik/nggAECo7w1BMbfkpFYtneS
	vxxtyUNiI9Am85adLTJWCwt7wUh7wRwCJ5pBIGvpfGUF7ltVAumga8AEkHddlVVzwJiEaxOouXuhN
	HoR0RoOeeX8e3AQLko6EUGBfkIvRV/St6pygOdv35NXCuV9QVoEITIYotcdnkFLlDiEKuXoFNM+JV
	EsvqqemQ0Cx6sMMRcEcoJM9BAeh4ggvGmwdtukoipy0ZWMzvmX7UCGHbhvmZOw9Zt38LmmIPOueiO
	B/STLVlccVtth4bouYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYoC5-002ZRK-DZ; Fri, 08 Oct 2021 11:37:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYoBr-002ZO8-NA; Fri, 08 Oct 2021 11:37:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id t2so28851019wrb.8;
 Fri, 08 Oct 2021 04:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nhVv3Nu8L78RD8tuH9ekjolQi0/WLnSIsU3PjboDD2E=;
 b=cyG5X880niFfEcC+hw3EYtl11pMrvkr/xcfUgwlo2MDTSIFyu0/rBR6x0eaCFvTYbx
 YJXuPIHqh8x7zwEC8NaEN5Pu/0lvQ/kerYIDsHWNqKtv2/qAiIAeLfkVcTsA/CVnc5gy
 1ovf3PmLXqteGvQmeJff/Bf4clkKNoxIHkOjEAZX6Kx5aF41hxN2b61RXcU7PuV+Sw/K
 3v32ot+h2DkQJFm1pH4jeV2r/96PsTFkiyZovKXT+TRhbclkNVhvJaeI0pTCFJn6P6Dy
 Pr1IRn4Lts9Q0ozAU8NKc70PsyZkKEpSQrGlS9NosYAT+EWClUbg5ZxZRjvAc+eqfUaL
 DTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nhVv3Nu8L78RD8tuH9ekjolQi0/WLnSIsU3PjboDD2E=;
 b=pYfKqvzqxxxRXnSOiIYcPntmPslmcGrwtIs4x7TglgOQGTdjOzOOGLn3poGXxhScwJ
 /ZwkVRGsLdUN6Mt1O5TwJN8HdJ4vinN8CyUtD6fS2Dw5pVVxPN6Y1NajNdkA5fL0fCA3
 yt4foFnNGAKXzfsL6Tcr7EdBD/BaLiIBuCSa9XzWUmis3QHXZ/yElLrJ3qqNo5RMAoHx
 WoAQlvI4PCT03TLgVOytS/O4IW52+5fRJ4AMu8EfWwH4fmype1PQsQGZQlp4h/Z9cukO
 inUTgZqE9SPO9kK1QYZP+ZQtNOxg61mkVp+H5+BwM3Pwt1wol/s5SS4yKVr5Nf9pq8bq
 zq8g==
X-Gm-Message-State: AOAM531ofBLdNla6VctBAERRRhJshNq8nWr5ptp7Pa1SCFiLEKoya590
 aFheP+WmhIbmRmHrc+1ihMM=
X-Google-Smtp-Source: ABdhPJwVR2YF8maIX6p9K/HHX630G689zHLSPVI6jT9XLKwM0kaDfCSBSWfXXwV+O5bt5doVm72EZQ==
X-Received: by 2002:a7b:cbc2:: with SMTP id n2mr2925803wmi.2.1633693043342;
 Fri, 08 Oct 2021 04:37:23 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id z17sm2280277wml.24.2021.10.08.04.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 04:37:22 -0700 (PDT)
Message-ID: <e3f30009-31ae-f37d-5016-bc8677d8d364@gmail.com>
Date: Fri, 8 Oct 2021 13:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v11, 0/2] soc: mediatek: mmsys: add mt8192 mmsys support
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20211008020504.1678-1-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211008020504.1678-1-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_043727_811030_D47265FA 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 08/10/2021 04:05, Yongqiang Niu wrote:
> base v5.15
> 
> Yongqiang Niu (2):
>    soc: mediatek: mmsys: add comp OVL_2L2/POSTMASK/RDMA4
>    soc: mediatek: mmsys: Add mt8192 mmsys routing table

I'm a bit puzzled that you keep on sending this series while I accepted an older 
one long time ago:
https://lore.kernel.org/lkml/e4afa712-9936-15fc-ad43-576948758f6c@gmail.com/

As you don't provide a changelog I'm not able to find out what has changed. I 
also asked you to double check if the fixup I did was correct, but you never 
answered.

If there are anything to fix for this series that's not in my tree yet, please 
send a follow-up patch.

Regards,
Matthias

> 
>   drivers/soc/mediatek/mt8192-mmsys.h    | 77 ++++++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-mmsys.c       | 11 ++++
>   include/linux/soc/mediatek/mtk-mmsys.h |  3 +
>   3 files changed, 91 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8192-mmsys.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
