Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76644C04A6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 22:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Du4ekhcEj8g7IZ7AzOhPv7PqxGa9JtdsMerbSFHNbkg=; b=XiKkJ3xxZGHKJQ9Hx+8n8evN60
	x3SdeahgxsgpsR1zqudNovdCPSBeS+SwT5Q4BbHMt7qI1OfokqQgNsH3Jc81/yNp7KGFl+G3Vo2vJ
	ixniHxlIbEMlsB5HEskMCUcO+liV2RYgoBoQdd9WusDyUoPYM2fajoCYLDdZP9UP8qMW1LjCaMJ6x
	lOmththdOBSYrLrb7y8V6hCRwLu/h6rGAsYN6z8q/BJ8rQIWj9LflaKVbBtOXP11IqNM5arx+H0Or
	oYEpnk0NkCVvkWu38Bv5EtER7ArAKIe4Zs4gFXEU9i64yOxzDPNLoT2s/MMC7ZKaZmu2sJK209unw
	b7TehUpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUDtQ-008omc-1j;
	Thu, 10 Aug 2023 22:12:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUDtM-008olL-1X;
	Thu, 10 Aug 2023 22:12:30 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2329D6607234;
	Thu, 10 Aug 2023 23:12:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691705540;
	bh=Cjoy1Kbx7vl3aNLQHQODSus0OKCsku5K0lb8+lPAifw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=anIuDNjv1Qfh8KjqWhnIaiSGJECftLfLAvKsOBzHvwM9TAWBDKk/3bSlkyLSd7f2i
	 rYt14YwiwykTWFYcPwR9/RcOJKEf9OYHLxFi70cCDnwf2VJu2SN1a/0QHl16m1nTue
	 QC4QoJejcfBjpaZVJ5E5W6SuE6T5lwz31SVOOwPpu1aNP2Q2FCCR233jNKhrgIEQhq
	 83NktOkjTFDYO25yhTXOSyD2UL0Tmd2Q07pWFKEkNDGds94MBSSBu+hTz9aePVAqAz
	 Bf9hD8y7yU7Kgc/geWObBPHah+Rn9tovRJ/PnqJQ4Xh+rLAsF7sTIHs2oXjeOswuyE
	 Y8nC4GDeJP6/w==
Date: Thu, 10 Aug 2023 18:12:14 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
Message-ID: <e053e9fe-5d88-44f1-bb24-280113665185@notapiano>
References: <20230720200753.322133-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230720200753.322133-1-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_151228_943716_B12E8085 
X-CRM114-Status: GOOD (  18.08  )
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

On Thu, Jul 20, 2023 at 04:07:51PM -0400, Nícolas F. R. A. Prado wrote:
> The DSU PMU allows monitoring performance events in the DSU cluster,
> which is done by configuring and reading back values from the DSU PMU
> system registers. However, for write-access to be allowed by ELs lower
> than EL3, the EL3 firmware needs to update the setting on the ACTLR3_EL3
> register, as it is disallowed by default.
> 
> That configuration is not done on the firmware used by the MT8195 SoC,
> as a consequence, booting a MT8195-based machine like
> mt8195-cherry-tomato-r2 with CONFIG_ARM_DSU_PMU enabled hangs the kernel
> just as it writes to the CLUSTERPMOVSCLR_EL1 register, since the
> instruction faults to EL3, and BL31 apparently just re-runs the
> instruction over and over.
> 
> Mark the DSU PMU node in the Devicetree with status "fail", as the
> machine doesn't have a suitable firmware to make use of it from the
> kernel, and allowing its driver to probe would hang the kernel.
> 
> Fixes: 37f2582883be ("arm64: dts: Add mediatek SoC mt8195 and evaluation board")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Hi Matthias,

gentle ping on this patch, as it's not possible to boot MT8195 Chromebooks with
the mainline defconfig without this fix.

Thanks,
Nícolas

