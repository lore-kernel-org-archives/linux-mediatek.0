Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7B0C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 23:52:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A062C6108E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 23:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A062C6108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IhHieMbqwuq1iAJVceXF+DObI99yYdkqk/qyC5VQAGg=; b=o1eGVJp6ds9hwoo9JMVdablF1
	7vaR4ylOyTSsRA1wRfQhRhDep/5fkJ/amysXKLyxrrdQV11hfCJsG6KM4CR3kN/WWLJZW7YgJuH4t
	0JasFcpPzLvWm5eySo66kYqW3LFjrxGIu80kZLY6b/D4RH2kkZw7ZyNS7T2n6gHPMIxUjDc9rfk7m
	Epu20bFzjiyovcxOCoWiIYjcxLoezSqeJyZCh7kgQCWrUZBCWlc+X0wWBxjYlmGdnEVOy41GWWWhv
	0Ni/tap68HcKB3PWQaLwJkK8Bic72whltjW+hitWUOnaLnxe7OZYWWZVQoKKUH5hBO9xTYYQu0UwD
	0VdtC7Lbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZMdZ-00FPXt-9j; Wed, 21 Apr 2021 23:52:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZMdX-00FPXb-B0
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 23:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Ivm6d4yVpz6wxqjoIxuxTg+SZhzN2ypG6TV5x80NnpM=; b=dg0m5WIjj9Kvclwh/2v2/Uo7Lq
 i0QDKhpDMFjH75Kath9MMBbLm/ajFjpnc+8rFX7YXQ1WoVGW55XH1z0U+PrBH+60LZomTedPTaC1w
 OLQoeaxV87pLk/WASelmCUfZPCtkMgaOeISEaIX6NvxwUNLu4P4Uo6rSd5jNInHEBVO8bX9Qel0dK
 xZFoQwxlvX2GUoGZ3Wt9Ltce7Y8vmuOGbq1SP6r9P1cqpJmx7m8G8H5NxzLUgmG5MQFIIeaZ58Ljw
 YlX4Ts3uPzFcGlFmKtIE8C95ZqZkA+uEkOGkX0yIuOTawm+Zk1Ff+TFACI3FqSjhZUgMGXR2steL7
 04NEmINw==;
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZMdU-00DGis-Fk
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 23:52:01 +0000
Received: by mail-lf1-x130.google.com with SMTP id x19so38949663lfa.2
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 16:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ivm6d4yVpz6wxqjoIxuxTg+SZhzN2ypG6TV5x80NnpM=;
 b=DMh7vheT5U1OIJur0PPhjCgM5nHDbuRtZKTMCNh6pCVV/J78UexrPAVn4kb7MOmtb8
 y72p4UVqo2EvCb/8KvfKprlcCXhGSXAvbqhHFAZxR04ya4nND/c6UPgyI8akLLD/IiR8
 GSxdbH9qipxY385l2TH39BZEORzRoDmUEyMqRzjgR9C68+3t1CocgMMpsBQxysF7hqK2
 Ug93Viu9Z+pAyWthIYb8MTYJvpIVXaxHpmHfO9eAXsTdw3ozXYDSPLMDHbqD32dnA0mM
 5Dye7puk3hpfFX1WvYz+oP/T3eFQ4+6tVEhASy0gssXbgMl1w76gEUfHyTTx5kVE6XHs
 6X2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ivm6d4yVpz6wxqjoIxuxTg+SZhzN2ypG6TV5x80NnpM=;
 b=RvRkQXrgbuSn5eAFixi/y+cG4nPbj6Ifadq0d4oVcNMLFm69XvqYSLfyE/S5Z1yWYK
 tL/1OlBh0wTb33aJQZbtVE5Xfogh6PYy/weAM6HIftvmWKprHkpNfrjvSE2usu4zqq1Y
 GFojQBHULTNhetDOKluY0lD7mF5dXeczS5ovrYRl5eFOFFYCYYoHDVDVCOMpfvb2gTiu
 3DAmTzl6XQcmLEzFroMzoNggqmfjUtRYoYns8ZsSs4Tx+KO3VM8yFPN0uoMMyjFmZb1J
 cnHcWuG6F0OwWjFU1p7WIXRxtxuMZg03QDYsbigLiolD3amqiatLA2hNfZDBu6Ix4ktT
 u0Lg==
X-Gm-Message-State: AOAM532rhtMAiJBJrv9Dz6MgdJ3crQmWg+ujTolXFcqGu8duXVDk59QC
 VmPvqjeSowqsFE635mBZKTqk0EXuS0kG64L0dKrlyA==
X-Google-Smtp-Source: ABdhPJzmJ0hXWQ9N9xQDOb/L2pSUh6o4Gu0ot0hyFhyWuTkhNKTzHl5RCW2okpKn6wl9vvF5CUOg2K8gHMnzBbiHjpw=
X-Received: by 2002:a05:6512:22d3:: with SMTP id
 g19mr469471lfu.291.1619049118562; 
 Wed, 21 Apr 2021 16:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
In-Reply-To: <20210413055702.27535-1-zhiyong.tao@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Apr 2021 01:51:46 +0200
Message-ID: <CACRpkdYtjG3LbcMiHmODggWRecSWGSm34vpEtti9x9SKdV9_BA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Mediatek pinctrl patch on mt8195
To: Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
 srv_heupstream@mediatek.com, hui.liu@mediatek.com, 
 huang eddie <eddie.huang@mediatek.com>, jg_poxu@mediatek.com, 
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, seiya.wang@mediatek.com, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_165200_582250_EA498E28 
X-CRM114-Status: GOOD (  10.24  )
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

On Tue, Apr 13, 2021 at 7:57 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:

> This series includes 4 patches:
> 1.add pinctrl file and inding document on mt8195.
> 2.add pinctrl driver on MT8195.
> 3.add pinctrl drive for I2C related pins on MT8195.
> 4.add pinctrl rsel setting on MT8195.
>
> Changes in patch v4:

Patches 1, 2 & 3 applied!

Now you only need to resend patch 4.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
