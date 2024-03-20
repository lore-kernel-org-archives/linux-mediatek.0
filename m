Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90B1C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SkUI3atsAwC66eCnaxlWEUl9HDE01QJD/p5zESgycU=; b=Kd2XSw2uQGdb9C
	N8xDmLyU7uyLEMa+/fb1mJPGhF+vhzcIulg8H9j70PQ1kzM+HWAoUd6d7QQk3uJRLokIoKehEpcM0
	7uilpfBTNGG4FNygqwUYt58uAdFzBGrGZNULwgIkndg0+sNF+cfiZIpRfe4bgOAJCciAOyt/vEI/j
	go0/zA2mLN7ssLMUW6QuhSaCE/+IMdwQYEEGpnGfAWPOD+IuS8jG8rkrGWChRgaPUBwAQ2y6/cu3/
	8N4Y6yP3B09W9i2ap3vEtEzMHKusmYHqlc5kWvPLWRax3YfFFQj44LrVzGuNu+gUrSsDijTAYKsrf
	qiSQb730mAzM6q0VLhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmz0Q-00000000MMC-2xiZ;
	Wed, 20 Mar 2024 16:41:34 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmz0L-00000000MIs-1RVA;
	Wed, 20 Mar 2024 16:41:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72FAD40003;
	Wed, 20 Mar 2024 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710952886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7SkUI3atsAwC66eCnaxlWEUl9HDE01QJD/p5zESgycU=;
	b=B0ezw9bv16NsZED+hjFQa0hdg5L42aMiRwhE/JjS/cm5AnzWRq7VV6wB6wrhwY27zJaPIh
	kgJuHurSN79pczX1ABqa8EuZ5Rr7yp1dFI39b0bjJIJhBTY3Zrc5RPnUmCtT6Fb61JwerT
	DYIfNN2ZK2P9lKi6cVQs3s15vbfICaRv47YXclIZ/cxDDToDMkZ7cCIMB1dYvAF8ER08yP
	ElKJnwLgqy78sIQVZ/VZyD3c1lzbyGGHiS+iS9Yef69BUH5iT5Y8TBB4298byJ6Mp0b0ry
	5tf3Yi1jB8l8hOMbZG9TXf+0M5X9u74qXZp+dkg9X/Q/yRl51NWOqDS8Ny7X1Q==
Message-ID: <f6f064b8-efb2-4ab0-94f1-468d5d273d6e@arinc9.com>
Date: Wed, 20 Mar 2024 19:41:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 0/2] MT7530 DSA subdriver fix VLAN egress and
 handling of all link-local frames
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_094129_587724_3B781A7D 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14.03.2024 12:33, Arınç ÜNAL via B4 Relay wrote:
> Hi.
> 
> This patch series fixes the VLAN tag egress procedure for link-local
> frames, and fixes handling of all link-local frames.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> Changes in v2:
> - Add Fixes: tag to both patches.
> - Link to v1: https://lore.kernel.org/r/20240311-b4-for-net-mt7530-fix-link-local-vlan-v1-0-d67e6cc31af2@arinc9.com
> 
> ---
> Arınç ÜNAL (2):
>        net: dsa: mt7530: fix link-local frames that ingress vlan filtering ports
>        net: dsa: mt7530: fix handling of all link-local frames
> 
>   drivers/net/dsa/mt7530.c | 52 ++++++++++++++++++++++++++++++++++++++++--------
>   drivers/net/dsa/mt7530.h | 22 +++++++++++++++++++-
>   2 files changed, 65 insertions(+), 9 deletions(-)
> ---
> base-commit: d7d75124965aee23e5e4421d78376545cf070b0a
> change-id: 20240208-b4-for-net-mt7530-fix-link-local-vlan-af6e9928ad8d
> 
> Best regards,

Reminder this patch series is waiting to be applied.

Arınç

