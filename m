Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CF6C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 15:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qMRwSRlEHiLKs33Ebgq7PoiHGMn9IoIdyi9V8p4+k0=; b=l53sN0g2qNnkP2
	uHv1KZP2FZ+7CaMZlpj5uLlWsy38sZlyS7c1S3+xOzdZp22VF+NmwBSSFG7qjfBnuK+61gfoCmnK8
	lUzicqM5LiJnRuiO6rZLKbYEWrBepXnJh3miiG/CPsSBCG7l5yiJqp5XdFqabZSzP2gIpEyOh2c0I
	/VU5dM7bOcQNuMNDBHcK5pY69FAvnhZG10Cj7F9Z3YAJksbgit+K/2FJQEPG+IpPUsUTyW9tNS+Wj
	LiDo/Y2AX+nhd5fahcPKbsELQKUGPvVfqMNfGeK9avt7yaOtKdrVCyNS1GHZ7jpm01Aby1HblKdWb
	p6ZBmYNjj7ObTUi9bHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njNY7-00FDuG-D8; Tue, 26 Apr 2022 15:56:23 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njNY3-00FDsM-Uq; Tue, 26 Apr 2022 15:56:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so2571707pjq.0; 
 Tue, 26 Apr 2022 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gKqBWnCkDhPa/9nmFO0gA+P1ct06PRzyrAfrgkwdtZQ=;
 b=cdtB0ZKQh5fHXEtqwKZRdRpRpNlc2FA7fzabvWnVsZEh471IpBAHTzhJ0Hmz6aKWju
 iGjJYFQtjxcn2O+CnbAXLs21Io7RfvyAqUieYCysQE9eqKrhLrmTs6IgnPQ05LEoKoSa
 mGb/AaJ1wjDcALrwlcoyeqSGW0PSQBfyDAaV1hi6bDju+mYxVqgE6lxoKN62zd+fJ9O4
 iPU8jjQWHVocjekVmqX3dSl1+stabdTaARusTK8LuCUIxqsZKdGbEIM3iIEtAtkwquPR
 jtRMz31oDlntY4KAFFP2KyW7KzMcwE3W55d28blpe24GvF4APEchTykTMObnsJMELQls
 A2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gKqBWnCkDhPa/9nmFO0gA+P1ct06PRzyrAfrgkwdtZQ=;
 b=gyBhcNFQlJdyhCgDNQrGwqFrbkPXekYsnbrJie3DQ4BUjlcFNVqZYoNaFJteHadbIj
 le0ry6p4jS/UB4t9RuEElpRWhZ63iG0rwaiVP7NOuplqvUE9QrSV4JCYFlyONMvO9NIz
 g2aZjv6maN53uJH/TRqfEaRu1bus77A7ITaBvJ1AyMwehy8oXpOyVX+s6DzV4VPexwm/
 cmCXKEts96OwiUsz6jW6eXwra+VUYM2DOfjvauGZMbJYEmQW0Fv9BEG8DzdRGCsDE4jc
 fg9IqSniZ44/ufsVa+dN65UVrzhrE88z6yvNcZIfYfFfYqvlimopiOTHGGGJZof22ERg
 6nvw==
X-Gm-Message-State: AOAM533sof52ht4ypkn00XHHt3pfDDVZQM3V5r0ggieRFmbFFM9hkyw0
 2P8T1VkNSfsOQSoLlxvyxv35qlUm+m4=
X-Google-Smtp-Source: ABdhPJyqc/8SuGr06eAq/HSXJtEMhzP9i+HVQg66AphhwWBy205v6vp9EPzuIdT3+m0E5GQumrVzcQ==
X-Received: by 2002:a17:90b:1251:b0:1d7:f7ae:9f1 with SMTP id
 gx17-20020a17090b125100b001d7f7ae09f1mr26323671pjb.65.1650988578270; 
 Tue, 26 Apr 2022 08:56:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 v18-20020a62c312000000b0050d56ae29d4sm3246368pfg.29.2022.04.26.08.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:56:17 -0700 (PDT)
Message-ID: <944ffc2f-9f5a-a008-95b8-6812d5895b6d@gmail.com>
Date: Tue, 26 Apr 2022 08:56:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Aw: Re: [RFC v1 2/3] net: dsa: mt753x: make CPU-Port dynamic
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20220426134924.30372-1-linux@fw-web.de>
 <20220426134924.30372-3-linux@fw-web.de>
 <046a334b-d972-6ab9-5127-f845cef72751@gmail.com>
 <trinity-5fd6da8c-15f6-488d-a332-0ce7625f41e0-1650988498781@3c-app-gmx-bs69>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <trinity-5fd6da8c-15f6-488d-a332-0ce7625f41e0-1650988498781@3c-app-gmx-bs69>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_085620_098172_26C27BA1 
X-CRM114-Status: GOOD (  12.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/26/22 08:54, Frank Wunderlich wrote:
> Hi
> 
> thanks for fast review.
> 
>> Gesendet: Dienstag, 26. April 2022 um 17:45 Uhr
>> Von: "Florian Fainelli" <f.fainelli@gmail.com>
>> On 4/26/22 06:49, Frank Wunderlich wrote:
>>> From: Frank Wunderlich <frank-w@public-files.de>
> 
>>> @@ -1190,8 +1191,8 @@ mt7530_port_bridge_join(struct dsa_switch *ds, int port,
>>>    			struct netlink_ext_ack *extack)
>>>    {
>>>    	struct dsa_port *dp = dsa_to_port(ds, port), *other_dp;
>>> -	u32 port_bitmap = BIT(MT7530_CPU_PORT);
>>>    	struct mt7530_priv *priv = ds->priv;
>>> +	u32 port_bitmap = BIT(priv->cpu_port);
>>
>> No need to re-order these two lines.
> 
> imho it is needed as i now access priv-struct now ;) which is not available at the "old" position

My bad, yes, I was concerned with preserving the reserve christmas tree 
style, never mind.
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
