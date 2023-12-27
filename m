Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF33CC46CD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 19:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpjVZsNPX+sIY/4iKnMdXb+nJyZj3/QdyFQ3Fr0Lb3o=; b=pUcsg3EpSSDIo9nyZrOd0Xdag3
	3KlgulM+9OUUAYC4Z2JGds9mZLxtuLOU4CaDhiHiJLHtRT5ut/JXIUrYyJf+ABjIJPIKSKQIwtvxC
	W64cQZw6rAcGeWzhSSnFBE8Ffd2jYr6kIm1X6lO+YdlnPXe/FlpsCntjypISBiU9fmIG4oTX3X+h+
	Lu6gUhzQBOdoEG8deGhkdy+cmMPQnAOPl4PQqhRWFfElWW1SEGmuCv1/9ZfHdNBcwQLO2qBsr8M18
	1DW9Oryi+JBrpswatRA2u+0zwTCThv0v6VNbRNgsMdwewcvSasdu16dJQjkVWDoE/XnaTfmfSwdhh
	Oi23VXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIZK6-00FMWJ-18;
	Wed, 27 Dec 2023 19:12:10 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIZK3-00FMV2-0L;
	Wed, 27 Dec 2023 19:12:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-336897b6bd6so5354888f8f.2;
        Wed, 27 Dec 2023 11:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703704317; x=1704309117; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpjVZsNPX+sIY/4iKnMdXb+nJyZj3/QdyFQ3Fr0Lb3o=;
        b=e4o6qQzJl2WAsCDWThfQ1L6oabxNklcza7FqAmg5wtrtiZZKtzK0Vgif+A4XvUCe+C
         ADEDoL0nys5pzRyVAaLlKdLVHCgWAz2WV3HD0Q5vv/t63qpfIe4SqubEWV3XsGz1SzQI
         jdcuzgIAZ1Xfvn7/TJloN/89thocGHgZaQ/cuH03j6SIzYgow++KeYxjiOixQ2gsq3FA
         c/kkcnNoUTd6ekQKrfKK4FgEvPc5LHUZg2Cy3nDTNxE97kAVT9V6w2v19DSoI6+Qzrdd
         1RZSc3Wzw2RUxi13k2kuBhBpoGSZDbkGxBRtqN0xUq03vTwNoSj4Kdsk/krNUejHcWQp
         wC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703704317; x=1704309117;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xpjVZsNPX+sIY/4iKnMdXb+nJyZj3/QdyFQ3Fr0Lb3o=;
        b=oL7ND8yvUULbmk5haaSODArxAyNfwZYdofwMNL9bFmHW1NTZfXbnI4j91zlaAvz3Rx
         joPHGPKJAqiXEAGNNQqHHDuuLbbCC+WDTC4NNHeB6IoZ4Ypgc3E2UsEHPpEh9yw3yPLv
         8cVejTzFO376+juX4mQ5jApyoOYVV03UL8qGGBgR+DwYz4rSnj2pe38CO01NK7SbguqN
         KCllKj1TV+trRynsmpLyk6vM5tfFOuhCUWmyfnSQeY/FQ74/38wtZrgjccKDLL+r2XFB
         OAd+LesxC1CTKRs8zpXQx9Q6KzqM9bORtPPBt2eL//fyVurYPjRehUseOEq7C0pBNZRH
         PCOg==
X-Gm-Message-State: AOJu0Yyg0w3oeMgyQEP6ElUjlQrHX5smpNxhpdqUYv1GHqrU8QDMbgTS
	vLytX4bDqYwWv13IAS3/DGs=
X-Google-Smtp-Source: AGHT+IHvTbKNlF2hf7/6KQNTwjMRnya8Ovzc9i033ephLhJKTcFyZTtSNY6K4A36to6c3+dS8P8amQ==
X-Received: by 2002:a5d:4a4e:0:b0:333:44e2:16b7 with SMTP id v14-20020a5d4a4e000000b0033344e216b7mr1701205wrs.49.1703704317311;
        Wed, 27 Dec 2023 11:11:57 -0800 (PST)
Received: from skbuf ([188.25.254.72])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d4dc7000000b00336ebf93416sm3452910wru.17.2023.12.27.11.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 11:11:57 -0800 (PST)
Date: Wed, 27 Dec 2023 21:11:54 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
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
	David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: register OF node for internal
 MDIO bus
Message-ID: <20231227191154.6jkqdlqdxciidpfw@skbuf>
References: <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231221151607.ujobhh4aet4obxdz@skbuf>
 <6600c6b1-2230-4963-940c-8b95a01750fd@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6600c6b1-2230-4963-940c-8b95a01750fd@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_111207_140650_9FE8BF3A 
X-CRM114-Status: UNSURE (   8.41  )
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

On Sun, Dec 24, 2023 at 10:37:12AM +0300, Arınç ÜNAL wrote:
> If the MDIO bus of the switch is defined on the devicetree, the
> (!ds->user_mii_bus && ds->ops->phy_read) check in dsa_switch_setup will be
> true so the MDIO bus will be attempted to be registered again, resulting in
> a kernel panic.

Where does mt7530 provide ds->ops->phy_read() in upstream?

