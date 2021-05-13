Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3813C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 02:29:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF5E613DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 02:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF5E613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5c44yAboMsC4ERLub0SVqjn/GFf7eIcmpeppJhKwO4Q=; b=ocFKEF/wY7/QW0uzKN/nFT2FH
	JRGWbKcJSsYNht/vl3BHSpbGjX4z9lxTzJXQQSacLaOwlpeOJnELuTvR1YsWdT0hHF7IHQ72e/wHL
	LvYStn002U+0p09YPg5NdjnNVrBGIHe3ooLSQtDgbGg0qEQTGIh3/CwoCmpMbcAvIymU1ZHNys6+E
	DQWKrJ7Poh2sso7w5adK9si4CjKZp8RaZQuc+GucYrhtXXvo3hDc/bFnS8pBCl9ykTa5kolsRkoSA
	sLRE+mD7+38d4YVGAZ/PUC0SMNfkI3kqejvslyivebk5JaL6WOjfnJdZ1fUbHaPPv+i/Aa4R6yPYz
	qQ1snvOow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh15d-004VcU-85; Thu, 13 May 2021 02:28:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh15Z-004VbI-Rr
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 02:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1R4NK7sXPmJsCqubEpuc25FerWW0N8S/UMeRUegpPe4=; b=3RUW6MJSmCFMdJBK0LBq5ASCoR
 lZXGHWqY2j7Ef0IID4fEOcY1e5xD4Up3ggbFbtv2AOTZZhEydOUoQldqMfjj7QhkkgkmEahCYqnLJ
 HIJz8dzGoPUB2La9LyOmsWeN+jaOnEHSt+RjkC1sBY2/WMF+aHi2LoE2ierfXDiHQpF1aTQgGZaAt
 pPihUm9YhxQwD6U67aYzhAs7PP1YFUaIWJqDnkSb/JnT6T28bHPUbPvkCRfOjZ3E9fAeJ2eflr5r/
 lDte+IVMnwJ5liO0y8VnV5fqRTwcgCs1aYqMml52jnV4y2AYnXNfwI1oWi9g3ePndcBqti87CUdoU
 7RSv9PxQ==;
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh15X-00AyKZ-HK
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 02:28:36 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so18504772oto.0
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 19:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1R4NK7sXPmJsCqubEpuc25FerWW0N8S/UMeRUegpPe4=;
 b=dRN5rumC2gTgpQuXtRQSygCk6QuOE8FL+ot3s32Oa16fonQvnW3CBlpBwEfu87ybYJ
 4RAdp2kcOHuZACbM+dDT+Th21dJXqpPvkQ3lUz7lVHBpju5gTrfQwOFPFt6gb921sK1k
 5jtarRp9k1srJY+vEOHRCem/9RoYIw0vhMW43B8YNO4Ra+O89gXuvjeEp3R1TQaM9mU4
 W/tkYGukIaUrz3d++9ltQKwr3BIbsYQa8bbNCe+NNJJS8+NeyrmFNHFVL0HHm/WPzy0l
 VIn09yscIHwT91B4muL68lu1O0d2554t/ybEj8VANqGyWsiu/zerfy0G5pAYWj5IvKTe
 zhUA==
X-Gm-Message-State: AOAM531pkyprDiq9ZA3lni7tIxstjhNjMz1ThKdyHWHMzq35A0CX0NUO
 KDGpAzE9btGtKbnyMuo1oQ==
X-Google-Smtp-Source: ABdhPJz4o3CzX1oUjO2CQ8KfltMzT6Fd6QQbDaWnSbfbVJpq6srieZQhjqi8zTnaM0y6EUqGqcnKGg==
X-Received: by 2002:a9d:5e02:: with SMTP id d2mr19538766oti.171.1620872914602; 
 Wed, 12 May 2021 19:28:34 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t23sm364265oij.21.2021.05.12.19.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 19:28:34 -0700 (PDT)
Received: (nullmailer pid 908835 invoked by uid 1000);
 Thu, 13 May 2021 02:28:33 -0000
Date: Wed, 12 May 2021 21:28:33 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Lysov <arzamas-16@mail.ee>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux@roeck-us.net, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: watchdog: mediatek: add support for
 mt6577 SoC
Message-ID: <20210513022833.GA908695@robh.at.kernel.org>
References: <20210513013515.31329-1-arzamas-16@mail.ee>
 <20210513013515.31329-3-arzamas-16@mail.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513013515.31329-3-arzamas-16@mail.ee>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_192835_591119_11E06748 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

On Thu, 13 May 2021 04:35:14 +0300, Boris Lysov wrote:
> Add support for Mediatek mt6577 SoC to device tree binding
> documentation.
> 
> Signed-off-by: Boris Lysov <arzamas-16@mail.ee>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
