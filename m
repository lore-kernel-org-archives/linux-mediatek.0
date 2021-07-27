Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B0EC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 753F56109D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 753F56109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eau4RU86sZqhkyEzJ2wcZBCEs3vvMiIW+hAcL4TCmq0=; b=VamZWTMi/1qs3Q
	mCKfc3PQuUcDf2t0zUX2QQ0MgYuwSigEjfGOAy/parzmaZM3AsNyRbACtFMU+OA7rbZ8RIoWQYdiO
	qEHtfhif1gniDfpgf957EvANiiYq3bHHH0CJttiMKReH0gQAzkW9qX+VKmM4nCgNkY1hVoBQ7/cTV
	K3GmsqHQhOLR7r1MaNZV7dgZfv/bbTqa1r5GgHGR4loVLACDUgzA7u3vyglbg/qnIpl96jzhbEzsH
	GpIM+zDbGSL1ZOzk6YXr+zE8KXMgHBu0GR876XTFVubEwLnoYvUfa907iANE7zRwVHLf1LhZhL9wp
	rkgMnJq2HZVhldFrdcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Evx-00DDYm-M0; Tue, 27 Jul 2021 04:43:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8EvZ-00DDQA-Gs
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:42:50 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso3185523pjo.1
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JAG3r4q1eXvW4jnmIxPlqvAFPEHnfRa806/4BqgTPyc=;
 b=e7wngxPzpp0yJQOTn+ibbOBw2mwLX4Sys3bp7NiFrw+mlxjWp6RHpc7h/0VT+sGgJK
 Aeev4HodmIPg0iBkKNcOQFWj58CYndJ8oCY+gZn8C1RSygbYI6G8sm0+hnfTXoHe6259
 0I+UhsI0GlYWAUpmtZjsOGa7VRJio3Nb5CSfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JAG3r4q1eXvW4jnmIxPlqvAFPEHnfRa806/4BqgTPyc=;
 b=elLtg+FuOAUiKYZU0bSL18L+7nw/VI/2srmzcle7oiiO8UpBUjnyG3QTxtrhvkNBs5
 secEkCv3jl7jYfHcLS83eOommWZwbFN7XLCmxfOEVSMmO42e5hmfpUV0fXcIgupJD2ct
 J2HerSyD5TrcjDRm3KGLqC6VbbNMjWTqU/lNqSLfgrIOzxv/dZWGK+jAh4g5RytgYHXk
 6edMXuOmhJXwTgVSJ9EOM8TwWq1LxTcCzTO6FhJl8aMDOChF2iIhqBNe7vV/b7fOxMYW
 aSpAtNcsQiDB/E9WAfnI9WFnYd1FR1F7P5+lKJKdtaZ8KDKY8XfzhNFcEYWM1Ag6rTnX
 mn8w==
X-Gm-Message-State: AOAM531axb+SkIK8cZM0YLEF59KUOaLbK/jE9fc8GNN/+9oNNl79CXtD
 NoAD5J+iysvQc1WhRsDCvMZLmkY62XcDr6/n5KO6vw==
X-Google-Smtp-Source: ABdhPJwdTmIIqDIkRt5Ak/lU9NfF+K5qaQxw4lncfdy5vGygLf6ht6RWYKwum/QaKt4mbq4xALxTpF8TnTjnoO5kRaQ=
X-Received: by 2002:a17:902:b788:b029:12c:2888:9589 with SMTP id
 e8-20020a170902b788b029012c28889589mr6389338pls.60.1627360968879; Mon, 26 Jul
 2021 21:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-14-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-14-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:42:38 +0800
Message-ID: <CAATdQgDuSuaP=10-WN5DpCEisJYMVjbGdSb81tFyGC5CXyBs2Q@mail.gmail.com>
Subject: Re: [v14 13/21] clk: mediatek: Add MT8192 imp i2c wrapper clock
 support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214249_610057_BF7D7378 
X-CRM114-Status: UNSURE (   6.96  )
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

On Mon, Jul 26, 2021 at 7:08 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 imp i2c wrapper clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
