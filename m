Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782A71093168
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 01:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jvothlz+wfPxedCpCKUTvZl8/DOXcxdI1a5GR5EJ458=; b=ecK7FD4Po+PWxb7JdHB6cDuFwn
	k9lPkb3ndQ8eQYD++TPOTfGRqJ/Tyh21McRzvll+UCfEYwT82vNL5ViWf3xl9XmFb4I20oc73XxoI
	rHfIbAi9jPh5HJeUl/jsa4vXAzRkHUqDGVG+9RDJL1Mg0gSTcXhYHI9I9xwB0Kt0bhNr5sgQ/DuVq
	hlJx5hgZLZ5kFALxQwx/6xsLBCdSfKuD90O0ylMjXJm6ILkc76WZZreiLMYlwJDRCYGWvUGEBMlHR
	jEoOO0sfUAdVl9PTFPkICPuRLG9Vdq8Q1hasnxgtnI9P4dhtahElowUDGqsdkxw+RL4KDb9WOZump
	7A2WyKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OVV-0000000BsfK-36bN;
	Fri, 20 Mar 2026 01:18:33 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OVT-0000000Bsf1-042P
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 01:18:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1773969506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jvothlz+wfPxedCpCKUTvZl8/DOXcxdI1a5GR5EJ458=;
	b=aTXykOmx6NOdxm3/0DbOt3iSc3DBlfrZdawMf96zUTLWbWiTaUArNTC4nMFDmw2TNm8QTj
	G8YVHuLQs3fU6nthGqCDFMOT2LgAKNnseVg/P2sr++agvvJuN9WszxQr1nn4g4rmcToKC/
	NcFIyUhTpvhS9CHaYXxldkiCge5EJb9Hrc0D18oN8DvDySCJgXnQeEV01bdzgpOycgDkIB
	jq12MqtyCaY8D43vBNfVwIZQplY2iH1MbWkJBw2sfAooHiQBvwwmJ6FE+TL/+ihiEyHhXh
	YApmEStehnU70c3I9+9nU8sz6g8EY+pTsaDB9Rv2WD/msdBmYjLT3oiZmDS6Tw==
From: Lucid Duck <lucid_duck@justthetip.ca>
To: sean.wang@kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	morrownr@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] wifi: mt76: mt7921: fix txpower reporting from rate power configuration
Date: Thu, 19 Mar 2026 18:17:27 -0700
Message-ID: <20260320011727.77939-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260319203854.30479-1-lucid_duck@justthetip.ca>
References: <20260319203854.30479-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_181831_647075_7D1FF514 
X-CRM114-Status: UNSURE (   3.17  )
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

Note for stable backport: this patch uses mt76_tx_power_path_delta()
which was introduced in commit 56e38675c5bd ("mt76: support power delta
calculation for 5 TX paths"). That commit renamed the older
mt76_tx_power_nss_delta() and is needed as a prerequisite for the
backport to compile.

For stable kernels that don't have 56e3867, a trivial substitution of
mt76_tx_power_nss_delta for mt76_tx_power_path_delta produces identical
results for 1-4 chain devices (the lookup tables match exactly).

Reported-by: sam8641 (compile failure on 6.12.74)

