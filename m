Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 01:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPmga/81/BXTYJd4a7wlwUj38opoH9YGk3XyEqjI+QQ=; b=bgTKIB2ml0NoaI
	KM0i40831l6fDj54s5S9TS+BOZ1ox3E+IDgQEkkUYFkhWXoal8l0WSAVTZ4E7xzWAKjXdEtKgbz/7
	91UleoKvKRaHKapNbg8qtvO0o7KIevH5AGYCew9MQ4ydrZhG7SeCm+iboWH+tFzvU3n8DS9/wkq+I
	dn9zgu4bXaCS1T69EWm9fh5MZIckU0bO67hffiuzOwFj/0G0McMzvpS31zGOVJUEqywcHwkUNxUGL
	htFleMUR9NUViCTm7aPYadcxHzxcJu5hf4KMR+XB+NGvACgiZ6VtAe5kTf0jBDpT9edL/OtXQ/esq
	AG6zDPUNjNgInby7888w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7SQt-000cnY-HI; Wed, 12 Jan 2022 01:28:11 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7SQr-000cmP-8e; Wed, 12 Jan 2022 01:28:10 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 r7-20020a05683001c700b005906f5b0969so862320ota.5; 
 Tue, 11 Jan 2022 17:28:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mBfKQkR2L8qDoUKsf/7Yn6Ct6cSR0Xt75+chDiQTRgI=;
 b=YkF+OKz/UylLPe/di3KkPuj+nBE/bynb900tgD1NSrMPDILjdfjSOfsFlmrMOVrK8n
 /RhFBGbr3/93aZsaIFw3/YQJQf+r7pkPxcB9wt4yJh5dSJ4dXXPg2oWgSkuSysS6KCup
 hDlnRQdEV2Ym6Y77nERKqUBG9EEBqrmdOXDMj8u0R1oUHcTiELr7y7x1C655UWl0osxp
 oXLbGQCf3llSjf+bX0lqwJMhXdO5obwNo8jem4VRhKKFydTy9cVOwy/r88ovmTlmX0ah
 IWjENC23FQxK4oSj6sdNN/SQveTUORoy/WBKrcmz0himSqNfFxQ28yp7L/6/lzQm9WZE
 7BdQ==
X-Gm-Message-State: AOAM532Olv6XrZ01RBhCbta/YubXtjaxlticO8JuAjHF/w48C6UMvB+u
 5oSltulWx2/CwYToWLAoiw==
X-Google-Smtp-Source: ABdhPJzsDgBBXjQuiqaoPL/a/LZz+jn3IcBHOG9zON4EBu3FE4uxwCuLLOxCJdO65wl6bZoTuewA9Q==
X-Received: by 2002:a05:6830:1e9c:: with SMTP id
 n28mr5057237otr.321.1641950887973; 
 Tue, 11 Jan 2022 17:28:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t23sm2368919otd.77.2022.01.11.17.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:28:07 -0800 (PST)
Received: (nullmailer pid 3865794 invoked by uid 1000);
 Wed, 12 Jan 2022 01:28:06 -0000
Date: Tue, 11 Jan 2022 19:28:06 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: Ryder Lee <ryder.lee@kernel.org>, linux-watchdog@vger.kernel.org,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: reset: mt7986: Add reset-controller
 header file
Message-ID: <Yd4uplioThv8eJJE@robh.at.kernel.org>
References: <20220105100456.7126-1-sam.shih@mediatek.com>
 <20220105100456.7126-2-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220105100456.7126-2-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_172809_333055_9A43DC9C 
X-CRM114-Status: GOOD (  10.33  )
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

On Wed, 05 Jan 2022 18:04:55 +0800, Sam Shih wrote:
> Add infracfg, toprgu, and ethsys reset-controller header file
> for MT7986 platform.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  include/dt-bindings/reset/mt7986-resets.h | 55 +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt7986-resets.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
