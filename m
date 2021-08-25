Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE43C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:02:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B232261181
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B232261181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHtCbut5VfCoKyD81f+FSJJXoLnVJ2Cqo/TXJ1jKVOA=; b=l7Nrt18IpAWEsq
	32albK/QYigZdkOSFlOp8gSP257dG5xZJdia1ayEF1ld4K8si1hm9F11W9E6ctveqCuzoNELFixh2
	KdlEwKPvZiLoL2w4fRFgK0XNoLT5nTnklK64WNWC1+2sLrnghGdB3jeXDvaucNqVyP8ufiyW7wXAD
	AQ/w6GODNvL3EE/ExPf7MH7sUHdWYZfoXSQ2faEgXVFl1YYOrE6+oiz60F6eWfrRPX9MVAOvW5K3f
	g2er9bxpdgeBXr5XAD1T1MXT+OVUk/jI9ZR73kJbaTcor45ghhIX2S8itXoYaf0yoMlC0TfDxMwMi
	MDUqetgCO5NcUVSE59KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpjt-006Jw4-HU; Wed, 25 Aug 2021 10:02:33 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpja-006Jm5-7C
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 10:02:18 +0000
Received: by mail-lf1-x134.google.com with SMTP id z2so51798073lft.1
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Aug 2021 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0BLc57R1jmVv2+4BFp7I8z0ChmYrPPOFg02Jifxxp1A=;
 b=keYALr+Zc+ROEUmiXyoah2aXbhowuAA12nyjWIW8pBb4wwgY8Y4ckCZXQFl9VIUcMK
 PAF54xsMLQWU19AwOezJWM8pLKNAy60nIAtfEz/tduA92uSejOQ2lQ6B+GSTtKcso6rv
 6XvK+DCiRsEgn19MMxMDeZlJYP8upE8+Y7xpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0BLc57R1jmVv2+4BFp7I8z0ChmYrPPOFg02Jifxxp1A=;
 b=dVU92aB06q00sGcMwcBjswzGGLgaZhym2cTn77URHyP1AmTEjLFJ19Aib/dxQ0GjC6
 5nkpFsHW2ygJMyLNF2Pid1tq3+c1r4Dr2nHayB145Zf4GphiUdlKOvv2rHLLIwtj5lS3
 OUk69AlUhYgOIt6FPz/viIEdJ+TfyBsHhY+z2ouM5y4W2/ar9EVoKqzdsuyIowzBVw5J
 VRbZF+YjlsxAqoKRXypC/UrRU8Ek+FCzH8UwgM2hkJBBuP1Y79prDnL6fjuPkfjzwIw8
 Y8myudRAXfh/CYOynLLI4RVkY0LP3/ZZnSzWBiPaxbOhZpQ1F1IPRObIVMwi4PPChn2X
 93/g==
X-Gm-Message-State: AOAM532B20pnH8LVQxFrR1bt1yTU5Ka3zXm45MeN2xXaQ3+l85pl2EB+
 gM7Mz7S6LGbUpfrdj/tbqEbpPeP3uJVIfnB8Wt8Org==
X-Google-Smtp-Source: ABdhPJzKTnl3fWad8MROrCNiC1jtRvD+05kAasVUOQbRROg0Vttga1mRrsRv2jvrfGgKTaG0sLnaZ7IXx0RGNuN9rDg=
X-Received: by 2002:ac2:51dc:: with SMTP id u28mr31772178lfm.444.1629885722273; 
 Wed, 25 Aug 2021 03:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210823092353.3502-1-chun-jie.chen@mediatek.com>
 <20210823092353.3502-6-chun-jie.chen@mediatek.com>
In-Reply-To: <20210823092353.3502-6-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Aug 2021 18:01:51 +0800
Message-ID: <CAGXv+5GxzgHGo87xWbENSA=g+vRLJFbMGTw0u5bAyEc0qLT64Q@mail.gmail.com>
Subject: Re: [v4 5/5] soc: mediatek: pm-domains: Add support for mt8195
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_030214_286419_86EAB244 
X-CRM114-Status: UNSURE (   7.92  )
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

On Mon, Aug 23, 2021 at 5:26 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add domain control data including bus protection data size
> change due to more protection steps in mt8195.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
