Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2A6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1HfQdoMrHibEty/HBRd3KtLVA+kl+zzSGkxtAlnFFg=; b=Jztf/uxHkOCbeC
	b1q2NcO8Q8fl6HHzU8Qq/IiYAsp/FA99Up//Iv5AvdJyRrcN4gS8zT7P5sz3V6SyDMS+W7VynanbA
	qfAtxf0U70Q9GqG+Q2dyGIRO0DVNM82GtqPdYPOMFYLfP/TL/29rWHRODPdpRoTDLcmBD1o+920+8
	kTkZqSmQOrgTDG+i2PUhhlDrkPwjk++gVEMnvMmcHob7ZhpkjApORh7/Z4N7409Xwu/15rgMlimXR
	+vTgK4gqs++T17PAb1v+s4lQ1EecRH9Bd8QaApSNbdeuw9hfWGGrK8xmhXwX2pnPtqJf2+RdLAXlH
	Z9aHR8LJ9p55O+WQhsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdPC-005twI-7q; Fri, 25 Feb 2022 16:25:18 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdOx-005tr6-OD; Fri, 25 Feb 2022 16:25:05 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so6849877oov.3; 
 Fri, 25 Feb 2022 08:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G0wL1tv9YDLjyJO0SII7J8zFNPKMiKxbobcDr5uPVqY=;
 b=gtDZE5Mg7T64k1Yz4Fcy+uu9kxf7TNCO9mhlN6Ig5f84dU77e/4aFMU/OSNpJoGNVn
 0bIoO5NKhEvoDHacNlbX86BwJdy3CfGG0MXIH9VAXjOU+cASBDxwAr8BFADlKOFGUBrk
 ugbqe03BU8bn//mrZt5zEV6ef6eB4UJeG7jyP3rBJKnGbsXHHmylf3QoujUP0qc68E1+
 m1KxtKgWbPyvTQprJvrRB0OMfB1DOtnSfB87MD1c4chtfXlc7fWRj7g3fbvulNK8hkz7
 /R+SSgJxbk+O4COWmNg+Tkz6nccNfDDqsreVAsEMd6NIyYxT8J26xSUlWSCBssSIza3C
 Rx5w==
X-Gm-Message-State: AOAM531onLbSQmRqvam2GA0aGYyUBlj2eoPU4qiKiwsWNlNJXkxp/FSP
 /Y60ZPVJ23pafNH2IV5RTA==
X-Google-Smtp-Source: ABdhPJx4x+GM9t3AVElZNRESE/E8edNaWjEH6rKwJcyOKoE4Rl4sXZh8pp0Ur1ZaT4jMhHpksSu1NA==
X-Received: by 2002:a05:6870:4396:b0:d0:feba:c243 with SMTP id
 r22-20020a056870439600b000d0febac243mr1772969oah.34.1645806298214; 
 Fri, 25 Feb 2022 08:24:58 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 bf39-20020a056808192700b002d51f615f1csm1511394oib.34.2022.02.25.08.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:24:57 -0800 (PST)
Received: (nullmailer pid 1036935 invoked by uid 1000);
 Fri, 25 Feb 2022 16:24:55 -0000
Date: Fri, 25 Feb 2022 10:24:55 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, p.zabel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux@roeck-us.net,
 linux-mediatek@lists.infradead.org, runyang.chen@mediatek.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: Add compatible for MediaTek
 MT8186
Message-ID: <YhkC17tHJbd5Sd6J@robh.at.kernel.org>
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
 <20220216014505.28428-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216014505.28428-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_082503_803045_591E41B1 
X-CRM114-Status: UNSURE (   9.04  )
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

On Wed, 16 Feb 2022 09:45:02 +0800, Rex-BC Chen wrote:
> Add dt-binding documentation of watchdog for MediaTek MT8186 SoC.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
