Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA68EC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 07:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631266108D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 07:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 631266108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WH66OTpvwX5EZvaDcLqBPu3Jt9AqG4pYU708Gal0v4=; b=Va/AkV0Svx9j2Q
	ekU77hN8NO56dtvg/ast0WT6BrklWYqqvORcBWVl8/0yBDkNorX9QQcse2sGTF5ctSvyx73L6tsaC
	gNQ4Od+5R9+klk3NtY2dPjmDSvolMXfmzNUL/G1ebNZimkHYNrG0HPpgeXiA1XXenyDvWXeTcqdy5
	2pwjY2TsS1xTm8UYPD5m5x5dODCj+eJu6pWixVbeuINGwrcnkZdQiHF4ltkFjcAeYh2O2pYzV5xzt
	+aUTDmb+JbSxV+8m05Ba7EHPOJ/IswZl77y3jnM1Eh34YvInNclcDi5S+7IbfR7QDYf0Ye9UZxg29
	6TdMgFsuGO5gCHqR9P1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGGFA-004Wmy-9o; Wed, 18 Aug 2021 07:44:12 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGGEv-004Wjb-2T
 for linux-mediatek@lists.infradead.org; Wed, 18 Aug 2021 07:44:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id t9so2720990lfc.6
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 00:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Pb+i4XV4pD9hHVrCfu2OguYuvXddQz4i1EZeyLXlSA=;
 b=gU6KmWZ2VTtGU6MiqbJsuaCgeM+rsgd3JJa00KF9rgd6K9cenC2G4J0H6wZB5SCAqf
 6Bo7La+IoqM78I2iW9kvnfoDUEdChf27ygxHLn8lkctJjJ2XKY28XcqOepRC3GrG/Iv9
 cU1jo2AKfe+0ty10qvt5sCVfPTdG5UopO0ZaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Pb+i4XV4pD9hHVrCfu2OguYuvXddQz4i1EZeyLXlSA=;
 b=SlId82rcWR/LuwNc2Dqbuc/rmZ7Ah7atwZHTFFbt+P4FS4z96RbH7ULd9RaYWYkxPV
 E+wPmYbMb9ox62H//Z20WiJOK0esyNW+Hm4PTmWcvm8OJzxKwEWQ7Jx6b1svvE8Yht6k
 xjWQFEARle3DLoE+4qDz60YzircoebT0XsZ32/jmHM0YWtlnLH328LYRp7acFaKG4zFL
 akPFEe5nc9uYSES+GVb5P3SckWHnHwq8oyMQawM7RU4W934KXjxLdqmyQVwZ/cg9dxG7
 jlrJln9aTAWVaN8L6u1sYS89OAkBJF3T7M8PCY+HZj5xEpb859BPJn6FI820qcuEptyg
 7RyQ==
X-Gm-Message-State: AOAM530A+QJudVEgcFDLcjNKVqPlOEWRVsqpPqOldSlmIMB2rukzNgu+
 8AEL5tWc5Ne28EamB3bnk5CbmpLOFWtoDA==
X-Google-Smtp-Source: ABdhPJw5R3diGOYwOGCpPyqkiOatrDogT7IPv/6drw1VS5cWbx9rbkU02iIaJvjbNilsyXzL5durAQ==
X-Received: by 2002:a19:a40b:: with SMTP id q11mr5627688lfc.541.1629272632675; 
 Wed, 18 Aug 2021 00:43:52 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id m28sm489273ljc.46.2021.08.18.00.43.50
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 00:43:51 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id z2so2784411lft.1
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Aug 2021 00:43:50 -0700 (PDT)
X-Received: by 2002:a19:2d4e:: with SMTP id t14mr5421824lft.30.1629272630297; 
 Wed, 18 Aug 2021 00:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.7.I2049e180dca12e0d1b3178bfc7292dcf9e05ac28@changeid>
 <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
In-Reply-To: <bf98c5ee749bca755bd46832f858536dbf51a2a4.camel@mediatek.com>
From: Eizan Miyamoto <eizan@chromium.org>
Date: Wed, 18 Aug 2021 17:43:33 +1000
X-Gmail-Original-Message-ID: <CAOak1e-oyzxbvHimMReQpZCAPyCtAsaGixjwmoa0EzMjqaUxVg@mail.gmail.com>
Message-ID: <CAOak1e-oyzxbvHimMReQpZCAPyCtAsaGixjwmoa0EzMjqaUxVg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210818_004357_127904_A5CC1B95 
X-CRM114-Status: GOOD (  16.82  )
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

On Mon, Aug 16, 2021 at 1:00 PM houlong wei <houlong.wei@mediatek.com> wrote:
> Hi Eizan,
>
> "mdp-rdma0" may be not the only one master device node. In fact, there
> are 2 "mdp-rdma" in mt8173. You can see "mdp_rdma1" via below link.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm64/boot/dts/mediatek/mt8173.dtsi?h=v5.13.11#n1016
> If we add "mediatek,mt8173-mdp" to "mdp_rdma1" like below, we will have
> one more V4L2 video devie node.
>
>                 mdp_rdma1: rdma@14002000 {
>                         compatible = "mediatek,mt8173-mdp-rdma",
>                                      "mediatek,mt8173-mdp";
>                         ...
>                 }
>
> We should consider the case that there are more than one "MDP_RDMA"
> components.

Would it be okay with you if we added support for multiple MDP master
device nodes in follow-up changes? My rationale is this:
- As far as I can tell, the mediatek integration with V4L2 currently
only handles a single MDP master device node. It's not clear to me the
scope of changes that will be needed to make things work properly with
multiple nodes.
- The patch series makes video decode work (admittedly, in light of
your comments not optimally) upstream, which is better than not
landing these changes at all.

I'd like to say that I'm very open to (and excited about) discussing
further work to support multiple MDP master nodes, perhaps we can
work together on this so I can understand what needs to be done.

Please let me know your thoughts,

Eizan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
