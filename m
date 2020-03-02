Return-Path: <SRS0=QQ5c=4T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB49C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 23:29:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E72E24677
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2020 23:29:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i4ozO6GO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E72E24677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykvLS4ir38HPvk0v3fKGNNnXYnca7rFfpPv7HCTBcxM=; b=i4ozO6GOgw9iZG
	0r2a7WV/pgWmPHzjLYBcYa4rT44WXaEUAtXwKncViQ6LokhUYoLd4XCeE70GPZYp5wwycChRb/1Y6
	Mk8BTj60dk/8wlEfHZ0oZvyyvDokhHj48IfG6v6oHzJ+NABV/C5+3XUp8AeJGWwKxuc6u4rvxquYM
	Ji0oyEkVD1OFOmn2aqT3i53f14k6fXucOBLUN6gjbW38pkY2bqMWnbF393kJXGvSnI0K6aGden7Do
	fDlOe/otl81bPdkebKtNy9F0yNEr4yZt88jUP0KbxRylZm8EQTMKErGf3V4xT6+uaMi8HpvFKTN27
	c9VYBz4eAkFj37VEl2Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8uVO-0008CN-3T; Mon, 02 Mar 2020 23:29:46 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8uVL-0008Bx-CC; Mon, 02 Mar 2020 23:29:44 +0000
Received: by mail-ot1-f66.google.com with SMTP id a20so1188005otl.0;
 Mon, 02 Mar 2020 15:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bL4crR0QltZVzCb64PaSDViplJhkuKW5x/Yz6zKqjUM=;
 b=ch1D7i3gkjL/XXTIY+Jx8arEvUNfc9I+8tXLr78IUCuxFoSAQQPwLlMpF+6N76a0wB
 KD2Z0+UE/jq1UOEqaZv9qtW//j8MU26VbJnRDzWQIyCGKQAJdgY5HDRXg7bkjQdAr18n
 2ZYmdF9SXjoU2eyT+ec+WQIsRV4K9a6jO3lzB3AWeXQp8tcUfz8gOzgkl3NNYeccee7Z
 5VKS2C/mLBl7X5KDj5IIenxmtSu5nGFwvbVgbcJyp8Ac1NH0wLHgT7PmLlYCIpeVC+to
 Uyh3HYPk/G92nKNgTnBTENWTY+Fu3hx8F+mK8yOspAAXnTj1bTbZvwYypm+ZjiA3fxLD
 /sLQ==
X-Gm-Message-State: ANhLgQ1t+hlGctrJkVkmkH2NHJrSmAVK190m/udY/yCADuG6X2wTHXvV
 wPtCDuX2ukRB/7uzs7ATTw==
X-Google-Smtp-Source: ADFU+vuIYp3sLPsyMdTfFaP1I6L8Bzm3bqP7VA7nzk6Wvk1TBOMDG6BACKkVaDwUxNRMG3Vc8bts9Q==
X-Received: by 2002:a9d:6446:: with SMTP id m6mr1232961otl.122.1583191782350; 
 Mon, 02 Mar 2020 15:29:42 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m23sm3437121otq.37.2020.03.02.15.29.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:29:41 -0800 (PST)
Received: (nullmailer pid 5546 invoked by uid 1000);
 Mon, 02 Mar 2020 23:29:40 -0000
Date: Mon, 2 Mar 2020 17:29:40 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v11 3/6] dt-bindings: display: mediatek: dpi sample data
 in dual edge support
Message-ID: <20200302232940.GA5490@bogus>
References: <20200228081441.88179-1-jitao.shi@mediatek.com>
 <20200228081441.88179-4-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228081441.88179-4-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_152943_411211_AE0EE1B4 
X-CRM114-Status: UNSURE (   9.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Jitao Shi <jitao.shi@mediatek.com>, bibby.hsieh@mediatek.com,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 28 Feb 2020 16:14:38 +0800, Jitao Shi wrote:
> Add property "pclk-sample" to config the dpi sample on falling (0),
> rising (1), both falling and rising (2).
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
