Return-Path: <SRS0=uBnB=KS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F052C47080
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 May 2021 15:55:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C405F610FA
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 May 2021 15:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C405F610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUEfvfQnDaFgMo9Y9mAFHDw6kBlfsS0/+OSoV0slcbM=; b=Fu0iWrXAvu3qD3oqYD6lsf+j3P
	32QDBRHfxinScHMWupGP4MiVJ1EBe3e6fxlmyj3qicMprroZczULfPzvvzJiKgH6ttDzUKshd2VF3
	zR8MHklTHEiTg568PEsUltl6hzIphkDsKkDItmu0Ba7VynLfgSl+zwVOg5GMdKy/IlwTRhUX4cUjG
	rz+MniIYKXbcSYTal23VJ0NBHJoBCONiTR4cVvKQF1jpU5RBaj5xmbtr2hKOnZsO7eb7P+Mw2FR0V
	FQqroFrsgzpjMvUNMS9tQnfkOyrl1x6wzl89MaGVGptvx0WM1XQwKfSOHPSogH1c+afbWWavTpqxX
	uTpNO09g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkqRh-004Zc5-Lf; Sun, 23 May 2021 15:55:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkqRe-004ZbH-CJ; Sun, 23 May 2021 15:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=t+5MkSu3mBujA43uLcDMuoMOmhHFHE8pqCUwk/bfBbw=; b=dspJIrdOo+J+eKIVKxxpOVE600
 n5kKzfvZR9QzUThbDuMyyvKNz8NMXpi6n+Dt4YvZVohbMdtV5RegrD8hSYuP73JuzsPqRPXuq8Jx1
 uzdwKSyG9nie3314xCjTUlnhpQdVfx6sfk0gpdh6j0qmDgbx1LVA39HQSCZ4MlJ5HMfw8PcQ6xx+k
 M+DAA8L1NBOttsQASUAImGh/akbVldlJECv57Uhs4wpQsueSBwPpz7QNGoqTBswSOrOOq62tBEpwG
 ykOyQ25LnyioeCVEU3Rlxf+s1dqlrjJVNgBp+FPTssG5HsCcJSqPJ/AmpGR6jFyPVglwrZt9mgL+3
 fb318PEQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkqRb-000U9R-UA; Sun, 23 May 2021 15:55:13 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so9742536pjb.2; 
 Sun, 23 May 2021 08:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=t+5MkSu3mBujA43uLcDMuoMOmhHFHE8pqCUwk/bfBbw=;
 b=pkjEnWmAi03pTeN80ISyMF+PIXn5yZCMmRgnQlFlGSgYrGv9ap+xVRgNgqlKeIGUiA
 yhIlS7CqZ2RX0Tjxs9tKM2SWJ/VgMobRDo8mlrHl3XdBraGztQ3wWohsTMCy8o8csugB
 mcRisMGsUadeMhs6+s2o16YK/XOA9/dF11Q7goP4MlBVgXVFhXGZ/oMIJrrTkPI0k3AZ
 Us5SfCs5QaBODuzVKdW4//edxj7MSW0gLUBXTUQo4sIDfEBMilhJ88aGHoN6ZXVk88rI
 XpUMkPQTaITuKv5OjjBCGWgjRlydlIBv6LEKugL13HYpuV5ffC7tOBHTrwx3Vf3CSmg7
 +03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t+5MkSu3mBujA43uLcDMuoMOmhHFHE8pqCUwk/bfBbw=;
 b=QdQZ9/rCEN0KXxznFzGU7K92SqHgv5LtdOfTCepo1TV/OqppD9GWR9Puualv3bOS+O
 Kcq+BtKdoNuYsta8k5u0jce9m4StvocytV9/sEMnGTxYm5bw1mTQGAu4wuI79nTbgl8Q
 4iA5xDefknyXcYp3mwjuG8/1ApXE5U94m3tKrtuG5qlyo8FSJq/loD7camGO/ToYAVop
 8BvLstxaVLdrKILtl2D3iJwLb37shRxvwcPueG2M/OkIRTlqQ3hszltl/4YoBkBdhfKI
 I8ONL3ojmTCWQZqQ1utd6SGP1C4gADI8t50qMW3dJfy66LNko0+Q1zLZ26ze3Hlw3Pg1
 XJdQ==
X-Gm-Message-State: AOAM531KohLZTFKP2zwN7YZ2ym7KisK9d1kNCB6yle+D0I5dZLQ2kzK3
 JiHPbAENdcHgktchs2YnjqQ=
X-Google-Smtp-Source: ABdhPJxofMG7N5YCl9euGVoi329vElZrUp4omztwpNnFw2mVD8csoQUj2tvn9D3c/f6KJtdi3tx96w==
X-Received: by 2002:a17:902:c9c3:b029:f6:3f15:e8d8 with SMTP id
 q3-20020a170902c9c3b02900f63f15e8d8mr17668705pld.71.1621785310347; 
 Sun, 23 May 2021 08:55:10 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id o7sm9949609pgs.45.2021.05.23.08.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 May 2021 08:55:09 -0700 (PDT)
Subject: Re: [PATCH net v2] net: dsa: mt7530: fix VLAN traffic leaks
To: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>
References: <20210523144809.655056-1-dqfext@gmail.com>
 <20210523145154.655325-1-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <385fe766-0886-e96d-3e2b-fc2c346685a6@gmail.com>
Date: Sun, 23 May 2021 08:55:07 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210523145154.655325-1-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_085512_008327_3BD87F8F 
X-CRM114-Status: GOOD (  11.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 5/23/2021 7:51 AM, DENG Qingfang wrote:
> PCR_MATRIX field was set to all 1's when VLAN filtering is enabled, but
> was not reset when it is disabled, which may cause traffic leaks:
> 
> 	ip link add br0 type bridge vlan_filtering 1
> 	ip link add br1 type bridge vlan_filtering 1
> 	ip link set swp0 master br0
> 	ip link set swp1 master br1
> 	ip link set br0 type bridge vlan_filtering 0
> 	ip link set br1 type bridge vlan_filtering 0
> 	# traffic in br0 and br1 will start leaking to each other
> 
> As port_bridge_{add,del} have set up PCR_MATRIX properly, remove the
> PCR_MATRIX write from mt7530_port_set_vlan_aware.
> 
> Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
