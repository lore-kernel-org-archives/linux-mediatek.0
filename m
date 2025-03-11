Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A116C2BA1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 19:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOHZW6P7sV9pynXufGquMHort9ucvXfujgqP+0H7RWg=; b=oDHEIGWKE2IkeEsQ5mcY8/6ZjX
	SNX1PqUM2nOQF7GSGLzvuaJoNoC43XSFoY7XAb2H6vcVsQIxIol23UQYE3xq0ZUVH1T45hr/x4xBL
	ORjEQJmWXXnY2lOwyrC8VsNicraq6S1Ap/brfsLAjjEG2jHDojK5Bpm0f5S7+sQNffsEP5H0RLtZT
	1zPupy07jMFgllaJZcMmKrQdjgCS2c0HUJSTz5Nr+b7Hrrc2W2GVxeu+Sh1KKqzwunyosXJxLFAf5
	eEaOe6ioB+02YskHF4x0F4FsAmqJSi/RxBZhgUPCZ9CQMe1stRbc+zLQttRJyPmDCmJEfc5tPLuO7
	LGDyMGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5fo-00000006qOO-2xpe;
	Tue, 11 Mar 2025 19:53:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5XK-00000006oDp-3fel
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 19:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741722307;
	bh=2QZ5+1hf2x2oRIQkI4em1zNoU9lY+dMrOoGs/Ctv6KA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYROV39306iQpZ4v7jOCgFeyCc1GFXFQBy2yLxFlWEoez5cAFOULJHrEJOqbF8HA6
	 ALAt8IwHH+o484vtVn9kZHKGKT4KTARY1Z6dboZQZq96T6uq8CYG7NN9WriNMC1Qvn
	 7+dGXWWxSWhKGdYWo2TjKez8ESCpXdIg17CgPb218DJ/cdOGYMSKHIjN+ATD+kbzae
	 mPXhpaQDycGyvmrraSBljBoX5HfmVmlHqNwTyBtCoaY6Pmqa/8xBWC72+dd57eHVdB
	 ohi0C3fp9QKn+41M/S1ICKIYBygzEAQSA3v8RkhptaHkQwQ+e5Si7nce8unz9A2kkp
	 S6nUGrf/paXsA==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A80C817E1540;
	Tue, 11 Mar 2025 20:45:05 +0100 (CET)
Date: Tue, 11 Mar 2025 16:45:03 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
	daniels@collabora.com, airlied@gmail.com, simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: defconfig: mediatek: enable PHY drivers
Message-ID: <717b84da-f307-41e9-9dc3-67ea653cac5f@notapiano>
References: <20250311061703.16850-1-vignesh.raman@collabora.com>
 <dc659e19-c1ae-42d8-84c9-0d2aafa81fe2@kernel.org>
 <daa0733c-14e3-44df-8374-33aba6662813@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <daa0733c-14e3-44df-8374-33aba6662813@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_124511_101358_B106ADA5 
X-CRM114-Status: UNSURE (   9.43  )
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

On Tue, Mar 11, 2025 at 05:26:37PM +0530, Vignesh Raman wrote:
> Hi Krzysztof,
> 
> On 11/03/25 12:54, Krzysztof Kozlowski wrote:
> > On 11/03/2025 07:16, Vignesh Raman wrote:
> > > The mediatek display driver fails to probe on mt8173 and mt8183 in
> > > v6.14-rc4, with the following errors:
> > 
> > Which boards?
> 
> These are the boards,
> https://lava.pages.collabora.com/docs/boards/chromebooks/boards/hana/
> https://lava.pages.collabora.com/docs/boards/chromebooks/boards/jacuzzi/

You can use the Devicetree name to identify them in a way that's meaningful for
the kernel:

mt8173-elm-hana
mt8183-kukui-jacuzzi-juniper-sku16

Thanks,
Nícolas

