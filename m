Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54325C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 23:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9IJeDwU4hJ1oGzqaUrRERhc1Bki5TWok37Xo8l0vZYI=; b=RukfWVocm9CpEah94atID0asLh
	dbvRRc9HjWiMQpukjengf6XFCdNbfRBAxWmmRuTNNz1c6i8I3o2rpLd+NlVZRZTPtErIDCkI2FBZN
	W6FEH0GMqnEJ3b4gL50yEw0GPkPG4zXwFvDKNbN/DKd6PVZUfOoedtqpahgntJILIGB78lRwxQf3z
	sejW1YJq1lq2ErVYvA49b7j4B/Ty8n+5rp/56BiV0lNcwrOtkQRlaCkGRTyfr8WmhUZt4MvgHlncO
	KUInBWZRLEjCU+d8tf+gF3qFnWtwofTvumqjwYiQtESDFyny1d2gYJl18C48dqWGCEIEuIR35S2EU
	nwocX+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6grG-00ENHT-DZ; Wed, 29 Jun 2022 23:12:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6gr4-00ENAB-N9; Wed, 29 Jun 2022 23:12:20 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ACD93660191F;
	Thu, 30 Jun 2022 00:12:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656544331;
	bh=HS3Kt0329f/B+ZtFOq/ujXFFz4n2v0LxjbObOAIfMA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbyxYuRJTfKNb7dA/9wo+mdwmC3FHECEFj0TyXA7cMqF6Q3/4hk3IR93Nyra5SScy
	 nlhQvDpxPhaIjBEa99hRyFKqAjlAdh0AawO5QR4uzndOPwMTjyalTbGzUvQBgK61ld
	 rSzd09GEOXh5DGTkuIM7oU67lH2B21vaapR4yy+FDxReBo5Z3n8vNzTWRzrUBosF2I
	 AI8M76DOBP/8UCGFFfxzRhwePa1//N0tDwZcPbB3moX0d4xP2vlqQHJiBXF0c+uCp+
	 ZSCSVGuU6H6KESYKaAz9mN5hCwKFZJ5dpEJnY/2DIXudx+fCNO/NBbCUpR6PtC0URe
	 1qjaj2u2ywnyQ==
Date: Wed, 29 Jun 2022 19:12:05 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 1/5] arm64: dts: mt8192: Add pwm node
Message-ID: <20220629231205.kgzvzqjyrh3xzgib@notapiano>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
 <20220629121358.19458-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220629121358.19458-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_161218_929022_1FBFEDC0 
X-CRM114-Status: UNSURE (   8.27  )
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

On Wed, Jun 29, 2022 at 08:13:54PM +0800, Allen-KH Cheng wrote:
> Add pwm node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

