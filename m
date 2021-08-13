Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9427C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 20:54:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB2A960F00
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 20:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB2A960F00
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50p0lejG3/Zo95KwRSFFXyZkoLmtntyv4/DAd1q9ehY=; b=S6voK8Hj1QLKgd
	ojexoAi2zj/cGS5yXTvxnA6Vllfkh5p0iuUHVGMghVrTnlB/S2MbUl/6uUyj7y6LbXn6CA/J76rPq
	ypYusqNbS1gXuR804EKSLWHaQ9U5kikKgmFVv03puUG/5E+edMXBQBNAxp1VzUJGh3tT/LVngF55P
	gA+BwqXfPHr40lpmR5haRbX3AFZwl+EIwMQuJ/Z3cn/I0DprpobC1t/w+j2Mp3tpzk1+Mru0+4lug
	7b0sEexTaWmplQwndmrYfxERgtfrdpqFgsyZD2YfCalNYXLDtVpbuLaSSb0ewINE17HmufTrj8b4p
	M2gEVbrvQbs6KpVGqrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEe7A-00DZoe-9D; Fri, 13 Aug 2021 20:49:16 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEe6x-00DZmR-J1; Fri, 13 Aug 2021 20:49:04 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 v10-20020a9d604a0000b02904fa9613b53dso13523084otj.6; 
 Fri, 13 Aug 2021 13:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WR7uDjxrUVN4AooG1rp4oYurHuq5CzCbP2cCx2Yn0Hk=;
 b=eHNOdJK5RL+ikSMsNfbAbnB6CRb0rzguEo25Tkt9VMRCDndDUunbJANalcfAIKcRx9
 wqHCL994H8FsZegFlONQaPvwFwcZijzSC2d32TXhGjrxt79vS/8lkq1SCje7vLEJMvFb
 dCL+aBF+n4zm8NiFw1TVq7m4xzSJuilQB229UKrZpj7f+o+c0IBjsxWhVrNl9D4nzeER
 ZQJxaQqV9hH4IwZDtn8eIUXmQbrpv0pZKWWWO77ouJt7ZHn50wEj2ITA+iy53lNEPzuf
 W0j2vfggatf49qLEVXIV3DHr0ggmJRgU1vNG76XoVtLl5rFuP2RAfIVAXWiPAtalRHWR
 XepA==
X-Gm-Message-State: AOAM532jqXPX06Bzvuhk6jKKTu5Yoh70QHKdUH3vFuRt1XkFhZwydcL1
 bnleVV/vQtDGRMxhSCpvjk5nytsDBA==
X-Google-Smtp-Source: ABdhPJzirUAytpaW6TgtFI+xKQCEZxnjH4itq90oLrts13DOK4jbtJNqsXwk/BKu/fMKi22SIxnwhw==
X-Received: by 2002:a9d:2782:: with SMTP id c2mr3604968otb.323.1628887743001; 
 Fri, 13 Aug 2021 13:49:03 -0700 (PDT)
Received: from robh.at.kernel.org
 (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com.
 [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
 by smtp.gmail.com with ESMTPSA id m16sm482172oop.3.2021.08.13.13.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:49:02 -0700 (PDT)
Received: (nullmailer pid 4005715 invoked by uid 1000);
 Fri, 13 Aug 2021 20:49:00 -0000
Date: Fri, 13 Aug 2021 15:49:00 -0500
From: Rob Herring <robh@kernel.org>
To: Sungbo Eo <mans0n@gorani.run>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mtk-musb: add MT7623 compatible
Message-ID: <YRbavByuh2HGnVo7@robh.at.kernel.org>
References: <20210803151320.71531-1-mans0n@gorani.run>
 <20210808123840.176738-1-mans0n@gorani.run>
 <20210808123840.176738-2-mans0n@gorani.run>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210808123840.176738-2-mans0n@gorani.run>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_134903_670772_394F1F84 
X-CRM114-Status: GOOD (  11.11  )
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

On Sun, 08 Aug 2021 21:38:39 +0900, Sungbo Eo wrote:
> Document MT7623 compatible for mtk-musb.
> 
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
> v2:
> * add reviewed by Matthias
> ---
>  Documentation/devicetree/bindings/usb/mediatek,musb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
