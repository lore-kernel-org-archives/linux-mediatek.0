Return-Path: <SRS0=mrrP=63=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D77DC2D0F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 04:50:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A578206D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2020 04:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LNIClowC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VZXeZxeS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A578206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jvJDLMmLmD8Apsr6ctOOmI0OxhY9nPBQW2+Z7gV9zy8=; b=LNIClowCDron9E
	tSJN58KtGelVZ6Jxb4pbnXN5u2LLvMaI2bm5vol+kPdvZruVWI6wMxMyWLbtvqr2rw89miTIlVr5F
	Jsi8UdIxT+H/EbRxBvxkcvrjoiV+0Z0WRWZ5T36DbcUwqU3US3x9rGOcdT//+UUA8cvpAJxRYU2eA
	lWR/2L1y8w9keh+4esXYTKTc49GvIS9ZghgnjbCcTuX0iGmOK+c8OFXV/kBKeCTokWb2/a/wbw7JZ
	vCCtyFJekYPeNwqUOKem/vQq9omxfM8r5MkO4y4ICJDm9tCCvqTQdZYpxL5++abZB9miCnaslefdP
	rwmabgGep+dXA6/uf4Pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYjLD-0002y9-BO; Wed, 13 May 2020 04:49:59 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYjLB-0002xH-5Y
 for linux-mediatek@lists.infradead.org; Wed, 13 May 2020 04:49:58 +0000
Received: by mail-il1-x141.google.com with SMTP id j2so3904806ilr.5
 for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2020 21:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7avQntptbSyfVNcjEHEawGHu0ZA5SFwdwGmNt7UNNE4=;
 b=VZXeZxeSkNdl8aWyx4AKhpe+/+yWw4K1AFsNSfSLvZIPTWB9V3k7ygHClGGUvzus2W
 8Kjj1xRmgufSy5p3p5oBvoY8dwp+Ev2OJRUgQQo0Q55Br3c4Y24CxHrlhnISy8mHK51X
 xWjqOBLcJsvmosULWYiVc0Zjoq/UJildgMh+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7avQntptbSyfVNcjEHEawGHu0ZA5SFwdwGmNt7UNNE4=;
 b=LKHgYag0u/9n9cn0046IKZ6JhNVFfPU/MErXGZ/mWTVx+gQuaIbT4Rdrs3bqgNCrX/
 e/xcfOlttLWhtmlvM2pFEURdyFKSZNK7pHnLnMRQy53/QRwvbraIU7yY7XpRu9VngZAs
 K3g7KZmEdJBZutzCEDWetYk3SNFjevP8eXLQTelJpW6QGR9q5m+mdu0JLN46/KepAcO6
 ltwcmdypMdj+sUgcFElxtRVo2/GS0v+fq/seERnzgyrh6jyh4wHpZXLUfVsSjeOdYEPb
 nClakv5Q8PTysm5B7Oa27sDbV76XxC27GG+0bZ23NdMh1oS2p8W8srk4cZYaJ4dc5IM7
 BiWw==
X-Gm-Message-State: AGi0PubD9ao+fLcx5zH5sG1PPJa+OC2uj3cuuG2PCIu3DbtkEBY9f0GO
 riL4b39jeQ97MIL07yLWRE/WFE6MxiMRkZGjxKn8qg==
X-Google-Smtp-Source: APiQypLW4XrYA+YX10To7LSSFdH/pr6GwbWp+XKOzx9CNfSJM6J+CCr0iqX9Ux4YXkSF3w5tC6rtWCABka5M+lXvzeY=
X-Received: by 2002:a92:1949:: with SMTP id e9mr25726680ilm.106.1589345393815; 
 Tue, 12 May 2020 21:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200401201736.2980433-1-enric.balletbo@collabora.com>
In-Reply-To: <20200401201736.2980433-1-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 13 May 2020 12:49:27 +0800
Message-ID: <CAJMQK-hsneV5FdyTHBvLV4pxfGWC=c8mLsH_c5KSq2LsCLGEww@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] soc: mediatek: Enable mmsys driver by default if
 Mediatek arch is selected
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_214957_233650_D7B16BF8 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, matthias.bgg@kernel.org,
 CK Hu <ck.hu@mediatek.com>, Collabora Kernel ML <kernel@collabora.com>,
 linux-clk@vger.kernel.org, ulrich.hecht+renesas@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 2, 2020 at 4:17 AM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> The mmsys driver supports only MT8173 device for now, but like other system
> controllers is an important piece for other Mediatek devices. Actually
> it depends on the mt8173 clock specific driver but that dependency is
> not real as it can build without the clock driver. Instead of depends on
> a specific model, make the driver depends on the generic ARCH_MEDIATEK and
> enable by default so other Mediatek devices can start using it without
> flood the Kconfig.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
