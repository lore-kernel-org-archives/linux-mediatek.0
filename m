Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E3AC636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+6NiBwrzMzY0iFEj5SAkgnlwVcJ6rcWHigS8pEBF38=; b=cgQrKe4NmHoHBP9hMCXWTlgvfn
	ivHaaftcm3g9SdnWopDSeGw6vnUzG12JQ5Y29gz2nCH/Hq5dXaVAdvMZBNhODzx0TTlZHjhCELgiR
	Tekz85j2cTAsQKETkh4Gr5VpPL+V3Nng6EH85IIc000zM05F+j1yfJze0dLDW/2U+C1kJZQW06tFr
	/K5hb94vAlQTORP4j4lqVwZPnvD/xbos7V2G3JagUIRqpQ3B6x1oP68IxRiZwjy8LC2xIywCO2bcI
	9rg5klvTgCMi0Aj2Gl/8MsQO2UpkALrMyuiT5mhgkdvNYPvnNfl89OmwECviAvOqbb7msaXH4Mh+M
	ulrK77Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaTQ-00F8Yg-RZ; Mon, 13 Feb 2023 15:10:32 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRaTE-00F8Tm-CT; Mon, 13 Feb 2023 15:10:21 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eq11so13330290edb.6;
        Mon, 13 Feb 2023 07:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g+6NiBwrzMzY0iFEj5SAkgnlwVcJ6rcWHigS8pEBF38=;
        b=ZfieTwOr+sqn+dobtezHop/Fmo/rAXS7NAUx17hb6ZFQ5lExV/uPWzDbSekJbgGzh1
         yzM0lucIFOolljnvXTuxvddj2Kx73gj+Zg7wwniJwgUAsumoATRyJkS2l4z/DXexakZK
         VaRndjH8zowNttv0SiX+3eEsf0dzhhqHfVv6ThsyWaPUd4b2NkLcVKo+BJw+zb8RHcQw
         TaAqG0phoMsaEeUkztCN5Dw5QsIRQjyG3PvGAt7fqFLWRmxh3ZW8IGf+WTs4zejlZtYv
         g1N7fID74/I9rvNKTMVugbhaUdLt1LVMwy5ZrnYrlPyxcXvwoGse0ePgm9iJlh2C3sM0
         2Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+6NiBwrzMzY0iFEj5SAkgnlwVcJ6rcWHigS8pEBF38=;
        b=A6FPrvbi6BhPgK+6fxrNaIaHgWwvFICnXVwfoMUT4IGgyx7QwTq91P5S5Xc+1BW8sA
         BV4LQ698Zuj2NPXOb5HzGUwI02DTwk7tkyrTkSlep+gjGz5PiasKQeTy/RTLmffFN+NJ
         QZZc+9+NJCRk8LbILSKjiOEJdHx8yNdO0jYaGFiWBnXRoT39SURoOSxQrjoxf07Wfilc
         Ab+iYzJlPPnDZlVe5mt0np2YNMa0VB5LRTmH3LYKy7wBbFcl2R0TWvTMIEOkZ3YeJpqZ
         zBLtpDYxZEqRqcZmEpP7121Fz3F+qtUBQwMoKyJuzspRpHKVGPVEpqVBy/JyvYOJn0oS
         S9SQ==
X-Gm-Message-State: AO0yUKX3eNlrBv3KzPvfq5awclWjf8gfzBtG47SQwOWKyn4lWqNtg/mP
	UQwahQy/1DhmAfLAlcB2xKI=
X-Google-Smtp-Source: AK7set8dTFfz1dPwGhl7i63pU30D2uHBEKusrO2akXLuxI/IZLMqDbz8FAEr1pKDGkrrvDaYZgrjWg==
X-Received: by 2002:a50:d601:0:b0:4ac:bce7:370e with SMTP id x1-20020a50d601000000b004acbce7370emr7674377edi.14.1676301018078;
        Mon, 13 Feb 2023 07:10:18 -0800 (PST)
Received: from skbuf ([188.26.185.183])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906199600b0087bd629e9e4sm6924576ejd.179.2023.02.13.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 07:10:17 -0800 (PST)
Date: Mon, 13 Feb 2023 17:10:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Richard van Schagen <richard@routerhints.com>
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: add support for changing
 DSA master
Message-ID: <20230213151015.pstwqpcpjk7vr4xq@skbuf>
References: <20230211184101.651462-1-richard@routerhints.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211184101.651462-1-richard@routerhints.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_071020_473880_2087ABF7 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, Arinc Unal <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Feb 11, 2023 at 07:41:01PM +0100, Richard van Schagen wrote:
> Add support for changing the master of a port on the MT7530 DSA subdriver.
> 
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Richard van Schagen <richard@routerhints.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Currently with this driver, the only way for a frame to reach the CPU is
via flooding. The DSA framework can do better: it can configure the driver
to only accept certain whitelisted MAC addresses, which reduces unwanted
traffic to the CPU. But it needs driver level support for some prerequisites,
namely FDB isolation, se see dsa_switch_supports_uc_filtering() and
dsa_switch_supports_mc_filtering().

If somebody decides to add support for RX filtering later to the mt7530 driver,
he might not have access to a setup with multiple CPU ports. So this
might become a blocking issue for him.

Would it make more sense to unlock RX filtering for the mt7530 driver
now, and to make the FDB entries added on the CPU ports work when
multiple CPU ports exist, too? Now seems like the most logical moment to
do that, not later.

