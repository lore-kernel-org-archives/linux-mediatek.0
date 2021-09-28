Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BF3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 07:50:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F2A6113E
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 07:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92F2A6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCrzxEvSYfPxX1Sd2wJiajk1jfnXC6MCtq7KP4q2jBM=; b=LdXihBSH/7ARQX
	duo7QrKcbAcNnjGwGqCtiJl1pgojz/lli8+1Q4qV37nTpVFbWZVz4G2T+jsMEFcy4I1oDPE0AGqEf
	DCJ4KNoHF13wTqS5UIZEXsMrtKjk7HAGo0l33eHg/XArp+Nx8ModwjdDnXz0h8Lt2Fn8OfEtWF8P5
	aJqt3Xsn5XHe73a0IRiDdZKMxkwPDVYmgNVuvikz1b3bLEdKN5VoGgPspuef4PqjKGpiqoK7RqmnT
	MVtN3Uvwv5igXFZ5acH8cCt6QdlTaJ/8SclEFER3qWqtALR/H59D9wXpw5dU871FNntDwrnm8VgJY
	1Kq2a6tHMy5o13+j8yPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV7sJ-0064mo-S6; Tue, 28 Sep 2021 07:50:03 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV7s6-0064jS-Dt; Tue, 28 Sep 2021 07:49:51 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 46945580C56;
 Tue, 28 Sep 2021 03:49:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Sep 2021 03:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=W1gTysFUCeHCFA697MxJ7RHRRe/
 6ka4WMwz+p8/IZsg=; b=hEojnP22XPcGnEnxkVQa4yKcHzpbA5C4R8n21q/flzo
 Z7/18QIyEjpb4D70QOmLH6DLs8TgYkPB9aalehoUrc2OHvwD7pOUjJqdWgmh06w1
 C/GLUQqWEhxFjHepQmy0LC/DqFaU+cVoofEFfJCH4KnzF3fdwfVo6gINnv9MUwRa
 MItl2MCT7R0x5/kIIOzQNFdAyc3iQ9NJfDcakjdjuz6Nll+W89XPTH7jph9ziRKL
 TASTIKT+3hNbsIMQZBq0wcGiGvLQ3zjB3nxF79qSm+ofvhBPWZL6ecK9aHITirii
 DquuJLYoen09F7+KGfsp6dl6iSCf12+cbBBOwuqELGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W1gTys
 FUCeHCFA697MxJ7RHRRe/6ka4WMwz+p8/IZsg=; b=uRdWG9QqQbQi8PgDbRACtw
 kHFp5cFmNnlCIheCsKPpL5H8fLb50fqptgpfkDnfTSI6fvUJ1a1F26eWdumVY2IK
 q/4yJ8gjydEbODr+9OpuJA6oS+zkT+RKbwdrL6LHUQnZskPW/l2iEeeLDgIiQxLr
 O4mUP0NT82prseC1ijBDW8To/s8RqAO8YWkosl+crm8TDivCwhUYsND+eEbVaNox
 kuy9tGYWfqZruXpvLCUQkJ88RwSfNWMT8MdutRfjbwsbpd799Liw3trJY1AIxNut
 3NPuceCXSRjDYzyOxTyItRPa4A8psIbLOqkouoRHaHZe6KJzUL/L6h6huyjI0TmA
 ==
X-ME-Sender: <xms:HMlSYTgfgHC1NMelg3XOGENjEUQTCCwvwWorJsdmDfSG0FGWSdG3Ag>
 <xme:HMlSYQC3L6IKKzfdB9OF6qmwgCgA5MxPzhj8EnASQTo0f4MhgcbLj02Ajh3XJEb4R
 2fqPLI5BrfM5A>
X-ME-Received: <xmr:HMlSYTFDG5i2jDLoEeW2-0xcDtwhGAwzSCEq83zWPEr8vZHUk97I8vwQIlnR4xHDbAANeyhRwZk3o7HA7kGM5UzjLhDy6ztR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejledguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
 ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
 ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
 hhrdgtohhm
X-ME-Proxy: <xmx:HMlSYQQOCfaa1Q4DUgvAIgMU659QePbUU65zRvSepId7Linfkl6cAA>
 <xmx:HMlSYQxUZoTxx9bBPG1zkJna2lup90jKHc-j0HXUC5OOJQ3c_NJr3g>
 <xmx:HMlSYW4tC7MQnQ4J5RvzcN1MPkyFI7JlUf1WO7bndCGnJZCJ1mS5uw>
 <xmx:HclSYRS4PI7qTS6AGin8LTYIYAeF-m3qJu2umnsKShY-JX6Cb7RpkQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 03:49:48 -0400 (EDT)
Date: Tue, 28 Sep 2021 09:49:45 +0200
From: Greg KH <greg@kroah.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Leon Yu <leoyu@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, Miles Chen <miles.chen@mediatek.com>,
 Bear Wang <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: backport commit ("31096c3e8b11 net: stmmac: don't attach
 interface until resume finishes") to linux-5.4-stable
Message-ID: <YVLJGT7JAVc7rnBx@kroah.com>
References: <20210927104500.1505-1-macpaul.lin@mediatek.com>
 <20210928074349.24622-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210928074349.24622-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_004950_679338_51B9685F 
X-CRM114-Status: GOOD (  10.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 28, 2021 at 03:43:49PM +0800, Macpaul Lin wrote:
> Hi reviewers,
> 
> I suggest to backport 
> commit "31096c3e8b11 net: stmmac: don't attach interface until resume finishes"
> to linux-5.4 stable tree.
> 
> This patch fix resume issue by deferring netif_device_attach().
> 
> However, the patch cannot be cherry-pick directly on to stable-5.4.
> A slightly change to the origin patch is required.
> I'd like to provide the modification to stable-5.4 if it is needed.

Ok, can you please send a properly backported patch so that we can apply
it?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
