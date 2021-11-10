Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81996C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:30:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 527296115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 10:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 527296115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+Q3No9KgvvzfHvFGnIdQImeEpIzdKxmOggR4GvxoT8=; b=GnYokZ2OfCyVV6
	TWgPIlcBfQcSZVoWCo/+/LvUp2onLlAWxv5FS1wZODtoUoLESsTmJ0LGeQmyEEdh3+jnJaO6v1hDK
	cNgCgabyADBklJrhUch4b970SWH1VtZzYWxntT8FaS8tT12+I9G6mC1AKpv1fEHVqLpN9SUXCrvx3
	AIHXBO8BTIY9X1+YGJHy4ZierDfu1QozzRGnMfj9GFlE1dgjEtLw8fnUke2XHh9qysXftvu1iD8Nv
	GnyAu3Mt/2hfTFDRtOpEOkZT13QIjFqXqFDVMrx/cDo16VTqm2cA5OGRDruL47W1cAGCJI0Q4I/1r
	7zKOjZ8HSjcqNd63E7aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkksI-0057FP-4B; Wed, 10 Nov 2021 10:30:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkkrz-00573L-AK
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 10:30:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id u11so2652683plf.3
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Nov 2021 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/H97nPqB7O+Ha49bdQqeIeu5pMRHp/3DE9p9icaUgqM=;
 b=PUuEyw9XBots469I4b/mSNfuAjfpd7qQMzH59EqV6M8zrGuW5q/CfOy/XJM/r7hsaF
 ndro4ZRi2k2UFXbYR7Y2TD+wsPKHpZaqWMHSaQC5u0vRq/R4W4M75LnQ6wwHqTSRhgjA
 gNhSq0Dc8jWZWpqCIgVAsX8h+/O3mbrRqDeGIUv2lwZ2U3bRdIAyjPOH7bVnTrFrFM5/
 FjN72YqxEMlv/SAj8JL4+P+sZFmb9ZhnqE0y/Dg5uFA/hcBKG1196tdQW2bAJXYHe/fz
 wZWqGkamOre8skZ1KLmAgmEvyTB8aiEzTVhVd5dmXMR4WSLYYi9i0jUTIq125egaczwZ
 gM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/H97nPqB7O+Ha49bdQqeIeu5pMRHp/3DE9p9icaUgqM=;
 b=27k/YmOM1g9i6LjPboDnTNvZLp//rd0mH/zVMuKK8tZkgm1/Fa0T4EzKC5jEF8MwII
 hbRWT6wCFD5KMAlK6mgkNO4H8ZG/xKHdELh2vreyUVgC9lS6ps4QUZg9pqdED5hi/9BP
 Jcs0hrNhjnSJGrHoRBwq6gyWA75POab0NAkyKQwy1W5TF6xzLWhQR/d6bpHy2hEeLBYz
 c9HNdJ+0ZfZcSZq/ChS2rvFlbNbrF/N+KZ0gnhSyi4D+iu58uN8jjbvd2kKphi3omYHf
 pSQNOe0BMSLxrQPLTgQjUdzpk7fZVosUX1pnS+8t25V7dY68H6AykyzNW4eDCYVXw0OB
 k7HA==
X-Gm-Message-State: AOAM532IcvlLjVypB20IX9hqmVaksVhHFq8kkhc4bInCuEe59iCAAZB3
 L44rmTgUcRTsrQftAIg2Guq/2xt+ovu8k8UhxzU+vA==
X-Google-Smtp-Source: ABdhPJz1qeQBdRPNXYe0xOwKF+EIkcWuZ9iABV9TtnSScZMDJCzYb6hg0DTj4FGiTtJpUHr1yfmX7QThpigva/yBGZE=
X-Received: by 2002:a17:90b:4ac1:: with SMTP id
 mh1mr15543616pjb.30.1636540217454; 
 Wed, 10 Nov 2021 02:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com>
 <20211109125030.26299-5-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-5-yunfei.dong@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 10 Nov 2021 18:30:06 +0800
Message-ID: <CA+Px+wU6iwjisS1_Mdxdt6eb4pjLQp_Z16bA_ewEhCe80worKw@mail.gmail.com>
Subject: Re: [PATCH v9,
 04/19] media: mtk-vcodec: Build decoder pm file as module
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
X-CRM114-CacheID: sfid-20211110_023019_373096_A6D95BFF 
X-CRM114-Status: UNSURE (   8.95  )
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

On Tue, Nov 09, 2021 at 08:50:15PM +0800, Yunfei Dong wrote:
> Need to build decoder pm file as module for main device
> and subdev use the same pm interface.

Why does it need to be a module?  Could you provide more explanation
in the commit message?  For example, any compile errors under some
circumstances?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
