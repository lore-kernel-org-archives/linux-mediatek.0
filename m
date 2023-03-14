Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27056C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 23:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6XvjhIDYIDKTTCPZ2orSbtqeATCt8sV/vuDdNjgk/c=; b=0mRyLiidYcUkk/m+O2hpPChSgS
	AUtd3VCbrAQjeJDnXotPMi6PLc9GOVKlTiPZd/ilmhnbgI/UOPYl/jcVx/v3B2zxQWJat76EzrMbr
	kDMVxIakmfHeKPFCS5V+SuH/Ayx91/OHMtUd4/YeUyq7KxmXaEm7IRtj5P5T/t3BIA84HJybgrk/y
	Xdd5NYReB640PwmZz4zJ+uKRlH7rQL7BYYCsAQTcL4O1IZAAMRG1INInPv2hul/bzUqEdNWiQM8pr
	1S1I1VBxOVOJFIEDvSJyU1oSCEkX3vMUiwENWWcipSWuyF2ozuXDy39NpSfnUuoHPWfmpvvo4nyHt
	ExG953sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcDmm-00Bl6E-12;
	Tue, 14 Mar 2023 23:10:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcDmi-00Bl53-1c;
	Tue, 14 Mar 2023 23:10:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 328B6B81BA8;
	Tue, 14 Mar 2023 23:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01411C433D2;
	Tue, 14 Mar 2023 23:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678835421;
	bh=3RW1LjUe9QdV4fvcdKvel7HMcg0PrtNvXvNC9faqtN0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sxwn7HxWl4vX6OH3+nN5MSfK6/+P4tAOoduG9Wvfd3hLm4xLRedTKHluOsuXEzsbF
	 c2/jXdVcO5ZgZSm8mlika/PL6x4jPgIk9ZbbyTuqdaz28QwF+vL5/j9ieb3VhLc7j+
	 IiSL6e4OuMLFaLKHRx62KT1qLzapVh3jUARRyoz9WnPKaeOd8hJsXF2EHCqSyuuHTp
	 bHLxNsXLiIU28cDa3y1dfuFyTChQ4UzoBZ7NEkxLWQ4Ddn6aLdy9CxaKCFIwHhAqOz
	 m98WN2IRSIc8H/RgFgmQs76GW2jTUflApV+YCgbbnVOPS8QZOfXTutfJ/RFcTFVy3d
	 KvdYpWVWT+ZlQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D785BE50D65;
	Tue, 14 Mar 2023 23:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] Bluetooth: hci_ll: drop of_match_ptr for ID table
From: patchwork-bot+bluetooth@kernel.org
Message-Id:  <167883542087.4543.16572103480151689650.git-patchwork-notify@kernel.org>
Date: Tue, 14 Mar 2023 23:10:20 +0000
References: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_161024_733852_E23E3391 
X-CRM114-Status: GOOD (  11.11  )
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

Hello:

This series was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Sat, 11 Mar 2023 12:13:51 +0100 you wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it might not be relevant here).
> 
>   drivers/bluetooth/hci_ll.c:769:34: error: ‘hci_ti_of_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/4] Bluetooth: hci_ll: drop of_match_ptr for ID table
    https://git.kernel.org/bluetooth/bluetooth-next/c/7bbc48103072
  - [2/4] Bluetooth: btmrvl_sdio: mark OF related data as maybe unused
    https://git.kernel.org/bluetooth/bluetooth-next/c/ab0fc9bd67ba
  - [3/4] Bluetooth: hci_qca: mark OF related data as maybe unused
    https://git.kernel.org/bluetooth/bluetooth-next/c/e93d2fbf47e2
  - [4/4] Bluetooth: btmtkuart: mark OF related data as maybe unused
    https://git.kernel.org/bluetooth/bluetooth-next/c/f19083c1bdff

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



