Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87852C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:50:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3528761050
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3528761050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mtK1wO5vEpLKv/HqAepfWuaqr3l0nWChx0fHJaCZGI=; b=g6Mt9Gl38vhaeC
	3z4gdFw508Ly7iEIldFK+Ss2e0R5Irj9ByKjiq13WhjG4dJwTB2OpTp5/tP4bnOhHn3BWieqeDtR+
	1mRt0Cnt1F+L/0fDuecQPNufJDzN7K0A/S2735wr5ev5vfOJWGm9AG+Tpp2R0yWiOfxoOU+XaQGLL
	oGBNcikRIrABSM6AfaU8u0c1xXOka/o2gTswurWUzWfwXdpoDSd0l6nWLILiZCp12I4gmclX4Sc2S
	7EepjZAAbzOvWWdozQdGR5IDG9Ly/Nm/sK9PuMcUjzhVsmngv8BNFc8gBvkNEeTaKaWPBWZ74qXt5
	ha0GKCCUsSD459bBCjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThqK-00DzAH-MN; Fri, 24 Sep 2021 09:50:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThpw-00Dz0G-V7; Fri, 24 Sep 2021 09:49:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F047461076;
 Fri, 24 Sep 2021 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1632476984;
 bh=q3ICXikkwH5UtUHIuBaYtEaF6KNhkxjPlvfIZGiRwA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cgH+5Q7PyPTUuMVaLzy7qMzzJGLDRCEHN356hOwH/tQ1nlMVTG6fdN9KLCnWYx2Ks
 9wyvcf2JZFPvkPsAVYM9dW0fxcV1nLQdNsRpN9XCmEcCkX3cy8aYcVauvXkoPlSKTN
 CZ78TJw4um1DP+kM6L8mj9/fxQs/3TlRdiaWDchE=
Date: Fri, 24 Sep 2021 11:49:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Macpaul Lin <macpaul@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: backport commit ("f421031e3ff0 net: stmmac: reset Tx desc base
 address before restarting") to linux-5.4-stable
Message-ID: <YU2fNiQh5or41pzT@kroah.com>
References: <20210924093719.16510-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210924093719.16510-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_024945_076662_CA220C62 
X-CRM114-Status: GOOD (  10.98  )
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

On Fri, Sep 24, 2021 at 05:37:19PM +0800, Macpaul Lin wrote:
> Hi reviewers,
> 
> I suggest to backport 
> commit "f421031e3ff0 net: stmmac: reset Tx desc base address before
> restarting"
> to linux-5.4 stable tree.
> 
> This patch reports a register usage correction for an address
> inconsistency issue.
> "If this register is not changed when the ST bit is set to 0, then
> the DMA takes the descriptor address where it was stopped earlier."
> 
> commit: f421031e3ff0dd288a6e1bbde9aa41a25bb814e6
> subject: net: stmmac: reset Tx desc base address before restarting
> kernel version to apply to: Linux-5.4

Now queued up, thanks.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
