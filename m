Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50945C67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 08:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rb2twMNv2vJBTK3T6OD7R//kGunAJk6vEx2yYo4MK0k=; b=UV69En8OFBaK2XsnS7qGk50fOI
	X3vwLeSPn9ppUhPQB/FY5+0pQNSPbS3KI/vovpIfqkVGokHMambyaF14+3/KAo+Lv1jQdjIjHyMlc
	Xe3BILphlyQgXoBjN9e5NMMKQQ+T4pBp6V32unmunR+kn4zK6XchzYT8AhaeUvdeaXlQYTX+HSDEu
	RfuM+GHzq2EuDubnR6JSxBgkNt6EVr4Xf6bA8iNztSSHJuY44x9Rz1TZM6moyXU+kkJ3t1nnU2xSc
	9qsD+OVtNgJA1bubCS0nFwdKHi9Vz2MtlkIxjF9IYyTLwLHnf8nnDdjlXqgx3tnnwq7zxfQ0a9Bl6
	zZuGMqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseXE-00000005qf5-2Pno;
	Fri, 05 Apr 2024 08:02:52 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseWw-00000005qRL-3YLn;
	Fri, 05 Apr 2024 08:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712304153;
	bh=BIJJgcRPxOpdBOEXKKQxyUXL5a66OYCr71+nyRJdHFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwKM9jOcy1Roo/sCfot9ELPKgmvolRaeCN2gfOZl0NyPLHqLR3482d0j99EitCR5k
	 oPOtRBhlup8UW+g35dgqXQnhNA0hObLqXoHtkxJVPouVbLIAaUMckLJQOk4MhlVcNA
	 LqPaW21xljHfZZ7A36SXEGqPx6qwBOHgi8qK2LcMRcIOP6ZJ01FLbeG3kVC2wikEEG
	 y07GthI5oxFe0kpDPxKYqfBrO6pjZSOfn6+EDgDDii8aFXFDUygev8avN5jFs69oF6
	 QHVtHqB8XdQ+umltX2au62D/14B8I79OEHWBhJq81wSqxIdvOKY6dO9xh14qnFJh0S
	 8c+NzSqfyTvcw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0C067378212D;
	Fri,  5 Apr 2024 08:02:31 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: usb: mtk-xhci: add compatible for MT7988
Date: Fri,  5 Apr 2024 10:02:25 +0200
Message-ID: <171230395357.52952.4394849084208817868.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240213130044.1976-1-zajec5@gmail.com>
References: <20240213130044.1976-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_010235_547217_B5AF3112 
X-CRM114-Status: UNSURE (   6.75  )
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

On Tue, 13 Feb 2024 14:00:43 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7988 SoC contains two on-SoC XHCI controllers. Add proper binding.
> 
> 

Applied to v6.9-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt7988: add XHCI controllers
      commit: 4ee20d528b0487f879f789e010fe2269bc1b2f71

Cheers,
Angelo


