Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8919ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 16:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tj/y2R3Cw/vtMo2CMiLLgLOFf+kwPiBNNxkBB8CDEbQ=; b=QSPCgdR5emT5V2tFBDiSVjGKxx
	2dcQqqlVCrdoS0tba37bt1j2URdxczbtOGPGy0bOXlEviQrKSsFynQyAbYmpkyZNMx57VDNfG4PPa
	UvB9240TONU2GCaoHBtXQzzfnV0jlctLTIq7qyB3J/847V2z//lsH6mZ7prA4clqkvjl5v1uotNJq
	lEZlnwaUU/pMMEhtKvaRE0dgetZjvjE0o2xLjd9TDoyJOG4YY6cNSMlwaOc/P8fPp5pK34KeJpktx
	6X2urIf6ICD4RwprbqqehxhXkZBvyvmRnMOblezQlDevt1zftjLcE6RuDpRemNLUS5fJIg0kyXgxC
	lCPNhpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9D6-00Den6-Br; Tue, 13 Sep 2022 16:56:36 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY9BL-00DdLp-MV; Tue, 13 Sep 2022 16:54:49 +0000
Received: by mail-pj1-x1029.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so11933025pjh.3;
        Tue, 13 Sep 2022 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=tj/y2R3Cw/vtMo2CMiLLgLOFf+kwPiBNNxkBB8CDEbQ=;
        b=Y3RK4X3XH624gow0ivIrqP3F39itnqDtSlYTamx3GD7bKVjqm6t2pdhRsdPLRc+5Kk
         flSAsagunvM4xkaLqpriS0p+adIN/4jzO+yqzLYF6NqG8ejBDDA5wffXbC099hVwykm+
         NjMOxSGAKwgpvE2hzucR8HIpsvC9x9m0EEXlA3dAUjsNm7Wg41WDaG5bV/VRlABs00W9
         YXtN12sgohMiWPUkfwk1d22J/M1t8SNUH37I6lcs60lbQEJr2tfMv9ggjfWH26ZrKDcW
         TE1vr7r9QvYfSOdVXkciMS+Eh6m+66Mmw++yqDIuT+VevfgbGe+d5cK83EaxYq/8Z7Iw
         WFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=tj/y2R3Cw/vtMo2CMiLLgLOFf+kwPiBNNxkBB8CDEbQ=;
        b=NPKWGiWkQARb+dTkparEraTtTP4+KZrU8Ii+Hs+L3Yecf54oikDrxmhI/Eu4CWl4Ct
         ylzrAdTua2jhGVupQOLGV3bGeLQ6Dk5FxTOup98yLgdj/td3HuXiopbIz3z4YBKPVFsU
         Kkajz1nsYdbw0WnAOsibn0DtFK3i7f8Ndyxb1bjcUnLYwN2LNvoy+/xq/SFifcuJizaL
         b+xSuDNDY9QJHqkTCC7TcacsFLixpeGHPNdlb6a2Vrd9yrHmDDkGLYLA109NRv8d2Tmh
         C7iitbUyeKebWlCe332a65Qlt0CHCUt7l7MwiBkTcRpunEBjRqqsSXm5nEF3jwgDxDyn
         /xXA==
X-Gm-Message-State: ACrzQf3H+oiBxKLuaw9f/Aon44pWySXkIAIb+clKIXvZSBxHkRcyV+DH
	d/hTZimZ27IM8ImKDbNGSPw=
X-Google-Smtp-Source: AMsMyM4BPXD1Zj3M7Hp//nlTHalCsLR69ABT2cT522VWfp1BCumGEWNGMr0caRucSDDzwSLZuXhXkQ==
X-Received: by 2002:a17:90b:180d:b0:202:7cf6:9f9b with SMTP id lw13-20020a17090b180d00b002027cf69f9bmr220475pjb.160.1663088080547;
        Tue, 13 Sep 2022 09:54:40 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b126:15e1:55ae:d9eb])
        by smtp.gmail.com with ESMTPSA id md22-20020a17090b23d600b0020061f4c907sm7586448pjb.7.2022.09.13.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 09:54:40 -0700 (PDT)
Date: Tue, 13 Sep 2022 09:54:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Input: mtk-pmic-keys - Add support for MT6331 PMIC
 keys
Message-ID: <YyC1zRlf+AUSFKnv@google.com>
References: <20220913123941.385349-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913123941.385349-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_095445_876712_54DC3094 
X-CRM114-Status: GOOD (  10.19  )
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

On Tue, Sep 13, 2022 at 02:39:41PM +0200, AngeloGioacchino Del Regno wrote:
> Add support for PMIC Keys of the MT6331 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Applied, thank you. But we also need to add the compatible to the list
in Documentation/devicetree/bindings/input/mtk-pmic-keys.txt

Thanks.

-- 
Dmitry

