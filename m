Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F78C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 18:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z6XbQYQrL3hibLXcs9Qu2WQKlcrTEXAiBTewPjwbvI8=; b=CWwU/89sGxpw5URGAhQFEeg8aE
	1c6yg4+t24NWm/hAwIxDeSVBni4mVut9kJe2GeqvG9CPpqDWqR53WrfzEjMiWAq6jMJjcswWTX3/C
	/zgTMwrduwvqiRM7Ra3be3hz/ddw11uspjyGS6IaLK3ktE8NhkYPMchfMIUR3nkq91TeaIoQECHXr
	y+gbe22eV4IL25h0H0gyxbwCbXOEya9/nTzg7OoTXPlyzar218Ra8I3yNPR06qcT1pFjUcFmgMbzw
	1EGl5WD1tV/pVTcRgEJTiesc4lGgimSMP5zNU4gYI3DPGJKxnrhZizLRWWP3VeRxpXtwY6sHKU5rX
	fNUC27zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYWtO-006jR5-R1; Wed, 14 Sep 2022 18:13:46 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYWtC-006jGv-EX; Wed, 14 Sep 2022 18:13:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d12so15925214plr.6;
        Wed, 14 Sep 2022 11:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Z6XbQYQrL3hibLXcs9Qu2WQKlcrTEXAiBTewPjwbvI8=;
        b=ZZFFOTNzRXOnjQm+TMxLNjuV0QU8eRzrmdrOZGtS1MBevBLNUOEg6BudAEsibqF+8z
         tk0LCKUgi1WTarJREuQznibhsy7f5C/xagb3vVH5mz2duK9MhcI9nHS3gTywr5iNSVVM
         Hf7S06uUBQRioFGdS7URdA2l/7eBi1l1fY1LtPtpYiHX9fxE7ZDl7d3L5kg42rX2dRt5
         z8ULCWlONGQU4KxVWLLovHQvoPqk1x7aBXrSHgKFfHVkhjkDv5dF0lusXjQaB5WWyBn+
         eZZR/WD6XzrQN1oVov7LYUeqjZAcgiA6MlOSqIIjmOK9FyuUMZUOuev/2q8XzbMh8EaA
         PqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Z6XbQYQrL3hibLXcs9Qu2WQKlcrTEXAiBTewPjwbvI8=;
        b=Qj3N+QkjskIFVwf/5xFmO9DmvqXbhZx4bPa61zL2KTL4wsXRDaD6yHchBYm7Qrtb9Z
         NHzkzUkpuiUTPE2DWWN4ycqTjyxT8dRAqMyEdGhe6GoiaiqQV2IeZ3HVdt3fbFZNZb/5
         x2cVRKuKhBnYra9Ak80V7qwW3ux9A1J/AziOKUEOH0hXBXsqcg9yqujmVcRh9ZdQsLI7
         RmT7z1T+D27UX5dOG4hWB4P78DxLOmcVC5WQfTl47nS5uAy2AwTo5UF2vmtB1jh1Q5EV
         UWNIQnqzZAuOEm9IM7gyMUzGklLeReq0FNiGOOfGUEXomrszVHwq5A68ZTzc2ZLd0/Gp
         WPQA==
X-Gm-Message-State: ACgBeo293aL+690KLbI0FlZOAZkWRL3DEA1/c3ZUSyK20G+8eetOXk4B
	WEvNSSdBveh97QmzylfHwOc=
X-Google-Smtp-Source: AMsMyM5fZthu4Ufl4nx1rAnN7OIJ9+p6ypeQYud2S/IB/+gY/0t6HXNQkPujoybWI4VEqBpsQ136qA==
X-Received: by 2002:a17:90a:6401:b0:200:b8ed:ca6 with SMTP id g1-20020a17090a640100b00200b8ed0ca6mr6296772pjj.0.1663179212243;
        Wed, 14 Sep 2022 11:13:32 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2f68:fe7:a2e6:7595])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090a2b4500b00200b866d061sm9472692pjc.30.2022.09.14.11.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 11:13:31 -0700 (PDT)
Date: Wed, 14 Sep 2022 11:13:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	matthias.bgg@gmail.com, chen.zhong@mediatek.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 0/2] MediaTek PMIC Keys - DT schema conversion
Message-ID: <YyIZx9j6HCluvRW+@google.com>
References: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914103021.43593-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_111334_521270_38E27617 
X-CRM114-Status: GOOD (  13.21  )
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

On Wed, Sep 14, 2022 at 12:30:19PM +0200, AngeloGioacchino Del Regno wrote:
> This series converts the old mtk-pmic-keys.txt binding to DT schema,
> documents the missing support for key press/release interrupts and
> adds a compatible for the newly introduced MT6331 keys.
> 
> Changes in v2:
>  - Removed tests leftover interrupts/interrupt-names from examples
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: input: Convert mtk-pmic-keys to DT schema
>   dt-bindings: input: mediatek,pmic-keys: Add compatible for MT6331 keys
> 
>  .../bindings/input/mediatek,pmic-keys.yaml    | 114 ++++++++++++++++++
>  .../bindings/input/mtk-pmic-keys.txt          |  46 -------
>  2 files changed, 114 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt

Applied the lot, thank you.

-- 
Dmitry

