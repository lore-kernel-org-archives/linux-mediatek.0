Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BDBC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 20:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MF8PDn6vSxv5Dn/dgqraPQeJS5JQ6e+RVWCVuocKRl4=; b=swOu5x6aNLXY6e2vd2xirHuARw
	RCq2AFglb2eVUk4UzXp6MThbNtHEd/THbWnQA55jY+cnNHU832WpltTgmYTwTCdwERvqTs7D29bSh
	ydrL5c3STo2HuwqgcyZjErSMcV3NQNXAcfLbvXYKWEjgczhzMhY2F1y+m8S+foQEsJq1xEvE7isdF
	f4VllMlDaFspLrFkJ1q6SwlqKhNqL+f5Tb3CHONJm2ulDtXMLrrAujBR+KYFGSCL/x8DzawhsHyOy
	6JBlbexmKsJaRe7V+7892HY2cY4ju2sZPKeYvBBY3cd+Wh8Hmi36whAswkKz2iG0kyTrZccTArkw2
	VSSsEMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKLy-00EH67-CP; Wed, 02 Nov 2022 20:28:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKLn-00EH18-J8; Wed, 02 Nov 2022 20:28:40 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DBF9966028C5;
	Wed,  2 Nov 2022 20:28:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667420918;
	bh=/ko2vJsF1ZaY91iK2dzeVBA8AAnwCSYAbkzmOC5dXE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ox55qbXiWDZ8z/Q0hnEf6X3Fq68SbXltALyWJHh+OBiMpwXugYJYLaACA/0dVcbba
	 HgDkOHGmjpuYVsD4Kzdc/xIHO8x6VjjGlxfTOCpoX++7NJUbu7uZPsCOFKETyviDb3
	 hUeg6tZ2PWoFSiNY//PitK/eybzT8aC+zT5eoLQ6ADCBTVk+2DeflIJcBFfyJIhSlU
	 4n4ySVfwVXpSedCjdJCHawmQ21QWiDfoOkPrMw9l07Qp3f5NYKPONrHjvM3H+uduKi
	 Cq6PkEBGsA39Mzl1ccZzOZIIa/+wPSCJdHpiPbITWEO17sYEsMjjMiggF+nunHwQbu
	 tiA0poKnDa0Pg==
Date: Wed, 2 Nov 2022 16:28:32 -0400
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
Subject: Re: [PATCH v3 7/7] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT8173
Message-ID: <20221102202832.toh46ayaflnky33c@notapiano>
References: <20221101090116.27130-1-allen-kh.cheng@mediatek.com>
 <20221101090116.27130-8-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101090116.27130-8-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_132839_784633_731893F8 
X-CRM114-Status: UNSURE (   8.79  )
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

On Tue, Nov 01, 2022 at 05:01:16PM +0800, Allen-KH Cheng wrote:
> Add the mediatek,mt8173-wdt compatible using mediatek,mt6589-wdt as
> fallback.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

