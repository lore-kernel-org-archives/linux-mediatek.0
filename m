Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9395FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 12:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63vCcaTd1iu6aCn/LMT8D5J12vpka2PpWHsTRvlLvvk=; b=fGwrcArf4JpNc4
	ci5RqByIyGPF4YrEi5n8VuAe85JJ8tUk5EQ9p9nYOr9nRQbgW2fpCJvkynLhoJiDcI7YOHcjBoYwO
	36FO6hMeM7imF1sJTjvSfkC5wW6Ku3yNwkhiirgaPQBxO6po/OguT1ra7ReHeEUszHOo8cY0dWCSS
	PsIg+HpPWS7Pm/z4MKkrQaFMvBEPdZFf53gTEdPXaN1vFv1iEUaQjy/QngvuvO94z2KpEZiNjsmT5
	C9lG71wzcKGNNvHt50NvbYBBT+AmBRMsm+xhd3Afe5jI6MbPB+y9AlAc8HxXlAaw7jDqSrD3TGXTw
	UzpQDj6V6WD1zxNbMCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuD4N-00EwuF-Hu; Thu, 26 May 2022 12:58:27 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuD4B-00Ewpx-2c; Thu, 26 May 2022 12:58:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id BC0671F45606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653569889;
	bh=0EdiI4UQ62Oms7jhkCwXc010LL9bgAzrmJqjHMZq+s4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hG8tTMicAxc9tkcBCjll+kmxdI0KFOZiKfGF9HkmV4NeA+m4JIMBbQDAjbWgltFtR
	 7w1ziS85DOPFjNMrevW86fNGRfvTHsa5a5jhO0DvcGC1gn15X7lk5ECX33Qe7doS3A
	 GwniaDrRNj7O2brEBTb3egVMxLIZ7O2wznwCKm9Dt+izVDe+weTTO6JTK4O3bE4znv
	 CBuDXV+Ywa9AP5H5YfOpZXphRkUErFnCFDkxwYYiJy2bAmTK9if+z2lFBcJaGrgssV
	 aTa07hwR7m8JPTw4OKv3rQ/SFXrRVJlsQpfQkSDfiYt1cLU/3kmRBDv2mmyShIM8tf
	 YhV2HtQqPGpiA==
Message-ID: <3d2b130c-9826-1440-3ec9-28a44b767de9@collabora.com>
Date: Thu, 26 May 2022 14:58:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 1/6] thermal: mediatek: Relocate driver to mediatek
 folder
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, rafael@kernel.org,
 rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 Michael Kao <michael.kao@mediatek.com>, Ben Tseng <ben.tseng@mediatek.com>
References: <20220524152552.246193-1-abailon@baylibre.com>
 <20220524152552.246193-2-abailon@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220524152552.246193-2-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_055815_384228_EFDFD2E1 
X-CRM114-Status: UNSURE (   6.85  )
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

Il 24/05/22 17:25, Alexandre Bailon ha scritto:
> From: Michael Kao <michael.kao@mediatek.com>
> 
> Add Mediatek proprietary folder to upstream more thermal zone and cooler
> drivers. Relocate the original thermal controller driver to it and rename
> as soc_temp.c to show its purpose more clearly.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
