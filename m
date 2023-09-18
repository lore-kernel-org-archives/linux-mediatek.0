Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D9DCD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 20:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bK3tn5dFdIkaJdHv4A/3xeAMl/PHN2x+YLc9iStXbls=; b=ENWAH7jDE8A0gTi2oa0MR+91kw
	5yeSEhS3MfrAkjqgTPA8ZB+lWNiDy0kbk3ns6oqbzOlp8+brdpNX2s5+1ILEmE1c4EpSZVYCe1cZJ
	GF7atRhNFlUlEaZsNGJ9eNezmMdex9TI2g35VMbgz8U3K2HI1lQETjHeA5LWNHlM4V1O47d1RsCTS
	oiyE2VsmK8AeOigwGWcqjdnb7JHtF9eCdgayKutIrw4jtPYkYTFQD6lFPu2U7Ml+q2IhplseRWZU6
	U33gDhDB3zH8NWiyoLVrITEwmMZjPnJ2L4+ndutik/i8DhOYSOzbbIqqW9sLsuuRU/GpWFeE/IEYV
	/BA5cPdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLE8-00GKDG-15;
	Mon, 18 Sep 2023 20:52:16 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLE5-00GKBP-1d;
	Mon, 18 Sep 2023 20:52:14 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-57767b2058cso2835986a12.1;
        Mon, 18 Sep 2023 13:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695070331; x=1695675131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bK3tn5dFdIkaJdHv4A/3xeAMl/PHN2x+YLc9iStXbls=;
        b=VFesS+9uGXf0aapjzX/V9RIR3L3gtsCwAGJ4Eap8F2XBdrBXtPBzyXGS5loIQCMVsw
         ZAkyNxzPPW4SiZCwFsI7rPVPVx1sTeahcd9d0NynhAIvmFyYweT2OsnPFYh836jxXgdA
         Jq48/rS6/4+x1JWhQK2I3Xo5l+xPKPVIPFvWaA2hv4h7xMHtPvC+sVksBqAuCNXKUDkG
         CNlGSPs5V06hUhTkPVUnQsWBzmF6DwWezpMpFHCbCEJZZQ4Uy9KpW52t73yN+btl0iXh
         68OHpkwmryJa1sVztvFdBbGNLiXC2gZFMTG9BeezvE9fjp+cObV67Kn/tNP2lygzcT1j
         nQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695070331; x=1695675131;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bK3tn5dFdIkaJdHv4A/3xeAMl/PHN2x+YLc9iStXbls=;
        b=RvVL4THtPFtXRw1AgTsrTBfFppxknLXud3fxWyKs6stSR5wuuaxCqo54/pCEF/I4P+
         jfOOIIaBZy4ug4ThhtNVMVJkeIZzZ7TTp1rFUcDuFCJwJWJJLxT0/g4xPeUptogy/Io0
         XWhi0zFrSlFUYJxx97mS1r+BRzXZoNs0WHOJJJaULQLOfxTyXs1gouIzkirExzaPR7Ed
         vp7iIHE+ft98iORhQZt3vutg3vaRB8JaA4QgV5NmMheTIBvT2wrf0oxIOE1C3e8ssJ/O
         BMpUZKk/P6GY7wcSck6kyWHQW9CPxA4L/B73jZaeA6ly5dQyqi8BjMdqnRwt4wfX+KGr
         0TQw==
X-Gm-Message-State: AOJu0YykOO+vGRPJXThs+YY3KcR5Ou9mw7O0Rq5u32I/bk/BUhWM6OYS
	KRDyLrG3sfbiNqnJ16N+LNk=
X-Google-Smtp-Source: AGHT+IEo2yCf5AWI7d+G8dWQj5LP+lBu3onyLV5mFtDWvWdgvWG9iXl6vIXk0M1pcf6BZHzv8t7FyA==
X-Received: by 2002:a17:90a:648f:b0:274:b4ce:7049 with SMTP id h15-20020a17090a648f00b00274b4ce7049mr6036409pjj.34.1695070330675;
        Mon, 18 Sep 2023 13:52:10 -0700 (PDT)
Received: from [10.67.49.139] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 8-20020a17090a1a4800b0026b45fb4443sm1775789pjl.4.2023.09.18.13.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 13:52:10 -0700 (PDT)
Message-ID: <351666ed-2095-cc67-07cc-3f0994368b7e@gmail.com>
Date: Mon, 18 Sep 2023 13:52:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH net-next 5/9] net: dsa: mt7530: Convert to platform remove
 callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230918191916.1299418-1-u.kleine-koenig@pengutronix.de>
 <20230918191916.1299418-6-u.kleine-koenig@pengutronix.de>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230918191916.1299418-6-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_135213_548275_8A968B52 
X-CRM114-Status: GOOD (  14.02  )
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

On 9/18/23 12:19, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


