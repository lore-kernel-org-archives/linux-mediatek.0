Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931D2C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgBUUPJCJx4db6NcGWZfupQyT6TN11efMqHrwknEu2Y=; b=IAHcg9QEnoVbRN7nJkR28Viy3a
	iIuU/Jc5SFE67BXJ/ZrgVMRWrcR8Lqo+xpo6fVrNrdqIgrSZ/eIEkWpR+59wjo0M5d84iE28E+WVf
	XkHXhJOVYgHlOCSv3w+ztNL2GpbnoPSMVWJiJGL7LqGDlLR9GxfPo949o+sX+t9Fe/N+iJBf5PU0P
	1P+7QWzQxC0atI+/hscVc8MqeTbq5v++b6Fz470Bt4O6bW+vLg5JBA7M0XXKLV0D5fgTPPq8D6f//
	g/UTBPEJcQdcgj5iv/xY5deoo+6y4DjFUKoslyVL3iIMz0Hx2VLZzR3bkSPBtD10gqZji0ve4SqhK
	UN3ny9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDa0e-002bSQ-2b; Mon, 18 Jul 2022 23:18:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDa0Q-002bA6-Rj; Mon, 18 Jul 2022 23:18:28 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C584C6601A63;
	Tue, 19 Jul 2022 00:18:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658186304;
	bh=UM4gBJ2BtVtD84duWT1ks5rNF+2B9D8ohiEI/ecjHAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyBw7ORsfV6wYz+uF3dMl9dfMnwLCnH4+eMBjvEW1L1CBoE5fShAwFfD/InMUNTfT
	 YSfkN8EZrUjOvN5xfhvbjXk6fyMwsZUL6BBcekKJkiH+JlgLIv+xCo+GNb06tVHkhY
	 ootcuQKxB9duhelQ9L2p1THTz2UGG3pTo29/Y+Q0uFzKCqjSUhbIFzOiWcCgx6YtMB
	 h3r0zkUHU5QsTvJx1j7MAxYrb5HGpxnq3PMYbx4aD6FVl8FhFtngT64jGG9yETf70P
	 FBxyOwlLKm6mcwdeTZBJK5yFR2OZqY6De96DVly4u52l7wxDr/CiLYgQRotxdxFj5F
	 P8OOq6tUfBJ1g==
Date: Mon, 18 Jul 2022 19:18:20 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v3 3/5] arm64: dts: mediatek: Add mmsys #reset-cells
 property for mt8192
Message-ID: <20220718231820.j6dxkd5hmfsi6vrq@notapiano>
References: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
 <20220712114046.15574-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220712114046.15574-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_161827_048476_05BA1F8C 
X-CRM114-Status: UNSURE (   8.01  )
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

On Tue, Jul 12, 2022 at 07:40:44PM +0800, Allen-KH Cheng wrote:
> To support reset of mmsys, we include mt8192-resets.h and add
> property of #reset-cells in mmsys.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

