Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EA3C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:27:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9528460FEE
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9528460FEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6cuIDZaZ44uKhWVJrUo+aDcFVgxDhJ0abw/WONUY9s=; b=wucK7lc2v+wS6o
	KbXnecDp5f8aX+w7Z3++r7Lod2bwsh20KHw9d6+tftaibr48T3AKzUjhDeRikyrt/sx0s07MBADdq
	QyEwktM+92qmCIcbTUfca7TWPRFcWUCc/T6AE0YxUq9T+pe4K54seYQoPzCSGQKK1sNVBFgHE8BQc
	R3aTbimSNIp1+rootOOLWB06TC7xliD4MzCleWG75bU9JIVtg6F84lrv+OiDLd3pejvt6nflbWGJZ
	5x8Y8GKIf4IYT3MW0x/ywGuqOBbdPDmR0PBVq1LyyGgD6lQLGGqLGhpLNGmkuaugYnBCVeO1nH7Sd
	iGHEFkBaBR8hzWlj+0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Egy-00D9rA-5L; Tue, 27 Jul 2021 04:27:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Egv-00D9oW-8e
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:27:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id a20so14569966plm.0
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GXQhLU0KIJvDHX5sb6jl1W+wgDKUS1guQrE0JC7Yn3Y=;
 b=RKYTKymblzDOhbLv7PWiW7eSUaUlTkIvosw0kwN52o4QZ13MQ+pI3E3f9BLAXyxuRV
 zPgtVU+DORJ+W+MTaB1FlAT1p+dCRv1YFYa0QtARGTVKNCLUmTgFRwX+xdOLhdU6CXa8
 Qz56OKEZVFeHnr8rYzXRXJ5//xYDcWaG6H1Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GXQhLU0KIJvDHX5sb6jl1W+wgDKUS1guQrE0JC7Yn3Y=;
 b=rYIsCQXgIAn8BYquaN+ILK4UT8zpV1aM6EbR8+pHFkXyYfAhcE6jLqy7tMGcR1hG2k
 ETemIi3ZYLC5eIChyyQV4YVcmEKwgH9TSXjjnZiDs9YV5SV4UU+lrINqim2VBrcb3/Nr
 YOhUkZ4ghIVYCMeKM7f0y8Pux5RMzoffNTXkCFSsrpmtOsWgOZ0S23yt7tR5ngcQ5SpE
 cj4BbcMJpengAxE1mk0m+2yGOrxFGwgrr6WcAizdzYkELs9aKXl3oU7iQhgYdK9NhMAd
 tQWOcCjvOUCsnOMES+wfprWwFmf/nXr+ana/W6JerCplipJoJfwX+CD+RO36k2l8l6w/
 wwzA==
X-Gm-Message-State: AOAM532T0ZXKDInLL2tt5EteVtn9HjJVbVfcDSZYJS+yU7aj4elQjfJm
 AwVVBF/MY+nYkxo112ZiiUkZh82J4CmEpTBIV7VDrA==
X-Google-Smtp-Source: ABdhPJxkczvv9x68Kqa5d1aZDdqcHw3Asoy9mySgxuq7/MfpZdsYtC1IRV3W3oHxZjYYhlcYOpCkAF6RuR5x8MDB0sg=
X-Received: by 2002:a17:902:b788:b029:12c:2888:9589 with SMTP id
 e8-20020a170902b788b029012c28889589mr6345723pls.60.1627360058151; Mon, 26 Jul
 2021 21:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
 <20210706061920.16013-9-chun-jie.chen@mediatek.com>
In-Reply-To: <20210706061920.16013-9-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:27:27 +0800
Message-ID: <CAATdQgCb5WxE3MjFzWsB5s-rjtTMGF7a3bNbrO8OmRiFrOLEGg@mail.gmail.com>
Subject: Re: [v13 08/21] clk: mediatek: Add mtk_clk_simple_probe() to simplify
 clock providers
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
X-CRM114-CacheID: sfid-20210726_212741_390179_C019890E 
X-CRM114-Status: UNSURE (   8.33  )
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

Hi,

On Tue, Jul 6, 2021 at 2:28 PM Chun-Jie Chen <chun-jie.chen@mediatek.com> wrote:
>
> Most of subsystem clock providers only need to register clock gates
> in their probe() function.
> To reduce the duplicated code by add a generic function.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
