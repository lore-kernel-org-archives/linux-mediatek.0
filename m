Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F147C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 17:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UANncWrkqP0wGFe9cfk0F5rdhQoiGsROa82g/rlru+8=; b=C7R4AkGJOE/wMWIL5AblipUidn
	STIAUi6hobO6eTaNnGr/PQnhn1G4z10PBjgde7cFWjE1ReP1J8JFUC0IK98ltrb62CHJNEJwaW+Dw
	ETqID4MM+mrgTlnWeiL4TKZa3dp48V/UHB/sIHAklfzenSHCNBr3VndyL3CAgsVV14ZDCUpFm+dCe
	vq5S//wuW58t+hxapBtr9+gH5lfyjH+GRhP8/Hf5nVI7GWSVNc9B4oCNrtaSDk+AX1PZUtgWWzZ7i
	1iFj5IIMRM3zM1MNFHL5sKHMkZebacUrcnq/pVw1LsvjWKOVthI6p3JDn4+ruGp6pPOljWqXWsdGQ
	KDTyzNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEmb-00EDUa-6l; Mon, 06 Mar 2023 17:37:57 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZEgM-00EA4Y-8j; Mon, 06 Mar 2023 17:31:32 +0000
Received: by mail-qt1-x82a.google.com with SMTP id y10so11437111qtj.2;
        Mon, 06 Mar 2023 09:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678123889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UANncWrkqP0wGFe9cfk0F5rdhQoiGsROa82g/rlru+8=;
        b=F3KF8af5PGId9V+MeGxLK9IkmQO1mIopPtxpp0Cj9HK7tZtVtCgYLD9APuqgHoNAkd
         LCkPgPvE/rfQ2kNWJIPqVOZHjIPXofx2p+o/BIBi4dblyVurxuxhXpg4btCDPT0lZHl+
         mxKl5QV1Imslhuh4tYbfpGjMpTl4RQVNSCcgLSJj4rnaoGnodEsMWCOSCGstQX/LQXXX
         xgmaQ2JMM+L2Lkp+C5b1tJl5Ogde2n/vHerzVNSBbP5AZhaBVCDhZsnxlvehGfCRGnUH
         Mwr/6qjzH0in8bkTp/k57hPHsp+50UOsXA2Z82EYpe4eQActGWSPbUAB19TU+oxxiZKY
         3xIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678123889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UANncWrkqP0wGFe9cfk0F5rdhQoiGsROa82g/rlru+8=;
        b=lK+lvwCYD9lpDK/2gdeCQj2Lmw8ivT/c/3GNrqsI4Bo3Qqh86kAkepkcksdtsAmVOf
         vaDZpgz2ig+KpGytnq4QUthFO370hXsaBx7BqgZUyL73nMwjW7l3hOc48bH9wOOhLILJ
         ASDCe/etMoyVagMqC0Na1oeOOTzmhsGgwgmISlxD5kqD5uc+XFRg2IkQwNvF4szDeBZb
         GVHsiCShicCXYf93kUzcdT6VNKn839DEf8CKTC3cLHSer3hLv55vLuXvktKBPP/qa5Wq
         TZZwN+PtDdSjTlBmFIaFrsRivn1u5GeG/H2O2X6+IfsI6Vt6cGchJ5lBoY78i/lihqlZ
         gtnw==
X-Gm-Message-State: AO0yUKXzPoMmCRQMsImME98appNmG4+twU4SOqOuIsWopx2Ey4eYJsLM
	1U5G1xE9QcSVkdFVroYS0jo=
X-Google-Smtp-Source: AK7set+VZBNwYL+15nzYCtkcQxPb2Q4aV6IuGCCvMgWgtV7HdOQJDIB4fptSsUiZ6Iq1D8M3TJi6VQ==
X-Received: by 2002:ac8:4904:0:b0:3bd:15d4:ff65 with SMTP id e4-20020ac84904000000b003bd15d4ff65mr13033343qtq.40.1678123889116;
        Mon, 06 Mar 2023 09:31:29 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id a18-20020ac84352000000b003bfaff2a6b9sm7971848qtn.10.2023.03.06.09.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 09:31:28 -0800 (PST)
Message-ID: <2f8622b7-b5a3-241c-5f69-9d1a48e36e56@gmail.com>
Date: Mon, 6 Mar 2023 09:31:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix RX data corruption
 issue
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
References: <138da2735f92c8b6f8578ec2e5a794ee515b665f.1677937317.git.daniel@makrotopia.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <138da2735f92c8b6f8578ec2e5a794ee515b665f.1677937317.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_093130_422883_CD32C35A 
X-CRM114-Status: GOOD (  13.23  )
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

On 3/4/23 05:43, Daniel Golle wrote:
> Fix data corruption issue with SerDes connected PHYs operating at 1.25
> Gbps speed where we could previously observe about 30% packet loss while
> the bad packet counter was increasing.
> 
> As almost all boards with MediaTek MT7622 or MT7986 use either the MT7531
> switch IC operating at 3.125Gbps SerDes rate or single-port PHYs using
> rate-adaptation to 2500Base-X mode, this issue only got exposed now when
> we started trying to use SFP modules operating with 1.25 Gbps with the
> BananaPi R3 board.
> 
> The fix is to set bit 12 which disables the RX FIFO clear function when
> setting up MAC MCR, MediaTek SDK did the same change stating:
> "If without this patch, kernel might receive invalid packets that are
> corrupted by GMAC."[1]
> 
> [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/d8a2975939a12686c4a95c40db21efdc3f821f63
> 
> Fixes: 42c03844e93d ("net-next: mediatek: add support for MediaTek MT7622 SoC")
> Tested-by: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


