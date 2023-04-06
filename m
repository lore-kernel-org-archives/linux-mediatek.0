Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A19EC76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RMkMXwMSZEr9FFGtDRkxvrTAlSRKSswIFRpR7VpqIQQ=; b=fK6zevX1/IDRKyLUuB34pZwYHN
	xp/zgH57q3iGuf4t9736kCXiYXNa2YzXvcT1RJyh4L/oBfq4q04IifT+HU31TzKAOnxQK/1pi3QwU
	/oQ1tVG7YjQ+tkCp3xg2QbjFbvahrYCkDSjupb3X/ud/jzAKPG301uQaXPVlKNEv7oaMA/xpEeEzA
	79ZNaQslAodW4huRgR6XhZCR5GWr1cbH6fEVyjxCZ70/fR+T99LS56PInee6m+NSdy92MFxv4zn+q
	aRFTQdRKJU9dHoI275XMPUq2zuYu8h5H2kXcYN6T0nPFGM+lui0ntI72Bad1IxzriBzdd8D3F5pDK
	7pn6CnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRUE-007o6J-2F;
	Thu, 06 Apr 2023 15:25:18 +0000
Received: from mail-oo1-f50.google.com ([209.85.161.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRUA-007o4U-2N
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 15:25:17 +0000
Received: by mail-oo1-f50.google.com with SMTP id f24-20020a4aeb18000000b0053b78077c9dso6210524ooj.12
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 08:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMkMXwMSZEr9FFGtDRkxvrTAlSRKSswIFRpR7VpqIQQ=;
        b=nARzFW6wogR0+17VVdYnm6Caf3VLeKVdQI/YeLz22J+LGB08uU2jRGkynXVpzXRvJT
         TVMsbK85RiWg7Ff8fIgqe1XboxRI0iXiOS/v+VwiH2AJswOaIEnwtdCcv90lMIX6QGnC
         vxlmuamNMG30FBtAmmov8Bo1PeOlxUCIX+V9NQ5Uano36HAJ+ieydwggC2SITF1nWRIQ
         GW9leg+dcS1P2gAThQ8w2mcrZcRAUUr7gJcvz8jkNN3XDv5JHKTMrRd5XG990rvbP5O5
         WbQ6qGpKyWjKABBb97/z4eQBDP47ewK1fSYo+6ZJUcEmYrvLHRCHCD8FIA/b5Vo/C9jd
         7GAA==
X-Gm-Message-State: AAQBX9dtpBFL5QGOOolmtxI4oTCNti7lU0K3Lr+cGsOJzTObYeFj9w4n
	y5Ga0WKrQKoNwz3u8NTOMA==
X-Google-Smtp-Source: AKy350aD8i61CSEMsXWO+ODXbKKtkeyWipy3Tnvjy0WnRBnCKMJ4XFPRDEIn9gvkDG7hvfRH5ebobg==
X-Received: by 2002:a4a:e753:0:b0:541:87fe:5b75 with SMTP id n19-20020a4ae753000000b0054187fe5b75mr1415607oov.1.1680794712637;
        Thu, 06 Apr 2023 08:25:12 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j48-20020a4a9473000000b0053dfd96fa61sm646099ooi.39.2023.04.06.08.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:25:12 -0700 (PDT)
Received: (nullmailer pid 3124644 invoked by uid 1000);
	Thu, 06 Apr 2023 15:25:11 -0000
Date: Thu, 6 Apr 2023 10:25:11 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, kuba@kernel.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, lorenzo.bianconi@redhat.com, daniel@makrotopia.org, krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 net-next 00/10] mtk: wed: move cpuboot, ilm and dlm in
 dedicated dts nodes
Message-ID: <20230406152511.GA3117403-robh@kernel.org>
References: <cover.1680268101.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680268101.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_082514_774758_382CFEDB 
X-CRM114-Status: UNSURE (   8.26  )
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

On Fri, Mar 31, 2023 at 03:12:36PM +0200, Lorenzo Bianconi wrote:
> Since cpuboot, ilm and dlm memory region are not part of MT7986 SoC RAM,

That's not really a requirement. Is that the only "problem" here?

Certainly going from a standard binding to a custom phandle reference is 
not an improvement.

> move them in dedicated mt7986a syscon dts nodes.

What makes them a syscon? Are they memory or h/w registers? Can't be 
both...

Perhaps mmio-sram?

> At the same time we keep backward-compatibility with older dts version where
> cpuboot, ilm and dlm were defined as reserved-memory child nodes.

Doesn't really seem big enough issue to justify carrying this.

Rob

