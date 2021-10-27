Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 21:13:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AECE7610A3
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 21:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AECE7610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqtvPS1O4BhN/Vd/+rQGdIC/m/80TNIlC+WUn7126SM=; b=Ir8OHpPNecD3I6
	o1pvy/Kn2tJq9PucnzK+nPqLIqt91xOBql0s0IucSgM2f389VC5y0wtqwhoXRL6YsQM/hnUTR2/01
	zkRahNWqa3jq9UOeuzq7W0fblVFDxaJCxThHN3E/33nfaQm47on8cg9FxJNQC8Z0CU0BLDlFEVEod
	xTiJNy52TVAzp1cwl0tWMXsIdWyUvUFfUilNk9mbsZVdLEu3b0gYCY3oaRbazFKtCpCFeQP7M1YJt
	3+i00aeIp5rEP9uJhxEgjohnD2vw67XL0wgavrs6g5r1/NB5EHGGihPuTMVQWVfHqPq86QfXUKgwV
	wEOT1ZkKydKsTBLjmszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqEM-0069KH-4G; Wed, 27 Oct 2021 21:13:06 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqE9-0069GB-6o; Wed, 27 Oct 2021 21:12:54 +0000
Received: by mail-oi1-f175.google.com with SMTP id g125so5303747oif.9;
 Wed, 27 Oct 2021 14:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LmFO9ISj7JJOkQ2M8hIxGbbUJDnwvS+JdNTBzIHK5jQ=;
 b=ySYiaNNC1QWaZEXjPd9KMH+DEe4jCr5cxxyFzJWlMCaqVTp4jep7gEDzPzPZybaFr5
 pWiQAKn/WJS1+UkdfBehMnX+dSlTSzztCeJHnnNND1wXitCQQjy6tkAmwH5hJs0+Kbql
 GJN2whRAgtiCBpikADaQ2pPUxldTWStMdh3ZBgeb8Ce7ZfQM5X2MWiGvoxgdA27VLppP
 1PxfnUC8VsH3CBacN4pW/M80aiZMYNBxeKvuqtXRN3P1mPFvFVsVCXj3s6BI2nQbcOQq
 i4fJZ+DtWHct5qJCW/qOlahCnRGehAPx9VinhqEZyj5vLPO8fo/5Q2OGSQr/lhOA0PXy
 j8UA==
X-Gm-Message-State: AOAM530xK9nEMl2o2GKvE7jJN7Z1Ip6q6So5wKW02iO4HnsrlD4/kYlS
 01pawFEJWfzkfvPOX7Herw==
X-Google-Smtp-Source: ABdhPJw3irUQ5lx7h0OxDhGXcoMJe2VJC2GTlcFMMf25h427FBJgmF3yedQkSIlnzmYwi9tpOoACNQ==
X-Received: by 2002:a05:6808:301e:: with SMTP id
 ay30mr54242oib.75.1635369170558; 
 Wed, 27 Oct 2021 14:12:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bd39sm507021oib.2.2021.10.27.14.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:12:49 -0700 (PDT)
Received: (nullmailer pid 2170245 invoked by uid 1000);
 Wed, 27 Oct 2021 21:12:48 -0000
Date: Wed, 27 Oct 2021 16:12:48 -0500
From: Rob Herring <robh@kernel.org>
To: Flora Fu <flora.fu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v3 3/7] dt-bindings: arm: mediatek: Add new document
 bindings for APU
Message-ID: <YXnA0FIzpSUwAR2x@robh.at.kernel.org>
References: <20211023101334.27686-1-flora.fu@mediatek.com>
 <20211023101334.27686-4-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211023101334.27686-4-flora.fu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_141253_269402_A63CEF60 
X-CRM114-Status: UNSURE (   9.94  )
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

On Sat, 23 Oct 2021 18:13:30 +0800, Flora Fu wrote:
> Document the apusys bindings.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>  .../arm/mediatek/mediatek,apusys.yaml         | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
