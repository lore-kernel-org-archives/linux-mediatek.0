Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E27CA0EF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 09:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldliHNwmjVthPS25DXxnPDhZKu356HejM/lq5pb8N0M=; b=4q9bQ4OFlmw3EvHjfA5y6vrgRi
	q3t2K83moi9Qcdbfoz86mEEPZ+uZXhb4mxbcGDkmY/tcLLEHrYABGajA8oRhPsrK7KqlFQA+6eGZE
	LjG3K4bIrtNy1AshKWo7ai2geyOKGD0Mw11zPO+aU7FfvDHcvcvIr8SzMXmDbUXKOlbvul+yBO9B5
	SesMU8J6JDURHLT9K5ihUY5LkJrE4wvsnVCBi6WMTuWuQyoT51Iaz+PBxhOLoVymWMhe4D5DEI+Ij
	dND6gS0N97PUdqUQlgSADZgeAtcLC39F8lUhPcYFi0Ct+dm9Z7DMIeKIsefblainA3JO+6B+GO/NE
	eD5Rz6Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIli-00000009z7a-3J0g;
	Tue, 19 Aug 2025 09:36:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIDz-00000009scz-3D0f;
	Tue, 19 Aug 2025 09:01:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E52E5C5C0C;
	Tue, 19 Aug 2025 09:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445DEC4CEF1;
	Tue, 19 Aug 2025 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755594106;
	bh=ldliHNwmjVthPS25DXxnPDhZKu356HejM/lq5pb8N0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENHtZMCTGMtmC15HCNDd4P/K7Q1lX2HOzIXe4s3bSPcEF+QRVPp66UnAGTkZz1Z5e
	 wkVUDPJALFDtsxu6FJfxdD1SbPV6KUVfvfQreL8r+g+ulHhodtnh9SynJFwnje0v4A
	 eZfWOsPfNF04styNt/oqZdfkxWqQ+4CfZor6NILN1fmNmLbyGbDTAEKb8zGRS/hGts
	 jcUoIydxaWDCpYxS5qolCgNtoU9JSMMErTVe5LFZsZPyCZ8tdMxE/oQRMl/B8YSIUO
	 /02clzYtUp0BQhZNexJbHDiQrI+QlEn41MawZxCgG605Ocp2jGOcMnMKnejs6OoE/7
	 J7a0K9q3+AQrA==
Date: Tue, 19 Aug 2025 11:01:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nathan Hebert <nhebert@chromium.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 01/14] dt-bindings: media: mediatek: vcodec: add
 decoder dt-bindings for mt8196
Message-ID: <20250819-expert-airborne-marten-caea84@kuoka>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
 <20250815085232.30240-2-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250815085232.30240-2-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_020147_875306_8216CA5C 
X-CRM114-Status: UNSURE (   6.64  )
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

On Fri, Aug 15, 2025 at 04:52:14PM +0800, Yunfei Dong wrote:
> Add decoder document in dt-bindings yaml file for mt8196 platform.

Nothing improved.

Best regards,
Krzysztof


