Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7A1C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tJo2LBnY1zBMYmoeYVZXODudXysjv47CHxMSezRhas=; b=L4L1mhQtQRYcrWn4hyvkuXw/cT
	z9chnR5BY9yR7XDH8ndEO59ZP3aMNnGiY35WtDhBJnE35lRLoEoS5RwI4QMGeraF/bd1uft83C916
	wTA7Ylr7MZrE/5PchpF0HLhNZFAZ8rOEMhisPZGftYVN2FOR8zMgqAmPm4bVM+3pVs7hDaCiKockH
	ETKc/jX1i/Qi+E8IgXEq8PhZtQvfvMIMTOsUQxPJLmbVW2FGV0tDVzRZKDKHfCHNlM6Z8cb/+6dyF
	44zwVEK885sQILsXeNQ5XOKDCozCW7RB6b5nEfihznhSPXgFlxY6y8UmvazF26Xc7gMxbj9ygeAv4
	vByrKrBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwL4-00BcRe-4D; Tue, 15 Nov 2022 13:50:58 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwL1-00BcNl-Ud; Tue, 15 Nov 2022 13:50:57 +0000
Received: by mail-ot1-f45.google.com with SMTP id w26-20020a056830061a00b0066c320f5b49so8533996oti.5;
        Tue, 15 Nov 2022 05:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tJo2LBnY1zBMYmoeYVZXODudXysjv47CHxMSezRhas=;
        b=pUp1qFJDVqc0CABAWAFWtM37QpRRNXQVUZdkykkSTGujqQq6P2cxCOFLBDRWMMn18s
         PVZES/G5NCOYXqE+as5lEJVBlOycT3sa8u7ZkWJ/XHH1ufp943woU333u7mqvJgX7FDr
         GDwwx954VqYZum4Y0btMBC4+8BeBedPdt89Xl0YfqzPSEBi5LP0OuJM6ZN8U2Yfl/Mxh
         iPeV26t7j1JJFB1h2zU+P2zys/fFjNZnBh6d+smYzuKioOTQ2SxclabVElV9FWJl4+wa
         36foiYV+y2Tqzr2WS1v3pbGEp8Ol/qN43DJYnP1Abn1Pp+GlTvztaAcPvvAF0revKgoH
         mBRg==
X-Gm-Message-State: ANoB5pl4IYxA2BuVVFiJr4P8FWhIuIM5Vwc/jX7oPzK/CSuy5hOMZfly
	pAAfyHujdKWakE56zfoQrw==
X-Google-Smtp-Source: AA0mqf5lGkrgRN7jeCCRXlRu8timVYbU71gGIpGJj2PitosXKdwnkQmjCOrN+Axy5U4VY6Fjsuh0Ww==
X-Received: by 2002:a9d:2dc9:0:b0:66d:7a33:7c91 with SMTP id g67-20020a9d2dc9000000b0066d7a337c91mr5822157otb.227.1668520253573;
        Tue, 15 Nov 2022 05:50:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l9-20020a056870f14900b00127fbb7afffsm6548399oac.5.2022.11.15.05.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:50:53 -0800 (PST)
Received: (nullmailer pid 880448 invoked by uid 1000);
	Tue, 15 Nov 2022 13:50:55 -0000
Date: Tue, 15 Nov 2022 07:50:55 -0600
From: Rob Herring <robh@kernel.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Subject: Re: [PATCH v2 00/15] Initial Mediatek MT8365 SOC and MT8365-EVK
 board support
Message-ID: <20221115135055.GA870211-robh@kernel.org>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_055056_005633_0C1C3A00 
X-CRM114-Status: GOOD (  11.86  )
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

On Tue, Nov 15, 2022 at 03:54:06AM +0100, Bernhard Rosenkränzer wrote:
> This adds minimal support for the MediaTek 8365 SOC and the EVK reference
> board, allowing the board to boot to initramfs with serial port I/O.
> 
> GPIO keys are supported, MMC is partially supported (needs the clocks
> driver for full support).
> 
> v2:
>   - Add missing dt-bindings documentation
>   - Small cleanups addressing issues in v1 pointed out by Krzysztof Kozlowski

Other than this email, your patches are missing Content-Type headers yet 
are UTF-8 encoded. Looks like they've been edited in mutt as there are 
some mutt headers.

Rob

