Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3838DC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 17:02:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D65A61159
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 17:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D65A61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MNi3HuJWrlg0XFppQOH2X4GAlffIj1Mx3PneMq8jWNA=; b=KsT0/TuKVi6XC6JAkBaxKvleX
	BlMLboKbPJyKY8bjSQVmMQAR7tcbvjbsPVxBu8kbq+dYANBtld0jLeZuk7YCDzqJZjlboWcFvOJNJ
	ptLsGKtusCIKwVGjXmia4eiE7YPt+UQzXAU3P1lrKnvwI3o49tyDJoRyhzvBrxlP/EzYWzrtjXFqh
	ithtpYvtSVuSEUd8stfaxJ8Dfd/IDALCbcNiMwhETEZw3/A3LZY5QIs1PxI6jQQwN8vodJpvc6SRl
	oPn05Zywkss/R/NQ4dS3xiQyUQ+J3lF6a2UuJtuQEJimqunY1B8MqEVBCucfivGiB6YrE4fBQNJKO
	1oVjfFqqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgVlX-000r9z-26; Tue, 11 May 2021 17:01:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVkh-000qzU-Cl; Tue, 11 May 2021 17:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fmFyHNnUFHNuAVxbIzn7lHV9kvhWQzN1eSc9Pbf0XcQ=; b=hw5excp9opXfRXAg39nccJbgrA
 1EUc03Rx4LxmAv4K/d9TR6RdudyOJDX08Gxz2eO0hyigIhMX6mrWA6lv7Gv208lDHIQ5VRIHeNlj1
 zKPcpLwJfgsHU5krehjM2cqa794Prj6oFshbR9GYP3nUJdHHgfruKR0FxCg0pGztJoXTW6PfS+l/Z
 8ZOlU99RE3DK65wYOFUI89CHdgpoHa9MNmMwAFAJtLEzAjfDAu6+YyT1ZxlXDUuUeQvZCX9UnsQbS
 xZab/UAK2sh9psi0J6MMHWcd5yUge9tOEYF4DP/RxLBN8u3k+9qfloSdxg7ki1t94whYYnru3Naek
 xYHrK5ig==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgVke-009n82-T3; Tue, 11 May 2021 17:00:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b3so11115533plg.11;
 Tue, 11 May 2021 10:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fmFyHNnUFHNuAVxbIzn7lHV9kvhWQzN1eSc9Pbf0XcQ=;
 b=myLkImHXOezSotuuATiOAEM8rI4bn/KntJijmRm0HOQeeHwV6aTGsPD7nv0BjqQoH1
 3L+W86p3VkFFKF1vCivgZ0qDY4CZ1J9P3bAUYxierHIchWRD2cjkCBTXhAgs0oZtHK8E
 f/zSe/dcSO79CEJDcjuxvyV9AGAixNGBTyGehW/EyGOmO0qoxUzxVIjKjJjsRpCsvrQ9
 IV3J4d5IfaH/91hgpUNr80AqexKcSdABwYoGz4zngIkqisK4mcn4V+nSvrjZZiEkbJ8E
 Fn4f9Ons6kvYNmL5aBZXFCVScrB4uAxETd2UTttxRQkelZq+5WueHFxRmL/wJTjHalaa
 8+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fmFyHNnUFHNuAVxbIzn7lHV9kvhWQzN1eSc9Pbf0XcQ=;
 b=hiexcr/MroujrqgyZ374BtRxD1MjBXybt+ENe6OOELX2e58IZDK5NxG96GUAjOb7mz
 z/yoEHrTR/IdtyU4sG/Hj6BpHbH8MftyPYAbG/fqkc2pG7TLi7E/Kda+r7wW0IuLrRcw
 HGdfQzo2dXoAhMG1i1gLJbmpA2Xr47hrCmmj3DpOQWAlbcdHilx8l2ae94/xfljhCZXF
 e3v+oAVkNy810H93ScHmoushBxLxvokqc3pl8WbwXpztd/6hPWTxFEaAaW5An51URqZF
 V76YBkAcMnADV3W3wIwX8uGByhAnCSjhI+keP51xt0HL7o9FDpr/kvF5Nyrm0tLwhbsE
 tK4A==
X-Gm-Message-State: AOAM530YKyKqmS3RGZfk+X1Bk+CqF7xxuhthfBjXRGNrzRuZrcHompC3
 5xmjsMobz3GtO/1wi5GeQV5qlj8WFBgZ7uXTOpg=
X-Google-Smtp-Source: ABdhPJzmu1ezMUQi6YlVmGSO8GpWvroaYz0PCIlp5rMRht3gY+s4xQHOXqACOfoh44yUmzfbgFNkExgUPr7+XNncE0c=
X-Received: by 2002:a17:902:10b:b029:ed:2b3e:beb4 with SMTP id
 11-20020a170902010bb02900ed2b3ebeb4mr31789999plb.64.1620752454532; Tue, 11
 May 2021 10:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210511113257.2094-1-rocco.yue@mediatek.com>
In-Reply-To: <20210511113257.2094-1-rocco.yue@mediatek.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Tue, 11 May 2021 10:00:43 -0700
Message-ID: <CAM_iQpVWSJ8BdRoLDX0MdiqmJn2dp+U9JM4mcfzRbVn4MZbzcg@mail.gmail.com>
Subject: Re: [PATCH][v3] rtnetlink: add rtnl_lock debug log
To: Rocco yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, 
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 LKML <linux-kernel@vger.kernel.org>, 
 Linux Kernel Network Developers <netdev@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_100056_954349_37F1F5C6 
X-CRM114-Status: GOOD (  11.42  )
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

On Tue, May 11, 2021 at 4:46 AM Rocco yue <rocco.yue@mediatek.com> wrote:
>
> From: Rocco Yue <rocco.yue@mediatek.com>
>
> We often encounter system hangs caused by certain process
> holding rtnl_lock for a long time. Even if there is a lock
> detection mechanism in Linux, it is a bit troublesome and
> affects the system performance. We hope to add a lightweight
> debugging mechanism for detecting rtnl_lock.

Any reason why this is specific to RTNL lock? To me holding
a mutex lock for a long time is problematic for any mutex.
I have seen some fs mutex being held for a long time caused
many hung tasks in the system.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
