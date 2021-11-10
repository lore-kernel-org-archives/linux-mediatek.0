Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:31:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A39B16115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A39B16115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NlZf0TNwHiKLpLLFPTn4J0LkP2awYaSu5nCzXZSDFw=; b=tQrEn2AnFQLWr6
	aLqQsxgIwLrtWuM4NzJaewPy1kAjB23eKSakpRfmU77+NeImXJA5IzYFV4Msm0JC9Dpxy5pOvZ0yJ
	1PrY2IjeGGEkpXSSHs+bHCnpdPd1QT5uB7NYa9DmHqpjETHapbW1keQCz9NhQ2Hqw1tFlDUj0SPc4
	56j483VDLcVZPhSWOSnigCclBmK0b4QYj5CevGooTCFDeRHq26sqopOsjI/i2tzNPNgIbX73mjy/4
	otDUb9tJcLP8rKyk2Vuiq/DvVj3ZOSFm0CtSxv36qqWrUMi9v0yO/xtpMmJauq3D3WL0kDp3RxELK
	7n83mxvnhYK34Bib1jjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkkt3-0057df-5R; Wed, 10 Nov 2021 10:31:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkks8-00579i-BJ
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 10:30:30 +0000
Received: by mail-pj1-x1033.google.com with SMTP id np3so1195533pjb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BL/ijtIxlYFTdIaPRxg1NuofUxGQzYinoPWGFB9zPEs=;
 b=oon4kKhSj7merVzvPBZvRplsjLDFbY6jj7MxoEEpCv5XCaxgftMX9iQSg2wZgT5bmh
 5GSs8rWijTpI31ovFFuakG9K9AAZdhQBKS1mhPi76SPrvNr+SNCoiyCWyIrU8CSCh2YC
 ip9t6JVaopp4KmCDK4b/pAWLlCqzs36IVlHxjuyGxtMmNzUws9ccTj38yd3EviK+6dsE
 puAwS46GaQ5dzqgphAdiIf/mlSnqbrFXyBbKZmcpXOuiVC8ectlztG/GN6cOGvUCHqdV
 qmXeEnMckfRwc1Fhe/svZO5BHI75kgDk/5rOCHY+BuwjUvYMBL6gOCfLMi3NO1r31Dc9
 k4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BL/ijtIxlYFTdIaPRxg1NuofUxGQzYinoPWGFB9zPEs=;
 b=ebX7ruSnejdhk0NoRNnRuXdLwWt+qI9MX10iG985nf6vg7pGY5zKu54+x5JGLOeEVg
 M+9iXRrc+1fOgbuBA9UdT7O4v1z0HMMwAW4ZGdTDDN6ONO4WRdq0d+q7sTaBuGqcU/Kd
 ZWVm4Hyq/+kHY5fPRMGx3Ub7vF7zdqTpUzB97MDGj8xcp6SlwmAWW1kJcAlurkK/JWfY
 0NLF1fIYy2lEgXECQB6icy9TwrKp3DbkFJZ1q1h7BwNmckVA39a1ZLDSjrVVXJxFc8z+
 T6XhnW+jfce/NWKvMAJV8S1rHaqQ4fTT/asI+MZyWAm/XyQw8iqUbtnJutzrcLbKahZz
 aJwg==
X-Gm-Message-State: AOAM532xjoBDSCEl8ZXeEwa1sa1J5go3I7w8C9hjnP3vXD3VFvuEFZGx
 BFOtSc1tIwXBdf2SdhVew2FS+/Pa6B2hKmTHu0ouQQ==
X-Google-Smtp-Source: ABdhPJwVgFxj/vjgnycu/+1rEWt9aVPNT6j63gpsvXFnkemxO+5cDmd7zOvOIUlgeIO++x6gV0UCGw/o6pLmfakrEQs=
X-Received: by 2002:a17:902:7289:b0:142:805f:e2c with SMTP id
 d9-20020a170902728900b00142805f0e2cmr14242448pll.42.1636540227601; Wed, 10
 Nov 2021 02:30:27 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-6-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-6-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:30:15 +0800
Message-ID: <CA+Px+wWiFDB9rqOzsTjjXAyKF9+AfEmC4ZrnYQTCi7ePuCUGXg@mail.gmail.com>
Subject: Re: [PATCH v9, 05/19] media: mtk-vcodec: Support MT8192
To: Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_023028_416841_7884333E 
X-CRM114-Status: UNSURE (   7.25  )
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

On Tue, Nov 09, 2021 at 08:50:16PM +0800, Yunfei Dong wrote:
> Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".

The patch adds a new compatible string.  A separate dt-bindings patch is needed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
