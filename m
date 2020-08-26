Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C849FC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 14:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9577921775
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 14:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m1t41oqL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXopgi9P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9577921775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MOx+orMpoqtnXMuuQOHwJkwXemOzeaDwvqNOE7CxOUs=; b=m1t41oqLGFsd160d+pvIgqTYr
	n0/iCIkNAxh+2yhTB5ry1t+QnfgCZBl8cuKxKdR/mPy5dl9Lf1HT0oxWWhvh8QFTvJjac0w4pL56v
	hkv8emi06wZqSrNtX5EvOTgc/YeNRe13Hw9kALTVATUWRxo5djHYlFToJXWImtjav33m779AgKmS/
	NYBTad2mzERVMgbOzNRSvpcacM0+peD+FwpVpto1GtgsqqYmOYwjvX7h4iOpzs2/iggk0kxGtS4MV
	s800mLlrt74gXPJaBSou4atlfJMbyo7mOaoA3h+O6/Yu7q8therHwNavuig0c1jxMt+NrFi0l28gf
	3snpHjfDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAw7T-0003ED-NZ; Wed, 26 Aug 2020 14:09:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAw7Q-0003DP-0X; Wed, 26 Aug 2020 14:09:40 +0000
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AA6E221E2;
 Wed, 26 Aug 2020 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598450978;
 bh=tFCjOr0R190PpkARyCST3lICzYxM/ZthkVfxCLXvO3U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iXopgi9PAVg0rrLF6wEKxQewKaaUQDYBze+2jEaVk3n/xv5J5iZPg1oo+H/0nE+hc
 KIKTV3/yGeCT7/HvF/J1fb2gV8lgEbgzBUkr1M4TMcV96LCqPWZ9wlViOwyWc76+M6
 r+c8g+Lw0+uu2f7K6K2iUb1xLLhkIGlP63ci6O6Y=
Received: by mail-ot1-f47.google.com with SMTP id r8so1577432ota.6;
 Wed, 26 Aug 2020 07:09:38 -0700 (PDT)
X-Gm-Message-State: AOAM533VdYrae+t/m4YEMGNYxWBByLP/Bb8Vxa50Uiwf1mFB3kJs7EmF
 3Ai6mR7L3XA6N2dnrGuxZAscG7aWhjfbyysiDA==
X-Google-Smtp-Source: ABdhPJxb7HPcDBydxGstFvQOelSqMG94Ig9YQ9BwLO3iFb/F7xuuVOY2fu9j0ePFE7T0hzpHztUfdayGVmXN8L1pIJk=
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr10340661otp.192.1598450977458; 
 Wed, 26 Aug 2020 07:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200820052827.2642164-1-ikjn@chromium.org>
 <20200826085450.508556-1-ikjn@chromium.org>
In-Reply-To: <20200826085450.508556-1-ikjn@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 26 Aug 2020 08:09:26 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLVe2yg8RdSZprV00xu0X32Tk69t_jC1Td-TF+z1BYheA@mail.gmail.com>
Message-ID: <CAL_JsqLVe2yg8RdSZprV00xu0X32Tk69t_jC1Td-TF+z1BYheA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: spi: Convert spi-mtk-nor to json-schema
To: Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_100940_150720_6056EE04 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>, linux-spi <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 26, 2020 at 2:54 AM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> Convert Mediatek ARM SOC's serial NOR flash controller binding
> to json-schema format.
>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
> v2: remove unnecessary quotes, set interrupts as required,
>     add unevaluatedProperties:false
> ---
>  .../bindings/spi/mediatek,spi-mtk-nor.yaml    | 85 +++++++++++++++++++
>  .../devicetree/bindings/spi/spi-mtk-nor.txt   | 47 ----------
>  2 files changed, 85 insertions(+), 47 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-mtk-nor.txt

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
