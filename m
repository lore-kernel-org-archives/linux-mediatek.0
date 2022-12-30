Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FBCC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2cy/1OrKEt2n+KbnpUgc04/7RMy8+Ja+8GEsOnGjYA=; b=qz8E1pS19TIyE9MGYpEe/qlW9w
	zxs8szyC5KP5nZa6PPUgKM31Qn/sMCB600g+g6lEA5aMTeMyjI3xJHA4Q293FQ6AQGmgcx/8fiyR7
	osig9WkItO49ci/dkYuApQ8VPJF82lDPZeLACpxmp49cldi2Fb+POd0Qxjd/YhMBe+/ZHsYpUNHGA
	/59yd5KRtjujgcT5dOv4CxyJmAcJdDC6li2cxSJYkkvR5cTrUExDflReAGgp/xmJ7hNTrb9PnC96z
	xwYlOoBa6tLd8TM7FXFGYVmYgvyUd+jqT8OmVEXuK0hOH9+4PLF+Lihw5MaTjyvN/kNEeoEs0p8gp
	qy7bQ+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBHSN-00AcZ0-HH; Fri, 30 Dec 2022 15:38:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBHO7-00AZAk-Im; Fri, 30 Dec 2022 15:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:References:
	In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t2cy/1OrKEt2n+KbnpUgc04/7RMy8+Ja+8GEsOnGjYA=; b=mXnYlNen/EWgZDaKiaQ2YVqBQ2
	vFkGE0LBcqYF/js+wguXZdAxhZuTJ0EtvuH05a0NPb2AFrxhzBFrSeKSqTPgeukcB0SqUj/OUMEfQ
	RekJa0LQLn5Pyp90n1ofIvqiOZIaiolh9f8JupRBIN4a7jHz45j2aCrnzyvhYAdjKHI8tscZqNTDa
	4modHR6ah097xXHf9mp9uKPQitAbFuMb7yCF2mHGJu8AQvEyo+ZpSrXddzYubN1px/VccX9TPKvav
	xKCBcRA1tMpE4mk0oDYXXdQZXnWTmzmnmhf0cpXRqSuhyXXBIe97N7LKvvcu4GLdWWl2x/VdeYoLV
	eorYTvBg==;
Received: from mout.gmx.net ([212.227.17.22])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pBHNy-00GssH-1U;
	Fri, 30 Dec 2022 15:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1672414384;
	bh=QZE1xIk/afkLkABE1owXrClFFZNx+podxLmjY101Hfk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eNpLyuzVNMFXZMewJo8kzGCwOGNZvNglAloAWOco3CBBzSPZZztz+c61Ds8igR8cu
	 MMwsZFQ0NBvivkqTzJcBr2pSZEK5HSVsRETf7n8NSYI7BZLCeSdowIwagcNgfINKLO
	 mXcChc8mWMO1j+mSlZ54VWq9DUKi6KqeGndN6YkYNyUwpaaZxHT/NijkCCiCy4A5mQ
	 KGb6+CeGycQWk6pCBVJl8ta3jycju7+MURcevDqjX8J7BsD1bvvCZ+wuNQ9bqFfyIt
	 vyj1hyhlm4N/ChyDxFRj5jfYDoca8aTpgn/TcCAh5aJEipQo7S6ttUfQY+BH1A385p
	 HkbLUYMZ50zSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.149.221] ([217.61.149.221]) by web-mail.gmx.net
 (3c-app-gmx-bap18.server.lan [172.19.172.88]) (via HTTP); Fri, 30 Dec 2022
 16:33:04 +0100
MIME-Version: 1.0
Message-ID: <trinity-b52833dd-883d-4f5e-b221-29bb4d942873-1672414384681@3c-app-gmx-bap18>
From: Frank Wunderlich <frank-w@public-files.de>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re:  Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop
 generic vlan rx offload, only use DSA untagging
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Dec 2022 16:33:04 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <fc09b981-282e-26cd-661e-86fdc72bedf9@nbd.name>
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
 <trinity-a07d48f4-11cf-4a24-a797-03ad4b1150d9-1672400818371@3c-app-gmx-bap18>
 <82821d48-9259-9508-cc80-fc07f4d3ba14@nbd.name>
 <trinity-ace28b50-2929-4af3-9dd2-765f848c4d99-1672408565903@3c-app-gmx-bap18>
 <fc09b981-282e-26cd-661e-86fdc72bedf9@nbd.name>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:XFhZcwksdIibuOGNbKGPYa7y7vlWTRF7XmjcL9Tj/sqTwG5Lp8E2VOOkpLaaUEdHEDrlW
 96f0LKzWfYZHUzhiX2p+ht+6iwzS1wPAvY5q7b3IspA5FlcqIh6MkJSWJgPkx98HMt91juGfgTz9
 hIWXfNRn7gBPG8uUHPsUDtFkDq9vjsY+moqxqGhAjXFbjfXljxcYeS+Lfp+QjnTaIvtVrXjxwAdL
 3ReynmuimXUYYCr6+t84RL1imkWLFp6XU5v0FkNQ+TLknfy5/r0L1f40Fw7/DmEjieG170YICoCg
 pM=
UI-OutboundReport: notjunk:1;M01:P0:QnKiiIhgdmI=;c5RDmf75ZJavF8y4QKelpEKszc7
 3LFhndG3xZFde00fvl53n28ablLgi4kaEd0AAfY7ELLpRyDRoNqxX/629P6gSyMd/XsuCvW/N
 um+JQnGvcVQou6de2sKSlXQTQbgFkhZzlkN0ow9RY+pcZBapPDIpVUz2Zni95l5TaV82ezgZV
 UYYrRi625N6uvvL6G7Mv/ISkHw+iEYEeE/hDwVsJt7Dg7Hg0adtpjmfSatpwdvXeMuyBhm7t6
 ayKeCsIWTLO8a8rbFCeppH4obCiAlLHrbQArCPOcpps/SVLcqyZ1MtDez4U/BX3f4MCRE67ww
 kCsUXuBf1bd+OoqEhZSrS1BOt7t0vFBm8wB/pmN4+7nJS39DPfvPWF2c6fQaeC6ICwCwWK4NZ
 3y3uXDwpO7moqSpz7gZzzAvEL1WRwAX0u16bILvL3yYFRfN5hq9M4ApEl0tiQhgKq6hZrzBMF
 B2Ugz3Se6YCPZNONPBlbap9EkTXQcyVqJeH4Y2GkTA9YPohK7vwsMBbPPedNIgLhQ8rVhU/tb
 V7+EmY+KXaQnpXuUc3I8i6tk6AKV4IXm9j2hgEJJmgZf3294le+avFhpgEQ6EXJkHNiYkMW0X
 Rj352jskxQjiGRKCU3rW1xWs8x9Z43H11uItCx78BvXg16aSoYmN06iTcElifWN+tkFmXkgMC
 6KcoU5J0lsFtECYG6280H/ghK4oJItOL2CE4mK+Q0CYn+Vp+FXUSdoEHxYwtNgFAuJBFRboXj
 Y0ZoDswXQCdvtyQHwhomg11Btnd/06unUBiKTK+VoP2+wAPoxk+lv4L1dhEkjrvKTPQ/2LRtN
 P8cBKXXl+qo5XwaTyYVCHVwg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_153330_731255_121DAE33 
X-CRM114-Status: GOOD (  15.62  )
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

Hi

> Gesendet: Freitag, 30. Dezember 2022 um 15:58 Uhr
> Von: "Felix Fietkau" <nbd@nbd.name>

> Does this help?
> ---
> --- a/net/dsa/tag_mtk.c
> +++ b/net/dsa/tag_mtk.c
> @@ -25,6 +25,14 @@ static struct sk_buff *mtk_tag_xmit(stru
>   	u8 xmit_tpid;
>   	u8 *mtk_tag;
>
> +	/* The Ethernet switch we are interfaced with needs packets to be at
> +	 * least 64 bytes (including FCS) otherwise their padding might be
> +	 * corrupted. With tags enabled, we need to make sure that packets are
> +	 * at least 68 bytes (including FCS and tag).
> +	 */
> +	if (__skb_put_padto(skb, ETH_ZLEN + MTK_HDR_LEN, false))
> +		return NULL;
> +
>   	/* Build the special tag after the MAC Source Address. If VLAN header
>   	 * is present, it's required that VLAN header and special tag is
>   	 * being combined. Only in this way we can allow the switch can parse

no, i verified my vlan-setup ist right by adding additional device (my r2)=
 into the same 2 vlans. My Laptop can ping both vlans of R2, but on r3/mt7=
986 only vlan500 (on eth1) works, not 600 on wan-port of mt7986.

see arp going out on r3, but not received in the other side (laptop/r2)...=
.

any debug i can add for this? ethtool does not show stats for vlans, for w=
an i see no CRC/drops

regards Frank

