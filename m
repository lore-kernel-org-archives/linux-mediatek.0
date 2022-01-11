Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C310EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 17:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDr7tdLUFfiJE6u/ljoZU7n1J8equgdearXyi2/LL04=; b=amL5obLfILqfc4
	0mUDFnVGPbBNxdCuD490O+02mGycvvjxkJg8BQFx0MRvzif9CkxJB0NmMz41pLa6bABFpjOKFVdqA
	GfhoFT2vH6vCp8L9unEuiFfSUG2qDDneI4IlERS4gjnrFGCiK+yg2C//sXhXOzu9Q4Uky+F53Wplm
	4rTevrvGaBQA3P2JDtXxd6ddBgJ53fbQ1qLPZSGI00EKwvj3OVaMbwqVvqGD/RZx5JC7oEKxohi7g
	sIRqsboM/KqWnyVYPnb7D5+sWIpoSWvek77y+W2FuW/rLq4lD+Am4oN/hHQs42KIiBJU/B5XB9dhQ
	8I+UJJdz6NkMLIwpcSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7LKR-00H93b-OC; Tue, 11 Jan 2022 17:53:03 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7LIU-00H845-W9; Tue, 11 Jan 2022 17:51:04 +0000
Received: by mail-oi1-f171.google.com with SMTP id w188so54928oiw.13;
 Tue, 11 Jan 2022 09:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FCQPITei3COem8cmVAANSwaWxSLVAkkDF2YSEJ/o+O4=;
 b=WsEDs2nJM38N+NSrhbSt4jPexXcNuEH0p/9fD7w8P4v5hmA/igrtUUNaBmHsB5YTKC
 hcHjv4ov/l+aka84+FbaO3jarTB1RdF+A8BTiXaRusOrqQ/kJHP5SvUUQgW4Hd/ADY0J
 Oisq7pN/59TN0qN6apHKlandGNJkWBk4EQDMHAr2buxX5K9SXNUNl8s+6r1cQZgOuqOx
 TTr8/D5KVPg8rH6UkKQoYF/t7PiJqCBhQtlwdYpaQW+LHOXLa+4dX8vP4RhftjyMDiaX
 d+UbsWVQuAoZaRoVIpVODPgV/WjB+IXc3xXNm0YSB0TT8lXHXIFz6DwPqJCLvASe1p+z
 nE5A==
X-Gm-Message-State: AOAM532XCma17PGQVa1ucGH34FSbsFPDAEEvyVhdR6fFWv5SlqoT2yOv
 L/ekkmmdoWSuhCfNLu8if2XO0xDAhQ==
X-Google-Smtp-Source: ABdhPJzRyceLnQnI7OQ9vNM9e7mwGoZsEmJTGCoevf0mvD9EDvtFFVOamMtqqTkLJJ2l6jnWh/xgMQ==
X-Received: by 2002:a05:6808:1290:: with SMTP id
 a16mr2549347oiw.116.1641923461627; 
 Tue, 11 Jan 2022 09:51:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id s1sm2020749ooo.11.2022.01.11.09.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:51:01 -0800 (PST)
Received: (nullmailer pid 3227467 invoked by uid 1000);
 Tue, 11 Jan 2022 17:51:00 -0000
Date: Tue, 11 Jan 2022 11:51:00 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, netdev@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: net: wireless: mt76: Fix 8-bit property sizes
Message-ID: <Yd3DhO7bel0NH5UL@robh.at.kernel.org>
References: <20220107030419.2380198-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107030419.2380198-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_095103_106518_9987BD01 
X-CRM114-Status: GOOD (  12.26  )
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

On Thu, 06 Jan 2022 21:04:17 -0600, Rob Herring wrote:
> The '/bits/ 8' notation applies the next <> list of values. Another <> list
> is encoded as 32-bits by default. IOW, each <> list needs to be preceeded
> with '/bits/ 8'.
> 
> While the dts format allows this, as a rule we don't mix sizes for DT
> properties since all size information is lost in the dtb file.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
