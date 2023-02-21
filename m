Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F2AC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 06:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8GcsB1eaQBYk1j4Dgh5M26HPly22SkI1qk3kcKnGdM=; b=0A8RSVx3sIrFu56gclJdo35ld1
	4/t1K/NjxSqVKSCgEztuInxXvBYp5kvQ48lQRnNc7Qp9ILIhxvzlq+9a1KLms+zHOcWOrwuamDIaO
	pXpKF0fBTWPrevH6PoL75RsENVgEPUbQoYpiQzUiicNYXgtisYEq31SF/OL8GgzfxpD5ho+s55+Bu
	Up/Owm+/4D1ziWE7G0MXWCFQNr52vaDXPsHzCTMdCYeodVGWKyFIOFnItksEkHtvSI5ASxgsUi6HH
	wwCXLBEvdUdHArXDxJ1Qh1B5KPMi3n3odEXse1J7wRJVOofHWO4LZrzDerJ9eh5vDYpKBoIFFd0L2
	GgxM4QdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMAT-006kYh-6M; Tue, 21 Feb 2023 06:30:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUMAP-006kVU-UW
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 06:30:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA2D360EFD;
	Tue, 21 Feb 2023 06:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9138EC433D2;
	Tue, 21 Feb 2023 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676961013;
	bh=3/5RD5Q4QPKkxlWdnuEfpgaax2HZxVoeKycfaYgHhbE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bLa9LLY7T+Q8Fz8r2NMtHd8hAJd2QOmNDtresOYqQftZ/jAKMJgV9RQB1c+uWqCQf
	 E1P/9ITuKJ87i9e/pY1/LYyxtTIoA6AujwkO/8kVomsj/wU20/pNAzMWSMWe6ZVu7W
	 ZYbrOSOMfn75M8GlhZv/vcQfhHtzfScXlnjuRsvvj99gQ4RbMV9VzcOx6w4/6gJkzg
	 Ib3cUj6/tT2lD+AcdieRtDUseKR8cUV1wXAZZ9bHAxSYTNdPvq5xysvsT62JcQbMsv
	 gF/Op/u92praN8hm74FRMN+XKE1QDQW1Tab3+EkggX96ZbdDpqD5nd/ADxpEFrlZGx
	 wstt9tPISkIoA==
From: Kalle Valo <kvalo@kernel.org>
To: Howard Hsu <howard-yh.hsu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Ryder Lee <ryder.Lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  <linux-wireless@vger.kernel.org>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: mt7915: rework init flow in mt7915_thermal_init()
References: <20230221024317.3218-1-howard-yh.hsu@mediatek.com>
Date: Tue, 21 Feb 2023 08:30:08 +0200
In-Reply-To: <20230221024317.3218-1-howard-yh.hsu@mediatek.com> (Howard Hsu's
	message of "Tue, 21 Feb 2023 10:43:17 +0800")
Message-ID: <87wn4b34zz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_223022_060560_0712E104 
X-CRM114-Status: UNSURE (   9.45  )
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

Howard Hsu <howard-yh.hsu@mediatek.com> writes:

> If kernel do not enable CONFIG_HWMON, it may cause thermal
> initialization to be done with temperature value 0 and then can not
> transmit. This commit fixes it by setting trigger/restore temperature
> before checking CONFIG_HWMON.
>
> Fixes: 7d12b38 ("wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only after init_work")
> Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>

Should this go to v6.3?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

