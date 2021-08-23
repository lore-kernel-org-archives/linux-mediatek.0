Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32881C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 06:41:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 016AA6103D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 06:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 016AA6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkBYjmgcv9Dlv/lpM4rIe8fwW6p/3mCiV0prhoFtYaQ=; b=BWLsQ0lhEW5KBc
	Y07ubsTuu5Rrj+YrxOkK5bWq1dm9p+L/YfiZ6hlRW+z6YdwMz3/wldMSt9Jjd6XEJQxhM7uyuZpBm
	QpjlsB0Pc8pUSmtCYugXKvfSqNFqygMLIvYVfYcviAAhP2CXUcjXpJOM4LcitHYHbBVR9UXUgrEMD
	pXP4jFSSj9GDhZLZcIx2uI6//A4vYJ1BT6DiZh/VESOzFvt8bJnQNoALNAOHqaWUJ2vlsZiTLImRq
	+BXiVdzahku0s5AB6/MjRKCq12A7yTDERpr3a6mP57pBVxNum6TeZGkdErX9VRqtc0MPRPUAGg7tK
	exBSxgyEyBarOOhTrvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI3dW-00FX0Q-RK; Mon, 23 Aug 2021 06:40:46 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI3dQ-00FWzC-NU
 for linux-mediatek@lists.infradead.org; Mon, 23 Aug 2021 06:40:44 +0000
Received: by mail-lj1-x233.google.com with SMTP id f2so29593925ljn.1
 for <linux-mediatek@lists.infradead.org>; Sun, 22 Aug 2021 23:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dOSScg11+0lHrDw6MS1CV2sNd8OdE1zWDqg1qjqqW2Y=;
 b=PYypPGwhJKWIPHwv0PNNxvgnPr8zgWPvGUeVW/uOkbS0Yv1LkNwjUiYPwyaBu+NxwW
 dYV+82j3pW0jpoHiJeHbehsfiEC8JgTXafrSgSTiLwmlPR+F4eg9qpAJg72XDqbx9Mvc
 gvHQPEr4y/JXHUQ4fJSKsQdp9nRZWGHp+2Lh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dOSScg11+0lHrDw6MS1CV2sNd8OdE1zWDqg1qjqqW2Y=;
 b=WIunNGR5pE/KjbFcoKCuKiA2KgerpsSxVeMA7dLTkNGw/lbIE3dwsoLrzugWcpc6Ju
 0wFKYIQyxnrKMFhu61Trb2e+qll1yau/Ydqi3hV5AuS6IvrtOY9czB4v7CYTCNRfNZSz
 gg2N7njdutvxgvgOnNLJ1poyC1yFeeaxnWD5mceajlG+81ZtE/fbOPzlNzteFVdVEcbj
 S7tLjSNpIcOzslmMaWih3GlNFyKj0fczRx4hT9nJbQaINgGD//ez8WoVDc5vvH4Bkbji
 nevvTIdITXQ4z1ujP9Jdoukvmkaa+/KJykDZ7djI+MNUMFI+UheKvbviU9kaMy03j8FQ
 IvjA==
X-Gm-Message-State: AOAM533FVIyC7GD/0dOO4KThznJC3qcFINmOqOMXx9Hi+PCFT+99vFf7
 LKZlKyi5Svd6RIf7xjOJYxX7L6NoVosyEtM+IURoWQ==
X-Google-Smtp-Source: ABdhPJzCaNaaScS5j8xwc/H16iJK+VtsRDRaMiPRceRnRRAxbyhImqfGwZYwLIHLdB0yA9X834FjhBCHEBgVDLi4C9I=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr25865507ljl.23.1629700837011; 
 Sun, 22 Aug 2021 23:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-5-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-5-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Aug 2021 14:40:26 +0800
Message-ID: <CAGXv+5G8WUW5ByA12ELrUvHVshwj2nm2wMLYZeFt82g4C7BXpw@mail.gmail.com>
Subject: Re: [v2 04/24] clk: mediatek: Add API for clock resource recycle
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_234040_827392_05A881A5 
X-CRM114-Status: UNSURE (   8.69  )
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

On Fri, Aug 20, 2021 at 7:18 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> In order to avoid resource leak when fail clock registartion appears,

Typo. Please fix if you respin a new version.

> so add the common interface to handle it.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
