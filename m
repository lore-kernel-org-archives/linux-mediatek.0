Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E644C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 11:00:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25162611EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 11:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25162611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtWJ7XQ8djLpgns1uVqUKtRYjM8Cd2pK1MRHkRy6m/g=; b=yi5gE4q11/KpVw
	h4ixnoApmz/NfcM5KMmX/5H0M/CLr065YN1BtTJvAXcflQg4MPs8447KNyZywdzbXKL+XLGVONQG3
	1hpnT5MlYn3uOEnXlpq9t/306Z0lQs5HcdGnY7Iv+hMBjRoXSsKhWspaUUruGops4lyBMsCasYgxC
	bbQ2n48DPJIqx/e1zRAFdful1nWzVDl9kdRzgqS/UoqbrQr7rnjzMF3c7EdIaqwY/DmIzf98+0DT6
	cv1fZGKuANgKUIPJo3tktdX3KISTeeQzpj3vqN0Afvzvx5CU5rrq7W8LCjn6aRUERlc1lzGUUTUTT
	Wyk0znhjPHMUkp70wK1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqdJ-006iI1-NJ; Wed, 25 Aug 2021 10:59:49 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIqdE-006iF2-Us
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 10:59:48 +0000
Received: by mail-lf1-x134.google.com with SMTP id z2so52116971lft.1
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Aug 2021 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6OhtRqxuCWyLk1aLabWzxilmd8Ou8PbDbdnIDNsifyg=;
 b=UCe6OdgVEduJpDvUvnAB3x/x/zZNszEyU5ZHOrt4vlHiT818x2be4JzjZm1vnIunjQ
 r1CtUT20ws08Uh6T6/kTMmgQLJGl7oTjRiLcRK6Mf1qYkU30h/xSAMX1K9Bcvswq8lPI
 r6YRJ7p9V8s8NFEGw+nFTtgOeo8brw/PWIhKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6OhtRqxuCWyLk1aLabWzxilmd8Ou8PbDbdnIDNsifyg=;
 b=CkeCx85OhKHPAc25Hp+MJu2MD947afDoDbpA3urLvt+UK/og96nNhku0HA1LFmbhrQ
 hV+Kv+lATjpOTFBmOsNonw8C/MrwYFDEEcMQLqkM+3tSo/FHH/x/GWmLXtoeXlUxv2SG
 A7VYkpkZ7ZxBGOo72Bf4ORw8qBKhV6Rw8U26U2aEWpUKyfWjsKY6V/vukMRcj/JtBrDY
 TZ9lpcAxN8LbL+pj3QKOwkXhXm6tYCaZN3vzMjxllLWFNBKKr/JrkMUO/RthI2GsjdP8
 OjONqGay5UMOts0O+n9Q2hCq9yUmGDU0D7n5519y42Q7QAM9AoCuuSI/pVuSZU+JEbZe
 ilzQ==
X-Gm-Message-State: AOAM531yq5QzqBpR7Cm80l/p5esrRF+0XQMGCHKzJqnwJbtGfZgQDne9
 IKG2/7dsOsBetLpxRMmNll7mdjN3KHqFzhQO/e8SRg==
X-Google-Smtp-Source: ABdhPJyw9wcy/vAjWZ534fGWZnouFc2vvtw4pcR/SBh/M85HrKYrTsRz17gVQOJwNERGX7rH1TL7mUrMZyB/6EqcRRE=
X-Received: by 2002:a05:6512:3b98:: with SMTP id
 g24mr24830249lfv.276.1629889183532; 
 Wed, 25 Aug 2021 03:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-21-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-21-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Aug 2021 18:59:32 +0800
Message-ID: <CAGXv+5GC=3E_Kzes1QKQtJykvGGugUUwjcO0EeDnmoDG0GHFvA@mail.gmail.com>
Subject: Re: [v2 20/24] clk: mediatek: Add MT8195 vppsys0 clock support
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
X-CRM114-CacheID: sfid-20210825_035945_070617_32006E1A 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, Aug 20, 2021 at 7:33 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vppsys0 clock controller which provides clock gate
> controller for Video Processor Pipe.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
