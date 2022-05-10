Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF79C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSZwRpJhuUJqdwcEUcMNcxIrkgsEOrQMWDHKcXEVUys=; b=rRz8TEsDjYTI+C
	+Ix6zS8fzLTZ6cgE6IwwnqPuvKAxScp41WgWHF3ePfcI3NHXRlY+G7z97rQBV2YibpeWMKhzQ2Lps
	trPC/8UHG7pGlO2TJFcoIv5s3pf+TFUJznxIsZuiWwLkp/uwXxZfdI92X9jBYHQNij1xV4XAOgIek
	HPa0BUDI/tRRjhVi83B+LpddaAR4YHqbG4mCwcy1sXJ7U8KhYBoHo7HxlOE1KZMokwPj1h5AoECU0
	ohShF9D0vbaH5A2W3gJL6ys0Gv8zB+1TKBoFVsqVe5nS91i1jhIyHi8DRuaIJrBnz/mCkeuTCZzO0
	tfc/odByL+nwA8kkU+dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noREE-002bjX-8M; Tue, 10 May 2022 14:52:46 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noRE2-002bg6-Lo; Tue, 10 May 2022 14:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x1CTARxTCcBRmbOr4xdk6jXfgn0v4S9YKk4prgzATyE=; b=UleV9ZTWCCUELqwT4Zl/Uyh1D8
 h/koyeCGeQ+PSs1/86JHD39OsfbdjRYromqJT11p00JgkD4b42U9LBVnjjKZ58nBoQPc2+J+U+kJR
 uX0yVmQsX/X7GqwdEQ9UZT5Bl7c69a5CH0LsBaf5A8DrLsVJUpLiQpWRlHHxHOxta6Pk=;
Received: from p200300daa70ef200fccd1f935f1cf3cd.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:fccd:1f93:5f1c:f3cd] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1noRDl-0000yY-5w; Tue, 10 May 2022 16:52:17 +0200
Message-ID: <5959946d-1d34-49b9-1abe-9f9299cc194e@nbd.name>
Date: Tue, 10 May 2022 16:52:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] net: dsa: tag_mtk: add padding for tx packets
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220510094014.68440-1-nbd@nbd.name>
 <20220510123724.i2xqepc56z4eouh2@skbuf>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220510123724.i2xqepc56z4eouh2@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_075235_008670_98F07327 
X-CRM114-Status: GOOD (  10.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 10.05.22 14:37, Vladimir Oltean wrote:
> On Tue, May 10, 2022 at 11:40:13AM +0200, Felix Fietkau wrote:
>> Padding for transmitted packets needs to account for the special tag.
>> With not enough padding, garbage bytes are inserted by the switch at the
>> end of small packets.
> 
> I don't think padding bytes are guaranteed to be zeroes. Aren't they
> discarded? What is the issue?
With the broken padding, ARP requests are silently discarded on the 
receiver side in my test. Adding the padding explicitly fixes the issue.

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
