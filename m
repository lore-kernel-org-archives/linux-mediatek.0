Return-Path: <SRS0=CwkH=6H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A1BC54FCB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 22:17:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F6A22074F
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2020 22:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qX6vQyZJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MVrB7pta"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F6A22074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yWBmhpH3I2Jm1MAioeexjFz83/F8Ib5Nm8/L+/QpaHk=; b=qX6vQyZJMqrdtC
	JdfuA5CSBQNn3VgswZGutKtpKWuFwMY3IV/oUYGfGQ49UrZUC5RY2leV5+WTJzuYt5P/iezzVY+k4
	dZb5N8Gh8HC7qUuHCOfDHTP+fCMgXxUOk0ExBlMgnomqIqcd+qG4HMKOGXw+Nehg3GncKNrplaEzm
	+3mw73N5tI4iPp6/97stPj2ONYu/5AqBHGpxDSs0jR9Zwx3XxUvSZvTlRSfhGTkCFi+1QNdJn053t
	mJX0XhQDlUxc9a5U+/LwM0HT64EkvhguV2tHkZjhsWU0nBxqhRctc49T0zZo9oO5UoxGK9EByWE8i
	Wb0UN4h/evVAYVwxjnHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRk9x-0008Oh-0Z; Thu, 23 Apr 2020 22:17:29 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRk9o-0008HX-L4
 for linux-mediatek@lists.infradead.org; Thu, 23 Apr 2020 22:17:21 +0000
Received: by mail-ua1-x943.google.com with SMTP id z16so7501327uae.11
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2020 15:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImyDKT5GUuGx4UdReAU1SFZBdyoyuA09f+p98B9B22U=;
 b=MVrB7ptavsGiQQua0Vjywdn5LaMTu4XF0Z1Ou35iDTtlPrECrJF03b1X9OfQreT1Sv
 Vrs6/p06qmY0edU5rq5DjBnn0HF8gPWw2/bsLkke5gs8JhP6nZqduiZuAIPqaK/geeaF
 9jGZybC4kWQR1xAWiRngZ+uRtePeQ1MeLOEvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImyDKT5GUuGx4UdReAU1SFZBdyoyuA09f+p98B9B22U=;
 b=PBmLDp/JaVQZn0hF1dOGkzo+J0HKU4jKTo7f1E6z520YAoDx5ShgkyM6dkJffpLxyy
 PWZ3WesfLvdT/Qwh8a6LNnXLftDpbDF3YXabQq+YM9sDJUISyTkprpCtuffYWISHQ56y
 3fYSJocKuaJ21Ed6YxA5dFx6i3oThRyr0mrmEKGwoRJHrSvkLKi7VrQIcXCZ71IObxlE
 +KJKMSUKo/rH3TYM29nFaN7tfLEZ1K+uH/Nm93ovOD4NdbvqyWWOrbBD1SP875IYvWeE
 23Yn7dWeowYxYSW8Vnc56IlC/+Y6aBjlt1hyEz3cvybQX4TlaXVwIbqFUAUO31D3JJWe
 U5BA==
X-Gm-Message-State: AGi0Pub3OvccER+GE9e29j6qtjkCb2u6a3SfIg9szeZ4lIrVJb4132EJ
 j/4ezfDzrHJyDKKaafIE73fZkNmBl6YfmgPbhymBaw==
X-Google-Smtp-Source: APiQypJDlCWw7UIoyUEUjtlXhQdYSbXsrKe/ELL5y8iA5voVOv7hSWTM7nSU1GgatF1cMHiK0C9YmT8nvji7Iv8Jnmc=
X-Received: by 2002:a67:1447:: with SMTP id 68mr5466353vsu.163.1587680238725; 
 Thu, 23 Apr 2020 15:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200423044036.234578-1-evanbenn@chromium.org>
 <20200423143945.v5.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
In-Reply-To: <20200423143945.v5.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Thu, 23 Apr 2020 15:17:06 -0700
Message-ID: <CAODwPW9-c8EcZh_zB6SwohzvHtCQasaNLQM0fj2bj5O5KuVPfg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To: Evan Benn <evanbenn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_151720_721329_D57EF9BC 
X-CRM114-Status: UNSURE (   7.98  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Rob Herring <robh@kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Olof Johansson <olof@lixom.net>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +       err = of_property_read_u32(pdev->dev.of_node, "arm,smc-id",
> +                                  &smc_func_id);
> +       if (err < 0)
> +               return err;
> +       watchdog_set_drvdata(wdd, (void *)(uintptr_t)smc_func_id);

Your device tree binding says there's a default and this is optional.
I think you need to change the code so that that's actually true.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
