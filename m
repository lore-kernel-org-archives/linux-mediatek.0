Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A04C47422
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh5PJX6dWm7kSDwjmqjlz8KtwMMRblZ6e8LLH/QNoIo=; b=wo14MCsLuZHEl4SKRD8fFGKham
	+aeQYYAeseCE5a3rS81JRhdLkdEj+Ndab2NpcNhbVcAdq/SmVFmiNBx4f1Ul1/ZTmYLQoiAkxuNKj
	v+B28/qI6K8Nz41PLk2rzz5oA7KuyKz8DanwhfhorXHfff99Af3f4UA9qw8J/rrOiUC6sgiv/07O1
	j3OtSwdt2ZAGQMRSc58xLtKIyyxX9Qw2dAYf1g7uznZ/v9fOoWnBaaOowBGMR0CBy234Obsw5/Mlc
	QDsPUB5Zlz/M23wvdNXAsIDqbSc/5yOZJtOQKYEq558cgJUawAly+kuNxHgr+Mu/ODCrVSLJMNwB6
	3rUu1wxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR87-0000000CiTz-1RMr;
	Mon, 29 Jan 2024 12:52:51 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUR83-0000000CiQy-1oQc;
	Mon, 29 Jan 2024 12:52:48 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a33735d22fcso233560066b.2;
        Mon, 29 Jan 2024 04:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706532764; x=1707137564; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wh5PJX6dWm7kSDwjmqjlz8KtwMMRblZ6e8LLH/QNoIo=;
        b=cUJJLv5FF3mG5+ZzzP/SDGT4F24aFLBl3MBjG5toY94fu8XR65XSdrWgiD4Fj8jS4o
         Wh/82VkZAtfnSS4aUBgbsM3/kdW7n5Lpuv4Tdmcyu38L2rZsyvVnNxsahS4KMaQWEkmk
         2AmHZt4voowtx6FNqEOGsDv3Oe1nXbkLePQSAqmKCWWYm9Sz2sazO89+1Fx/WUhY6KiU
         98N3aMSfRzZMinZwzIxUXgWHA+fLqXB7DsZOJdg3yc5ZTkNp71eLGB6Hi0i2EY6Prg63
         wSIZqGDWKiRTZOX9P1Ophh9Hy2WmUTMno5jyThp4wTxallaLEAY2v5OXCFfeKpz04ULG
         81ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706532764; x=1707137564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wh5PJX6dWm7kSDwjmqjlz8KtwMMRblZ6e8LLH/QNoIo=;
        b=wzOwqpGeGwcGA582eow9BpriOiHI+n8cixxodkwfe6AdfCdtTROfqLwn8Gq8F6R0k8
         jtMJvzqH6zSqEMiVQiYrDhaOa4ot1hXogX37gKdxcrMooxVHqdwph1B4BCZZT4b4NCvq
         U/mWoiqCcw9lSW9ZX9nE1/2YOtvRt+xP9i+y1yxCStBxS557Wzj5tWGU7FsoYjcmlr1H
         aOs5tXONfkW8UTyO0IhJcY/j92BaizWtstx4kZcd2SEeAgvlUJJnTokUtyn3XYG2uqIb
         6HLQJ2mKoF5XL68DMKjxlL+QEEZwiNvUH+CgyOYGRsBVbufVxA0JCrqmRcD83ckc5hey
         MysA==
X-Gm-Message-State: AOJu0YxFCvqKCGNvlZZoysZyjZYVbO2tqKJJRyClpm1LHAvT1rYJlCFe
	m4aqdT5tXpziHy7evGSdMX3I2rEz4jEGD2PRCJ836efnCuaUsX+m
X-Google-Smtp-Source: AGHT+IGbC5F/QL2xZapUcYogbDNebCDs/L/gjri3hScnNm/4bpqmoUfd2F93xmirprhA8WNJe/FXiA==
X-Received: by 2002:a17:906:a45:b0:a28:fec2:ca17 with SMTP id x5-20020a1709060a4500b00a28fec2ca17mr3525460ejf.0.1706532764054;
        Mon, 29 Jan 2024 04:52:44 -0800 (PST)
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id cu12-20020a170906ba8c00b00a27a32e6502sm3847552ejd.117.2024.01.29.04.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 04:52:43 -0800 (PST)
Date: Mon, 29 Jan 2024 14:52:41 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Message-ID: <20240129125241.gu4srgufad6hpwor@skbuf>
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_045247_511905_B41290E4 
X-CRM114-Status: GOOD (  13.53  )
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

On Mon, Jan 22, 2024 at 08:35:57AM +0300, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Running mt7530_setup_port5() from mt7530_setup() used to handle all cases
> of configuring port 5, including phylink.
> 
> Setting priv->p5_interface under mt7530_setup_port5() makes sure that
> mt7530_setup_port5() from mt753x_phylink_mac_config() won't run.
> 
> The commit ("net: dsa: mt7530: improve code path for setting up port 5")
> makes so that mt7530_setup_port5() from mt7530_setup() runs only on
> non-phylink cases.
> 
> Get rid of unnecessarily setting priv->p5_interface under
> mt7530_setup_port5() as port 5 phylink configuration will be done by
> running mt7530_setup_port5() from mt753x_phylink_mac_config() now.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

I hope this moves the patch set out of the 'deferred' state.

---
pw-bot: under-review

