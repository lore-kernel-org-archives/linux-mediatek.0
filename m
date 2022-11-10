Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE69CC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 20:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8DAIYPywI0mxn7CCbjHVTuM6h/N+D8/hFU0/orRKO0=; b=IqwAAnJ4quyJtzZ+5ZOj1zpHny
	bMdWFjSCALO8MCQVCykkRhJholDykjHFn4o3QX9bj8+OLGdpN8e4tO8Gi+RISoQSeiBNWORYgs7nd
	SDddUfkQvtXCb7//vgcWh4Vf1XyF92Wkm8btI4lJNG/1wdY34bzQNT2PytbXdQ3oeBtF631yXmZd8
	rsQarkaHvJa/FvVAhKER+hxhLLD2ga2TVI745wbI7Bct8EQ/BgVpMRU6MA75GLFFwMCbmJm7P/oO+
	V8ouPKtSpvT3iMJHT9syI5GvRJSNIzC6/Z6F7J/vseVcxureHV2qYU49i1/smpYFakBLFzWw9jf4Q
	NQGA0mpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDrd-0099yL-SX; Thu, 10 Nov 2022 20:09:29 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otDrb-0099wt-5R
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 20:09:28 +0000
Received: by mail-oi1-f176.google.com with SMTP id l127so2981809oia.8
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 12:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8DAIYPywI0mxn7CCbjHVTuM6h/N+D8/hFU0/orRKO0=;
        b=JuBnuGKF/yvxxmYRcEEFECygBpnBl+tDO9OMm+LW+JmKJWmHSVVzTBLi8k0+ryz9YV
         u6cfAm3XygI+JHHCbvQHsszbCVRYiUrFLf7VTE3ZRzw6n/HDnOpFu/sCdfk21I0J8/ET
         +r9Wt21XhgXM+9iZLSsqcJ85rAdPxv7kCubfn+ok54xV0huDxjeVqQ6/XvaIgTvnO8cF
         SefOUj3f1THnCzuZg2lq7mfYMVZ/VPoes/TiuA0HCcWj5XGHxhxKjGbzUuwaaC57Z4N3
         oMExhsa3aYuTD/9McDMS5/PnvyMe+4PKvHYKD6iOecYyfGI7LN12tkBDYyCrFdZjvTPE
         6vYA==
X-Gm-Message-State: ACrzQf0dOT7Xp8OqcoDMvyA/OQ4/wOCaLz/UB8l8jaLNRmYWmkvlZzNV
	yp+SmqTpIlnfRGRAEpxc7w==
X-Google-Smtp-Source: AMsMyM5GXBLkSQdxXUGbRIIAq883HBK7Xe0JJqWb1HTOOngkCOzjFhLSV9rqe8a/Y/gY0wHmfaBTzQ==
X-Received: by 2002:a05:6808:1396:b0:359:f059:ed05 with SMTP id c22-20020a056808139600b00359f059ed05mr1956775oiw.148.1668110965817;
        Thu, 10 Nov 2022 12:09:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bu7-20020a0568300d0700b0066cf6a14d1asm253530otb.23.2022.11.10.12.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 12:09:25 -0800 (PST)
Received: (nullmailer pid 907677 invoked by uid 1000);
	Thu, 10 Nov 2022 20:09:26 -0000
Date: Thu, 10 Nov 2022 14:09:26 -0600
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com, devicetree@vger.kernel.org, daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 net-next 2/8] dt-bindings: net: mediatek: add WED RX
 binding for MT7986 eth driver
Message-ID: <20221110200926.GA885371-robh@kernel.org>
References: <cover.1667687249.git.lorenzo@kernel.org>
 <2192d3974d30b1d0b8f4277c42cdb02f6feffbb9.1667687249.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2192d3974d30b1d0b8f4277c42cdb02f6feffbb9.1667687249.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_120927_226323_9C7D563D 
X-CRM114-Status: UNSURE (   9.73  )
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

On Sat, Nov 05, 2022 at 11:36:17PM +0100, Lorenzo Bianconi wrote:
> Document the binding for the RX Wireless Ethernet Dispatch core on the
> MT7986 ethernet driver used to offload traffic received by WLAN NIC and
> forwarded to LAN/WAN one.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt7622-wed.yaml     | 52 +++++++++++++++++++
>  .../soc/mediatek/mediatek,mt7986-wo-ccif.yaml | 51 ++++++++++++++++++

Are these blocks used for anything not networking related? If not, can 
you move them to bindings/net/. Can be a follow up patch if not 
respinning this again.

Reviewed-by: Rob Herring <robh@kernel.org>

