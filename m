Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D70CC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 06:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhMQqSmSDIk86OkNhYxSYS1rmamG8syzt00HQJmRgKE=; b=r2o3aCH72GR+QKIU/PlSMBVzx3
	4ukRpT5s67+Hp3fbRKH79Ia5PAZ8O8+Zz9uIA5/ErnJgBiJ22SckKaeGatBW+D2HF4RzodZS0Rtym
	xZoB+/YWMCRT/nJUw+QQRMDHne2OCtbMCH/Pfm2cZWtXfzw+PdnvV5V699WMjbasGdNUoIF2lwmXk
	OsvYH6NsVIrmyLICUIMqWuqXo4DFQ23VzX0+xdSk9kpZKgOZzp4Q5m9/j0vQyEYfQ1FiydbSIubER
	JdRrNhnjmc8Qnmo0h+NfMaMRRWustSGQ0BX18r6LL2L1Zn+LO1jF3jJE4L1gh/v0BPKlApiyI4ky/
	s2WMZOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osHwp-0039lM-Bh; Tue, 08 Nov 2022 06:18:59 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osHwe-0039fx-E5; Tue, 08 Nov 2022 06:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RhMQqSmSDIk86OkNhYxSYS1rmamG8syzt00HQJmRgKE=; b=qljZ5WgTOmxOhQB/4P1n08yvsa
	lCC6ccbcCXu9EgFDQ0LYfZGGpYHCdd6xle7vX1Y6cybuICC4c72UslzMIyRl6S5cvDkbmca/YlJmi
	AUq7V3NtJ17oM1zjvnAnBWtnlyjZvizOoV1ax/IXq/Iz/b6wyHmJxOqxER7g3kKgqw98=;
Received: from p200300daa72ee1006d973cebf3767a25.dip0.t-ipconnect.de ([2003:da:a72e:e100:6d97:3ceb:f376:7a25] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1osHwR-000S8C-2S; Tue, 08 Nov 2022 07:18:35 +0100
Message-ID: <57e6257f-2ae4-def0-8580-2f00284c9e8f@nbd.name>
Date: Tue, 8 Nov 2022 07:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 05/14] net: dsa: tag_mtk: assign per-port queues
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221107185452.90711-1-nbd@nbd.name>
 <20221107185452.90711-5-nbd@nbd.name> <20221107204034.bwbhyhahku4m2xdd@skbuf>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20221107204034.bwbhyhahku4m2xdd@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_221848_509727_D64EA514 
X-CRM114-Status: GOOD (  10.81  )
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

On 07.11.22 21:40, Vladimir Oltean wrote:
> Hi Felix,
> 
> On Mon, Nov 07, 2022 at 07:54:43PM +0100, Felix Fietkau wrote:
>> Keeps traffic sent to the switch within link speed limits
>> 
>> Signed-off-by: Felix Fietkau <nbd@nbd.name>
>> ---
> 
> Do you have a patch 00/14 that explains what you're up to? I'm only
> copied on 05/14 and 10/14, hard to get an idea.
I will add it in v2

