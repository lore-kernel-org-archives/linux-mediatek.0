Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE04CD6E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVm15PaxchIs1JOy4ZUm+NgH+JoEUrYIUdKpKpKH4Cg=; b=rb8KxJPVpFPV/du5WhXPHbZLZ4
	gzme/G8SN+j6/KTbJZvgu08z2O7IcuvG2kHHJbmFZwAfSuJNHjwBUbfXFfDAWB6KmO4JfP2hjPqdB
	j1j4LyCyCEufE6ChyqnD1lW3kNIto65bV6jHtaZ15QFTY1V/Ohd+P+Nie0EwS5QvRVmkyYR+EBjRa
	Axx/TvNLHfXdJ6GRX4N/gyjBUR18AMrGC3fIjptbgO4D2GCaW5DP0VNf7kDG7pRlnl6uCQ68JeFlU
	blU8c8wMZHX0+hu2k5Ny5YGGks+e3+YrGumTKYI3dYOApJ8/hdqcEXMsfw28NtGUT15YhbZHUEUBP
	uXMO0v2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZ6k-00Fx04-0D;
	Wed, 11 Oct 2023 13:18:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZ6g-00FwyZ-3D;
	Wed, 11 Oct 2023 13:18:36 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 473286607313;
	Wed, 11 Oct 2023 14:18:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697030309;
	bh=PAWJ3RzsuekP+W3e6be5gu5BDgIjN+40d2Z1bOG28aM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPvcE8vDi5SergJ5DzBmpack84PQy7dQDKtxEd2SCcfL77jG4RrgQOdH1sygHooze
	 vciWjN7skA2MOP3cAIZKTPh46lXKu288QpmuJ3TKB+YsufBrgGF4QeU70mzYOMqHRL
	 Lt000mqJG+scMo3dNKbLNJcUTVQmijMAKIARXR0hmzudkHPaAHhoLMjVswHMiKIttu
	 EsM6yUdDfQoBzi+hDz7mmW4zGmHugfAvvaOHPzQpTk16jeaWhKMvYnu8QrkolTaHx2
	 UV1CWymdfAaHSnWsNSIYupvQUpAeQlGqeaqudirzDcKapgJgtqZe4z4qzSFkWnvVZQ
	 sgJ3ciG5ImaAQ==
Date: Wed, 11 Oct 2023 09:18:23 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org, kernel@collabora.com, ehristev@collabora.com
Subject: Re: [PATCH v10 07/16] drm/mediatek: aal: Use bitfield macros
Message-ID: <4fbfc898-b13c-4cf0-9a2a-308e37838dd8@notapiano>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
 <20230804072850.89365-8-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804072850.89365-8-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_061835_254488_B9F2C770 
X-CRM114-Status: UNSURE (   6.89  )
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

On Fri, Aug 04, 2023 at 09:28:41AM +0200, AngeloGioacchino Del Regno wrote:
> Make the code more robust and improve readability by using bitfield
> macros instead of open coding bit operations.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

