Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A456EC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 03:18:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 707D020848
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 03:18:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CntiZ0mw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vBN+Y/So"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 707D020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uqLtfDnaf7VHnd5V9fXBcjKrhkrCCSVbPmYppu94aJ8=; b=CntiZ0mwf3qTLlZzN3wPfh+5i
	ilF4pbNfF69o+axCxIqv8Vwwfo65mWMQlGkqAsChhBzMnRZcKRUoBq3OtUMb+8lKCkF9Mu+zuIeKt
	MXMsM92gGDu0JmxNrRVmGveplktctrq9WzX/vlZSl6qifj1q6JUhM50Z1rpvhBuNQ8ZvYgtgxKmOT
	tiCC6gfEvwqJwItCf0uJPx0jkAsHwC/8B3kwc7tM2l1QekB7v7cZUb3Q8snQ6x3OmeSyLN9VHCQgN
	jADCy5f3xLF9pMlwj7hhH8HLrAABt+JO+1OwbOXGmYosV5pf/j3aHcbx4PsogtfehD+I02ppNf5BG
	HHCZs1Zjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBUtx-0004uN-3C; Fri, 28 Aug 2020 03:18:05 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBUtu-0004th-7F; Fri, 28 Aug 2020 03:18:03 +0000
Received: by mail-pf1-x441.google.com with SMTP id m8so5099737pfh.3;
 Thu, 27 Aug 2020 20:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Acgh+gXWCp44sH5EdKE9He1TE2jOtN1C7UKDtNZ4sIE=;
 b=vBN+Y/SotcpwEh6AMhqSlwWaxtcKoaSUbWfMUtuyZdHzKW5TfZ8DJz8Yx+xxylqzlQ
 GQ3i2zd4QOhUoP1slCQrO0l9o+TZIAv0hMQWzlvDoP/+Y2Lk6/mYQ/Qv+4OmcCDre5Db
 86nL0TrsL7Z2RKM+k48xlfBjHeTO4jW831d4bgsJ24G4Ln6vNvdhhLZ02FV6nNe2ODe3
 GegnjDvKkF+10p0vYUELejAwpAZl+loZPNXIQ7jL2JQh0bQSoUO33pRCMvoe/dcSmt2a
 pflAAVAsfudXZVOBsr0Jjcaw7cAC7XVqhJ1X2LyMAzlbWlHQdBT7IpNVDrNwmPxOsZZo
 AXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Acgh+gXWCp44sH5EdKE9He1TE2jOtN1C7UKDtNZ4sIE=;
 b=tvsztVyoty9hU9o5rKryHR4gVyk64ZOB4SWKJCovecgSfxr+cbGK5vr/q0abmFNbB9
 BbxXwDQVySMnddPj8CI3cTvTrSSXLEBJ6dgrSpQvx2171WTmeYFEDBJ6Yue4Ng5L+Avm
 31YLv58iyMfGo3KEPafV2DBS8+zmwilkx33PpAIqdAPxp2tZpIvtZIg5E5EQhA/m9lZS
 XJ4htl2Hj5TwfT1283IuK2YxswIzxM1/+0cr49+1EIRPab7b1pYCc+11JJKIbl/wbVd9
 Kv/CaQoT832msRYmExtEYDrsWbQ5q112Kf9ErNpk+8AVnibhk4uaosTt+UVzqzSbp/cs
 VPqA==
X-Gm-Message-State: AOAM5327VsFD5awingFG9vXVxCe64W3BsD0VxPimfqIu1DF2Kh/EuSi7
 HgJWG1jKgKlDkPYWG5Bbm9A=
X-Google-Smtp-Source: ABdhPJzxETbPjbkS1YYjBk/nb7tJpKyjonV9BeZNuwBds+ecpSdljYXHyFI8GAVk1R06F32B7QfSfQ==
X-Received: by 2002:a62:cdc2:: with SMTP id
 o185mr16431736pfg.170.1598584677717; 
 Thu, 27 Aug 2020 20:17:57 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 s198sm3743784pgc.4.2020.08.27.20.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2020 20:17:56 -0700 (PDT)
Subject: Re: [PATCH] net: dsa: mt7530: fix advertising unsupported
To: Landen Chao <landen.chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
References: <20200827091547.21870-1-landen.chao@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <95e3cc4b-e9a2-b9b0-2f7f-4c1e4d2b8bb6@gmail.com>
Date: Thu, 27 Aug 2020 20:17:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200827091547.21870-1-landen.chao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_231802_328456_04DE60A8 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: dqfext@gmail.com, frank-w@public-files.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 8/27/2020 2:15 AM, Landen Chao wrote:
> 1000baseT_Half

Looks like this part of the commit subject spilled into the commit message.

> 
> Remove 1000baseT_Half to advertise correct hardware capability in
> phylink_validate() callback function.
> 
> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
