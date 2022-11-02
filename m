Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33794C43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 20:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8DXYy7UkYNzcmEhhWUTthz1PxY2bAfvP4NvK5WWqhE=; b=myQvyZlPE7nOrFJij/O/oUBwr7
	EvmXn7as9QHvRSkg7/4n8l30/BsewsK/NUSC+snv0+d2HcsoN9u7gpTm8gGiLu3wD53YB+r8pX3xa
	P4on8Ce5CbaR+ITaiIQspb6y6SMdbqkiHDwqDDJZZ7Vs2lI9zrRSc9goxYmCd/Zm28cbNZv4rmpQz
	QKHc13sTGsu51WUQcOf6tOrr94ei2odw0/exxXF8kS+CIA4XaTlVg6DsYchqvt6iDp0isISxHB2Hs
	uLcujodlMo3OgmrlOHXd6r+EdVsFsz/0vaY7d384v0kpfJc9anLu+SMsHZidJZai048XUe0iPgTFb
	osXnVQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKKg-00EGUI-JW; Wed, 02 Nov 2022 20:27:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKKS-00EGKj-14; Wed, 02 Nov 2022 20:27:17 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 137E766028C5;
	Wed,  2 Nov 2022 20:27:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667420834;
	bh=fZmCp6GC//Ez+eqVnIRyMQ4aiTeiqt/uRZgLEbjkw+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DusHc3ZSesVuWz83mnOzm/bWGB/aldbfjPC9qmsHCyiToSrX8v7ouNnIdpbswalZx
	 WhOKe+WPLFf5zwkfWE2vClfPviDljiqgYzVUJwVZpq+AqUitbatSlm2Ah9Sz7+9/kP
	 yshPql9Mt7OTTqNb0gJqDft/kLsSCckFzORJ2jv6V5pqRUqUAB+zKlUYgrfFd3ybQN
	 B5kOJPehckMlkHag4IQHR8MRfhYviHXyzLkw4h2GquA8/D4nW/Co+PwYM3aRRgpNna
	 9SNUg9mZpFD2n+yUc3wM4NGCSf7tNxgk0W65E8wWbMpLCLmGrdhRkY8Vs+88f9V7pb
	 +F4V3odMN3DZg==
Date: Wed, 2 Nov 2022 16:27:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 6/7] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6795
Message-ID: <20221102202709.rlkpuzlku7pweiuy@notapiano>
References: <20221101090116.27130-1-allen-kh.cheng@mediatek.com>
 <20221101090116.27130-7-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101090116.27130-7-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_132716_229800_3D2429C3 
X-CRM114-Status: UNSURE (   8.73  )
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

On Tue, Nov 01, 2022 at 05:01:15PM +0800, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Add the mediatek,mt6795-wdt compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

