Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47337C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmMIF9UtpK71GeUELAky3Ot4H4LowAbqHEfM7aCt25I=; b=DuFmlq2/58aVYu
	lBJ9b5GzExeGcN9xNmQ+2OtFSNvQ5Dn953Ua6FYdnmws/4lZOURD14RO15UFCXTTXLHzmHTs1iBrj
	WfyyYdchZpP56tQqw2fkL7iQkFWG6ltu5QoH4Mnhcb0IkmygN80AUODZaihdvuOzCaS2dO5yum3g8
	Riw4FjvqtyW6tm84GHUVOqDIbrTjzqkEmrhU6gSEXKU5t82zpb8RSlZDuDfmvcoRgK4kX/KO1lswv
	wBmxtVRWULUK95CGgAA6i/wY6QW6mfv2SVPsR2NNZVWhOGyVTYtEtXOz9QRjMwv8bE3tyrpoPAEkp
	0vTteGwaIaV8z6/SFH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5Wr-003Lpw-3f; Mon, 23 May 2022 10:43:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4QR-002s10-2I; Mon, 23 May 2022 09:32:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 57D081F42D94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653298349;
 bh=7TQ62V5XbcmQui5rWwD8kHW14UO9LXcaDw1amgKSaUM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WHv2XvbeJfFJAlIFiFxuTNDmn8ZLfc3Y/RBFFqXPLIq+9aDlV2WU67DqLpEGVE2dm
 Hr8KOR7Aa4+Z5vjdu08OITd5VFG/VCRr1WZbCG9zWPyGbbbui0pPK5Mp9xhAB+xqUX
 WQZHSJolp9HDxO4c/D1AEixqpTqiCUHaABXw+L6AllD01MfDG5jtby7izrBCB3/bl+
 8qvpM6bsIDoRbQwfnTkpduUI0THnG4bs5AJUEhSeROI6eFS7y8Sql7QWinPGHr8/s4
 MVP0VhBHomSL3JkEfqvjbl1WqqjjvBqpvDrzrO2zOJERWVdLI8fQ9Yb5/E7Wqirdmc
 Hq2FbVsw1ec7A==
Message-ID: <926ec290-7644-4820-41cb-5bffb44e2ffc@collabora.com>
Date: Mon, 23 May 2022 11:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v11 1/3] dt-bindings: mmc: mtk-sd: extend interrupts and
 pinctrls properties
Content-Language: en-US
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220523074017.12649-1-axe.yang@mediatek.com>
 <20220523074017.12649-2-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523074017.12649-2-axe.yang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023231_315161_1AEEF4C3 
X-CRM114-Status: UNSURE (   8.35  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 09:40, Axe Yang ha scritto:
> Extend interrupts and pinctrls for SDIO wakeup interrupt feature.
> This feature allow SDIO devices alarm asynchronous interrupt to host
> even when host stop providing clock to SDIO card. An extra wakeup
> interrupt and pinctrl states for SDIO DAT1 pin state switching are
> required in this scenario.
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
