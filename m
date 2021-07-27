Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B128C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32897610A0
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32897610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTZwS5ZQmiSMUxq7xqrG5JZP/3uFd1KQmg7QDXVtAvs=; b=qaB9gqSMQ5/AG4
	MNagL6fnQhatoEpYvMxpxh2MeI6QsnT9y/AyQiOEgCl2cg6gE8gDD1mUwcL9ZXCgQZCTLVUlDhU3b
	JeAOLFAlXaKQMz2WGXhtlpABQ3KJ+FNgGQPTXFIIWegluEMeZ8B/w3Hz8GsTyN3sANBPp3jNcAZh6
	6CYJ0uZFHedYKZ56mVnSNrtrY8fFF10qKLqHldOU6VQA7S81/atGDUv1AbKRdx220xs+mu6wG46wx
	ldExuJVmJa6eZZhK1RmT60fGWhkPdUnCm2kjfujanJmbnGtZ3nfLvJP2chcX68ifDrjQJuM5MeUCo
	qL7cxDw/qNakglP/rzPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8F0p-00DFiq-EU; Tue, 27 Jul 2021 04:48:15 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F00-00DFNu-07
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:47:25 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so3254289pjd.0
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZrbt9yR8hbrQ8uYyC/1sSAYUKzr6dRf2IBuVuefs44=;
 b=M9rmhyJs0OAWFelfhkQwSWB48PlkyYfaxXouNKWkCTVZK5xj1A5A07a2FTc+WX50vx
 X9FWYB5LhBrtwtqOkD3mwjzsfFTNcUAiTalq8AU305lAgHdmskc6dPLVGWnAkhwxIhya
 qTtn3xB6e/XzKGTGhf5NqtsbbnhSwHgbTd71k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZrbt9yR8hbrQ8uYyC/1sSAYUKzr6dRf2IBuVuefs44=;
 b=mhA4ulSNxNBmIH/OsrgyBMhHOUY+s+N8chChpBvfjZLW/f3PNOwqQsIMac5uU1U1lI
 j8Q5n+CxTR4bTeeWMUne3qz2DZ2Ps/FPo3fSm2KzSEyKBYN/nst3Uk4dLjO30fxKiamk
 nma3WtKPYzPMEkAAl6ZUglC58jouExkHxL1Ax4vr4Tsf3HzR7sjDobdFzcqFh1bMXzxg
 njc1ZJa5iFNaJmLrcUlwumu+HT89X8EGCJlD6iVsT05IdQyHPmxQ5IqCy/IbmO8W3Kls
 FhjL92m4I79Pafu7HTzZw1ywQ8l+VkZwQLX3O70MxWBBIr5u2OY/UEYeKRrJbueUCUkI
 nsnQ==
X-Gm-Message-State: AOAM533/A0oRu/mX/0EQVobycnLoBuJJh7HbxZep8rzP/VxRIy6Q2rww
 /lI1oGNa7ttHPj4vFrVMTMepJDSWtsRG8rWTT938+A==
X-Google-Smtp-Source: ABdhPJyMrzz2w0ZyuzNoS3umV6X1k23qvdWBuG/YbXZPQ68RCfZGsiO8UslIzHyStg5/1car2IaVGcpVboN/TDltUzc=
X-Received: by 2002:a17:90a:8403:: with SMTP id
 j3mr2318141pjn.112.1627361243434; 
 Mon, 26 Jul 2021 21:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-21-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-21-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:47:12 +0800
Message-ID: <CAATdQgCzVffmJ=CQ0JqFQPjreySQNUsfNamjP05m8Jq+e5g=gQ@mail.gmail.com>
Subject: Re: [v14 20/21] clk: mediatek: Add MT8192 vdecsys clock support
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
X-CRM114-CacheID: sfid-20210726_214724_134675_6AD06042 
X-CRM114-Status: UNSURE (   7.14  )
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

On Mon, Jul 26, 2021 at 7:11 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 vdecsys and vdecsys soc clock providers
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
