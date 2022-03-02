Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68598C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPdDzoKn29iygxmvwMZvwFoNWYAq0GU75LjlfvpB8R0=; b=HIZx3qV5+nmVAG
	FV4seF8TB3WOR+7ifiOMiI4CdKVnBP51asmUQll+Ib85rWps9m7XwASVEpRPWhv+7zSqDllQBrzLv
	zQj1U29jl/F4I0V8G0XYEjAsA78bB/QeAy0bIJnHrVZGfHYRRyyWgGzvSL9Tb6/OWLxg2K0FlSDPG
	/Tk/Ce7bpk9Wv85+9D52MFV+ZDw6PNDcxwqRrITpTyOegt1uH0fVWhcSZBsgrquDyFXEBJ7YSZKhE
	2rYs86ijsUPgJ8+Pp9Hrc/2IIgtQHGDyxYc6wHY8WDPYiTNcePg393HwibNpkzTZu7gFTJDK9A1Ll
	rbedII1jJ1EEncqS2x+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPYgL-004lmx-2Q; Wed, 02 Mar 2022 23:46:57 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPYeC-004l56-Gw; Wed, 02 Mar 2022 23:44:45 +0000
Received: by mail-oi1-f177.google.com with SMTP id i5so3303090oih.1;
 Wed, 02 Mar 2022 15:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8YMUTnsXm+M9+dNQuf4G0QInghug+tyPAlId0Vy17Ks=;
 b=wAwFqSthyF1F57pRR3+x9RGlnTsLw/MbczkzxY3BCkFbPAU7yTEm4u10MNobvX/k6H
 U5u+pGdMjTml8baYVer75Z9jACWR4j+4AtL8/EmkuXlQQtNMOCyYa7qz8hFc66tAkogr
 DZXzk5qYZ9xAVFtwj92Rp+QU6/swltbBVO5BsVTxZgUNDHf3zUVGAE/CLv9oPpHf35cP
 iX6LRC6pW6CofeRzWeWmsnFVjR7J/Y4uJXOMaYWv5Bj/kmcCfsopdElHyVDcYntc6Zpq
 mL2Bxb2eKTegAUPsQeGstZigqAXPcP9aMze7v2UOlGt94MIy6dvaf0wbDxH8WrBiz6s4
 Rpag==
X-Gm-Message-State: AOAM532y58oShH73WAGLUM/cekMn2uoB8BkXuu8NPz/ytLq9PT4doGdb
 +aNGMReC5JLcacnxLk/keQ==
X-Google-Smtp-Source: ABdhPJzvdLVwsrsmUmbCdsCY2U5wylRZU+h6HwxMq7Pa9QA826lZdCUOl1ytBb0OIpfFS70UHUh+VQ==
X-Received: by 2002:aca:5f87:0:b0:2d9:1363:1613 with SMTP id
 t129-20020aca5f87000000b002d913631613mr2092022oib.165.1646264683475; 
 Wed, 02 Mar 2022 15:44:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 z9-20020a9d71c9000000b005ad12cbc899sm202195otj.36.2022.03.02.15.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 15:44:42 -0800 (PST)
Received: (nullmailer pid 280433 invoked by uid 1000);
 Wed, 02 Mar 2022 23:44:41 -0000
Date: Wed, 2 Mar 2022 17:44:41 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, yongqiang.niu@mediatek.com,
 jassisinghbrar@gmail.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add definition for mt8186
Message-ID: <YiABadKsmVNt0bnB@robh.at.kernel.org>
References: <20220223030138.13939-1-rex-bc.chen@mediatek.com>
 <20220223030138.13939-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223030138.13939-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_154444_602483_D7364075 
X-CRM114-Status: GOOD (  10.11  )
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

On Wed, 23 Feb 2022 11:01:37 +0800, Rex-BC Chen wrote:
> Add definition of compatible and dt-binding header for mt8186.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
