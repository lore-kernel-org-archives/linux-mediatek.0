Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E48C47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 20:09:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14E0120721
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 20:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZO6eQzHi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JZfLiVbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14E0120721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hUBE0ht6VrC/bSjSFDkUH0Qs5R+brTDvEKIrHYGxwQo=; b=ZO6eQzHi1lC5lB
	zCsCGXwzkmqa5zR9zDbV+XrstlPrPn72TYf2qw6DHm/x0apGCA4nVCBiI+J0cz4LZrNOw4zKSc1iz
	s7enRLWl0MaVhDUYU/rmJnKW9xdpyZIMa1AuBGcee2ItoUOgJd45pQak5mohRdIbHl2EwKyTBXkE0
	PXZ1RHHyLy+tYLLodDPwmZmqaKGpYZ5mF6Dw8MRvTVpYUj5eHmn0ZpHOZc5ErmPLLO/ZnkVdodPx1
	5QkJxyZ3jJ1nMHYv8ftTm3v0wOq0lRtpZqUzMNGdp5yd+emgqcbs+GQVg1K7LnQJvGf7bYWqiUu+r
	RV8KFpnAPrF5TMAoo2NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW3st-0000KR-NS; Tue, 05 May 2020 20:09:43 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW3sr-0000If-9x
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 20:09:42 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id b10so56880vsh.1
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
 b=JZfLiVbOazuTfcm+4u4Ye0gOFndtkBrreUkn1ry7gNBs4ECkgFDKdo/rHdu1AQBEAh
 nKFyCywESZj5Me5GBCATHxdJitFyX+6tAYa9RDi6KDchtEehsdOVIu9TApHb7HSPxGFb
 baKBP7c/tyVCnB2NH8zq6rKRHXhb/2wTgvjIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eb3sWwf5IKoZQzOvkPaaI1IVQ2HjKkCnRKRFnGOH6+c=;
 b=tTfdB1i4TRFM4w9Zi7hZhib+rqD1MPsvLcuMPAsVD7HT4qbPvcX/B41S5sajqLtRj6
 EfYnWE5GM2OBxvJe9GBGm2NmAZlKJSNo1ZowjfsGXVsr5PSKtC5UEAQwNcrkqwTa4jWn
 2pu945xI37NLXnl6eGDwYoJj+z2ZyOq+RyLFRRyIltgRNsqnPqxZy/anee1/iOqlWDxZ
 l6BPJktfvoquBTPilLbZnwaOlBpO57LkTJpNd8mxiVlrH62Dkhrxbr2o59KQ0+bu/hSH
 k7OjpMRdCnG+U9xrFFWhmNTf9dWP6v3utZu55UN/La1cIV9M2Oydi2QVzmjlgOEkijTB
 BOqQ==
X-Gm-Message-State: AGi0PuZ1lHgmBkDykyMuxXDW1lD1xPheBWTgUCXeoFz+h4+y9JfiW0qY
 OtPaVFGXofSGCAC+ugbIlpF0jNXqX13VXBMmPl/7qQ==
X-Google-Smtp-Source: APiQypJowiNqq0i+QKhqmj//hMMvq70bO2RQ9UV0gMFrlpNrwuxFoMcSnTC6aIq3Ry7VS3vRYjcYHV/I6y+hbezoCRQ=
X-Received: by 2002:a67:de0a:: with SMTP id q10mr5173302vsk.138.1588709377331; 
 Tue, 05 May 2020 13:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200505031331.122781-1-evanbenn@chromium.org>
 <20200505131242.v6.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
In-Reply-To: <20200505131242.v6.2.Ia92bb4d4ce84bcefeba1d00aaa1c1e919b6164ef@changeid>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 5 May 2020 13:09:25 -0700
Message-ID: <CAODwPW-9Yz5zBpSTGOuXzZnhkze+CX5hDAegMQiXs-d=cPgNWw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] watchdog: Add new arm_smc_wdt watchdog driver
To: Evan Benn <evanbenn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_130941_345294_17472293 
X-CRM114-Status: UNSURE (   5.42  )
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

Reviewed-by: Julius Werner <jwerner@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
