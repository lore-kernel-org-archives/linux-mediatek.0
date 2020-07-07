Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0AEC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:36:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DEB2206F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:36:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nAlLvja3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EEgzrmFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DEB2206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4gQjlL/gaaDeo4OujBfyDHA6vVQdZUJcC9v4SH59Pyk=; b=nAlLvja3FeyRW69zImBzk5B6R
	LCx0nuLJA7bL7kpUt+PE2G9dGDRr5IX7FbgZNIkFg+cNcsXuHfwF4k9pTcrdifIK7ePNjTp44R1LS
	3Up1sKw1tCVJ3ka4JE/8RpqayWuUTOjLQk6fvpDJ2EuceqCJekzjblAUsC29tV6gEQFts2rmMqnC3
	DQac5mBS0GtggYri3tA26KguIspbXFBdP67VPY6ixau3jeIyEy5KFZig8MQSUukMQZ4Ejop/ZrPO/
	/3dLU1pI1qa0olyWlLAlOX3f4f+RMyuAejBNztiMAVS/ITuj/U+BpxScC2JCZS5h1cpCOTBr+tz7J
	w1L1yq3bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsltX-0006aN-B9; Tue, 07 Jul 2020 11:36:15 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsltV-0006Yw-4a
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 11:36:14 +0000
Received: by mail-lf1-x144.google.com with SMTP id s16so19041739lfp.12
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 04:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BaUdPMwTbym0/FOb53irCXsw858iJMpd+U7fSCxbrZw=;
 b=EEgzrmFOPBRJPWSIHRYyePa9lAGoPCoxXqN3mLLCIQDZuRhWVmoWdIo9koYco7oq32
 vFLlttQN2LTQr2685xKsPGTcpR+SI/aGR9ptBAspLpMDLtnyIVcelAgEmNvUgUNT3Aw2
 5gDlCgfPKeKuRHTfhOvblO0quMu/M2GIaqhvEdyA4m0TtDrgBd9nLiKs+XRoNuQIxx5r
 xFw4hBR6ouQOf264O3KjYNKNtoiN1ZXqrS8VAVcqrL9tKo7cEpwCl77SdvW1KJAEuA12
 ZXDeXEgnbXWq7SkuqBrrVcROSIOaA257MsCDJHIFHBVIM8DlWdeE3/nbJvAeiXXL5aXt
 fYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BaUdPMwTbym0/FOb53irCXsw858iJMpd+U7fSCxbrZw=;
 b=lEBtF8k59OtOYTyJ58l3RCCKmJvp/ymi/5h80sJwH6MPqP7QOh0rU3lEd4A/ctHo0f
 kf5gj/5gt3SRyLbGLXuJDK8sty+A2wGcW3JbhFWDyKjDnwwKLNVIosKrzafPFy5yr+9t
 6uFBU+XISYm9+nwHfZXy0Q6Fsz/C7U7QtnE6EVqrdkw7/GV+J8xjhYVDh2tMW/BvS1lx
 MFUzsqwO64Mm85IdFihk/plADG/5i+HXw+es5UxQvNKCZezfhQfpIWvnE4ljCa3/kyQp
 VOMzAN33NCvDShmt7RgFaf8/TwQhYP8VLVX3yi2FfEju8VtCxzDJr/veLTIpEtnftTyE
 48nA==
X-Gm-Message-State: AOAM532iGW1Xl4x+5F8+zF+n93+VyKboVWkekqQgnAiYexqHFm57LaGH
 ZHp4ySovaI5KMBmmLY3y7pWf+6v5bvR7PzgNezA9/Q==
X-Google-Smtp-Source: ABdhPJwURK8xxItk20LIQyik7OCxh3Na7DKcSEzSy2t02n+xFYxkh4Kdd3MsRtyCZLblZdRY6s0fjloV3UCAX3MmsHk=
X-Received: by 2002:a19:7407:: with SMTP id v7mr31140846lfe.4.1594121771982;
 Tue, 07 Jul 2020 04:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-6-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-6-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jul 2020 13:36:01 +0200
Message-ID: <CACRpkdZc+PVGOXwba=ocs-VBh-sJT_1dpEVSxnjdwbmM_d0LFw@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] pinctrl: mediatek: add mt6779 eint support
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_073613_234646_FD4ED6D1 
X-CRM114-Status: UNSURE (   6.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> add driver setting to support mt6779 eint
>
> Acked-by: Sean Wang <sean.wang@kernel.org>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
