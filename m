Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9C78C07E96
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:12:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89CC661961
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 09:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89CC661961
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpttpiQBjiQVWYFBnD0WCNwMuhuYzakY0R+LowXix9E=; b=wyX6IQd2T/ky7y
	SYeLIJRDmdUJQ2dCWgtbbTrxpwSH9qZNC69nDrLBwxnkm3S0AwrBDOMEuL/wZ+ypsRlMfaZbZGhxu
	medR5OEOdx/3dwtKBvdH/MfXdfvAVjLUfp4WwBZv/ofDrmekjYzu31qLsngAmzsorw3nP9vh83gVj
	TiKrUEnB53gDx4zIopkEFmYviAFMvf9c0t05v2WUB3L96P7N07ogFRHnI7UfN7vPYtgagzTPuUF5s
	HIpoTUj4C0WV0LLsyRJzwQZDVEcLY1b/50UQh3t+E1/RiFqvUfEHUvPP57m1LZhMF7Y5zUlD5YxfA
	LUU/cMQOJUVw2IadZr5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0h7R-00AsRF-VT; Tue, 06 Jul 2021 09:11:54 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0h7O-00AsQN-TU
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 09:11:52 +0000
Received: by mail-lf1-x136.google.com with SMTP id v14so11550595lfb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Jul 2021 02:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aBkKGziaj4RSYQU8gwfk0FrmJer1D24V4dZYAbmnoxs=;
 b=XS5wTUCdxHC15PUxyxDqrPhwXwxUA3j52nH+yxpG+pfSfYIAtn+iiV4InkG5nO9rSV
 +M68go/eB308e1uJfEQgo+bf9/gZtsOHZri7NHZ68wOMy1Pcfz3NBQW0fmyEM/NiQe+d
 guci0TayPEt9dmWmJp+YYbalVT1NA+kiuaIlM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aBkKGziaj4RSYQU8gwfk0FrmJer1D24V4dZYAbmnoxs=;
 b=p5LbGWPTbEK+LXU+afmluD4DS1q42M37i6HBLGVoCUOJs4lcA95+tlA2aJZzqscO+Y
 Xm4DmJQNYLphBdh+GZa6DWu1m8+9ycJaD9MzfjpvLkpbfHFJ6QIB30vtZxfnA9kui2Fh
 hzJW/twXbi7RJM+7N+fbhPwFhPHZjlKETdnDmDF3WBBaDaUwLDWy8tMjt29JSmW07sxQ
 kT8CNKr+Jcm7je7yxjpYo4ZJAcMKCQbr18DSlCCpAJr7ToTBrt47njXsZ0eAX4mpmxh/
 yR3T6j6JQZBnrG9ABlsOmzJPAhl/FI8XEn0r3skFc2mX9CBe0zGWdBTA8nUECPQ36IZY
 vNyg==
X-Gm-Message-State: AOAM530JY+ncmxj/VBxjRYHzAJhhpZwcxPWy+iajQ53tcSRgqq+5nUrh
 2E/pSTby3H16TJXAAqcx7x2VBixBEPIv+WpL7pi4IA==
X-Google-Smtp-Source: ABdhPJygTAoCzUuSlXy2SSRDYl6kk7yXXtcJN9JToMMi6g5XXB+H+1QY3X3T5IW2n3XK0DbgU6raZl/fZlssaegBtgA=
X-Received: by 2002:ac2:4308:: with SMTP id l8mr14742181lfh.342.1625562709577; 
 Tue, 06 Jul 2021 02:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
 <20210616224743.5109-11-chun-jie.chen@mediatek.com>
In-Reply-To: <20210616224743.5109-11-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Jul 2021 17:11:38 +0800
Message-ID: <CAGXv+5H-+cjbvivtAs0p=8o-ifkfqyWhSHBus=KBRwZW2wERLQ@mail.gmail.com>
Subject: Re: [PATCH 10/22] clk: mediatek: Add MT8195 ipesys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_021150_992905_FB683798 
X-CRM114-Status: UNSURE (   9.92  )
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

On Thu, Jun 17, 2021 at 7:08 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ipesys clock provider

It would be better if you could provide some more context for the patch,
such as what hardware subsystem / group does this belong to, what do
these clocks feed into? And in the case of supporting multiple clock
controllers in one driver, what led you to group them in the same
driver?

This applies to all your patches. The single statement "Add xxx clock
provider" is simply repeating what the subject already says.

The code looks OK.

Thanks
ChenYu

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
