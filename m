Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E49C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:42:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96397613F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 17:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96397613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJvO0c3E8OQbOWf33BtNVMItFy14jP41HoYddmQh3HU=; b=2K5zpfL0eI75hp
	gZ7jwEPccV91utSDC5Pi5wWI3Zjvt/zsqYiyGX24FbhYMXSrq+NwJ5iNa0LwJAMKVwQIIl9sFWylH
	eAI++1/4pz6hn53t2lA7p2Dv4iKpnriJEWc59bqFYbNXvLihMrjMfoH1fhwuL7CMnO9TYvXrDsQS3
	FOl63DIfKfVr+RcWGUt77KNanNe96OZyW2AdOMFDAJCuZiWotrJO2uBwAD+GdG2bly/fZrd8y0Hhy
	t7M44zGN0qr+E2V1STbgc8IpNg13+BieMPS3Y9HuF9asNzrA/AOxkbqkjSw966xGFzidyVtlbw9jG
	6I+Z8degNCBkXrXxtEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4RrH-004yEc-7S; Fri, 16 Jul 2021 17:42:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Rr3-004yD3-O7; Fri, 16 Jul 2021 17:42:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 278E2613F7;
 Fri, 16 Jul 2021 17:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626457349;
 bh=HzwbWDV5zQYwFTjKz9i1yl8X4HOyO/PDoBsFo0wvaQk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UI9VNz6+GmC4EVq8BhacVQ41h/XRu9ypuff64Hh8Sqe3J3dN+EOtwWck8mOmfTMq1
 P5uVcjLX5K4qzI177YDsDw4ZGiATujNXiT/U2w6N/kBIo51xZLA17BSJD/iCl+uFVW
 R/0iRG/e6Hzso096DUB/VWHVo+LAJVb2n5xyWIOIrKlT4otpWp2rU4QNoIROFOcTa2
 Hj9KUDymiOq05JoSXqCKIy9jT6++KwmrL8CnBMYYBWUhPKj3+4a3ZpVeahLZNzayxF
 513/mlruzX+4bgV2W7N6VLqN/cTDAd9KVQHh7pJ18woSbb6nIya+frh6/0+Xdpf4NZ
 DA67o2tdt36Bg==
Received: by mail-ed1-f50.google.com with SMTP id h8so14004417eds.4;
 Fri, 16 Jul 2021 10:42:29 -0700 (PDT)
X-Gm-Message-State: AOAM530bWIEzR959ve3NOFx3/wwZ4x7+kv8VdH1n4FKJAQ5du0hKcCxH
 3I4VFifJLzB/V7cqtvpwRQFdBubRkkKGP8Tk/g==
X-Google-Smtp-Source: ABdhPJyaXcDoB4L/3QfxDeIb3GmDGi8Do/zLELL+0HTQ9aq+BedwPsPJgMcDgFyL5WZYW02X40zGPVUUlAOB8a6mNOc=
X-Received: by 2002:aa7:c641:: with SMTP id z1mr7027145edr.289.1626457347787; 
 Fri, 16 Jul 2021 10:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210715173750.10852-1-jason-jh.lin@mediatek.com>
 <20210715173750.10852-6-jason-jh.lin@mediatek.com>
In-Reply-To: <20210715173750.10852-6-jason-jh.lin@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Jul 2021 11:42:15 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+mF4O2H2fZQZRPTaB4yAFTRg7F4cYnaqD4xwN3XiZfCw@mail.gmail.com>
Message-ID: <CAL_Jsq+mF4O2H2fZQZRPTaB4yAFTRg7F4cYnaqD4xwN3XiZfCw@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] dt-bindings: arm: mediatek: change mmsys txt to
 yaml file
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, fshao@google.com, 
 nancy.lin@mediatek.com, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_104229_847292_6675C9DA 
X-CRM114-Status: UNSURE (   9.93  )
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

On Thu, Jul 15, 2021 at 11:55 AM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> Change mediatek,mmsys.txt to mediatek,mmsys.yaml
>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.txt  |  32 ------
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 102 ++++++++++++++++++
>  2 files changed, 102 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml

There's already a reviewed patch for this[1]. Not sure why it isn't applied?

Rob

[1] https://lore.kernel.org/lkml/20210519161847.3747352-1-fparent@baylibre.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
