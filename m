Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB28C4BA21
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 20:15:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B28B21556
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 20:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rYOrym73"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B28B21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zhyg6DezN/7D3Qo/BMtFfmGr1muGfR9GDYQ7JUfHzNM=; b=rYOrym73AdTvsk
	2+agquZrzHpjZ1hpRE2W7s6Y2B6gw7ODtK2ngulWyazvHVOWXcuUnxM9KPIwoSckAIaRc4ZBABvQA
	vJoRORip2Z9e++83rJJ6S8HVnhqifs9jmvfpwFbAFxfR+PWZ/qtoro0BknoShzAQPWloY7ztCO/Lc
	Rk75+May2DbuXBZwBjl9C/OmhxcUmpUVFmaJ8pe5oL4/LKYQzuYUJEgwNYiG5arTmKLq1TqA8EBwF
	IIlqsD2QJxGh15eICKuWQ86coZyFmVd3nitZR8lchoquhw+YL7UdNGsmaQOYmolMe4+jEwY7keqgY
	zx+J+jL0Tzb9FOHKO6Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j735c-0006Dd-6o; Wed, 26 Feb 2020 20:15:28 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j735R-00064u-08; Wed, 26 Feb 2020 20:15:18 +0000
Received: by mail-oi1-f195.google.com with SMTP id v19so809103oic.12;
 Wed, 26 Feb 2020 12:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kQF8x8EL9Iw62X5whExL3LnIV7r+UiOPvcN0XmWfobM=;
 b=iovb3VXqyKlsnGjsgYKRAhMuX1jJ484I1pNufi049RMiGAqK1M9Fpk6ytgXV5WaLg7
 Kgi6OP9UbrL9flMU7hB1C7wj3d/eS2WktunyCZBqK418kOUswhCitst3KtxZ5/aoP10r
 gm+PsyQp0KBxrcYvgW+lJGUf/9vSNjA57ZQzeM8YTj4iHKbET9fzjVjY5wmSNMzlr5Jr
 LTL75+bK/y+fOU72t+AFZzsNxUJs5rJqscw20ZBoDX9iPYBVi/aRRdjmDeJRvmGpnXlh
 MzNUA5LmfRlWq8wyQcJREc8DMfl3Y03tAhg4yewPgC3fYKCoSIse/aReradgs1mQCHbD
 7VkA==
X-Gm-Message-State: APjAAAV/JTflzy+L2CjG3cttN1PV7ZTkF2yaaFSoP3nyc3h718UVNQ3G
 SU84Al+9yEIjTzcDc1SQNw==
X-Google-Smtp-Source: APXvYqzsmy77xTW6N6DsWtgxWAfgoYTUvEH+Ph/SNmuOR8ic4AabsTV0RsAJBzgOMNn/hLeBuz46Eg==
X-Received: by 2002:a54:4e8d:: with SMTP id c13mr594836oiy.27.1582748115485;
 Wed, 26 Feb 2020 12:15:15 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t22sm1149383otq.18.2020.02.26.12.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 12:15:14 -0800 (PST)
Received: (nullmailer pid 18502 invoked by uid 1000);
 Wed, 26 Feb 2020 20:15:14 -0000
Date: Wed, 26 Feb 2020 14:15:14 -0600
From: Rob Herring <robh@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: mediatek: document clk bindings
 for Mediatek MT6765 SoC
Message-ID: <20200226201514.GA18452@bogus>
References: <1582278742-1626-1-git-send-email-macpaul.lin@mediatek.com>
 <1582278742-1626-2-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582278742-1626-2-git-send-email-macpaul.lin@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_121517_043435_3210E4A6 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <Ryder.Lee@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 21 Feb 2020 17:52:18 +0800, Macpaul Lin wrote:
> This patch adds the binding documentation for apmixedsys, audsys, camsys,
> imgsys, infracfg, mmsys, pericfg, topckgen
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt     | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,audsys.txt         | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,camsys.txt         | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,imgsys.txt         | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,infracfg.txt       | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,pericfg.txt        | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,topckgen.txt       | 1 +
>  8 files changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
