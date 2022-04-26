Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA98C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5u1aCV9xRQEu4R4fgyVL7pm/JDYYGokqJBueBjjYl0=; b=fcOBcqBkX8ur02
	i5gzaIv/utkHmocGB0XYLNUSDhLLgWJuCOuFUbosdSBiXmQVYCAdE81IsTTitedVb6lLbGZM5Qy5B
	KAcExF+tDi/cqJwwjQX6+99Qu9s9p/DLOxZBZaAlqL3QQINiPU2glND+IefvmUHRVn5zJScvR2lsK
	GnTzJNpY09KHsT9ULSeiVvA+6HN+jTt0WgiSyxwWAyQ5HeKe15ub+kOKwI2kwpupeOFAcZ7oi5AT0
	y1F77R3nMnHHPi7KBq8UeCWo6JfOGX0fS5NgL5ECi3lRnRkwrjJp5JgfbQXSMcqiJ2eAvlA7zRSOB
	Ua/6mewjCz9mVlg0wKjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQDv-00FpRJ-43; Tue, 26 Apr 2022 18:47:43 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njQDs-00FpPt-4S; Tue, 26 Apr 2022 18:47:41 +0000
Received: by mail-oi1-f176.google.com with SMTP id q129so21703658oif.4;
 Tue, 26 Apr 2022 11:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1uymfQiPxL3nM8OAUppQEvfmPuzquyZRpSRTKhxYVpY=;
 b=LDY0+mMVucnupm1LaCousav4ZwkhiWfyiooCLpRVV+w0QYS1Ih62x/YGZYcUmNsvtp
 tFWI3kkITL2xPCbd7a69W5kxAhO6+G/jW6gItRqmQ7DDIOlJCl9h6MqslmjuZ9DtVdFn
 Wi8hUO2nZQfOnUZN51hyuCh3ySsnrDaFU2dvNnnkwXvYggKFok+lhC26XYX1JOIxJzHu
 ls6tvOpedbMfWrpnn1PfJHfDq9kJrN4Y0kLwN1rDA+9+cJHWqvJAu5V7be+fd4Y/+G4C
 xn6qb+VEE2wNyDVJbOaRZsVlS7QPTdM+ySMwfFsAB6XOHOe9ytnO4MF72QzqfVneMCQ+
 Ag/A==
X-Gm-Message-State: AOAM530QmYsRr8QKEMHSF42+s+DQv1SKIVreMeLLXsO1fGi6SqtLtoMe
 9vzHxp4+faWDlHuvZoAjXA==
X-Google-Smtp-Source: ABdhPJyM1lyE288UlIkDddumXd32y92F4WYqMeTFtZj6sy25wfIWqHkKXBOpvngFKm3dl2kOjf0I7A==
X-Received: by 2002:a05:6808:f02:b0:325:e78:3bbf with SMTP id
 m2-20020a0568080f0200b003250e783bbfmr7542341oiw.86.1650998858297; 
 Tue, 26 Apr 2022 11:47:38 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h1-20020a056870d34100b000e686d1389dsm1113835oag.55.2022.04.26.11.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:47:37 -0700 (PDT)
Received: (nullmailer pid 2339368 invoked by uid 1000);
 Tue, 26 Apr 2022 18:47:37 -0000
Date: Tue, 26 Apr 2022 13:47:37 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ryder Lee <ryder.lee@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Shih <sam.shih@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: mediatek: topckgen: Convert to
 DT schema
Message-ID: <Ymg+SUzI6FMFDE4J@robh.at.kernel.org>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220424084647.76577-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_114740_214726_1A0B9C36 
X-CRM114-Status: GOOD (  13.28  )
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

On Sun, 24 Apr 2022 12:46:45 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert topckgen bindings to DT schema format. MT2701, MT7623 and
> MT7629 device trees currently have the syscon compatible without
> it being mentioned in the old DT bindings file which introduces
> dtbs_check errors when converting to DT schema as-is, so
> mediatek,mt2701-topckgen and mediatek,mt7629-topckgen are placed
> in the last items list with the syscon compatible, and syscon is
> added to the mediatek,mt7623-topckgen list.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,topckgen.txt        | 35 -----------
>  .../bindings/clock/mediatek,topckgen.yaml     | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
