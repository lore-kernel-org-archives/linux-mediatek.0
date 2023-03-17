Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE215C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLvbIMNTRopdsyC+nocssss+sDwT2aSgg+1sW68vqC8=; b=ZOCS5B18WEW6Nn
	zeTlvEL4ttDkkNMAlnsUsX6LgKDC01hE1jAg5+7wLEtmvhFeMHPkiZefRhWvs1MRE2fnjUPAXHg2E
	rF89DhQ264f3wro8zAxjTrzzPH0nB+AcwdiovX39zgWSjwZpq/kBrrIpu5/k9bdC7t5F69IIxdaJV
	/0EwQcgtQH1VYMDuh0+JE50bTRRaueSiVXByBIM63GTqvebNJbYD+WVykrHVXA18BZzWBtpC1NbI2
	B4wu9mKUK+kasmHUup6INxIf+tLOBnsAJhS8vZA+SwQEzVQIQcRyzDkbVAsGELfmmZk4tu2aYKpnb
	og4XJ5W9W3ieqIYhRssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd80h-0020wV-0g;
	Fri, 17 Mar 2023 11:12:35 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd80e-0020rr-2D
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Mar 2023 11:12:33 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t15so4062536wrz.7
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Mar 2023 04:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679051520;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BLvbIMNTRopdsyC+nocssss+sDwT2aSgg+1sW68vqC8=;
        b=BwHvEV0sSgSddrFg8Hh1PIODNIC4ZMIWk/WZ1/H8yVNaF2x5z8Yr9lWbZNNYI/rBOu
         DpVNT8piax9oCQ13pAtybc7mDBlTvSuvhEQT8dt1OeyQRuqsZJVIM1popNh4370ikXfX
         4AI6vaonuyk4vUo/OzX3u3LDSxQvQkEeBSmex7eBcQBecl/to7QY10vECy3PnWZqdPE1
         17sJvjzW3kSl/aFed4G3y4m4arbOlcoFNMCkq4o4hLYPenIR9YppVpwHKNrLvb5pX5qL
         w1/toteI7Rfzn9N9qnCIjjdXeUlJ888CgRa+eaCGupMfrbLxoX0sOR77Sc0/MO4QLGb3
         emPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679051520;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLvbIMNTRopdsyC+nocssss+sDwT2aSgg+1sW68vqC8=;
        b=McHBKmD6eBfI5YyMTRo3zgTFPa1NAxZ9fF18T7CoEqY/oN1EgoWlISE7nxW4/MoUbu
         ckUW2VoQszeDY9AvHNMIRoWIlyDv8VMBmqqn3mXN9y4fjBjcjzPQcL8WB/jJDcvpF/5G
         8yoblDJup1hH0j5wd0z/GoZ/oXbNqIyqCNSVLs5HuopHXMdHGClOX5PFjCYPbURviBIt
         0MmcK3e1tuFH4wnoDQ50nB88KJpRcs06XUOpBWb3Qk8i5ew4+dEtO2odMuegTbZdB/0/
         6Rm/LiOwnrKXhbJkum9m4XfY6+Re4WoNgfheGENBdekZLTBx8vFPiHefCurk+yY7XRew
         Ak0Q==
X-Gm-Message-State: AO0yUKXhQRslm7j4910xN+Ps+1W252qFvZeXkQG5EuTCrNJskD5VMw+k
	KtZGlVQg83TGVv+Ox6bEO40=
X-Google-Smtp-Source: AK7set+kPpz2rTcrCHDFHOaC7PT0iilmLneVSracyniXNf2WDkA/qbHYje1YTQNFKxpyapxsjcoBOw==
X-Received: by 2002:a5d:44cb:0:b0:2cf:f3ea:533e with SMTP id z11-20020a5d44cb000000b002cff3ea533emr5462870wrr.63.1679051520303;
        Fri, 17 Mar 2023 04:12:00 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b002ceacff44c7sm1709369wru.83.2023.03.17.04.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 04:11:59 -0700 (PDT)
Message-ID: <17b68361-98b1-6cbc-a3cf-32094ae14f2e@gmail.com>
Date: Fri, 17 Mar 2023 12:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [BUG] mt7986 doesn't allow to re-enable ethsys clock gates after
 they have been disabled
Content-Language: en-US
To: Eugene Konev <uejikov@gmail.com>, linux-mediatek@lists.infradead.org
References: <ZA0qBQJRt4ZZpV2J@uejikov.net>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ZA0qBQJRt4ZZpV2J@uejikov.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_041232_721646_E291A32F 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: Network Development <netdev@vger.kernel.org>, Daniel Golle <daniel@makrotopia.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+CC relevant people.

Hi Eugene,

On 12/03/2023 02:25, Eugene Konev wrote:
> When ethsys clocks (eth_fe_en, eth_gp1_en, eth_gp2_en, eth_wocpu1_en and
> eth_wocpu0_en) are disabled calling clk_enable on them doesn't enable them
> again (appropriate bits in the register stay 0).
> This prevents using mtk_eth as module, because kernel disables all unclaimed
> clocks with clk_disable_unused.
> 

Is this a regression? Were you able to bisect the issue to see which commit 
introduced this behavior?

Regards,
Matthias

