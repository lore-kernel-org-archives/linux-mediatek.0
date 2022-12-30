Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACA8C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 15:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy+HbPipHKDxHKUqBoKOmKIN/UPwbu8pN8QMqI6wdfA=; b=xn2qpdvfqJO3QciHzEWyD734KT
	s/HBjZbAhOKqwIixvJ0okP8XBw5m2ZPSY3TfOzr5LbyZ1aS3bCSJAUOEmyk338VVOGcObFDSSjbbY
	PKfFdoMcqEF9m8EjmlNac5rU0TkmPdW8SsF9RgkjalfNDqm21FIeR06emgKe0a21duRYFxRKQcUnI
	J86gsnUnv8GzRaUjcS9dqyPG+a7IEbnt991++shjUYy1ABVicsKw9KQvzE14fYJ3pvBn5mG8RgvTZ
	uOpUhxLka+JPGyJI8oj4uCQnbOG614DCRQX5FRyvSgHt3JBW7Lry2VyIlsQ7vA6gAJ4ft7iIriUCu
	VOT7s/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBGsY-00ALVW-Ci; Fri, 30 Dec 2022 15:01:05 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBGqP-00AKnZ-FE; Fri, 30 Dec 2022 14:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vy+HbPipHKDxHKUqBoKOmKIN/UPwbu8pN8QMqI6wdfA=; b=jDJcs4FB6l1HBQ5AGcKbqu1ujZ
	q3VpfTDC7XsXTrAyfIlMRykDrFcAcLgANZdnwxFUFdx6xASEqPho6OlPqBnpP7kM+uYph+7gdcCwZ
	QO6WOdO+Ppq4U9N2qfywMrYywFjhZgmdc+6OWi4wmR3IHyMIoXZHB1lDSRjFtUgCsE90=;
Received: from p200300daa720fc00fd7bb9014adaf597.dip0.t-ipconnect.de ([2003:da:a720:fc00:fd7b:b901:4ada:f597] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pBGq6-00CjfD-Ed; Fri, 30 Dec 2022 15:58:30 +0100
Message-ID: <fc09b981-282e-26cd-661e-86fdc72bedf9@nbd.name>
Date: Fri, 30 Dec 2022 15:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Aw: Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop
 generic vlan rx offload, only use DSA untagging
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
 <trinity-a07d48f4-11cf-4a24-a797-03ad4b1150d9-1672400818371@3c-app-gmx-bap18>
 <82821d48-9259-9508-cc80-fc07f4d3ba14@nbd.name>
 <trinity-ace28b50-2929-4af3-9dd2-765f848c4d99-1672408565903@3c-app-gmx-bap18>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <trinity-ace28b50-2929-4af3-9dd2-765f848c4d99-1672408565903@3c-app-gmx-bap18>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_065849_851300_400A2C6A 
X-CRM114-Status: GOOD (  27.42  )
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

On 30.12.22 14:56, Frank Wunderlich wrote:
> Hi
> 
> thanks for fast response
> 
>> Gesendet: Freitag, 30. Dezember 2022 um 13:56 Uhr
>> Von: "Felix Fietkau" <nbd@nbd.name>
>> An: "Frank Wunderlich" <frank-w@public-files.de>
>> Cc: netdev@vger.kernel.org, "John Crispin" <john@phrozen.org>, "Sean Wang" <sean.wang@mediatek.com>, "Mark Lee" <Mark-MC.Lee@mediatek.com>, "Lorenzo Bianconi" <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
>> Betreff: Re: Aw: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop generic vlan rx offload, only use DSA untagging
>>
>> On 30.12.22 12:46, Frank Wunderlich wrote:
>> > Hi,
>> >
>> > v2 or v3 seems to break vlan on mt7986 over eth0 (mt7531 switch). v1 was working on next from end of November. But my rebased tree with v1 on 6.2-rc1 has same issue, so something after next 2711 was added which break vlan over mt7531.
>> >
>> > Directly over eth1 it works (was not working before).
>> >
>> > if i made no mistake there is still something wrong.
>> >
>> > btw. mt7622/r64 can also use second gmac (over vlan aware bridge with aux-port of switch to wan-port) it is only not default in mainline. But maybe this should not be used as decision for dropping "dsa-tag" (wrongly vlan-tag).
>> >
>> > regards Frank
>> Thanks for reporting.
>> Please try this patch on top of the series:
>> ---
>> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
>> @@ -3218,10 +3218,8 @@ static int mtk_open(struct net_device *dev)
>>   	phylink_start(mac->phylink);
>>   	netif_tx_start_all_queues(dev);
>>
>> -	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2))
>> -		return 0;
>> -
>> -	if (mtk_uses_dsa(dev) && !eth->prog) {
>> +	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2) &&
>> +	    mtk_uses_dsa(dev) && !eth->prog) {
>>   		for (i = 0; i < ARRAY_SIZE(eth->dsa_meta); i++) {
>>   			struct metadata_dst *md_dst = eth->dsa_meta[i];
>>
>> @@ -3244,10 +3242,6 @@ static int mtk_open(struct net_device *dev)
>>   		val &= ~MTK_CDMP_STAG_EN;
>>   		mtk_w32(eth, val, MTK_CDMP_IG_CTRL);
>>
>> -		val = mtk_r32(eth, MTK_CDMQ_IG_CTRL);
>> -		val &= ~MTK_CDMQ_STAG_EN;
>> -		mtk_w32(eth, val, MTK_CDMQ_IG_CTRL);
>> -
>>   		mtk_w32(eth, 0, MTK_CDMP_EG_CTRL);
>>   	}
>>
>>
>>
> 
> seems not helping...this is how i test it:
> 
> ip link set eth1 up
> ip link add link eth1 name vlan500 type vlan id 500
> ip link add link wan name vlan600 type vlan id 600
> ip addr add 192.168.50.1/24 dev vlan500
> ip addr add 192.168.60.1/24 dev vlan600
> ip link set vlan500 up
> ip link set wan up
> ip link set vlan600 up
> 
> #do this on the other side:
> #netif=enp3s0
> #sudo ip link add link $netif name vlan500 type vlan id 500
> #sudo ip link add link $netif name vlan600 type vlan id 600
> #sudo ip link set vlan500 up
> #sudo ip link set vlan600 up
> #sudo ip addr add 192.168.50.2/24 dev vlan500
> #sudo ip addr add 192.168.60.2/24 dev vlan600
> 
> verified all used ports on my switch are in trunk-mode with vlan-membership of these 2 vlan.
> 
> 
> 
> booted 6.1 and there is vlan on dsa-port broken too, so either my test-setup is broken or code...but wonder why 6.1 is broken too...
> 
> with tcp-dump on my laptop i see that some packets came in for both vlan, but they seem not valid, arp only for vlan 500 (eth1 on r3).
> 
> $ sudo tcpdump -i enp3s0 -nn -e  vlan
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on enp3s0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
> 14:49:09.548909 e4:b9:7a:f7:c4:8b > 33:33:00:00:83:84, ethertype 802.1Q (0x8100), length 524: vlan 500, p 0, ethertype IPv6 (0x86dd), fe80::e6b9:7aff:fef7:c48b.34177 > ff12::8384.21027: UDP, length 458
> 14:49:09.548929 e4:b9:7a:f7:c4:8b > 33:33:00:00:83:84, ethertype 802.1Q (0x8100), length 524: vlan 600, p 0, ethertype IPv6 (0x86dd), fe80::e6b9:7aff:fef7:c48b.34177 > ff12::8384.21027: UDP, length 458
> 14:49:09.549470 e4:b9:7a:f7:c4:8b > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 504: vlan 500, p 0, ethertype IPv4 (0x0800), 192.168.50.2.33050 > 192.168.50.255.21027: UDP, length 458
> 14:49:09.549522 e4:b9:7a:f7:c4:8b > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 504: vlan 600, p 0, ethertype IPv4 (0x0800), 192.168.60.2.33050 > 192.168.60.255.21027: UDP, length 458
> 14:49:26.324503 92:65:f3:ec:b0:19 > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 60: vlan 500, p 0, ethertype ARP (0x0806), Request who-has 192.168.50.2 tell 192.168.50.1, length 42
> 14:49:26.324525 e4:b9:7a:f7:c4:8b > 92:65:f3:ec:b0:19, ethertype 802.1Q (0x8100), length 46: vlan 500, p 0, ethertype ARP (0x0806), Reply 192.168.50.2 is-at e4:b9:7a:f7:c4:8b, length 28
> 14:49:26.325091 92:65:f3:ec:b0:19 > e4:b9:7a:f7:c4:8b, ethertype 802.1Q (0x8100), length 102: vlan 500, p 0, ethertype IPv4 (0x0800), 192.168.50.1 > 192.168.50.2: ICMP echo request, id 44246, seq 1, length 64
> 14:49:26.325158 e4:b9:7a:f7:c4:8b > 92:65:f3:ec:b0:19, ethertype 802.1Q (0x8100), length 102: vlan 500, p 0, ethertype IPv4 (0x0800), 192.168.50.2 > 192.168.50.1: ICMP echo reply, id 44246, seq 1, length 64
> 
> on r3 i see these packets going out (so far it looks good):
> 
> root@bpi-r3:~# ping 192.168.60.2
> PING 192.168.60.2 (192.168.60.2) 56(84) bytes of data.
> 13:30:29.782003 08:22:33:44:55:77 > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 46: vlan 600, p 0, ethertype ARP (0x0806),
>   Request who-has 192.168.60.2 tell 192.168.60.1, length 28
> 13:30:30.788175 08:22:33:44:55:77 > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 46: vlan 600, p 0, ethertype ARP (0x0806),
>   Request who-has 192.168.60.2 tell 192.168.60.1, length 28
> 13:30:31.828181 08:22:33:44:55:77 > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 46: vlan 600, p 0, ethertype ARP (0x0806),
>   Request who-has 192.168.60.2 tell 192.168.60.1, length 28
>  From 192.168.60.1 icmp_seq=1 Destination Host Unreachable
> 13:30:32.868205 08:22:33:44:55:77 > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 46: vlan 600, p 0, ethertype ARP (0x0806),
>   Request who-has 192.168.60.2 tell 192.168.60.1, length 28
> 13:30:33.908171 08:22:33:44:55:77 > ff:ff:ff:ff:ff:ff, ethertype 802.1Q (0x8100), length 46: vlan 600, p 0, ethertype ARP (0x0806),
>   Request who-has 192.168.60.2 tell 192.168.60.1, length 28
> 
> HTH, maybe daniel or anyone other can confirm this
Does this help?
---
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -25,6 +25,14 @@ static struct sk_buff *mtk_tag_xmit(stru
  	u8 xmit_tpid;
  	u8 *mtk_tag;
  
+	/* The Ethernet switch we are interfaced with needs packets to be at
+	 * least 64 bytes (including FCS) otherwise their padding might be
+	 * corrupted. With tags enabled, we need to make sure that packets are
+	 * at least 68 bytes (including FCS and tag).
+	 */
+	if (__skb_put_padto(skb, ETH_ZLEN + MTK_HDR_LEN, false))
+		return NULL;
+
  	/* Build the special tag after the MAC Source Address. If VLAN header
  	 * is present, it's required that VLAN header and special tag is
  	 * being combined. Only in this way we can allow the switch can parse



