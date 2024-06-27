Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC50C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 19:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ut0oPWXTKpEpNIQRDljHD/ZN9Y0rHdvRQJ9Vf8dXwRM=; b=M/03ds1kizHrzIUfYkD7bYBoEC
	rJov98oSYTO0fnwQnvRWPna2iGQ8TD13SgM+BiN+pH75Vq8771U3dlzE225QeU+WY3BHlivn4Xbem
	LwHDqucTzOq20eHM2oaI2cAkLJC7ZmcOEJSyrFJmMnLhToia/ZhvAlLszRSShX/SVocD5MNit5mMQ
	/5rJD6u1HqyzlkV+YCOo14g7pQGONcPLI+MIDHesEvzfyU4yti4QDdn3JjPQuLEYNCo1igC1Otei4
	is/GSk2bEsNhQ67eN7WLswxtXwbei+wtfPJxYryjClgCKaQBkE4VNOUmYUDg/HlBRUqwL23s07drB
	EnlO+53w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMvGZ-0000000BZ13-0Tbp;
	Thu, 27 Jun 2024 19:58:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMvGO-0000000BYyY-42e3;
	Thu, 27 Jun 2024 19:58:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21C2661FA1;
	Thu, 27 Jun 2024 19:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA1EC2BD10;
	Thu, 27 Jun 2024 19:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719518315;
	bh=S4yuJH7snXMiR4H/OcoIVrpDAluEUXsb8UuS8mgZbNo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AuvNfyC27xGCkLMmOnO0yt9tJuiixh4rKugekJ+ThS6gcDQNfPcQRzhmp0F9BK1F0
	 rqj/6KRf6AS8VV3xBsOVApfvH75zl3vTkJOY6j6CkLSSWet95WhHAPM1bxoyU4u9Je
	 8ARUNDWR/yLx4LkCq0rp2htOfOrUc9JNKo58FK6Jq2KozjWgpJtkjiTT3eOkxR8exd
	 WPfrhddRAX5A6FIV7udHiXBsjY/ctUlOHGU2/Sml8EgcBWcgJgykaUgpZnqXmGPDhN
	 +nTNHezL7DnzdHFaQOWZFOLh0eZPtGkRNBgiPfMtUqTO1gTwDd6D8mGTBTroX43mq/
	 i1p17HNpqZEjA==
Date: Thu, 27 Jun 2024 12:58:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Andrew Lunn <andrew@lunn.ch>, <davem@davemloft.net>,
 <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Alexander Duyck
 <alexander.duyck@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next v9 00/13] First try to replace page_frag with
 page_frag_cache
Message-ID: <20240627125834.3007120c@kernel.org>
In-Reply-To: <a051a277-a901-2cdb-72d0-716002593019@huawei.com>
References: <20240625135216.47007-1-linyunsheng@huawei.com>
	<d2601a34-7519-41b6-89c6-b4aad483602b@lunn.ch>
	<a051a277-a901-2cdb-72d0-716002593019@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_125837_124522_619A8914 
X-CRM114-Status: GOOD (  11.99  )
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

On Thu, 27 Jun 2024 19:16:22 +0800 Yunsheng Lin wrote:
> On 2024/6/27 1:12, Andrew Lunn wrote:
> > Silly nitpick, but maybe for the next version you change the Subject:
> > to Tenth try to replace page_frag with page_frag.... :-)  
> 
> Yes, it is somewhat confusing for the 'First try' part.
> I guess I can change it to highlight the effort and commitment behind
> the trying:-)

Sorry to ruin the slightly whimsical mood but if you do change it -
please don't include the version at all. Some automation matches
versions of patch sets together based on the title of the cover letter.

