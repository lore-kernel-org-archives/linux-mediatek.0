Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE8FC48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 05:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1E26113C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 05:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1E26113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E48s7vXhX76kaq7tKUgTZi3rNmnH/8K5gsaOvAcAI94=; b=LoWC95k91YVz1J
	0F/bQsDLqbeImw6H+YRRLAzOObXYC5W9SkqVpdCsgZt3kC3yugXhfLMOerS60YSn8OuTnNPJMZQCH
	Lla+uliscHLsL14lBFPMOgWLHJxgVIG046S/sIHxuGOVp9aTtbhCWOiF+FZsYIr+SxDeB8zs49wOJ
	x4AVYrwcsMHDazlYCdH5Prbl/HE2yb8qbU2Hpr5wvY1WL9gTfFPG0WKxykluKTubKf1U1RDTSYyCw
	KHx1e/bua8LEQ++X13S8vgkxpVI0vivc8i0sxrcfLoqwy+XwyWXMQtPaL35vbZG6Wt5wbB6WufF9L
	hwlTe6T7cu8HUEQELTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvCru-002FIK-VX; Mon, 21 Jun 2021 05:53:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvCri-002FGp-0n
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 05:52:59 +0000
Received: by mail-lf1-x12b.google.com with SMTP id a11so15080704lfg.11
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Jun 2021 22:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qvVLIkjY2BI+dv8+oCzZLh2KWK9nzy5kALZ0tBgTgmM=;
 b=OWh41pBG1J4S+aLNqN8FY1vGAKOVV0q8cLx0SnuOQVGkqNsSOZ83FJ5fuLi+ubVelR
 4WkFpbVlmdmn0DH11aP6ooZZE+k/uzmghMpqCwLH+nhYm/DkPSncwuOs+wOqujw4LSH/
 BzhX8IumdS4THN9ErkgjjNxMbBAMHrliXysss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qvVLIkjY2BI+dv8+oCzZLh2KWK9nzy5kALZ0tBgTgmM=;
 b=sSh/+LV4l4fdx+4zU41LRlymIN2PJTLXugOvuwlnYdqZEZffa+HWaf+wSSVxJ5uBb/
 YHcrbPSju/eksmRcqvJR63QTA+YJoTijsUKsh7mbOQJI/1/g42/fjbO0EpP1UDRSlgpP
 gIR5SqLvSDShOepW1Bl6eTFd/Bdeps4LQwdUK20+5MGiEJtKhubzEjQdqzwLfgOMTaVt
 sTgySS8zy1I9aG1HD+sXeEgp3n5EFf5iK+bDypXWukHMoXxK8vjYwFGvvaJb5c648nVY
 srmPFBd+vjbl/oIy3VgHbhg4TgKj10x0QgjHIZVNWS/9/TvXD1I7LNYj+NYnkF/BKkBa
 OoEg==
X-Gm-Message-State: AOAM531fmYShvQQ9DQPXZzBQ5oM7f7vYlZ6OlDo2HOi4++xVTQgFfOe/
 TEAZgnpIvhZU97A8dxBlsLFhYd1ID1vgodWvbB4gxw==
X-Google-Smtp-Source: ABdhPJxAPpJQjlpnjyn3YLrmWUJot6rk04KH2QgEsE4DP+8OOfnqFG1fFvwljBtxFszUAT/f7w1dADXRAMG6cRn/VGo=
X-Received: by 2002:a19:488e:: with SMTP id
 v136mr12811091lfa.647.1624254775065; 
 Sun, 20 Jun 2021 22:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210617133229.1497-1-angkery@163.com>
In-Reply-To: <20210617133229.1497-1-angkery@163.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Jun 2021 13:52:44 +0800
Message-ID: <CAGXv+5Eb7oJ2db41K2vvSN84uAg-V5SjthnvCuuF7H7SfE1aaQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mediatek: Return the correct errno code
To: angkery <angkery@163.com>
Cc: sean.wang@mediatek.com, vkoul@kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Junlin Yang <yangjunlin@yulong.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_225258_126382_4874ADD4 
X-CRM114-Status: UNSURE (   7.33  )
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

On Thu, Jun 17, 2021 at 9:35 PM angkery <angkery@163.com> wrote:
>
> From: Junlin Yang <yangjunlin@yulong.com>
>
> When devm_kzalloc failed, should return ENOMEM rather than ENODEV.
>
> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>

Please add proper fixes tags:

Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
