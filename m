Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7903C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPJrtBzoZMwWXd5hxECGFRZibqZ1Ldwkk+RclCI9ziI=; b=BK1LLqF4j24WuP
	pT/uPnuOMWLfzOsvMlSZoloi37V1kRtRe/y9QsZrQNYjkNhd+n66RO1E1FZHCbfB1Iqbilt60nRUy
	samXvDaCwYNS14O+88l1GkbilieTvVanqwkXpF3XG6iTAzL1FXe0yNUYLXeet/SzUSqbc8qMVnX77
	bYUd4vB1Jw2JfDDY1VnX8dJ3v9TqglwQBkfX/E4FKwRV/LmCjSLVvO4Mq5E+7XcI7Iuj6lmt0HTs5
	wJlFzrL+B8s5jTG70+ZfoKnwEl4t8bKCsBOwPG0QtzygDDKRDXKSV0HipJN8JAuEjgzqAnyIu2KJj
	QtrR9aO0o62TOHMaDzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL3MF-00EasS-2C; Fri, 18 Feb 2022 13:31:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2nt-00ELb9-1c; Fri, 18 Feb 2022 12:56:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 372E01F46910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188963;
 bh=XW7+IsiJCyQvn/kGTZJ48n2E6mk8i5iYk8R0llcuSY0=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=koH7FGCFWaaF8QFokOmwuV3Y3jtv8pXSpz6cXv/ooDF2XHTSHGXIB9R1v2sdnpici
 axA2Rb8cbu18q/uwO1Qo9RHRPmN9Q2GKF9KSFXT2O7XPx2OmLRWuN28ft7cs21lb3z
 CfiVoAmkgaLzcXl95oDcvhzYeyG7xSpxXe3wtebfLrJAP2Z8U/7mBziDMq1/uanuHu
 OQ270UyJzOlx+Y+4Qexx14VIFH46RKTfTMdCazAAiIJogYWk9e6S6PV5OlYi/IkQ1y
 ysCC2Td5nMfJzhcBBBMkek8Oe+Ub/K7XjOcT80CGBKf2s4KFDYR8gZz8Deu1159W0t
 0mIbRYcgIBNUw==
Message-ID: <0a656d44-c9db-b32c-86f7-f1b5a80fbd30@collabora.com>
Date: Fri, 18 Feb 2022 13:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 15/23] arm64: dts: mt8192: Add m4u and smi nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-16-allen-kh.cheng@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220218091633.9368-16-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045605_290491_25F0AC0F 
X-CRM114-Status: UNSURE (   8.02  )
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

Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> Add m4u and smi nodes for mt8192 SoC
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 191 +++++++++++++++++++++++
>   1 file changed, 191 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
