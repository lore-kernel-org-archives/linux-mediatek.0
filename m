Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C4EC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 21:32:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A733864F6D
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 21:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A733864F6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qpPenJgxeFUiWBj9rvOh1x/Evvo80sSKDOY3KIgn0OI=; b=hAURBCfwIbbLCMPuF/rVYcY+3
	XhjJCKdkSRZ4jkyEJAobDmQmq9PIn9CEd/pZ8DwIuf3dmcJypdFtWkueJYammuNcmHqBSkuLeGXCf
	KNX9fVMn2oyUWtLTjHPJXvpvsmnR1EYjWSYaq3uMA1tqECmhkX47fIW4dA6mDigynq0whJAqMxBJI
	xPY4NoSEZlOXq8ex3ErMdsYcg6bpq0e9qdFtePBjaT3lv0Ziz0JZs7W+JjxqdfwcwiTlDmQimtmpE
	iosjPHVVUlff23Ver3/P4QZM9EWkpjiqxfodOLiurGEgG7S96ZQgDQHPAfql/Z0eRRlR9LqE8xCji
	JaGR2u9kA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Pkd-0008QT-C2; Wed, 03 Feb 2021 21:31:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7PkX-0008PQ-IK; Wed, 03 Feb 2021 21:31:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9FC364F6C;
 Wed,  3 Feb 2021 21:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612387905;
 bh=ZpTMR0gW1LpUGwa7HIq+Jy13+2Nq7mPR/mRtLQGn/Tg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mDkqbswX2zNccGbpkomRfgKvEaP30lm10rDQ1x3GHFHpq817wb27WZF6jpDvEICoh
 cJXwwSLi6sOZDEDLwfVSo9m80V01qu/v9R/cblZJ9Fhpq71aAoLoNPCgbCsglxSC7s
 GeEhzND8sOkXsa3V5+V4kyxaPTL41dGtcUVf/VUULgwfrI+BehjQFRRrC9ZU1bwOLC
 WqizeGK5RW84G4uwBPin3e/NMsqv8oMcTVUhKz4z5zNnU8ZczLebcULHVxowJH2mTo
 cnDwITeNPt14PlSRZ0DaejnSfMh9urPD/Ix3hXHEL3CnE89YfwT3DuwuAtnnt8DeeH
 D/qQMy6bAS4yQ==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Seiya Wang <seiya.wang@mediatek.com>
Subject: Re: [PATCH v2 0/2] Add support for ARM Cortex-A78 PMU
Date: Wed,  3 Feb 2021 21:31:33 +0000
Message-Id: <161238497478.1983958.15302406214791753919.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210203055348.4935-1-seiya.wang@mediatek.com>
References: <20210203055348.4935-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_163145_763285_791DD3D6 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Will Deacon <will@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 catalin.marinas@arm.com, Jiri Olsa <jolsa@redhat.com>,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Namhyung Kim <namhyung@kernel.org>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 3 Feb 2021 13:53:46 +0800, Seiya Wang wrote:
> Add support for ARM Cortex-A78 PMU since it will be used in
> new Mediatek SoC.
> 
> Based on v5.11-rc6
> 
> Change in v2:
> Remove change-id in commit message
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/2] arm64: perf: add support for Cortex-A78
      https://git.kernel.org/will/c/db2bb91f2e8e
[2/2] dt-bindings: arm: add Cortex-A78 binding
      https://git.kernel.org/will/c/750d43b4a79e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
