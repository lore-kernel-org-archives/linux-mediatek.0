Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC4CFC293
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uI4/AotH9zt0i7Wt5AZlyzAbbOPLKUt4OpQhUlaJ75I=; b=R419Mqn/L0sdSOMpnfa39xzBVi
	LbiF4AFsAquyXZ5G8PcCl80G1OGkIqv7VeQ6Hndm5nABPF6qGI03909X/Pm68jyb0vlNLINt5ddEJ
	+fMTJAMCX1iNyozK23kL7PNX6eMckaYGjH1SbFBEr4Emtbd47XYrh7BNG98MmJ+ZbIZnFcjz+Yr9t
	E9mxcNXkRWTdJ1agDORkD7hIYZtifqfI7SJC2/3KxMs/Qr/bJt0ZeRdgf1wVeu8Q7TxUBEHgdrZLM
	kq9Rf1EhTMgc8fWLfrCABOycwEZR8mOW9rg3XMXiYUuWYP82WiTOHvle2o968x71AB+PxTJQ4blG7
	LpgGZmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gM3-000000086vs-2ncP;
	Tue, 15 Oct 2024 12:08:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gJ6-000000086VS-2JF8
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 12:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FE8EA416E7;
	Tue, 15 Oct 2024 12:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B708C4CED0;
	Tue, 15 Oct 2024 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728993942;
	bh=UJKVhbeRIiOGF1J+mTwVp9aDBm90PBLdKOcf+W03cOk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kEnPS1QBblLRhq+g+Q5kBeYY4g9DpLs5zf+M6qp4t2G/K2lAZizIP21xGH8PZstFK
	 Lno2HjOFpNXV0iEAqCl4mFOUbEbeCNzPTcXPm1L1sGi9JF5n5Fx+hTGQdwTeEOiMrN
	 cYLxqNnCH6U4xVFMzJFgpkyVY2EFMqNtgWF/rYPfVpsI94Gkv9+TIuEOG6TN8gDgK+
	 gYLvbdhqYICM+HGBktwU19gskxo+DjndEcnEBkuwoXYloxOto8cKdWR/2wTK8Ixf1T
	 UNSsoIkmpbioPl6yV6/LD2WwN9o2iTe/0mnHTWSgF/+g3AfueDiip1v5XiunsINomx
	 3Czhb+WYpICFg==
From: Kalle Valo <kvalo@kernel.org>
To: Allan Wang <allan.wang@mediatek.com>
Cc: <nbd@nbd.name>,  <lorenzo@kernel.org>,  <deren.wu@mediatek.com>,
  <mingyen.hsieh@mediatek.com>,  <Sean.Wang@mediatek.com>,
  <Soul.Huang@mediatek.com>,  <Leon.Yen@mediatek.com>,
  <Michael.Lo@mediatek.com>,  <Eric-SY.Chang@mediatek.com>,
  <km.lin@mediatek.com>,  <robin.chiu@mediatek.com>,
  <ch.yeh@mediatek.com>,  <posh.sun@mediatek.com>,
  <Quan.Zhou@mediatek.com>,  <Ryder.Lee@mediatek.com>,
  <Shayne.Chen@mediatek.com>,  <linux-wireless@vger.kernel.org>,
  <linux-mediatek@lists.infradead.org>,  Hao Zhang <hao.zhang@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: introduce mt792x_config_mac_addr_list routine
References: <20241007071349.4626-1-allan.wang@mediatek.com>
Date: Tue, 15 Oct 2024 15:05:37 +0300
In-Reply-To: <20241007071349.4626-1-allan.wang@mediatek.com> (Allan Wang's
	message of "Mon, 7 Oct 2024 15:13:50 +0800")
Message-ID: <875xpt606m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_050544_681668_AB230C0C 
X-CRM114-Status: UNSURE (   8.51  )
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

Allan Wang <allan.wang@mediatek.com> writes:

> From: "allan.wang" <allan.wang@mediatek.com>

In the SMTP header your name is in correct format but not here. A
problem with your git configuration?

> Add mt792x_config_mac_addr_list routine in order to set
> the mac address list supported by the driver. Initialize
> wiphy->addresses/n_addresses for mt792x driver
>
> Change-Id: Iab64d938449380d88bf839ddf5e0f136728a391b

No Change-Id tags, please.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

