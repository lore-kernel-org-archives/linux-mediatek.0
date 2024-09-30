Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A9ECE8374
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 16:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=708im5y8i9ncxhN+tsIiarLhEWSJ/8Tnntdb5K+0CUE=; b=uYZb4wBiokg9ajdd4TtsxcaLwZ
	uCrSC1Ja1Z+10f/7goOSxKFP9B6WNWfIqFlhRDmwUSCcgYepWhfP7DIBJtsZb8l9DcUz8zzmebwHP
	hTm+VYqScDhsPd/zjMrWqYhw7saC6uEhuywuKBVhasyCR5Kjr0DaPfUeU0thNnfsGQ4CY+WcHW8mn
	QgSIcHV1ZxOArnBpL9pBOzB5YUS7y4lprty8PoInqp6vxw5JrIXiYz7AmEaqNvk33JQn2ivxGAaPD
	BZ1iLCmIJoM47bqO7Xm9lUPQ9esVqakvFwmp342LDw5dfD/EAo6IXllSeeYdbkEQ+o58lz4Ia3xda
	sVc0qXzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJkK-00000000JpL-3ia8;
	Mon, 30 Sep 2024 16:59:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJhY-00000000JQl-3X4l;
	Mon, 30 Sep 2024 16:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=708im5y8i9ncxhN+tsIiarLhEWSJ/8Tnntdb5K+0CUE=; b=HufAEtVdDQ2DI5kLog6rc/HZYl
	cyq2nfuXEbiioS/5dFOW5/cDDsP4xfbmh9zhvyQ7Mw78ITKPRyMMug/SlIGO+5bUV3ta1V8WjjFWB
	T+zpeAIDHJZKknsqj8IXrazhoRTxkjPdxf/CzAmBbaPSdXO2mpA/Sh5HcxHHqitImy3zB9t5Alh2c
	+OkiL7jAkNvUzxu1fgs0G6wXRNWdVN0eTgLt+heXsgTULodyQH1IQmEH2npEuxLgtbMYMXPQ7+dCt
	CORd4Xwpp0K8S0mGNDcl1CsycKgWWrnM10zR8ckigbyqbfE3uMKZGHzaghP8tB60L9N1eALwpCJc/
	Cxqo3+Ow==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJhV-00000002rqK-2kMv;
	Mon, 30 Sep 2024 16:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CA1BCA406C4;
	Mon, 30 Sep 2024 16:56:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4430DC4CEC7;
	Mon, 30 Sep 2024 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727715401;
	bh=smJ41339DXJMcFTyUmTXVKb/FV6x2vzFLgBVAC9IMvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UhXuE3K7tbg7qM/NRg1MrIViYVa0Awz/srh4rC1oMYFwuAI97JZTfoNufFXg0734R
	 38z2m5vxCtecOva9DV5J7JZJ+xZWIJHeDylmaGznqMxXxb8NvrlLTIsknJlqx2phq7
	 qdWQamFr7qs9Jo4WHqA/eMw+i5pI7JqbU1DirLgjH/tyh9ZFhhHUtJsJ/ShFeCvpfG
	 bIlUrS6SrS7Rgrv/LEkSSjLeEPxte2XxOpzujKZ15+a1dTn2fu7BsRskrdHMs/2CPr
	 FRiRaLY4+ODIoLKiVf9zbjF+3zDltgic9G9ztAHe0OzzyDOQLssaTRhVDCkkWT68Ud
	 xXiduAkRmNEAQ==
Date: Mon, 30 Sep 2024 17:56:37 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next 1/2] net: airoha: read default PSE reserved
 pages value before updating
Message-ID: <20240930165637.GI1310185@kernel.org>
References: <20240930-airoha-eth-pse-fix-v1-0-f41f2f35abb9@kernel.org>
 <20240930-airoha-eth-pse-fix-v1-1-f41f2f35abb9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930-airoha-eth-pse-fix-v1-1-f41f2f35abb9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_175645_895703_6F73693D 
X-CRM114-Status: GOOD (  11.89  )
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

On Mon, Sep 30, 2024 at 02:33:48PM +0200, Lorenzo Bianconi wrote:
> Store the default value for the number of PSE reserved pages in orig_val
> at the beginning of airoha_fe_set_pse_oq_rsv routine, before updating it
> with airoha_fe_set_pse_queue_rsv_pages().
> Introduce airoha_fe_get_pse_all_rsv utility routine.
> 
> commit 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

Sorry, but I think the above syntax is due to me not explaining things
properly. I think you want something more like. In particular, commit, is
not a tag, so you should have a blank line between it and the tags:

...

Introduce airoha_fe_get_pse_all_rsv utility routine.

Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
for EN7581 SoC").

Signed-off-by: ...

