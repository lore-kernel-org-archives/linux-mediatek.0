Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E27EC47DA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 02:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCBmMf3p3DAZrxR74pXAKTYkhFUMgzB/pz2nUvCbVVI=; b=bmN2JxP7FHPii5c/P+PB6Pl/xb
	aVj94RCDbp+/1yiFyqL2hTpCzZ5lD9CiTLhErHTxZAx7AHPK7a65IpOZd8MuHUAZQ2cVW6aQSsi51
	zehto0W4AaIGxnKSRH2El2Xs04Pk7NE1UG2b/ZpYMoqIOzBZPLNugXS+1eCKWvwdDendzUFWOOQed
	VVSNeQz6g2Uz/DGlM7Sh5CtFUxPlO309D+b+PbxAJcghjQubvYmiQ5PB3PyJor3SJJg//Eo4oGE5p
	vobdiCam61yqwzXnIrELV1zNOjlCs+Ly2ZRw9rQINerRk/mFW0VHt85f/vGUy9bJCRIO9OpD2NLrK
	lG7dfLww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdYR-0000000EugF-47sS;
	Tue, 30 Jan 2024 02:08:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdYP-0000000Eufe-1V8i;
	Tue, 30 Jan 2024 02:08:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AECD6625E2;
	Tue, 30 Jan 2024 02:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41EFC433F1;
	Tue, 30 Jan 2024 02:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706580528;
	bh=9rbN2HvYm15Z2jwGzV6r+HBEJq7Isl2UPLyDTEbxcjM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UBVG57rUvVFDePmvUcPAd+PIDQANfElIL1ePro+BBViUpKJ/HTkpE5y+oZ5Eukrt/
	 JEm+qIOOGnDf4jqxB0kqK0pwNOnwBMYtM47azf4GIKyw02aZWYbbo5ii6kTZ/xOr6h
	 XDK+vHOhHR34NJZowx5ckdxhcA6Fugqk1iJJsmIGwBtg9uOv+tV85O0BgrzviuGV2k
	 OskNhrEDxptrz3K75gqGAAq7rE2Zf10aOoKBQ8yI7BUIcsZEKuYQNsY2dGg7ug3q43
	 1/L811yqtyystB+COy/Ta3HfQP9suund893FsdIQa35x/kdQWOEnJ8XSDN9h8wKPiU
	 4CPcffBZb8jeA==
Date: Mon, 29 Jan 2024 18:08:46 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <bpf@vger.kernel.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next v3 0/5] remove page frag implementation in
 vhost_net
Message-ID: <20240129180846.28937389@kernel.org>
In-Reply-To: <65eb8581-5cd8-8759-d598-c6711608b0c7@huawei.com>
References: <20240123104250.9103-1-linyunsheng@huawei.com>
	<65eb8581-5cd8-8759-d598-c6711608b0c7@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_180849_480505_3F88755F 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, 29 Jan 2024 20:40:37 +0800 Yunsheng Lin wrote:
> Is this patchset supposed to go through vhost tree instead of net-next?
> As the state is changed to 'Not applicable' in the netdevbpf patchwork,
> according to maintainer-netdev.rst:
> 
> Not applicable     patch is expected to be applied outside of the networking
>                    subsystem

Sorry about the confusion, DaveM changed the way he uses the states
since they were documented. There were concurrent changes to the gve
driver, patches no longer apply. Could you rebase?

