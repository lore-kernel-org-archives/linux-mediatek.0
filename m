Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB40C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 07:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7NTUFHVo030/5DmKpV7vLDm9/G/wlfPlybWVDVPo0Y=; b=3R+/ahqn/jbckO
	4PJH+oTFh32qMJSF9FyyhqP1msIoIXBA+er1wHTBo0l/hxuhRhRiQkLdMZW60h/f5wMo2BTGl7ZfN
	MFxrV6SYu7g0+dOMLfsko4QOdOkea3m1KLGUYRlpnTp2kbRlpI5A6wWsmY7MFPZMqN4/gLOFISm7x
	l8x2Y63Uslu7DDk4uNAGEgPgwcXxSVBx71V8mU6jJ8rh8PtB5NM6aKVWRMl6VZWJUcCwS4mzb7dtW
	EjTX7b82KF7/DPfuZZeEx0QnYl5/T25AYG1uf7W/R9AssDKKhQUup1KXyeWqePbLzz2RBAKd/+n9z
	tX7IElU13Di8+hz2fbWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZUb-005eKu-4V; Mon, 30 May 2022 07:07:09 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvZUB-005eFc-PJ; Mon, 30 May 2022 07:06:45 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 7161E1C0B8F; Mon, 30 May 2022 09:06:42 +0200 (CEST)
Date: Mon, 30 May 2022 09:06:41 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com, nancy.lin@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
Message-ID: <20220530070641.GE1363@bug>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220509044302.27878-2-rex-bc.chen@mediatek.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_000643_998788_506E5803 
X-CRM114-Status: UNSURE (   9.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon 2022-05-09 12:43:00, Rex-BC Chen wrote:
> From: "Nancy.Lin" <nancy.lin@mediatek.com>
> 
> Add vdosys1 RDMA definition.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Your signoff will be needed, too.

Best regards,
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
