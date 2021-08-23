Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFC5C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:43:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BB3561354
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6BB3561354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TY7bOiCOOACmLuwc2/JJ8R37fU4VX17S+n3jJSZTUOw=; b=1ET4OIZz3zaD54
	RGdUFUPdTxlcri28+z2C6Ze/SkfNaQjF0EEFHvWiDL76mNoTfcl7VDasrGHOuNsFLePelTjyzjsLk
	Mtpa7Yk8KTDFE1gqhb4E6GoopQ63sSV6ZyTuNsonpE8y9Ceb52UBNNgh8zCmGNB+l2JnxOspRlZDW
	FPvo4Ravv5sJNh/jUzO6nFHy1fbDfmTTuVZek1Fc25gEzl8pvglljjUNFlSz0D9/cceNfmtXzBRoG
	vsJfYS+i3CbCriFprAdo8PUGAMNqpEaPtk9ssFAscNJqwWU/oeAPhjvU5KktrPItd0FNBnWrJUMEX
	tfYCKu7tL1LmseMfWAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI0s4-00FLbS-OG; Mon, 23 Aug 2021 03:43:36 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI0rz-00FLb2-LQ
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 03:43:35 +0000
Received: by mail-lj1-x22b.google.com with SMTP id h9so28932527ljq.8
 for <linux-mediatek@lists.infradead.org>; Sun, 22 Aug 2021 20:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u+kO8cACxV1hGUhU+uZ+UzjwiVeQ01EgXhWkMN0cp4k=;
 b=a5EJWuZ1xp1wIGP7MaODC/tnvLrkP9EJPGZdGRmmeHVM9weNjGqYvAI3nwEz3VPLda
 x+UJsasKWuCXrwbvoCuImod9s3wBo1XJJICCnXcQxGhtlpsj/BlDt0JsuLh/sK0PZeH5
 2g5xn284wUjaDgyRKotQIolWTu1qvXrGxCjUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u+kO8cACxV1hGUhU+uZ+UzjwiVeQ01EgXhWkMN0cp4k=;
 b=jpBMx5XLnZdYd9ef9CMQ1A0V13w6Et2c0xMsY5sBVH1FuesL8vfLghQc098/GKZItv
 F0gsgX6khENu3pGygtz5A1WrugtKfGxJC/2T0n/tGqILyoUG9Gri3W1x0yMkIBJW0m/h
 XLZEipnzcExsmRQYPsXep4Vx2RNnCrZ99hTyrrFB5lGCcfKmj1ZqHc2K9Gh9v/KEDDPQ
 Eav/mD3HElzZnyA2ZUWU4DphA7Vtq1PnjIbOJi5VyqU/O0SCiLRAhleI9bgd0ATilqJO
 B3Mn29sRW6sG5Uo9b96PejFJJSHrTjSY6b1fmpYw2cV+FD6zNG3P/SAQT8ULjD4aaCn/
 eAWQ==
X-Gm-Message-State: AOAM532I7yL2bT3BDUk49JmlFgn8m7giYj7xU2dIUVQiSnPddz0GYjxw
 q22gR12G3mMkbz7vkQ9V3Kv0U8LU7iQ0JEZ2LjvfZQ==
X-Google-Smtp-Source: ABdhPJynIguZSKYAjluYqnNxeBU/MBr3PM4KE0nI1vXFNbRZPTwNnZY6dfxflnnSmS77TpNiGlbeDMGchMc6oxzS+bQ=
X-Received: by 2002:a05:651c:1785:: with SMTP id
 bn5mr26594332ljb.18.1629690208875; 
 Sun, 22 Aug 2021 20:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <9c71befbdf8a97f72f4538c39a71041ccffbaf83.1629685207.git.objelf@gmail.com>
In-Reply-To: <9c71befbdf8a97f72f4538c39a71041ccffbaf83.1629685207.git.objelf@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 11:43:17 +0800
Message-ID: <CAGXv+5EYBKeDKWUbO2GWbYujwyiBg6b0=PUJENXdMGfXeGWvxA@mail.gmail.com>
Subject: Re: [PATCH] mt76: mt7921: fix the inconsistent state between bind and
 unbind
To: Sean Wang <sean.wang@mediatek.com>
Cc: nbd@nbd.name, lorenzo.bianconi@redhat.com, Soul.Huang@mediatek.com, 
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com, 
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com, 
 ch.yeh@mediatek.com, posh.sun@mediatek.com, Eric.Liang@mediatek.com, 
 Stella.Chang@mediatek.com, jemele@google.com, linux-wireless@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_204331_791896_BC44B9A7 
X-CRM114-Status: GOOD (  10.60  )
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

On Mon, Aug 23, 2021 at 10:27 AM <sean.wang@mediatek.com> wrote:
>
> From: Sean Wang <sean.wang@mediatek.com>
>
> We shouldn't put back the device into fw own state after wifi reset at
> driver unbind stage to fix the following error because that is not the
> consistent state the current driver bind stage expects.
>
> localhost ~ # echo 0000:01:00.0 > /sys/bus/pci/drivers/mt7921e/unbind
> localhost ~ # echo 0000:01:00.0 > /sys/bus/pci/drivers/mt7921e/bind
> ...
> [  481.172969] mt7921e 0000:01:00.0: ASIC revision: feed0000
> [  482.133547] mt7921e: probe of 0000:01:00.0 failed with error -110
> -bash: echo: write error: No such device
>
> Fixes: c1af184ba830 ("mt76: mt7921: fix dma hang in rmmod")
> Co-developed-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: YN Chen <YN.Chen@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
