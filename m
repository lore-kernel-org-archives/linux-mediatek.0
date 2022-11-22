Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42557C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rkIIa47FdS0SsJdnX84P25cJLf/taO2XkXBmyE0rRY=; b=Xl2iBZlQYf7i1BsFybs8Gw4h2s
	tk+zqJQ71wy0pgjIMg6jdJXlYPh3QcuRuX8f3edzOAJgUy97e2ujOvpS0mzqFoj8RWDdLf0AJ2AFG
	u/GoI82DO0X01xx7SACwXGNgs0LJ1QNBp4sTaQ/wW/C/FOLoBWomc5hrq9Lid/TG9bkKmyxWeFS04
	7LfnWyDNbqVwC3kK2+gWjYSqRicg/3PNtRfydO7pj1yNjCYRPSIdKjZNGWSYNOgoLdvXLShaTQvD7
	dn/Nyw+PPrL+tBq5pe1JmIeoW/nj5hAn7+qQkojTbtwopskaaukJlIThxyJOOobh87xIAjWZM6A85
	SBQwfMGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxYiS-00BX9R-QE; Tue, 22 Nov 2022 19:13:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxYiP-00BX7o-AU
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 19:13:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EF51A61862;
	Tue, 22 Nov 2022 19:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1573C433D6;
	Tue, 22 Nov 2022 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669144431;
	bh=BzY1j8UXgqGOA0ByBqb0ncDAZprAVGgykyt3l+5pq3I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FvdSvM74+9X3hcBwXgI4uMB7rtGHGx/59I+4LvuYaEzYeio9txt2f3TqhjlaOu1QS
	 7oVp19yqyc7oL18KqtJq6SxUCfj78WcDRUqPqoSLmdOrkIXGILA4zZAWWC7jAA36oL
	 E+KC7hvE9IuDmWdlAu2bQ5AUU1C/BB7vIh+h8kVuc4XZQIMeGnnBCFAs3M4LfCh2Ao
	 RLrqoeiFMJTbShfnPg+WMW0d5Vkn6B89lEs2JcsPV++xnBCHp96UJCJ9q0bo1xn+N7
	 0MsyIpwptBpU69Kp/dnSEphzsnQh3sJkkAfxrHlLhO8ooGa/HLcqF3rXTm7IV0KYBB
	 8lxzh/w38exiA==
Date: Tue, 22 Nov 2022 11:13:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 lorenzo.bianconi@redhat.com, sujuan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 5/5] net: ethernet: mtk_wed: add reset to
 tx_ring_setup callback
Message-ID: <20221122111350.1f18aa44@kernel.org>
In-Reply-To: <0193456e-0acb-75d6-8c6f-be0917990708@nbd.name>
References: <cover.1669020847.git.lorenzo@kernel.org>
	<9c4dded2b7a35a8e44b255a74e776a703359797b.1669020847.git.lorenzo@kernel.org>
	<20221121121718.4cc2afe5@kernel.org>
	<Y3vrKcqlmxksq1rC@lore-desk>
	<20221121201917.080365ce@kernel.org>
	<0193456e-0acb-75d6-8c6f-be0917990708@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_111353_468598_7A228465 
X-CRM114-Status: GOOD (  11.06  )
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

On Tue, 22 Nov 2022 10:41:28 +0100 Felix Fietkau wrote:
> > That's a tiny bit better, yes, saves the reader one lookup.
> > 
> > Are the ops here serving as a HAL or a way of breaking the dependency
> > between the SoC/Eth and the WiFi drivers?  
> The latter. For a multi-platform kernel it's important that the wifi 
> driver does not depend on mtk_eth_soc directly, even when support for 
> WED is enabled.

Ah, I see, that's more legit. In the stmmac case it was just a poorly
designed abstraction. I'll try to remember not to complain again.

