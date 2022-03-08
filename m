Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC6EC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C81Ts+7RUY9zZugDhTb2VjM/cSe4A3iQBzOkzCSwJIA=; b=gG7TwtJQB2mJCl
	kqAEsz5yBq1ga4eFPMWmIjOT83cSlAwZC6DGf/CCWNKXpSvvi/4qcKiP+YH4ePExJXGPnzuCAre1g
	fkf3EnLqc1IBbWSTfTjr7Z7/R0iU5bPRV4FJJG5+krWKrRfACipQAH97aedp65zZTdKXeSj/MtguS
	k1WKCsvOFeV5lrrYIoh5IpBqfEkjoFEHgsyo+CkuZ+TxQN7Iu3s1OBQFSrmnBN3E3PWlgxb0Jsyfw
	mUvM2DsQy7qvAbPecRD4dTAwxYyyjy/aIHjr654O4I2c7C5x67a/VhMp5BaDClg1HgLqo97PBHzs1
	RAI2qqhEPb6BlgjEMf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRbkg-004xP0-S1; Tue, 08 Mar 2022 15:27:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRbk9-004xDF-8X; Tue, 08 Mar 2022 15:27:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4639D1F42FA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646753236;
 bh=+KTyWLV48d7i/EApNNdhu7mJxCc3pRmgRcAh4/tiV50=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Bj6m68MEkT7hIF+KvizmOcT5Jm6vDQZeIKM53yWR6J/HpV5QW6VMCQN/OuS2JBsJA
 32pZ168dZ0lIW5JdI2Ww7O3zB5Zh2owCGO8bGUZ7vxKaMZEclv+NLNTA4KWej/0Prd
 enaxPMxO1pbkeIF+8X3GpvkYYJC1328mP4x9r+pg7lDrHR7ej6GRnfOoLxqA7r04ux
 lhc9RKeiiGIp0umkXQRT8c2+zSvtaG4c6dyHyRK6pKVLwtY6lx1bclCxz7ktqrdXZ/
 ATZPI5vEXihBO/swQHMfF+qpyXeLyXASqbLFXe11ZPc8S75phNgSRf5+nKx25tp5of
 EVoSSCSOGWxHg==
Message-ID: <8e2b68b7-4532-b8d6-f803-3e4e2bca6a72@collabora.com>
Date: Tue, 8 Mar 2022 16:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 08/11] pinctrl: mediatek: paris: Support generic
 PIN_CONFIG_DRIVE_STRENGTH_UA
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220308100956.2750295-1-wenst@chromium.org>
 <20220308100956.2750295-9-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308100956.2750295-9-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_072721_533509_8F59ADF8 
X-CRM114-Status: GOOD (  13.16  )
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

Il 08/03/22 11:09, Chen-Yu Tsai ha scritto:
> Some of the MediaTek chips that utilize the Paris pinctrl driver library
> support a lower drive strength (<= 1mA) than the standard drive strength
> settings (2~16 mA) on certain pins. This was previously supported by the
> custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
> "mediatek,drive-strength-adv" device tree property.
> 
> The drive strength values for this hardware are 125, 250, 500, and 1000 mA,
> and can be readily described by the existing "drive-strength-microamp"
> property, which then gets parsed by the generic pinconf library into the
> parameter PIN_CONFIG_DRIVE_STRENGTH_UA.
> 
> Add support for PIN_CONFIG_DRIVE_STRENGTH_UA while keeping the old
> custom parameter around for backward compatibility.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/pinctrl/mediatek/pinctrl-paris.c | 99 ++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
