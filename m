Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E8AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:59:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA48F610A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 03:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA48F610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUZKlR3IA0OQggw+amTgrSjtCgsWhm/SdhllCAbpDfc=; b=hOM2NpfdptTMBW
	QkmTFaK1fdF2elBbLQWUihZL3fgS6zglJrtQqLGuioUbBuKMGQvTwbyt/juC1lJ+HZZiFNjHOD5VO
	SYxaTHXCMlm2oWrwGSknTs5pZAlhbfHmDXtLkazfCV4MaztKiv8JF3LVJ8gOtoE1S9RK8SmUZyfcl
	5zbOA8VSIIAdfk9Gt6p6QmInmZzvAhwg/4GGnIPDt8sjEAwWFDrvd03VM6mSRC4Kha+ROa7X2z0YH
	3i5+pEpJXiglNKMdtQH/lOdi/sXASLouOrb/W8AVnBfQhlx4ouo8DDeDV3LDU/LfN3h3mqUBgHng+
	CF0N0kSCMbS6nTUxW2RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPzaw-0047NC-I2; Tue, 14 Sep 2021 03:58:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPzaj-0047KO-4B
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 03:58:42 +0000
Received: by mail-lf1-x12a.google.com with SMTP id g1so14263638lfj.12
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Sep 2021 20:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TYXx01U0tDECSy7JDqKTFZRqiHgt/31FBTGRy6ai3aA=;
 b=Or/gbQnA/XUU1D0ryVjELuysSlbT7/4W5uQGeLVh/UkzA8/EtOLCc0nk5xLeF8QzmI
 MPf7MkjVCVqbsYc+RRT+81skOJNJcbF3sVvJ0kuF591Cx6rAG53s8BsXhUX/2u3D3PJx
 h0VzBUzzlgCmN6FQpivbNysemdpSXUR2BMNAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYXx01U0tDECSy7JDqKTFZRqiHgt/31FBTGRy6ai3aA=;
 b=4RfOhjnY8sxvfR7OIwW1+8J39Y+S+fGJWcUeInNwK7mDyHv845UN6G5cDKrhXZnNE9
 lf41q/duUEnKHqC7jEhOkdOAEOR4AAhxWBn9YLwotAPw7abGIuWJtORs4KOX1yPiV1bo
 OXItviaDdRLdVI/1uaZMv2pzMoHIE+KH9C60qVEqBL+9yqU0/9oZzYNOoKY6lsX7ZJXI
 KsWd/NNep+LJWG1F97TKmWKEdZFkRAIC8Tif2tpWV6wr829sU2lNbZ47LjxEDwds2yi4
 /fKeKU+QS1qOy/oKa+aVG8ftr4ju97WU0PG3B6UHKucHHkoWU/XhpLDAK3Q0rK3vQ9sL
 6Jmw==
X-Gm-Message-State: AOAM530W4UInQDp8lGS+PVFArYCsY45/ugObaVWWGYsY+c0bQERcRsjg
 069lz6QXCZlrD83O1d82LGq5XWWHfqHaKUoHMrgcew==
X-Google-Smtp-Source: ABdhPJzetqrZuHRb1zBUZBl5jXsCnNOeo26KfVllB6gntAeKb2VwkVaIX25CHsz0cvvtPbAOwKiYRScSOdl42Yuj8qg=
X-Received: by 2002:a05:6512:c16:: with SMTP id
 z22mr12235087lfu.482.1631591919573; 
 Mon, 13 Sep 2021 20:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210914021633.26377-1-chun-jie.chen@mediatek.com>
 <20210914021633.26377-14-chun-jie.chen@mediatek.com>
In-Reply-To: <20210914021633.26377-14-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Sep 2021 11:58:28 +0800
Message-ID: <CAGXv+5Gic9ws8f89DyRhmqtb+ua8kFocNLnHLPrPU_3V=v2L-Q@mail.gmail.com>
Subject: Re: [v3 13/24] clk: mediatek: Add MT8195 ipesys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>, 
 Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_205841_247230_604ED6FD 
X-CRM114-Status: UNSURE (   7.44  )
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

On Tue, Sep 14, 2021 at 10:17 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 ipesys clock controller which provides clock gate
> control for Image Process Engine.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
