Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514FDCA1018
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 20:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJR8icb0OeqpIHa+VqTDwEH8IBNHXBx2qghCFPifuXc=; b=yyXMATq/se7R0k9s28dakaezVE
	jFAKNQvnjH03zSdLJOjStYfe/T2Wt9mJzKletNIDTkX00EJPvqO6+S2fkuzGSyxY18VcVrXAYw3DJ
	nHS0az/irF7QamwtceK/OU92502wSNTl+aWxc7d9Kdv4XdJRFeBsowyNaxIgQx9eYDzSpyaM73odF
	dwz/NjWFX2f7rPGEVG877ar9LkhYeM3xmIUhBJeETKtZBliFKGiGH2rXjeukdPi74cel8te6vuBAw
	NGGBlBP0ro4xCy+9kBxMik2ka5p1rtfd/87IijaINjOV1WIKt0ym+J1QTtqW9+NLV+3F23+yAFHw8
	+/XkKZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk8Zn-00000007f3f-2qDs;
	Fri, 30 Aug 2024 20:50:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk8Yt-00000007evX-1csX;
	Fri, 30 Aug 2024 20:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725050977;
	bh=4SRyLoc+6Jnsm4lYr7P2VfriYExb1FzEmse6oBg0hwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBfjpKs0awZ/lr4vBDJ9xv3h8mrfAL8VpaXBx+4a1qeciqYi65TzbprBmkMdft1Qb
	 8chxt/YgAiAdk7VgkqjFMdPdm7lIXOSOyraR46/00YGmHRQquDD6aChoqAwD+seXb6
	 DQBmgTBC6zHH8d7PqnCaJ49ffWJI+KTEml2xRIVw2OFgsWzTvOE2IYxKMsQKyJUrvu
	 wzWmU/vUbQ846O75hDVBAIT9BSYHeADgPCbmUanzMMdc0Nk+Cz4HUhJGKE/7Qb6HXl
	 0u8bbbkMrIoQaq7uVbJzx58YcX+DUDHTzV81mpJMfX8EpYrxR/p1YahlT94wQArfFk
	 KBmRAhs7jJgvQ==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B61D17E1226;
	Fri, 30 Aug 2024 22:49:36 +0200 (CEST)
Date: Fri, 30 Aug 2024 16:49:34 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Correct clock order for
 dp_intf*
Message-ID: <55fef13d-5eb5-4321-b506-1d8ae2d9f895@notapiano>
References: <20240802070951.1086616-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240802070951.1086616-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_134939_934637_6603AC99 
X-CRM114-Status: UNSURE (   8.54  )
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

On Fri, Aug 02, 2024 at 03:09:50PM +0800, Chen-Yu Tsai wrote:
> The clocks for dp_intf* device nodes are given in the wrong order,
> causing the binding validation to fail.
> 
> Fixes: 6c2503b5856a ("arm64: dts: mt8195: Add dp-intf nodes")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

