Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82536C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Akty9E+4cwobC/kYyekXkzh/9JPXGz5SU1JwQ8OtfU=; b=DMqk4O/kKKREaqx7I/Bf6hjw/s
	g1XjI4/xWoGb+LsKfLi8w8dnU/wNRFQd4PojxnwAAQphZoOZeBKHuuXAdu3cQtDTeTuTAmYpMn89O
	DAx9ppkHmX2qMTO2Xx1AxVqyZGuxOOKGcXH92lqNsw+ZLMzavXzi27ZNJo2bkzg+wdjna5nEr2nQO
	x/cBIY9x6GhaWY7MNm/l0/KESNeVYKG+Jbg3CtGXidfuItD7/2rbRQRPr2zPAhkCpq/qNTUNglxy5
	Mx8Add0p/EVsDKBuC61WDgS11jppD/r132dpsNQy+b6CKvZryrmFLQjcliMMJt3cgZ4VmyRKOyJ2x
	y7d+QQ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27hh-006Tky-Dk; Fri, 17 Jun 2022 08:51:45 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27WA-006O2n-PS
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 08:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0Akty9E+4cwobC/kYyekXkzh/9JPXGz5SU1JwQ8OtfU=; b=nU3KQEiw7kM/xNShDAc8aV1N8q
	i7Ait6136VZG9uLOfQsrrkYpMrmEJu3SuNho2GalR6AwRVxF2iWCsKeM7eCcvYwmFtPVp0VwuwpNh
	0deOXzmvaTPElPbQr3BstPzQpQehD9aRjXfe3Ndo9c04e8q5U2kyX8TtOd/wKNu/tzpE=;
Received: from p54ae95bf.dip0.t-ipconnect.de ([84.174.149.191] helo=nf.local)
	by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <nbd@nbd.name>)
	id 1o27Vt-0004hM-WB; Fri, 17 Jun 2022 10:39:34 +0200
Message-ID: <b7e3006a-03a9-fad6-3f57-10aed678f211@nbd.name>
Date: Fri, 17 Jun 2022 10:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] mt76: mt7921: fix aggregation subframes setting to HE max
Content-Language: en-US
To: Deren Wu <Deren.Wu@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Eric Liang <Eric.Liang@mediatek.com>,
 Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <7f5145276d732cb4aebcbffd6fc4a5eb852dd3be.1655393246.git.deren.wu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <7f5145276d732cb4aebcbffd6fc4a5eb852dd3be.1655393246.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_013951_111223_3C7F09CD 
X-CRM114-Status: UNSURE (   7.44  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 16.06.22 17:57, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> mt7921/mt7922 support HE max aggregation subframes 256 for both tx/rx.
> Get better throughput then before.
> 
> Fixes: 94bb18b03d43 ("mt76: mt7921: fix max aggregation subframes setting")
> Tested-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> Reviewed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
When I made the change that you're reverting here, I used the values 
from the reference SDK that I got, and the change actually seemed to 
improve performance in my tests.
Did something change in the firmware, or is there a related chipset 
difference between 7921 and 7922?

- Felix

