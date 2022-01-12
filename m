Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F488C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 01:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQncMlyB2ywzD4m7VGi6BP9FRSdIDb0TxSMVs/Y3aec=; b=hQzGp8tBHVYg7b
	jRRi4Rr1CIdeKNKa75GQnbMeJXEjEyQAxTf3g23/9RJN40/Oy2TwGwimbuE/HcXZonmpaaU7mPsny
	3aITyBLT4c+VsdkQm5zlJB6bMRMXfSRV4WRwEp7GWGhdn+yaAxmX98fpcAFjeiOby6orztxHF9fLS
	8fd1z7ue35cDgN1X3H6ikP+7jnC6leUi7B9NPRVRoNLl5QwjARZD0uIa37dNcxDP2Yu3B+MNenA7u
	YULHI6lpIWkkpBVsSX5xuAMHPY67z3lZhVgiIpLFsuM1ppH7gDDxYfc/+Qa6fagKD7GNVTvWdw5KN
	URDP2nvFqWNVLKX1GbcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7SnO-000iLy-5L; Wed, 12 Jan 2022 01:51:26 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7SnK-000iJa-Vw; Wed, 12 Jan 2022 01:51:24 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 t6-20020a9d7746000000b005917e6b96ffso898108otl.7; 
 Tue, 11 Jan 2022 17:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9nJ06M7x1XgF7yAjC1iLtiDKFvUsW6vbYekU5nFYFTc=;
 b=LSV7pOde4NMUhLDNlRAKk8tX31S00G7OpVNwpVgNh9z+DvCJthhiA0o/twVnSiEtTi
 Fdpkr1z/ClJdEwDBKmiZm0hVYaF24HSaMRCl9Cmatj9WU8d7IeqsbVI73kDetVf5slCz
 U9AlO/OTqsFi+aV/sagyiS6ub00JvU7coGq6nv2BeO49x+rX1tpwjCAIq3s6oPXs6rfm
 7Au4/O/ndxwbUSvUMUkRLXR+kZ+wyz8IOUY1q2/tioeKSKD6WTkdXO39uADoTrKaCJuk
 gJBB73xRL0Ics7vhsyY+qnOZvYC4+iu4yhTGi/3JihuB00nPpCIw8hWcaUcR5HwMIUMh
 +hzg==
X-Gm-Message-State: AOAM530QcqM/OJeTZ4cWlne63o9iO+befw73QN4tHVxvmESMxCPPrcHy
 R6ecmKDDxNSbZ9f7wIr+uqOMTcWZxQ==
X-Google-Smtp-Source: ABdhPJyWAaUOt7C6oceNwuUPeGTcZmYdyGD5ZndwST01GxuZmbsF6GtL41TaCk7fUZKuPIga6L+m+A==
X-Received: by 2002:a9d:6452:: with SMTP id m18mr1436280otl.99.1641952281637; 
 Tue, 11 Jan 2022 17:51:21 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id n26sm1949402oij.5.2022.01.11.17.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:51:21 -0800 (PST)
Received: (nullmailer pid 3899690 invoked by uid 1000);
 Wed, 12 Jan 2022 01:51:19 -0000
Date: Tue, 11 Jan 2022 19:51:19 -0600
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, chunfeng.yun@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, ryder.lee@kernel.org,
 wenst@chromium.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/4] dt-bindings: pinctrl: mt8195: Add
 mediatek,drive-strength-adv property
Message-ID: <Yd40F1noUJW4VNpJ@robh.at.kernel.org>
References: <20220107115345.9075-1-tinghan.shen@mediatek.com>
 <20220107115345.9075-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107115345.9075-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_175123_050693_4FB163DE 
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

On Fri, 07 Jan 2022 19:53:44 +0800, Tinghan Shen wrote:
> Extend pin driving support for I2C pins on SoC mt8195.
> This property is also documented in mediatek,mt8183-pinctrl.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
