Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E2CC4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AwarvWj5WyHlzQ9gQlssZ3VM2E34GegAq9rLwrtR+YY=; b=by8MzD2nj1Q0s2TqGPY9D6Vz20
	9J97K2qDEKhEBQdikHJ1sPOwDaTlmh8pZRHFsmsdiFaARxr3N01UIl7h7fUiVHbzFKrVfAm/MzuJ+
	SYtNxGYJ5oxxEuIzLCN3sXxlEjraJ/WQqDiG2ADU2Gj5+xc+T+ZcGdi8k+W8Lx7MtoKeviGAEWiLm
	PQN/ys0yXI/lRiF/uxsCQdUidIUkSDomXnAL2NaXyhwXSBwskgq0NWiNfBvgp/xmazASZ7PsHqoYk
	iWGklTuqx1oXlG7wKY0B3KJt8bk6rLizjk+5YGmqliouncr1VbN7BxqQ5+eWhY3xcV4NNKsIvNbEt
	051iaE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWvL2-00000002cey-1Zi8;
	Mon, 05 Feb 2024 09:32:28 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWvKz-00000002cd5-0kuD;
	Mon, 05 Feb 2024 09:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1707125533; x=1707730333; i=markus.elfring@web.de;
	bh=GEntBRcn/VvV5CPwy8i6X54F9AV/5jvw0rbYXd4l4oQ=;
	h=X-UI-Sender-Class:Date:To:Cc:From:Subject;
	b=ovux59WTPEtWvqN8rRPh8tPJL/y2zUri9qeSupWxr7mTWII6DPCIXoTEnUM69zib
	 gI7LPQUVxjvCIuXqiIsbOIy0AXB0J68XnavX67heKWA7I6Cp7BPEShIPb9rfGl279
	 7bREACCY4YqZ99V84eGeX7J4QBZAqj0zdOHEUShVERwV8/qbQkMYYyT7zY/jdV2w8
	 qUFu5DNT8qs1WvRLlq6XTnxN2TGAthDBdnemf5aX3BWdq4ktsu/FnlZ0YGLcr5Nzo
	 6TjEtQQzu19Q3t8LJwBRIqV6xnsgDFpJVac8wpEuxi9xKWTtyYO5Ce1KthvfSUMyn
	 tPTdXnXAQk0B2bbbrw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRW2R-1rLBlo1cqj-00NcQg; Mon, 05
 Feb 2024 10:32:13 +0100
Message-ID: <2a4ecf78-20e7-4678-a67d-0d66956b07cc@web.de>
Date: Mon, 5 Feb 2024 10:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] drm/mediatek: Use devm_platform_get_and_ioremap_resource() in
 mtk_hdmi_ddc_probe()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WNiOKf02rYQX2wRHyD+44vgsxq4gvfzYMMnvPUEMljK8TxTVSZE
 crq19rcOVrfbBjGR4a2tr2LgwUdDKYHxZnfmOLYAwN7Q/U+6PCuurLhtYANurbla/ARGuuO
 EJRLtucvVTbdVD2WNcaEYmUGQzl8VgZJMsJ57eCz2srWUjfkWUv1JTFX6zkmehC+72rjhJc
 1KLOLVClOJ33TGxdHXMcQ==
UI-OutboundReport: notjunk:1;M01:P0:WOh8rUEyD44=;2uUXQdcmdakS8l1q5N6ORN+MzQd
 PTEI2vpWHlHk1lzz5qPwlhQR30W8ymGIbUmylBV2BFLL0S9+0rcNjv7ZCziWx9bcp7FttBn9F
 8ZqjRa3EvtkSzT8JIVQjRcg7HIXr82VbWOYyqLbzgh3xCYNYnoEqD0S//M75LE0DGP6rMvTDS
 5efmaFuiDm4WUY5MQ7zpG2ro0E45Z5Svh5Z3OIiTH7VTrfhhKd00a2OsO5GRk84wppABZqMlX
 c6AcmKZV1qPTW/IT736+BpZRSo/yWfv3YVvKfyqDszssPNBQV9+l11Qr228pF5W8B2YC3bck3
 RscinEKcvO91A2MRNCzSNmYOkbQMkwlfepYHAZ1bNjPLepwrFcX2aqPw/HXxNwYmSyIxd8U/a
 X3y1VaXg1z/qsw1KFry5vJeplw3izdgHnQG4h4Vs0ta5bnzITl+3JspE82oNSY4mdbfiJLiFo
 haUnWxAJcXmm3nlpBKNkK0Q/9FnJK64GbT+HHTwGC33RSxmdI5nP0qjoyuFF+0c9z6mCudfDQ
 vwxYXuFXqix6/VlVKuANKkNPdN6MRhQqltrGht+T2IxqfPYoECFQNotY5xEH5s3xlwX5UI9qG
 xXiFRGtaBQXbx7XhOqd/B3Q5elC+G+8NSu0tlWVgiPmoHoDgHZUPaFkaO3SufpXUrH1x8WNy4
 qzkOnMypTqSAz/jlt9YYBLgyqh9H6E/U5ZxOALCXYNxafNxJQxA1gJ8ShrMvNh8aVBLecyTPR
 ITVGwM3ZqbrVSepwy105IemQUkZKzlcXlH4q8Iw0Za1lEAzp6rD881qoBssa6z8vJTifmgtAI
 UE0lmtKqNNkpFxPzRSxAbUSEJWT5fgCDKH+H4LCarI6fU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_013225_514368_5E6E4A71 
X-CRM114-Status: UNSURE (   7.24  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Feb 2024 10:18:47 +0100

A wrapper function is available since the commit 890cc39a879906b63912482df=
c41944579df2dc6
("drivers: provide devm_platform_get_and_ioremap_resource()").
Thus reuse existing functionality instead of keeping duplicate source code=
.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/med=
iatek/mtk_hdmi_ddc.c
index 54e46e440e0f..52d55861f954 100644
=2D-- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -284,8 +284,7 @@ static int mtk_hdmi_ddc_probe(struct platform_device *=
pdev)
 		return PTR_ERR(ddc->clk);
 	}

-	mem =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ddc->regs =3D devm_ioremap_resource(&pdev->dev, mem);
+	ddc->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, &mem);
 	if (IS_ERR(ddc->regs))
 		return PTR_ERR(ddc->regs);

=2D-
2.43.0


