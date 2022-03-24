Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FDDC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 23:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=878ho8FQMvIrLBNwz7oU/JJoguNY4I3uQ6KNcS+t42U=; b=JXZsR0hIj3hxM8
	dckV9qE5JrbtkFbvBqxgbt9PVUs9Jg39+f2urVLz2y1rIwBHmq78KkNdvtyJoyOgT7PYytXRjouK+
	FEz+WZPT2sa80ACl03MQb3vyd7UZR3tCduMail/weOmnCsGehXH/wmD+WmFt3l1YCVxCCcB8qs3xg
	GjE8sOKiUgmT4chgLxmkXC+jO2vXkoXtLAn5Ub+HYkSv2PzppfMzIJETI0X81e8k7Jv57Ag6V+4KY
	dPH8MH7R49ebAe7IFYwPHbXSVBjm6PNV8843jJNsSXwK0rElKZtmbczaPWgCafjJVD9dEBTbCj70m
	m0mu843HQPKUql0OV9cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXWzi-000ZRR-0p; Thu, 24 Mar 2022 23:35:54 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXWzf-000ZQj-FO
 for linux-mediatek@lists.infradead.org; Thu, 24 Mar 2022 23:35:52 +0000
Received: by mail-ej1-x630.google.com with SMTP id lr4so3775869ejb.11
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Mar 2022 16:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0o8oWeOMAEkOTxmLuclyfRnkj3vNYhXxWM1g/i8YYyw=;
 b=PyGnV6IKjC3aOySkg5s9HM2x1RHndWLLDdlwrX01jNIlZJGsrt29r2qugLL1ky7b2X
 rjoJNJF90LPo9254rkevlAXVu0ghfHuHz71lZUnZzYsWYfTyQQKwIRMEMhxdQq+eCpeu
 sa9PF6/EDr92RxDq2nMD/uxEU7ZJdlAGiuRFg2L6eWL1/lgjPi7D69d9yV3PA1uc6q0C
 u3B2coYHb+0WnbqJd0iRw3p0Wrhu54LmW5mRyp5+oFH/9jbzd+k/MoMs0H8vMWOn4ogN
 3lbUOnJ/Iw4+VHEgYHN0CnZo7lfFofhSxWwB76VvH4yMQEqieTF/pkzeNoHF3vw02o7B
 aOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0o8oWeOMAEkOTxmLuclyfRnkj3vNYhXxWM1g/i8YYyw=;
 b=jB3fSeHKQouNI5OkQqmSXmaRN2SbRkbzsbvtfYMQudtXKDtnNIrCrw006waBMH7czf
 9ViOfe8p02RvSh0f1WwvUNwlf14BFF2e9X7g7ZkMmQGiT6jH+eYAeS1BRIM8S2zwaYV7
 3UyuMc3OWMDx566Xa4yasxfW58J5Mkf56x0s54nOSZaqoKpE+vk4lrGul+lkL8HwPkjT
 NBv+8LoXPZDc3nN8PQ2VwvWNZCeSHSVWBHCvoCcUpfX1rlXjoITGBePX8zsr4hpmygY7
 jqGll52hfbOxMNNAYEZbvn5u3HRRXpvGrowJihdX4Jj/cC+sP0nS7uQ5sS7LfDB3kFu+
 0bCA==
X-Gm-Message-State: AOAM532mLH2Rx5capucsbCcFScBmE5x9uyMM1Pq6GJmjAox5ZXYOdJRD
 3A/QAdTeZaMREy20hTOCDQDRMKQs8s8DWaoGZJ0=
X-Google-Smtp-Source: ABdhPJx2XAfqjsmN2+Mv+7/Oc+pDkDeioXPkvZDamVrLp4s9Vxi3/kV4lBnANZ8B6DhawEFcxbUiePZblMhua3prnbE=
X-Received: by 2002:a17:906:478b:b0:6db:8b6e:d5de with SMTP id
 cw11-20020a170906478b00b006db8b6ed5demr8825286ejc.161.1648164949096; Thu, 24
 Mar 2022 16:35:49 -0700 (PDT)
MIME-Version: 1.0
References: <1648163409-18338-1-git-send-email-chunkuang.hu@kernel.org>
In-Reply-To: <1648163409-18338-1-git-send-email-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 25 Mar 2022 09:35:37 +1000
Message-ID: <CAPM=9ty5wwXvtU6W3yZ4Kgk5V3+ZiQFibSGhDXr+a7RxUpOAUA@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20220325
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "jason-jh . lin" <jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_163551_542934_82A95E1F 
X-CRM114-Status: UNSURE (   8.26  )
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

On Fri, 25 Mar 2022 at 09:09, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Dave & Daniel:
>
> This includes:
>
> 1. Fix dt-binding issue.
>

This tree is based on a random drm-next tree, which I can't pull.
Please base it on the latest drm-next tree.

I tried cherry-pick these patches over and it failed badly on the last one.

Dave.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
