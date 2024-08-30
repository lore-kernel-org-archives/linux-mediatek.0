Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA46CA1009
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 18:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8t6iywBMysiRw35agr1XHVTP2xF/4j8IVysH9cjVLvY=; b=ugD94tpSqNmsQR0Le1roDZ44cx
	uRdZz4Aa36z9jBXYU5ubUUQ+tlFaDjlPEVlIq7XFxwAco/x8tLMqGeDC+vbEk0LxZzBaDpgO7cJJA
	hHMpJnjv2Wn3EJifig1FfSF4dB80KYz2prjvVeJQLG3JtQoJ14/dfpmxPoXR5dZwqtJuu2ohV+lge
	oa297GFlN5uHt7DleZ0lWPXgjzPdP4zK0DaxTlzuTBLUgCi6VbUrDQIw+gErxu28x5PCA9asnbIUY
	d29u8KgvPwo9GN7Nliy17CNGHBxs9bDR8zL5+jOXBDdo7rLh3umC4Ky2x2vP/LVBwOwj+TQ6RgI8G
	J2UOWG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk6nh-00000007O4u-06tv;
	Fri, 30 Aug 2024 18:56:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk6mn-00000007NzY-481b;
	Fri, 30 Aug 2024 18:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725044151;
	bh=IHK+Ntd8fM5v8Ld8ghChA+2WvtW78d2VyJV67u5VSsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2iJPtbDNO7YHcg1+4daBeQVQMv0AHjjYygS1s7EJCHZP8HXJy9iWQzl+gl/7ICmP
	 ZCx4p66CN5fsbWJ6ga4UV42jcVG9s7mym1irLmgg2f9Hu0uywysYwiemK93yXuHq8J
	 njuK0n/zdgQWbBr0EBXW6F8h0AB5ALMltYrbOFBcWzojfwgtldTmf79tzj4alBJ9DB
	 t/Q2XYxBg6gALtFnmw7PlotW3LuKXQ68LhHncJk12IpuUgUOpxMEXZ9KYR4VhZRRuN
	 vb0mtQgFZgTupyBz3pvIwMp0UWlKlJyOQjqNQqHECLbfjOBvkLxpqp71rafgpvzwTC
	 MsXkvd7Il56MQ==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A06E17E10DB;
	Fri, 30 Aug 2024 20:55:49 +0200 (CEST)
Date: Fri, 30 Aug 2024 14:55:47 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
	jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/3] arm64: dts: mediatek: mt8186: Add svs node
Message-ID: <ccc4f1cd-c57c-417b-8f34-6b1e45cec6e2@notapiano>
References: <20240830084544.2898512-1-rohiagar@chromium.org>
 <20240830084544.2898512-4-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830084544.2898512-4-rohiagar@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_115554_361152_26379A11 
X-CRM114-Status: UNSURE (   8.82  )
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

On Fri, Aug 30, 2024 at 08:45:44AM +0000, Rohit Agarwal wrote:
> Add clock/irq/efuse setting in svs nodes for mt8186 SoC.
> 
> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Although FWIW the SVS driver fails to probe as is, as for MT8186 it expects
"cpu-big", "cpu-little" and "cci" thermal zones, which are not present in DT
currently. The first two seem to be a matter of renaming (eg there's cpu-little0
and cpu-little1), while cci is completely missing in DT.

Thanks,
Nícolas

