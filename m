Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FD7D1D87B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 15:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZgdUMWEzAk+EG79Tz22s/1CLoW4tYxCgZIaYa3L5yog=; b=DRFWC4Uo4VYdWG
	rqaYkzcM7dJ32zC4EBRnjUT+k4R0jScsSyYKAEciMiob4YU0vw7vDX7dSiEQGe8z/OgrH2nUTLLON
	qpckkWbx+pMhYpu8u3SRto3SZfbLViinZqZtjIp/yYkx2Ot5lY0Tsi4QFYKryL5lbh2hccTEuFwUL
	3vsV5jQeOLHehDsBVl1hlFfJWwZGJgTmP8JQTTKzPIdaB4PGuUi+Hmp3zi8sH4aCg53Ch1Woqwl0y
	5fdTn56FMT2LwnOJ3iOZ2E/W6QWP+Df/dGJax2OsdA6/hugoxKNVegVg+gT/IHMbuKcEZD0rl7irm
	voZOI4rYjCA5GbwDy+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0jSV-00000008hjc-0Tu6;
	Tue, 15 Oct 2024 15:27:39 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0jPl-00000008h99-1gi9;
	Tue, 15 Oct 2024 15:24:50 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso9208581fa.2;
        Tue, 15 Oct 2024 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729005887; x=1729610687; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZgdUMWEzAk+EG79Tz22s/1CLoW4tYxCgZIaYa3L5yog=;
        b=Xj46EbTfnJ5vSMzgJrBfLhZlVyF+sUzbXimZY9HZLjlHCsjlYBCfWPiaewYKNxZWra
         swHNI4rFuXF56pQGe9wCSHT9lga6Zf8F8paLRGdrwRqgiml0U9kbW93o4UUWBtQs8UtG
         rajSPV3AdB24raC2Y9oKXBsVLQE8KQCcvCFV3eRKhvJ8IGzolFGD6/YQtgs8RnNktNgS
         CdoCYNoDK+ONClHO9Mk6mF6vEb6Q9ddiK99KMIVarnHpAdmekFbutnus+AIaEqSPLRvD
         ICqlirqrFmS8Viyl78YjgoFzf85p599MMbmLCBMooWfahSAGEiTajr5xf3Ps9WYZrIHa
         upPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729005887; x=1729610687;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgdUMWEzAk+EG79Tz22s/1CLoW4tYxCgZIaYa3L5yog=;
        b=riFOLcVzbUFEiHQKFe5pMrJatTsAOG36EBx00Cq4xVe0QEV7fApGpVu0mdDKz6063k
         fMxOzXzN8Uwv4SMq8dvOTHtc27mFKXgTbeytv6D6ZrhovEe8Fpkxc7r9USfVDNvX/iSE
         M4w5Z02dtX4WpYeww/CwE4bhf7nGuYhQ7eiQ7VTEy6wAQw1nD8mjOz8Pl0iNRssiApSY
         VW9gH97I1oEuGnILuDhOKGbLX8JpvG1zw1VjFCjfHP+i+Ov+G+/Fa47Lhjv5V01kH/yd
         RmI40KimmR9Yt6aLVx6t4UvKZH76t6iV471kiJGh827J3CryQo3g2PRuqzfW7xUno34E
         s7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUdNewZSabJl/mEt8laYvAGQOzsYPSxUKIQ3bBc5qqmuBz9WGhEW/60KXlMaw7irCNalTpEadkRYpqTcZ/kIL2Q@lists.infradead.org, AJvYcCV2FbdeAVQ7WAQEyuwnjGALdp9YbVIhG7Oshf4FJJrwjeQzcteA+RDg/Y6rd0BvP9cgWTkvzHx3iwZNRePXx7U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz83I+QfctOlrRW3bcZgBVGicmEupfGbqWp5SLS4+JHq067BByP
	0R6UJofumEfJBd5Xus9AHVoiy3LUMmNs5Yd/DfjjGRPRC7loNG+2
X-Google-Smtp-Source: AGHT+IEhXB8Zlg7IkTsA8y8iIL+yFM1Egeas7A6tyYltRKvND4UncFEa35oKJ/d3toA8mwCozQ6E8A==
X-Received: by 2002:a2e:5149:0:b0:2fb:357a:be4d with SMTP id 38308e7fff4ca-2fb3f31053dmr55908261fa.43.1729005886835;
        Tue, 15 Oct 2024 08:24:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a297171c1sm83165166b.41.2024.10.15.08.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 08:24:46 -0700 (PDT)
Message-ID: <5de748b1-5963-495e-ab90-6453c1707c39@gmail.com>
Date: Tue, 15 Oct 2024 17:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next] net: ethernet: mtk_ppe_offload: Allow
 QinQ
To: Simon Horman <horms@kernel.org>
References: <20241013185056.4077-1-ericwouds@gmail.com>
 <20241014085122.GN77519@kernel.org>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <20241014085122.GN77519@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_082449_488489_B8D54CF6 
X-CRM114-Status: GOOD (  21.45  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/14/24 10:51 AM, Simon Horman wrote:
> On Sun, Oct 13, 2024 at 08:50:56PM +0200, Eric Woudstra wrote:
>> mtk_foe_entry_set_vlan() in mtk_ppe.c already seems to support
>> double vlan tagging, but mtk_flow_offload_replace() in
>> mtk_ppe_offload.c only allows for 1 vlan tag, optionally in
>> combination with pppoe and dsa tags.
>>
>> This patch adds QinQ support to mtk_flow_offload_replace().
>>
>> Only PPPoE-in-Q (as before) and Q-in-Q are allowed. A combination
>> of PPPoE and Q-in-Q is not allowed.
>>
>> As I do not have any documentation of the ppe hardware, I do not
>> know if there is any other reason to not implement Q-in-Q in
>> mtk_flow_offload_replace().
>>
>> Tested on the BPI-R3(mini), on non-dsa-ports and dsa-ports.
>>
>> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> 
> Hi Eric,
> 
> I see that this patch supports up to two VLANs, both with EtherType 0x8100.
> And assuming that is supported by the hardware, that seems fine to me.
> 
> But I winder if you know if this hardware supports other VLAN EtherTypes,
> such as  0x88a8 which is described in 802.1ad?

Hello Simon,

The issue is that I do not have the documentation. Therefore I submit
this patch as RFC and I hope someone at mediatek or so can confirm we can
implement QinQ as in this patch on all hardware that uses mtk_ppe_offload.

But it does not look like it supports 0x88a8 from 802.1ad.

