Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57432C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIcxCuXZ6cI3Y4pOt6cjjXcFIbaB6zK9xM164Dir++8=; b=lEcefs3cyg9qDV
	AeK3q81Py0THNX0muDMYQ3uBbDHzEWlbhWOOMRkTRcPUv2zPKTfd2jcOQCohnW50Xe8XeAMKjxiyh
	2vvPt3mCzo5r6qitOOsxgAMtg767L/7tZnN4bwlNup33Kf+iNe5Rj/aqKpNpX+jEVfJRy9xB5TPy7
	E0SaW2uiJfrpVOqHI8j65Y3nx+V2+j2AFzk0I/8XxTwSJwjpJFiVO7KUG1k3YbaGp+9WdU2UmPn83
	X5GDYuvwdJIltoY61+uV8av8x6lXEn7rqshY3zAZpaEsH2HU4EIMK9jEedwwJltDvGC5fHaNPpTGb
	k4Rqio3+fO9Fvk3MYlmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8Gw-009TVz-6v; Tue, 15 Mar 2022 14:35:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8GU-009TGZ-Uc; Tue, 15 Mar 2022 14:35:12 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 27D741F442FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647354909;
 bh=E3ukLq6ZcAq9PS5OHfpqQ3LKEZJgSt680BJtcTlPhLA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=O0TXtYSNxmt49cje7dGkaRV2m1l1WYGmbNUHT0zKQRF3UhQG+nD6lcet0hCN9M9NZ
 vPohtzBFiZ8cI/Ckflne5OLzy+t2ubD6v9HK6G1drGktLpAXt5JynjG5swTOdFjQic
 3V58KwmtAby4FMO/CNSfowXsrlix+vbEjPfIpkWWy3IHoPgtClruJKW8sAtu7aKs4T
 AD8YqW4eGiaraRbuPkBt/VyD8xXAy7A0heQ4pOlieDPIGVsWiG8vaiaR6PRAJ7aqNL
 WUvlj3r9tj4+KbZTDBNCCV8r24Nkp4I1jtvi0iHfX4U5C9KHUA5WdGrTeu58dlO2mM
 BnRgyLW29keBA==
Message-ID: <988150c9-ae32-bf86-195e-6b629bd4e469@collabora.com>
Date: Tue, 15 Mar 2022 15:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 13/21] arm64: dts: mt8192: Add mipi_tx node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-14-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-14-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_073511_174590_97C5DF09 
X-CRM114-Status: UNSURE (   7.44  )
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

Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> Add mipi_tx node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
