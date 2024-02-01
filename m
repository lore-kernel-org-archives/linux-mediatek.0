Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE868C48286
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 23:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adT4iPkCMRDOEL5rMrtGnul/qErFA+76SbIs85UohKw=; b=eEr5u21TtUpwp6mOACiRHtMtNy
	u5g8EuVV8Y1Tsmr5kfVu+xuqeDMYVuME3k3cpJtiYSn7WDNHAgZUloE76leAB08QWUPYX1Gui1t+W
	gKzpXSEj9RlcJg8+GX6SJj730dbK3O5Vi/x31MQBk9q1lkMkqtOLowfnW/Xslxhvkgi9IbD4xva/d
	BtFtBLrTuS0seIvxqZ5ZACzlfnCH/Whya3W5gsa0t+gSCZUqmHzwB/xvpJkg2xSokn+cVUCBnSjbx
	xSZXTp0aYTzMFtENsDj868f9XDbUm9PbDVSFBdoXkKdYXfWnKzCkuDWlwFcyQGE2RTetseu30woEG
	dwWKakAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgvh-00000009hOT-1dPI;
	Thu, 01 Feb 2024 23:57:13 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgve-00000009hNz-1O8V;
	Thu, 01 Feb 2024 23:57:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-55ef0465507so1860853a12.3;
        Thu, 01 Feb 2024 15:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706831827; x=1707436627; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adT4iPkCMRDOEL5rMrtGnul/qErFA+76SbIs85UohKw=;
        b=POzwGWYe37xty5jY3hjHyYp277LXD7G/n92q7d+wMvZKnu+jK7WzHaC00FQLK5r82s
         mMcnfVFtUB4jtdUPGnvDK6qBOjeNoFC81zrrSgYbL92vF5fNJfyCvJHq/DwOb0yqjjMU
         zG9/TqhgxBm6s2CUhd5bof6XUEr7U2jKKxQXeqjSpPxXN4eRZDk57N7Frr6H4lmPCvrJ
         gNv2A1dqF57cDo2soOjqCPjoIoscaLd5wvIQSZP5Cj7rALChZw34m02QUG7VZHi5o8/u
         n3IL8tXoHPhuozcyRi4gf2oOhr/748mpYuKUK8yV5wPgbXNGi9Etm8eCvCOyxwwWbSWd
         Wxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706831827; x=1707436627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adT4iPkCMRDOEL5rMrtGnul/qErFA+76SbIs85UohKw=;
        b=DObLwi4qSgmyanHbgZws5LrxK2t9Ot+uBH9PI7fXXarh7ei8pzjrF5XUhUuw3Mfsna
         PcRJTQQ0foeWl4Qj3Dw/JKSOlRV/Rk37Zuaa3RohlkHk8RZAwywk/u2PjAd3fHGOszQG
         RlT/T8qLj/nWJBT1AiDyyd9ktz0gAUTi/NXfwyaLeqZfd90QDddTIcXCN6xkG8eGnsoq
         lUG+XlQPCmc1CEqRRXGaIctCyRgjPT3/XZ7Au3YSRzUWNQGCeSgb5uBEmTsbIHPc/hhJ
         H091JWmUe5PMcPgiu3rFLPYipYDWrW562JEhau3zrceRTX1qOAjIIsPFhHYpUx//pZwY
         M7aQ==
X-Gm-Message-State: AOJu0YxatnO5WX5W5l9vy/I0PFfUpoTw2tGm8ANGugX0OlsHpAaia4bR
	+tysygOowuss6wJyzXjbaVcyqmsgyWluByxhY72N81hOpbHMbAMW
X-Google-Smtp-Source: AGHT+IG3GRpEb6P3gOztp8VYIYCGF8w4fWoFWV2IqNBIPIZrFxFvH07VopDrgtziHJhcQ1hUKaZ8YA==
X-Received: by 2002:a17:906:6d15:b0:a35:dd08:c7ab with SMTP id m21-20020a1709066d1500b00a35dd08c7abmr2828558ejr.26.1706831827348;
        Thu, 01 Feb 2024 15:57:07 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVUl2qS8vXJYPNH/8CEBWNcoQvNoq8VNnDC5tiT41ug2qx6eB9httdjpfEMwq1/GeIzcQFfDnW3mKXY65DN75xVqDEvnMTCerLFrxvvOyFvezJ1SON+S1aj+OhUPRy5gm4dnsAoxWxbguCFfELUikvKYxwh7Fcr1gnoXhwxt3Qpi+yimXcBy/NHWY6OkacFyjE3LVc+5BYunCYhLNDTgi6jmlRF5ptJ/o3bHHHs5GwoJHT2G1AkfPZfTZc8i81lYlkl8jgvVADxirW3Kj/YzYqlh8vSrib4k3VoeaowMo3ZwwctSD6YCLjjxsDPWoKkjRza8v67yIQkF3b5r4abMlmi/bdy4gxkwi2ztKapPBTNn+sdwGhPkBKbA0Hkd+euAyC/hJkb0py1E2qcBCT83Ui9yAHyx7F/1cvOtWfZ+Swdg1HgDRKxMPa2YrSWCBHSHoTH9ga/2USLPtDxdxmu/7PAuTQ/Yz6tnK+gr+5fn6GcT3i2WBj9PI9kFIr0EW0ouCqqmeGd/c5nAf3C5qV2nfj7hIWRe7RJYblxAEx4V7LNlXExsWhaJ++GSB3yTs2WXWHy5yiE4jPqNpfC1OFgvnvwdd9tIkutlR66JRpfuESHB5O2NSbFOsVVzZaBoHALpjeJeLKrtEJoP3mibkjDIbPtO/bvUY9F
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id vu12-20020a170907a64c00b00a31c5caa750sm277937ejc.177.2024.02.01.15.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:57:07 -0800 (PST)
Date: Fri, 2 Feb 2024 01:57:04 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
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
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: simplify
 mt7530_setup_port6() and change to void
Message-ID: <20240201235704.6wxbkpli3dk4pn4w@skbuf>
References: <20240130-for-netnext-mt7530-improvements-2-v2-0-ba06f5dd9eb0@arinc9.com>
 <20240130-for-netnext-mt7530-improvements-2-v2-5-ba06f5dd9eb0@arinc9.com>
 <Zbkc4BRORWYu79GZ@makrotopia.org>
 <77c38489-8a73-4b00-bd82-48174b4d620f@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77c38489-8a73-4b00-bd82-48174b4d620f@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_155710_414509_E864BB07 
X-CRM114-Status: GOOD (  13.90  )
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

On Tue, Jan 30, 2024 at 08:46:04PM +0300, Arınç ÜNAL wrote:
> would supposedly achieve 2 Gbps TX & 2 Gbps RX

Source? Commit 8efaa653a8a5 ("net: ethernet: mediatek: Add MT7621 TRGMII
mode support") says "TRGMII speed is 1200MBit.".

> Unless the MediaTek SoC ethernet driver somehow caps TRGMII to 1 Gbps,
> I consider this whole TRGMII shenanigans a scam

I laughed :)

You have to see whether the CPU isn't in fact at 100% already, becoming
a bottleneck before the interface speed does.

Also, mtk_eth_soc.c has an interesting comment "TRGMII is not permitted
on MT7621 if using DDR2" - not sure if applicable to your setup or not.

I just got myself an ASUS RT-AX1800U (uses the mt7621_asus_rt-ax53u.dts
device tree AFAICT) which I'll be setting up with OpenWrt in the weeks
to come, and on which I might also be able to run some tests from time
to time.

