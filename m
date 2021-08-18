Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B3EC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 07:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7FCF6109F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 07:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7FCF6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+VkFbBHP7IZo8PFo756C2Ps5egU4LtKPHFC0rjjJunQ=; b=4VkdFoiYuYceL3
	SDoimg+QyZPN6qjeqF4Z+vVRxNQA1eGvQiajgJDid+QwwsiTGep5lvqWimS7SoW3Q1yuB8WxMskgK
	H/jYaQh33KNGIXhEJ/50MCYyYycQcHAk7MrRxvQPpz5evTzhlj/dTwXXT8YZT0bGmR98EQDE0+ZSt
	89ej40JoNJHV/2h1P+DrnYLNjk5zqP9FNq6JiUx38hIhAlKgW+ILqvigQI7zkBmKixXYZmTR7dneS
	QcxEq+OnB0Q67NusDH0+cTOqMoW3V+aCimtJnFcq5rOzma7itPxAMVvN+/htVEWzAALiDdH+nbabq
	xjY8jYtYAbhwZwiAPnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGGM1-004XkW-R7; Wed, 18 Aug 2021 07:51:17 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGGLk-004Xfc-GJ
 for linux-mediatek@lists.infradead.org; Wed, 18 Aug 2021 07:51:04 +0000
Received: by mail-lj1-x22c.google.com with SMTP id x7so3398977ljn.10
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 00:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iel16lsj6RMRR46Er5XdYCOwg9LzHhn4KhXWnbYd6I8=;
 b=Z6UL4g1ShVuS90FHgfgXoDI0ewpCEgBdf/rZjBW7xBbfy2iaS+ch/kpFLuCG76wgsg
 XjzJywFmHZyLb/7h1BhV8W++8I6HRHNqOXU1z09Ff1N1nsKiRPXfUPFbtuK5EegZ3NNL
 qUHLFEliYdrejtMHhNSu19/d3oLe737Y9Z0JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iel16lsj6RMRR46Er5XdYCOwg9LzHhn4KhXWnbYd6I8=;
 b=pdLY8e6PvGxulVZv84vov6e3vNiVtcgDxRWu5dkJjfTapVrBq7foPtPpKLAZNTA0BP
 cW5H/pnNBUwoJ292J925ksnHvCb20E/3HVRaAWvQFySue5zyMvMWnkcDeTHCknxkacji
 XeBV4XH6I9lj7mESmy/Ph+2RjcWOhqc3NkGjitK1FdAyuFuhmWmLBuvg2EviwwoiIdga
 lgMy6sJ7ruiMfFrrKfpXsnHTVRhTrdcRGj7xVHm1DwcQpi5kxZHnCA7qso0LLlhTlSzI
 u9Xku0c5UMmYVNsl3tRr56ni6pJBUwlL0iGIzKXl57he2Nz5qmpDgCMklV2/+YF0UQtp
 GI/A==
X-Gm-Message-State: AOAM533Z0rrEEiZyIEvOHcHLlGhuolu7GR06MLZ+sqBFiqIvPU6vbKmJ
 uVJfAyIRs+tUDI1EuA/Xe4rijUjj93N2aA==
X-Google-Smtp-Source: ABdhPJxQlRyDaWi3nDkFoficFzjuTIvX9nEUXytkGsukA1sgtQDcpUfAd2qDo2KbZpXP+TMuRRIWzQ==
X-Received: by 2002:a2e:9f51:: with SMTP id v17mr133134ljk.130.1629273058508; 
 Wed, 18 Aug 2021 00:50:58 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com.
 [209.85.208.177])
 by smtp.gmail.com with ESMTPSA id f23sm422346lfc.28.2021.08.18.00.50.57
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 00:50:57 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id y6so3476666lje.2
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 00:50:57 -0700 (PDT)
X-Received: by 2002:a2e:b0e8:: with SMTP id h8mr6695165ljl.189.1629273056836; 
 Wed, 18 Aug 2021 00:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
 <9f23beea197495d017a548ef483584714a3673f9.camel@mediatek.com>
In-Reply-To: <9f23beea197495d017a548ef483584714a3673f9.camel@mediatek.com>
From: Eizan Miyamoto <eizan@chromium.org>
Date: Wed, 18 Aug 2021 17:50:39 +1000
X-Gmail-Original-Message-ID: <CAOak1e924x8E+kM2WJ3oGPxxt_R=b79BtbxPAdENamvjVamnEw@mail.gmail.com>
Message-ID: <CAOak1e924x8E+kM2WJ3oGPxxt_R=b79BtbxPAdENamvjVamnEw@mail.gmail.com>
Subject: Re: [PATCH v6 7/9] media: mtk-mdp: use mdp-rdma0 alias to point to
 MDP master
To: houlong wei <houlong.wei@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wenst@chromium.org" <wenst@chromium.org>, 
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <yong.wu@mediatek.com>, 
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 =?UTF-8?B?TWluZ2hzaXUgVHNhaSAo6JSh5piO5L+uKQ==?= <minghsiu.tsai@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_005100_574415_7C1A52A3 
X-CRM114-Status: GOOD (  15.77  )
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

Hi Houlong,

Thank you for your review on this series, it is much appreciated.

On Mon, Aug 16, 2021 at 2:53 PM houlong wei <houlong.wei@mediatek.com> wrote:
> Is your removing "mediatek,vpu" necessary for this series "Refactor MTK
> MDP driver into core/components" ?

Removing it is not strictly necessary for the series to function, I
will re-upload the series and omit the following changes:
- [PATCH v6 8/9] dts: mtk-mdp: remove mediatek,vpu property from
primary MDP device
- [PATCH v6 9/9] dt-bindings: mediatek: remove vpu requirement from mtk-mdp

Do please let me know if you meant something different.

Thanks,

Eizan




>
> In some MediaTek projects (not upstream yet), the device-tree node name
> "vpu" may be changed to something like "vpu0", "vpu1" or other name,
> which depends on the implementation of "mtk-vpu" driver. We can specify
> the different phandle to "mediatek,vpu" in .dtsi file. If we use
> of_find_node_by_name() to get the vpu_node, we have to modify the name
> string in different project.
> If the answer of my previous questions is "No", I prefer to slow down
> the modification of removing "mediatek,vpu".
>
> Sorry for late reply.
>
> Regards,
> Houlong

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
