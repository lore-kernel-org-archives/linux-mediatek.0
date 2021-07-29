Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BEAC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 17:28:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73D3D6052B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 17:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 73D3D6052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ftcyHvftL1h7Z/iYHGR+33aVMpHpQ5pNpxJPlWm/KNE=; b=Xbxk+yGRGFXzzmOlqhqZN55+Bj
	UhJedJdImYTG2pfB9dGPFJ1A9oY4joXGuqP7JnO9gpZrvcfdGlUjv53J3J8AhQUNbx9PeIYvTjMji
	TcKvUM2j0fe46vXv6p/FJe2/A5pkKDEHVcZYl81Dt6lDgDmqIBMZ8w8oDfBTlJ1qgeSv35yE1eZgL
	ohhPMwMh9qCAshDo5LNBut7jnibEYSQ79pHz2ALD7w+nvVRq9OVmJsHA4unxmZYMZIfCHL0dBhGQm
	iiBkaMMfDXPRB4ZopPuhUOsj9uATpAeQ+3TbEW4GFPqqtgefX8YfKC5imRLglffeO0rt8uYcM2/lo
	3Zee0KDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m99pf-005Jsk-R5; Thu, 29 Jul 2021 17:28:31 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m99pd-005Js9-O6; Thu, 29 Jul 2021 17:28:30 +0000
Received: by mail-oi1-x234.google.com with SMTP id z26so9384979oih.10;
 Thu, 29 Jul 2021 10:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T4634nEU7h1FMASxQlJXurHsCOwc8FrOI5tJXiiXeII=;
 b=ktpTazTWfguZ49pyVRHW8CWP7MID2LgaKgHZRwDP9C+D5e+fbBEK9XdGTXMDqWOPaC
 pR4EN+0ZyJS1h40sC88vRfULp01m8jWiB1rxvZ6e/cmk++MN+gh9jDTCsJwmA+o5TXPp
 y1klOH7188f78HV+Fnbwt4oEt5wb6LojxKbJKrO+OuwF71deVXsVtuqjEL7zGenz30oR
 r+mZmfOL4jD9AgBrhA6AQFNYIML2JJLr6v2pcN4tsYydl1WSGQNbR6m+62CuWiKl79i1
 X4n4C3YfbfpxcGbqNAc343VKVlhRhDFafLNO21tj/tFQxnxEctBvTp+1jVpHYEExvo+f
 UGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T4634nEU7h1FMASxQlJXurHsCOwc8FrOI5tJXiiXeII=;
 b=fsy6HdMrTb4qyNi9ctP6Gu15cJtTDm+GhUwMNb45rzcyiEy8ZNOT6YQMcFbyS6q/4b
 ESthTFZiYvMq/wOndh8xFvbYxq6LG3V7PS9Op9Kre/4cvhWLM3wEdXl+Oa8FvnbI9WpB
 cMnmRICplAzpR3/mYMQrjGACx+wRLw93EHwtAH7mH/ZDbsZSG6gx01OP1N5nssoR7q4+
 UDWEB6+M6gjJhaJkLJJBQ2p10I5Xw0WEeaDjVwYXQGNPXV/EJW0mpi9ztg7qe8BVw3f8
 zcerhjVp3BzXXgCcwJEf9JyZeIabkBZ6n2BGHvxkVso4rapOuuUrtW8bXVIG6b+8xEkO
 kryA==
X-Gm-Message-State: AOAM5315kLqausArTtLidfgks6/Xgs4M2DT6ClPEDaUUIhB2tkhqPPs4
 Q+Z6qPx2kpm2FmPNJE6BNww=
X-Google-Smtp-Source: ABdhPJxoUx2dL4gO6cXj2XI9CKAW2Xkw2stlC8KQ+HBW6uwYZLrX61/EqE8spljKolA9iphj4rdhhg==
X-Received: by 2002:aca:bc43:: with SMTP id m64mr11250240oif.174.1627579708922; 
 Thu, 29 Jul 2021 10:28:28 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.27])
 by smtp.googlemail.com with ESMTPSA id h1sm648323otj.48.2021.07.29.10.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 10:28:28 -0700 (PDT)
Subject: Re: [PATCH net-next] net: ipv6: add IFLA_RA_MTU to expose mtu value
 in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, rocco.yue@gmail.com
References: <c4099beb-1c22-ac71-ae05-e3f9a8ab69e2@gmail.com>
 <20210729154251.1380-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <57652c0b-ded8-8386-c9a7-40deb1525db2@gmail.com>
Date: Thu, 29 Jul 2021 11:28:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210729154251.1380-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_102829_836275_7D7DCD94 
X-CRM114-Status: GOOD (  12.30  )
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

On 7/29/21 9:42 AM, Rocco Yue wrote:
> Because the purpose of this patch is for userspace to correctly read the
> ra_mtu value of different network device, if the DEVCONF is completely dropped,
> does that mean I can add the "ra_mtu" member in the "struct net_device" .

good point. IFLA is the wrong attribute. It should be IFLA_INET6_RA_MTU,
stored in inet6_dev and added to the link message in
inet6_fill_ifla6_attrs.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
