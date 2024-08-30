Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D742ACA0EEB
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNfY4xYIdHu9AAeuuY7JT+xT4BphGpUuduUcomJr+Os=; b=2BlcburvTqIPnYVKWaIHrp+C8q
	pSdwnitCWenrqEr42/b4ChNednaepfnOVGJl6/GLZcSq0AQEvHkcHECCAilj84KU77JKAnt8Jq7Vp
	AAk2t6Fxy9JiRgWxYlRFgaxgOcvf2n8eaqDJSMm8RneVyKr3GBh6a/h8l3bYGoKvmgaKKdCvyNUN7
	NLHLufZft6zwNOXqkvvipHTTJ3Yl2mtXtNqF8xXTW0gpv6Gt0sUrlY3DoRz+Zkwl+UAnjVsnWU8+X
	WrdBR0MdPw70oz2QBpEEQ/6IE+FiIIK0iEt/3wOH/h5tRXhNxZQenH1XBRhh/EE058CE+SLpjUkmf
	Pellle9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwjw-00000005Gz9-1ROm;
	Fri, 30 Aug 2024 08:12:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwiZ-00000005GZ7-2R0N;
	Fri, 30 Aug 2024 08:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86216A44173;
	Fri, 30 Aug 2024 08:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA72C4CEC2;
	Fri, 30 Aug 2024 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725005450;
	bh=xYuItBQNMP96MzefUyk+q8WjjT2Y1ucVlzEXtvlMHcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OhNsIyEK3V2pCrW3tzn7S5hCisdmB5E7oCfj25Oo0JKAAK/Ujg7pBCHKQSugzFyQu
	 UFXzC0iB4ftTxjcrMOUucHRNlgoVhvUnxMBlfRlTJpVqbO6f3pcWSbuZYpxFd+Vv58
	 BpPAenoG07doPHMHViJIFhtwq6o09PH3ifnCqogtyn15eeDynet6mz08iSVdq9bF8u
	 IvmINMgaqU3z8r+lKg4E15douPhE9VqP3LR9fEY6GgF1RGoTLwQQEX6ficnww3IYA8
	 swmt4k0NWxFg+yOzlLsIq7D5pNZCzBsVZ38wZ3hNGjsy1G0jrHsOfgTreO5fEJ3hSg
	 hRnQD6f+DVunw==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
Subject: Re: [PATCH 00/11] phy: simplify with cleanup.h and few other ideas
Message-Id: <172500544630.434293.13040748970370817856.b4-ty@kernel.org>
Date: Fri, 30 Aug 2024 13:40:46 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_011051_729157_CE085CBE 
X-CRM114-Status: UNSURE (   6.08  )
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


On Mon, 26 Aug 2024 12:07:16 +0200, Krzysztof Kozlowski wrote:
> Make code simpler with scoped/cleanup.h/dev_err_probe.
> 
> Best regards,
> Krzysztof
> 

Applied, thanks!

[01/11] phy: broadcom: bcm-cygnus-pcie: Simplify with scoped for each OF child loop
        commit: e33525de6c3c7780564e0859ea6daef27309995b
[02/11] phy: broadcom: brcm-sata: Simplify with scoped for each OF child loop
        commit: a7f1dbf479d2a3cbf2a25bd186bbe15efd17d849
[03/11] phy: cadence: sierra: Simplify with scoped for each OF child loop
        commit: 612f9fcb435fdc9abd46b6339c9000cef6d323a2
[04/11] phy: hisilicon: usb2: Simplify with scoped for each OF child loop
        commit: 93cab07a02f08e4a2837dd22280b741ba0a7a541
[05/11] phy: mediatek: tphy: Simplify with scoped for each OF child loop
        commit: d2714416770ed0cecaf69eaff34d20817f2c3bea
[06/11] phy: mediatek: xsphy: Simplify with scoped for each OF child loop
        commit: 77df35acd182a23c117a937ffd6b0830a5428649
[07/11] phy: qcom: qmp-pcie-msm8996: Simplify with scoped for each OF child loop
        commit: 608863e1e600a4d91b00dddd6ff11eda1cbebaa5
[08/11] phy: ti: am654-serdes: Use scoped device node handling to simplify error paths
        commit: 29b44a38503856952862c710d47d933c0173fd04
[09/11] phy: ti: gmii-sel: Simplify with dev_err_probe()
        commit: 27a4046255377eb0faab5c41fd271b1acab1ac41
[10/11] phy: ti: j721e-wiz: Drop OF node reference earlier for simpler code
        commit: afd7aaf3ecaf1b247db1294ef0687fb3cb530213
[11/11] phy: ti: j721e-wiz: Simplify with scoped for each OF child loop
        commit: 0d5a213c2eae880e0f7f8bc252314bae194d68d8

Best regards,
-- 
~Vinod



