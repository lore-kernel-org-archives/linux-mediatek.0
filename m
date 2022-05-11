Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8550C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 05:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WUC3MhGNKCGqlPFCmPo0IE6gAlWTC/lEV4G9K6xJpv4=; b=eWj+2ZWzXEm7+8
	0SdYtBxbf39+pzFBOCOaa9JU1IJqIkPMN0Oub3osBqqMcNFt5CMftBN/ZCU2+fno/k8dkvKxpY0x9
	W3ifmY3U3gJ6LoNGtEyXRSRgi4L+wZTaRDIagDh/Cmp2Q0J9uvjZEQfLbHRt10M7MrHeK9AFOS/yF
	A1/62PHpNi7cykmQ35c+qdJJIzToHIzzOrKEf2HJ1/LVI7wN9NIGfB6cswTN2xy6NKw4ZENJV9k0r
	m2+r7Di26gWGSM72Pqc1Y8bIkGGjXp9095T9b7tGPyT4yRNvNfgr0hYeW4zHf+/3yjp6GRaVtpcIE
	V2v4Frg56zRFDPaVA6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noeXs-005Dna-6x; Wed, 11 May 2022 05:05:56 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noeXm-005Dlw-M5; Wed, 11 May 2022 05:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1KHuCmEjlgOiBzRGyizP/FHYHWqcewVx6BpX8+Zrej4=; b=Dq3tx9ac8TZO9AtTj5bjNGhKac
 d3KPoOIFgwa4uzLka8SdKY9IAbXYoKgatWn1jmjegjvJfcqo6ITqydRUNGKXSxo1b0d/E4kNl3lR7
 eye9EAj4rHQee63XqlAub4q1dRVisDZLk+ZU3o3vOb16v7JEgB6nBgSsbWr+MyAH7Uls=;
Received: from p200300daa70ef200e12105daa054647e.dip0.t-ipconnect.de
 ([2003:da:a70e:f200:e121:5da:a054:647e] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1noeXf-0002z2-TZ; Wed, 11 May 2022 07:05:43 +0200
Message-ID: <596e38fd-a563-b119-c541-0370304d299b@nbd.name>
Date: Wed, 11 May 2022 07:05:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] net: ethernet: mediatek: ppe: fix wrong size passed to
 memset()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: davem@davemloft.net, kuba@kernel.org
References: <20220511030829.3308094-1-yangyingliang@huawei.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20220511030829.3308094-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_220551_014976_512B19ED 
X-CRM114-Status: UNSURE (   7.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11.05.22 05:08, Yang Yingliang wrote:
> 'foe_table' is a pointer, the real size of struct mtk_foe_entry
> should be pass to memset().
> 
> Fixes: ba37b7caf1ed ("net: ethernet: mtk_eth_soc: add support for initializing the PPE")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Acked-by: Felix Fietkau <nbd@nbd.name>

Thanks,

- Felix


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
