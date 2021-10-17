Return-Path: <SRS0=tRv5=PF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4B1C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Oct 2021 02:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1698861050
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Oct 2021 02:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1698861050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DnlcZwuNVFz9xxIQ7lWCFz7fPj3zHxT5uFj9JDAVY7M=; b=heP5DVQZBYRPXw
	Dt1DTh2rGowgX5mlzuzCtDB3YxVlCdCnuMcsLpEQC5c+7k8a2GCAhLkt6SZ3J6bBRzJou2mX/XQ5n
	k8hb4afOGP4N+3c1y3IczMFvOoLURwPC8BhYkHOYz2n7DL9DpXHoLJvoTa/46eJQdxHzs/bdaW+6B
	Ryf5DXOVL+mfTpz41O1eYraN8X62zTmvPHlRszOP5Z/rfyW2wr7GZ/il2EMHK42tMYiMFay+ykjmy
	Yt7k0XtkF1yAMPXH3vFgdVYSMii9MRHNZKV1RTDtc22WvB/2EBSKshKPyZPCQaJRIVoWxKU3bmdJg
	M6M8/kR+y6YeHfUsOm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbw2M-00BdrN-Cx; Sun, 17 Oct 2021 02:36:34 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbw27-00Bdpy-KM; Sun, 17 Oct 2021 02:36:20 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 b4-20020a9d7544000000b00552ab826e3aso926682otl.4; 
 Sat, 16 Oct 2021 19:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vt2nE+05nEFgW4xYDB3lt8X/MwGWDGhqcK2RI3W6Hoc=;
 b=Ol6bg9uYISr4XILXrDsRKmR+Lewl42+rHGZV0WwSZTcEsVTEaWzh7cNkyNGU5Jfwr4
 r75D/qEGGTuzktMZ6U0/A1C88B3mo5d9XELVy4bld6/xpmNMYtfWMhNQJ6t3WNMJFE0G
 /7wxXlQSAtl9zHxkDoffQ6mBnDAKXxLQNyA2ETbc4avsF9SHCNrHaacvFy681EmzT/+A
 kazwEknRtIT3mZHaob2HW9yyxrOZq5Ouo5cc/MJWAQpmMwtXqmvrBqqoRAzaUb1xFiAh
 stfibIpGZa7Mghgmwn81eLiRxfil+DP1L0/2Qi9rmn/26L7M3SB1ppNP5g0DRQFVmZrt
 rLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vt2nE+05nEFgW4xYDB3lt8X/MwGWDGhqcK2RI3W6Hoc=;
 b=k2I5KgHYgVj0o8MjwvLlqwFKe+AA5q/sx7144dOezUn3U7wZ1Lu3mwkTrRZoi/YVFI
 Bsf3eFtry3Md7QsyqjU9iDZXlPZQY1l77sEYo0lUaDGhoJPo+36Qm3ucr+liBZln+QrF
 NrV6SbnGYngEg2MAyWmwTfvZO1ZzRQQa1eY3rBTguMet8lbaJhp5xwrBJHDoBxND+QXO
 q5nqikV2O5hJJ64YOl2lFVEGfUETp6tCtObarDqjN5RUDHTRvlEKy//0famdm/sHufVZ
 yultjk0E1Fkc3nZdYkdUSmhRWwBAAd0svF4mcaic+TbjzskVV/P9YFeoRB/iG6AR2pEg
 PB2A==
X-Gm-Message-State: AOAM530JS69r7+LevhxzIlxoWKw4mOfMuc4y/3D1ruexLyY4m3BBoI0k
 1qzxRRYD2JB56H4kooU5uNE=
X-Google-Smtp-Source: ABdhPJwyjQIR9Vz4lTFACirNg9EtFSS20B1jGSPa5ISdqOi/w2j2zcwvJtoXpYFpOL5YVwUg1TQeMA==
X-Received: by 2002:a9d:6483:: with SMTP id g3mr15702924otl.105.1634438177976; 
 Sat, 16 Oct 2021 19:36:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:71b0:fa9a:856:a7fd?
 ([2600:1700:dfe0:49f0:71b0:fa9a:856:a7fd])
 by smtp.gmail.com with ESMTPSA id l10sm2166160otj.9.2021.10.16.19.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Oct 2021 19:36:17 -0700 (PDT)
Message-ID: <cd6a03b9-af49-97b4-6869-d51b461bf50a@gmail.com>
Date: Sat, 16 Oct 2021 19:36:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH net] net: dsa: mt7530: correct ds->num_ports
Content-Language: en-US
To: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20211016062414.783863-1-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211016062414.783863-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_193619_722709_B636EF60 
X-CRM114-Status: UNSURE (   7.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/15/2021 11:24 PM, DENG Qingfang wrote:
> Setting ds->num_ports to DSA_MAX_PORTS made DSA core allocate unnecessary
> dsa_port's and call mt7530_port_disable for non-existent ports.
> 
> Set it to MT7530_NUM_PORTS to fix that, and dsa_is_user_port check in
> port_enable/disable is no longer required.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Do you really want to target the net tree for this change?
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
