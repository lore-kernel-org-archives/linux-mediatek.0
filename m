Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D502BC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ+TOy+i0aYFJ/iFf9DtC13NpbD7/U7juh/tS5gbMQI=; b=TnQ2zAiQIb90hXcErgN2SEgH/G
	olIE1Ub0t8uz/ufEGQszW/FVFCybl7jopeFM2qwjSCblgaFvcjaejiWQ0EKud8GMFd2rkX1AAXdHo
	VLLk7fWUbLrgwqUwcv/1Fdq6EsjdJjqhXRWdCCAJCh2MokRGSbmGBBEGewAgAht09hxXhoy0kXnIa
	9hGFIIjJWEyvNf458lFiI6P/4zF/sEB6RnRA0udmRwa+qO8mLMcIrPaMD9s4/Jlim4qZyHb8YsYzD
	+ig5kV+IyTdrIj7hFDWIc2pGbwrcaz+O9POCm9cqi/8G+7FBWnWUdKlpQOTrqa69iJEZd4NpitiFQ
	39+P4WEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okV4Q-00EK7S-69; Mon, 17 Oct 2022 18:42:38 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okV4O-00EK6Z-4E; Mon, 17 Oct 2022 18:42:37 +0000
Received: by mail-oi1-f176.google.com with SMTP id w196so13095600oiw.8;
        Mon, 17 Oct 2022 11:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZ+TOy+i0aYFJ/iFf9DtC13NpbD7/U7juh/tS5gbMQI=;
        b=OTSWiqyA82fDlUqi+ls9Ux2uvBaELruvhx0TEqR/cknQE8OoHsI5J4s1L0ayLHt58c
         EWX2fZgiL/O16Qxx4XsDcXfkWGQGPepHbv46G0F0cDzpbuwc7cb3uvmVCNb9VT7hhkxT
         2KRLIGDZy6aoKuVrQVxRcsb4NxAUOImaEn+1jbO/v9bskL76dkzMOAjR9wtr7xZLhSTg
         YNsyoGCs6fbdO6wR92BysUkDaBZr7lM5bwO/6ggkdS5z8phhTmG2PTfi90zDFEDk4mki
         6rYDb+U2gqbypiK1pFZZ4sQjloFR6cBRU7M7VNflkTScnnvgCYrOn1Z/zWdJ/V+td/Dm
         nuiQ==
X-Gm-Message-State: ACrzQf2qc2Yfm2VHUQWTBzj2pmHy+leVESAFZxw8e8b1/VmeQefxG29h
	P8atncB9cUf+/Wup1bFbpAEFpaspKg==
X-Google-Smtp-Source: AMsMyM69rBChqI2DHVCnodCENYuzVOrePDGda8YjhYza7SKgmCrl6bqqncNYE/8cx13f9zABeJZ+sg==
X-Received: by 2002:a05:6808:14d2:b0:354:c733:abd3 with SMTP id f18-20020a05680814d200b00354c733abd3mr5818411oiw.96.1666032153700;
        Mon, 17 Oct 2022 11:42:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bk15-20020a0568081a0f00b003546cb60859sm4707864oib.14.2022.10.17.11.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 11:42:33 -0700 (PDT)
Received: (nullmailer pid 2263866 invoked by uid 1000);
	Mon, 17 Oct 2022 18:42:33 -0000
Date: Mon, 17 Oct 2022 13:42:33 -0500
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v1 1/3] dt-bindings: PCI: mediatek-gen3: Add iommu and
 power-domain support
Message-ID: <20221017184233.GA2260080-robh@kernel.org>
References: <20221017070858.13902-1-tinghan.shen@mediatek.com>
 <20221017070858.13902-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017070858.13902-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_114236_188963_A446B4C2 
X-CRM114-Status: GOOD (  10.64  )
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

On Mon, Oct 17, 2022 at 03:08:56PM +0800, Tinghan Shen wrote:
> From: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> Add iommu and power-domain support, and add examples for MT8195, which
> has two PCIe ports with different clocks and phys.

Is that really a big enough difference to add a whole other example 
when we have a dts file with it too? I don't think so, and we certainly 
don't need to show all instances either.

Rob

