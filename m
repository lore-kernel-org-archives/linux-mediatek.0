Return-Path: <SRS0=9cIZ=6F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC90C38A30
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 01:09:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713F32078C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Apr 2020 01:09:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IwWtJCcl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jGemw2P2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713F32078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oe7n8XMr2lc7iJu05tPVWRZQ42p2duNdwzLzou3eV8=; b=IwWtJCcluyfR27
	5aDTanZAY3e3Qe4Zsln7btMOIcc8S8GGngjf4t49lG8hChuAcDJldXdGNQAJ4RH8pWdsLac2npXLW
	ID5PWdtWpyGkORJ7jzau3W+2twdZVscYt18VJeGh8MGKSJ9oIFDkZ8SFE2YKg+ItHPoHPaLhyqzjp
	Zq9OA351RJU3yedu+QcZkXzCJXxJ/3jrDSQ9WiJFZ3os+YzT1fuemfgl9MT+d2ZU8ROv3o4sI4oGu
	LLIERMJ2LitGS+3tl40j1qvVkP7iXIxf69KLZDJWr0yPX6b4rVqY53qMVSuvPNXHwx5MAeNd7Lsfg
	DUB54j/MWGrdCjO+HBtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQhPr-0004lh-4i; Tue, 21 Apr 2020 01:09:35 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQhPo-0004jv-TS
 for linux-mediatek@lists.infradead.org; Tue, 21 Apr 2020 01:09:34 +0000
Received: by mail-qk1-x741.google.com with SMTP id 20so12907392qkl.10
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2020 18:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFRq3RluqVTW3eItiffvhrul27fygOSDx5LOp792/cY=;
 b=jGemw2P2rq8+zKge7bcDV6mMP5GeCYSBjW21Yga4LFd+SRnJNGAo1LIyCZsecJrAj+
 3Y2nk68i50FiVZkjKg3XewJTSb85k963UHIJB4QyqWe/KfxK1rup1VWPKA6RhXdb/LbF
 ZALCrIEKJacoE0XvLyBHMyRJFtUd8Qd5IXRqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFRq3RluqVTW3eItiffvhrul27fygOSDx5LOp792/cY=;
 b=s3GRgCJbRbUmrijKRgEjBtj5PMLGiB8QyOjOAQJjHsD9ZWUwRIKh/kin2jFZKjYXIh
 Lkl3rOBkQ+977/PyErpnqZERVO3+uzIngy5dS8Ycv/31KFwYfiluVBK289V/HUMSh1L2
 672vTcLu/qarz/OVKOYq4IGNaJgFKl1S1PSVDnXQoVPf8W5VnxPSoDxqEVG7j5pHZ80f
 Z8HOWtCyGn866uB6oJSGWYFkco2TwLOJu/rI0yRUloz2RbLW2pjw5dOgx9F+b2xtB0qH
 UF5vYKWrk5olNojSERviOPCiyux7UlJqZY+R+1Qa5S7QpCxtLijliY4WMn7Keq+Z1udn
 Lj0g==
X-Gm-Message-State: AGi0PuZutRji11ApyhFyuhCRsk1Sudd822vXcYNeOKvZTFXSX6utm0yH
 N4lWX0QZtgajrqabA4HxbG7r/v/6KeU=
X-Google-Smtp-Source: APiQypJqPyDCjXMy+1e8CI3MO9LKruxesrNX2rJ62CH/PRsZDQ4A/50i2bucREohiYsQZz7iNGo4KA==
X-Received: by 2002:a05:620a:1458:: with SMTP id
 i24mr18766089qkl.279.1587431368917; 
 Mon, 20 Apr 2020 18:09:28 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com.
 [209.85.219.51])
 by smtp.gmail.com with ESMTPSA id s125sm873090qkf.9.2020.04.20.18.09.27
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 18:09:28 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id p13so5773837qvt.12
 for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2020 18:09:27 -0700 (PDT)
X-Received: by 2002:a67:d61c:: with SMTP id n28mr14119322vsj.70.1587431365930; 
 Mon, 20 Apr 2020 18:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200403052900.258855-1-evanbenn@chromium.org>
 <CAKz_xw0gV+w_gMkLfB4qUBdULLfFoiv1TBWp9_PHy33wP_XWyA@mail.gmail.com>
 <890948ef-7276-fdae-d270-eb30eff3eab2@amlogic.com>
 <243e107c-35c1-2d14-5285-c9e13744963c@amlogic.com>
 <CAODwPW9RSB37+4EJ2QXAwz=ShFB23L1GKC2mLYE5L5JuQR2tPw@mail.gmail.com>
 <20200415231215.GA182398@roeck-us.net>
 <CAKz_xw0+gKBM1jp-Avnd+4j9vSxUix67RZBX-NNbStb0+ri4+Q@mail.gmail.com>
 <CAODwPW9Vt7TcWfKYDmRgLndb2-+5HoNvA6XMJJznXCudQDngqw@mail.gmail.com>
 <9d029a04-2a37-cbbe-1932-be34d34f6b69@gmail.com>
In-Reply-To: <9d029a04-2a37-cbbe-1932-be34d34f6b69@gmail.com>
From: Evan Benn <evanbenn@chromium.org>
Date: Tue, 21 Apr 2020 11:08:57 +1000
X-Gmail-Original-Message-ID: <CAKz_xw33YBChSCDHcki2JCR=LXrvfEN2pseEN471xVvqhqrUfA@mail.gmail.com>
Message-ID: <CAKz_xw33YBChSCDHcki2JCR=LXrvfEN2pseEN471xVvqhqrUfA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add a watchdog driver that uses ARM Secure Monitor
 Calls.
To: Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_180932_972647_83D9939F 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Yonghui Yu <yonghui.yu@amlogic.com>, Leonard Crestez <leonard.crestez@nxp.com>,
 Will Deacon <will@kernel.org>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Olof Johansson <olof@lixom.net>, Julius Werner <jwerner@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks Florian,

> The PSCI binding itself has provision for specifying function IDs for
> different functions, and this seems to be followed by other subsystems
> as well like SCMI:
>
> https://www.spinics.net/lists/arm-kernel/msg791270.html

Are you referring to this line in the devicetree linked?

+- arm,smc-id : SMC id required when using smc or hvc transports

I cannot find any prior definition of this in the devicetree yaml
format, so I will add that as well.
Did you have a link for the psci usage that you referenced?

Thanks

Evan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
