Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C710CC10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 09:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5JtDBhzmiCYKFeCcbSGtbqGBoUAybbEuGC/hLArT4c=; b=r7HeryQbONsX1/GFdnxG7h4x3p
	TEIqGkWv3aAudTgwjY96k74WjxERGWS9DrWcBT8CgWqZbEwca7otS5vz0EgLtJyfanb+l+FkJAchS
	Prq9ZbgJuk0GXHgvI97M/WoeaEUu9iMJIxVoEyAclHiVbM0CrnzI0DmTB6wXZVMZo7Y/x1BD+4XyU
	Trr4KbVmS7W7oNGluGtcGGICmzIGLWanz2enoJ0sxgQdDukDntH6RQ2E76Q2JfYnWG3VNIv4bNSzo
	Q2Z6/G58ky0WjL+URRCC5nMnmdVrVLBU9hQJsCEffXJShXyTAaC7axuXf864aBP4SZWU2dVXxW0l7
	cK/A4bKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA6hN-00Bui4-H3; Tue, 27 Dec 2022 09:56:41 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA6h6-00Bubg-SC; Tue, 27 Dec 2022 09:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
	:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=s5JtDBhzmiCYKFeCcbSGtbqGBoUAybbEuGC/hLArT4c=; b=B97kKfoQET0Oyt2jzS6spXRM+8
	cxFwF2+lFIxzjjK9Ac9AbfmW7XMiyrPZKaTTjYu0qKmEq4ZaErxCCb5Ipx81PfEYKBN7VUMcO87Cr
	JZu72Bo8zT8nbFbZNGGfdH6Rvc/MhGhjNuzSZ3cQaZrCWJ1cUDTv7Xu2xuKdAbYXPyUE=;
Received: from p200300daa720fc040c81ba64b0a9b1e5.dip0.t-ipconnect.de ([2003:da:a720:fc04:c81:ba64:b0a9:b1e5] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pA6gg-00C1ck-GN; Tue, 27 Dec 2022 10:55:58 +0100
Message-ID: <9e4685a4-5dd1-9f7b-1235-30aebcc9dfd3@nbd.name>
Date: Tue, 27 Dec 2022 10:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221123095754.36821-1-nbd@nbd.name>
 <20221123095754.36821-3-nbd@nbd.name>
 <20221124175410.5684-1-alexandr.lobakin@intel.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] net: ethernet: mtk_eth_soc: work around issue with
 sending small fragments
In-Reply-To: <20221124175410.5684-1-alexandr.lobakin@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_015626_896061_63DCF042 
X-CRM114-Status: GOOD (  20.12  )
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

On 24.11.22 18:54, Alexander Lobakin wrote:
> From: Felix Fietkau <nbd@nbd.name>
> Date: Wed, 23 Nov 2022 10:57:52 +0100
> 
>> When frames are sent with very small fragments, the DMA engine appears to
>> lock up and transmit attempts time out. Fix this by detecting the presence
>> of small fragments and use skb_gso_segment + skb_linearize to deal with
>> them
> 
> Nit: all of your commit messages don't have a trailing dot (.), not
> sure if it's important, but my eye is missing it definitely :D
> 
> skb_gso_segment() and skb_linearize() are slow as hell. I think you
> can do it differently. I guess only the first (head) and the last
> frag can be so small, right?
> 
> So, if a frag from shinfo->frags is less than 16, get a new frag of
> the minimum acceptable size via netdev_alloc_frag(), copy the data
> to it and pad the rest with zeroes. Then increase skb->len and
> skb->data_len, skb_frag_unref() the current, "invalid" frag and
> replace the pointer to the new frag. I didn't miss anything I
> believe... Zero padding the tail is usual thing for NICs. skb frag
> substitution is less common, but should be legit.
> 
> If skb_headlen() is less than 16, try doing pskb_may_pull() +
> __skb_pull() at first. The argument would be `16 - headlen`. If
> pskb_may_pull() returns false, then yeah, you have no choice other
> than segmenting and linearizing ._.
I looked into this some more and spoke with people at MTK. It appears 
that in principle, the DMA engine is able to process very small 
fragments. However, when it is being flooded with them, a FIFO can 
overflow, which causes the hang that I was observing.
I think your suggestion likely would not fix the issue completely.
A MTK engineer also confirmed that my approach is the correct one for 
handling this.
I will send v2 with an updated description.

Thanks,

- Felix


