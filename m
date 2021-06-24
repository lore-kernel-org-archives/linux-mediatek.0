Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05623C49EA6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 20:44:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9427613C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 20:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9427613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HHimI8NoixDB6SanuyO6h7RPBwN86CFazJ0EdPtr/Y=; b=ebaVDX7qh5NROv
	jf//weC9tVfdZLHxUOW39NS3NF7KSnLLZVCzhkIvrWvyULsLXrlYC7Xp9rYfbOkCG4+zGOtU8xjl8
	wtxilr/sOlSzy2FyHeVTr3FibG71x19jUFgr5DlnCqxTIxxlhwmX1gJuLQAtGZdRTTeSiBoPsSd9k
	CeXSIsarR93CU2+0D6WDA65bZ8TGzvi20gCInVvYNk40pam1jY+20cFuiYd2xBkm6Xk5Fs8l+NcHu
	b1Fr92xnaI1FCrARZJAL+9rm6WD4MvNqAiye1v62L7JvfC/rus3ZSxsSswBGQyqicGB1/CkSxQRua
	GaqmTgGvK3USbzwjFF7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwWD4-00GFTO-Ef; Thu, 24 Jun 2021 20:44:26 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwWCq-00GFPl-B3; Thu, 24 Jun 2021 20:44:13 +0000
Received: by mail-io1-f45.google.com with SMTP id b7so9897590ioq.12;
 Thu, 24 Jun 2021 13:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jb61FtgXv62RyoPttvhABXLLkGLociNax0eiMMTdeoE=;
 b=qD1JQ8Q2eBUklOn+59iVyr9vrFTbQM8LmBKbvnbC0ihXawFiX8dMEQAjzXAo9JNW1B
 XYYRsmEfHP0Q+w1RByBbFFXluGjqLIkFukWqG62Ye8NFaYiR2AOn+YxDImRRFkk7BBcK
 9CYQgHR1fpPuPhGd+OnXsxMP4Kfec6J3swdbowpmiQHdAWUMEMuos2rbgpneDYnGJNA5
 r9Pj6ASx+7E6i79a0nDa+eqOwZXw4qXYX8Aszs7gx4mPQaEHovyQaaDCW8MMDgbNj0xL
 04C8xKUiQBm4u6ec+SwpE4sZfIeawoDjw1IZRcA/2y2TRXJGLoqA5fH6Rqr5qactQ9IP
 Xwcg==
X-Gm-Message-State: AOAM531DcjrNCi+9u9HaL6n295XL1EXF7cmySPPqjYasGrshBKd8P2ki
 /7tnzX+NVl3dMGfEUtej4w==
X-Google-Smtp-Source: ABdhPJwDbvlT7rWgdyoBcZio9FNtPl/yvT7KQ36PlsskLaNPsJwYVXasDTbSOux0xym+jdlTH05d5Q==
X-Received: by 2002:a02:8246:: with SMTP id q6mr6390809jag.130.1624567451624; 
 Thu, 24 Jun 2021 13:44:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id j18sm2014229ila.9.2021.06.24.13.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 13:44:10 -0700 (PDT)
Received: (nullmailer pid 1957082 invoked by uid 1000);
 Thu, 24 Jun 2021 20:44:05 -0000
Date: Thu, 24 Jun 2021 14:44:05 -0600
From: Rob Herring <robh@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>
Cc: wsd_upstream@mediatek.com,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 hanks.chen@mediatek.com, linux-kernel@vger.kernel.org,
 Mason Zhang <Mason.Zhang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
Message-ID: <20210624204405.GA1956999@robh.at.kernel.org>
References: <1623721803.24597.9.camel@mbjsdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623721803.24597.9.camel@mbjsdccf07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_134412_426887_A713729E 
X-CRM114-Status: UNSURE (   9.36  )
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

On Tue, 15 Jun 2021 09:50:03 +0800, Mason Zhang wrote:
> 
> this patch update spi document for MT6779 SOC.
> 
> Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
