Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CBAC6FA90
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xL/UzZPEdWPY8oTjVFeCU7cCZNfNaevmRSlmyljEU8o=; b=03cGCyPTaqxStV0Epqm81SHS4J
	VeQ89IFTI1crC41AFcq45PiOOodtsaBWKM/7WB+bFDi4cz3K+gYvvOVtYF0exf8xcysGOQv8MXYoS
	Pm5vhMxf1mqOGfkBii79KStLfS7OCNV5xyo51oXJ937lYyCEUHSY+4LPtj/B8tcrFfbnMb57EJj5r
	9w4Q4EY0KkJbWUQLa2TIkxGDYQEwv9hznzodv6gWkIknflFAJ37ad5Z+8LxqmvQ7Mh0IsiEx/prOu
	tDbUcArIkLcq6q6nHUOUT6OI2WQlH8iKOTLZdiA/KCq5Glbh/bLOFPNyrzNEiRW9WoBlDdoIPnNPq
	ajn186Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od815-009uN4-W4; Tue, 27 Sep 2022 10:40:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od80R-009tvm-2k; Tue, 27 Sep 2022 10:40:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C00C660225F;
	Tue, 27 Sep 2022 11:40:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664275201;
	bh=nZySNIOSSCHQniyQM0ZF2KCCHyUbR8adLdjAyM2pNus=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N2gvBzgoKqiDwhjGkqJL/lQwjftXO4SMlBxA7tI7+nAxVphpicb9eYLAf9RtN0HGA
	 kJQNHjTOcomqHrLboHsKAjt0qbZ6GsaaxtUo2PV6iZDEN1F4NPMQemjgBIXGbwM/D8
	 goszDPQhWBRwKQxZml8shk21lAhyOJQ1ZlwF2SDnieYHqxvwz39U29fqfttFZNQaVG
	 0O+GVJsVdxFFfmPiQuXObSFmDClleIxVHFMgZte7vBh4rU9jUFN0wdQt9imd3j/2Wj
	 jCiW7PhiATybdkBadXx/he+7sV2Ci2RD7KZvNj44gww7gY7wi6QRMeXZQVALALlluS
	 8S282qw5ufNlQ==
Message-ID: <48eac669-a407-e673-93fc-c7e6ef15110a@collabora.com>
Date: Tue, 27 Sep 2022 12:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/6] clk: mediatek: fix unregister function in
 mtk_clk_register_dividers cleanup
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220926102523.2367530-1-wenst@chromium.org>
 <20220926102523.2367530-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220926102523.2367530-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_034003_307626_B8FE2568 
X-CRM114-Status: GOOD (  10.67  )
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

Il 26/09/22 12:25, Chen-Yu Tsai ha scritto:
> When the cleanup paths for the various clk register APIs in the MediaTek
> clk library were added, the one in the dividers type used the wrong type
> of unregister function. This would result in incorrect dereferencing of
> the clk pointer and freeing of invalid pointers.
> 
> Fix this by switching to the correct type of clk unregistration call.
> 
> Fixes: 3c3ba2ab0226 ("clk: mediatek: mtk: Implement error handling in register APIs")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



