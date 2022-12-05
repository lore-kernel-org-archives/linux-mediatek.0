Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952E8C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfiHxataRYELBQlwPB1e5cfCg9ERdtvECohrh9QC/vQ=; b=wvpg/ndzU7EXql1/+U6iYfDIX0
	nRbyP6jb+ixpFSUUtm+vQKxfvRobhiydr50kUVZuz4ATgrvo6Z1jjLhyacVXimjw/U+2A1KGjqSBr
	oMdwrxcHXmoaJC8evKW09yu1QNYl19Tu2Gw0fxSKky5A27VvJmc0xs0NLZJFLHXLylV953ifyTP72
	xjhEAw8PChyKr3uvEkgb8TQuIfSCt59O7ez9SAE+07KMiAw1NnuOORj9tC6WPmHOcPjizglX77hlK
	IJPRw//hmjFMl+Brgalo/GQXGWhVkhZE0esY68HD+TCbtY1yyTfxtz14/IDGLif9+zrA3Pa+y1Wk2
	3qyGUWzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Ie5-00AZyF-IP; Mon, 05 Dec 2022 21:05:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Idp-00AZo7-MJ; Mon, 05 Dec 2022 21:04:47 +0000
Received: from notapiano (unknown [IPv6:2804:14c:1a9:3b3c::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79DE966015B4;
	Mon,  5 Dec 2022 21:04:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670274282;
	bh=VCvV+LMWWL4oBnWh4lUZLZS7cPQfDQuW5q3xLG4rh/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LQxJ4Aef20sUdkPWsixd3p2LtvnReiXvBv3FA36F7VAOh8X94UCzLl4ld1LhNd1EI
	 7eBqvzGcNSENej3qUCEeB4yWb/7Xk5pIZxuD3v6gcp9Pr0BK2D5LcP3ze4Ii/P4EH+
	 pdT1uhTa533bfrxjQ3D6P0u6eug+tJAYzH6thBpJBRYt1LdnsykscXM1m28K95hnt8
	 T5LLyKyQjBETdRUOxNDKn0CK77k0Oq9V4jRslRUmb4gZqtuCIw3n3gFRjyctAUmC1I
	 aZPK2CCvJZt1QY8YNsiDO5mTRKesVCGhSFkEXCrSyPp61aT0Ofsvbuv+zUPsaPw/AH
	 uZDzm5HVDGwTA==
Date: Mon, 5 Dec 2022 18:04:33 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
Subject: Re: [PATCH v5 3/3] arm64: dts: mt8192: Add video-codec nodes
Message-ID: <20221205210433.w3nbwmegcnvsyesc@notapiano>
References: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
 <20221128143832.25584-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221128143832.25584-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_130445_880072_348FB681 
X-CRM114-Status: UNSURE (   9.55  )
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

On Mon, Nov 28, 2022 at 10:38:32PM +0800, Allen-KH Cheng wrote:
> Add video-codec lat and core nodes for mt8192 SoC.

Even though the rule is to use generic names in the DT, here in the commit
message and title I would have called them "video decoder nodes", to be more
specific and differentiate from the encoder nodes. But the way you wrote is not
wrong, so feel free to ignore this comment and leave it as it is.

> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

