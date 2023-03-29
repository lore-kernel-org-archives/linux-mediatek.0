Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5DDC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 04:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3XmrRWj23D8uF2mMEgEMGr/TPQEZXw7BBCYlwpQ9f0=; b=1JgM3DrILcpCMbJuvW/5WrAyRb
	hI+q8Zj2nyfwm7Ih6/L4ATjxGZfkqhqRkitHtu42ATNLN68TcnkAZvdcP3AdMqj2JFaGTsUOXq6rY
	J07mzfBrs953QASWqoVz6POLttLN1txUBvzSdVzyPzzP/HtaNSWjNo/iG3JAdiflJpjuj84ES7Xu2
	dNkNCARJWFFCSAfR6iG2ABW8CpPBsN2dWCbM4DmSM13XXo8z8fSPNGQBg9ZqWe9d+x0Yog76nFX/L
	s31XbtigRro0ep/mrZVO69F99uhvdqiYwNRvkIJm5ESI29C/PXy65Jq1B7D6vKDjlCZuFbS25Lua0
	FznEy5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNDS-00GWpy-2k;
	Wed, 29 Mar 2023 04:15:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNDF-00GWlg-2Y;
	Wed, 29 Mar 2023 04:15:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3E2C4B81F88;
	Wed, 29 Mar 2023 04:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8988C433EF;
	Wed, 29 Mar 2023 04:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680063302;
	bh=OeZwGhdh1OhMyiKBDhpSCIDowglcrCZD9EdOvHs4euc=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=uSzeR7sCDnhf4k0KFCoVmxreYmsgU7LkeN3MdANZ3Z++Yrl4lZBXqmcOq0/1qGoYH
	 dnNJw5YysLkr92ae2gs7oc+qqCVBI7dZ03PvQfLpXFyPsZwuYs1JLL3SiOZ6GOeJhX
	 ZoO9kowVg5lYCoZTWxf/Y5eLVNILED0DxVSjJlDaWC7maen+Hzg9hvnqEZWg50Mx3H
	 6LNpwwB8CLkazqcf8BWE4jr+qMJvW/9GWd0ts91LOffixfAdwcx6V08sZbYShdgcr1
	 R4qxJh6W2zkAWr5qcMxYqWFHHNmzoJWO1NriwSQOA5If3XIuJZ75AWYdljD6Qu3Evd
	 NN9XT5jI8U1JQ==
Message-ID: <7cf9452c60f2b1c764b01a15a4d5c2f0.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org> <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
From: Stephen Boyd <sboyd@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi@etezian.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jerome Brunet <jbrunet@baylibre.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Date: Tue, 28 Mar 2023 21:15:00 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_211505_971614_017E603C 
X-CRM114-Status: GOOD (  10.21  )
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

The subject says 'spi' but it's actually 'spmi'.

Quoting Krzysztof Kozlowski (2023-03-10 14:28:43)
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it is not relevant here).
>=20
>   drivers/spmi/spmi-mtk-pmif.c:517:34: error: =E2=80=98mtk_spmi_match_tab=
le=E2=80=99 defined but not used [-Werror=3Dunused-const-variable=3D]
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

