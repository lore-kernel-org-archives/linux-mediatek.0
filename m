Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B03C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 22:14:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CBB2076B
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 22:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zx0i4VE0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vB/mP0Ns"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20CBB2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6dwDJZDTkwxcT8Wgu+vQaNGZ2vCgM/x9y+536t7u4z0=; b=zx0i4VE09oU5pnkFIjC6SiZTo
	4uzbpE6rIeRvs1FU8bwsm3WR+VzXsVILjTEZzIjugQhbs0iGcmYqhAtIE7O2Pb9wAnjUM2Pz7+Aao
	ze/LCTvsHy6V/qdb7bAO85VNsMKw1H66ePTK8yyBVG4x6qbTdUcI5Acl1WarkbCPMYPCyKpstwIeo
	YZdJ9xxDwUFeiM9qVT7DAvIlP0hBupSnUucJ0EN+zDM39sVYlYhAikcNoRBUZ3sGxSf6bwjLqLqiv
	dv+6ytZVdpkEF4ZvwFKcF7xyfsCMZbaCkDduZrSz+4HSOH1ycUa46wxLLtVDRLzcPazzEdjSq4zQ8
	9FMI3BgTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5z0Y-0007sd-Hb; Wed, 12 Aug 2020 22:14:06 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5z0V-0007sA-OB; Wed, 12 Aug 2020 22:14:04 +0000
Received: by mail-pf1-x441.google.com with SMTP id d188so1730332pfd.2;
 Wed, 12 Aug 2020 15:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lW7/4eKV/BIv6DOQAynrxiasqUawM2e6k23o2vSUtRg=;
 b=vB/mP0Nsnkr6cRD7/pR4Cz9oQ3xTivBb8JU/zagbvd3bAkgkx0xOy3XIdZXG1nnTPd
 byRxNsMP1miGLAcBNyEgQGtQV6e4G963v8jG2ihlzbKYjujy4E2DEk1Ag+TNZXKeJ6Uv
 Z3/aQc2CFYLFBVKxLRlb/5kSSvzzJiME3hgk0DMuwNH9XJc9oqp1lmxgc43DGK4Mzs+L
 K5AgbrC5KZAzjIXDWmdiawfuxysWR+U8/xK/oQgkU2FHf2STI9AQBdt9PbHy9RIdlrNV
 GJe4xOnig387XFN8v+7AGgFyUcptGoYATA9GlqmPLbxSwx9SbCKhlgKYytX+x6W5e/0P
 UTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lW7/4eKV/BIv6DOQAynrxiasqUawM2e6k23o2vSUtRg=;
 b=Kbs/scYsGf/XIYQ9fmDpeDHx+E2fQrK62Qf+eXqUrFqRxZtEYduZnPNj/wg2JXnX1l
 8ZVBQCNe6+Sg8TZ4tZedRYYJPHIpOLic926C38EWJ4zx8eTN8Tb+9AAK6AKlKt6asvc3
 Adp+kVSay4axyCrO/7WG4R7h/mzw2HOaGjw0ec8UogfBUCBefa0OV+lovZvNWg4B1DlG
 KmCs4Cr2Uqa4+y3oeuNRLu5KgtB12BtuSjcC2QGHsBzmp/poinq8s+IT7rOUFpKMLwUy
 E8ImkwaRDnC07YOTbQyQ+I6ppRLjX15ar/IxxpBitphK9A6fNrVrcRXNoIT+gRyVWrqV
 rYLg==
X-Gm-Message-State: AOAM530agb84OBwXVEIT77TBeWEHwv3qwKi4X+UyFQmk6j2/SiPgUeQb
 KS6PMXnlLHIT3ezeHGw5S4M=
X-Google-Smtp-Source: ABdhPJxXev+6QoPGs9bZPI7LelcdOihL8c1PxoXHznyZAiNi1UYiit1+dSyyAauBMLff8UdiLX2Otg==
X-Received: by 2002:a63:e20:: with SMTP id d32mr1079233pgl.53.1597270440514;
 Wed, 12 Aug 2020 15:14:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id d80sm3428651pfd.22.2020.08.12.15.13.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 15:13:59 -0700 (PDT)
Date: Wed, 12 Aug 2020 15:13:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH v17 1/3] dt-bindings: Add bindings for Mediatek matrix
 keypad
Message-ID: <20200812221357.GS1665100@dtor-ws>
References: <20200810064058.6467-1-fengping.yu@mediatek.com>
 <20200810064058.6467-2-fengping.yu@mediatek.com>
 <1597110443.22273.5.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597110443.22273.5.camel@mtksdaap41>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_181403_809096_CC404BE5 
X-CRM114-Status: GOOD (  24.40  )
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
Cc: devicetree@vger.kernel.org, Fengping Yu <fengping.yu@mediatek.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Aug 11, 2020 at 09:47:23AM +0800, Yingjoe Chen wrote:
> Hi,
> 
> 
> On Mon, 2020-08-10 at 14:40 +0800, Fengping Yu wrote:
> > From: "fengping.yu" <fengping.yu@mediatek.com>
> > 
> > This patch add devicetree bindings for Mediatek matrix keypad driver.
> > 
> > Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> > ---
> >  .../devicetree/bindings/input/mtk-kpd.yaml    | 87 +++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/mtk-kpd.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.yaml b/Documentation/devicetree/bindings/input/mtk-kpd.yaml
> > new file mode 100644
> > index 000000000000..d74dd8a6fbde
> 
> <...>
> 
> 
> > +  keypad,num-columns:
> > +    description: Number of column lines connected to the keypad controller,
> > +    it is not equal to PCB columns number, instead you should add required value
> > +    for each IC. If not specified, the default value is 1.
> > +
> > +  keypad,num-rows:
> > +    description: Number of row lines connected to the keypad controller, it is
> > +    not equal to PCB rows number, instead you should add required value for each IC.
> > +    If not specified, the default value is 1.
> 
> Your source code can't really handle dts without rows/columns
> properties. Also, the default value doesn't make any sense. No IC will
> have rows or columns set to 1.
> 
> Since these are IC specified, not board specified, I think you should
> just have the correct numbers in driver.

It is actually property of board to decide how many keys it wants to
wire up. In extreme case it will be a single key, i.e. number of rows
and columns will indeed be 1.

Thanks.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
