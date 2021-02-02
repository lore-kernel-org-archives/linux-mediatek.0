Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A80C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 03:51:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75B0764ED5
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 03:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75B0764ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sfy7d/LDS4ZRGEZ94/fmmwc0w+pYcBAevcNhMp1DA/s=; b=fCZx4FtkAy6+sWxC02E2VVQbg
	nNjiMoq7TTJQKDuQGlwDBJuq9I1LhLN2PE7y/bsukSnXDd+nXmQQiijFMIpZjLGlk53v6pDAHonBq
	18uV+jMhzpDKXbgU5nAhmKzlZwUluht2XcuhdFp4KkwLIRoNOiN351u6CdV3hr1QWXtfcEH8Dq9Oa
	7ZKFnbh5GmRotqZZY+h3+olMbSQU9jeoM+nNcHvlxsG6sObuhhwAcDzwSe1RhtvGUGdSEPtUMU738
	tFnv+XlTJbxHk1jVF/0kQYOS5Dw3pV2K+FykTdFsVJ1ei58JfWC0Ws+K1T/XsQJyTiOG4a7xHj6nG
	FdeaBWn5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6miv-0001OC-AM; Tue, 02 Feb 2021 03:51:29 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6mit-0001NU-Et
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 03:51:28 +0000
Received: by mail-il1-x12c.google.com with SMTP id m20so10290995ilj.13
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 19:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DUbVLJ+6EapSl5sVNLf8sgof9k3YF74Apn4NRNuZrBI=;
 b=G139zDlnZdSnzIKH7yG75Inkorodk6X7AjLca6dTCwnjSMyL1PTsMAWZbIzfthY3R/
 l8oxeWNBoH7WS3B3ILFRsEFRguGNqVruEpnIW/oJuq9kukOrYVIY2fSXSvBptglZ0eM9
 bb2hgs2LbjxiECmNi0TNOMF+lqm5YVN30AvK20Y18+IAq4YKOET0Vli6u3q9SXw68Mhj
 6xYne4B8ydAADwTKwuzAnO6mKZ9F40RtN1M4C4i6N9Asa8uh/R9oJd5EL+sq5mg/hVpP
 iTohNwVMbv2/+j6wVhOL99ZY/Ng+qkog64cUg44UbFyz2AaHNfIDKKcZyE8pbPQV6gtM
 0HVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DUbVLJ+6EapSl5sVNLf8sgof9k3YF74Apn4NRNuZrBI=;
 b=UL6c/kow2prO/GMwCcsr2w/jJH0NfMG2OkcvQ6NNWlHrPcmucpNnBamR7x8ZgGaseb
 1DoMMuYKSAHzev+IOHQyqKmkHXXBXta0tH5XEeaz46BjBKRw7Xpb2J3RX4Q3SLyw6f4C
 SQSfyd8BBLBrtnkpl9d6m5uvFoTTKei87+vRORNbTYbyoto1sR/d4AG1+5BfLm57da1q
 gNDL3FxTaPDc31Z55kVrgGOYxj3TqBccVSZvfARo0ZrMsXCSVyZoGzkb96MVgrTaxnKF
 y/oaolEKWvkQj10Wtf1QD8REDRaCnLoaJ+rdYfwPNHWxq5zOfrwqp5Zr65/FvyxcL12d
 5qsw==
X-Gm-Message-State: AOAM530G12OaBADKs9vy0bp7PW8pbr2mPsKIDzD7ccJl5UbhntKSY1V6
 e3X/vwqP2uHmpAkqES1LBn8ZQO4KNteUGdIE14h3rA==
X-Google-Smtp-Source: ABdhPJxc3qlV1vDkvr6AKiJA6v8PIzxjnHjrC8AiVb4RHEO7WgoEnWmUihcs05hGWpDlchzD4tCKWKvEQhihhe0Ou5s=
X-Received: by 2002:a05:6e02:d42:: with SMTP id
 h2mr17203540ilj.204.1612237882649; 
 Mon, 01 Feb 2021 19:51:22 -0800 (PST)
MIME-Version: 1.0
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-9-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1cbf58f1-376c-fa93-98a2-53a41fa24273@gmail.com>
In-Reply-To: <1cbf58f1-376c-fa93-98a2-53a41fa24273@gmail.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Tue, 2 Feb 2021 11:51:11 +0800
Message-ID: <CA+Px+wXP2vrFbou+SCRZuXYr4XPPxYHZfk+oSM7_GPXZSD24UQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 8/8] arm64: dts: mt6359: add PMIC MT6359 related
 nodes
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_225127_599280_02B3DC13 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, Fei Shao <fshao@chromium.org>,
 Ran Bi <ran.bi@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Eddie Huang <eddie.huang@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>, Yuchen Huang <yuchen.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 31, 2021 at 7:06 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 29/01/2021 10:49, Hsin-Hsiung Wang wrote:
> > +             mt6359codec: mt6359codec {
> > +             };
>
> I understand that the dmic-mode and mic-type-X depends on the actual board on
> which it is used. In that case I think we should add mt6359codec node in the dts
> instead of dtsi file. I'd advise to set these properties as well as otherwise we
> get a (slightly misleading) warning in the driver.

I feel it is better to include the node in dtsi to represent the whole
MT6359 PMIC.

We could either:
- Set default values of these properties in the dtsi to avoid the
warning message.
- Or https://patchwork.kernel.org/project/alsa-devel/patch/20210202033557.1621029-1-tzungbi@google.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
