Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107F5C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:11:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0676113C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 06:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA0676113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D2JnoHFV0hwWjJsqZMOLgH4w1BhBVLgBT3aPf1iK0wI=; b=tMS0NEOYqvzXXo
	3mkTcw8lX/WjZbFljN/vzK4g6VOrafTMN6u9OK7KBmgs6y9JJSiCJnkpZVhEqniLiKJqFgXCJqr29
	dMZT9qp7eapCHK0UOaPUn0NcJm4A/XIYLgzXa3miA2uGHXxjjnIvw5kDZxgQqXS0qIzbtGHR4H2LQ
	u0uROpMCOZzF+uMjKT5M3OIiM93c+masPi+ARBJ7lcBz1wS7uqqWGLEAFf8j3usXS96FNu2tHktv8
	3xw9VVfKd2mpdE6uZA1QBwV3Ue4Zdro4VO2NTNIuc7KoJ/vkF/8KoZ4hV0fFQtQZlxjCOxQKuf1h+
	nQOSOe7fqIxI+LhTVZhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvD9v-002GVd-Ns; Mon, 21 Jun 2021 06:11:47 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvD9j-002GTe-Lu
 for linux-mediatek@lists.infradead.org; Mon, 21 Jun 2021 06:11:37 +0000
Received: by mail-il1-x12e.google.com with SMTP id i17so3771898ilj.11
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Jun 2021 23:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UrVnWD4uqk477BZlRoS6bPA0gBVrgjlmN2CjO1g4ZrY=;
 b=b7jNAfXK+9+FAA00prZSOHK32v7G04pvd7XGXWaJDoQhAgeyFKeHtahoZQXX8mRdKD
 w2BtpOuAerm7s4/3jQS5LmioFE0lk9cmsNBWko9c4CIQj3xlFNaWaXL6qtdPNL3RTEiQ
 HMrTXeM5ULR2LfmbFT5EFF1U/l6oFfhYtJbWVL2VA6FNHdlepozCGYkuT2kI6I4ZZrLv
 z1wFIIR+feiCuHNLR9McO8u0fhUb7p79WQjUrAKmqOm5G15paYZODcS/63w8bvBVX3nC
 Xvk5XQbfM/zd9+F7YJZrGCw/mQ2HnyvjUXdSOA0RMBS1pldze0IjLhKiqg0khW199GnH
 AZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UrVnWD4uqk477BZlRoS6bPA0gBVrgjlmN2CjO1g4ZrY=;
 b=ulYp+jKKqtHSNvPzgDR2MPkiE4e87YFAgBIeSQ4nnEBcVVrU4O2uu3yyw0uuLfNW4u
 Etzjr4Xe7Q+UnerLfbWoD+6sMRdMffiT0ADwbLWFFHxLmoNqHya4HgDEml2NbWUAyixp
 8r7anAEa0wT0CnyKHf1Pnm33CXmExG7ACWqDfYkb7Ihc0CX4U7Y5XBZRMyQNNxNB67l4
 kxmQk7TKViIxxXXrfrbmCVuL8rHIjZ4XFGmL0MFkBBGJLO8UZ636E6LnU/xPes/K/Y59
 tpJxvJjwkwQqk4NbYhEi5ZKdn2BbbLEzGIVJWw3NUdybeaTKBQi9mcmAzC/AiVLlOybj
 UTiA==
X-Gm-Message-State: AOAM531ZTUCJmGJsjzfZoi+53l2Q055amLnw9txZ6VxC/RhRW4aqjrGu
 jT3B1cm70I12ikve7oy4bFH63TmGzpawOWI+PJRfPw==
X-Google-Smtp-Source: ABdhPJyH1zVl7wIiAFgQ8e1e8lUbGMzodYIhXDk676HPCNCBJlym94W/qbDfS3mva7wU9ICE+EAx0H0frj0pQnM7DGY=
X-Received: by 2002:a05:6e02:1be1:: with SMTP id
 y1mr17552207ilv.204.1624255894489; 
 Sun, 20 Jun 2021 23:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210620134954.15233-1-Christine.Zhu@mediatek.com>
 <20210620134954.15233-4-Christine.Zhu@mediatek.com>
In-Reply-To: <20210620134954.15233-4-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 21 Jun 2021 14:11:23 +0800
Message-ID: <CA+Px+wXG=KDRKzm-bS95tnmpbBTCD3C72nhi3RJGw6PG6Cj-hQ@mail.gmail.com>
Subject: Re: [v1,3/3] watchdog: mt8195: add wdt support
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: linux@roeck-us.net, robh+dt@kernel.org, wim@linux-watchdog.org, 
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 seiya.wang@mediatek.com, linux-watchdog@vger.kernel.org, 
 rex-bc.chen@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 srv_heupstream@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_231135_796562_6B598F04 
X-CRM114-Status: UNSURE (   7.85  )
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

On Sun, Jun 20, 2021 at 9:50 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> add support for watchdog device found in MT8195 SoC
Please write complete sentences.  For example, "Supports MT8195
watchdog device."

> Change-Id: Ib2434cf2d47a2e14916056f08a4fc630569624ed
Remove the unneeded tag.

> +static const struct mtk_wdt_data mt8195_data = {
> +       .toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
> +};
Expect to see the of_device_id (i.e. mtk_wdt_dt_ids) has the newly
introduced compatible string and use the mt8195_data but failed to
find it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
