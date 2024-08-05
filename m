Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0EAC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 13:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3inxYT+ksa7lrI4Lm1IyQBFlNDUDsfi+Hog2hTNw2U=; b=tHNWEDobXrLPRyFWJzuhIj/Pcb
	RtFLbKgZ+DyhMdKEP70rzWzZMgcUBAyWVEK9zIZYTZl17qcBeIXeI852SvGQalrqer1Zod3tDQaIR
	wffOBH/JwmuSOt/8Ur4q0L+nN2+JPRe+MTAYT2jj3i8TPLTarm/i+M0smtp1aPWXyxP6FUdatV2m6
	DRpix/qmIM2Rn7o7wvils/gXcJBQtEi/+VJc25vLLVJQiQgGBCChCTkxYUXlo3zDRK5z6ERNX+3Rj
	2DVv32KThvfoKbPm5E2GBderbmI9jqBp/VW2/RUP1KRBe916+LIKxWpQj5NlkIdUrvjYEuWdYtps8
	5E8uQCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1say6o-0000000G1DX-0VI1;
	Mon, 05 Aug 2024 13:50:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1say5y-0000000G0zh-1yzl;
	Mon, 05 Aug 2024 13:49:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 18E4BCE0AEE;
	Mon,  5 Aug 2024 13:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BE3C32782;
	Mon,  5 Aug 2024 13:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722865791;
	bh=QPoQ4fJd6e9uIgBhk+yzuw+yKMH7jJO4Kh8CWzgO0zA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcypCbh6bbp9sfBiutA3AJcwdlAn8JxuZIARaVZKUadSADyqikMOlCjTcAtXI9Vbu
	 BoGyUQf3KBF9nl13ZEIOMOOjbCFEShm7b65rKUejW+RXPVsQCplwL+AnHpavfd429O
	 FTAcEIIEPr38OC2bTOoDr/Kl+s/CXOjBWAI66zdKDtKtJLzvsKZ5T9LGYMiFZiD343
	 PpWjKMNIAf33RB4EmXc5g34J8NAWDyItiE2UfjZzWQP4Xxfka16x2ekrYBmhafIKD8
	 ttNNf6Z+ISVgVzytnCgEPajRGxPKJUkeOHsSh7arYgozoXMBFBY+uWY7i0lZWEc4rH
	 ER/zv7PpRLz1Q==
Date: Mon, 5 Aug 2024 14:49:46 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmai.com
Subject: Re: [PATCH net-next] net: airoha: honor reset return value in
 airoha_hw_init()
Message-ID: <20240805134946.GA2636630@kernel.org>
References: <f49dc04a87653e0155f4fab3e3eb584785c8ad6a.1722699555.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f49dc04a87653e0155f4fab3e3eb584785c8ad6a.1722699555.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_064954_704237_36E4FFF2 
X-CRM114-Status: UNSURE (   7.31  )
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

On Sat, Aug 03, 2024 at 05:50:50PM +0200, Lorenzo Bianconi wrote:
> Take into account return value from reset_control_bulk_assert and
> reset_control_bulk_deassert routines in airoha_hw_init().
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


