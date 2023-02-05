Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FA7C636CD
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Feb 2023 19:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ze1SJBY1Wx6lFrEWbcsfu2oAo4V69UzmhGUxMPFB7ss=; b=OuIAJ1yinAxeE0
	8yurbD3Npc0tXsHMJjSdWTAWWbac97HICnyWrr/FGfFQYuNOkTQwjjI19JTRZ+AYOFomTp3uxsboS
	b03I1NIeqApjm5Z2ZSdPBkaeBDeHZ2eEZPvIowyRWmOxsb2dFxY7pa2Vmo8jHn3B+XWTE4dpAOfMq
	GvYDAOiQy6B5EY3MLkoDbRs6bOfQcz+GNlBHDX0oNaK4SCFPB7NISCg84BHfh4a9cDxK1WUENBUrH
	Rz5GahIz88BVRrEvdUMCcimbQ5+W0C7DtFSmaKKPWZdpGPXxz/NvEmSY6A8nYgIUrFCQYAh1I2L+Y
	K5j3ZxTj9dm9C32QHjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOkea-006jAV-72; Sun, 05 Feb 2023 19:26:20 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOkeK-006j8S-PC; Sun, 05 Feb 2023 19:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1675625138; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WYSCdx3OS1UYar4V0w3b4hm8PrLdGbI5gqGCze+bmBh2Rj9ZP4nSXIf1aIGmV3O6NLHrDH06EA5hMEIHFYRn5wffj0pzK2CBrcSAFAUppkNt5cOSIqYKFsdWrPF7tVg1ewv/1faIn9zCtauLqpKrpIUaAUoO5CHpUSmJUi8pzdM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1675625138; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Ze1SJBY1Wx6lFrEWbcsfu2oAo4V69UzmhGUxMPFB7ss=; 
	b=H2Lrf7ExotIqc7kPh8iE9L3a65Qu4OjFw4cSwVhIKQLfiD8cIywQQODQlP8yWzrMt7BZxm9VULtZqoLB5Q9ewR+rr+Gn/02RA0ELxLhZErU6prdYpbXf3oHXrufTBeJvzlZDWjVgM47oeLaZutSv+JOnmZ3d83DmPBSyqOl1QSQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1675625138;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ze1SJBY1Wx6lFrEWbcsfu2oAo4V69UzmhGUxMPFB7ss=;
	b=SmXO9Ncc4TygNio0NDTeJtlMrf2MZ+uCjatBxa9ke4M2AyitRZL+Vj6T9QSTr+Rd
	PfSvOhut+LT7ZcKTVYzAUrF0APlQJTib+L9sMldryoBwyv+h0NyIcHwquqPjZHMpUez
	ppsFD0WRD6kbaIdNN6HnE5TQ6NrvmtIkYKb25kXE=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1675625135719398.2461928154073; Sun, 5 Feb 2023 11:25:35 -0800 (PST)
Message-ID: <3649b6f9-a028-8eaf-ac89-c4d0fce412da@arinc9.com>
Date: Sun, 5 Feb 2023 22:25:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_112604_897685_AFB5D36E 
X-CRM114-Status: GOOD (  19.67  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, richard@routerhints.com, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5.02.2023 17:07, Vladimir Oltean wrote:
> Frank reports that in a mt7530 setup where some ports are standalone and
> some are in a VLAN-aware bridge, 8021q uppers of the standalone ports
> lose their VLAN tag on xmit, as seen by the link partner.
> 
> This seems to occur because once the other ports join the VLAN-aware
> bridge, mt7530_port_vlan_filtering() also calls
> mt7530_port_set_vlan_aware(ds, cpu_dp->index), and this affects the way
> that the switch processes the traffic of the standalone port.
> 
> Relevant is the PVC_EG_TAG bit. The MT7530 documentation says about it:
> 
> EG_TAG: Incoming Port Egress Tag VLAN Attribution
> 0: disabled (system default)
> 1: consistent (keep the original ingress tag attribute)
> 
> My interpretation is that this setting applies on the ingress port, and
> "disabled" is basically the normal behavior, where the egress tag format
> of the packet (tagged or untagged) is decided by the VLAN table
> (MT7530_VLAN_EGRESS_UNTAG or MT7530_VLAN_EGRESS_TAG).
> 
> But there is also an option of overriding the system default behavior,
> and for the egress tagging format of packets to be decided not by the
> VLAN table, but simply by copying the ingress tag format (if ingress was
> tagged, egress is tagged; if ingress was untagged, egress is untagged;
> aka "consistent). This is useful in 2 scenarios:
> 
> - VLAN-unaware bridge ports will always encounter a miss in the VLAN
>    table. They should forward a packet as-is, though. So we use
>    "consistent" there. See commit e045124e9399 ("net: dsa: mt7530: fix
>    tagged frames pass-through in VLAN-unaware mode").
> 
> - Traffic injected from the CPU port. The operating system is in god
>    mode; if it wants a packet to exit as VLAN-tagged, it sends it as
>    VLAN-tagged. Otherwise it sends it as VLAN-untagged*.
> 
> *This is true only if we don't consider the bridge TX forwarding offload
> feature, which mt7530 doesn't support.
> 
> So for now, make the CPU port always stay in "consistent" mode to allow
> software VLANs to be forwarded to their egress ports with the VLAN tag
> intact, and not stripped.
> 
> Link: https://lore.kernel.org/netdev/trinity-e6294d28-636c-4c40-bb8b-b523521b00be-1674233135062@3c-app-gmx-bs36/
> Fixes: e045124e9399 ("net: dsa: mt7530: fix tagged frames pass-through in VLAN-unaware mode")
> Reported-by: Frank Wunderlich <frank-w@public-files.de>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Tested on MT7621AT and MT7623NI boards with MT7530 switch. Both had this 
issue and this patch fixes it.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Unrelated to this, as in it existed before this patch, port@0 hasn't 
been working at all on my MT7621AT Unielec U7621-06 board and MT7623NI 
Bananapi BPI-R2.

Packets are sent out from master eth1 fine, the computer receives them. 
Frames are received on eth1 but nothing shows on the DSA slave interface 
of port@0. Sounds like malformed frames are received on eth1.

Cheers.
Arınç

