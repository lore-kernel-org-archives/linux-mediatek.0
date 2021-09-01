Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7146DC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 06:40:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1658361008
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 06:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1658361008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8ktSOjiASLJ0UoL39NFJaZd1of9PAhEBKNJztbSbXg=; b=d8ysruduN6wW0Q
	3WjxK3yBR3bdI0hhU0tKorC3s0Eq7nZWs4Sf1bpoupR4nt/+/1KZfk5A7IkcEkpoZwOztAjqW7Hzj
	2/DiufHuOx8BpxcQj2ksBTi6ndkiddIztjOWXvwKAb1ijGn4TmMMcTyuBqlNtCEn29V6wgl5HpJ61
	qQDecxLWuxBF+YQ8IdkqCsbzZkIsLJJQf/HzlxwxDjccYkpjTfZhg4ZLmJCxRtK5C7jtUz9On4Whg
	+751utsFnELW4+ymf74Oc5MkEqURgaHkxAykojjQcWG6Xly/PxktCZozBQ5EVttOipwxC3zIeqozP
	Lrv8x+Lh9lZuL9xsgLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLJvO-004CJo-3w; Wed, 01 Sep 2021 06:40:42 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLJvI-004CHA-6N
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 06:40:40 +0000
Received: by mail-lj1-x22e.google.com with SMTP id s3so3018228ljp.11
 for <linux-mediatek@lists.infradead.org>; Tue, 31 Aug 2021 23:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=epJdN4f3MfJWPEsQ1/2NvR+leSyxvmf6Ol/q7Sv91t8=;
 b=mRVlvuMlRKfisqKuC3luRtD+7lHZt9EoAXjdWbTWH6cNuQQC6mg1w29lzT09vielVb
 I2Obog5PZudIXYal36CZLEgxg9Fw4Ix5JiTMy8r1Hwukl5bZ6CPXUGdD7YGLZoaLdSu/
 8Iki5swJ0F1Lhp74MeQCyy+v58G/u1o7jLxgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=epJdN4f3MfJWPEsQ1/2NvR+leSyxvmf6Ol/q7Sv91t8=;
 b=uWBUfFOB7YUZj9jN6TaA+t0E25CspCmgxjJ9ZTVdRWrmAfLrxqid7tdw1ASkFwLtLa
 JY9D29UsUVtZJho5PKn8jSoro0Ne8w9q1UdQGssRmm/Mpm5HHdaWH0gsZq0bVmshs5IR
 ZhK4DbV8G+XUgKt/ldTLxt4+HeFGYQFQmAC6BO2Wlb0o1nfurAoorp6n99x4g7JYT5VJ
 H+GGRwMa7WavtLtBsLhYNIr9hv8MoDuCG0UsDTWlbQw2RGwRj5qVFAf33hKGNh82MiDg
 F2+Lu1GeOixPoznU4Ri2JHnGzd3Q87cGfb9UEGEm/QqPJbsiDGLXmoKagbR762hGFj1B
 xh5g==
X-Gm-Message-State: AOAM532hqkTk6nlZIR3a0fauiL6iDLDFGzC57WwmjxdOVgRbmxCzAPQZ
 kLDWsT1qNnWQuXzHhNEc7lgYRAEYkZGQBJebLSEM+A==
X-Google-Smtp-Source: ABdhPJxj9wv3Q6Dl3qKpne3tkDBgA3ZLpglT9zE4jEZ+fPT/uXAvjzBpHCDwCs+0syRRHL3naD7W0r8tTExh0x6HsH0=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr27468860ljl.23.1630478434422; 
 Tue, 31 Aug 2021 23:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <1627890365-22992-1-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1627890365-22992-1-git-send-email-yongqiang.niu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Sep 2021 14:40:23 +0800
Message-ID: <CAGXv+5GNbx6jJ2MuCtmMF=ABuoqtS84OvhYoGr_nOrwqCs392A@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] support gce on mt8192 platform
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_234036_288279_2EAAC5C8 
X-CRM114-Status: GOOD (  11.49  )
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

On Mon, Aug 2, 2021 at 3:47 PM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> Change since v5:
> -rebase on linux 5.14-rc1
>
> Yongqiang Niu (3):
>   dt-binding: gce: add gce header file for mt8192
>   arm64: dts: mt8192: add gce node
>   mailbox: cmdq: add mt8192 support

Looks like all the driver parts are in -next, but the dts patch is not.
Can you resend that patch after the merge window?

Thanks
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
