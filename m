Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B89CC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 05:28:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC4F223A68
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 05:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC4F223A68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5OwzAI/9Aq0VQP6PcJAwtISUStMWle4GGK6BpY/V3HU=; b=t48fyOaFs1lZIxpdgACVkkDIq
	mSYNEhRgVHc05WLfzvkQrdSIjjwJ13jSEF8aEUWB5/6FP3cMKanCUz5tGdbDZEK33XPDVbvYBkchj
	Gq8NOfVk7+2nBwhBTJqeKHmx72cUjPEFXiuzov2CG4gU+ptvlJUvAhdjkEFH83UHJVbL7ebxlxnOD
	KKkUknoOmEpRV/MgSF8d3Jw6+QAOG8NnmT9+xbL0Gw7YzdQE65hg6UElWmtGUtdOMJig3ZEyuviqP
	lgL0fawfF46CQqEbG+l79/XpHD3enlZ2VNaIw37HPJVsbmf6Ux9/vGewhgx7VqiJMeuR3q/T9ytwn
	B2Q27CCWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky6np-0003uy-1N; Sat, 09 Jan 2021 05:28:41 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky6nj-0003tz-Q8; Sat, 09 Jan 2021 05:28:36 +0000
Received: by mail-il1-x12d.google.com with SMTP id w17so12547602ilj.8;
 Fri, 08 Jan 2021 21:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SGJ+rw+W4GURXrNK2pmbCTTGByeuvg3W5dm2nsGXVqc=;
 b=e6nx/kwcJM7VPuCBH5IWplKbkraC/qn24FmETITfB+AdMox+nSM0xHvvv708lOonRF
 DLeZ5Rv5WL3zZH7s3BMkI6yYsuPJPviDM+EONQoJBoZsQknXIkUtDrm1XLtJ98j2DZZU
 +A9uP+JUBpcUhflklMJS0Udebfu+ItwwQMHHm8CPwnlFVGUHruVn3bxs+ieOXxcQtbBm
 PZUdp6y2kDD/E3NJSdlQVlwg9ALQ3m1kV0xWLmtyseEI1E1xXowMUAqcS9rZG3ibxGkw
 j0jKB8OMKpdsZyCG5jGmwn2n+7/kV+Q6Svk1AVRJBlVrV2y8XOV/IJGVQ7nKPPt5yRdK
 Je6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGJ+rw+W4GURXrNK2pmbCTTGByeuvg3W5dm2nsGXVqc=;
 b=AkimgVpypENQxhWK37o9LA3XwdCuDx3AUl48b2UluFCP8hlXKsWM301QctqT3ChYEO
 ipDXGegj8CJSJ5PLcNehOoOG1jpZ3/ptCcoogw1lgq+abT3a126X5mFj4xQrb0yb/+NC
 eE8sLMDpW66fxAJe9aW9Y0d/YoqhRANELkaNFcR4BPSa5sNqO8xpjPJJ3+XcDu0UrejF
 KVlr6HeM/IdS9qBPBybNreEAvCu7D4+RVQ9A3PVqKqe8BHx9cMQ/zpkqd90+Al4IIyS0
 5wnXc4bEB3SAdEJMRnvDGUI/SPB5Cff4D/cZJgvzWa/t1QhkaW9Dx2GINWFvrj/cVMwH
 54ng==
X-Gm-Message-State: AOAM532ukk7YbJ5O7q5pwLfX+Mw4UGHc76PUb88Lb9miCOUXdmsHj3xa
 RN1pP8uVPs7aD71oDRK0QMf2MvqOqzL9UjFitWE=
X-Google-Smtp-Source: ABdhPJwXmdm0hnvBNMln0jDzDSyCadfT8/QRKEJtLxxdHSdh9mYMK50aw50mzokAvARDzxSWoWjR2ryTm1PXaEOQz5w=
X-Received: by 2002:a92:d40a:: with SMTP id q10mr7326896ilm.20.1610170112894; 
 Fri, 08 Jan 2021 21:28:32 -0800 (PST)
MIME-Version: 1.0
References: <20210108025155.31556-1-dqfext@gmail.com>
 <X/ijjWpq4eLQEDot@lunn.ch>
In-Reply-To: <X/ijjWpq4eLQEDot@lunn.ch>
From: DENG Qingfang <dqfext@gmail.com>
Date: Sat, 9 Jan 2021 13:28:30 +0800
Message-ID: <CALW65jaWwhiWbr1kcEW3OZEUcGYUO9_vmT7PhA+u4SvVGdEgRQ@mail.gmail.com>
Subject: Re: [PATCH] staging: mt7621-dts: remove obsolete switch node
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_002835_887076_F61EDE97 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: devel@driverdev.osuosl.org,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 NeilBrown <neil@brown.name>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rosen Penev <rosenp@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jan 9, 2021 at 2:25 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Jan 08, 2021 at 10:51:55AM +0800, DENG Qingfang wrote:
> > This was for OpenWrt's swconfig driver, which never made it upstream,
> > and was also superseded by MT7530 DSA driver.
>
> What about
> Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt ?
> Should that also be removed?

Yes.

>
>        Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
