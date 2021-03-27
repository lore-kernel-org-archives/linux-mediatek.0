Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC2CC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:26:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2D1E619B6
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 17:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2D1E619B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G4KSDKDAMt1vin3tz1LxxHtHMYwJHEdKkFwA/hNL4mg=; b=BPda/9jzDvido6CSSU6QSrcxW
	A2tkQhMoVlwgXCPRUIlh3YaEf0dLq3EcLVlzPnGph1ravYLDnl1SiAjk6N83E9RELY9W7HW8zKV+S
	vVw7WmlHOaMUY+gjOXFGcGPzSIGOWiWxXc9N5WXfXI6MywVyywmcXRYUlaCo4jvVa9E2wh/zIvfEO
	6DJ26uQ1aprw5ulh/RwAURVmNt05cARWg+/M5MXtWPwjP/dqzbuKGmlXH1QlOdkVDG7Li4ROZ+Jk3
	Y2yb3cF//Yy2onJSWHu1Oh81PKsCTvk15aO8I0ndoaq85sIuCCkQucHyUnA0EV/Zk4Kyl/KqbLTPc
	7LflonmUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQChO-005LQq-TG; Sat, 27 Mar 2021 17:26:11 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQChL-005LQJ-PV; Sat, 27 Mar 2021 17:26:09 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 i20-20020a4a8d940000b02901bc71746525so2052544ook.2; 
 Sat, 27 Mar 2021 10:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fH8tFDCOC308K03FzLFQnKsXtwxVkfLVBbvAS7mmuAs=;
 b=Yiwkmpyxh/2HLkCdXMzWaWXPEO3RWqLmtIvyIYGNASlUakmITZ6C+vQT8kNiA0NS5s
 5Ouz/hJ6jibEM2hVVAQcVhEDbYOYF9IYYDuJumDYJaRgPrBvoUyLDRS/xuCOZwRUn5Aa
 HYyI9kgrtW3BS3ykAZMpOORS8qDH/QBaHj06yBAE6bzJTeSjDXzSqZ/ZlOoAlsC0SOn4
 6CCtmEtM/ns5ShQ5dXjtwolXWSXf9laIylMtM7mt4yuO4uUNf3/BKfdErS228WPNRGko
 EfqTvTo5Xxhcpjzg13EWNaWOh/cjme62/6/T7CUZ8YTEllkW3HVns0RfnebIVrfdXAbB
 7OLA==
X-Gm-Message-State: AOAM530vdv+8uK2aqVNZP1d82Ea9ceuMLmc9p9wbS+JFwRrrLPyXzc9R
 vM3wsk/f8HjUYEBu/bP6PK2iRdoXXw==
X-Google-Smtp-Source: ABdhPJxpFQVOG8TULBsrzj0l8Wudc/RJmkTuXOUoCC7m4aOnpwmBhQIraJ5U9iCAmR3S4cff9KiZ4g==
X-Received: by 2002:a4a:244d:: with SMTP id v13mr16117313oov.66.1616865966573; 
 Sat, 27 Mar 2021 10:26:06 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
 by smtp.gmail.com with ESMTPSA id g6sm2713086ooh.29.2021.03.27.10.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 10:26:06 -0700 (PDT)
Received: (nullmailer pid 277866 invoked by uid 1000);
 Sat, 27 Mar 2021 17:26:02 -0000
Date: Sat, 27 Mar 2021 11:26:02 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-kernel@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH v2 02/13] dt-bindings: usb: mtk-xhci: add support wakeup
 for mt8183 and mt8192
Message-ID: <20210327172602.GA277819@robh.at.kernel.org>
References: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616482975-17841-2-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616482975-17841-2-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_172607_969459_0373649D 
X-CRM114-Status: GOOD (  13.46  )
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

On Tue, 23 Mar 2021 15:02:44 +0800, Chunfeng Yun wrote:
> These two HW of wakeup don't follow MediaTek internal IPM rule,
> both use a specific way, like as early revision of mt8173.
> 
> Due to the index 2 already used by many DTS, it's better to keep
> it unchanged for backward compatibility, treat specific ones without
> following IPM rule as revision 1.x, meanwhile reserve 3~99 for
> later revisions with following the IPM rule.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: modify revision format
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml     | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
