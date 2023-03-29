Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7016DC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 04:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjSgXnnnZCRTDJ7CrT2szUK/VfrFrf/gwHWvPOVqcmA=; b=CyBI9BP6QL+cU0k+AkK8qa2JWm
	jW+FqeIIoh3BZF96Ui0HBVGaLolKPeSqFhmsIfwQxmJ/8luLQaEO1LGxt1/Je0xOXivB9UMcSYNUm
	uwHYecPsFcZRORevmPJf/7UbMrJhCthO1MK3OG9TClIMaTSAm3+9ZH3JakwflF2M6MKF7JPMdzgv3
	DXxZUVVWOli0cdjyxCw/SU4IRtqtPsNx9Vd314qFgtyf+keWNx81N/k4bcCRJVSRoJD05oGEFL7gT
	8J4slKN6XEMliyzPgreNjNysvsbH0nc00+i/aS8TqF9bHSPGOx5R17ABNSQddW2mA8t4kp9xPkseq
	a/xl8/Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phNFu-00GXPf-2c;
	Wed, 29 Mar 2023 04:17:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phNFq-00GXOE-30;
	Wed, 29 Mar 2023 04:17:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 72C8FB81E54;
	Wed, 29 Mar 2023 04:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBF6C4339C;
	Wed, 29 Mar 2023 04:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680063464;
	bh=eV+z6VEaC2dINI98VszrbaiHTFz32QNR/TbnF151vTQ=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=n7hHoT9cl4BahD9JFvPKB/aQB761g/fnk9KOSQ4o/z3XCcbxVkzNXykCpetV4JMcb
	 lKbnfFksoTf1RSJUMCOfr73CEq3qqeAiYcfo+/nxbj1z1H99Kn6MJB013kAVtoMaBj
	 q6hkpyychUIseBiT9ydWEHjqWN30KUhmPOcUGU9u1tLQThnCFsu1tqpWJ/6c7AtJLc
	 rSsNaKKxTzgFVIJ+4mFqu4ZmcrtFT/tPtmpU+nLtI20acClSmzkvUYLh31TBOS+V5i
	 9wiq+TfU8CzOWNnOCGS9p47Niz4LN/UokOEmy2Ffp+sqFnmgypTEgIuBbYAbmZ1Dov
	 G8AoiXz4invKQ==
Message-ID: <7e58e5c86bd602932b762f9364209e31.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org> <20230310222857.315629-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 02/16] spi: mtk-pmif: Drop of_match_ptr for ID table
From: Stephen Boyd <sboyd@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Andi Shyti <andi@etezian.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Jerome Brunet <jbrunet@baylibre.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Date: Tue, 28 Mar 2023 21:17:41 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_211747_124870_C451C55D 
X-CRM114-Status: GOOD (  10.32  )
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

I'll fix the subject.

Applied to spmi-next

