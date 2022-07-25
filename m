Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A47C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 22:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=414OPFPqm7yiKu0XCIZIVb72Nf4LXIt1k0i8OrjquNM=; b=Ft8UjSbIDq7PYqKtO65KXl9weE
	a22Rmv1gaEjhZXu5XG4HR4eIF849Ac8KKPhJy6hV/3k0NICH5/loGr3PTrlBrpa2bWDenrZOWT3CO
	qgC/HeM2kbdMdm1RpdvUI+febOl2Pdp7ZDAi3wBG6ZLSn0hkvVSp8w9f9Czb64TwFm70wAxAE18sj
	Qyb5C1TZUeo67nV6lGOZGxBC2641xZxH/WnhOlAIVXiWDeblQE5IXTvoYbFl3+DOTd1nD76CG/lCG
	YWzqadCiSq8aVVLNbd9jqdOtjwTA/A0s7sTIzjwhxwbzFzacw+wtOx2+9RcMKb1KGfdvfB9cuekMu
	M7msnUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6nT-003Qkk-2X; Mon, 25 Jul 2022 22:43:31 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6nH-003QYO-L4; Mon, 25 Jul 2022 22:43:20 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-10dc6e9f500so10688230fac.4;
        Mon, 25 Jul 2022 15:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=414OPFPqm7yiKu0XCIZIVb72Nf4LXIt1k0i8OrjquNM=;
        b=lPeAXJBkZsdfotRRC9tnmOWr+8cy7f+tYmcrfiVy/5rK1MmRFSf+CwXSbx/NMmgDTJ
         FqgdEKfn69GhTtaXykb6XHRWxns6aiUGiXo7gImzXHDDbIVG+VlKCmg/jsWgIixwBmou
         fdSwf9O/g4KCOMYqzop0+bAQ6TTbdT1tTpQmdV386kd/9go18OzwpqHlNS7J36DwhjBq
         ux04j5iDdSlUs2cO0t/15fWGVtQ2aEEWyxHIJ3njqfYMmlmR0TVMSQm8pBu1mNV34VV7
         u0ZmIdUtb8TOxcNwQcXU5wM3MVUN9mHpnLKMie33H8RHifCoWG69Q+wQnX9y8yC+0+nP
         LOtw==
X-Gm-Message-State: AJIora+4zem9kbez2R6WOsqkYhvr1PicPnZdfAB70zUnM8hzWODGvB2L
	JM4yQLEEvK+XE0vr8jMM/w==
X-Google-Smtp-Source: AGRyM1sbb07YDLb2nNG3D5ni7t9o/Imo9DVsOQtpEXAJ+WQHpVXMdKmFq3rpH6uepyz4rLi1sRM1gQ==
X-Received: by 2002:a05:6870:3399:b0:10d:5b33:566f with SMTP id w25-20020a056870339900b0010d5b33566fmr7457280oae.266.1658788997533;
        Mon, 25 Jul 2022 15:43:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id cm36-20020a056870b62400b000fb2aa6eef2sm6763107oab.32.2022.07.25.15.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:43:17 -0700 (PDT)
Received: (nullmailer pid 2883124 invoked by uid 1000);
	Mon, 25 Jul 2022 22:43:15 -0000
Date: Mon, 25 Jul 2022 16:43:15 -0600
From: Rob Herring <robh@kernel.org>
To: Runyang Chen <Runyang.Chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Runyang Chen <runyang.chen@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, nfraprado@collabora.com, devicetree@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH] [1/3] dt-bindings: watchdog: Add compatible for MediaTek
 MT8188
Message-ID: <20220725224315.GA2883086-robh@kernel.org>
References: <20220722072316.582-1-Runyang.Chen@mediatek.com>
 <20220722072316.582-2-Runyang.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722072316.582-2-Runyang.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_154319_748132_E17DA87E 
X-CRM114-Status: GOOD (  10.06  )
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

On Fri, 22 Jul 2022 15:23:14 +0800, Runyang Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add dt-binding documentation of watchdog for MediaTek MT8188 SoC
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

