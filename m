Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAF1CAC598
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Sep 2025 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRrOX+lH79lbk3CMWLiPCWajedhgVBao1TTFuyFRYcw=; b=ycK6p+/OUJgDB0JCMQ4q/L3kNL
	PY3FjlVWkEGfP5RHMNUTpWndlXag4l6Of2Hig1thQ35GRZMysgfVJ9wEBXnO9tyPLJOnpOFY6+3na
	lYI/XJsABxa8mfOVvaIvqCMUsq4bQho1uHdF2Mf7+NJs1DKuKsIn2L7KCJtwswaryOITK1xRFXz6C
	LfI6skamrFhblVCKsFK5jaulOpD9IRUT8SaGfIk82XfA1YCABROpafK72iGMGDK3LSvMV4wJzJyHC
	hJUWXBRwbKa/Pg7QyhqWG3Nw6fEkboFVyz64DfkF/e/SiCCpKwwdtzpixMu8oX6NYTURRfbIE0COv
	pGm3k1pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp18-0000000AtaC-17fi;
	Wed, 17 Sep 2025 10:04:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyp15-0000000AtZI-3Lsj
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Sep 2025 10:04:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45f2f9f1641so4271035e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Sep 2025 03:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758103438; x=1758708238; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gRrOX+lH79lbk3CMWLiPCWajedhgVBao1TTFuyFRYcw=;
        b=Tunk/izto7i6n3i6nHWzVPdrn8m/FDR7+aNCl34OO2+Bts22P7iakbvpvFOyKkKCkW
         zYjO7sdmElaXUtJJ1McjxX2T7cZXE/MGJIRKNpeatvTv5T3GyNDm/sSXl7M8nOpQ8HgY
         K1yac+FCxYbwxKYYnFFDAIFXD73i+jHKZg3JF4qgmerbctggRBTfkJRRwPTOiPFHvN82
         u140wkqNk0GbzQLe/RO5cidi+XzsxsQLxZkSVlZk7wgbVe0dap5F/2gR8NIJM7bkKNrZ
         DmdFGw7/NqEYbcmiimZjMK9y+eNgIxj+7BjXuXSlHk5WEngiHUTa9RDsOttbwcKkqknT
         8soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758103438; x=1758708238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRrOX+lH79lbk3CMWLiPCWajedhgVBao1TTFuyFRYcw=;
        b=ZBKKDLi0vo7WF5W3XWKw3FZfhaZDsVW2FbX8HAcKbDGQibsmJTYlXHKEIYDiC680Np
         gcxDmGFKDbWUAxUS/WkvXXa5k8d5M7f1H1PNsclj+LMCMfgjg5yENnq36oyLvXv4HAI7
         td03q8gJaa28qFvw9DZr+AROpvFa0BGE6xAUo8TB0M0IDEYiFGK0Qc7u6gVdYv/EjkN0
         rRiSFrVlVIbkDt1qDU9diA1V8EHKJ5lEWv+/Whp/8vc2KnjVRpuqRf7G/fQ3PDvnj1xI
         1znevTn8qtttqn3l3ja7uDkJzCvk4zlJciIbsby5lr+CXnwJvANCEL2+D9qmP05kekY7
         UFfg==
X-Forwarded-Encrypted: i=1; AJvYcCXEXyi0gESGM8IXvSAuleoJEs0pFL7lxMwRS8DIuNPljyJEvYB3mSy/zyO1MAEB5HAei85wUxOZmYHcosmk1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb/BybYpPCxbeEXTLmGVhxj9yP9GfEsizCZAdnxxbueET2oCrO
	STPPI3B7Zkd73zW4v8uGkkSeoYY463i0vqj8Ky6khm60/w2GprYX07/v
X-Gm-Gg: ASbGnctH7Ks6RAU1FZ56zMU0QWFdB4vKmcOry9XpLgqSR5GGHfzsGmFQrE6txZvD6QW
	sTUogD3G27UVoFuPbane8eLyb95Gltf1gmHt2T8Do6bYNRvSZAD3pC24Hvbe4TTOjDcPhVy66wq
	B61T3zPo++N1pNiKoPLok2nXFdNp+RaNRNtQHU4x0D1ir7i2Jebmqltbdy9JuuZicKgEDvAGEW+
	ATMbD1o7D1NSJFOSdofrzwszhzvxvpZ9IsMNbVkCZTnCEcWAgGicuQgVh6rIQMa/ASyxPPb1XyV
	XeBWzGLcMUTnkg/XL4KEsJylxjphfjSsm6Q0WXkkrSpuq5XydM+dlh8wATuQ/EKKHGzYTm9l5Mq
	CLgL6azfvIOiMbgg=
X-Google-Smtp-Source: AGHT+IHLOG5YdNiWrI2g4iNSNygtK8lUMOKb4aBkIX2ORgpQKWdmRgP7R0dl64oEM0ngNwVEe1oh8Q==
X-Received: by 2002:a05:600c:648a:b0:45f:27f4:47bc with SMTP id 5b1f17b1804b1-462074c52f0mr6761615e9.7.1758103437696;
        Wed, 17 Sep 2025 03:03:57 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d005:3b00:8bcc:b603:fee7:a273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139e87614sm31032865e9.23.2025.09.17.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:03:57 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:03:53 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next PATCH v18 4/8] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
Message-ID: <20250917100353.dbjeh5eibkqdpz75@skbuf>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-1-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
 <20250915104545.1742-5-ansuelsmth@gmail.com>
 <20250917093541.laeswsgzunu3avzp@skbuf>
 <68ca827c.050a0220.11f9b4.a3f0@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ca827c.050a0220.11f9b4.a3f0@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_030359_851453_B93AA0BC 
X-CRM114-Status: GOOD (  14.36  )
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

On Wed, Sep 17, 2025 at 11:42:13AM +0200, Christian Marangi wrote:
> On Wed, Sep 17, 2025 at 12:35:41PM +0300, Vladimir Oltean wrote:
> > Unless the few tens of bytes saved matter on OpenWRT, I think this is
> > overkill (and you went too far with my previous suggestion).
> > Two Kconfig options are unnecessary from a maintainance point of view
> > (and config NET_DSA_AN8855 isn't even selecting the correct one!).
> > I suggest you register both tag drivers as part of CONFIG_NET_DSA_TAG_MTK,
> > at least until the differences increase to justify a new option.
> >
> 
> Ok, was following the pattern done by the other. Will drop the
> additional kconfig.

tag_ocelot.c is another example which registers 2 taggers under the same
Kconfig option.

