Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67008C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:53:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85EF161139
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 08:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85EF161139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+RyYdl0iIh3xhjNIDHQc5g+AI4Z1HCzsxAirslzb8Ww=; b=YwK9WHHqdjGpbSirwPoPrNaDO
	9IHUywP7hfZXy/sxcapGkDT6JWAQXj8aa51qpXp4o3YOteUpA2HpCvXjP8TIeK5Oo0WzD+LJK+0mP
	07TxKNzLWPvLzfZW7ISkM8U3frdE8jtqhAO8Hq3AZ99e0xiaAaMGqyTtsvkyvaf0nksxsd2pduAor
	/eMfTBsWFv+0keRdAyyssWWq8dXxTBqm5SSaQiQgA5/pEJyBR/LioErNfK+DO3ohknG50dzWJ9eOd
	T2u2GoioxyiVw4lpb3N5Ts7b24qrM+fk/HRJxhbh+1WJYqnLdG14zWiVtJ4ptith9ZlhjpdUqCdIr
	ZKFvJJ1AQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWbGk-00C3ch-1M; Wed, 14 Apr 2021 08:53:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWbFW-00C3Pw-1R; Wed, 14 Apr 2021 08:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=SgTS99h3WWD1mgPszmFTe76jbtJ46MHLnHqqyUGMuQ0=; b=HJcBZilqjSSTud4zijoJYxlb3F
 td0dtRtKfbu5MOzwSmwVbYo8Y+587kLgaSCzxKXEgJFx0vu3vGrzSg+Owx4bw4tX7Twz7djPz4OZ9
 jv/v7ryS6NpLaapm+rECqKu7csvwMGYVpKqm1j5Vn2gYixREPNZy4yryhXTLnEZ/nG65gjKqYD5fq
 MEmWJVCvcf+IB2PXJYslRctNRX/o6fn2sN350Qzb2vFIzT8PK8qmBf8EKIMoG94z0peGHRV5EbnLd
 UcB2ZzC2CacJsBKncpY9PqEMnwR6HZR3hK3TI8aKhBzPRFvYZukR2y5S2eV9YfgCLq0yvaLxz8uru
 iRx6sLDw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWbFT-007d0i-JT; Wed, 14 Apr 2021 08:51:48 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so9656420wmg.0; 
 Wed, 14 Apr 2021 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SgTS99h3WWD1mgPszmFTe76jbtJ46MHLnHqqyUGMuQ0=;
 b=Fz3NGIt8XnWPoiQNLlgvGgX2zguCjrxyGfrDYuF67IXU+FZYfc/tiRpU77lhKHmR+B
 sbeGhmDqhAZbhQv9kVpJY4uPqOEl4AjbKZFXYm7h41WNRqGQV+WQ97QPuEcPevy0OY0u
 CtyfYljhV2GcKG8co/lTtfA+ozOx0Bxz3O7EGIQs2ok02dhlqZ3DyVlshbwOPt1rSbEf
 t9HTVsNly+wFUgSYAfLL90J0Mz42RoQZTlcLgkfeRX8R0H95Rg41dri5Hq5vwlcP+j0k
 M1P6eHlbm+CQ7e6HqU69sfwL5fnIUx8chtXdLPbE+eOyXd/4PNFUM9sOOJPdqBLNbsfy
 0Ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SgTS99h3WWD1mgPszmFTe76jbtJ46MHLnHqqyUGMuQ0=;
 b=bdsjxV1D8HnzWFhhb0W08d1B4XJ1Gbx4rtXZZCenHz6x3eQjPo6iCNITXXq0V5vEI0
 Nmg1Qz/t9/X/IlfeBIKSe1DVeEMh5wA6kzypalXf0OMwXOd2u8MVFTO0Z14k9/XA5f7Z
 8TF/345dYL169OTykk/x5thSWFxqGj9yJNn2+nVKQq+IzKQDjPLQYzCnYNEiHWbHDY6A
 DbjkCN7zURylzljzDeotyll0iutOr/8d2TaVgg2WjMcRQCp98nBjC+rFYHre/hFESZU7
 9IIlGF+cjnoor0VpTT2eGtw6VFYFsgBk6K4Jz1ArHxfpUNwpj/u/GKARx2Q3ojK+ZKM2
 TSPw==
X-Gm-Message-State: AOAM533sAyGcT67YcGthvne3GF5l2XL/Tl4UqUnHt6qwCf/19/ZM/CKq
 lHAx9jHS1mBbf847bTOgJUn9HNn+4S6syw==
X-Google-Smtp-Source: ABdhPJzlsoMGmtNqfM+N+3qmXD8myVkzGZ3TeNQOfQEJ9Qx9NmrcG6bRpvhCGDTiQPkNkLctsN4FAQ==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr1898048wmg.81.1618390302777; 
 Wed, 14 Apr 2021 01:51:42 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id v14sm22498881wrd.48.2021.04.14.01.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 01:51:42 -0700 (PDT)
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Fabien Parent <fparent@baylibre.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1618226325-31927-1-git-send-email-yongqiang.niu@mediatek.com>
 <CABb+yY1b9wD0hoBx=aYzpLcF-=EEG4QTrV68sZj8+rtf5J1aJQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2, 0/5] Revert "mailbox: mediatek: remove implementation
 related to atomic_exec"
Message-ID: <1d946d1c-1626-33ed-26ba-f840729d63e7@gmail.com>
Date: Wed, 14 Apr 2021 10:51:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABb+yY1b9wD0hoBx=aYzpLcF-=EEG4QTrV68sZj8+rtf5J1aJQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_015147_663783_595DE460 
X-CRM114-Status: GOOD (  17.92  )
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



On 12/04/2021 17:29, Jassi Brar wrote:
> On Mon, Apr 12, 2021 at 6:18 AM Yongqiang Niu
> <yongqiang.niu@mediatek.com> wrote:
>>
>> This series base linux 5.12-rc2
>> these patches will cause home ui flick when cursor moved,
>> there is no fix solution yet, revert these patches first.
>>
>> change since v1:
>> add mtk-gce.txt and dts modification
>>
>> Yongqiang Niu (5):
>>   Revert "drm/mediatek: Make sure previous message done or be aborted
>>     before send"
>>   Revert "mailbox: mediatek: remove implementation related to
>>     atomic_exec"
>>   Revert "dt-bindings: mailbox: mtk-gce: fix incorrect mbox-cells value"
>>   Revert "arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells
>>     value"
>>   arm64: dts: mediatek: mt8183: add gce information for mmsys
>>
>>  .../devicetree/bindings/mailbox/mtk-gce.txt        |  2 +-
>>  arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  5 +-
>>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  1 -
>>  drivers/mailbox/mtk-cmdq-mailbox.c                 | 80 +++++++++++++++++++---
>>  4 files changed, 76 insertions(+), 12 deletions(-)
>>
> Please break the patchsets (this and the other 3) into mailbox only
> and platform specific ones.
> Also, it would help if there are some acked/reviewed by some mtk folks
> especially when reverting patches.
> 

I'd prefer to have DT and mailbox patches together as otherwise the burden on me
to find out which patches in the driver are needed, and to check if these got
accepted, gets higher.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
