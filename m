Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB68C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt0frRzR+llEQZaK/DO0XkpInRvQORs9L/8JhGVHFqc=; b=z0pJo+TvfWYTQT81Ag0rvCyDXL
	JENIaMBpKQ3AKY/ndPxilwfyjghRA50oX6aD8wSFX0kGKSuiVLB7FUpbY6TcXaIdmxFUpvCPbBevc
	+BQxUzpt9yKXN53zGA1qsu/aIYRJqhUAQhUv4Gxva79buvLWW6bWkW7nEUw/vD8Zw4WiWy2wYcEi5
	knzPmlgq0oIRFA1KkJRExrFZyC8MZJMld/bn87MgMCOFAnV65Ld+PyykKhY3TA5/GmlhM5kMAiz7F
	HkRXOxrVrQ+gW9H9kOtPfOCUKLy7EwlQGBDafO+0BZlZ3T7vQrIlB7whv8u9hS2YZ9OvQPwN1RHJE
	yljJQ9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOcg-007BZR-Qt; Wed, 15 Feb 2023 20:43:26 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOcc-007BWv-J7; Wed, 15 Feb 2023 20:43:23 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-16346330067so231435fac.3;
        Wed, 15 Feb 2023 12:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt0frRzR+llEQZaK/DO0XkpInRvQORs9L/8JhGVHFqc=;
        b=mwtT4dSl4sgJ5JrglQ5ySJW7hHHLiOK7CJD+SpavOPPV3ddd/PCmnPdLG3KTVZe2SP
         iOiy6pTsokvfmnKOl4T4duQuTRH8mpKF+/IW7jyKPkYTeAKDQHA1F5LtUVRqow2ldQnH
         Nm1hDseMA2gktj4F3HY6CmmznSw9JiZfPpcGS1mwnLbrsJkyOy+yiwn73olbM9CDgmLY
         FRlKhKBktnzfCALajhAXOdd/bWFaL3ujBT1c10ZfwhyXCftCHxrleJAx47ZGJrxeTabr
         nfnTt21NwuVkfjeAMf2yqtebVQyrSiw8qXuN+Dii+4pthRZ3p3NYYX7tzDEkmdi0baSt
         zlWg==
X-Gm-Message-State: AO0yUKX3KTjZBkKCgYxmBBvOyjQJ1N1oziHupwVWRWcTj782RZ4j6ezj
	d3d6TSTYtTd22InX37M2GQ==
X-Google-Smtp-Source: AK7set/50GBdop8VIc7s3EAxwGBGWbyNcA539gq34/FMTl1ZDlaTwOVNjvWSnEXsfwQb/NQwOO/gYw==
X-Received: by 2002:a05:6870:c0c6:b0:16d:f177:1a1a with SMTP id e6-20020a056870c0c600b0016df1771a1amr1659946oad.46.1676493800394;
        Wed, 15 Feb 2023 12:43:20 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p1-20020a056870a54100b0015f83e16a10sm7374482oal.44.2023.02.15.12.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 12:43:20 -0800 (PST)
Received: (nullmailer pid 521661 invoked by uid 1000);
	Wed, 15 Feb 2023 20:43:18 -0000
Date: Wed, 15 Feb 2023 14:43:18 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v6 03/12] dt-bindings: arm: mediatek: sgmiisys: Convert
 to DT schema
Message-ID: <20230215204318.GA517744-robh@kernel.org>
References: <cover.1676323692.git.daniel@makrotopia.org>
 <f4b378f4b19064df85d529973ed6c73ae7aa9f2d.1676323692.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4b378f4b19064df85d529973ed6c73ae7aa9f2d.1676323692.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_124322_696649_2FE760CD 
X-CRM114-Status: GOOD (  15.03  )
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

On Mon, Feb 13, 2023 at 09:34:43PM +0000, Daniel Golle wrote:
> Convert mediatek,sgmiiisys bindings to DT schema format.
> Add maintainer Matthias Brugger, no maintainers were listed in the
> original documentation.
> As this node is also referenced by the Ethernet controller and used
> as SGMII PCS add this fact to the description.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../arm/mediatek/mediatek,sgmiisys.txt        | 27 ----------
>  .../arm/mediatek/mediatek,sgmiisys.yaml       | 49 +++++++++++++++++++
>  2 files changed, 49 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.yaml

If you respin or as a follow-up, can you move this to bindings/clock/?

Reviewed-by: Rob Herring <robh@kernel.org>

