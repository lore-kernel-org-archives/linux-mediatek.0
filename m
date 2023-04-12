Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D3DC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 16:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wck8HD9Sy7CyXZlzDWG6BVFUCDUQ5CegNpVgjUnegBA=; b=HzCObExcC0BQo/5HQ1W94/pCpW
	J4sLz9FrZ1TGdFyekuPvxu+SUk2m/hOea7FE2ZkKlHttI0XKv9PgU6eJPFk6CSIcyokswHn1cvGFr
	eAJovZ5RAGbKACZVUFEjsdFqsOrok8n8XAGYj9LpmjwGr3tPGY4hF8ELXm/W9QrKb91AN4pA1mG9M
	zdelSYs5w6rrHcahV2cgTwo49RBgZBYq7TNHt5Fofa27vGoeGZdjxN0TiYJp6Y7Proy/jFfu1tTJd
	d9dUxt6RC+GJWAzDStKajLcsIIettuEVUAp0iWSpuYwexTwoINWPea1mBkWdb5+GfJMUSuG/mwAX/
	zbSFjI/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmdE9-003nGb-0B;
	Wed, 12 Apr 2023 16:21:45 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmdE5-003nEs-1r;
	Wed, 12 Apr 2023 16:21:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681316492; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lrbSRml3xVu0YeeBamAqD09a/m5UTQLSsXzER7u7K4SaeM3heOPY7Veu6/qko6cwpGwMjJgv6FPU9u1sw6yR8eDQy88FH98XvPo7Bpc8lYq8O5J6xktwL4F3Dt2+81zCNr7RhCF1BJySlFB3qCOcr9e6HyeBSBN3dQ2cephkKRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681316492; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Wck8HD9Sy7CyXZlzDWG6BVFUCDUQ5CegNpVgjUnegBA=; 
	b=A7FhriqgVbJ6YkT8TGv6j+bvqylRtd7BfLxT33vrDKsG11p/1rFScF4htD+zkKYv1G+YjItcSxwT5Yk2fF1CwUQ23O5p4wr1QHDwOzo0ncC45+qGwwu1iKkGBOjBZqooHjDvS9mVnXyQEf6FDYkzcKtHyAq/WM3clX/ZfQEH51U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681316492;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Wck8HD9Sy7CyXZlzDWG6BVFUCDUQ5CegNpVgjUnegBA=;
	b=VSksN/AfyX0vDyTc3pYj+2E1ai9FLegAyFo02Mcg99BUSsencqudW+TEawdXpwjh
	amkhYXYB+CvrLRWxBDtzCDAhgZuh9oojZvGAsXxbs55k+OosOdzNMVAzGp3yOberJ3c
	b1Mg8Q8EPh+soXfhkzrfWhKnF0Kp3ylXQb/QZXxg=
Received: from [10.10.9.4] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681316491413307.82113764393307; Wed, 12 Apr 2023 09:21:31 -0700 (PDT)
Message-ID: <0d242292-16b7-6837-7d1a-b70c41309e6b@arinc9.com>
Date: Wed, 12 Apr 2023 19:21:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: Aw: Re: Re: Re: Re: [PATCH v3 0/5] arm: dts: mt7623: relocate
 gmacs, mt7530 switch, and add port@5
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 erkin.bozoglu@xeront.com
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
 <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
 <trinity-dab715b9-3953-40da-bc25-c4c2a5e9b7c3-1676715866453@3c-app-gmx-bap53>
 <27a26da8-8297-5327-7493-54d8359b6970@arinc9.com>
 <trinity-dd260791-3637-4193-8f93-a9fcdb013dcb-1676722705920@3c-app-gmx-bap53>
 <2dc2fc39-b0d5-c872-36bf-fde851debe4b@arinc9.com>
 <A329B2DF-04B7-40FA-BBCE-1F1012A6DBBD@public-files.de>
 <fb96d8eb-2eb7-db19-1135-1a833294dd67@arinc9.com>
 <trinity-899c01a6-0fc5-4900-aea8-2b43802c8329-1676814734826@3c-app-gmx-bs35>
 <trinity-3f46d325-bc45-4ee7-ae86-c8db4467aa94-1681303779505@3c-app-gmx-bap50>
 <703ad8a8-f84e-6404-4cce-5386bfaa2bd7@arinc9.com>
 <trinity-489cdc3b-e861-49d0-b1ec-e964f00388df-1681312277092@3c-app-gmx-bap50>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <trinity-489cdc3b-e861-49d0-b1ec-e964f00388df-1681312277092@3c-app-gmx-bap50>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_092141_668539_4D104D1C 
X-CRM114-Status: GOOD (  12.34  )
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

On 12.04.2023 18:11, Frank Wunderlich wrote:
> Hi
> 
>> Gesendet: Mittwoch, 12. April 2023 um 16:31 Uhr
>> Von: "Arınç ÜNAL" <arinc.unal@arinc9.com>
>>> looks good so far, but i have not managed how to change dsa master from the preferred port (eth0) to the second one...
>>> any idea how the correct syntax is for iproute2?
>>
>> https://www.kernel.org/doc/html/latest/networking/dsa/configuration.html#affinity-of-user-ports-to-cpu-ports
>>
>> In short: ip link set lan0 type dsa conduit eth1
> 
> thanks, it changes the master when i upgrade iproute to 6.1 (from debian bullseye-backports), but i cannot do any traffic on it after switching to gmac1...
> 
> 5: wan@eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
>      link/ether f2:d2:51:56:cd:3d brd ff:ff:ff:ff:ff:ff
>      inet 192.168.0.11/24 scope global wan
>         valid_lft forever preferred_lft forever
> 
> see no p5-TX/gmac-rx
> 
> root@bpi-r2:~# ethtool -S eth1
> NIC statistics:
>       tx_bytes: 5156
>       tx_packets: 61
>       tx_skip: 0
>       tx_collisions: 0
>       rx_bytes: 0
>       rx_packets: 0
>       rx_overflow: 0
>       rx_fcs_errors: 0
>       rx_short_errors: 0
>       rx_long_errors: 0
>       rx_checksum_errors: 0
>       rx_flow_control_packets: 0
>       rx_xdp_redirect: 0
>       rx_xdp_pass: 0
>       rx_xdp_drop: 0
>       rx_xdp_tx: 0
>       rx_xdp_tx_errors: 0
>       tx_xdp_xmit: 0
>       tx_xdp_xmit_errors: 0
>       p05_TxDrop: 0
>       p05_TxCrcErr: 0
>       p05_TxUnicast: 0
>       p05_TxMulticast: 0
>       p05_TxBroadcast: 0
>       p05_TxCollision: 0
>       p05_TxSingleCollision: 0
>       p05_TxMultipleCollision: 0
>       p05_TxDeferred: 0
>       p05_TxLateCollision: 0
>       p05_TxExcessiveCollistion: 0
>       p05_TxPause: 0
>       p05_TxPktSz64: 0
>       p05_TxPktSz65To127: 0
>       p05_TxPktSz128To255: 0
>       p05_TxPktSz256To511: 0
>       p05_TxPktSz512To1023: 0
>       p05_Tx1024ToMax: 0
>       p05_TxBytes: 0
>       p05_RxDrop: 0
>       p05_RxFiltering: 16
>       p05_RxUnicast: 11
>       p05_RxMulticast: 38
>       p05_RxBroadcast: 12
>       p05_RxAlignErr: 0
>       p05_RxCrcErr: 0
>       p05_RxUnderSizeErr: 0
>       p05_RxFragErr: 0
>       p05_RxOverSzErr: 0
>       p05_RxJabberErr: 0
>       p05_RxPause: 0
>       p05_RxPktSz64: 17
>       p05_RxPktSz65To127: 44
>       p05_RxPktSz128To255: 0
>       p05_RxPktSz256To511: 0
>       p05_RxPktSz512To1023: 0
>       p05_RxPktSz1024ToMax: 0
>       p05_RxBytes: 5156
>       p05_RxCtrlDrop: 0
>       p05_RxIngressDrop: 0
>       p05_RxArlDrop: 0
> 
> maybe i miss something?
> 
> i'm not sure it is a problem with richards Patch or p5/gmac1

Did you apply the vlan and flooding fix patches from Richard?

Arınç

