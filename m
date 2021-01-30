Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13D5C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 03:07:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C59F64E20
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 03:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C59F64E20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UIXv9m24i/Ku4EIwrJ9VJ5rfikFdSVQqbVxZPR6DpxM=; b=cR+N44qCuAE5DAyrH1u7gdDSC
	PQAct+AlpdXiSaMmI21kR0eTb111SLjE6reoLz21miCqV349t5bIAUYO37ZOlO8emwLa/buX1h6SA
	xdo9KhjfQsnbjvFkQIFPDRpbYT60hNJLfcdgBtMJUBVcAd2SCKDimr3yZITdB7ylXy19fDfj6y1V1
	Dn67cgJRSke3bU/CCd2/Iei0l5Mz6Cwq25lRmu1wEVUXmM1aJoPkRR6trjLLRMiOvt8/o6q+JAP1o
	eRKhnycS12A2MjpxSAAJrS/fqoJXLhVlWaTynYaF8+5100lhq5+XTmcY92hwLNpw0zR1vwNMaudxl
	HJLrb5W/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5gby-0000w5-M8; Sat, 30 Jan 2021 03:07:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5gbs-0000vR-As; Sat, 30 Jan 2021 03:07:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD03A64E1B;
 Sat, 30 Jan 2021 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611976059;
 bh=GejzH7uKnlSpHI4iUjEp0kfCfZ8IqzQMWAvcVg5TSAk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gqrUvrK0UjJKeqTISJCc+LnwYmRBXPiFdEyTnn+Ph645oX98/AzVLtWvH7HN0vfsn
 3/5nzfrf1Cwj7DyTXRLlNnlxLYHv2DQfPMtVDMF2cXRnAel5tvMFqWJp/0EoDb540H
 QXiqdy7phyM4u7+Bo9lZr+ElHgeuongOkM3L7GG3h/bNnFyjocdxYwlWoEo08oKlg+
 OfCGa4dlWtv9yWz96ndEVXDv7WRaHEKse/9+TiWFTmaSd6BhEKaIt3qEEpsiCn1uZk
 oM3p8ymKez6YmSok1bJdeimDqB97T/HTRrFv4uuQB4e1m3TfLPqbG215mKTMDYSgki
 Fy4nK8Bh70UVg==
Date: Fri, 29 Jan 2021 19:07:37 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Rocco Yue <rocco.yue@mediatek.com>
Subject: Re: [PATCH net-next 2/2] net: ipv6: don't generate link local
 address on PUREIP device
Message-ID: <20210129190737.78834c9d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210128055809.31199-1-rocco.yue@mediatek.com>
References: <20210128055809.31199-1-rocco.yue@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_220740_676148_756EEDD0 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 28 Jan 2021 13:58:09 +0800 Rocco Yue wrote:
> PUREIP device such as ccmni does not need kernel to generate
> link-local address in any addr_gen_mode, generally, it shall
> use the IPv6 Interface Identifier, as provided by the GGSN,
> to create its IPv6 link-ocal Unicast Address.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>

There is no ccmni driver in the tree - is this for non-upstream
driver?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
