Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B865EC10F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 10:10:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 394E124682
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 10:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLw5Uk3k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxEsvkqO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 394E124682
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44M89DuptDwBli2RWw9n3MywHxheLd4c6+59YNUoc4Y=; b=PLw5Uk3k3RtnT6
	IERxYobzU8+VMG3ANXmRXhwMI2/wKpACOjO8ybIaUNAoa5RyXtYl2h132uunZqbO8p6YRLfgfyWzv
	YtWrLNefUuQDQeER2KyXmb48zuilP9hl5d01Sr5yestfQI5iEwWzEoQT3gy0g4+4W4abEuve+NhJP
	bkgyMUXbLuWnA32XOjrizkrAdACkixxGzGAq2gkMo+YOKZI/TZNoC/vWRMTjGPx7sXOefX9/PKUH3
	MCZ/81TjxQypPvJFseAJ7kuqKEDdRS4JpIRkgzyOG1WdWji6qTcWS+6njQv/MNxTsRxH+W5TX/9Xq
	lCboyLGGceSc7h5430Ow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBbq4-0000iG-R0; Tue, 10 Mar 2020 10:10:16 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBbq2-0000h0-Ad; Tue, 10 Mar 2020 10:10:15 +0000
Received: by mail-pf1-x443.google.com with SMTP id c144so6246670pfb.10;
 Tue, 10 Mar 2020 03:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HDXFysJpdV8VuCGjPdLDxQClbolL707s7Oy1HPUOvA0=;
 b=qxEsvkqOujZodAPp+3ueiAK0DjURCF22GunvMK9QN+KklKRMgATwVgcV9c0hSNEUCz
 TAQI5Ohj0cXhf/epw5T+HSN+GE95Tk9gtrafCmMXl587W/ZgpXygCTEZ8vK3SmVb0TIF
 uCehoekTjWV8oLZEDYH8SAa37cT7XZXW/UyahoNZGp6tA8T6lpOy11ils26Zg59WR04z
 CaSo7Rz+ZjrxbxEp0CTNZ07mZ+HX0zl/t7wP+5ThGovd9CjakbU2IQiOFppgt8P+7p4W
 0Jn/7ZK4Yom5kVH/GKtFiX3Hx2gWwpA1KdqhDJiL5ONFS4LALreASK682L6CmTe75aHs
 qIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDXFysJpdV8VuCGjPdLDxQClbolL707s7Oy1HPUOvA0=;
 b=lIpj2noN4pCfR/YM74h5yXl3bHAP1BU7DXTQcl0KtqSzjz5NeHyQCPgOzHUU1VaplI
 2t3BGqg9UQWXe2Cvh71H4KYPy2nKUfbnmkH9ZS3Ay8gIqxIp3PMAXXsbugfL2U/Jr0F6
 L9i0cE0gtuoxbru0GLjOMRG6UnPvTUoWsAMglcqD+DC+BC2B2fg8YyOFD0AjZrNatJSu
 IGUr3gHa8QTg29ncuNFXFJabNXgGQjKK77u6m6eqF3xjwkV3J+vpSBbcwAg90fv3AtHo
 KgIk4TM5sbUu+cyjpmviY6ov3w/rjVv7aLeZR2aRuMgq+V1HnZd8RhpVEQH76PH29pkR
 aA3Q==
X-Gm-Message-State: ANhLgQ0siLSzq8y2LtZje/79FXaytDp605BioPmLVnTIOkwQCRQ3IY5i
 UBOA6xR+JWbUJna/f4Bm9H7nK6yTT4um90KCcDY=
X-Google-Smtp-Source: ADFU+vvLJ9Bi1/5PtpdB3XdQzWlug4LKrI66cLqdLbaY0Kfs/y64+i228nQqpbnk8BVnj0qLhHSGLoQoUU2CFCR3CCI=
X-Received: by 2002:a63:1246:: with SMTP id 6mr19811313pgs.4.1583835013383;
 Tue, 10 Mar 2020 03:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com>
 <20200305120516.GQ5379@paasikivi.fi.intel.com>
In-Reply-To: <20200305120516.GQ5379@paasikivi.fi.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Mar 2020 12:10:05 +0200
Message-ID: <CAHp75Vf5km-YitoTUAFkr8LZVq2QMep1rC19ZpR-YRbeXgJOVQ@mail.gmail.com>
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_031014_413568_7734F3E6 
X-CRM114-Status: UNSURE (   9.38  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream@mediatek.com, devicetree <devicetree@vger.kernel.org>,
 shengnan.wang@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
 louis.kuo@mediatek.com, sj.huang@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, bingbu.cao@intel.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 5, 2020 at 2:07 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Fri, Feb 28, 2020 at 11:59:58PM +0800, Dongchun Zhu wrote:
> > This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> > and provides control to set the desired focus via I2C serial interface.

...

> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5139,6 +5139,7 @@ M:      Dongchun Zhu <dongchun.zhu@mediatek.com>
> >  L:   linux-media@vger.kernel.org
> >  T:   git git://linuxtv.org/media_tree.git
> >  S:   Maintained
> > +F:   drivers/media/i2c/dw9768.c
> >  F:   Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml

This has ordering issues.
Run parse-maintainers.pl to fix.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
