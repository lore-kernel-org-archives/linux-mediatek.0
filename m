Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76948CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Oct 2025 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMDvxc/6tD3YkJOwpDYjlkn09VUXh303IXyIaSE4Tpw=; b=D0SJZogAQODEEpXEIx51OBSevr
	OK6R8q4mSHvrYWiDgCPEXrmXcI8y8bmCCpQJmo42id1ZLMie4Xjwfy6aClLKUPHAGqeMCuf7Uo899
	REt3L/LpmPkkAEotwE46NHLYMirmzsfKSfHqBEd6TPnk8PkHdfU2emFEBUQrzKnzeAUA+kVy8sIBS
	R0ue9RSHz65VseTQV/RKNTQWuX0+epgpZlwY5nJq7VcKb+p5/tDMVqcstZ3gauy5Ana28U0uhAs10
	cEtLmVjDwr1vtON18YeN7wAbigdGKbPmsTB+eBUqh2rQd0K1yNqGznQqUB9LU1jBI+s03u58Vm9z0
	0iw+IxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v55P7-0000000DrrN-2vky;
	Sat, 04 Oct 2025 16:46:41 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v55P4-0000000Drqn-2XpH
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Oct 2025 16:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XMDv
	xc/6tD3YkJOwpDYjlkn09VUXh303IXyIaSE4Tpw=; b=B8A1aUXZTduHepLOE4EX
	tqM8HkKnwU8ZS8xh/cGLhLVf85AWgY9Ilpc4yOel06RKxIglTBi31d7qkZ3xXuTu
	IcHisfuqyGlbIOP7B2HxviHFnR7QK2qUojfNagsSJXjalkGuvAumlu0muDEPldb/
	NklhYADlNwVhvLLfu1bpZGLDEbpl1vZBexRGQdoaEoj/zzJd2RWQXO53/A+5Ph6c
	TtiXz8CtdPTfPP9QAUhuYuV/99BBqbkD5HbmtMA4KYkNwMYDuB0uVeWdNbmZZXVT
	f9VB+bWanYAn4BLU/ZQqE5cqzvNA2ZL2MEJKzXeXUUxSGwQWlCxtUmkAdZcw5k/g
	gA==
Received: (qmail 1089998 invoked from network); 4 Oct 2025 18:46:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Oct 2025 18:46:35 +0200
X-UD-Smtp-Session: l3s3148p1@w4MR9ldA7rqSRnW9
Date: Sat, 4 Oct 2025 18:46:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] i2c: mt65xx: convert set_speed function to void
Message-ID: <aOFPapyaC6FiYetl@shikoro>
References: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925210517.9873-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_094638_928272_C134B864 
X-CRM114-Status: UNSURE (   7.34  )
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

On Thu, Sep 25, 2025 at 11:05:18PM +0200, Wolfram Sang wrote:
> cppcheck rightfully reports:
> drivers/i2c/busses/i2c-mt65xx.c:1464:6: warning: Condition 'ret' is always false [knownConditionTrueFalse]
> 
> Make the function void and simplify the code.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


