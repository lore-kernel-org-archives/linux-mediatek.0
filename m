Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 658CBC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:45:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B6361078
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36B6361078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIb7W8Zxr1WT4L2ovbiJplqkK+x4T5dB+2QupiaL75c=; b=aOYrGS6d8AVk6o
	2Y/zf7743DVaQ7/rIinNUopN/WEWm2gn2rwSfd55/PNbvgHaKFpDBUDkfTjLrSSRpJHouHXPHyTHV
	vRqP/A+XXusMG/DdA8YQo8dAjLkBT/vVsqU4skZY9RYVcwTUSpEIpiB+I4QB8glaiHOTVpIiGQ2p+
	Ystag/jr9bI0yVRF/Hr4yHCcTb0bQVNimXDXxbf8TySpExze6qd0+lqtdQRaL57UaYVdj9mMaJfY4
	II5CJaGr+DNaadHQ7uKHh5pvqbCwQnF2iXVcRzEOtK0V3Ho8cZ+nNaeXIPpk0BCSG3oDJxpAM+hIk
	DUDTH0mrHVG1bYJYlxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Exz-00DEV3-F7; Tue, 27 Jul 2021 04:45:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ExN-00DEBd-4A
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:44:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id c11so14317619plg.11
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Upw3Kqn05tBN6OFp46vi1aIozZmbzcynjmLNKwgK9po=;
 b=gmugk18f4PMAnQoxaFPvxBgivCKZbUuZkqcDUby/i98d7b9mBsBeFnXnEp/X9Tiieu
 JckgJXJSmLdT/PVRLt3m5n5MomEp6aMIzhfofL7ilEqv0xRd5YsKE8AEWqX+B0TLgYHJ
 ijecndFTtmrZ/kGQEV0mzd+c9Q/bvjRHqDfEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Upw3Kqn05tBN6OFp46vi1aIozZmbzcynjmLNKwgK9po=;
 b=psDWGo9tZjShLB1VQQ5IcKDXmcP51YVbCFZOtb+6fHGw/Wv29N4by9OIKEcc4bUMwV
 DeI4aqTD+EPJmZOUnUFnfVeudZqpplVvD5jK6PrtYsFax8NUY+RF4c085SK3dg3TPMWu
 ouoaVemIWvooEixIbYzmE9RrYgrKqxK6Q6TnYo6KRdOOlCwMGNWCJLH9UNf+4+sDc2hh
 fhgtS9ZERHmIGMIR3fojDYORWKaivi6JNj1FdSRYEwBXe+pdld5qySiJZ+V8he7CJ/c4
 1giCG74I8i1g0+i4FH+2eC8bNRxlx4mtSnTHDPc+H2CVw+l5bj+XDqxtOnrjoNzUCoUx
 /Rdg==
X-Gm-Message-State: AOAM532ZjIgWM/fRWBhx82sSV3iA3SVYKcDBj9YUtE0phZBBDtHGkUEY
 9MPZwkU1tnDUvniHhRmhnmfFmoSJeBwEno9UyFsZpA==
X-Google-Smtp-Source: ABdhPJyZyDPgsADtQXma5p4ApMONsh5r1xW3sEcgGcnCFWSzk3ZBPkyUa/IuSLHWVrLfUjjrIU8rcRz6q4kHA6Sc2g8=
X-Received: by 2002:a63:8f04:: with SMTP id n4mr21092441pgd.317.1627361074754; 
 Mon, 26 Jul 2021 21:44:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-17-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-17-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:44:24 +0800
Message-ID: <CAATdQgDwQtqbYyUXo1c7sufwchGqZ7CntB1eHhksNVfSZ68hmg@mail.gmail.com>
Subject: Re: [v14 16/21] clk: mediatek: Add MT8192 mfgcfg clock support
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_214441_197375_CC1B7E20 
X-CRM114-Status: UNSURE (   7.07  )
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

On Mon, Jul 26, 2021 at 7:09 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 mfgcfg clock provider
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
