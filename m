Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D503C07E9B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 09:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39E536120E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 09:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39E536120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0P97rWjt225zZtunlAYr6YlF21TAsumop/yk3tEZwts=; b=LdlOzsRrlhHPe9
	7/ZuYeu81fPgZlw7UGBqJ7QaJV2IEvyKhQASDNALQBbTukXsgpeWi/rUNjEKOfoisj1LhFdthb8yl
	Ga91UWHWFa+hDCJqwbPiu950NzRiE5smEuyjbIec0mfBNpkK4CYTxpzopsV9LmuAm2X0D3tF+SHlx
	U0qhzyNXESBJbS4WfKtIlmgbCB+LiSYnOv7Lh3KRjGU+16PYiFdZB48DSFSjoN0NUQFRTIU6lKZL+
	kZHGvSdZ1ioudn9CNPbpcX5XU7hOSIGUYBCjhwNRWrz3OVy/gOH7aOULJ/mN+KTBWA7GsjVudJWXw
	SvzHM7iOUYmZEUjqz4YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5ldy-00CLjI-6U; Tue, 20 Jul 2021 09:02:26 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5ldD-00CLSg-1y
 for linux-mediatek@lists.infradead.org; Tue, 20 Jul 2021 09:01:40 +0000
Received: by mail-lj1-x22f.google.com with SMTP id j1so1259803ljo.10
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Jul 2021 02:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tnoB85UIIXDrQD64ueca3gaGjcMK04EaCPSYPJaZvpQ=;
 b=OeTaL4/IWvzx7LOmzrfp2LMLNMPHh/h/AFR2jUsByR4Td7VmN/9pAgEb5pXoQQVBs9
 js3HDiSsPKa8l3p75zcdnaHUecUGGrDaIZzXpU9cYALr00wiJLGRx29iHHvDex99Hk/l
 0uYLElvrpwEtA+XEFTMLPWbmnCDRbQDNZh2yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tnoB85UIIXDrQD64ueca3gaGjcMK04EaCPSYPJaZvpQ=;
 b=OixojuzxQmeg70fjiBcaX4wN95UnPju38bs+XiqBUmCMvdiBwKNnTDhrE1ZcdWbG3D
 62T6N4n2bd/4RkQEq6ABw2H+HepvFz0DvqTXqNGC+LfQ2nsX94AGKyzax2HX7JNV8iGv
 Hg0SIr+BLMghHyhPFnBIBpi9mGjli6FmQaUHKYAK9mKHHyGzNInof+3wDOrw0y5XWBvz
 DUr+TU0gP4imZ3e92h/W/zqEdED36wJNtAT5t4lLx/ww19eBEtvZxFKTi7GAYiiRJrFe
 dZBJek7Xtb2unUBq+biClGhDOPrtqjHZXBN877s+kPohh3QHLXIWmLeWdGSAlCvJpS3q
 TFtA==
X-Gm-Message-State: AOAM533MmDOqM8YMYxE08r80oKmKFySgFia1RIZSqT/FdRfI3UZOqRgx
 dHfryztyfbI9SZ4cAZDN3siaP3Q6WqDnL9oop2YNLg==
X-Google-Smtp-Source: ABdhPJx1bFnN8vnbajWZqUBg10wU5MRRWLphGYMR2NS1xt7mvLn7cSS15GlFPLwDFeVk794mBMeqqAGGpm+6n7kZURE=
X-Received: by 2002:a2e:760d:: with SMTP id r13mr3651436ljc.437.1626771697091; 
 Tue, 20 Jul 2021 02:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
 <20210705054111.4473-5-chun-jie.chen@mediatek.com>
In-Reply-To: <20210705054111.4473-5-chun-jie.chen@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 20 Jul 2021 17:01:26 +0800
Message-ID: <CAGXv+5EX=15JN579_NYNqr6wh5QZqW-_jGYFWuBehMTOZU=O8w@mail.gmail.com>
Subject: Re: [v3 4/5] soc: mediatek: pm-domains: Add wakeup capacity support
 in power domain
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_020139_130168_42217FBD 
X-CRM114-Status: GOOD (  11.25  )
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

On Mon, Jul 5, 2021 at 1:42 PM Chun-Jie Chen <chun-jie.chen@mediatek.com> wrote:
>
> Due to some power domain needs to keep on for wakeup in system suspend,
> so add GENPD_FLAG_ACTIVE_WAKEUP support in Mediatek power domain driver.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

I think this patch should have a fixes tag:

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")

And it should be either the first or second patch of the series, either
before or just after the cleanup (remove unused macro) patch.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
