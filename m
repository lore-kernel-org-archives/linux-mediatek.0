Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF00D262B7
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jan 2026 04:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k3pZHu8DJ2t2oF1SffNfcAw4HfGyb2BgkicPuL8O4aM=; b=lrtrcZwvf88aHohlzpePyxghXj
	hMRUX9XPC9y+xfWArizjP403YcMQG6c0Q5cqi+0ObsBJt9dz++jML6oHsLN7uBW+BmCeMj1e4tK2o
	5u2a9NOwRi6EH6w7vyA5lZaImSS1fvnP3uSfthxUr+I6ziBR9Zc8ZHZItz0pg+TR/qHd9D5XMHDF0
	28OmgbTBFABR2yVanPDoMDh5/Cv84dNoDnKAwBjnXaHEn3WYLUmE4yTLcaxDBLTIwu6yJhNWSSODp
	19KRJ8Da7J0enIX3OCVmsrathj6/tr5+RjYubcjNawbR0DN10zW1WNk9AGFdBEiZNmf6Xww3gkEET
	5uTIcyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viPea-00000004s3R-1Hzs;
	Wed, 21 Jan 2026 04:17:12 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viPeX-00000004s32-2CUp;
	Wed, 21 Jan 2026 04:17:10 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 1AA9644006C;
	Wed, 21 Jan 2026 04:17:04 +0000 (UTC)
Received: from [172.31.0.20] (216-160-65-116.tukw.qwest.net [216.160.65.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 25C3913C2B0;
	Tue, 20 Jan 2026 20:16:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 25C3913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1768969021;
	bh=ifJM+HDRnWuJodoXoiyZ/dhPb5YHnV+/zFCuyOP4vaw=;
	h=Date:From:Subject:To:Cc:From;
	b=gmk/WyQCy/H0xJUTsEREX3l33wShwaXUQBpoTIEbDNJBg2jV97n5hzPkzK0HRzC2q
	 L13lV+fjEMcIJhSGGwey79eVGiVF2mEIRARr7qTJZfNSnLQmS0eb7NdkTWwLbJPha8
	 8nWdlnmXF8WGwdzqq39ZIUbWMQknoigKnAEbna7I=
Message-ID: <3872e1bb-20ab-45b5-87af-5df5bb1507c6@candelatech.com>
Date: Tue, 20 Jan 2026 20:16:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Alex Gavin <alex.gavin@candelatech.com>
Subject: mt7996 AP Stops Beaconing after Channel Switch with 6.17+
To: nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com, deren.wu@mediatek.com
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 hostap@lists.infradead.org, greearb@candelatech.com, chad@monroe.io
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1768969025-FhbHFzs72nFv
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;at1;1768969025;FhbHFzs72nFv;<alex.gavin@candelatech.com>;74082705b292d2cf81c347affc1d2557
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_201709_636283_A179DE3C 
X-CRM114-Status: GOOD (  10.89  )
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

Hi there. When performing an AP channel switch using a mt7996 radio, 
6.17+ kernels and latest hostapd (both vanilla), the AP stops beaconing 
shortly after switching channels. The issue occurs regardless of band 
and notably does not occur when using other radios like the mt7915 with 
the same kernel and hostapd.

The following command is used to trigger the channel switch from the 
hostapd CLI. Running the 'update_beacon' command after restores the AP 
back to beaconing state on the new channel. Config file used available 
here [1].

chan_switch 3 5745 sec_channel_offset=1 center_freq1=5775 bandwidth=80 he

Interestingly, the CSA count matches the number of beacons sent on the 
new channel before stopping. In each of these beacons on the new 
channel, the destination MAC is sent with the first octet modified, 
which looks a lot like the CSA count decrementing.

For example with CSA count set to three (edited for readability) using a 
5 GHz AP initially configured to 5180 MHz switching to 5745 MHz a packet 
capture shows the following:

$ tshark -r capture.pcapng
xx:_:xx -> Broadcast         5180MHz ...  Beacon frame <- non-CSA
xx:_:xx -> Broadcast         5180MHz ...  Beacon frame <- CSA 3
xx:_:xx -> Broadcast         5180MHz ...  Beacon frame <- CSA 2
xx:_:xx -> Broadcast         5180MHz ...  Beacon frame <- CSA 1
xx:_:xx -> 03:ff:ff:ff:ff:ff 5745MHz ...  Beacon frame <- new channel
xx:_:xx -> 02:ff:ff:ff:ff:ff 5745MHz ...  Beacon frame
xx:_:xx -> 01:ff:ff:ff:ff:ff 5745MHz ...  Beacon frame
(nothing)

This has made for interesting 'spelunking' through the channel switching 
and beacon configuration infrastructure. However, I'm not confident I 
can come up with a fix in any sort of reasonable timeframe. I'd be happy 
to test any proposed fix and/or share any further information needed 
(e.g. 'trace-cmd' output).

[1] 
https://codeberg.org/a-gavin/hostap-confs/src/branch/main/wpa2/hostapd_5GHz-wpa2.conf

