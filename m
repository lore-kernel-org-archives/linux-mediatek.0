Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C4C54EBC
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Jan 2023 20:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/RUYZ6zFkymzHQkSJ67aW6tJEdK11q0qpSv8WytCTvE=; b=ijV4AXBolDff/IBSfTraTEi0+0
	96/0FygE3/7IssKTLQfvvBZ8Lzm8tHxUdkd72FBzDeITykJnsRv2vlo/sMUWSuJe9bZY0PtQaLpKd
	/IxtWVKmIgfZIwQnd49E+C3h3q1SygTC9HUEVDx7TKLKki8dvEPs/Gt6IER5hZjN0NLWEymULPtpj
	al6VhXLK/LFqkvd0vSQpfwBy8HyAmjlksUtx5Jx74w+bEhpPGL0yPBMfZg6SfoL3v1i0Vi5jivlBc
	KTy0aJ+0YtynKtT7eKmuImLrysPb7zb+heRSFl99mP3BglaJwECAxoDRN7azcxj4YnieMj/gyh+2n
	Z+5h2sfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEcCl-00Fc4q-UB; Sun, 08 Jan 2023 20:23:44 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEcCj-00Fc46-9Z; Sun, 08 Jan 2023 20:23:42 +0000
Received: by mail-il1-f181.google.com with SMTP id o8so3966564ilo.1;
        Sun, 08 Jan 2023 12:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RUYZ6zFkymzHQkSJ67aW6tJEdK11q0qpSv8WytCTvE=;
        b=QikJdpYZKzGDbslRc5UMatcWoz65O3tdFwPKZk1RUdBR2TKKY2GxHXNrqiwBgb4vH1
         7Npj0ExCOGEIpmv6WW7aeU2vJWFe90J1YOOJlrP7kg28uIig/zkZzg1pvccYJ6lJZdVP
         rrAbvXjxAYo4719pXGVqi/LFEwsjc46O0lbXvicREl3jFqlvenB5AyB6ai1Cx7rkCDpI
         aY8tYZt7Sv+2A5E1Okx6bSQRTe1WI0zAihxtWiDZNKyJH9x6fXG6bDtvFEf1Gm03Te2P
         r5jLDyLam52BYLr7ul7KBnIfd30q5ge8Hsb8AF3PJw7ylMHg4v4rJA229XtqTw/SRFYn
         JNmQ==
X-Gm-Message-State: AFqh2kqxCCd/HgJz3U20KaxCKozETQhxyjHIHdEjqXFilIC10h6HK3EJ
	8SwwTMXdGEgOR1LP+Qb7og==
X-Google-Smtp-Source: AMrXdXsDj5T9y4ilX42yDZ+W2rfpkG4YmtliGaBA5E5UOPjsdh2yQ433Lfn0/CFTQnMUY18w2rW4Pg==
X-Received: by 2002:a92:dc8d:0:b0:30c:4c54:87f4 with SMTP id c13-20020a92dc8d000000b0030c4c5487f4mr16995592iln.3.1673209420129;
        Sun, 08 Jan 2023 12:23:40 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
        by smtp.gmail.com with ESMTPSA id t9-20020a92cc49000000b0030bb7c67efcsm2198954ilq.16.2023.01.08.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 12:23:39 -0800 (PST)
Received: (nullmailer pid 229453 invoked by uid 1000);
	Sun, 08 Jan 2023 20:23:30 -0000
Date: Sun, 8 Jan 2023 14:23:30 -0600
From: Rob Herring <robh@kernel.org>
To: Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>
Cc: linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-mediatek@lists.infradead.org, sean.wang@mediatek.com, chunfeng.yun@mediatek.com, zhiyong.tao@mediatek.com, linux-arm-kernel@lists.infradead.org, tglx@linutronix.de, lee@kernel.org, gregkh@linuxfoundation.org, linus.walleij@linaro.org, devicetree@vger.kernel.org, angelogioacchino.delregno@collabora.com, maz@kernel.org, linux-kernel@vger.kernel.org, nfraprado@collabora.com, matthias.bgg@gmail.com, allen-kh.cheng@mediatek.com, robh+dt@kernel.org
Subject: Re: [PATCH v7 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
Message-ID: <167320940963.229372.8143524067884633693.robh@kernel.org>
References: <20230101220149.3035048-1-bero@baylibre.com>
 <20230101220149.3035048-5-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230101220149.3035048-5-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_122341_355452_DC778C88 
X-CRM114-Status: UNSURE (   8.52  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Sun, 01 Jan 2023 23:01:46 +0100, Bernhard Rosenkränzer wrote:
> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  .../pinctrl/mediatek,mt8365-pinctrl.yaml      | 197 ++++++++++++++++++
>  1 file changed, 197 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

