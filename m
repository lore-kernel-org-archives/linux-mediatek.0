Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF12C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 17:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VS2BzFYKAolsNat9wyZK+OK7oQITTHm6Vb53qON0eds=; b=VyuAQTAyPJhrUFILR3vIwbv6Z7
	T8+Wq/cxEBhV9wOpyoD7TBuvL8W2yKG0YWSu4nEpf08x4gz2JiGQGBKfp3IrAHrExghqdEh5YnYbk
	qHAOCYY/XVLCbImhJi/cPEg0zjjI2o9wRsYjelQWhIwWASQi4zlknwFzaYKLN2SNQRDlg9Ld6xFGx
	AKEcJgGLp/idcEgg/OfFqV6sE115up4zAe55lNcj6cC0JYbfNK5qVtehndHBXiw0CerBgZSYzAmSd
	EGLnMABuYngEF9Djfw0ciE/THBu8As6rce6lZe69sNYtX9XwjzhfZKmLZS5W4MEcs7y5ewedW1pHy
	uqa/Uz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5Wr-00781I-0J;
	Thu, 27 Apr 2023 17:35:37 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps5Wo-0077zu-13
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Apr 2023 17:35:35 +0000
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6a5f6349ec3so3669550a34.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Apr 2023 10:35:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682616931; x=1685208931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VS2BzFYKAolsNat9wyZK+OK7oQITTHm6Vb53qON0eds=;
        b=ALS9eVjtY0/Op6ZF1oAXHkC3yKe/3gMMNJ6Oj/Cc+VbqNJudDBtpCRCwz/P+lTgqYH
         y2ZZkPAXv7vuDS5hL5xcTVSOa+leQ4LMWJGhTAGHaboVimQv7Ax0m4BkjmSLNx79TdI/
         zpfUfnj6E5vcVaMQ8nXAATy/TqbP0lMndDogd+8/cIu1IxDIStKd4gh/5wYFazAL3UVo
         fsHbYwDc82ZbHTpDEc5EWzTkIV9ujU2ImbIo5R+QaiaUA8fh+VIodichXW2WT8DmkNPX
         DvQLWikX9voTDv8315GxJeEWpE2cGjJJ26dzekSOODbOj6pJtP6STl3neJC5LrCZAJ70
         FAFQ==
X-Gm-Message-State: AC+VfDyStakaF3UfXyB29Et2GsBhmUBys6Qee0tuB6Jh4KCimZCxUA6L
	cnkL1dKK4PLohKp65dQKlQ==
X-Google-Smtp-Source: ACHHUZ6ddHGGah/wSHp7AFR/6L61y0V+EFA9mkWxr0viW192TYKd7OtQlFDnNHKOzpEZD60myXvxKw==
X-Received: by 2002:a05:6830:2054:b0:6a5:ce05:a5b1 with SMTP id f20-20020a056830205400b006a5ce05a5b1mr1200472otp.3.1682616930360;
        Thu, 27 Apr 2023 10:35:30 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l2-20020a05683004a200b006a43519523fsm3592765otd.1.2023.04.27.10.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 10:35:29 -0700 (PDT)
Received: (nullmailer pid 3205401 invoked by uid 1000);
	Thu, 27 Apr 2023 17:35:29 -0000
Date: Thu, 27 Apr 2023 12:35:29 -0500
From: Rob Herring <robh@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org, linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: input: goodix: Add
 "goodix,no-reset-during-suspend" property
Message-ID: <168261692866.3205353.5077242811275926416.robh@kernel.org>
References: <20230427035656.1962698-1-fshao@chromium.org>
 <20230427035656.1962698-2-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427035656.1962698-2-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_103534_364501_0AFE7996 
X-CRM114-Status: GOOD (  14.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 27 Apr 2023 11:56:55 +0800, Fei Shao wrote:
> We observed that on Chromebook device Steelix, if Goodix GT7375P
> touchscreen is powered in suspend (because, for example, it connects to
> an always-on regulator) and with the reset GPIO asserted, it will
> introduce about 14mW power leakage.
> 
> To address that, we add this property to skip reset during suspend.
> If it's set, the driver will stop asserting the reset GPIO during
> power-down. Refer to the comments in the driver for details.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Use a more accurate property name and with "goodix," prefix.
> 
>  .../devicetree/bindings/input/goodix,gt7375p.yaml        | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


