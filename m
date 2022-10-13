Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5529BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 19:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+k5MYUSqIuPUymMBqooxyLzm4lRS+ZChoJpW+a+xjE=; b=2wPY1xHQNoh1h2C2E5ryGy2eXy
	8tJB0ca53f7kPGn0ccvVrNhGVf4fO86K2s/cDgZeINE4aRXaJNLLn7TeBWiTj9QPvhI4CUcUPrjN0
	pHeFzgCGVlI8xPE9A0Gxmhok//XguwjUDDpVxPFC4FM1Wj259DhAoKwk8Jgep2jmJDOwKSJ9hWEY/
	g25do3FQrXikVyO5lBGhZOXWIElR6/57W00ezViVqSyXZz8hFmKtnLSztikxZGPBl3WWpt9MSAooh
	BXepTSrfvKMRDqtmi/YgifGQcRCcDskBydkMaWe/e1NJh0p5VZESHiQg0tQ9G5rW6BiBhiCLa1wN0
	83n6thkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3Qy-00CmZW-Lj; Thu, 13 Oct 2022 18:59:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj3Qm-00CmUo-RP; Thu, 13 Oct 2022 18:59:46 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 75CE0660236E;
	Thu, 13 Oct 2022 19:59:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665687577;
	bh=POzrOD83yEQNWuX0sbFvANNKRHVWS/t540l3lHJfAU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=maUXxcyiOHdRZ0qzaBWdFFy1AlZNZ8YUwGH5Gj9nXMyaEBapAU/ZJXR+DKAA8nFNx
	 kpt8WJ+9209x3S6r48Knwp2xMM8Arqyg0YYXXYIpEbSMKeaUsEEjZMksKITa4PZzp0
	 spK1SvgqPZF+zopUp2O/8EBuJwoKkBBhapSKSna8IPVB9HIeqvDNXJn963bgcW72Oc
	 XTkIL5z09ZZEYae4Uj4tMQDxhMkUtEEkFQXaz42nJYAIj/vlb1dJwtVXdNcQZORC3C
	 lWaOsyq1dcfpvhXJU5iY4FZ3vTFLRFoI78jHzEZ1oUnVxVhPyOSdBS4asVseUUwnb3
	 DThJ62qi/neyg==
Date: Thu, 13 Oct 2022 14:59:31 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm64: dts: mediatek: asurada: Enable audio
 support
Message-ID: <20221013185931.xgtkv3fjuvvzugrb@notapiano>
References: <20221006212528.103790-1-nfraprado@collabora.com>
 <20221006212528.103790-5-nfraprado@collabora.com>
 <CAGXv+5Fz1f2tzxJzYZDtSiXA5H84aF9Uz1vC-dF=ALkNUA3uKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Fz1f2tzxJzYZDtSiXA5H84aF9Uz1vC-dF=ALkNUA3uKQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_115945_115848_4CBB44C1 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, Oct 07, 2022 at 01:31:43PM +0800, Chen-Yu Tsai wrote:
> On Fri, Oct 7, 2022 at 5:25 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > Enable audio support for the Asurada platform. This consists of the
> > machine sound card, the rt1015p codec for the speakers, the rt5682 codec
> > for the headset, and the dmic codec for the internal microphone.
> 
> It should be noted that there's a new revision of Hayato and Spherion
> that switch to using the RT5682S codec. These are mt8192-hayato-rev5-sku2.dts
> and mt8192-spherion-rev4.dts in the downstream kernel.

Thanks for the heads up. I'll move the variable codecs out of the common asurada
dtsi for next version.

Thanks,
Nícolas

