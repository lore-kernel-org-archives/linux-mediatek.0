Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285DAC4707B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 11:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CSqO5eCZ27MS2fADuP5ThwfLEsbc8s+DlvDx2BBPL9k=; b=b98wlp1w3sTqIb
	HRJveECo1BjpigCngDk1MubKiMOuLk3X7T/Jzw8YSHNBuLElMDN78ZVz9hT6qW8lMLiWoxG6UY02w
	8dBbKtJxl9NIG0EadbWJ7Tr/ifF9kvMt4iqUl6ya2EHZjknXfImTJu4hqWf+c6lPTFnrW+BB/xYwJ
	2kdMTQM7kHT+MpEq9zwkT9pSwSQoz0RCQTfyYu7cfpevq0xGsmbvhlbt66RRMsrLZJiwwXXr8GmnV
	P3UjQaz5W17yZ7VHEktGxaHHxEJkh6OGLqZo7h14iPsW+/K3R9uozD7GeAA9Wiuj4rtLyzlmikcGF
	tXeAmq/bypKqngzaDxTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWmi-00BK5x-1x;
	Wed, 10 Jan 2024 11:30:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNWme-00BJzu-1m;
	Wed, 10 Jan 2024 11:30:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 36DB0C0004;
	Wed, 10 Jan 2024 11:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704886204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSqO5eCZ27MS2fADuP5ThwfLEsbc8s+DlvDx2BBPL9k=;
	b=Tzfpi8yuk+TImYcUywQQIvFFpb91SjmS/Ouw4VxsSkKzJYC8O8pINGX9ZiuhuFPx76S8MP
	U0Wi4gkUhaAaxwL5hPdzb50wFg23My4q65d4VZlhj4qID9HOZ7DiFQnQqnmVC+T89ofRpM
	dUA4DVECweXkce6hnMN8egguyQviZZSAmR+M6WthOF75YBd0tnqDw5ejsZAup7Ie11i1Uu
	UFNdQwyX15P67nNAfNJPcVnkTfGxZuXGjKmN28/kHW4fU8a6vu+mo1m21ASjCqVe/Lwm+g
	5Q+t4YJQJne3IgPPWP9IW8vFuddLKx4pyL0EGJGiuN/A9ca9hxoV1sIEj3FjNw==
Message-ID: <ad2df325-2a48-4a81-be13-be8230b7aa8a@arinc9.com>
Date: Wed, 10 Jan 2024 14:29:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-7-arinc.unal@arinc9.com>
 <20240104154241.rxjins4mi5zkbhia@skbuf>
 <f9ad000a-2e42-4ddf-89a4-9a3ff452dc4b@arinc9.com>
 <2793938a-91e1-419d-a011-850756177e31@arinc9.com>
 <20240109115115.yuct3yw4oy6ipd3i@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240109115115.yuct3yw4oy6ipd3i@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_033008_731018_CD0D3789 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 9.01.2024 14:51, Vladimir Oltean wrote:
> On Tue, Jan 09, 2024 at 02:42:45PM +0300, Arınç ÜNAL wrote:
>> Running mt7530_setup_port5() from mt753x_phylink_mac_config() multiple
>> times is being prevented which shouldn't be done. That's because of a
>> different reason involving MT7531. I will deal with this with a later
>> patch.
>>
>> I intend to put this on the patch log.
> 
> Still not clear why it shouldn't be done. Ideally you could come up with
> a plausible hypothesis as to why it's there in the first place, and why
> it's not needed.

I can't tell why it's there. Russell did analyse why it's not needed [1]
and my test [2] confirms it.

This patch is about removing the unnecessary setting of priv->p5_interface
on mt7530_setup_port5() which I believe I have already explained. I would
like to get into the details of priv->p5_interface and priv->p6_interface
when I remove them along with cpu_port_config().

That said, I will refrain from including the last paragraph on the patch
log.

[1] https://lore.kernel.org/netdev/ZHy2jQLesdYFMQtO@shell.armlinux.org.uk/
[2] https://lore.kernel.org/netdev/9308fa1a-6de3-490b-9aeb-eb207b0432df@arinc9.com/

Arınç

