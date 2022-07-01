Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5464C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwgObUShWntWLsEK6RHKh/FUsOspoTQW1NB9vXgYLao=; b=zRGItd3iN33727JM1QFV1e3jh/
	LWJ6SeHv8R1mlWX8VYrQemR7qDAdpVAg2pUzUieMngzTMhfqnRd8TTg6JmHR1U/o9Wv0ducWtp0oM
	WuMCpF7E/XGpQEtDrjaZqTV+Q2/BB4CrWcq4XTZtZTs7sCZEUNNtVKbbFK95iju01FEvwfet0o9WO
	NUn5hWUFpMBvhP3ZYIQhn4mZ6dLzdKvm2PcllPQpVYygrL78UdbTrmfxvOCeRBleNKMWsLuYog1Ni
	YDN/9lzOEeAyamrKXGZYX0OYqz/zbCQH+gEMhnteOeQ04PwSfZGiDfI+oW5g8CfxVDPR49QWT64y9
	DY9d6few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PIL-007FuI-F2; Fri, 01 Jul 2022 22:39:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7PIB-007FrD-8T; Fri, 01 Jul 2022 22:39:16 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4CEE266017F5;
	Fri,  1 Jul 2022 23:39:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656715153;
	bh=l512ovihoT16rawAQAC0JAfcxBrLxSDWijkeeT4dNP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=orSkZEHceprJBLM8QC9GFMaI6o65leRGBI3I0DlfpaZdPd74/Y29wAP0vjRe5An+q
	 sjkKMEQ/t15snsouIGUwOeDpgKqfOIr9ROYN5uY6Q3rsj/mA7x6V9N1NJD6Nyxe0/C
	 UVLzaqz8MFKFC5/gHsK1GpF64ekU8W9sLQE9sl2KilRZUlN5Wqf3hnD/r/Z1rDTYEE
	 b5kncVGvRU/isu2jBWGA5l807MbsT2s+J9jSVN+wcjhbIZWVERCCAFcOWgZZtNDB3d
	 uHPquQUF5ejPQOJHsiOqZS1tQmYUCJp9jG8nDWEwy5RzU8VLEMXgCp1pz3At8fab1L
	 Z3QAVKxFcHRlQ==
Date: Fri, 1 Jul 2022 18:39:06 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 06/11] arm64: dts: mediatek: cherry: Document gpios and
 add default pin config
Message-ID: <20220701223906.ceyc2x4p2qyxfi4d@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-7-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_153915_470127_3CEF11E1 
X-CRM114-Status: UNSURE (   6.96  )
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

On Thu, Jun 30, 2022 at 05:33:11PM +0200, AngeloGioacchino Del Regno wrote:
> Add gpio-line-names to document GPIO names and add the default basic
> pin configuration to allow lower power operation by setting appropriate
> state on the unused pins.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

